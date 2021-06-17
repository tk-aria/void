/**
 * @file main.cpp
 * @author tk-aria
 * @brief
 * @version 0.1
 * @date 2021-06-17
 *
 * @copyright Copyright (c) 2021
 *
 */
#include <stdio.h>
#include <stdlib.h>

#include "void/common.h"

#include "helloworld.h"

int main(int argc, char** argv)
{
    printf("[echo]: %s %s", echo_helloworld(), VOID_NEWLINE);
    return 0;
}
