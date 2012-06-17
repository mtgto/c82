#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/fcntl.h>

#define SHM_FILE "test"

int main(int argc, char *argv[]) {
  int fd = shm_open(SHM_FILE, O_RDWR|O_CREAT, 0666);
  printf("fd=%d\n", fd);
  int result = write(fd, "test", 5);
  printf("wrote %d bytes.\n", result);
  result = shm_unlink(SHM_FILE);
  printf("result=%d\n", result);

  return 0;
}
