Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794456984;
	b=yOIvIqj9fnXrwJTV6VKIC41N6S7tHYKOprMqNGWCWVmTgUOKzpg7AFFcr8V9MkfLEEFV
	 nlvJA+xsgN5wasj0txrX72daG7/uzRwWa/y0VZoAXN7BuTbpzIn3NTr0vK5hDRBheyTB8
	 nQCcd4dnMsgcXOccRfSsye0jHUNPoh5f1f9uN/mcjpGoXDlIub2zd/aGSbTWmO6xHfUmM
	 hyGBXbk0Wf9h9RL3sHG3Z2meuL4WdJA7av26aVAtJnCoUorOvJbVfZ5qWTAgBrDd518Ju
	 bpYZlpm44qqPllIbk07qSo7wrvHH1LeJaiecbcTngcNi2lYnZfWo7dkzSY2OFuACnIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794456984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=s2N20RhQr/YOAKPDCSdEAE8oN4tSPCYZQS7opDtl91Q=;
	b=iswJQBLeisha35MQD46lCo+ithBAcsu4g42Hpqi3bE1FFy5PwSyVJxHsLO8oBxS6e69L
	 X6RjFw+3mmtsiKovoCnELi6ImMcn1a+KQh+72d62Q0+av9tW312a81MupHDUSdn+fgVWr
	 nwzYWSpnY9NtwmHpwWorNFc9ArGddxPsiLg/w2FZd2HE3eyuIoAbgdJKtOQ4FCJH/gVmn
	 m8WRjrZLTt10yzW0Q2tklujyTyTaze7tkLLn0LscrNA8kjJWRhEmtFTJHdlM2z/pAGRw2
	 0ukBzSycHiLrPaT32+mDTMj4TwyaBAg8pygFdtjvRhqLaC79plbLm7G3r5XHkq5Dj/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QP67SBAM;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CE1606A33E
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 04:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73CE1606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QP67SBAM
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-170135e43c7so2128589c88.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 20:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794456982; x=1795061782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s2N20RhQr/YOAKPDCSdEAE8oN4tSPCYZQS7opDtl91Q=;
        b=QP67SBAM23zUNaqYoBg6CpDHBt11Ax94dSCWVQ4s3uQUhnR84RGSQHcxARG2kxdPV3
         VQLohyToK4lxcPv8Pwkc3sTkl7lqs0qTzxhez1xm0BT47N39MbehG8GlkJ0JBj6SbSbI
         p50WKCyzoM8OEcHsgyT2cDmCqr8VWF8qjfSbaNV8Z8M5swInQP/57Vsd7DemrR1I1w16
         FbyafcgSnKxRuqOa2eabxEiWjmc8PAuMBgZ1dqo4tTgFs1kHvGBHwoYGPli5H3v0V9Kp
         Sr8zM2TftiZXOPYAmweG7QrcmxqyEtf98tx3IZYfevMrY+k6ASdXdj5fUDOrdh6583on
         aKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794456982; x=1795061782;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s2N20RhQr/YOAKPDCSdEAE8oN4tSPCYZQS7opDtl91Q=;
        b=thKHJ0OKYgEm0oL1oZYOHIXX+kAAe9O8F9ESqL6kLNUZDZxX+s8hKUs696u1Ks16L2
         Hea6JR5FyAoPTAO7I2sT9ScgGZCs09oeOWTPKZNmJ68dDR+CPm5k8qWxNwZOmH3hZrdW
         7myG4h/HLl60hLp65EddRDFkSvpq1zor9U215B33M0mii1sxyXUMJRqigyvBkjJMN/zC
         6wtqj015fs77iwlsTsMXOW4N1KRyFsNSO1MpRyqWeyLZ5rmptT65Cl3q0JRoDwZ5RxmR
         70BIWKZYJGspH+R6M5Ti1XUdkwQb1EsJNzxN5t3ej/mRABm5QIVb0G1RlGJUzt18qM70
         SJjA==
X-Forwarded-Encrypted: i=1; AL+hErGvPI77Yi+OHWcS2CqJgRVij1oDjUXchAfS87npCJoX6ECbvya8B4lg4BgTU2wNXvSmG5WL3+33gEw=@vger.kernel.org
X-Gm-Message-State: APuU4Z91icuuLH/spRm8Gmoc4guEcGHquuv/lJrVvsjyX+MRFBXr+f8I
	mvXAE1y70/fUKQLQdtwFNxifhuYJW5SvrHzx63loAJlPXuKmBM7N/+40
X-Gm-Gg: AYBFou3pABjDll4ETWM7n37ig9j2jwj1Cm7gbuec4wSJOiUfHwTa2mQwnkJm+QpbuCf
	ZTL11WZdM5FGCoyimXfo/aOOdqTmccL32opwf8Z4z+nyjYBbrpZOQV5YQ+X2P9sF5gMV/8mXLsI
	6tGHHLvdnNm6X+KuCCmjKKDpFxwMK2U92a2w2kIgFOVKcMJWEDvdehDNwCP0IUeI/DQ/8STkdyH
	0YZ8O193i2bTdZbhLehJ2JuwWeK+nXT/CP6XFIkjTq1gS2fjIdzTr2eyqFRNt8W9RaVb/zZlqkf
	dYaaEyCg1DPHTnAD6YwAzn4Rt0qC+roOsoMj65PG6Uy0qnOHPz7rb2wGny9uDr9XvbAp+F26hPK
	SGFcP2wVQw9fnZQLWp9HuvKQwjthu8tyiVWquqllJrx1I8hzG6biU1TazXVhGkx4a+E2iTyWkta
	UqKa8BOOceGaZH0h+a48tDoGRv8UOL4tYgl+VbTZx9u1AqXepeNoK+3wwRG+rL7GZhuJN9WyVSt
	AeWN2F9m9FqnuZg/i1Jt+u4CbyebhtGKsNEPvyVPTTUCQEVD+hAapgpgwXh0GnfKbgRUbrYI3a6
	6UzlsnqmOi3Y8MTPBUMlUdKG8ojy5A==
X-Received: by 2002:a05:7022:2204:b0:190:b2de:1549 with SMTP id a92af1059eb24-1b3c023c732mr5532385c88.1.1794456982355;
        Wed, 11 Nov 2026 20:16:22 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21300801c88.1.2026.11.11.20.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:16:19 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v3 2/3] MIPS: Ingenic: Add XBurst SMP support
Date: Wed, 11 Nov 2026 20:14:21 -0800
Message-ID: <20261112041422.2997275-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112041422.2997275-1-f.fainelli@gmail.com>
References: <20261112041422.2997275-1-f.fainelli@gmail.com>
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
Use the CP0 mailboxes for inter-processor interrupts.

XBurst stops its private cache clock when executing WAIT. Write back
the data cache before entering idle so that the other core can access
data belonging to the sleeping core.

Link: https://lkml.iu.edu/hypermail/linux/kernel/2005.2/03488.html
Link: https://lists.openwall.net/linux-kernel/2020/05/13/1482
Link: https://lists.openwall.net/linux-kernel/2020/05/19/1099
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
[florian: forward ported to latest version]
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 MAINTAINERS                           |   3 +-
 arch/mips/Kbuild                      |   1 +
 arch/mips/generic/init.c              |   3 +
 arch/mips/include/asm/ingenic-smp.h   |  20 +++
 arch/mips/ingenic/Kconfig             |   2 +
 arch/mips/ingenic/Makefile            |   5 +
 arch/mips/ingenic/ingenic-smp-entry.S |  54 ++++++
 arch/mips/ingenic/ingenic-smp.c       | 247 ++++++++++++++++++++++++++
 arch/mips/kernel/idle.c               |  26 ++-
 9 files changed, 359 insertions(+), 2 deletions(-)
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
index 000000000000..250a0c89c955
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
+	li	t0, KSEG0
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
+	la	t0, xburst_cpu_entry_sp
+	lw	sp, 0(t0)
+	la	t0, xburst_cpu_entry_gp
+	lw	gp, 0(t0)
+
+	la	t0, smp_bootstrap
+	jr	t0
+	 nop
+END(xburst_secondary_cpu_entry)
diff --git a/arch/mips/ingenic/ingenic-smp.c b/arch/mips/ingenic/ingenic-smp.c
new file mode 100644
index 000000000000..3cdb953c7a87
--- /dev/null
+++ b/arch/mips/ingenic/ingenic-smp.c
@@ -0,0 +1,247 @@
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
+	entry = KSEG1ADDR((unsigned long)xburst_secondary_cpu_entry);
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
+
+	ret = clk_enable(cpu1_clock);
+	if (ret)
+		goto unlock;
+
+	xburst_cpu_entry_sp = __KSTK_TOS(idle);
+	xburst_cpu_entry_gp = (unsigned long)task_thread_info(idle);
+	/* Publish bootstrap state before CPU1 starts using its private cache. */
+	r4k_blast_dcache();
+	/* Complete cache writeback before releasing reset. */
+	mb();
+	write_c0_corectrl(ctrl & ~CORECTRL_SWRST(1));
+	back_to_back_c0_hazard();
+unlock:
+	raw_spin_unlock_irqrestore(&smp_lock, flags);
+	return ret;
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
+static const struct plat_smp_ops xburst_smp_ops = {
+	.send_ipi_single = xburst_send_ipi_single,
+	.send_ipi_mask = xburst_send_ipi_mask,
+	.init_secondary = xburst_init_secondary,
+	.smp_finish = xburst_smp_finish,
+	.boot_secondary = xburst_boot_secondary,
+	.smp_setup = xburst_smp_setup,
+	.prepare_cpus = xburst_prepare_cpus,
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
index 80e8a04a642e..46526997a4c6 100644
--- a/arch/mips/kernel/idle.c
+++ b/arch/mips/kernel/idle.c
@@ -18,6 +18,7 @@
 #include <asm/cpu-type.h>
 #include <asm/idle.h>
 #include <asm/mipsregs.h>
+#include <asm/r4kcache.h>
 
 /*
  * Not all of the MIPS CPUs have the "wait" instruction available. Moreover,
@@ -71,6 +72,23 @@ static void __cpuidle rm7k_wait_irqoff(void)
 		"	.set	pop					\n");
 }
 
+/* XBurst gates its private cache clock in WAIT; write back dirty data first. */
+static void __cpuidle xburst_wait_irqoff(void)
+{
+	unsigned long pending = read_c0_cause() & read_c0_status() & CAUSEF_IP;
+
+	if (!need_resched() && !pending) {
+		r4k_blast_dcache();
+		__asm__ __volatile__(
+			".set push\n"
+			".set mips3\n"
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
@@ -156,10 +174,16 @@ void __init check_wait(void)
 	case CPU_CAVIUM_OCTEON_PLUS:
 	case CPU_CAVIUM_OCTEON2:
 	case CPU_CAVIUM_OCTEON3:
-	case CPU_XBURST:
 	case CPU_LOONGSON32:
 		cpu_wait = r4k_wait;
 		break;
+	case CPU_XBURST:
+		if (IS_ENABLED(CONFIG_MACH_JZ4780) &&
+		    IS_ENABLED(CONFIG_SMP))
+			cpu_wait = xburst_wait_irqoff;
+		else
+			cpu_wait = r4k_wait;
+		break;
 	case CPU_LOONGSON64:
 		if ((c->processor_id & (PRID_IMP_MASK | PRID_REV_MASK)) >=
 				(PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0) ||
-- 
2.53.0

