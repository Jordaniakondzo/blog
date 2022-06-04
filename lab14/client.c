#include "common.h"

#define MESSAGE "Hello Server!!!\n"

int main()
{
int writefd; /* дескриптор для записи в FIFO */
int msglen;

 for(int i=0; i<5; i++)
   {
     sleep(3);
 /* баннер */
printf("FIFO Client...\n");

 /* получим доступ к FIFO */
if((writefd = open(FIFO_NAME, O_WRONLY)) < 0)
  {
    fprintf(stderr, "%s: Невозможно открыть FIFO (%s)\n",
         __FILE__, strerror(errno));
    exit(-1);
  }

 /* передадим сообщение серверу */
msglen = strlen(MESSAGE);
if(write(writefd, MESSAGE, msglen) != msglen)
{
fprintf(stderr, "%s: Ошибка записи в FIFO (%s)\n",
__FILE__, strerror(errno));
exit(-2);
 }
close(writefd);
 }
  /* закроем доступ к FIFO */
 exit(0);
}
