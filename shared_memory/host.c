#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/fcntl.h>
#include <sys/stat.h>

#define SHM_FILE "test"

int main(int argc, char *argv[]) {
  struct stat stat;
  char *ptr;
  int fd = shm_open(SHM_FILE, O_RDWR|O_CREAT, 0666);
  printf("fd=%d\n", fd);
  ftruncate(fd, 1024);
  fstat(fd, &stat);
  ptr = mmap(NULL, stat.st_size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
  close(fd);
  memcpy(ptr, "test", 5);
  gets(argv[1]);
  //printf("wrote %d bytes.\n", result);
  //result = shm_unlink(SHM_FILE);
  //printf("result=%d\n", result);

  return 0;
}
