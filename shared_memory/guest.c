#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/fcntl.h>
#include <sys/stat.h>

#define SHM_FILE "SHM"

int main(int argc, char *argv[]) {
  struct stat stat;
  char *ptr;
  int fd = shm_open(SHM_FILE, O_RDONLY, 0666);
  printf("fd=%d\n", fd);
  ftruncate(fd, 1024);
  fstat(fd, &stat);
  ptr = mmap(NULL, stat.st_size, PROT_READ, MAP_SHARED, fd, 0);
  close(fd);
  printf("mem=%s\n", ptr);

  return 0;
}
