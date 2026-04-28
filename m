Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419F43D4117
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 12:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777377810; cv=none; b=T24cofkIPQBOmRjWDHxYU7Hcwr8ifjJbgAVlwENvIJdRudIWPeiv11U0y0I2G5h3QeJaw+sFg2VxRM7v64Za9j1BPlkk5VlKUGGriGAwWbC7E9P3ZVbLrNdzFEDVw4mXf3VxPOS8X05r+PbMbnVQ8Mc+oSWEPxCbl/G4lwjAvVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777377810; c=relaxed/simple;
	bh=KunFZ8zNcApdZ4u36dcYduTC42b6yFRrostzXk5dMVA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:Cc; b=Pobr72ODo8Zy8uGI8AthtueXkxKngPLqc1tlwuAqByYrBSadilaCURTDR1XeB589QoNf6elqYpCjuKpgQf4hD044YCAfrRPEYZeWeIGsM0Ok/gZKUV2imuSyGTjvYCtdshe/HpLeuA6pMEDzHbnYgMR5lcw986P9o1wWJ4172js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=b/tyGUHo; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="b/tyGUHo"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B39CEC5EF07
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 12:04:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1DDB7601D0
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 12:03:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7072A10728A4F;
	Tue, 28 Apr 2026 14:03:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777377797; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=eXhYew3u2JristAfz4V5swT/OM70M55yAfJXV1QK8vA=;
	b=b/tyGUHo18e+tpnHTgdj6uL9/65X0Xb/Fa+gZaN3ZArCECf3a4d42f6IxmGZiR7kk8MZZg
	Ms6J+Nf6knTFqet62OqpxzDegoxWTRIZ8P5sUS/Rm61CbE0rAX2J6dR0yv9veUOnRCLD0k
	7JFIgQEArrwWaV6NS42tC/lA29nGmA5/v90viiDIjP/0oi9NTK+DtjDQ1rG2RAWsgmbd90
	UcboZMKyVbFuDq99I3+lKytHQKwWVvNtypM6DaCI52xVtCSkvB/m/KWwsw9uC0frpKHrUm
	FD+gPawE6EyuIwWKSZQAYfhl+NENkO9QDgej9jv1xVFAmiZit5wPxju9YkIs1A==
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 14:03:16 +0200
Message-Id: <DI4RUFQNSSNP.2QMSSQWJW9I2O@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <linux-clk@vger.kernel.org>
Subject: Issue with Clock Parent Assignment on AM335x SoC (Watchdog Timer)
Cc: =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
X-Last-TLS-Session-Version: TLSv1.3

Hi,

I believe I=E2=80=99ve identified an issue with clock management on the AM3=
35x
SoC and possibly other TI SoC. It can be seen while using the SoC
watchdog timer, but I suspect other clocks or modules might be impacted.

While I partially understand the issue, I struggle to find a correct
solution. I will describe my findings below.

First, here is a quick way to reproduce it.
- Hardware: Beagle Bone Black.
- Linux kernel version: v7.1-rc1 (or anything after 5.19).
- Configuration: omap2plus_defconfig + CONFIG_OMAP_WATCHDOG=3Dy
- In the bootloader, I select the 32KHz clock derived from the 24MHz one
  as the watchdog clock source. This is controlled by bit 1 of
  CLKSEL_WDT1_CLK.
  This is probably the point that differs from most use cases, and why
  it hasn't been observed before. On my final setup, I do not control
  the bootloader and so cannot change this value.
  In u-boot, this is: mw.l 0x44e00538 1
- Once the kernel is booted, I open the watchdog device node. I'm using
  busybox "watchdog" command, but a simple "cat" will trigger the same
  error.
  watchdog /dev/watchdog0
- This will result in the bus clock failing to be enabled and a failure
  to access the watchdog module:
  [   11.677752] l4-wkup-clkctrl:00d4:0: failed to enable
  [   11.686079] Unhandled fault: external abort on non-linefetch (0x1028) =
at 0xf9e35034
  I'm attaching the full trace at the very end of my email.

So, I tried to dig a bit into this issue and the reason why the
l4-wkup-clkctrl:00d4:0 clock can't be enabled.

The parent clock of l4-wkup-clkctrl:00d4:0 is wdt1_fck, and the "struct
clk_core" [1] representing this wdt1_fck looks incorrect:
- The "parents" list of all possible sources is set correctly. It
  contains pointers on both "clk_rc32k_ck" and "clk_24mhz_clkctrl"
  structures.
- The "parent" pointer is NULL, while it should point onto the
  "clk_24mhz_clkctrl" clk_core structure.

I believe this is because the value fails to be initialized correctly
during boot. This should be set in clk_core_set_parent_nolock() [2], but
fails as the call to clk_fetch_parent_index() [3] is failing.

The reason it fails is easy to explain:
- The clk_fetch_parent_index() function is used to find which entry in
  core->parents[] corresponds to the clock we try to assign as a parent.
- The name of the desired parent, as set in the "struct clk_core" is set
  to "clk-24mhz-clkctrl:0000:0".
- The expected name of the clock, as specified in core->parents[1]
  "struct clk_parent_map" is just "clk_24mhz_clkctrl".
- As a consequence, the name comparison [4] fails, and the clock choice
  is deemed invalid.

Now, where does these names come from? I believe it's partly from the
device tree, partly from drivers/clk/ti/clkctrl.c and
drivers/clk/ti/clk.c. I tried to play a bit with this code, but I'm a
bit lost with the logic here.

Yet, I confirm I can get a working configuration with this horrible
hack:
--- c/drivers/clk/clk.c
+++ w/drivers/clk/clk.c
@@ -2026,6 +2026,11 @@ static int clk_fetch_parent_index(struct clk_core *c=
ore,
                if (core->parents[i].name &&
                    !strcmp(parent->name, core->parents[i].name))
                        break;
+               if (core->parents[i].name &&
+                   !strcmp("clk_24mhz_clkctrl", core->parents[i].name) &&
+                   !strcmp("clk-24mhz-clkctrl:0000:0", parent->name)) {
+                       break;
+               }
        }

I can trace the issue back to commit ec7aa25fa483 [5] introduced in
v5.19. Yet today, reverting this commit is not sufficient, as I believe
the code did evolve significantly.

Does anyone have suggestions for fixing this issue? If any part of my
analysis seems incorrect, please let me know.

[1]: https://elixir.bootlin.com/linux/v7.0.1/source/drivers/clk/clk.c#L66
[2]: https://elixir.bootlin.com/linux/v7.0.1/source/drivers/clk/clk.c#L2883
[3]: https://elixir.bootlin.com/linux/v7.0.1/source/drivers/clk/clk.c#L2004
[4]: https://elixir.bootlin.com/linux/v7.0.1/source/drivers/clk/clk.c#L2035
[5]: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/commit/?id=3Dec7aa25fa483

Thanks,
Mathieu

The full log follows.

-------------- >8 -------------
# watchdog /dev/watchdog0
[   11.677752] l4-wkup-clkctrl:00d4:0: failed to enable
[   11.682999] 8<--- cut here ---
[   11.686079] Unhandled fault: external abort on non-linefetch (0x1028) at=
 0xf9e35034
[   11.693778] [f9e35034] *pgd=3D44e11452(bad)
[   11.697834] Internal error: : 1028 [#1] SMP ARM
[   11.702394] Modules linked in:
[   11.705474] CPU: 0 UID: 0 PID: 130 Comm: watchdog Not tainted 7.1.0-rc1-=
00001-g700d54ce1b97-dirty #2 VOLUNTARY=20
[   11.715619] Hardware name: Generic AM33XX (Flattened Device Tree)
[   11.721742] PC is at omap_wdt_disable+0x14/0xb8
[   11.726327] LR is at omap_wdt_start+0x34/0xf8
[   11.730714] pc : [<c0944e08>]    lr : [<c0945068>]    psr: 600f0013
[   11.737010] sp : e0305d58  ip : f9e35048  fp : c1aaea80
[   11.742260] r10: c216b220  r9 : c1ec9ba0  r8 : c1f60c00
[   11.747509] r7 : b7cab00b  r6 : c1ec9bbc  r5 : f9e35000  r4 : c1ec9b40
[   11.754068] r3 : f9e35034  r2 : 00000000  r1 : 600f0013  r0 : f9e35000
[   11.760627] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment=
 none
[   11.767800] Control: 10c5387d  Table: 82e68019  DAC: 00000051
[   11.773573] Register r0 information: 0-page vmalloc region starting at 0=
xf9c00000 allocated at iotable_init+0x0/0xc0
[   11.784171] Register r1 information: non-paged memory
[   11.789254] Register r2 information: NULL pointer
[   11.793986] Register r3 information: 0-page vmalloc region starting at 0=
xf9c00000 allocated at iotable_init+0x0/0xc0
[   11.804570] Register r4 information: slab kmalloc-256 start c1ec9b00 poi=
nter offset 64 size 256
[   11.813342] Register r5 information: 0-page vmalloc region starting at 0=
xf9c00000 allocated at iotable_init+0x0/0xc0
[   11.823927] Register r6 information: slab kmalloc-256 start c1ec9b00 poi=
nter offset 188 size 256
[   11.832781] Register r7 information: non-paged memory
[   11.837861] Register r8 information: slab kmalloc-1k start c1f60c00 poin=
ter offset 0 size 1024
[   11.846539] Register r9 information: slab kmalloc-256 start c1ec9b00 poi=
nter offset 160 size 256
[   11.855391] Register r10 information: slab dentry start c216b220 pointer=
 offset 0 size 136
[   11.863721] Register r11 information: slab filp start c1aaea80 pointer o=
ffset 0 size 128
[   11.871876] Register r12 information: 0-page vmalloc region starting at =
0xf9c00000 allocated at iotable_init+0x0/0xc0
[   11.882548] Process watchdog (pid: 130, stack limit =3D 0x(ptrval))
[   11.888674] Stack: (0xe0305d58 to 0xe0306000)
[   11.893055] 5d40:                                                       =
c1ec9b40 c1e44930
[   11.901275] 5d60: 00000002 c0943de8 0f900000 00000000 c18a5000 c1f60df0 =
c1ba7580 c1f60c00
[   11.909496] 5d80: c1e44930 c1aaea80 c1ec9b40 c1f60eac 00000000 c0943f4c =
c1f60df0 c1e44930
[   11.917715] 5da0: c0d90324 00000000 c1aaea80 c0370ba8 00000000 73a085ae =
e0305e78 c1aaea80
[   11.925935] 5dc0: 00000000 c1e44930 c0370ab8 c1aaeaa8 e0305e78 c0365070 =
c1aaea80 c1286208
[   11.934154] 5de0: c1aaeaa8 00000000 e0305f30 c0366ba4 e0305f30 c037986c =
e0305f30 c037a844
[   11.942374] 5e00: 00020001 c1286208 00000000 c0380710 e0305e68 b6e56000 =
b6fb7fff c1bc880c
[   11.950594] 5e20: 00000000 00000101 00000000 00000000 00000000 82e4a831 =
c2e79880 00100cca
[   11.958814] 5e40: 00000150 b6fa6000 b6fa6000 73a085ae c2e6adb8 c195bc00 =
e0305f30 ffffff9c
[   11.967034] 5e60: 00000001 c01002ec c1fe1500 00000142 005a6874 c0381170 =
c18f6f10 c216b220
[   11.975253] 5e80: 4a3c55ab 00000009 c195bc11 00000000 00000000 c21a2b28 =
c1e44930 00010001
[   11.983472] 5ea0: 00000000 00000000 00000000 00000098 00000002 00000000 =
00000000 00000000
[   11.991692] 5ec0: e0305ec4 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[   11.999911] 5ee0: 00000000 00000000 00000000 00000000 00000000 c195bc00 =
c195bc0c 00000000
[   12.008131] 5f00: 00000002 ffffff9c 00000000 000041ed e0305f60 73a085ae =
ffffff9c 00000003
[   12.016351] 5f20: e0305f60 c195bc00 ffffff9c c0367010 00020001 00000000 =
00000002 00010000
[   12.024571] 5f40: 00000001 73a085ae bed20ab4 ffffff9c bed20f58 005a79bc =
00000142 c03673e8
[   12.032790] 5f60: 00020001 00000000 00000000 00000000 00000000 00000000 =
00020001 00000000
[   12.041009] 5f80: 00000000 00000000 00000000 00000000 bed20b38 73a085ae =
bed20be4 00000000
[   12.049229] 5fa0: 00000000 c0100080 00000000 00000000 ffffff9c bed20f58 =
00020001 00000000
[   12.057449] 5fc0: 00000000 00000000 005a79bc 00000142 004dfc60 b6ffccf8 =
00000000 005a6874
[   12.065668] 5fe0: 00020001 bed20c28 00000001 b6ed2458 200f0010 ffffff9c =
00000000 00000000
[   12.073883] Call trace:=20
[   12.073895]  omap_wdt_disable from omap_wdt_start+0x34/0xf8
[   12.082052]  omap_wdt_start from watchdog_start+0x8c/0x184
[   12.087579]  watchdog_start from watchdog_open+0x6c/0xf0
[   12.092930]  watchdog_open from chrdev_open+0xf0/0x220
[   12.098113]  chrdev_open from do_dentry_open+0x120/0x4f8
[   12.103465]  do_dentry_open from vfs_open+0x24/0xe4
[   12.108378]  vfs_open from path_openat+0x828/0x1224
[   12.113293]  path_openat from do_file_open+0x64/0xd8
[   12.118290]  do_file_open from do_sys_openat2+0x80/0xe8
[   12.123550]  do_sys_openat2 from sys_openat+0x7c/0xd0
[   12.128637]  sys_openat from ret_fast_syscall+0x0/0x58
[   12.133810] Exception stack(0xe0305fa8 to 0xe0305ff0)
[   12.138891] 5fa0:                   00000000 00000000 ffffff9c bed20f58 =
00020001 00000000
[   12.147111] 5fc0: 00000000 00000000 005a79bc 00000142 004dfc60 b6ffccf8 =
00000000 005a6874
[   12.155329] 5fe0: 00020001 bed20c28 00000001 b6ed2458
[   12.160412] Code: e59f30a4 e280c048 e58c3000 e2803034 (e5902034)=20
[   12.166540] ---[ end trace 0000000000000000 ]---
[   12.171183] note: watchdog[130] exited with irqs disabled
[   13.282448] omap_prm 44e00d00.prm: sync_state() pending due to 44d00000.=
cpu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
