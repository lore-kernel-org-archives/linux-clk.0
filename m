Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=85.215.255.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793975856;
	b=JO7X9DIRLwg8zODlC0BWlMi1l7SdelkInSP98BTThZ9SjH6P0DR318+Pckv4rk17aICG
	 fJ714GGLZ0NMM13cla2jY5cu0T5u8tzpLLdnPfg3vn9MPUlPLhfTc4uOqA7MKG4lbJLu6
	 78R2P8iQ1cNE/cuZzQR+iljf1/wlvKXC7zvFSsxZTtSS5UPBu/9wUOHbMUFPxVxnryDYT
	 bJ3J+MXR3ZCY/vYaRcHkkkwugxzCJ9+e6Cg8r0KnVr9AzAGeba1CcVzB3IInrp5c1ekNx
	 pm/X2i+m4SQiUbr2X/8gnO1dmWgEg6AqDNpHjYzziXZdIDv2TJX45y3qW1uvibGDMzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975856;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=nlMM8Cc0+ditBDMoX6jWdUX7AgDpv4tzug5hu8iIzbc=;
	b=c5PXIOdWkcC3i89SXG9SCha7HA9uYrdoPPTkhdyB+vO3IuvEdmuAxTgYD2OSw2AzfQsi
	 eWmRTG34A6QnL0TzhXM3UKjIVnky9/N/SujT+IOUs/Eun44RHBydjBb0p+NMRQjuHkWbW
	 uogEGPyaIpuaCiiRGm8sO6EE+Em0cnfqtTH/DlhleC3qo4bOD/9B25kWbVj/TJJcS3OFQ
	 mt5Z1RgH+ly1dWOZIP9yPRmv4awcs/fOuqznGdswehpTCCttmJKwn2Eq3vaf6tKCrWHv8
	 MEajYO0SuK+R9sHgQMaAv1uFY9KHSPPka7R7YDfRYaU3uFuE74Re23yAohMJwZAwfJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=nk4jV2Eh;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b="KYZt/aLD";
	arc=fail smtp.remote-ip=85.215.255.53
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF65E606A32E;
	Fri,  6 Nov 2026 14:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF65E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=nk4jV2Eh;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=KYZt/aLD
ARC-Seal: i=1; a=rsa-sha256; t=1793975818; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=m3/4WXHhkqMos5PvYQd380qV/V7A6x7hmjfAJDrFUsV2sfvMzDJFK+RH+lu79IPDia
    tE0MY2uZAnBIf2MYcIrGKMY10JWde8+9EWib7QPLQu03uieDLIgOJLWf+A/AYLTce3xy
    ejV21d+4moq8JMDmaSwvj2E4/CfWAZ50u8AqgBe8cfFwbOkqW2rxhZOzx2EIdgxp9bR4
    23tjhgt2h2KsENPkVh26f31eou4xv1Bj6FaACIZd/Pmekg5XPnpmsPnUdZBIQ+8dSCLK
    pGT1kXOHbAxG1Mn+h6D85T76zRDndjsNVnRlHA3POMYMwCo1Bm08Rj1zlrlkuJdXGZt8
    +4bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1793975818;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=nlMM8Cc0+ditBDMoX6jWdUX7AgDpv4tzug5hu8iIzbc=;
    b=txx2PtgfvNqC6kyXbVFLirKJ9Gb9TU5QEi4kjoJsdsRofaf+eG7IvPCAzZadt98lOd
    xV7CVGbqdepqCfnrClKeOZ7sQnfv51sQE1DU92sA9LorqjdAnq33mxVS6jhgSwlNWFXk
    dIBLs+GvwVJgYphm9ERc5kJQ4578iKoaH9hFkMHo/nYDLwQ6aV2NrJGALkyfweHkNOGa
    9NXsGnmYpmKkNK1MUnjT5l0d5jTMnAGciu/KDFzI9qRaDdSHA0vJCcRM8/lLG98ddM1y
    gJ3mSWZM3pJDBjA4Q9d5adsgVlJAtxsr5N5UPLzwAtL8G7RY5Y9lo6Tt68pOBgeQfPfE
    Y2VQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793975818;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=nlMM8Cc0+ditBDMoX6jWdUX7AgDpv4tzug5hu8iIzbc=;
    b=nk4jV2EhmFgYeZSxAFAzVPCcJLnzF4blt2m2k/DrnugC2678JM7DOzvpzxKx9ei0Kq
    d1xd4R3jhmW5fuyjmFkxlxuktoAg8lk1AAQ/KaQFbH/G5yVcJC10hC0/BLagXFmX81lT
    ExiYGo+tvASe01J6fO8SGhRrP9v+9IEU9GBLXk4wHveDR+xKiSTjQEgayt7E8gfms1Bp
    qPYlETNGi5GR20Xdwa8/K04gVFg5Ffz0hX/WybWZ8AHBPIGQLMTgzurSmy9/JDimXiI0
    LPhcscX6pf217Er1UUsMDSYb775ijA2HkmngclcgPEDR0LKOzTTHx5g9O4BjIBOosyRH
    DaHw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793975818;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=nlMM8Cc0+ditBDMoX6jWdUX7AgDpv4tzug5hu8iIzbc=;
    b=KYZt/aLDH6Xuc3NhbOyGVgBfS5DqyHfEnarvYP/aSltKugGdpexUveQ0UoyPn5uNls
    ot97srZeCz0v0KJ+6vBA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrVjZoMy8iN4frnsPsBQ4l+mfK4O7kvgww6TmAq"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22A6Eavnxb
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Fri, 6 Nov 2026 15:36:57 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.10\))
Subject: Re: [PATCH 2/3] MIPS: Ingenic: Add JZ4780 SMP support to the generic
 platform
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20261105203243.2292647-3-f.fainelli@gmail.com>
Date: Fri, 6 Nov 2026 15:36:26 +0100
Cc: linux-mips@vger.kernel.org,
 =?utf-8?B?IuWRqOeQsOadsCAoWmhvdSBZYW5qaWUpIg==?= <zhouyanjie@wanyeetech.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 Paul Boddie <paul@boddie.org.uk>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FDBC55AE-EAB3-4C30-A148-99FA67B15B01@goldelico.com>
References: <20261105203243.2292647-1-f.fainelli@gmail.com>
 <20261105203243.2292647-3-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81.1.10)

Hi,

> Am 05.11.2026 um 21:32 schrieb Florian Fainelli =
<f.fainelli@gmail.com>:
>=20
> From: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) =
<zhouyanjie@wanyeetech.com>
>=20
> Port the JZ4780 reset-entry and CP0 mailbox implementation from Zhou
> Yanjie's 2020 v8 series, based on Paul Burton's original CI20 SMP =
code.
> The old arch/mips/jz4740 platform has moved into the generic MIPS =
code,
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
>=20
> This adaptation incorporates the CPU-enumeration review feedback and
> removes the old unused CPU mask. Preserve the original source credits;
> historical Tested-by and Reviewed-by tags are not carried to this
> substantially changed port. Adaptation and validation used Codex
> assistance.
>=20
> Link: https://lkml.iu.edu/hypermail/linux/kernel/2005.2/03488.html
> Link: https://lists.openwall.net/linux-kernel/2020/05/13/1482
> Link: https://lists.openwall.net/linux-kernel/2020/05/19/1099
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) =
<zhouyanjie@wanyeetech.com>
> [florian: forward ported to latest version]
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> MAINTAINERS                           |   1 +
> arch/mips/generic/Makefile            |   1 +
> arch/mips/generic/ingenic-smp-entry.S |  54 ++++++
> arch/mips/generic/ingenic-smp.c       | 240 ++++++++++++++++++++++++++
> arch/mips/generic/ingenic-smp.h       |  20 +++
> arch/mips/generic/init.c              |   4 +
> arch/mips/ingenic/Kconfig             |   6 +
> arch/mips/kernel/idle.c               |  25 ++-
> 8 files changed, 350 insertions(+), 1 deletion(-)
> create mode 100644 arch/mips/generic/ingenic-smp-entry.S
> create mode 100644 arch/mips/generic/ingenic-smp.c
> create mode 100644 arch/mips/generic/ingenic-smp.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 09713dc4c6a7..101027579ccd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13117,6 +13117,7 @@ L: linux-mips@vger.kernel.org
> S: Maintained
> F: arch/mips/boot/dts/ingenic/
> F: arch/mips/generic/board-ingenic.c
> +F: arch/mips/generic/ingenic-smp*
> F: arch/mips/include/asm/mach-ingenic/
> F: arch/mips/ingenic/Kconfig
> F: drivers/clk/ingenic/
> diff --git a/arch/mips/generic/Makefile b/arch/mips/generic/Makefile
> index ea0e4ad5e600..df92650c0f15 100644
> --- a/arch/mips/generic/Makefile
> +++ b/arch/mips/generic/Makefile
> @@ -12,5 +12,6 @@ obj-$(CONFIG_YAMON_DT_SHIM) +=3D yamon-dt.o
> obj-$(CONFIG_LEGACY_BOARD_SEAD3) +=3D board-sead3.o
> obj-$(CONFIG_LEGACY_BOARD_OCELOT) +=3D board-ocelot.o
> obj-$(CONFIG_MACH_INGENIC) +=3D board-ingenic.o
> +obj-$(CONFIG_MIPS_INGENIC_SMP) +=3D ingenic-smp.o ingenic-smp-entry.o
> obj-$(CONFIG_VIRT_BOARD_RANCHU) +=3D board-ranchu.o
> obj-$(CONFIG_MACH_REALTEK_RTL) +=3D board-realtek.o
> diff --git a/arch/mips/generic/ingenic-smp-entry.S =
b/arch/mips/generic/ingenic-smp-entry.S
> new file mode 100644
> index 000000000000..828df4687e84
> --- /dev/null
> +++ b/arch/mips/generic/ingenic-smp-entry.S
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2013 Paul Burton <paul.burton@imgtec.com>
> + * JZ4780 secondary CPU reset entry
> + */
> +
> +#include <asm/addrspace.h>
> +#include <asm/asm.h>
> +#include <asm/asmmacro.h>
> +#include <asm/cacheops.h>
> +#include <asm/mipsregs.h>
> +
> +#define CACHE_SIZE (32 * 1024)
> +#define CACHE_LINESIZE 32
> +
> + /* The CP0 REIM register only stores the upper 16 address bits. */
> + .section .text.smp-entry, "ax"
> + .balign 0x10000
> + .set noreorder
> +LEAF(jz4780_secondary_cpu_entry)
> + mtc0 zero, CP0_CAUSE
> + li t0, ST0_CU0
> + mtc0 t0, CP0_STATUS
> + ehb
> +
> + /* Invalidate both private caches before entering cached code. */
> + li t0, KSEG0
> + ori t1, t0, CACHE_SIZE
> + mtc0 zero, CP0_TAGLO
> + ehb
> +1: cache Index_Store_Tag_I, 0(t0)
> + cache Index_Store_Tag_D, 0(t0)
> + addiu t0, t0, CACHE_LINESIZE
> + bne t0, t1, 1b
> + nop
> +
> + mfc0 t0, CP0_CONFIG
> + li t1, ~CONF_CM_CMASK
> + and t0, t0, t1
> + ori t0, t0, CONF_CM_CACHABLE_NONCOHERENT
> + mtc0 t0, CP0_CONFIG
> + mtc0 zero, CP0_PAGEMASK
> + ehb
> +
> + /* CPU0 publishes these in RAM before releasing CPU1 from reset. */
> + la t0, jz4780_cpu_entry_sp
> + lw sp, 0(t0)
> + la t0, jz4780_cpu_entry_gp
> + lw gp, 0(t0)
> +
> + la t0, smp_bootstrap
> + jr t0
> + nop
> +END(jz4780_secondary_cpu_entry)
> diff --git a/arch/mips/generic/ingenic-smp.c =
b/arch/mips/generic/ingenic-smp.c
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
> +#define read_c0_corectrl() __read_32bit_c0_register($12, 2)
> +#define write_c0_corectrl(val) __write_32bit_c0_register($12, 2, val)
> +#define read_c0_corestatus() __read_32bit_c0_register($12, 3)
> +#define write_c0_corestatus(val) __write_32bit_c0_register($12, 3, =
val)
> +#define read_c0_reim() __read_32bit_c0_register($12, 4)
> +#define write_c0_reim(val) __write_32bit_c0_register($12, 4, val)
> +#define read_c0_mailbox0() __read_32bit_c0_register($20, 0)
> +#define write_c0_mailbox0(val) __write_32bit_c0_register($20, 0, val)
> +#define read_c0_mailbox1() __read_32bit_c0_register($20, 1)
> +#define write_c0_mailbox1(val) __write_32bit_c0_register($20, 1, val)
> +
> +#define JZ4780_NR_CPUS 2
> +#define JZ4780_MBOX_IRQ (MIPS_CPU_IRQ_BASE + 3)
> +#define CORECTRL_SWRST(cpu) BIT(cpu)
> +#define CORECTRL_RPC(cpu) BIT(8 + (cpu))
> +#define CORESTATUS_MIRQ(cpu) BIT(cpu)
> +#define REIM_ENTRY GENMASK(31, 16)
> +#define REIM_MBOXIRQ(cpu) BIT(cpu)
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
> + unsigned int cpu =3D cpu_logical_map(smp_processor_id());
> + u32 action, status;
> +
> + raw_spin_lock(&smp_lock);
> + if (cpu =3D=3D 0) {
> + action =3D read_c0_mailbox0();
> + write_c0_mailbox0(0);
> + } else {
> + action =3D read_c0_mailbox1();
> + write_c0_mailbox1(0);
> + }
> +
> + status =3D read_c0_corestatus();
> + write_c0_corestatus(status & ~CORESTATUS_MIRQ(cpu));
> + irq_disable_hazard();
> + raw_spin_unlock(&smp_lock);
> +
> + if (action & SMP_RESCHEDULE_YOURSELF)
> + scheduler_ipi();
> + if (action & SMP_CALL_FUNCTION)
> + generic_smp_call_function_interrupt();
> +
> + return IRQ_HANDLED;
> +}
> +
> +static void __init jz4780_smp_setup(void)
> +{
> + struct device_node *np;
> + u32 entry, reim;
> + u64 hwid;
> +
> + for_each_of_cpu_node(np) {
> + hwid =3D of_get_cpu_hwid(np, 0);
> + if (hwid >=3D nr_cpu_ids || hwid >=3D JZ4780_NR_CPUS ||
> +    !of_device_is_available(np))
> + continue;
> + __cpu_number_map[hwid] =3D hwid;
> + __cpu_logical_map[hwid] =3D hwid;
> + set_cpu_possible(hwid, true);
> + }
> +
> + /* Program the shared reset vector with mailbox delivery masked. */
> + reim =3D read_c0_reim();
> + reim &=3D ~(REIM_MBOXIRQ(0) | REIM_MBOXIRQ(1));
> + write_c0_reim(reim);
> + write_c0_mailbox0(0);
> + write_c0_mailbox1(0);
> + write_c0_corestatus(0);
> +
> + entry =3D KSEG1ADDR((unsigned long)jz4780_secondary_cpu_entry);
> + write_c0_reim((reim & ~REIM_ENTRY) | (entry & REIM_ENTRY));
> +}
> +
> +static void __init jz4780_prepare_cpus(unsigned int max_cpus)
> +{
> + struct device_node *np;
> + u32 reim;
> + int ret;
> +
> + ret =3D request_irq(JZ4780_MBOX_IRQ, jz4780_mbox_interrupt,
> +  IRQF_PERCPU | IRQF_NO_THREAD, "core mailbox", NULL);
> + if (ret)
> + panic("JZ4780: cannot request mailbox IRQ: %d", ret);
> +
> + reim =3D read_c0_reim();
> + write_c0_reim(reim | REIM_MBOXIRQ(0));
> + set_c0_status(STATUSF_IP3);
> + irq_enable_hazard();
> +
> + if (!cpu_possible(1))
> + return;
> +
> + np =3D of_get_cpu_node(1, NULL);
> + cpu1_clock =3D of_clk_get(np, 0);
> + of_node_put(np);
> + if (IS_ERR(cpu1_clock)) {
> + pr_err("JZ4780: cannot get CPU1 clock: %ld\n",
> +       PTR_ERR(cpu1_clock));
> + return;
> + }
> +
> + ret =3D clk_prepare(cpu1_clock);
> + if (ret) {
> + clk_put(cpu1_clock);
> + cpu1_clock =3D ERR_PTR(ret);
> + pr_err("JZ4780: cannot prepare CPU1 clock: %d\n", ret);
> + }
> +}
> +
> +static int jz4780_boot_secondary(int cpu, struct task_struct *idle)
> +{
> + unsigned long flags;
> + u32 ctrl;
> + int ret;
> +
> + if (cpu_logical_map(cpu) !=3D 1 || IS_ERR_OR_NULL(cpu1_clock))
> + return -ENODEV;
> +
> + raw_spin_lock_irqsave(&smp_lock, flags);
> + ctrl =3D read_c0_corectrl() | CORECTRL_SWRST(1) | CORECTRL_RPC(1);
> + write_c0_corectrl(ctrl);
> + back_to_back_c0_hazard();
> +
> + ret =3D clk_enable(cpu1_clock);
> + if (ret)
> + goto unlock;
> +
> + jz4780_cpu_entry_sp =3D __KSTK_TOS(idle);
> + jz4780_cpu_entry_gp =3D (unsigned long)task_thread_info(idle);
> + /* Publish bootstrap state before CPU1 starts using its private =
cache. */
> + r4k_blast_dcache();
> + /* Complete cache writeback before releasing reset. */
> + mb();
> + write_c0_corectrl(ctrl & ~CORECTRL_SWRST(1));
> + back_to_back_c0_hazard();
> +unlock:
> + raw_spin_unlock_irqrestore(&smp_lock, flags);
> + return ret;
> +}
> +
> +static void jz4780_init_secondary(void)
> +{
> + clear_c0_status(ST0_IM);
> + irq_disable_hazard();
> +}
> +
> +static void jz4780_smp_finish(void)
> +{
> + unsigned int cpu =3D cpu_logical_map(smp_processor_id());
> + u32 reim;
> +
> + raw_spin_lock(&smp_lock);
> + reim =3D read_c0_reim();
> + write_c0_reim(reim | REIM_MBOXIRQ(cpu));
> + raw_spin_unlock(&smp_lock);
> +
> + change_c0_status(ST0_IM, STATUSF_IP3 | STATUSF_IP2 |
> + STATUSF_IP1 | STATUSF_IP0);
> + irq_enable_hazard();
> + local_irq_enable();
> +}
> +
> +static void jz4780_send_ipi_locked(int cpu, unsigned int action)
> +{
> + if (cpu_logical_map(cpu) =3D=3D 0)
> + write_c0_mailbox0(read_c0_mailbox0() | action);
> + else
> + write_c0_mailbox1(read_c0_mailbox1() | action);
> + back_to_back_c0_hazard();
> +}
> +
> +static void jz4780_send_ipi_single(int cpu, unsigned int action)
> +{
> + unsigned long flags;
> +
> + raw_spin_lock_irqsave(&smp_lock, flags);
> + jz4780_send_ipi_locked(cpu, action);
> + raw_spin_unlock_irqrestore(&smp_lock, flags);
> +}
> +
> +static void jz4780_send_ipi_mask(const struct cpumask *mask, unsigned =
int action)
> +{
> + unsigned long flags;
> + int cpu;
> +
> + raw_spin_lock_irqsave(&smp_lock, flags);
> + for_each_cpu(cpu, mask)
> + jz4780_send_ipi_locked(cpu, action);
> + raw_spin_unlock_irqrestore(&smp_lock, flags);
> +}
> +
> +static const struct plat_smp_ops jz4780_smp_ops =3D {
> + .send_ipi_single =3D jz4780_send_ipi_single,
> + .send_ipi_mask =3D jz4780_send_ipi_mask,
> + .init_secondary =3D jz4780_init_secondary,
> + .smp_finish =3D jz4780_smp_finish,
> + .boot_secondary =3D jz4780_boot_secondary,
> + .smp_setup =3D jz4780_smp_setup,
> + .prepare_cpus =3D jz4780_prepare_cpus,
> +};
> +
> +int __init register_ingenic_smp_ops(void)
> +{
> + if (!of_machine_is_compatible("ingenic,jz4780"))

This will restrict to jz4780 and leave out x2000, x2600 in the future.

But for the moment it seems to be ok.

> + return -ENODEV;
> +
> + register_smp_ops(&jz4780_smp_ops);
> + return 0;
> +}
> diff --git a/arch/mips/generic/ingenic-smp.h =
b/arch/mips/generic/ingenic-smp.h
> new file mode 100644
> index 000000000000..54191be8731a
> --- /dev/null
> +++ b/arch/mips/generic/ingenic-smp.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* Copyright (C) 2013 Paul Burton <paul.burton@imgtec.com> */
> +#ifndef __MIPS_GENERIC_INGENIC_SMP_H__
> +#define __MIPS_GENERIC_INGENIC_SMP_H__
> +
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/kconfig.h>
> +
> +#ifdef CONFIG_MIPS_INGENIC_SMP

is this needed if the only user is not compiled in case of undefined =
CONFIG_MIPS_INGENIC_SMP?

Makefile:
> +obj-$(CONFIG_MIPS_INGENIC_SMP) +=3D ingenic-smp.o ingenic-smp-entry.o

> +int __init register_ingenic_smp_ops(void);
> +void jz4780_secondary_cpu_entry(void);
> +#else
> +static inline int register_ingenic_smp_ops(void)
> +{
> + return -ENODEV;
> +}
> +#endif
> +
> +#endif /* __MIPS_GENERIC_INGENIC_SMP_H__ */
> diff --git a/arch/mips/generic/init.c b/arch/mips/generic/init.c
> index 1d712eac1617..00149bd1e9a9 100644
> --- a/arch/mips/generic/init.c
> +++ b/arch/mips/generic/init.c
> @@ -20,6 +20,8 @@
> #include <asm/smp-ops.h>
> #include <asm/time.h>
>=20
> +#include "ingenic-smp.h"
> +
> static __initconst const void *fdt;
> static __initconst const struct mips_machine *mach;
> static __initconst const void *mach_match_data;
> @@ -113,6 +115,8 @@ void __init device_tree_init(void)
> unflatten_and_copy_device_tree();
> mips_cpc_probe();
>=20
> + if (!register_ingenic_smp_ops())
> + return;
> if (!register_cps_smp_ops())
> return;
> if (!register_vsmp_smp_ops())
> diff --git a/arch/mips/ingenic/Kconfig b/arch/mips/ingenic/Kconfig
> index f595b339a4b8..1dfd0bfd0193 100644
> --- a/arch/mips/ingenic/Kconfig
> +++ b/arch/mips/ingenic/Kconfig
> @@ -64,6 +64,12 @@ config MACH_JZ4780
> select MIPS_CPU_SCACHE
> select SYS_HAS_CPU_MIPS32_R2
> select SYS_SUPPORTS_HIGHMEM
> + select SYS_SUPPORTS_SMP
> +
> +config MIPS_INGENIC_SMP
> + def_bool y
> + depends on MACH_JZ4780 && SMP
> + select SMP_UP

do we need this additional CONFIG option?
Ah, yes the inclusion of the code depends on it.

>=20
> config MACH_X1000
> bool
> diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
> index 80e8a04a642e..6cabdd4825a7 100644
> --- a/arch/mips/kernel/idle.c
> +++ b/arch/mips/kernel/idle.c
> @@ -18,6 +18,7 @@
> #include <asm/cpu-type.h>
> #include <asm/idle.h>
> #include <asm/mipsregs.h>
> +#include <asm/r4kcache.h>
>=20
> /*
>  * Not all of the MIPS CPUs have the "wait" instruction available. =
Moreover,
> @@ -71,6 +72,23 @@ static void __cpuidle rm7k_wait_irqoff(void)
> " .set pop \n");
> }
>=20
> +/* XBurst gates its private cache clock in WAIT; write back dirty =
data first. */
> +static void __cpuidle ingenic_smp_wait_irqoff(void)
> +{
> + unsigned long pending =3D read_c0_cause() & read_c0_status() & =
CAUSEF_IP;
> +
> + if (!need_resched() && !pending) {
> + r4k_blast_dcache();
> + __asm__ __volatile__(
> + ".set push\n"
> + ".set mips3\n"
> + "sync\n"
> + "wait\n"
> + ".set pop\n"
> + : : : "memory");
> + }
> +}
> +
> /*
>  * Au1 'wait' is only useful when the 32kHz counter is used as timer,
>  * since coreclock (and the cp0 counter) stops upon executing it. Only =
an
> @@ -156,10 +174,15 @@ void __init check_wait(void)
> case CPU_CAVIUM_OCTEON_PLUS:
> case CPU_CAVIUM_OCTEON2:
> case CPU_CAVIUM_OCTEON3:
> - case CPU_XBURST:
> case CPU_LOONGSON32:
> cpu_wait =3D r4k_wait;
> break;
> + case CPU_XBURST:
> + if (IS_ENABLED(CONFIG_SMP))
> + cpu_wait =3D ingenic_smp_wait_irqoff;
> + else
> + cpu_wait =3D r4k_wait;
> + break;
> case CPU_LOONGSON64:
> if ((c->processor_id & (PRID_IMP_MASK | PRID_REV_MASK)) >=3D
> (PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0) ||
> --=20
> 2.53.0
>=20

I just want to report that I wasn't able to bring up the second CPU:

[    0.108834] CPU 0 Unable to handle kernel paging request at virtual =
address 00000000, epc =3D=3D 00000000, ra =3D=3D 800239cc
[    0.119549] Oops[#1]:
[    0.121845] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted =
7.4.0-rc1-letux+ #8714 PREEMPT=20
[    0.130405] Hardware name: Imagination creator CI20
...
[    0.093381] [<8006fad4>] __cpu_up+0x24/0x98
[    0.097618] [<800891f4>] bringup_cpu+0x48/0x124
[    0.102209] [<800885c4>] __cpuhp_invoke_callback_range+0xb0/0x140
[    0.108387] [<800f359c>] __down_trylock_console_sem.isra.40+0x28/0x58
[    0.114925] [<80089480>] cpu_up.constprop.24+0x190/0x344
[    0.120307] [<800c1950>] try_to_wake_up+0xbc/0xae4
[    0.125166] [<80e0bc7c>] bringup_nonboot_cpus+0xa4/0x134
[    0.130553] [<80e13cec>] smp_init+0x30/0x80
[    0.134789] [<80e07028>] kernel_init_freeable+0x120/0x2e4
[    0.140266] [<80b6eb4c>] kernel_init+0x28/0x124
[    0.144853] [<80b6eb24>] kernel_init+0x0/0x124
[    0.061973] [<800616e4>] ret_from_kernel_thread+0x14/0x1c
[    0.067462]=20
[    0.068947] Code: (Bad address in epc)
[    0.068947]=20
[    0.075802] ---[ end trace 0000000000000000 ]---
[    0.080430] Kernel panic - not syncing: Fatal exception
[    0.085734] Rebooting in 10 seconds..
[    0.138377] Reboot failed -- System halted

If I disable CONFIG_SMP I can boot a single core.

The reason may be that we have other interfering private configs in our =
tree
and/or something else is missing.

But I remember that the original patches by Zhou Yanjie had once worked =
in 2020
on an older kernel release.

So at the moment I can't dig into all this deeper.

BR,
Nikolaus

