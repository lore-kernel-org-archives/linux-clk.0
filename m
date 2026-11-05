Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910772;
	b=mSnAFO3HdYEvQ1qN1sMlxeyPe2BunzNTwecXbYadmFvy2UjaV/wxbgsya7Mi1UJ6uHax
	 5EV79pKMhkXIpPGx9FZHDQb4o9R0or9gBAUm2fOA0DnoHkLkK0LQyxVNlzx7JKjyGc2iQ
	 iKwaHvRO/W4GGn73LQJjJmPCinabWmsflITlmtCH37d8nqiNB31+AXtKLA/dlDz/zybqn
	 BW/LswCN/Jr3F59Egp3B6NWHajuhy95lZcST5nSPc7N4OnCAEsxEvC5YJluilqjaiXESc
	 VbmlBJy7agNU9XzVEODkbXsxzau+65FxD/pi/yD5zpnSEhyrJvgXIgu1S+VT+567okQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pwHv7j8WH4SZiEYyDecu2DOgroMNbximESmrWm4Ok+o=;
	b=PKQxDOreOrmMpAGgPro7eDujvpIT4SrFonHEPzZbPDf2LuabMcnqjkqn7DN8A/wWteT2
	 Ty+F+dX7UuMYQA3ftjyNjJcL5ZuAdaEmR9n8Jz0G9GFnn56wMglCKiqkAzivwCDJVYftm
	 uK+jE0ZTMz8bLrbv2s+qiUtouEk7hA7OlJu8umj32WEvWPLzOKOcw8jT7qQPA6632B5H8
	 zPuKB9fbV31vZ5hCw3t//VE6n300n+6QvIIRjfY+YHjBAvL+cnds9bnpnkigrwXtgHTZx
	 KmKg8DVfraaU5bm0+2Mgw3aTOjvsZz9QXcf1aizZ61W7FKLQZSAvsqqW+xOcNCUCFKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SSPGPBzb;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B039606D811
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 20:32:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B039606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SSPGPBzb
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33fb4680717so105094eec.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 12:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793910770; x=1794515570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pwHv7j8WH4SZiEYyDecu2DOgroMNbximESmrWm4Ok+o=;
        b=SSPGPBzbsAfd9ORIz65p/c3qY8Tkd/6LQgJbKIvt2ZmkZRFFbJACjG7pGzg8xkZhKK
         hmaeA2rm48mIT6kUp4k+zklBVMnoUZ6K2RDSMeVZbeGK0nAaKHWffkz1J9QX723spWNq
         dxFTHCEqMXlCXKwoL6ZPSzlZhyH78VjVC1pDOQq+Y23aD31JrkO1wYEG/EVu9283txg3
         IC9cDpQ8O3pcaqL/9ndz+dXKePTzRVrBPz8Y8ay2MJj2Xsm7kOKF4YvALxcNurJC2DHo
         ZLrrSinTAPtq+XeVoK+m1BfHMRyqpLIIXwidd08n9cyqLt/BAvasRmHYfKc5tunHpJ/Z
         3YZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910770; x=1794515570;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwHv7j8WH4SZiEYyDecu2DOgroMNbximESmrWm4Ok+o=;
        b=q+Q+516nk6NQs6ntkW5Lz7dMDdnKruFIGHnkPbq0oquhK5CKuIP3Vaq8kFdZUFCcLV
         3b3RlMqoZHiiQ0Awr/+7yK9VX9CRGYRbOY3fKKig/RcJA34NxHS01gxVABK12ijlqFMi
         ZVvNwaweMlbRdIa8lR1B3FM3Z0PWJwePq7qN9V9RIalZ0ou3BabzmEWe5gngBrTy7FKC
         /OJDdb4XI+hksUqSpHn2FKZGI26b9UPSi5YVG5GfkfCbn9J1eftkpWpfQkjYmYAXy02I
         N1zlzc8qsPv712D84CNziX4UjGU+SAt5n5xPQdi6oyCKOMzV5UXMP8U3MccVjSnzN4MK
         yALg==
X-Forwarded-Encrypted: i=1; AKwUvBwQXfSpzX/qXiqyixJ6zx+bXk86MABwgp07Bm+IWt9V9qb8SAE/S8UdgH9SLtG/AlDnqno7AdJyjxA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FAM8b+NkABsefJdA1XCvXlklWIt5XC6sfPEja0AQAcX4HUkB0
	3yzBqAeqLYklmBX9K9tjnnzbG+vOVBURUksmXPk+CZRQhvlhQwEsdmzC
X-Gm-Gg: AYBFou3a+w8acfhE47fKzyhsDk0idqUS5W4yeX7gfEMcDyOUb2IH27j9iOVr7BAtBJW
	YWMRaflyozmrqNRZF0mA7aepqZnfSgn8TZFyoxbXMA06C3JXgHw8c5gwI0Dxa91vXGBlEbp5wBB
	XJVXZa8PXgpImofKK6gWVXx2kcApm9roHV2FEH/8642vqPuFaxsj7TmmAADyMtSu+r/z2EwgkfB
	kkFf9MOMOZtmFufLDr03dkrtfym++Wp70HvNps2fObLtpqKBc6CIZKo4IT/3ooJBCbjHSkdulFk
	RNXRFLvUlrlP4JSA6yk11dhWRdMFm1/YL4N6Wwnb/oM/4ckp3a2Y80Ml77Ml1yDigsnomFCsnCG
	lniRtml/OL2TeMs48/ZlC147UOl1GRu+2/maWnvthZ9BQSmkzC1+qIZVY8M4JOtql47XhjLvu3M
	VgYenCpXhBHkgY+pI9Dc1MQ7qi/iOUSl+z9SX/thE8kiAH/+ZoIFose884+HKO4qZggT/OmNI8B
	xbbAXZUODeimZ6E5VVSii0MeNQ21LSgbX86p4AYHmSSitlmRNkvXuXzW9S2nTLOhZH22SISTq4/
	NeVduKHGmaNYh0aC3fMoYkCq1lWq/A==
X-Received: by 2002:a05:693c:87c7:10b0:36f:26a7:968e with SMTP id 5a478bee46e88-36f770062cfmr326800eec.40.1793910770112;
        Thu, 05 Nov 2026 12:32:50 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72dc30ebsm632458eec.13.2026.11.05.12.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:32:49 -0800 (PST)
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
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Paul Boddie <paul@boddie.org.uk>
Subject: [PATCH 2/3] MIPS: Ingenic: Add JZ4780 SMP support to the generic platform
Date: Thu,  5 Nov 2026 12:32:41 -0800
Message-ID: <20261105203243.2292647-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105203243.2292647-1-f.fainelli@gmail.com>
References: <20261105203243.2292647-1-f.fainelli@gmail.com>
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

Port the JZ4780 reset-entry and CP0 mailbox implementation from Zhou
Yanjie's 2020 v8 series, based on Paul Burton's original CI20 SMP code.
The old arch/mips/jz4740 platform has moved into the generic MIPS code,
so register the Ingenic SMP operations after unflattening the device
tree and before selecting the generic fallback implementations.

Reuse the upstream CPU clock gates, CPU device-tree nodes and per-CPU
TCU timers. Enumerate only available CPU nodes within the two-core
hardware limit. Prepare the CPU1 clock before boot, propagate clock
failures, serialize mailbox accesses with a raw spinlock and publish
bootstrap state before releasing the secondary core from reset. Align
the secondary reset entry to the REIM register's 64 KiB granularity.
Retain the UP fallback for other SoCs in a shared Ingenic kernel.

Write back the private data cache before WAIT, since XBurst gates its
clock during idle and another core must not access dirty data in that
sleeping cache. Return with interrupts disabled as required by the
current idle API. Existing per-CPU TCU events make the old forced
broadcast-timer workaround unnecessary.

This adaptation incorporates the CPU-enumeration review feedback and
removes the old unused CPU mask. Preserve the original source credits;
historical Tested-by and Reviewed-by tags are not carried to this
substantially changed port. Adaptation and validation used Codex
assistance.

Link: https://lkml.iu.edu/hypermail/linux/kernel/2005.2/03488.html
Link: https://lists.openwall.net/linux-kernel/2020/05/13/1482
Link: https://lists.openwall.net/linux-kernel/2020/05/19/1099
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
[florian: forward ported to latest version]
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 MAINTAINERS                           |   1 +
 arch/mips/generic/Makefile            |   1 +
 arch/mips/generic/ingenic-smp-entry.S |  54 ++++++
 arch/mips/generic/ingenic-smp.c       | 240 ++++++++++++++++++++++++++
 arch/mips/generic/ingenic-smp.h       |  20 +++
 arch/mips/generic/init.c              |   4 +
 arch/mips/ingenic/Kconfig             |   6 +
 arch/mips/kernel/idle.c               |  25 ++-
 8 files changed, 350 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/generic/ingenic-smp-entry.S
 create mode 100644 arch/mips/generic/ingenic-smp.c
 create mode 100644 arch/mips/generic/ingenic-smp.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 09713dc4c6a7..101027579ccd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13117,6 +13117,7 @@ L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	arch/mips/boot/dts/ingenic/
 F:	arch/mips/generic/board-ingenic.c
+F:	arch/mips/generic/ingenic-smp*
 F:	arch/mips/include/asm/mach-ingenic/
 F:	arch/mips/ingenic/Kconfig
 F:	drivers/clk/ingenic/
diff --git a/arch/mips/generic/Makefile b/arch/mips/generic/Makefile
index ea0e4ad5e600..df92650c0f15 100644
--- a/arch/mips/generic/Makefile
+++ b/arch/mips/generic/Makefile
@@ -12,5 +12,6 @@ obj-$(CONFIG_YAMON_DT_SHIM)		+= yamon-dt.o
 obj-$(CONFIG_LEGACY_BOARD_SEAD3)	+= board-sead3.o
 obj-$(CONFIG_LEGACY_BOARD_OCELOT)	+= board-ocelot.o
 obj-$(CONFIG_MACH_INGENIC)			+= board-ingenic.o
+obj-$(CONFIG_MIPS_INGENIC_SMP)	+= ingenic-smp.o ingenic-smp-entry.o
 obj-$(CONFIG_VIRT_BOARD_RANCHU)		+= board-ranchu.o
 obj-$(CONFIG_MACH_REALTEK_RTL)		+= board-realtek.o
diff --git a/arch/mips/generic/ingenic-smp-entry.S b/arch/mips/generic/ingenic-smp-entry.S
new file mode 100644
index 000000000000..828df4687e84
--- /dev/null
+++ b/arch/mips/generic/ingenic-smp-entry.S
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2013 Paul Burton <paul.burton@imgtec.com>
+ * JZ4780 secondary CPU reset entry
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
+LEAF(jz4780_secondary_cpu_entry)
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
+	la	t0, jz4780_cpu_entry_sp
+	lw	sp, 0(t0)
+	la	t0, jz4780_cpu_entry_gp
+	lw	gp, 0(t0)
+
+	la	t0, smp_bootstrap
+	jr	t0
+	 nop
+END(jz4780_secondary_cpu_entry)
diff --git a/arch/mips/generic/ingenic-smp.c b/arch/mips/generic/ingenic-smp.c
new file mode 100644
index 000000000000..98c1fd7483db
--- /dev/null
+++ b/arch/mips/generic/ingenic-smp.c
@@ -0,0 +1,240 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * JZ4780 SMP support, based on Paul Burton's CI20 implementation and
+ * Zhou Yanjie's 2020 JZ4780 SMP series.
+ * Copyright (C) 2013 Paul Burton <paul.burton@imgtec.com>
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
+#include "ingenic-smp.h"
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
+#define JZ4780_NR_CPUS		2
+#define JZ4780_MBOX_IRQ		(MIPS_CPU_IRQ_BASE + 3)
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
+unsigned long jz4780_cpu_entry_sp;
+unsigned long jz4780_cpu_entry_gp;
+
+static irqreturn_t jz4780_mbox_interrupt(int irq, void *dev_id)
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
+static void __init jz4780_smp_setup(void)
+{
+	struct device_node *np;
+	u32 entry, reim;
+	u64 hwid;
+
+	for_each_of_cpu_node(np) {
+		hwid = of_get_cpu_hwid(np, 0);
+		if (hwid >= nr_cpu_ids || hwid >= JZ4780_NR_CPUS ||
+		    !of_device_is_available(np))
+			continue;
+		__cpu_number_map[hwid] = hwid;
+		__cpu_logical_map[hwid] = hwid;
+		set_cpu_possible(hwid, true);
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
+	entry = KSEG1ADDR((unsigned long)jz4780_secondary_cpu_entry);
+	write_c0_reim((reim & ~REIM_ENTRY) | (entry & REIM_ENTRY));
+}
+
+static void __init jz4780_prepare_cpus(unsigned int max_cpus)
+{
+	struct device_node *np;
+	u32 reim;
+	int ret;
+
+	ret = request_irq(JZ4780_MBOX_IRQ, jz4780_mbox_interrupt,
+			  IRQF_PERCPU | IRQF_NO_THREAD, "core mailbox", NULL);
+	if (ret)
+		panic("JZ4780: cannot request mailbox IRQ: %d", ret);
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
+		pr_err("JZ4780: cannot get CPU1 clock: %ld\n",
+		       PTR_ERR(cpu1_clock));
+		return;
+	}
+
+	ret = clk_prepare(cpu1_clock);
+	if (ret) {
+		clk_put(cpu1_clock);
+		cpu1_clock = ERR_PTR(ret);
+		pr_err("JZ4780: cannot prepare CPU1 clock: %d\n", ret);
+	}
+}
+
+static int jz4780_boot_secondary(int cpu, struct task_struct *idle)
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
+	jz4780_cpu_entry_sp = __KSTK_TOS(idle);
+	jz4780_cpu_entry_gp = (unsigned long)task_thread_info(idle);
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
+static void jz4780_init_secondary(void)
+{
+	clear_c0_status(ST0_IM);
+	irq_disable_hazard();
+}
+
+static void jz4780_smp_finish(void)
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
+static void jz4780_send_ipi_locked(int cpu, unsigned int action)
+{
+	if (cpu_logical_map(cpu) == 0)
+		write_c0_mailbox0(read_c0_mailbox0() | action);
+	else
+		write_c0_mailbox1(read_c0_mailbox1() | action);
+	back_to_back_c0_hazard();
+}
+
+static void jz4780_send_ipi_single(int cpu, unsigned int action)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&smp_lock, flags);
+	jz4780_send_ipi_locked(cpu, action);
+	raw_spin_unlock_irqrestore(&smp_lock, flags);
+}
+
+static void jz4780_send_ipi_mask(const struct cpumask *mask, unsigned int action)
+{
+	unsigned long flags;
+	int cpu;
+
+	raw_spin_lock_irqsave(&smp_lock, flags);
+	for_each_cpu(cpu, mask)
+		jz4780_send_ipi_locked(cpu, action);
+	raw_spin_unlock_irqrestore(&smp_lock, flags);
+}
+
+static const struct plat_smp_ops jz4780_smp_ops = {
+	.send_ipi_single = jz4780_send_ipi_single,
+	.send_ipi_mask = jz4780_send_ipi_mask,
+	.init_secondary = jz4780_init_secondary,
+	.smp_finish = jz4780_smp_finish,
+	.boot_secondary = jz4780_boot_secondary,
+	.smp_setup = jz4780_smp_setup,
+	.prepare_cpus = jz4780_prepare_cpus,
+};
+
+int __init register_ingenic_smp_ops(void)
+{
+	if (!of_machine_is_compatible("ingenic,jz4780"))
+		return -ENODEV;
+
+	register_smp_ops(&jz4780_smp_ops);
+	return 0;
+}
diff --git a/arch/mips/generic/ingenic-smp.h b/arch/mips/generic/ingenic-smp.h
new file mode 100644
index 000000000000..54191be8731a
--- /dev/null
+++ b/arch/mips/generic/ingenic-smp.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* Copyright (C) 2013 Paul Burton <paul.burton@imgtec.com> */
+#ifndef __MIPS_GENERIC_INGENIC_SMP_H__
+#define __MIPS_GENERIC_INGENIC_SMP_H__
+
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/kconfig.h>
+
+#ifdef CONFIG_MIPS_INGENIC_SMP
+int __init register_ingenic_smp_ops(void);
+void jz4780_secondary_cpu_entry(void);
+#else
+static inline int register_ingenic_smp_ops(void)
+{
+	return -ENODEV;
+}
+#endif
+
+#endif /* __MIPS_GENERIC_INGENIC_SMP_H__ */
diff --git a/arch/mips/generic/init.c b/arch/mips/generic/init.c
index 1d712eac1617..00149bd1e9a9 100644
--- a/arch/mips/generic/init.c
+++ b/arch/mips/generic/init.c
@@ -20,6 +20,8 @@
 #include <asm/smp-ops.h>
 #include <asm/time.h>
 
+#include "ingenic-smp.h"
+
 static __initconst const void *fdt;
 static __initconst const struct mips_machine *mach;
 static __initconst const void *mach_match_data;
@@ -113,6 +115,8 @@ void __init device_tree_init(void)
 	unflatten_and_copy_device_tree();
 	mips_cpc_probe();
 
+	if (!register_ingenic_smp_ops())
+		return;
 	if (!register_cps_smp_ops())
 		return;
 	if (!register_vsmp_smp_ops())
diff --git a/arch/mips/ingenic/Kconfig b/arch/mips/ingenic/Kconfig
index f595b339a4b8..1dfd0bfd0193 100644
--- a/arch/mips/ingenic/Kconfig
+++ b/arch/mips/ingenic/Kconfig
@@ -64,6 +64,12 @@ config MACH_JZ4780
 	select MIPS_CPU_SCACHE
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_SUPPORTS_HIGHMEM
+	select SYS_SUPPORTS_SMP
+
+config MIPS_INGENIC_SMP
+	def_bool y
+	depends on MACH_JZ4780 && SMP
+	select SMP_UP
 
 config MACH_X1000
 	bool
diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
index 80e8a04a642e..6cabdd4825a7 100644
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
+static void __cpuidle ingenic_smp_wait_irqoff(void)
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
@@ -156,10 +174,15 @@ void __init check_wait(void)
 	case CPU_CAVIUM_OCTEON_PLUS:
 	case CPU_CAVIUM_OCTEON2:
 	case CPU_CAVIUM_OCTEON3:
-	case CPU_XBURST:
 	case CPU_LOONGSON32:
 		cpu_wait = r4k_wait;
 		break;
+	case CPU_XBURST:
+		if (IS_ENABLED(CONFIG_MIPS_INGENIC_SMP))
+			cpu_wait = ingenic_smp_wait_irqoff;
+		else
+			cpu_wait = r4k_wait;
+		break;
 	case CPU_LOONGSON64:
 		if ((c->processor_id & (PRID_IMP_MASK | PRID_REV_MASK)) >=
 				(PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0) ||
-- 
2.53.0

