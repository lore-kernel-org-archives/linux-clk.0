Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574457;
	b=vsjqtLyypM4EdIbJRThGRxpe1PjygG769xBxv5g1SN9YjFy0HPqTgbd48datGnF/Wm5u
	 uC3Vr1mPeEP/AUHFaIfPEQJitEgBlUyjxUKYLfNQjxiFdV6SY38UHwwNiU3GP5g3rohYh
	 yU+/fkJUW4QsP1cojCfRKxTm+VJ0o7TiwMwGgHaXvNzwr0DCgMuQQPjftzI2T7ZrYB2wj
	 pq8jjXq5NqEcGwNP4ofbQdbxgeP7TR72nHAE2SPoHcBzST4M1ocnyGGxo17Ng3qZxNer5
	 PxFlu8Ag8L7Dd/hN0mlEBx4mLmf6OBr7QrzpT5oCLtbewLhtrWY1FN4KHqf79h9oKcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574457;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=oe4oMqo+DhoFZdQ8m3oPivqG+If0QKDVfhnojfqwiUU=;
	b=DMN2g6xOOAgRoYhtEGcOMpv3ynqEWsrJnj5trVSNnblMlKflc7CFUjlxVE4srUiqjs6f
	 SuQ/MZ89AWzWnlNwrcp4u1cJ2l6dhXUI3pQhHQd3SGdP/MxKIi+bEr8uyE/l/fL38toPl
	 Fbcn5pLP4PCjc49NRo8hHaPBVwdDMWVCeoJiC+DtOGNdxc+FFXwN1Bm1iAhzZoQCffS+n
	 uXIM4iIngKNyv0N9HcjO9tQusYfRz0Nv/SeNlyhAFlSNGIC00rP/gZLB+jF73TTH0NbkO
	 pCKFkXB+c8HYYtLZqH4gxSvg6E8YMTml9d77bBvKBPHg3A54KWnxIAthvf44qIanqqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357EC606A339;
	Fri, 13 Nov 2026 12:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 357EC606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <ea78059f26aa3e25822665a1a462951695bd1e80.camel@crapouillou.net>
Subject: Re: [PATCH v4 2/3] MIPS: Ingenic: Add XBurst SMP support
From: Paul Cercueil <paul@crapouillou.net>
To: Florian Fainelli <f.fainelli@gmail.com>, linux-mips@vger.kernel.org
Cc: =?UTF-8?Q?=E5=91=A8=E7=90=B0=E6=9D=B0?= "(Zhou Yanjie)"	
 <zhouyanjie@wanyeetech.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>,  Paul Burton <paulburton@kernel.org>, Stephen
 Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,  Jerome
 Brunet <jbrunet+clk@baylibre.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 open list	 <linux-kernel@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK"
	 <linux-clk@vger.kernel.org>, hns@goldelico.com, paul@boddie.org.uk
Date: Fri, 13 Nov 2026 13:54:10 +0100
In-Reply-To: <20261112184441.3724150-3-f.fainelli@gmail.com>
References: <20261112184441.3724150-1-f.fainelli@gmail.com>
	 <20261112184441.3724150-3-f.fainelli@gmail.com>
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

Le jeudi 12 novembre 2026 =C3=A0 10:44 -0800, Florian Fainelli a =C3=A9crit=
=C2=A0:
> From: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wanyeetech.co=
m>
>=20
> Add support for the second XBurst core on the JZ4780, based on Zhou
> Yanjie's 2020 series and Paul Burton's original CI20 SMP implementation.
> Use the CP0 mailboxes for inter-processor interrupts.
>=20
> XBurst stops its private cache clock when executing WAIT. Write back
> the data cache before entering idle so that the other core can access
> data belonging to the sleeping core.
>=20
> Link: https://lkml.iu.edu/hypermail/linux/kernel/2005.2/03488.html
> Link: https://lists.openwall.net/linux-kernel/2020/05/13/1482
> Link: https://lists.openwall.net/linux-kernel/2020/05/19/1099
> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Paul Cercueil <paul@crapouillou.net>

You updated the patch after my Reviewed-by, so that voids it...

> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>
> [florian: forward ported to latest version]
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---

Please add a changelog per patch too.

> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0arch/mips/Kbuild=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 1 +
> =C2=A0arch/mips/generic/init.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0arch/mips/include/asm/ingenic-smp.h=C2=A0=C2=A0 |=C2=A0 20 ++
> =C2=A0arch/mips/ingenic/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0arch/mips/ingenic/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +
> =C2=A0arch/mips/ingenic/ingenic-smp-entry.S |=C2=A0 54 ++++++
> =C2=A0arch/mips/ingenic/ingenic-smp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 262 ++++++++++++++++++++++++++
> =C2=A0arch/mips/kernel/idle.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 30 ++-
> =C2=A0arch/mips/kernel/smp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> =C2=A010 files changed, 382 insertions(+), 3 deletions(-)
> =C2=A0create mode 100644 arch/mips/include/asm/ingenic-smp.h
> =C2=A0create mode 100644 arch/mips/ingenic/Makefile
> =C2=A0create mode 100644 arch/mips/ingenic/ingenic-smp-entry.S
> =C2=A0create mode 100644 arch/mips/ingenic/ingenic-smp.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 222b7fc2c3aa..7128df320bab 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13150,8 +13150,9 @@ L:	linux-mips@vger.kernel.org
> =C2=A0S:	Maintained
> =C2=A0F:	arch/mips/boot/dts/ingenic/
> =C2=A0F:	arch/mips/generic/board-ingenic.c
> +F:	arch/mips/include/asm/ingenic-smp.h
> =C2=A0F:	arch/mips/include/asm/mach-ingenic/
> -F:	arch/mips/ingenic/Kconfig
> +F:	arch/mips/ingenic/
> =C2=A0F:	drivers/clk/ingenic/
> =C2=A0F:	drivers/dma/dma-jz4780.c
> =C2=A0F:	drivers/gpu/drm/ingenic/
> diff --git a/arch/mips/Kbuild b/arch/mips/Kbuild
> index e901bf554483..4912ab80d143 100644
> --- a/arch/mips/Kbuild
> +++ b/arch/mips/Kbuild
> @@ -12,6 +12,7 @@ obj- :=3D $(platform-y)
> =C2=A0# The object files are linked as core-y files would be linked
> =C2=A0
> =C2=A0obj-y +=3D generic/
> +obj-$(CONFIG_MACH_INGENIC) +=3D ingenic/
> =C2=A0obj-y +=3D kernel/
> =C2=A0obj-y +=3D mm/
> =C2=A0obj-y +=3D net/
> diff --git a/arch/mips/generic/init.c b/arch/mips/generic/init.c
> index 1d712eac1617..38f294887c17 100644
> --- a/arch/mips/generic/init.c
> +++ b/arch/mips/generic/init.c
> @@ -13,6 +13,7 @@
> =C2=A0
> =C2=A0#include <asm/bootinfo.h>
> =C2=A0#include <asm/fw/fw.h>
> +#include <asm/ingenic-smp.h>
> =C2=A0#include <asm/irq_cpu.h>
> =C2=A0#include <asm/machine.h>
> =C2=A0#include <asm/mips-cps.h>
> @@ -113,6 +114,8 @@ void __init device_tree_init(void)
> =C2=A0	unflatten_and_copy_device_tree();
> =C2=A0	mips_cpc_probe();
> =C2=A0
> +	if (!register_ingenic_smp_ops())
> +		return;
> =C2=A0	if (!register_cps_smp_ops())
> =C2=A0		return;
> =C2=A0	if (!register_vsmp_smp_ops())
> diff --git a/arch/mips/include/asm/ingenic-smp.h
> b/arch/mips/include/asm/ingenic-smp.h
> new file mode 100644
> index 000000000000..ea81c333820d
> --- /dev/null
> +++ b/arch/mips/include/asm/ingenic-smp.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* Copyright (C) 2013 Paul Burton <paulburton@kernel.org> */
> +#ifndef __ASM_INGENIC_SMP_H__
> +#define __ASM_INGENIC_SMP_H__
> +
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/kconfig.h>
> +
> +#if defined(CONFIG_MACH_JZ4780) && defined(CONFIG_SMP)
> +int __init register_ingenic_smp_ops(void);
> +void xburst_secondary_cpu_entry(void);
> +#else
> +static inline int register_ingenic_smp_ops(void)
> +{
> +	return -ENODEV;
> +}
> +#endif
> +
> +#endif /* __ASM_INGENIC_SMP_H__ */
> diff --git a/arch/mips/ingenic/Kconfig b/arch/mips/ingenic/Kconfig
> index f595b339a4b8..583f8d3651df 100644
> --- a/arch/mips/ingenic/Kconfig
> +++ b/arch/mips/ingenic/Kconfig
> @@ -64,6 +64,8 @@ config MACH_JZ4780
> =C2=A0	select MIPS_CPU_SCACHE
> =C2=A0	select SYS_HAS_CPU_MIPS32_R2
> =C2=A0	select SYS_SUPPORTS_HIGHMEM
> +	select SYS_SUPPORTS_SMP
> +	select SMP_UP if SMP
> =C2=A0
> =C2=A0config MACH_X1000
> =C2=A0	bool
> diff --git a/arch/mips/ingenic/Makefile b/arch/mips/ingenic/Makefile
> new file mode 100644
> index 000000000000..fc3b1bf1f25a
> --- /dev/null
> +++ b/arch/mips/ingenic/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +ifdef CONFIG_SMP
> +obj-$(CONFIG_MACH_JZ4780) +=3D ingenic-smp.o ingenic-smp-entry.o
> +endif
> diff --git a/arch/mips/ingenic/ingenic-smp-entry.S
> b/arch/mips/ingenic/ingenic-smp-entry.S
> new file mode 100644
> index 000000000000..290e23c65707
> --- /dev/null
> +++ b/arch/mips/ingenic/ingenic-smp-entry.S
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2013 Paul Burton <paulburton@kernel.org>
> + * XBurst secondary CPU reset entry
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
> +LEAF(xburst_secondary_cpu_entry)
> +	mtc0	zero, CP0_CAUSE
> +	li	t0, ST0_CU0
> +	mtc0	t0, CP0_STATUS
> +	ehb
> +
> +	/* Invalidate both private caches before entering cached code. */
> +	PTR_LI	t0, CKSEG0
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
> +	PTR_LA	t0, xburst_cpu_entry_sp
> +	LONG_L	sp, 0(t0)
> +	PTR_LA	t0, xburst_cpu_entry_gp
> +	LONG_L	gp, 0(t0)
> +
> +	PTR_LA	t0, smp_bootstrap
> +	jr	t0
> +	 nop
> +END(xburst_secondary_cpu_entry)
> diff --git a/arch/mips/ingenic/ingenic-smp.c b/arch/mips/ingenic/ingenic-=
smp.c
> new file mode 100644
> index 000000000000..b020f4eb1d65
> --- /dev/null
> +++ b/arch/mips/ingenic/ingenic-smp.c
> @@ -0,0 +1,262 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * XBurst SMP support, based on Paul Burton's CI20 implementation and
> + * Zhou Yanjie's 2020 JZ4780 SMP series.
> + * Copyright (C) 2013 Paul Burton <paulburton@kernel.org>
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
> +#include <asm/ingenic-smp.h>
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
> +#define XBURST_MBOX_IRQ		(MIPS_CPU_IRQ_BASE + 3)
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
> +unsigned long xburst_cpu_entry_sp;
> +unsigned long xburst_cpu_entry_gp;
> +
> +static irqreturn_t xburst_mbox_interrupt(int irq, void *dev_id)
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
> +static void __init xburst_smp_setup(void)
> +{
> +	struct device_node *np;
> +	u32 entry, reim;
> +	unsigned int cpu =3D 0;
> +	u64 hwid;
> +
> +	for_each_of_cpu_node(np) {
> +		hwid =3D of_get_cpu_hwid(np, 0);
> +		if (!of_device_is_available(np) ||
> +		=C2=A0=C2=A0=C2=A0 hwid >=3D ARRAY_SIZE(__cpu_number_map))
> +			continue;
> +		if (cpu >=3D nr_cpu_ids) {
> +			of_node_put(np);
> +			break;
> +		}
> +		__cpu_number_map[hwid] =3D cpu;
> +		__cpu_logical_map[cpu] =3D hwid;
> +		set_cpu_possible(cpu, true);
> +		set_cpu_present(cpu, true);
> +		cpu_set_core(&cpu_data[cpu], hwid);
> +		cpu++;
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
> +	entry =3D CKSEG1ADDR((unsigned long)xburst_secondary_cpu_entry);
> +	write_c0_reim((reim & ~REIM_ENTRY) | (entry & REIM_ENTRY));
> +}
> +
> +static void __init xburst_prepare_cpus(unsigned int max_cpus)
> +{
> +	struct device_node *np;
> +	u32 reim;
> +	int ret;
> +
> +	ret =3D request_irq(XBURST_MBOX_IRQ, xburst_mbox_interrupt,
> +			=C2=A0 IRQF_PERCPU | IRQF_NO_THREAD, "core mailbox",
> NULL);
> +	if (ret) {
> +		pr_err("XBurst: cannot request mailbox IRQ: %d\n", ret);
> +		return;
> +	}
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
> +		pr_err("XBurst: cannot get CPU1 clock: %ld\n",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PTR_ERR(cpu1_clock));
> +		return;
> +	}
> +
> +	ret =3D clk_prepare(cpu1_clock);
> +	if (ret) {
> +		clk_put(cpu1_clock);
> +		cpu1_clock =3D ERR_PTR(ret);
> +		pr_err("XBurst: cannot prepare CPU1 clock: %d\n", ret);
> +	}
> +}
> +
> +static int xburst_boot_secondary(int cpu, struct task_struct *idle)
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
> +	raw_spin_unlock_irqrestore(&smp_lock, flags);
> +
> +	ret =3D clk_enable(cpu1_clock);
> +	if (ret)
> +		return ret;
> +
> +	xburst_cpu_entry_sp =3D __KSTK_TOS(idle);
> +	xburst_cpu_entry_gp =3D (unsigned long)task_thread_info(idle);
> +	/* Publish bootstrap state before CPU1 starts using its private
> cache. */
> +	r4k_blast_dcache();
> +	/* Complete cache writeback before releasing reset. */
> +	mb();
> +	raw_spin_lock_irqsave(&smp_lock, flags);
> +	ctrl =3D read_c0_corectrl();
> +	write_c0_corectrl(ctrl & ~CORECTRL_SWRST(1));
> +	back_to_back_c0_hazard();
> +	raw_spin_unlock_irqrestore(&smp_lock, flags);
> +	return 0;
> +}
> +
> +static void xburst_init_secondary(void)
> +{
> +	clear_c0_status(ST0_IM);
> +	irq_disable_hazard();
> +}
> +
> +static void xburst_smp_finish(void)
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
> +static void xburst_send_ipi_locked(int cpu, unsigned int action)
> +{
> +	if (cpu_logical_map(cpu) =3D=3D 0)
> +		write_c0_mailbox0(read_c0_mailbox0() | action);
> +	else
> +		write_c0_mailbox1(read_c0_mailbox1() | action);
> +	back_to_back_c0_hazard();
> +}
> +
> +static void xburst_send_ipi_single(int cpu, unsigned int action)
> +{
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&smp_lock, flags);
> +	xburst_send_ipi_locked(cpu, action);
> +	raw_spin_unlock_irqrestore(&smp_lock, flags);
> +}
> +
> +static void xburst_send_ipi_mask(const struct cpumask *mask, unsigned in=
t
> action)
> +{
> +	unsigned long flags;
> +	int cpu;
> +
> +	raw_spin_lock_irqsave(&smp_lock, flags);
> +	for_each_cpu(cpu, mask)
> +		xburst_send_ipi_locked(cpu, action);
> +	raw_spin_unlock_irqrestore(&smp_lock, flags);
> +}
> +
> +#ifdef CONFIG_HOTPLUG_CPU
> +static int xburst_cpu_disable(void)
> +{
> +	/* CPU teardown and restart are not supported yet. */
> +	return -EOPNOTSUPP;
> +}
> +#endif
> +
> +static const struct plat_smp_ops xburst_smp_ops =3D {
> +	.send_ipi_single =3D xburst_send_ipi_single,
> +	.send_ipi_mask =3D xburst_send_ipi_mask,
> +	.init_secondary =3D xburst_init_secondary,
> +	.smp_finish =3D xburst_smp_finish,
> +	.boot_secondary =3D xburst_boot_secondary,
> +	.smp_setup =3D xburst_smp_setup,
> +	.prepare_cpus =3D xburst_prepare_cpus,
> +#ifdef CONFIG_HOTPLUG_CPU
> +	.cpu_disable =3D xburst_cpu_disable,
> +#endif

Drop the macro guards:
.cpu_disable =3D IF_PTR(IS_ENABLED(CONFIG_HOTPLUG_CPU), xburst_cpu_disable)=
,

> +};
> +
> +int __init register_ingenic_smp_ops(void)
> +{
> +	if (!of_machine_is_compatible("ingenic,jz4780"))
> +		return -ENODEV;
> +
> +	register_smp_ops(&xburst_smp_ops);
> +	return 0;
> +}
> diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
> index 80e8a04a642e..0b042a328ad7 100644
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
> @@ -71,6 +72,27 @@ static void __cpuidle rm7k_wait_irqoff(void)
> =C2=A0		"	.set	pop					\n");
> =C2=A0}
> =C2=A0
> +/* XBurst gates its private cache clock in WAIT; write back dirty data f=
irst.
> */
> +static void __cpuidle xburst_wait_irqoff(void)
> +{
> +	unsigned long pending;
> +
> +	if (need_resched())
> +		return;
> +
> +	r4k_blast_dcache();
> +	pending =3D read_c0_cause() & read_c0_status() & CAUSEF_IP;
> +	if (!need_resched() && !pending) {

You now call need_resched() twice, that's on purpose?

> +		__asm__ __volatile__(
> +			".set push\n"
> +			".set arch=3Dr4000\n"
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
> @@ -156,10 +178,16 @@ void __init check_wait(void)
> =C2=A0	case CPU_CAVIUM_OCTEON_PLUS:
> =C2=A0	case CPU_CAVIUM_OCTEON2:
> =C2=A0	case CPU_CAVIUM_OCTEON3:
> -	case CPU_XBURST:
> =C2=A0	case CPU_LOONGSON32:
> =C2=A0		cpu_wait =3D r4k_wait;
> =C2=A0		break;
> +	case CPU_XBURST:
> +		if (IS_ENABLED(CONFIG_MACH_JZ4780) &&
> +		=C2=A0=C2=A0=C2=A0 IS_ENABLED(CONFIG_SMP) && num_possible_cpus() > 1)
> +			cpu_wait =3D xburst_wait_irqoff;
> +		else
> +			cpu_wait =3D r4k_wait;
> +		break;
> =C2=A0	case CPU_LOONGSON64:
> =C2=A0		if ((c->processor_id & (PRID_IMP_MASK | PRID_REV_MASK)) >=3D
> =C2=A0				(PRID_IMP_LOONGSON_64C |
> PRID_REV_LOONGSON3A_R2_0) ||
> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
> index 0f28b4a62e72..46c70d866723 100644
> --- a/arch/mips/kernel/smp.c
> +++ b/arch/mips/kernel/smp.c
> @@ -338,7 +338,10 @@ int mips_smp_ipi_free(const struct cpumask *mask)
> =C2=A0
> =C2=A0static int __init mips_smp_ipi_init(void)
> =C2=A0{
> -	if (num_possible_cpus() =3D=3D 1)
> +	/* Platforms with their own IPI callbacks do not need an IRQ domain.
> */
> +	if ((mp_ops->send_ipi_single !=3D mips_smp_send_ipi_single &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0 mp_ops->send_ipi_mask !=3D mips_smp_send_ipi_m=
ask) ||
> +	=C2=A0=C2=A0=C2=A0 num_possible_cpus() =3D=3D 1)

Needs braces now because of the multi-line if().

This change wasn't in your v3, and I also feel like this would belong in a
separate patch.

Cheers,
-Paul

> =C2=A0		return 0;
> =C2=A0
> =C2=A0	mips_smp_ipi_allocate(cpu_possible_mask);
