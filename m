Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596927;
	b=uJjbYRP0nfS6uEw142SJdagx8C6M1vCbz+Nez3BBChP1ECE9xv9JxZo6oSg2rjzwXle8
	 lr96TSiuKe0ZWVSbWzzjf0XN4KHfM4CAWC2X6dTbLWOco7nvwI40clSVxlcXgD766ew2O
	 +iZGEIsvUhwzzvzyjuV0uWduR/TD7t2NXNTuovx3Eg9t8A2cJ0e+2uQ3GymKE8YWWKNN5
	 mSmBZ2ULIifJHaZPbE39I/Dy2YEsphDKlGkJTifTBBxBbzS+MDFPCq7+HzUz4Au05QQQu
	 kQFX5AsqYWbigO0qjqvHoJd/j9aP01FTP/4oDH8RAjfx7TG+cVTP2r7MvBKGwVrjo4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=c0w8ym9dVBx8r6AZommsxwC9NFIKL+0h9j16jCIUXuY=;
	b=yyYiqX2dUorULGQ6ioyr2HoyYAkYYL17cmgGAav9+V0p6fcEobDaN6vGVX6rpIM35mdj
	 j8TCW5rpe9aDQ04U+M996ENt2UdigXVCYTTEgaZKQALVCyK3Qg6pS9GQmTJAXn7Azjw8v
	 /uQo7lvRZDTV6DmL6HYbyA2GLv6GbGn7owc4OdtARm0re4oVjTlu/gTbvi2LzaoVwAjAR
	 cvWFkKmhNQj+Bag72Pwrl24t4pUcEeIQSrZlX1HABvdwADz2HUZNHRzvQoANrAlRW253x
	 j+4N0apUibqx0I0GDnoo6Cu8tXbwP7z3lmY/SHZUlcbABI4VBI7Z2DcnYjR5yI8lJ2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wklv5tXj;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8355060A380E
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 19:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8355060A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wklv5tXj
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3712b6d9843so1264068eec.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 11:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596926; x=1795201726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c0w8ym9dVBx8r6AZommsxwC9NFIKL+0h9j16jCIUXuY=;
        b=Wklv5tXjL1vD9cEb9kQXcz2PkH2zNIKn/qKXEdArmNcP0Gv5J/P9Lx/IZddRmvnu4g
         1wMMVmAgjYf4JSE4nQa+fnEDllak3PiCUqj4MzffjNRbHIv9T0ts+PpdmQqjw2rc9Z/S
         zPhWuKcxoQNESEkdve+iqgRKFdUcRYN1q8v769bawzf+AhB4Y3S9aZMVult1O/HGY4Qz
         jlMpeNFpR5Lqjbt63wZ5P2SZR4gxt8yaua26KYFboTU0JjR2LmhlnZ6omE4gAwhJdAGY
         Ykd+Qg1Dq6nTeEavuN7euciKPA/2JoDRl4D47uYo4bPykMFUGZo17GzBHFoCcjCEbQMz
         2bmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596926; x=1795201726;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0w8ym9dVBx8r6AZommsxwC9NFIKL+0h9j16jCIUXuY=;
        b=SiS9x72cbk23+29aNREoWdjAOUwZ1Uu+V7s76P9LpBRk1XT94BvuLtQUI+R/PMgJBj
         jCROyclk0BcsfslsUKIbFLZcYoK+Y3SmHHBS04SbVjWbNtzNatT9l2+bjD94gc57+pVV
         dNp2nK4Tf/cofgfiz6IeSXZ/GLx0VPH+VjElBGMHTRsUgHwsJVkfdFOxJ/zzO8ufCnOP
         U9ioKnoj/kUp8pSHWgT1pzWnia3QbvcIqy3gjXGiRNq800bwBYJbwg8LePmO7PBWO3rS
         LA0lWx6N6BYb2/RJSC7I8D5/QQ+UZrrrQ2gR+uH5avpnr2XXdI8Y1URCqUhZXA4HByiX
         7tzg==
X-Forwarded-Encrypted: i=1; AL+hErHo0bYjSNHHtYr2aVLHdUa/QNyYqfgF6Yh+pl87R+9h4UGP/jiPYOZK8OR5+U2THzFAOAFFTRBT8u0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kyQVVnDXAjDqPWBlOIbvBg0dVB1XtA8pQHtUnJIDUm69XN/9W
	EjfCR1yUkNdpVcu+X+9rsiae4Mvr1yw93UShoePkKEPcUGPimI8Hp0zKMFrbIA==
X-Gm-Gg: AYBFou3R17khZwPSWynJKs1p2XB2YXKKAg/8OtK+zQ9iGBFqFgCcGINULY3UogNkN+v
	sCtB7jF4wtOGdXDjpcjs+ImsLcWqdlY5ptG9Az2XXE1aI/+fQS9MZ6YscupvLprUQT40753atC5
	bacGmWElL1lqUCXObJri9OKU6YlrCO/dnS2HUTF2f1DAOcwZcFUh5WGqGtqFaiMcNdeSUHRAlyj
	9lQSRw0Hn00AZTAa8FImI/9EKuFvUwWlnYB+YMXnt+U2w3MZzjFTFHIi5++O8/85ckZQ1u4KH0N
	uo+e+FAJPymFsalokvB8H4PHYRBhOiVHBgGMZdo14Ult9uU7DhOqwRk/AZKX/ukKWR7V7TohviD
	yDqumK08tus3ySHRKVWeZOjrVExrIPuWndIN+qrgXxcg8Taxt5za30S/PSxpNIGV/kVrqyJDzYR
	Ee4zu0Q3NhtR+S4FM8Qyw6/4VcnhIoHrGwCfFJz9zyYnnwNYKZmXXvdR4KVZ9a9Dqx+GxoBWScL
	ZDzRyHguD1jZRqmOr1C5IiSw4NZOXBQaCy4B4dRbmTVP9pF+H75vVxj+VyMJ+oC0XWuE55FI5Yk
	siTzytUx
X-Received: by 2002:a05:7300:b187:b0:37a:7dfc:7d17 with SMTP id 5a478bee46e88-37a7e0bc1c6mr553568eec.13.1794596925469;
        Fri, 13 Nov 2026 11:08:45 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm15714037eec.25.2026.11.13.11.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:08:44 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v6 3/4] MIPS: Ingenic: Add XBurst SMP support
Date: Fri, 13 Nov 2026 11:08:35 -0800
Message-ID: <20261113190836.470937-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113190836.470937-1-f.fainelli@gmail.com>
References: <20261113190836.470937-1-f.fainelli@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Add support for the second XBurst core on the JZ4780, based on Zhou
Yanjie's 2020 series and Paul Burton's original CI20 SMP implementation.
Use the CP0 mailboxes for inter-processor interrupts. Initialize CPU
presence and core IDs explicitly for generic kernels, and reject CPU
offlining until CPU teardown and restart are implemented.

XBurst stops its private cache clock when executing WAIT. Write back
the data cache before entering idle so that the other core can access
data belonging to the sleeping core. Select this wait handler only when
multiple CPUs are possible, and check pending work after the cache flush.

Enable the secondary clock outside the raw SMP lock. Use the CKSEG
aliases and pointer-sized assembly helpers for generic 64-bit builds.
Development and build/CI20 boot validation used Codex assistance; Sashiko
AI review identified the locking, topology and generic-kernel issues.

Link: https://lkml.iu.edu/hypermail/linux/kernel/2005.2/03488.html
Link: https://lists.openwall.net/linux-kernel/2020/05/13/1482
Link: https://lists.openwall.net/linux-kernel/2020/05/19/1099
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
[florian: forward ported to latest version]
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
No changes in v6

Changes since previous posting:
- Move the generic IPI initialization guard into a separate prerequisite.
- Remove Paul Cercueil's Reviewed-by and Tested-by tags after the changes.
- Remove the CONFIG_HOTPLUG_CPU guard around xburst_cpu_disable() and mark
  it __maybe_unused. Retain the initializer guard because plat_smp_ops has
  no cpu_disable member when hotplug is disabled; PTR_IF() cannot fix that.
- Document the intentional work recheck after the data-cache flush: the
  first need_resched() avoids an unnecessary flush, and the second checks
  for work arriving during it.

Earlier changes since v3:
- Enable CPU1's clock outside the raw SMP lock.
- Initialize CPU presence and core IDs; reject unsupported CPU offlining.
- Use CKSEG aliases and pointer/long assembly helpers for 64-bit builds.
- Restrict the XBurst idle handler to systems with multiple possible CPUs
  and check pending work after the cache flush.

Validation:
- Affected objects build for CI20 without CPU hotplug and generic Ingenic
  32-bit and 64-bit configurations with CPU hotplug.
- The previous tree booted on CI20 with both CPUs online and successful
  workers pinned to each CPU. All 11 functional boot-smoke checks passed;
  the kernel-log check failed on DRM bridge/refcount warnings.
- This revision changes no runtime behavior and has not been rebooted.

Development and validation used Codex assistance. Sashiko AI review
identified the issues addressed by the changes since v3.

 MAINTAINERS                           |   3 +-
 arch/mips/Kbuild                      |   1 +
 arch/mips/generic/init.c              |   3 +
 arch/mips/include/asm/ingenic-smp.h   |  20 ++
 arch/mips/ingenic/Kconfig             |   2 +
 arch/mips/ingenic/Makefile            |   5 +
 arch/mips/ingenic/ingenic-smp-entry.S |  54 ++++++
 arch/mips/ingenic/ingenic-smp.c       | 260 ++++++++++++++++++++++++++
 arch/mips/kernel/idle.c               |  31 ++-
 9 files changed, 377 insertions(+), 2 deletions(-)
 create mode 100644 arch/mips/include/asm/ingenic-smp.h
 create mode 100644 arch/mips/ingenic/Makefile
 create mode 100644 arch/mips/ingenic/ingenic-smp-entry.S
 create mode 100644 arch/mips/ingenic/ingenic-smp.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..7128df320bab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13150,8 +13150,9 @@ L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	arch/mips/boot/dts/ingenic/
 F:	arch/mips/generic/board-ingenic.c
+F:	arch/mips/include/asm/ingenic-smp.h
 F:	arch/mips/include/asm/mach-ingenic/
-F:	arch/mips/ingenic/Kconfig
+F:	arch/mips/ingenic/
 F:	drivers/clk/ingenic/
 F:	drivers/dma/dma-jz4780.c
 F:	drivers/gpu/drm/ingenic/
diff --git a/arch/mips/Kbuild b/arch/mips/Kbuild
index e901bf554483..4912ab80d143 100644
--- a/arch/mips/Kbuild
+++ b/arch/mips/Kbuild
@@ -12,6 +12,7 @@ obj- := $(platform-y)
 # The object files are linked as core-y files would be linked
 
 obj-y += generic/
+obj-$(CONFIG_MACH_INGENIC) += ingenic/
 obj-y += kernel/
 obj-y += mm/
 obj-y += net/
diff --git a/arch/mips/generic/init.c b/arch/mips/generic/init.c
index 1d712eac1617..38f294887c17 100644
--- a/arch/mips/generic/init.c
+++ b/arch/mips/generic/init.c
@@ -13,6 +13,7 @@
 
 #include <asm/bootinfo.h>
 #include <asm/fw/fw.h>
+#include <asm/ingenic-smp.h>
 #include <asm/irq_cpu.h>
 #include <asm/machine.h>
 #include <asm/mips-cps.h>
@@ -113,6 +114,8 @@ void __init device_tree_init(void)
 	unflatten_and_copy_device_tree();
 	mips_cpc_probe();
 
+	if (!register_ingenic_smp_ops())
+		return;
 	if (!register_cps_smp_ops())
 		return;
 	if (!register_vsmp_smp_ops())
diff --git a/arch/mips/include/asm/ingenic-smp.h b/arch/mips/include/asm/ingenic-smp.h
new file mode 100644
index 000000000000..ea81c333820d
--- /dev/null
+++ b/arch/mips/include/asm/ingenic-smp.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* Copyright (C) 2013 Paul Burton <paulburton@kernel.org> */
+#ifndef __ASM_INGENIC_SMP_H__
+#define __ASM_INGENIC_SMP_H__
+
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/kconfig.h>
+
+#if defined(CONFIG_MACH_JZ4780) && defined(CONFIG_SMP)
+int __init register_ingenic_smp_ops(void);
+void xburst_secondary_cpu_entry(void);
+#else
+static inline int register_ingenic_smp_ops(void)
+{
+	return -ENODEV;
+}
+#endif
+
+#endif /* __ASM_INGENIC_SMP_H__ */
diff --git a/arch/mips/ingenic/Kconfig b/arch/mips/ingenic/Kconfig
index f595b339a4b8..583f8d3651df 100644
--- a/arch/mips/ingenic/Kconfig
+++ b/arch/mips/ingenic/Kconfig
@@ -64,6 +64,8 @@ config MACH_JZ4780
 	select MIPS_CPU_SCACHE
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_SUPPORTS_HIGHMEM
+	select SYS_SUPPORTS_SMP
+	select SMP_UP if SMP
 
 config MACH_X1000
 	bool
diff --git a/arch/mips/ingenic/Makefile b/arch/mips/ingenic/Makefile
new file mode 100644
index 000000000000..fc3b1bf1f25a
--- /dev/null
+++ b/arch/mips/ingenic/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+ifdef CONFIG_SMP
+obj-$(CONFIG_MACH_JZ4780) += ingenic-smp.o ingenic-smp-entry.o
+endif
diff --git a/arch/mips/ingenic/ingenic-smp-entry.S b/arch/mips/ingenic/ingenic-smp-entry.S
new file mode 100644
index 000000000000..290e23c65707
--- /dev/null
+++ b/arch/mips/ingenic/ingenic-smp-entry.S
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2013 Paul Burton <paulburton@kernel.org>
+ * XBurst secondary CPU reset entry
+ */
+
+#include <asm/addrspace.h>
+#include <asm/asm.h>
+#include <asm/asmmacro.h>
+#include <asm/cacheops.h>
+#include <asm/mipsregs.h>
+
+#define CACHE_SIZE	(32 * 1024)
+#define CACHE_LINESIZE	32
+
+	/* The CP0 REIM register only stores the upper 16 address bits. */
+	.section .text.smp-entry, "ax"
+	.balign 0x10000
+	.set noreorder
+LEAF(xburst_secondary_cpu_entry)
+	mtc0	zero, CP0_CAUSE
+	li	t0, ST0_CU0
+	mtc0	t0, CP0_STATUS
+	ehb
+
+	/* Invalidate both private caches before entering cached code. */
+	PTR_LI	t0, CKSEG0
+	ori	t1, t0, CACHE_SIZE
+	mtc0	zero, CP0_TAGLO
+	ehb
+1:	cache	Index_Store_Tag_I, 0(t0)
+	cache	Index_Store_Tag_D, 0(t0)
+	addiu	t0, t0, CACHE_LINESIZE
+	bne	t0, t1, 1b
+	 nop
+
+	mfc0	t0, CP0_CONFIG
+	li	t1, ~CONF_CM_CMASK
+	and	t0, t0, t1
+	ori	t0, t0, CONF_CM_CACHABLE_NONCOHERENT
+	mtc0	t0, CP0_CONFIG
+	mtc0	zero, CP0_PAGEMASK
+	ehb
+
+	/* CPU0 publishes these in RAM before releasing CPU1 from reset. */
+	PTR_LA	t0, xburst_cpu_entry_sp
+	LONG_L	sp, 0(t0)
+	PTR_LA	t0, xburst_cpu_entry_gp
+	LONG_L	gp, 0(t0)
+
+	PTR_LA	t0, smp_bootstrap
+	jr	t0
+	 nop
+END(xburst_secondary_cpu_entry)
diff --git a/arch/mips/ingenic/ingenic-smp.c b/arch/mips/ingenic/ingenic-smp.c
new file mode 100644
index 000000000000..27b9b573a7e0
--- /dev/null
+++ b/arch/mips/ingenic/ingenic-smp.c
@@ -0,0 +1,260 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * XBurst SMP support, based on Paul Burton's CI20 implementation and
+ * Zhou Yanjie's 2020 JZ4780 SMP series.
+ * Copyright (C) 2013 Paul Burton <paulburton@kernel.org>
+ */
+
+#include <linux/clk.h>
+#include <linux/cpu.h>
+#include <linux/interrupt.h>
+#include <linux/of.h>
+#include <linux/of_clk.h>
+#include <linux/sched/task_stack.h>
+#include <linux/smp.h>
+
+#include <asm/addrspace.h>
+#include <asm/irq_cpu.h>
+#include <asm/mipsregs.h>
+#include <asm/r4kcache.h>
+#include <asm/smp-ops.h>
+
+#include <asm/ingenic-smp.h>
+
+#define read_c0_corectrl()	__read_32bit_c0_register($12, 2)
+#define write_c0_corectrl(val)	__write_32bit_c0_register($12, 2, val)
+#define read_c0_corestatus()	__read_32bit_c0_register($12, 3)
+#define write_c0_corestatus(val)	__write_32bit_c0_register($12, 3, val)
+#define read_c0_reim()		__read_32bit_c0_register($12, 4)
+#define write_c0_reim(val)	__write_32bit_c0_register($12, 4, val)
+#define read_c0_mailbox0()	__read_32bit_c0_register($20, 0)
+#define write_c0_mailbox0(val)	__write_32bit_c0_register($20, 0, val)
+#define read_c0_mailbox1()	__read_32bit_c0_register($20, 1)
+#define write_c0_mailbox1(val)	__write_32bit_c0_register($20, 1, val)
+
+#define XBURST_MBOX_IRQ		(MIPS_CPU_IRQ_BASE + 3)
+#define CORECTRL_SWRST(cpu)	BIT(cpu)
+#define CORECTRL_RPC(cpu)	BIT(8 + (cpu))
+#define CORESTATUS_MIRQ(cpu)	BIT(cpu)
+#define REIM_ENTRY		GENMASK(31, 16)
+#define REIM_MBOXIRQ(cpu)	BIT(cpu)
+
+static struct clk *cpu1_clock;
+static DEFINE_RAW_SPINLOCK(smp_lock);
+
+/* Referenced by the uncached secondary CPU reset entry. */
+unsigned long xburst_cpu_entry_sp;
+unsigned long xburst_cpu_entry_gp;
+
+static irqreturn_t xburst_mbox_interrupt(int irq, void *dev_id)
+{
+	unsigned int cpu = cpu_logical_map(smp_processor_id());
+	u32 action, status;
+
+	raw_spin_lock(&smp_lock);
+	if (cpu == 0) {
+		action = read_c0_mailbox0();
+		write_c0_mailbox0(0);
+	} else {
+		action = read_c0_mailbox1();
+		write_c0_mailbox1(0);
+	}
+
+	status = read_c0_corestatus();
+	write_c0_corestatus(status & ~CORESTATUS_MIRQ(cpu));
+	irq_disable_hazard();
+	raw_spin_unlock(&smp_lock);
+
+	if (action & SMP_RESCHEDULE_YOURSELF)
+		scheduler_ipi();
+	if (action & SMP_CALL_FUNCTION)
+		generic_smp_call_function_interrupt();
+
+	return IRQ_HANDLED;
+}
+
+static void __init xburst_smp_setup(void)
+{
+	struct device_node *np;
+	u32 entry, reim;
+	unsigned int cpu = 0;
+	u64 hwid;
+
+	for_each_of_cpu_node(np) {
+		hwid = of_get_cpu_hwid(np, 0);
+		if (!of_device_is_available(np) ||
+		    hwid >= ARRAY_SIZE(__cpu_number_map))
+			continue;
+		if (cpu >= nr_cpu_ids) {
+			of_node_put(np);
+			break;
+		}
+		__cpu_number_map[hwid] = cpu;
+		__cpu_logical_map[cpu] = hwid;
+		set_cpu_possible(cpu, true);
+		set_cpu_present(cpu, true);
+		cpu_set_core(&cpu_data[cpu], hwid);
+		cpu++;
+	}
+
+	/* Program the shared reset vector with mailbox delivery masked. */
+	reim = read_c0_reim();
+	reim &= ~(REIM_MBOXIRQ(0) | REIM_MBOXIRQ(1));
+	write_c0_reim(reim);
+	write_c0_mailbox0(0);
+	write_c0_mailbox1(0);
+	write_c0_corestatus(0);
+
+	entry = CKSEG1ADDR((unsigned long)xburst_secondary_cpu_entry);
+	write_c0_reim((reim & ~REIM_ENTRY) | (entry & REIM_ENTRY));
+}
+
+static void __init xburst_prepare_cpus(unsigned int max_cpus)
+{
+	struct device_node *np;
+	u32 reim;
+	int ret;
+
+	ret = request_irq(XBURST_MBOX_IRQ, xburst_mbox_interrupt,
+			  IRQF_PERCPU | IRQF_NO_THREAD, "core mailbox", NULL);
+	if (ret) {
+		pr_err("XBurst: cannot request mailbox IRQ: %d\n", ret);
+		return;
+	}
+
+	reim = read_c0_reim();
+	write_c0_reim(reim | REIM_MBOXIRQ(0));
+	set_c0_status(STATUSF_IP3);
+	irq_enable_hazard();
+
+	if (!cpu_possible(1))
+		return;
+
+	np = of_get_cpu_node(1, NULL);
+	cpu1_clock = of_clk_get(np, 0);
+	of_node_put(np);
+	if (IS_ERR(cpu1_clock)) {
+		pr_err("XBurst: cannot get CPU1 clock: %ld\n",
+		       PTR_ERR(cpu1_clock));
+		return;
+	}
+
+	ret = clk_prepare(cpu1_clock);
+	if (ret) {
+		clk_put(cpu1_clock);
+		cpu1_clock = ERR_PTR(ret);
+		pr_err("XBurst: cannot prepare CPU1 clock: %d\n", ret);
+	}
+}
+
+static int xburst_boot_secondary(int cpu, struct task_struct *idle)
+{
+	unsigned long flags;
+	u32 ctrl;
+	int ret;
+
+	if (cpu_logical_map(cpu) != 1 || IS_ERR_OR_NULL(cpu1_clock))
+		return -ENODEV;
+
+	raw_spin_lock_irqsave(&smp_lock, flags);
+	ctrl = read_c0_corectrl() | CORECTRL_SWRST(1) | CORECTRL_RPC(1);
+	write_c0_corectrl(ctrl);
+	back_to_back_c0_hazard();
+	raw_spin_unlock_irqrestore(&smp_lock, flags);
+
+	ret = clk_enable(cpu1_clock);
+	if (ret)
+		return ret;
+
+	xburst_cpu_entry_sp = __KSTK_TOS(idle);
+	xburst_cpu_entry_gp = (unsigned long)task_thread_info(idle);
+	/* Publish bootstrap state before CPU1 starts using its private cache. */
+	r4k_blast_dcache();
+	/* Complete cache writeback before releasing reset. */
+	mb();
+	raw_spin_lock_irqsave(&smp_lock, flags);
+	ctrl = read_c0_corectrl();
+	write_c0_corectrl(ctrl & ~CORECTRL_SWRST(1));
+	back_to_back_c0_hazard();
+	raw_spin_unlock_irqrestore(&smp_lock, flags);
+	return 0;
+}
+
+static void xburst_init_secondary(void)
+{
+	clear_c0_status(ST0_IM);
+	irq_disable_hazard();
+}
+
+static void xburst_smp_finish(void)
+{
+	unsigned int cpu = cpu_logical_map(smp_processor_id());
+	u32 reim;
+
+	raw_spin_lock(&smp_lock);
+	reim = read_c0_reim();
+	write_c0_reim(reim | REIM_MBOXIRQ(cpu));
+	raw_spin_unlock(&smp_lock);
+
+	change_c0_status(ST0_IM, STATUSF_IP3 | STATUSF_IP2 |
+			 STATUSF_IP1 | STATUSF_IP0);
+	irq_enable_hazard();
+	local_irq_enable();
+}
+
+static void xburst_send_ipi_locked(int cpu, unsigned int action)
+{
+	if (cpu_logical_map(cpu) == 0)
+		write_c0_mailbox0(read_c0_mailbox0() | action);
+	else
+		write_c0_mailbox1(read_c0_mailbox1() | action);
+	back_to_back_c0_hazard();
+}
+
+static void xburst_send_ipi_single(int cpu, unsigned int action)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&smp_lock, flags);
+	xburst_send_ipi_locked(cpu, action);
+	raw_spin_unlock_irqrestore(&smp_lock, flags);
+}
+
+static void xburst_send_ipi_mask(const struct cpumask *mask, unsigned int action)
+{
+	unsigned long flags;
+	int cpu;
+
+	raw_spin_lock_irqsave(&smp_lock, flags);
+	for_each_cpu(cpu, mask)
+		xburst_send_ipi_locked(cpu, action);
+	raw_spin_unlock_irqrestore(&smp_lock, flags);
+}
+
+static int __maybe_unused xburst_cpu_disable(void)
+{
+	/* CPU teardown and restart are not supported yet. */
+	return -EOPNOTSUPP;
+}
+
+static const struct plat_smp_ops xburst_smp_ops = {
+	.send_ipi_single = xburst_send_ipi_single,
+	.send_ipi_mask = xburst_send_ipi_mask,
+	.init_secondary = xburst_init_secondary,
+	.smp_finish = xburst_smp_finish,
+	.boot_secondary = xburst_boot_secondary,
+	.smp_setup = xburst_smp_setup,
+	.prepare_cpus = xburst_prepare_cpus,
+#ifdef CONFIG_HOTPLUG_CPU
+	.cpu_disable = xburst_cpu_disable,
+#endif
+};
+
+int __init register_ingenic_smp_ops(void)
+{
+	if (!of_machine_is_compatible("ingenic,jz4780"))
+		return -ENODEV;
+
+	register_smp_ops(&xburst_smp_ops);
+	return 0;
+}
diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
index 80e8a04a642e..6c44715d81d5 100644
--- a/arch/mips/kernel/idle.c
+++ b/arch/mips/kernel/idle.c
@@ -18,6 +18,7 @@
 #include <asm/cpu-type.h>
 #include <asm/idle.h>
 #include <asm/mipsregs.h>
+#include <asm/r4kcache.h>
 
 /*
  * Not all of the MIPS CPUs have the "wait" instruction available. Moreover,
@@ -71,6 +72,28 @@ static void __cpuidle rm7k_wait_irqoff(void)
 		"	.set	pop					\n");
 }
 
+/* XBurst gates its private cache clock in WAIT; write back dirty data first. */
+static void __cpuidle xburst_wait_irqoff(void)
+{
+	unsigned long pending;
+
+	if (need_resched())
+		return;
+
+	r4k_blast_dcache();
+	/* Recheck work that may have arrived during the cache flush. */
+	pending = read_c0_cause() & read_c0_status() & CAUSEF_IP;
+	if (!need_resched() && !pending) {
+		__asm__ __volatile__(
+			".set push\n"
+			".set arch=r4000\n"
+			"sync\n"
+			"wait\n"
+			".set pop\n"
+			: : : "memory");
+	}
+}
+
 /*
  * Au1 'wait' is only useful when the 32kHz counter is used as timer,
  * since coreclock (and the cp0 counter) stops upon executing it. Only an
@@ -156,10 +179,16 @@ void __init check_wait(void)
 	case CPU_CAVIUM_OCTEON_PLUS:
 	case CPU_CAVIUM_OCTEON2:
 	case CPU_CAVIUM_OCTEON3:
-	case CPU_XBURST:
 	case CPU_LOONGSON32:
 		cpu_wait = r4k_wait;
 		break;
+	case CPU_XBURST:
+		if (IS_ENABLED(CONFIG_MACH_JZ4780) &&
+		    IS_ENABLED(CONFIG_SMP) && num_possible_cpus() > 1)
+			cpu_wait = xburst_wait_irqoff;
+		else
+			cpu_wait = r4k_wait;
+		break;
 	case CPU_LOONGSON64:
 		if ((c->processor_id & (PRID_IMP_MASK | PRID_REV_MASK)) >=
 				(PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0) ||
