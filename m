Return-Path: <dinguyen@kernel.org>
Cc: vz@mleia.com, mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>, yamada.masahiro@socionext.com
From: Dinh Nguyen <dinguyen@kernel.org>
Subject: commit 5146e0b05963 is causing a kernel crash on SoCFPGA
To: sboyd@codeaurora.org
Message-ID: <56B9507B.9000201@kernel.org>
Date: Mon, 8 Feb 2016 20:35:39 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

It appears that commit 5146e0b05966 "clk: simplify __clk_init_parent()"
that is currently in linux-next is causing the following kernel crash on
SoCFGPA[1].

I have bisected to this commit and doing a revert of the commit fixes
the issue.

Dinh

[1]
Linux version 4.5.0-rc2-next-20160208 (dinguyen@linux-builds1) (gcc
version 4.7.3 20130226 (prerelease) (crosstool-NG
linaro-1.13.1-4.7-2013.03-20130313 - Linaro GCC 2013.03) ) #15 SMP Mon
Feb 8 16:45:49 CST 2016
CPU: ARMv7 Processor [413fc090] revision 0 (ARMv7), cr=10c5387d
CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
Machine model: Altera SOCFPGA Cyclone V SoC Development Kit
Truncating RAM at 0x00000000-0x40000000 to -0x30000000
Consider using a HIGHMEM enabled kernel.
Memory policy: Data cache writealloc
On node 0 totalpages: 196608
free_area_init_node: node 0, pgdat c06b2180, node_mem_map ef9fb000
  Normal zone: 1536 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 196608 pages, LIFO batch:31
PERCPU: Embedded 13 pages/cpu @ef9ce000 s21888 r8192 d23168 u53248
pcpu-alloc: s21888 r8192 d23168 u53248 alloc=13*4096
pcpu-alloc: [0] 0 [0] 1
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 195072
Kernel command line: root=/dev/nfs rw
nfsroot=137.57.160.210:/home/dinguyen/rootfs_yocto ip=dhcp
PID hash table entries: 4096 (order: 2, 16384 bytes)
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
Memory: 772276K/786432K available (4851K kernel code, 283K rwdata, 1368K
rodata, 336K init, 134K bss, 14156K reserved, 0K cma-reserved)
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
    vmalloc : 0xf0800000 - 0xff800000   ( 240 MB)
    lowmem  : 0xc0000000 - 0xf0000000   ( 768 MB)
    modules : 0xbf000000 - 0xc0000000   (  16 MB)
      .text : 0xc0008000 - 0xc061b12c   (6221 kB)
      .init : 0xc061c000 - 0xc0670000   ( 336 kB)
      .data : 0xc0670000 - 0xc06b6d34   ( 284 kB)
       .bss : 0xc06b6d34 - 0xc06d87f4   ( 135 kB)
SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
Hierarchical RCU implementation.
    Build-time adjustment of leaf fanout to 32.
NR_IRQS:16 nr_irqs:16 16
L2C-310 enabling early BRESP for Cortex-A9
L2C-310 full line of zeros enabled for Cortex-A9
L2C-310 ID prefetch enabled, offset 1 lines
L2C-310 dynamic clock gating enabled, standby mode enabled
L2C-310 cache controller enabled, 8 ways, 512 kB
L2C-310: CACHE_ID 0x410030c9, AUX_CTRL 0x76060001
------------[ cut here ]------------
WARNING: CPU: 0 PID: 0 at kernel/time/clockevents.c:44
cev_delta2ns+0x130/0x14c()
Modules linked in:
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.5.0-rc2-02373-g023bbb2 #15
Hardware name: Altera SOCFPGA
[<c0016698>] (unwind_backtrace) from [<c0012d6c>] (show_stack+0x10/0x14)
[<c0012d6c>] (show_stack) from [<c0262470>] (dump_stack+0x74/0x90)
[<c0262470>] (dump_stack) from [<c0022fa8>] (warn_slowpath_common+0x78/0xb4)
[<c0022fa8>] (warn_slowpath_common) from [<c0023000>]
(warn_slowpath_null+0x1c/0x24)
[<c0023000>] (warn_slowpath_null) from [<c007f654>]
(cev_delta2ns+0x130/0x14c)
[<c007f654>] (cev_delta2ns) from [<c0361480>]
(dw_apb_clockevent_init+0x7c/0x170)
[<c0361480>] (dw_apb_clockevent_init) from [<c0644908>]
(dw_apb_timer_init+0x70/0x158)
[<c0644908>] (dw_apb_timer_init) from [<c064472c>]
(clocksource_probe+0x48/0x8c)
[<c064472c>] (clocksource_probe) from [<c061cb20>]
(start_kernel+0x260/0x384)
[<c061cb20>] (start_kernel) from [<0000807c>] (0x807c)
---[ end trace cb88537fdc8fa200 ]---
Division by zero in kernel.
CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W
4.5.0-rc2-02373-g023bbb2 #15
Hardware name: Altera SOCFPGA
[<c0016698>] (unwind_backtrace) from [<c0012d6c>] (show_stack+0x10/0x14)
[<c0012d6c>] (show_stack) from [<c0262470>] (dump_stack+0x74/0x90)
[<c0262470>] (dump_stack) from [<c02604c8>] (Ldiv0_64+0x8/0x18)
[<c02604c8>] (Ldiv0_64) from [<c007d128>] (clocks_calc_max_nsecs+0x24/0x78)
[<c007d128>] (clocks_calc_max_nsecs) from [<c007d31c>]
(__clocksource_update_freq_scale+0x1a0/0x2c0)
[<c007d31c>] (__clocksource_update_freq_scale) from [<c007d448>]
(__clocksource_register_scale+0xc/0x48)
[<c007d448>] (__clocksource_register_scale) from [<c064495c>]
(dw_apb_timer_init+0xc4/0x158)
[<c064495c>] (dw_apb_timer_init) from [<c064472c>]
(clocksource_probe+0x48/0x8c)
[<c064472c>] (clocksource_probe) from [<c061cb20>]
(start_kernel+0x260/0x384)
[<c061cb20>] (start_kernel) from [<0000807c>] (0x807c)
clocksource: timer1: mask: 0xffffffff max_cycles: 0x0, max_idle_ns: 0 ns
Division by zero in kernel.
CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W
4.5.0-rc2-02373-g023bbb2 #15
Hardware name: Altera SOCFPGA
[<c0016698>] (unwind_backtrace) from [<c0012d6c>] (show_stack+0x10/0x14)
[<c0012d6c>] (show_stack) from [<c0262470>] (dump_stack+0x74/0x90)
[<c0262470>] (dump_stack) from [<c02604c8>] (Ldiv0_64+0x8/0x18)
[<c02604c8>] (Ldiv0_64) from [<c007d06c>]
(clocks_calc_mult_shift+0x11c/0x124)
[<c007d06c>] (clocks_calc_mult_shift) from [<c06287bc>]
(sched_clock_register+0x5c/0x1f0)
[<c06287bc>] (sched_clock_register) from [<c06449a8>]
(dw_apb_timer_init+0x110/0x158)
[<c06449a8>] (dw_apb_timer_init) from [<c064472c>]
(clocksource_probe+0x48/0x8c)
[<c064472c>] (clocksource_probe) from [<c061cb20>]
(start_kernel+0x260/0x384)
[<c061cb20>] (start_kernel) from [<0000807c>] (0x807c)
Division by zero in kernel.
CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W
4.5.0-rc2-02373-g023bbb2 #15
Hardware name: Altera SOCFPGA
[<c0016698>] (unwind_backtrace) from [<c0012d6c>] (show_stack+0x10/0x14)
[<c0012d6c>] (show_stack) from [<c0262470>] (dump_stack+0x74/0x90)
[<c0262470>] (dump_stack) from [<c02604c8>] (Ldiv0_64+0x8/0x18)
[<c02604c8>] (Ldiv0_64) from [<c007d128>] (clocks_calc_max_nsecs+0x24/0x78)
[<c007d128>] (clocks_calc_max_nsecs) from [<c062880c>]
(sched_clock_register+0xac/0x1f0)
[<c062880c>] (sched_clock_register) from [<c06449a8>]
(dw_apb_timer_init+0x110/0x158)
[<c06449a8>] (dw_apb_timer_init) from [<c064472c>]
(clocksource_probe+0x48/0x8c)
[<c064472c>] (clocksource_probe) from [<c061cb20>]
(start_kernel+0x260/0x384)
[<c061cb20>] (start_kernel) from [<0000807c>] (0x807c)
sched_clock: 32 bits at 0 Hz, resolution 0ns, wraps every 0ns
Division by zero in kernel.
CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W
4.5.0-rc2-02373-g023bbb2 #15
Hardware name: Altera SOCFPGA
[<c0016698>] (unwind_backtrace) from [<c0012d6c>] (show_stack+0x10/0x14)
[<c0012d6c>] (show_stack) from [<c0262470>] (dump_stack+0x74/0x90)
[<c0262470>] (dump_stack) from [<c02604c8>] (Ldiv0_64+0x8/0x18)
[<c02604c8>] (Ldiv0_64) from [<c007d06c>]
(clocks_calc_mult_shift+0x11c/0x124)
[<c007d06c>] (clocks_calc_mult_shift) from [<c063dee0>]
(register_current_timer_delay+0x2c/0x114)
[<c063dee0>] (register_current_timer_delay) from [<c06449bc>]
(dw_apb_timer_init+0x124/0x158)
[<c06449bc>] (dw_apb_timer_init) from [<c064472c>]
(clocksource_probe+0x48/0x8c)
[<c064472c>] (clocksource_probe) from [<c061cb20>]
(start_kernel+0x260/0x384)
[<c061cb20>] (start_kernel) from [<0000807c>] (0x807c)
