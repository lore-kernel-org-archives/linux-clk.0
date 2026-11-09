Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248940;
	b=HWaxCA4xiPiMRym0NGZDffMG5z7gVXfhkd6AV3VT7TPcmne+T/E6HOwrAmEXKFtJ0pv1
	 0+jNqvUJGpYW9FE13K0mhdGv0H5UVBvzNNT1EHfpCTKXHmzkvw88MDiyl3b6mbzMHb255
	 FFwQ2Oe5ytpd6yA2aRn8bSK/K9YWNpR7NmJXIb1apc+sM9ACwZICUzUqH0/qiaV+jGbU/
	 se5juocWHM0CtcT5IhIlDjAGkQrbhReHSFSs6ltAXha1Y87nRf/+1EKil9qt8EKnqKVfY
	 7aOZWkQHvpe1FIUJ33xl4oCKpxeCWhOjh71XdR7d63k4jvEEpxBkfZYtBXq9X+3w68g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9w0S8CsI9EhhlqLHYlJdHUn34HOfLLSbwkfkmUDEcT0=;
	b=jtJxKCVkquUGpM0/0T2obfM9tCh//RajvtiyaZRqEKSN3cVe5s7JvbWHyd+QADYV9h9J
	 28qmbIShbLpfwrNBoOzRDkhGyAFwe2wv/RTzt/8bqLNPCvMbIFGYzGVPxcts4eP3/PSo+
	 jEfsd1LHCzzMr6ytZBbFEiajmSfErwQcxfCjCA+JQkdAFoulsSJJbD/MihV5CwTlOM7DP
	 v3joMlx8fyRS7IwJfOi1q6iGJhXdz9VJvVVe0noUqjcmsX2BJ2TdxiG9p9Ej8fcfmDT/U
	 saaJJVLbJaIQwTgadY1EAhu/f9tc0wDprTqqYUQlFp6czYLbMcacHxHYk8RWrfLe1zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AlEBnYsj;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0283F607009D
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 18:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0283F607009D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AlEBnYsj
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91ec14f4369so12927546d6.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 10:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794248938; x=1794853738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9w0S8CsI9EhhlqLHYlJdHUn34HOfLLSbwkfkmUDEcT0=;
        b=AlEBnYsjS4cQ/ZCpakl4FK8wdHhmgl33YenUgAc5gNmBjh3fw10yeQV1m6rXIrMTZm
         6hLUZKz8VGhoG59lEi73vFlBryPYdTm6R1Mhy6zcS5NH7ZYrAOvijTth2T2LOy/Y1Edn
         W8ObT2BsaSLL/a8c6TLcSBDDQB3lrTg3X5FdB1tpy4FktjHlPdsCwfsQZh/yzejS3Ihl
         Hc7kcfVoZgvWoOJ002pm5uikvwlhFB+i/Ah1lKvSXWQqWwliIHWwk34Ne4QYBEfubxvI
         21ifdGnJKvGdNpTZgyDpGOFVmz4nx7CHha7NlCzr9ek+FGkmHxlUCuTYa5FD05QrO9Rd
         Mo2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248938; x=1794853738;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9w0S8CsI9EhhlqLHYlJdHUn34HOfLLSbwkfkmUDEcT0=;
        b=Le7T9KgOgfIqi80gvksIFeZPLjYD0lNcguTktkrsgAg+UUzdJ2FwbtGEqYXark8JdW
         gkabAmBKkuRFJ0tB7CHkUEs7nx1l2c9DOx0ikuL7PQOPKHoInuLJNzRDkvzayNOiCgCV
         jdno4dBJbcjznj3Kv0SKrEslGDUwo0Eb9QRtHblcZ2k/0J5ERLnVdGi43ugjlbpSiHXQ
         4jIg7O7BmdkXyQiX1jnxvvzeMQ4byK5y+A2cZhBpeU6y7TcRcNqZP9cEYNVq0kTVgp5s
         e0CUwghFUwCIqrzOX0f1OKwDkz+q47MpYOAOZvdAy5zdocxjCk3AM/FNBbKLJaKgzIG7
         5ejw==
X-Forwarded-Encrypted: i=1; AL+hErGVlPkkSJ+Zz6nfrnJ7yyE0RPscLo1TWnraNzqGg4vRUeL0vdIzPvPr4FDWbQ1ppEVDf+uDKbGgXQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Lra5KuQhkerhhPbslctyYa7vmXFiYNXH80OuhkW8fZi4jTTCH
	N8cME3WN6+UeE8eWKOKEO/R4np/9SI9g0jkIFebDLn8NebjLFWfBuy6s
X-Gm-Gg: AYBFou0uzjtl+Vnc6aBtSuhdkBaoYfjZqJUFlUdmNAR4vFAkUInCQRwEpyMwsiwnw4u
	3ksS1BokittwMZmwtqE3p8XuJxapZhMgvTe7jL6f1bmVVNoKwNHuAHIEkAGVuqvA4O4CoauRCH8
	VpGQBZwp76A3/lQ5nkksENhaavi5HSkiQcR/a5C0y9elI7UlZkJNAHkEAfhUI6ro6/lzTWcfgk6
	mC9Zjg7pg3Un5ENv9HRShrE3+SUg6hcqsDlAlf+bCUky/ep2FfLHDAVVFpRF3+Q+tL95KF3Qjlf
	TDwjLjGxQtAHSSOKMH+doQsXT3lnq6tLPniVe8TXpsTBfNAd+si3c3t3iculwgF9FPN9bTqeEwo
	IVrdhtsYdZHJNb1abV6WEqx8+xRf+/vd9Aolb6TvQyJYcAOPO9KYGTMWbIR4DJi/YE2LrMaLrgW
	D4KRCMoMAQ9COU5c2R8wE8e6rfneyiDhXjJ+uqx63Ac/3uM+RjCswPhR2MDJI6Q7LWUDXTX52SN
	vV8PGsWDsQCuqU2KFYkF77sXJHemdemE3EXxUPPcDIh2kvbr0XgXPBBLVQx2lAC222XpZTGCbVU
	fi964oh559U4OMfazmgITHzx1mPA8TJs+bUQFQ5o3XVfU3SmfrbJoq9dz5g1+vYtCgdUA0LpSgW
	g
X-Received: by 2002:a05:6214:3490:b0:91e:92b0:5828 with SMTP id 6a1803df08f44-91eef89eee1mr6841486d6.20.1794248937575;
        Mon, 09 Nov 2026 10:28:57 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04ce58dsm1981226d6.16.2026.11.09.10.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 10:28:56 -0800 (PST)
Message-ID: <0109c87b-b51b-4504-9c22-7f04ae278611@gmail.com>
Date: Mon, 9 Nov 2026 10:28:53 -0800
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] MIPS: Ingenic: Add JZ4780 SMP support to the generic
 platform
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: linux-mips@vger.kernel.org, =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?=
 <zhouyanjie@wanyeetech.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Paul Burton <paulburton@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 Paul Boddie <paul@boddie.org.uk>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
References: <20261105203243.2292647-1-f.fainelli@gmail.com>
 <20261105203243.2292647-3-f.fainelli@gmail.com>
 <FDBC55AE-EAB3-4C30-A148-99FA67B15B01@goldelico.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <FDBC55AE-EAB3-4C30-A148-99FA67B15B01@goldelico.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/6/26 06:36, H. Nikolaus Schaller wrote:
> Hi,
> 
>> Am 05.11.2026 um 21:32 schrieb Florian Fainelli <f.fainelli@gmail.com>:
>>
>> From: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>>
>> Port the JZ4780 reset-entry and CP0 mailbox implementation from Zhou
>> Yanjie's 2020 v8 series, based on Paul Burton's original CI20 SMP code.
>> The old arch/mips/jz4740 platform has moved into the generic MIPS code,
>> so register the Ingenic SMP operations after unflattening the device
>> tree and before selecting the generic fallback implementations.
>>
>> Reuse the upstream CPU clock gates, CPU device-tree nodes and per-CPU
>> TCU timers. Enumerate only available CPU nodes within the two-core
>> hardware limit. Prepare the CPU1 clock before boot, propagate clock
>> failures, serialize mailbox accesses with a raw spinlock and publish
>> bootstrap state before releasing the secondary core from reset. Align
>> the secondary reset entry to the REIM register's 64 KiB granularity.
>> Retain the UP fallback for other SoCs in a shared Ingenic kernel.
>>
>> Write back the private data cache before WAIT, since XBurst gates its
>> clock during idle and another core must not access dirty data in that
>> sleeping cache. Return with interrupts disabled as required by the
>> current idle API. Existing per-CPU TCU events make the old forced
>> broadcast-timer workaround unnecessary.
>>
>> This adaptation incorporates the CPU-enumeration review feedback and
>> removes the old unused CPU mask. Preserve the original source credits;
>> historical Tested-by and Reviewed-by tags are not carried to this
>> substantially changed port. Adaptation and validation used Codex
>> assistance.
>>
>> Link: https://lkml.iu.edu/hypermail/linux/kernel/2005.2/03488.html
>> Link: https://lists.openwall.net/linux-kernel/2020/05/13/1482
>> Link: https://lists.openwall.net/linux-kernel/2020/05/19/1099
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> [florian: forward ported to latest version]
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>> MAINTAINERS                           |   1 +
>> arch/mips/generic/Makefile            |   1 +
>> arch/mips/generic/ingenic-smp-entry.S |  54 ++++++
>> arch/mips/generic/ingenic-smp.c       | 240 ++++++++++++++++++++++++++
>> arch/mips/generic/ingenic-smp.h       |  20 +++
>> arch/mips/generic/init.c              |   4 +
>> arch/mips/ingenic/Kconfig             |   6 +
>> arch/mips/kernel/idle.c               |  25 ++-
>> 8 files changed, 350 insertions(+), 1 deletion(-)
>> create mode 100644 arch/mips/generic/ingenic-smp-entry.S
>> create mode 100644 arch/mips/generic/ingenic-smp.c
>> create mode 100644 arch/mips/generic/ingenic-smp.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 09713dc4c6a7..101027579ccd 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -13117,6 +13117,7 @@ L: linux-mips@vger.kernel.org
>> S: Maintained
>> F: arch/mips/boot/dts/ingenic/
>> F: arch/mips/generic/board-ingenic.c
>> +F: arch/mips/generic/ingenic-smp*
>> F: arch/mips/include/asm/mach-ingenic/
>> F: arch/mips/ingenic/Kconfig
>> F: drivers/clk/ingenic/
>> diff --git a/arch/mips/generic/Makefile b/arch/mips/generic/Makefile
>> index ea0e4ad5e600..df92650c0f15 100644
>> --- a/arch/mips/generic/Makefile
>> +++ b/arch/mips/generic/Makefile
>> @@ -12,5 +12,6 @@ obj-$(CONFIG_YAMON_DT_SHIM) += yamon-dt.o
>> obj-$(CONFIG_LEGACY_BOARD_SEAD3) += board-sead3.o
>> obj-$(CONFIG_LEGACY_BOARD_OCELOT) += board-ocelot.o
>> obj-$(CONFIG_MACH_INGENIC) += board-ingenic.o
>> +obj-$(CONFIG_MIPS_INGENIC_SMP) += ingenic-smp.o ingenic-smp-entry.o
>> obj-$(CONFIG_VIRT_BOARD_RANCHU) += board-ranchu.o
>> obj-$(CONFIG_MACH_REALTEK_RTL) += board-realtek.o
>> diff --git a/arch/mips/generic/ingenic-smp-entry.S b/arch/mips/generic/ingenic-smp-entry.S
>> new file mode 100644
>> index 000000000000..828df4687e84
>> --- /dev/null
>> +++ b/arch/mips/generic/ingenic-smp-entry.S
>> @@ -0,0 +1,54 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright (C) 2013 Paul Burton <paul.burton@imgtec.com>
>> + * JZ4780 secondary CPU reset entry
>> + */
>> +
>> +#include <asm/addrspace.h>
>> +#include <asm/asm.h>
>> +#include <asm/asmmacro.h>
>> +#include <asm/cacheops.h>
>> +#include <asm/mipsregs.h>
>> +
>> +#define CACHE_SIZE (32 * 1024)
>> +#define CACHE_LINESIZE 32
>> +
>> + /* The CP0 REIM register only stores the upper 16 address bits. */
>> + .section .text.smp-entry, "ax"
>> + .balign 0x10000
>> + .set noreorder
>> +LEAF(jz4780_secondary_cpu_entry)
>> + mtc0 zero, CP0_CAUSE
>> + li t0, ST0_CU0
>> + mtc0 t0, CP0_STATUS
>> + ehb
>> +
>> + /* Invalidate both private caches before entering cached code. */
>> + li t0, KSEG0
>> + ori t1, t0, CACHE_SIZE
>> + mtc0 zero, CP0_TAGLO
>> + ehb
>> +1: cache Index_Store_Tag_I, 0(t0)
>> + cache Index_Store_Tag_D, 0(t0)
>> + addiu t0, t0, CACHE_LINESIZE
>> + bne t0, t1, 1b
>> + nop
>> +
>> + mfc0 t0, CP0_CONFIG
>> + li t1, ~CONF_CM_CMASK
>> + and t0, t0, t1
>> + ori t0, t0, CONF_CM_CACHABLE_NONCOHERENT
>> + mtc0 t0, CP0_CONFIG
>> + mtc0 zero, CP0_PAGEMASK
>> + ehb
>> +
>> + /* CPU0 publishes these in RAM before releasing CPU1 from reset. */
>> + la t0, jz4780_cpu_entry_sp
>> + lw sp, 0(t0)
>> + la t0, jz4780_cpu_entry_gp
>> + lw gp, 0(t0)
>> +
>> + la t0, smp_bootstrap
>> + jr t0
>> + nop
>> +END(jz4780_secondary_cpu_entry)
>> diff --git a/arch/mips/generic/ingenic-smp.c b/arch/mips/generic/ingenic-smp.c
>> new file mode 100644
>> index 000000000000..98c1fd7483db
>> --- /dev/null
>> +++ b/arch/mips/generic/ingenic-smp.c
>> @@ -0,0 +1,240 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * JZ4780 SMP support, based on Paul Burton's CI20 implementation and
>> + * Zhou Yanjie's 2020 JZ4780 SMP series.
>> + * Copyright (C) 2013 Paul Burton <paul.burton@imgtec.com>
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/cpu.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/of.h>
>> +#include <linux/of_clk.h>
>> +#include <linux/sched/task_stack.h>
>> +#include <linux/smp.h>
>> +
>> +#include <asm/addrspace.h>
>> +#include <asm/irq_cpu.h>
>> +#include <asm/mipsregs.h>
>> +#include <asm/r4kcache.h>
>> +#include <asm/smp-ops.h>
>> +
>> +#include "ingenic-smp.h"
>> +
>> +#define read_c0_corectrl() __read_32bit_c0_register($12, 2)
>> +#define write_c0_corectrl(val) __write_32bit_c0_register($12, 2, val)
>> +#define read_c0_corestatus() __read_32bit_c0_register($12, 3)
>> +#define write_c0_corestatus(val) __write_32bit_c0_register($12, 3, val)
>> +#define read_c0_reim() __read_32bit_c0_register($12, 4)
>> +#define write_c0_reim(val) __write_32bit_c0_register($12, 4, val)
>> +#define read_c0_mailbox0() __read_32bit_c0_register($20, 0)
>> +#define write_c0_mailbox0(val) __write_32bit_c0_register($20, 0, val)
>> +#define read_c0_mailbox1() __read_32bit_c0_register($20, 1)
>> +#define write_c0_mailbox1(val) __write_32bit_c0_register($20, 1, val)
>> +
>> +#define JZ4780_NR_CPUS 2
>> +#define JZ4780_MBOX_IRQ (MIPS_CPU_IRQ_BASE + 3)
>> +#define CORECTRL_SWRST(cpu) BIT(cpu)
>> +#define CORECTRL_RPC(cpu) BIT(8 + (cpu))
>> +#define CORESTATUS_MIRQ(cpu) BIT(cpu)
>> +#define REIM_ENTRY GENMASK(31, 16)
>> +#define REIM_MBOXIRQ(cpu) BIT(cpu)
>> +
>> +static struct clk *cpu1_clock;
>> +static DEFINE_RAW_SPINLOCK(smp_lock);
>> +
>> +/* Referenced by the uncached secondary CPU reset entry. */
>> +unsigned long jz4780_cpu_entry_sp;
>> +unsigned long jz4780_cpu_entry_gp;
>> +
>> +static irqreturn_t jz4780_mbox_interrupt(int irq, void *dev_id)
>> +{
>> + unsigned int cpu = cpu_logical_map(smp_processor_id());
>> + u32 action, status;
>> +
>> + raw_spin_lock(&smp_lock);
>> + if (cpu == 0) {
>> + action = read_c0_mailbox0();
>> + write_c0_mailbox0(0);
>> + } else {
>> + action = read_c0_mailbox1();
>> + write_c0_mailbox1(0);
>> + }
>> +
>> + status = read_c0_corestatus();
>> + write_c0_corestatus(status & ~CORESTATUS_MIRQ(cpu));
>> + irq_disable_hazard();
>> + raw_spin_unlock(&smp_lock);
>> +
>> + if (action & SMP_RESCHEDULE_YOURSELF)
>> + scheduler_ipi();
>> + if (action & SMP_CALL_FUNCTION)
>> + generic_smp_call_function_interrupt();
>> +
>> + return IRQ_HANDLED;
>> +}
>> +
>> +static void __init jz4780_smp_setup(void)
>> +{
>> + struct device_node *np;
>> + u32 entry, reim;
>> + u64 hwid;
>> +
>> + for_each_of_cpu_node(np) {
>> + hwid = of_get_cpu_hwid(np, 0);
>> + if (hwid >= nr_cpu_ids || hwid >= JZ4780_NR_CPUS ||
>> +    !of_device_is_available(np))
>> + continue;
>> + __cpu_number_map[hwid] = hwid;
>> + __cpu_logical_map[hwid] = hwid;
>> + set_cpu_possible(hwid, true);
>> + }
>> +
>> + /* Program the shared reset vector with mailbox delivery masked. */
>> + reim = read_c0_reim();
>> + reim &= ~(REIM_MBOXIRQ(0) | REIM_MBOXIRQ(1));
>> + write_c0_reim(reim);
>> + write_c0_mailbox0(0);
>> + write_c0_mailbox1(0);
>> + write_c0_corestatus(0);
>> +
>> + entry = KSEG1ADDR((unsigned long)jz4780_secondary_cpu_entry);
>> + write_c0_reim((reim & ~REIM_ENTRY) | (entry & REIM_ENTRY));
>> +}
>> +
>> +static void __init jz4780_prepare_cpus(unsigned int max_cpus)
>> +{
>> + struct device_node *np;
>> + u32 reim;
>> + int ret;
>> +
>> + ret = request_irq(JZ4780_MBOX_IRQ, jz4780_mbox_interrupt,
>> +  IRQF_PERCPU | IRQF_NO_THREAD, "core mailbox", NULL);
>> + if (ret)
>> + panic("JZ4780: cannot request mailbox IRQ: %d", ret);
>> +
>> + reim = read_c0_reim();
>> + write_c0_reim(reim | REIM_MBOXIRQ(0));
>> + set_c0_status(STATUSF_IP3);
>> + irq_enable_hazard();
>> +
>> + if (!cpu_possible(1))
>> + return;
>> +
>> + np = of_get_cpu_node(1, NULL);
>> + cpu1_clock = of_clk_get(np, 0);
>> + of_node_put(np);
>> + if (IS_ERR(cpu1_clock)) {
>> + pr_err("JZ4780: cannot get CPU1 clock: %ld\n",
>> +       PTR_ERR(cpu1_clock));
>> + return;
>> + }
>> +
>> + ret = clk_prepare(cpu1_clock);
>> + if (ret) {
>> + clk_put(cpu1_clock);
>> + cpu1_clock = ERR_PTR(ret);
>> + pr_err("JZ4780: cannot prepare CPU1 clock: %d\n", ret);
>> + }
>> +}
>> +
>> +static int jz4780_boot_secondary(int cpu, struct task_struct *idle)
>> +{
>> + unsigned long flags;
>> + u32 ctrl;
>> + int ret;
>> +
>> + if (cpu_logical_map(cpu) != 1 || IS_ERR_OR_NULL(cpu1_clock))
>> + return -ENODEV;
>> +
>> + raw_spin_lock_irqsave(&smp_lock, flags);
>> + ctrl = read_c0_corectrl() | CORECTRL_SWRST(1) | CORECTRL_RPC(1);
>> + write_c0_corectrl(ctrl);
>> + back_to_back_c0_hazard();
>> +
>> + ret = clk_enable(cpu1_clock);
>> + if (ret)
>> + goto unlock;
>> +
>> + jz4780_cpu_entry_sp = __KSTK_TOS(idle);
>> + jz4780_cpu_entry_gp = (unsigned long)task_thread_info(idle);
>> + /* Publish bootstrap state before CPU1 starts using its private cache. */
>> + r4k_blast_dcache();
>> + /* Complete cache writeback before releasing reset. */
>> + mb();
>> + write_c0_corectrl(ctrl & ~CORECTRL_SWRST(1));
>> + back_to_back_c0_hazard();
>> +unlock:
>> + raw_spin_unlock_irqrestore(&smp_lock, flags);
>> + return ret;
>> +}
>> +
>> +static void jz4780_init_secondary(void)
>> +{
>> + clear_c0_status(ST0_IM);
>> + irq_disable_hazard();
>> +}
>> +
>> +static void jz4780_smp_finish(void)
>> +{
>> + unsigned int cpu = cpu_logical_map(smp_processor_id());
>> + u32 reim;
>> +
>> + raw_spin_lock(&smp_lock);
>> + reim = read_c0_reim();
>> + write_c0_reim(reim | REIM_MBOXIRQ(cpu));
>> + raw_spin_unlock(&smp_lock);
>> +
>> + change_c0_status(ST0_IM, STATUSF_IP3 | STATUSF_IP2 |
>> + STATUSF_IP1 | STATUSF_IP0);
>> + irq_enable_hazard();
>> + local_irq_enable();
>> +}
>> +
>> +static void jz4780_send_ipi_locked(int cpu, unsigned int action)
>> +{
>> + if (cpu_logical_map(cpu) == 0)
>> + write_c0_mailbox0(read_c0_mailbox0() | action);
>> + else
>> + write_c0_mailbox1(read_c0_mailbox1() | action);
>> + back_to_back_c0_hazard();
>> +}
>> +
>> +static void jz4780_send_ipi_single(int cpu, unsigned int action)
>> +{
>> + unsigned long flags;
>> +
>> + raw_spin_lock_irqsave(&smp_lock, flags);
>> + jz4780_send_ipi_locked(cpu, action);
>> + raw_spin_unlock_irqrestore(&smp_lock, flags);
>> +}
>> +
>> +static void jz4780_send_ipi_mask(const struct cpumask *mask, unsigned int action)
>> +{
>> + unsigned long flags;
>> + int cpu;
>> +
>> + raw_spin_lock_irqsave(&smp_lock, flags);
>> + for_each_cpu(cpu, mask)
>> + jz4780_send_ipi_locked(cpu, action);
>> + raw_spin_unlock_irqrestore(&smp_lock, flags);
>> +}
>> +
>> +static const struct plat_smp_ops jz4780_smp_ops = {
>> + .send_ipi_single = jz4780_send_ipi_single,
>> + .send_ipi_mask = jz4780_send_ipi_mask,
>> + .init_secondary = jz4780_init_secondary,
>> + .smp_finish = jz4780_smp_finish,
>> + .boot_secondary = jz4780_boot_secondary,
>> + .smp_setup = jz4780_smp_setup,
>> + .prepare_cpus = jz4780_prepare_cpus,
>> +};
>> +
>> +int __init register_ingenic_smp_ops(void)
>> +{
>> + if (!of_machine_is_compatible("ingenic,jz4780"))
> 
> This will restrict to jz4780 and leave out x2000, x2600 in the future.
> 
> But for the moment it seems to be ok.
> 
>> + return -ENODEV;
>> +
>> + register_smp_ops(&jz4780_smp_ops);
>> + return 0;
>> +}
>> diff --git a/arch/mips/generic/ingenic-smp.h b/arch/mips/generic/ingenic-smp.h
>> new file mode 100644
>> index 000000000000..54191be8731a
>> --- /dev/null
>> +++ b/arch/mips/generic/ingenic-smp.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/* Copyright (C) 2013 Paul Burton <paul.burton@imgtec.com> */
>> +#ifndef __MIPS_GENERIC_INGENIC_SMP_H__
>> +#define __MIPS_GENERIC_INGENIC_SMP_H__
>> +
>> +#include <linux/errno.h>
>> +#include <linux/init.h>
>> +#include <linux/kconfig.h>
>> +
>> +#ifdef CONFIG_MIPS_INGENIC_SMP
> 
> is this needed if the only user is not compiled in case of undefined CONFIG_MIPS_INGENIC_SMP?
> 
> Makefile:
>> +obj-$(CONFIG_MIPS_INGENIC_SMP) += ingenic-smp.o ingenic-smp-entry.o
> 
>> +int __init register_ingenic_smp_ops(void);
>> +void jz4780_secondary_cpu_entry(void);
>> +#else
>> +static inline int register_ingenic_smp_ops(void)
>> +{
>> + return -ENODEV;
>> +}
>> +#endif
>> +
>> +#endif /* __MIPS_GENERIC_INGENIC_SMP_H__ */
>> diff --git a/arch/mips/generic/init.c b/arch/mips/generic/init.c
>> index 1d712eac1617..00149bd1e9a9 100644
>> --- a/arch/mips/generic/init.c
>> +++ b/arch/mips/generic/init.c
>> @@ -20,6 +20,8 @@
>> #include <asm/smp-ops.h>
>> #include <asm/time.h>
>>
>> +#include "ingenic-smp.h"
>> +
>> static __initconst const void *fdt;
>> static __initconst const struct mips_machine *mach;
>> static __initconst const void *mach_match_data;
>> @@ -113,6 +115,8 @@ void __init device_tree_init(void)
>> unflatten_and_copy_device_tree();
>> mips_cpc_probe();
>>
>> + if (!register_ingenic_smp_ops())
>> + return;
>> if (!register_cps_smp_ops())
>> return;
>> if (!register_vsmp_smp_ops())
>> diff --git a/arch/mips/ingenic/Kconfig b/arch/mips/ingenic/Kconfig
>> index f595b339a4b8..1dfd0bfd0193 100644
>> --- a/arch/mips/ingenic/Kconfig
>> +++ b/arch/mips/ingenic/Kconfig
>> @@ -64,6 +64,12 @@ config MACH_JZ4780
>> select MIPS_CPU_SCACHE
>> select SYS_HAS_CPU_MIPS32_R2
>> select SYS_SUPPORTS_HIGHMEM
>> + select SYS_SUPPORTS_SMP
>> +
>> +config MIPS_INGENIC_SMP
>> + def_bool y
>> + depends on MACH_JZ4780 && SMP
>> + select SMP_UP
> 
> do we need this additional CONFIG option?
> Ah, yes the inclusion of the code depends on it.
> 
>>
>> config MACH_X1000
>> bool
>> diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
>> index 80e8a04a642e..6cabdd4825a7 100644
>> --- a/arch/mips/kernel/idle.c
>> +++ b/arch/mips/kernel/idle.c
>> @@ -18,6 +18,7 @@
>> #include <asm/cpu-type.h>
>> #include <asm/idle.h>
>> #include <asm/mipsregs.h>
>> +#include <asm/r4kcache.h>
>>
>> /*
>>   * Not all of the MIPS CPUs have the "wait" instruction available. Moreover,
>> @@ -71,6 +72,23 @@ static void __cpuidle rm7k_wait_irqoff(void)
>> " .set pop \n");
>> }
>>
>> +/* XBurst gates its private cache clock in WAIT; write back dirty data first. */
>> +static void __cpuidle ingenic_smp_wait_irqoff(void)
>> +{
>> + unsigned long pending = read_c0_cause() & read_c0_status() & CAUSEF_IP;
>> +
>> + if (!need_resched() && !pending) {
>> + r4k_blast_dcache();
>> + __asm__ __volatile__(
>> + ".set push\n"
>> + ".set mips3\n"
>> + "sync\n"
>> + "wait\n"
>> + ".set pop\n"
>> + : : : "memory");
>> + }
>> +}
>> +
>> /*
>>   * Au1 'wait' is only useful when the 32kHz counter is used as timer,
>>   * since coreclock (and the cp0 counter) stops upon executing it. Only an
>> @@ -156,10 +174,15 @@ void __init check_wait(void)
>> case CPU_CAVIUM_OCTEON_PLUS:
>> case CPU_CAVIUM_OCTEON2:
>> case CPU_CAVIUM_OCTEON3:
>> - case CPU_XBURST:
>> case CPU_LOONGSON32:
>> cpu_wait = r4k_wait;
>> break;
>> + case CPU_XBURST:
>> + if (IS_ENABLED(CONFIG_SMP))
>> + cpu_wait = ingenic_smp_wait_irqoff;
>> + else
>> + cpu_wait = r4k_wait;
>> + break;
>> case CPU_LOONGSON64:
>> if ((c->processor_id & (PRID_IMP_MASK | PRID_REV_MASK)) >=
>> (PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0) ||
>> -- 
>> 2.53.0
>>
> 
> I just want to report that I wasn't able to bring up the second CPU:
> 
> [    0.108834] CPU 0 Unable to handle kernel paging request at virtual address 00000000, epc == 00000000, ra == 800239cc
> [    0.119549] Oops[#1]:
> [    0.121845] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.4.0-rc1-letux+ #8714 PREEMPT
> [    0.130405] Hardware name: Imagination creator CI20
> ...
> [    0.093381] [<8006fad4>] __cpu_up+0x24/0x98
> [    0.097618] [<800891f4>] bringup_cpu+0x48/0x124
> [    0.102209] [<800885c4>] __cpuhp_invoke_callback_range+0xb0/0x140
> [    0.108387] [<800f359c>] __down_trylock_console_sem.isra.40+0x28/0x58
> [    0.114925] [<80089480>] cpu_up.constprop.24+0x190/0x344
> [    0.120307] [<800c1950>] try_to_wake_up+0xbc/0xae4
> [    0.125166] [<80e0bc7c>] bringup_nonboot_cpus+0xa4/0x134
> [    0.130553] [<80e13cec>] smp_init+0x30/0x80
> [    0.134789] [<80e07028>] kernel_init_freeable+0x120/0x2e4
> [    0.140266] [<80b6eb4c>] kernel_init+0x28/0x124
> [    0.144853] [<80b6eb24>] kernel_init+0x0/0x124
> [    0.061973] [<800616e4>] ret_from_kernel_thread+0x14/0x1c
> [    0.067462]
> [    0.068947] Code: (Bad address in epc)
> [    0.068947]
> [    0.075802] ---[ end trace 0000000000000000 ]---
> [    0.080430] Kernel panic - not syncing: Fatal exception
> [    0.085734] Rebooting in 10 seconds..
> [    0.138377] Reboot failed -- System halted
> 
> If I disable CONFIG_SMP I can boot a single core.
> 
> The reason may be that we have other interfering private configs in our tree
> and/or something else is missing.
> 
> But I remember that the original patches by Zhou Yanjie had once worked in 2020
> on an older kernel release.
> 
> So at the moment I can't dig into all this deeper.

Would you be able to help me track this down with:

  mipsel-linux-addr2line -fip -e vmlinux 0x800239cc
   mipsel-linux-objdump -drS \
       --start-address=0x800239a0 \
       --stop-address=0x800239e0 vmlinux

on your kernel? Thanks!
-- 
Florian
