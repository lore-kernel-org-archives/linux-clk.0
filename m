Return-Path: <Marcin.Nowakowski@imgtec.com>
Subject: Re: [PATCH v2 15/17] MIPS: JZ4770: Workaround for corrupted DMA
 transfers
To: Paul Cercueil <paul@crapouillou.net>, Ralf Baechle <ralf@linux-mips.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
CC: Paul Burton <paul.burton@imgtec.com>, Maarten ter Huurne
	<maarten@treewalker.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mips@linux-mips.org>,
	<linux-clk@vger.kernel.org>
References: <20170607200439.24450-2-paul@crapouillou.net>
 <20170620151855.19399-1-paul@crapouillou.net>
 <20170620151855.19399-15-paul@crapouillou.net>
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Message-ID: <ca37b50d-951c-2264-fa37-cca7149ed4ba@imgtec.com>
Date: Thu, 22 Jun 2017 09:21:02 +0200
MIME-Version: 1.0
In-Reply-To: <20170620151855.19399-15-paul@crapouillou.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Paul, Maarten,

On 20.06.2017 17:18, Paul Cercueil wrote:
> From: Maarten ter Huurne <maarten@treewalker.org>
> 
> We have seen MMC DMA transfers read corrupted data from SDRAM when
> a burst interval ends at physical address 0x10000000. To avoid this
> problem, we remove the final page of low memory from the memory map.
> 
> Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
> ---
>   arch/mips/jz4740/setup.c | 24 ++++++++++++++++++++++++
>   arch/mips/kernel/setup.c |  8 ++++++++
>   2 files changed, 32 insertions(+)
> 
>   v2: No change
> 
> diff --git a/arch/mips/jz4740/setup.c b/arch/mips/jz4740/setup.c
> index afd84ee966e8..6948b133a15d 100644
> --- a/arch/mips/jz4740/setup.c
> +++ b/arch/mips/jz4740/setup.c
> @@ -23,6 +23,7 @@
>   
>   #include <asm/bootinfo.h>
>   #include <asm/mips_machine.h>
> +#include <asm/page.h>
>   #include <asm/prom.h>
>   
>   #include <asm/mach-jz4740/base.h>
> @@ -102,6 +103,29 @@ void __init arch_init_irq(void)
>   	irqchip_init();
>   }
>   
> +/*
> + * We have seen MMC DMA transfers read corrupted data from SDRAM when a burst
> + * interval ends at physical address 0x10000000. To avoid this problem, we
> + * remove the final page of low memory from the memory map.
> + */
> +void __init jz4770_reserve_unsafe_for_dma(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < boot_mem_map.nr_map; i++) {
> +		struct boot_mem_map_entry *entry = boot_mem_map.map + i;
> +
> +		if (entry->type != BOOT_MEM_RAM)
> +			continue;
> +
> +		if (entry->addr + entry->size != 0x10000000)
> +			continue;
> +
> +		entry->size -= PAGE_SIZE;
> +		break;
> +	}
> +}
> +
>   static int __init jz4740_machine_setup(void)
>   {
>   	mips_machine_setup();
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 89785600fde4..cccfd7ba89fe 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -838,6 +838,14 @@ static void __init arch_mem_init(char **cmdline_p)
>   
>   	parse_early_param();
>   
> +#ifdef CONFIG_MACH_JZ4770
> +	if (current_cpu_type() == CPU_JZRISC &&
> +				mips_machtype == MACH_INGENIC_JZ4770) {
> +		extern void __init jz4770_reserve_unsafe_for_dma(void);
> +		jz4770_reserve_unsafe_for_dma();
> +	}
> +#endif
> +

This part doesn't look good in the platform-agnostic code ... is there a 
reason why you wouldn't do that from within plat_mem_setup()?


>   	if (usermem) {
>   		pr_info("User-defined physical RAM map:\n");
>   		print_memory_map();
> 


Marcin
