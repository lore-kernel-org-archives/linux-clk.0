Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963271;
	b=i4DOT41RbsbB0hxmEDpJDoOpjaJD9j7+zXWBp2z5aoxA3rsgRT9NZKu9cs3Dp9NXOOFZ
	 DHKU/kGz3Wv2J8y4xxvBByWYBlD2FXfiQr5JhN8q8SiGHlfk2HuqClTivvHr1w4iK1WnG
	 +0HRCSX5FghzR0+W9KsDl/vj+7Ss3qho4kkXNfJD0+UyV4bgNhoM2o/2OkdnRjAfpqqem
	 swLHcAR/CqjRHpEb5xwGyZvbn4RRuTzlp3/kpvs/to6xrcG1KiN+j/JwNv18sSIj1MR3l
	 SsLkVSBVxqMTZA4oZMw1QVjtR3aTiAAWTZjH88aOw1DPzUHh9gmXvEk8qex1DovgI9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963271;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=cDhDtjK2Ge4AwjfNaib9mC7HzkJ8bLWTacKC+M3hv5Y=;
	b=aiyWcHOntwvBrN0j8zeAEsu/iICuhI+M2suCA4zIWyeXdz23hUbebbhBNwOCtlUOiH/w
	 R1Ymf/HnW9AJN1inw/JoB+trYtHH2sCzM04ohN+hAkvNo1H9l82NwcF19yUZVn6TX70+7
	 GllVt+PytIs1gnEJcCu2ajpWYccvJj5vsNXs7hWHEnMFjhMTqtQ3RxDho+LC58j0Islig
	 nsW2Vs+FZ4aLSzJCMZQzBkCPeWgHhflBVjeQKdVgTTXy20ZzrXP0MBHqRIIrC5WsOGe/0
	 jplUbkw/z9cre9jiGr3bsvVcBsY6eV08VJuPGeZe3Gj7C2pzXAAcadUXDc56LwDAvOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07575606A326;
	Fri,  6 Nov 2026 11:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07575606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <55de1cf30758cdc46c38f87520e6570d6e851a9b.camel@crapouillou.net>
Subject: Re: [PATCH 2/3] MIPS: Ingenic: Add JZ4780 SMP support to the
 generic platform
From: Paul Cercueil <paul@crapouillou.net>
To: Florian Fainelli <f.fainelli@gmail.com>, linux-mips@vger.kernel.org
Cc: =?UTF-8?Q?=E5=91=A8=E7=90=B0=E6=9D=B0?= "(Zhou Yanjie)"	
 <zhouyanjie@wanyeetech.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>,  Paul Burton <paulburton@kernel.org>, Stephen
 Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,  Jerome
 Brunet <jbrunet+clk@baylibre.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 open list	 <linux-kernel@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK"
	 <linux-clk@vger.kernel.org>, "H. Nikolaus Schaller" <hns@goldelico.com>, 
 Paul Boddie <paul@boddie.org.uk>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Date: Fri, 06 Nov 2026 12:07:43 +0100
In-Reply-To: <20261105203243.2292647-3-f.fainelli@gmail.com>
References: <20261105203243.2292647-1-f.fainelli@gmail.com>
	 <20261105203243.2292647-3-f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Florian,

Le jeudi 05 novembre 2026 =C3=A0 12:32 -0800, Florian Fainelli a =C3=A9crit=
=C2=A0:
> From: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wanyeetech.co=
m>
>=20
> Port the JZ4780 reset-entry and CP0 mailbox implementation from Zhou
> Yanjie's 2020 v8 series, based on Paul Burton's original CI20 SMP code.
> The old arch/mips/jz4740 platform has moved into the generic MIPS code,
> so register the Ingenic SMP operations after unflattening the device
> tree and before selecting the generic fallback implementations.
>=20
> Reuse the upstream CPU clock gates, CPU device-tree nodes and per-CPU
> TCU timers. Enumerate only available CPU nodes within the two-core
> hardware limit. Prepare the CPU1 clock before boot, propagate clock
> failures, serialize mailbox accesses with a raw spinlock and publish
> bootstrap state before releasing the secondary core from reset. Align
> the secondary reset entry to the REIM register's 64 KiB granularity.
> Retain the UP fallback for other SoCs in a shared Ingenic kernel.
>=20
> Write back the private data cache before WAIT, since XBurst gates its
> clock during idle and another core must not access dirty data in that
> sleeping cache. Return with interrupts disabled as required by the
> current idle API. Existing per-CPU TCU events make the old forced
> broadcast-timer workaround unnecessary.

This reads like a report from AI. Please use your own words, mention what's
worthwhile to mention (e.g. the Xburst-specific wait mechanism) and drop wh=
at's
implementation details.

> This adaptation incorporates the CPU-enumeration review feedback and
> removes the old unused CPU mask. Preserve the original source credits;
> historical Tested-by and Reviewed-by tags are not carried to this
> substantially changed port. Adaptation and validation used Codex
> assistance.
>=20
> Link: https://lkml.iu.edu/hypermail/linux/kernel/2005.2/03488.html
> Link: https://lists.openwall.net/linux-kernel/2020/05/13/1482
> Link: https://lists.openwall.net/linux-kernel/2020/05/19/1099
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>
> [florian: forward ported to latest version]
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0arch/mips/generic/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0arch/mips/generic/ingenic-smp-entry.S |=C2=A0 54 ++++++
> =C2=A0arch/mips/generic/ingenic-smp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 240 ++++++++++++++++++++++++++
> =C2=A0arch/mips/generic/ingenic-smp.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 20 +++
> =C2=A0arch/mips/generic/init.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
> =C2=A0arch/mips/ingenic/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +
> =C2=A0arch/mips/kernel/idle.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 25 ++-
> =C2=A08 files changed, 350 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 arch/mips/generic/ingenic-smp-entry.S
> =C2=A0create mode 100644 arch/mips/generic/ingenic-smp.c
> =C2=A0create mode 100644 arch/mips/generic/ingenic-smp.h

These files really don't belong in arch/mips/generic/. We have a
arch/mips/ingenic/, put them there. You'll have to add a small Makefile the=
re
and list the folder in arch/mips/Kbuild.platforms.

>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 09713dc4c6a7..101027579ccd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13117,6 +13117,7 @@ L:	linux-mips@vger.kernel.org
> =C2=A0S:	Maintained
> =C2=A0F:	arch/mips/boot/dts/ingenic/
> =C2=A0F:	arch/mips/generic/board-ingenic.c
> +F:	arch/mips/generic/ingenic-smp*

That's sneaky. Giving me the maintainership like that.
(I'm OK with it though)

> =C2=A0F:	arch/mips/include/asm/mach-ingenic/
> =C2=A0F:	arch/mips/ingenic/Kconfig
> =C2=A0F:	drivers/clk/ingenic/
> diff --git a/arch/mips/generic/Makefile b/arch/mips/generic/Makefile
> index ea0e4ad5e600..df92650c0f15 100644
> --- a/arch/mips/generic/Makefile
> +++ b/arch/mips/generic/Makefile
> @@ -12,5 +12,6 @@ obj-$(CONFIG_YAMON_DT_SHIM)		+=3D yamon-dt.o
> =C2=A0obj-$(CONFIG_LEGACY_BOARD_SEAD3)	+=3D board-sead3.o
> =C2=A0obj-$(CONFIG_LEGACY_BOARD_OCELOT)	+=3D board-ocelot.o
> =C2=A0obj-$(CONFIG_MACH_INGENIC)			+=3D board-ingenic.o
> +obj-$(CONFIG_MIPS_INGENIC_SMP)	+=3D ingenic-smp.o ingenic-smp-entry.o
> =C2=A0obj-$(CONFIG_VIRT_BOARD_RANCHU)		+=3D board-ranchu.o
> =C2=A0obj-$(CONFIG_MACH_REALTEK_RTL)		+=3D board-realtek.o
> diff --git a/arch/mips/generic/ingenic-smp-entry.S
> b/arch/mips/generic/ingenic-smp-entry.S
> new file mode 100644
> index 000000000000..828df4687e84
> --- /dev/null
> +++ b/arch/mips/generic/ingenic-smp-entry.S
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2013 Paul Burton <paul.burton@imgtec.com>

Use his kernel.org address.

> + * JZ4780 secondary CPU reset entry
> + */
> +
> +#include <asm/addrspace.h>
> +#include <asm/asm.h>
> +#include <asm/asmmacro.h>
> +#include <asm/cacheops.h>
> +#include <asm/mipsregs.h>
> +
> +#define CACHE_SIZE	(32 * 1024)
> +#define CACHE_LINESIZE	32
> +
> +	/* The CP0 REIM register only stores the upper 16 address bits. */
> +	.section .text.smp-entry, "ax"
> +	.balign 0x10000
> +	.set noreorder
> +LEAF(jz4780_secondary_cpu_entry)
> +	mtc0	zero, CP0_CAUSE
> +	li	t0, ST0_CU0
> +	mtc0	t0, CP0_STATUS
> +	ehb
> +
> +	/* Invalidate both private caches before entering cached code. */
> +	li	t0, KSEG0
> +	ori	t1, t0, CACHE_SIZE
> +	mtc0	zero, CP0_TAGLO
> +	ehb
> +1:	cache	Index_Store_Tag_I, 0(t0)
> +	cache	Index_Store_Tag_D, 0(t0)
> +	addiu	t0, t0, CACHE_LINESIZE
> +	bne	t0, t1, 1b
> +	 nop
> +
> +	mfc0	t0, CP0_CONFIG
> +	li	t1, ~CONF_CM_CMASK
> +	and	t0, t0, t1
> +	ori	t0, t0, CONF_CM_CACHABLE_NONCOHERENT
> +	mtc0	t0, CP0_CONFIG
> +	mtc0	zero, CP0_PAGEMASK
> +	ehb
> +
> +	/* CPU0 publishes these in RAM before releasing CPU1 from reset. */
> +	la	t0, jz4780_cpu_entry_sp
> +	lw	sp, 0(t0)
> +	la	t0, jz4780_cpu_entry_gp
> +	lw	gp, 0(t0)
> +
> +	la	t0, smp_bootstrap
> +	jr	t0
> +	 nop
> +END(jz4780_secondary_cpu_entry)
> diff --git a/arch/mips/generic/ingenic-smp.c b/arch/mips/generic/ingenic-=
smp.c
> new file mode 100644
> index 000000000000..98c1fd7483db
> --- /dev/null
> +++ b/arch/mips/generic/ingenic-smp.c
> @@ -0,0 +1,240 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * JZ4780 SMP support, based on Paul Burton's CI20 implementation and
> + * Zhou Yanjie's 2020 JZ4780 SMP series.
> + * Copyright (C) 2013 Paul Burton <paul.burton@imgtec.com>

Use his kernel.org address.

> + */
> +
> +#include <linux/clk.h>
> +#include <linux/cpu.h>
> +#include <linux/interrupt.h>
> +#include <linux/of.h>
> +#include <linux/of_clk.h>
> +#include <linux/sched/task_stack.h>
> +#include <linux/smp.h>
> +
> +#include <asm/addrspace.h>
> +#include <asm/irq_cpu.h>
> +#include <asm/mipsregs.h>
> +#include <asm/r4kcache.h>
> +#include <asm/smp-ops.h>
> +
> +#include "ingenic-smp.h"
> +
> +#define read_c0_corectrl()	__read_32bit_c0_register($12, 2)
> +#define write_c0_corectrl(val)	__write_32bit_c0_register($12, 2, val)
> +#define read_c0_corestatus()	__read_32bit_c0_register($12, 3)
> +#define write_c0_corestatus(val)	__write_32bit_c0_register($12, 3,
> val)
> +#define read_c0_reim()		__read_32bit_c0_register($12, 4)
> +#define write_c0_reim(val)	__write_32bit_c0_register($12, 4, val)
> +#define read_c0_mailbox0()	__read_32bit_c0_register($20, 0)
> +#define write_c0_mailbox0(val)	__write_32bit_c0_register($20, 0, val)
> +#define read_c0_mailbox1()	__read_32bit_c0_register($20, 1)
> +#define write_c0_mailbox1(val)	__write_32bit_c0_register($20, 1, val)
> +
> +#define JZ4780_NR_CPUS		2
> +#define JZ4780_MBOX_IRQ		(MIPS_CPU_IRQ_BASE + 3)
> +#define CORECTRL_SWRST(cpu)	BIT(cpu)
> +#define CORECTRL_RPC(cpu)	BIT(8 + (cpu))
> +#define CORESTATUS_MIRQ(cpu)	BIT(cpu)
> +#define REIM_ENTRY		GENMASK(31, 16)
> +#define REIM_MBOXIRQ(cpu)	BIT(cpu)
> +
> +static struct clk *cpu1_clock;
> +static DEFINE_RAW_SPINLOCK(smp_lock);
> +
> +/* Referenced by the uncached secondary CPU reset entry. */
> +unsigned long jz4780_cpu_entry_sp;
> +unsigned long jz4780_cpu_entry_gp;
> +
> +static irqreturn_t jz4780_mbox_interrupt(int irq, void *dev_id)
> +{
> +	unsigned int cpu =3D cpu_logical_map(smp_processor_id());
> +	u32 action, status;
> +
> +	raw_spin_lock(&smp_lock);
> +	if (cpu =3D=3D 0) {
> +		action =3D read_c0_mailbox0();
> +		write_c0_mailbox0(0);
> +	} else {
> +		action =3D read_c0_mailbox1();
> +		write_c0_mailbox1(0);
> +	}

Zhou's v8 supported the 4 mailboxes, this feels like a regression.

I understand that we can't really test a quad-core system (unless Nikolaus =
can?)
so I won't object, but that might need to change in the future.

> +
> +	status =3D read_c0_corestatus();
> +	write_c0_corestatus(status & ~CORESTATUS_MIRQ(cpu));
> +	irq_disable_hazard();
> +	raw_spin_unlock(&smp_lock);
> +
> +	if (action & SMP_RESCHEDULE_YOURSELF)
> +		scheduler_ipi();
> +	if (action & SMP_CALL_FUNCTION)
> +		generic_smp_call_function_interrupt();
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void __init jz4780_smp_setup(void)
> +{
> +	struct device_node *np;
> +	u32 entry, reim;
> +	u64 hwid;
> +
> +	for_each_of_cpu_node(np) {
> +		hwid =3D of_get_cpu_hwid(np, 0);
> +		if (hwid >=3D nr_cpu_ids || hwid >=3D JZ4780_NR_CPUS ||

I think these checks on hwid are pointless;
- nr_cpu_ids will never be below hwid unless you read the CPU nodes in reve=
rse
(in which case that's a DT issue),
- hwid >=3D JZ4780_NR_CPUS will only be true if the DT is broken, too.

> +		=C2=A0=C2=A0=C2=A0 !of_device_is_available(np))
> +			continue;
> +		__cpu_number_map[hwid] =3D hwid;
> +		__cpu_logical_map[hwid] =3D hwid;

That looks wrong. The map index should be incremented for each entry you ad=
d,
here you'll have holes if one CPU is offline.

> +		set_cpu_possible(hwid, true);
> +	}
> +
> +	/* Program the shared reset vector with mailbox delivery masked. */
> +	reim =3D read_c0_reim();
> +	reim &=3D ~(REIM_MBOXIRQ(0) | REIM_MBOXIRQ(1));
> +	write_c0_reim(reim);
> +	write_c0_mailbox0(0);
> +	write_c0_mailbox1(0);
> +	write_c0_corestatus(0);
> +
> +	entry =3D KSEG1ADDR((unsigned long)jz4780_secondary_cpu_entry);
> +	write_c0_reim((reim & ~REIM_ENTRY) | (entry & REIM_ENTRY));
> +}
> +
> +static void __init jz4780_prepare_cpus(unsigned int max_cpus)
> +{
> +	struct device_node *np;
> +	u32 reim;
> +	int ret;
> +
> +	ret =3D request_irq(JZ4780_MBOX_IRQ, jz4780_mbox_interrupt,
> +			=C2=A0 IRQF_PERCPU | IRQF_NO_THREAD, "core mailbox",
> NULL);
> +	if (ret)
> +		panic("JZ4780: cannot request mailbox IRQ: %d", ret);

I think this panic is superfluous - if you return here instead I believe th=
at
the system will still be working, although in single-CPU mode.

> +
> +	reim =3D read_c0_reim();
> +	write_c0_reim(reim | REIM_MBOXIRQ(0));
> +	set_c0_status(STATUSF_IP3);
> +	irq_enable_hazard();
> +
> +	if (!cpu_possible(1))
> +		return;
> +
> +	np =3D of_get_cpu_node(1, NULL);
> +	cpu1_clock =3D of_clk_get(np, 0);
> +	of_node_put(np);
> +	if (IS_ERR(cpu1_clock)) {
> +		pr_err("JZ4780: cannot get CPU1 clock: %ld\n",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PTR_ERR(cpu1_clock));
> +		return;
> +	}
> +
> +	ret =3D clk_prepare(cpu1_clock);
> +	if (ret) {
> +		clk_put(cpu1_clock);
> +		cpu1_clock =3D ERR_PTR(ret);
> +		pr_err("JZ4780: cannot prepare CPU1 clock: %d\n", ret);
> +	}
> +}
> +
> +static int jz4780_boot_secondary(int cpu, struct task_struct *idle)
> +{
> +	unsigned long flags;
> +	u32 ctrl;
> +	int ret;
> +
> +	if (cpu_logical_map(cpu) !=3D 1 || IS_ERR_OR_NULL(cpu1_clock))
> +		return -ENODEV;
> +
> +	raw_spin_lock_irqsave(&smp_lock, flags);
> +	ctrl =3D read_c0_corectrl() | CORECTRL_SWRST(1) | CORECTRL_RPC(1);
> +	write_c0_corectrl(ctrl);
> +	back_to_back_c0_hazard();
> +
> +	ret =3D clk_enable(cpu1_clock);
> +	if (ret)
> +		goto unlock;
> +
> +	jz4780_cpu_entry_sp =3D __KSTK_TOS(idle);
> +	jz4780_cpu_entry_gp =3D (unsigned long)task_thread_info(idle);
> +	/* Publish bootstrap state before CPU1 starts using its private
> cache. */
> +	r4k_blast_dcache();
> +	/* Complete cache writeback before releasing reset. */
> +	mb();
> +	write_c0_corectrl(ctrl & ~CORECTRL_SWRST(1));
> +	back_to_back_c0_hazard();
> +unlock:
> +	raw_spin_unlock_irqrestore(&smp_lock, flags);
> +	return ret;
> +}
> +
> +static void jz4780_init_secondary(void)
> +{
> +	clear_c0_status(ST0_IM);
> +	irq_disable_hazard();
> +}
> +
> +static void jz4780_smp_finish(void)
> +{
> +	unsigned int cpu =3D cpu_logical_map(smp_processor_id());
> +	u32 reim;
> +
> +	raw_spin_lock(&smp_lock);
> +	reim =3D read_c0_reim();
> +	write_c0_reim(reim | REIM_MBOXIRQ(cpu));
> +	raw_spin_unlock(&smp_lock);
> +
> +	change_c0_status(ST0_IM, STATUSF_IP3 | STATUSF_IP2 |
> +			 STATUSF_IP1 | STATUSF_IP0);
> +	irq_enable_hazard();
> +	local_irq_enable();
> +}
> +
> +static void jz4780_send_ipi_locked(int cpu, unsigned int action)
> +{
> +	if (cpu_logical_map(cpu) =3D=3D 0)
> +		write_c0_mailbox0(read_c0_mailbox0() | action);
> +	else
> +		write_c0_mailbox1(read_c0_mailbox1() | action);
> +	back_to_back_c0_hazard();
> +}
> +
> +static void jz4780_send_ipi_single(int cpu, unsigned int action)
> +{
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&smp_lock, flags);
> +	jz4780_send_ipi_locked(cpu, action);
> +	raw_spin_unlock_irqrestore(&smp_lock, flags);
> +}
> +
> +static void jz4780_send_ipi_mask(const struct cpumask *mask, unsigned in=
t
> action)
> +{
> +	unsigned long flags;
> +	int cpu;
> +
> +	raw_spin_lock_irqsave(&smp_lock, flags);
> +	for_each_cpu(cpu, mask)
> +		jz4780_send_ipi_locked(cpu, action);
> +	raw_spin_unlock_irqrestore(&smp_lock, flags);
> +}
> +
> +static const struct plat_smp_ops jz4780_smp_ops =3D {
> +	.send_ipi_single =3D jz4780_send_ipi_single,
> +	.send_ipi_mask =3D jz4780_send_ipi_mask,
> +	.init_secondary =3D jz4780_init_secondary,
> +	.smp_finish =3D jz4780_smp_finish,
> +	.boot_secondary =3D jz4780_boot_secondary,
> +	.smp_setup =3D jz4780_smp_setup,
> +	.prepare_cpus =3D jz4780_prepare_cpus,
> +};
> +
> +int __init register_ingenic_smp_ops(void)
> +{
> +	if (!of_machine_is_compatible("ingenic,jz4780"))
> +		return -ENODEV;
> +
> +	register_smp_ops(&jz4780_smp_ops);
> +	return 0;
> +}

Overall, the code itself is pretty much a Xburst (CPU) driver that gives th=
e
idea (through function names, etc) that it is SoC-specific (JZ4780), while =
the
source file has a very generic "ingenic-smp.c" name.

So I'd suggest to replace all 'jz4780' by 'xburst'.

> diff --git a/arch/mips/generic/ingenic-smp.h b/arch/mips/generic/ingenic-=
smp.h
> new file mode 100644
> index 000000000000..54191be8731a
> --- /dev/null
> +++ b/arch/mips/generic/ingenic-smp.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* Copyright (C) 2013 Paul Burton <paul.burton@imgtec.com> */

Use his kernel.org address.

> +#ifndef __MIPS_GENERIC_INGENIC_SMP_H__
> +#define __MIPS_GENERIC_INGENIC_SMP_H__
> +
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/kconfig.h>
> +
> +#ifdef CONFIG_MIPS_INGENIC_SMP
> +int __init register_ingenic_smp_ops(void);
> +void jz4780_secondary_cpu_entry(void);
> +#else
> +static inline int register_ingenic_smp_ops(void)
> +{
> +	return -ENODEV;
> +}
> +#endif
> +
> +#endif /* __MIPS_GENERIC_INGENIC_SMP_H__ */
> diff --git a/arch/mips/generic/init.c b/arch/mips/generic/init.c
> index 1d712eac1617..00149bd1e9a9 100644
> --- a/arch/mips/generic/init.c
> +++ b/arch/mips/generic/init.c
> @@ -20,6 +20,8 @@
> =C2=A0#include <asm/smp-ops.h>
> =C2=A0#include <asm/time.h>
> =C2=A0
> +#include "ingenic-smp.h"
> +
> =C2=A0static __initconst const void *fdt;
> =C2=A0static __initconst const struct mips_machine *mach;
> =C2=A0static __initconst const void *mach_match_data;
> @@ -113,6 +115,8 @@ void __init device_tree_init(void)
> =C2=A0	unflatten_and_copy_device_tree();
> =C2=A0	mips_cpc_probe();
> =C2=A0
> +	if (!register_ingenic_smp_ops())
> +		return;
> =C2=A0	if (!register_cps_smp_ops())
> =C2=A0		return;
> =C2=A0	if (!register_vsmp_smp_ops())
> diff --git a/arch/mips/ingenic/Kconfig b/arch/mips/ingenic/Kconfig
> index f595b339a4b8..1dfd0bfd0193 100644
> --- a/arch/mips/ingenic/Kconfig
> +++ b/arch/mips/ingenic/Kconfig
> @@ -64,6 +64,12 @@ config MACH_JZ4780
> =C2=A0	select MIPS_CPU_SCACHE
> =C2=A0	select SYS_HAS_CPU_MIPS32_R2
> =C2=A0	select SYS_SUPPORTS_HIGHMEM
> +	select SYS_SUPPORTS_SMP
> +
> +config MIPS_INGENIC_SMP
> +	def_bool y
> +	depends on MACH_JZ4780 && SMP
> +	select SMP_UP

I don't think you need an extra symbol here, you could just add 'select SMP=
_UP
if SMP' to the MACH_JZ4780 symbol.

> =C2=A0
> =C2=A0config MACH_X1000
> =C2=A0	bool
> diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
> index 80e8a04a642e..6cabdd4825a7 100644
> --- a/arch/mips/kernel/idle.c
> +++ b/arch/mips/kernel/idle.c
> @@ -18,6 +18,7 @@
> =C2=A0#include <asm/cpu-type.h>
> =C2=A0#include <asm/idle.h>
> =C2=A0#include <asm/mipsregs.h>
> +#include <asm/r4kcache.h>
> =C2=A0
> =C2=A0/*
> =C2=A0 * Not all of the MIPS CPUs have the "wait" instruction available. =
Moreover,
> @@ -71,6 +72,23 @@ static void __cpuidle rm7k_wait_irqoff(void)
> =C2=A0		"	.set	pop					\n");
> =C2=A0}
> =C2=A0
> +/* XBurst gates its private cache clock in WAIT; write back dirty data f=
irst.
> */
> +static void __cpuidle ingenic_smp_wait_irqoff(void)
> +{
> +	unsigned long pending =3D read_c0_cause() & read_c0_status() &
> CAUSEF_IP;
> +
> +	if (!need_resched() && !pending) {
> +		r4k_blast_dcache();
> +		__asm__ __volatile__(
> +			".set push\n"
> +			".set mips3\n"
> +			"sync\n"
> +			"wait\n"
> +			".set pop\n"
> +			: : : "memory");
> +	}
> +}
> +
> =C2=A0/*
> =C2=A0 * Au1 'wait' is only useful when the 32kHz counter is used as time=
r,
> =C2=A0 * since coreclock (and the cp0 counter) stops upon executing it. O=
nly an
> @@ -156,10 +174,15 @@ void __init check_wait(void)
> =C2=A0	case CPU_CAVIUM_OCTEON_PLUS:
> =C2=A0	case CPU_CAVIUM_OCTEON2:
> =C2=A0	case CPU_CAVIUM_OCTEON3:
> -	case CPU_XBURST:
> =C2=A0	case CPU_LOONGSON32:
> =C2=A0		cpu_wait =3D r4k_wait;
> =C2=A0		break;
> +	case CPU_XBURST:
> +		if (IS_ENABLED(CONFIG_MIPS_INGENIC_SMP))
> +			cpu_wait =3D ingenic_smp_wait_irqoff;
> +		else
> +			cpu_wait =3D r4k_wait;
> +		break;
> =C2=A0	case CPU_LOONGSON64:
> =C2=A0		if ((c->processor_id & (PRID_IMP_MASK | PRID_REV_MASK)) >=3D
> =C2=A0				(PRID_IMP_LOONGSON_64C |
> PRID_REV_LOONGSON3A_R2_0) ||

Cheers,
-Paul
