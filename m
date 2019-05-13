Return-Path: <SRS0=NIgS=TN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9FDC04AA7
	for <linux-clk@archiver.kernel.org>; Mon, 13 May 2019 16:55:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 546F42086A
	for <linux-clk@archiver.kernel.org>; Mon, 13 May 2019 16:55:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qFd2ZmaD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730704AbfEMQz3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 May 2019 12:55:29 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39362 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729086AbfEMQz2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 May 2019 12:55:28 -0400
Received: by mail-lj1-f194.google.com with SMTP id a10so3675902ljf.6;
        Mon, 13 May 2019 09:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=awkNkzZud3H6w/QPFNwoXlVwipwx8nPaB7AYS6TCMZg=;
        b=qFd2ZmaD1Wt3RIoJ0kmcgmEt/XzcjvR2xETGwxxAUrp25E4651/WsxBaXpVj4MGcSP
         OsOyoiBCFAvESyVQ/lWdoJneOQpcCNLvt6ofTEGLsUfaqQ1W1uQtMiLnYfqgEk2GY7CG
         sWPa31aRR9bSSYcqXtjuqS9/5iSaNUGYvAB24TlvafXn55WLkT7drHMMqecUOOmJdhnC
         CU798l+BVwC1nNc5hoUxvnokXAe+8HqzpE5rpjGhzHMmxWPgKErNjyIPfqhLtifEJ4dv
         dI0OLSPjAsrok+DQfTaEdBZZ46Yl9njb9/azLts6/GZU5uC7llAs5IuyGqBdY+Co+zi/
         1lIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=awkNkzZud3H6w/QPFNwoXlVwipwx8nPaB7AYS6TCMZg=;
        b=b68cGe882CxeOZtsx0IyEHgaAPAj6uwhCmOjVmfOmkffv2GFvCtFudtOyyk/z1fubr
         LxbhsLYwYPuF9XArxDNiCN8JWgDciS25yODYFrkTPoBHF3rvvLYLEDdc4mdxxjb2F1Cq
         cmIRrVXZ2bn7NilVD38a7n/c8K7gfzZWyyL/5oZPJR/m4qMKa1SloQ3/ejTBcEiLdUs7
         8nQT1Qp9IOZD8spIjCXE5UI2tXj62SCPBho57hvjIoooFVSzK9GmX5BKoWOTBTp4mOFz
         yTRzrI65ZCG414ErjR442RONyv4VpdZFz2usaqpbKtgGqLl4PcVJ4vI/b5lnTkEmaFOo
         jmTQ==
X-Gm-Message-State: APjAAAUG/doxAjCR1F+1pcRU3v98wuj8zfIEJr5BwF1FM0hHXsG8On0t
        m/8s/pSMIHJcwboVytclyIQ=
X-Google-Smtp-Source: APXvYqyDG5ptmWycto3EF+kczfrOfl36e8JLsYUkwuStWfBOVEgBhe+DNEAz/CHyRrLlNUIAWS2M7Q==
X-Received: by 2002:a2e:4701:: with SMTP id u1mr9798745lja.38.1557766524594;
        Mon, 13 May 2019 09:55:24 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
        by smtp.googlemail.com with ESMTPSA id y19sm3282772lfl.40.2019.05.13.09.55.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 09:55:23 -0700 (PDT)
Subject: Re: [PATCH V3 4/8] memory: tegra: Add Tegra210 EMC clock driver
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20190510084719.18902-1-josephl@nvidia.com>
 <20190510084719.18902-5-josephl@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <50d5719c-63fb-279b-cf8a-388010e7bdb3@gmail.com>
Date:   Mon, 13 May 2019 19:54:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510084719.18902-5-josephl@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

10.05.2019 11:47, Joseph Lo пишет:
> This is the initial patch for Tegra210 EMC clock driver, which doesn't
> include the support code and detail sequence for clock scaling yet.
> 
> The driver is designed to support LPDDR4 SDRAM. Because of the LPDDR4
> devices need to do initial time training before it can be used, the
> firmware will help to do that at early boot stage. Then, the trained
> table for the rates we support will pass to the kernel via DT. So the
> driver can get the trained table for clock scaling support.
> 
> For the higher rate support (above 800MHz), the periodic training is
> needed for the timing compensation. So basically, two methodologies for
> clock scaling are supported, one is following the clock changing
> sequence to update the EMC table to EMC registers and another is if the
> rate needs periodic training, then we will start a timer to do that
> periodically until it scales to the lower rate.
> 
> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> v3:
> - address almost all the comments from the previous version
> - remove the DT parser of EMC table
> - The EMC table is passing as a binary blob now.
> ---
>  drivers/memory/tegra/Kconfig        |  10 +
>  drivers/memory/tegra/Makefile       |   1 +
>  drivers/memory/tegra/tegra210-emc.c | 749 ++++++++++++++++++++++++++++
>  drivers/memory/tegra/tegra210-emc.h | 158 ++++++
>  4 files changed, 918 insertions(+)
>  create mode 100644 drivers/memory/tegra/tegra210-emc.c
>  create mode 100644 drivers/memory/tegra/tegra210-emc.h
> 
> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
> index 34e0b70f5c5f..614e9b370183 100644
> --- a/drivers/memory/tegra/Kconfig
> +++ b/drivers/memory/tegra/Kconfig
> @@ -25,3 +25,13 @@ config TEGRA124_EMC
>  	  Tegra124 chips. The EMC controls the external DRAM on the board.
>  	  This driver is required to change memory timings / clock rate for
>  	  external memory.
> +
> +config TEGRA210_EMC
> +	bool "NVIDIA Tegra210 External Memory Controller driver"
> +	default y
> +	depends on TEGRA_MC && ARCH_TEGRA_210_SOC
> +	help
> +	  This driver is for the External Memory Controller (EMC) found on
> +	  Tegra210 chips. The EMC controls the external DRAM on the board.
> +	  This driver is required to change memory timings / clock rate for
> +	  external memory.
> diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
> index 3971a6b7c487..f78bbb7cd16f 100644
> --- a/drivers/memory/tegra/Makefile
> +++ b/drivers/memory/tegra/Makefile
> @@ -12,4 +12,5 @@ obj-$(CONFIG_TEGRA_MC) += tegra-mc.o
>  
>  obj-$(CONFIG_TEGRA20_EMC)  += tegra20-emc.o
>  obj-$(CONFIG_TEGRA124_EMC) += tegra124-emc.o
> +obj-$(CONFIG_TEGRA210_EMC) += tegra210-emc.o
>  obj-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186.o
> diff --git a/drivers/memory/tegra/tegra210-emc.c b/drivers/memory/tegra/tegra210-emc.c
> new file mode 100644
> index 000000000000..f0471ca7062d
> --- /dev/null
> +++ b/drivers/memory/tegra/tegra210-emc.c
> @@ -0,0 +1,749 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2015-2019, NVIDIA CORPORATION.  All rights reserved.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk/tegra.h>
> +#include <linux/clk-provider.h>
> +#include <linux/debugfs.h>
> +#include <linux/delay.h>
> +#include <linux/kernel.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <soc/tegra/fuse.h>
> +#include <soc/tegra/mc.h>
> +
> +#include "mc.h"
> +#include "tegra210-emc.h"
> +
> +#define CLK_RST_CONTROLLER_CLK_SOURCE_EMC		0x19c
> +#define EMC_CLK_EMC_2X_CLK_SRC_SHIFT			29
> +#define EMC_CLK_EMC_2X_CLK_SRC_MASK			\
> +	(0x7 << EMC_CLK_EMC_2X_CLK_SRC_SHIFT)
> +#define EMC_CLK_MC_EMC_SAME_FREQ			BIT(16)
> +#define EMC_CLK_EMC_2X_CLK_DIVISOR_SHIFT		0
> +#define EMC_CLK_EMC_2X_CLK_DIVISOR_MASK			\
> +	(0xff << EMC_CLK_EMC_2X_CLK_DIVISOR_SHIFT)
> +
> +#define MC_EMEM_ARB_MISC0_EMC_SAME_FREQ			BIT(27)
> +
> +#define TEGRA_EMC_MAX_FREQS		16
> +#define TEGRA210_EMC_SUSPEND_RATE	204000000
> +
> +#define CLK_CHANGE_DELAY 100
> +#define TRAINING_TIME 100
> +
> +enum {
> +	TEGRA_EMC_SRC_PLLM,
> +	TEGRA_EMC_SRC_PLLC,
> +	TEGRA_EMC_SRC_PLLP,
> +	TEGRA_EMC_SRC_CLKM,
> +	TEGRA_EMC_SRC_PLLM_UD,
> +	TEGRA_EMC_SRC_PLLMB_UD,
> +	TEGRA_EMC_SRC_PLLMB,
> +	TEGRA_EMC_SRC_PLLP_UD,
> +	TEGRA_EMC_SRC_COUNT,
> +};
> +
> +struct emc_sel {
> +	struct clk *input;
> +	u32 value;
> +	unsigned long input_rate;
> +
> +	struct clk *input_b;		// second source of PLLM: PLLMB
> +	u32 value_b;
> +	unsigned long input_rate_b;
> +};
> +
> +struct emc_stats {
> +	u64 time_at_clock[TEGRA_EMC_MAX_FREQS];
> +	int last_sel;
> +	u64 last_update;
> +	u64 clkchange_count;
> +	spinlock_t spinlock;
> +};
> +static struct emc_stats emc_stats;
> +
> +static struct emc_sel *emc_clk_sel;
> +static struct clk *emc_src[TEGRA_EMC_SRC_COUNT];
> +static const char *emc_src_names[TEGRA_EMC_SRC_COUNT] = {
> +	[TEGRA_EMC_SRC_PLLM] = "pll_m",
> +	[TEGRA_EMC_SRC_PLLC] = "pll_c",
> +	[TEGRA_EMC_SRC_PLLP] = "pll_p",
> +	[TEGRA_EMC_SRC_CLKM] = "clk_m",
> +	[TEGRA_EMC_SRC_PLLM_UD] = "pll_m_ud",
> +	[TEGRA_EMC_SRC_PLLMB_UD] = "pll_mb_ud",
> +	[TEGRA_EMC_SRC_PLLMB] = "pll_mb",
> +	[TEGRA_EMC_SRC_PLLP_UD] = "pll_p_ud",
> +};
> +
> +static const struct supported_sequence supported_seqs[] = {
> +	{
> +		0,
> +		NULL,
> +		NULL,
> +		NULL
> +	}
> +};
> +static const struct supported_sequence *seq = supported_seqs;
> +static DEFINE_SPINLOCK(emc_access_lock);
> +
> +static inline struct tegra_emc *clk_hw_to_emc(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct tegra_emc, hw);
> +}
> +
> +u32 emc_readl(struct tegra_emc *emc, unsigned long offset)
> +{
> +	return readl_relaxed(emc->emc_base[REG_EMC] + offset);
> +}
> +
> +u32 emc_readl_per_ch(struct tegra_emc *emc, int type,
> +			    unsigned long offset)
> +{
> +	u32 val = 0;
> +
> +	switch (type) {
> +	case REG_EMC:
> +	case REG_EMC0:
> +		val = readl_relaxed(emc->emc_base[REG_EMC] + offset);
> +		break;
> +	case REG_EMC1:
> +		val = readl_relaxed(emc->emc_base[REG_EMC1] + offset);
> +		break;
> +	}
> +
> +	return val;
> +}
> +
> +static inline u32 emc_src_val(u32 val)
> +{
> +	return (val & EMC_CLK_EMC_2X_CLK_SRC_MASK) >>
> +		EMC_CLK_EMC_2X_CLK_SRC_SHIFT;
> +}
> +
> +static inline u32 emc_div_val(u32 val)
> +{
> +	return (val & EMC_CLK_EMC_2X_CLK_DIVISOR_MASK) >>
> +		EMC_CLK_EMC_2X_CLK_DIVISOR_SHIFT;
> +}
> +
> +static void emc_train_func(struct timer_list *tmr)
> +{
> +	unsigned long flags;
> +	struct tegra_emc *emc = from_timer(emc, tmr, training_timer);
> +
> +	if (!emc->current_timing)
> +		return;
> +
> +	spin_lock_irqsave(&emc_access_lock, flags);
> +	if (seq->periodic_compensation)
> +		seq->periodic_compensation(emc);
> +	spin_unlock_irqrestore(&emc_access_lock, flags);
> +
> +	mod_timer(&emc->training_timer,
> +		  jiffies + msecs_to_jiffies(emc->timer_period_training));
> +}
> +
> +static void emc_training_timer_start(struct tegra_emc *emc)
> +{
> +	mod_timer(&emc->training_timer,
> +		  jiffies + msecs_to_jiffies(emc->timer_period_training));
> +}
> +
> +static void emc_training_timer_stop(struct tegra_emc *emc)
> +{
> +	del_timer(&emc->training_timer);
> +}
> +
> +static void emc_set_clock(struct tegra_emc *emc, u32 clksrc)
> +{
> +	seq->set_clock(emc, clksrc);
> +
> +	if (emc->next_timing->periodic_training)
> +		emc_training_timer_start(emc);
> +	else
> +		emc_training_timer_stop(emc);
> +}
> +
> +static inline unsigned long emc_get_src_clk_rate(void)
> +{
> +	int div;
> +	u32 val;
> +	unsigned long rate;
> +
> +	val = tegra210_clk_emc_get_setting();
> +	rate = clk_get_rate(emc_src[emc_src_val(val)]);
> +	div = emc_div_val(val);
> +	div += 2;
> +	rate *= 2;
> +	rate += div - 1;
> +	do_div(rate, div);
> +
> +	return rate;
> +}
> +
> +static void emc_last_stats_update(int last_sel)
> +{
> +	unsigned long flags;
> +	u64 cur_jiffies = get_jiffies_64();
> +
> +	spin_lock_irqsave(&emc_stats.spinlock, flags);
> +
> +	if (emc_stats.last_sel < TEGRA_EMC_MAX_FREQS)
> +		emc_stats.time_at_clock[emc_stats.last_sel] =
> +			emc_stats.time_at_clock[emc_stats.last_sel]
> +			+ (cur_jiffies - emc_stats.last_update);
> +
> +	emc_stats.last_update = cur_jiffies;
> +
> +	if (last_sel < TEGRA_EMC_MAX_FREQS) {
> +		emc_stats.clkchange_count++;
> +		emc_stats.last_sel = last_sel;
> +	}
> +
> +	spin_unlock_irqrestore(&emc_stats.spinlock, flags);
> +}
> +
> +static int emc_table_lookup(struct tegra_emc *emc, unsigned long rate)
> +{
> +	int i;
> +
> +	for (i = 0; i < emc->emc_table_size; i++) {
> +		if (emc_clk_sel[i].input == NULL)
> +			continue;
> +
> +		if (emc->emc_table[i].rate == rate)
> +			return i;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static struct clk *emc_predict_parent(struct tegra_emc *emc,
> +				      unsigned long rate)
> +{
> +	struct clk *old_parent, *new_parent;
> +	unsigned long parent_rate;
> +	int idx;
> +
> +	idx = emc_table_lookup(emc, rate / 1000);
> +	if (idx < 0)
> +		return ERR_PTR(-EINVAL);
> +
> +	parent_rate = emc_clk_sel[idx].input_rate * 1000;
> +	new_parent = emc_clk_sel[idx].input;
> +	old_parent = clk_get_parent(emc->emc_clk);
> +
> +	if (parent_rate == clk_get_rate(old_parent))
> +		return old_parent;
> +
> +	if (clk_is_match(new_parent, old_parent))
> +		new_parent = emc_clk_sel[idx].input_b;
> +
> +	if (parent_rate != clk_get_rate(new_parent))
> +		clk_set_rate(new_parent, parent_rate);
> +
> +	return new_parent;
> +}
> +
> +static int emc_set_rate(struct tegra_emc *emc, unsigned long rate)
> +{
> +	int i;
> +	unsigned long flags;
> +	s64 last_change_delay;
> +	struct clk *parent;
> +
> +	if (emc->emc_suspend)
> +		rate = TEGRA210_EMC_SUSPEND_RATE;
> +
> +	if (rate == emc->current_timing->rate)
> +		return 0;
> +
> +	i = emc_table_lookup(emc, rate / 1000);
> +
> +	if (i < 0)
> +		return i;
> +
> +	if (rate > 204000000 && !emc->emc_table[i].trained)
> +		return -EINVAL;
> +
> +	parent = emc_predict_parent(emc, rate);
> +	if (clk_is_match(parent, emc_clk_sel[i].input))
> +		emc->clk_setting = emc_clk_sel[i].value;
> +	else
> +		emc->clk_setting = emc_clk_sel[i].value_b;
> +
> +	emc->next_timing = &emc->emc_table[i];
> +	last_change_delay = ktime_us_delta(ktime_get(), emc->clkchange_time);
> +	if ((last_change_delay >= 0) &&
> +	    (last_change_delay < emc->clkchange_delay))
> +		udelay(emc->clkchange_delay - (int)last_change_delay);
> +
> +	spin_lock_irqsave(&emc_access_lock, flags);
> +	emc_set_clock(emc, emc->clk_setting);
> +	emc->clkchange_time = ktime_get();
> +	emc->current_timing = &emc->emc_table[i];
> +	spin_unlock_irqrestore(&emc_access_lock, flags);
> +
> +	emc_last_stats_update(i);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_DEBUG_FS
> +static int emc_stats_show(struct seq_file *s, void *data)
> +{
> +	int i;
> +	struct tegra_emc *emc = (struct tegra_emc *)s->private;

There is no need for casting of the void*.

> +
> +	if (!emc->emc_table_size || !seq)
> +		return 0;
> +
> +	emc_last_stats_update(TEGRA_EMC_MAX_FREQS);
> +
> +	seq_printf(s, "%-10s %-10s\n", "rate kHz", "time");
> +	for (i = 0; i < emc->emc_table_size; i++) {
> +		if (emc_clk_sel[i].input == NULL)
> +			continue;
> +
> +		seq_printf(s, "%-10u %-10llu\n",
> +			   emc->emc_table[i].rate,
> +			   jiffies_64_to_clock_t(
> +			   emc_stats.time_at_clock[i]));
> +	}
> +	seq_printf(s, "%-15s %llu\n", "transitions:",
> +		   emc_stats.clkchange_count);
> +	seq_printf(s, "%-15s %llu\n", "time-stamp:",
> +		   jiffies_64_to_clock_t(emc_stats.last_update));

Devfreq subsystem has the transition stats too and it is a bit more advanced than what you have here.

 cat /sys/class/devfreq/devfreq0/trans_stat
      From  :   To
            :  50000000 100000000 150000000 300000000 600000000   time(ms)
 *  50000000:         0         4         4         0        46 118096210
   100000000:        21         0         0         0         5     15460
   150000000:        10         9         0         0     10560  20213940
   300000000:        13         6      5058         0     22375   6848690
   600000000:        11         7      5517     27452         0  11958990
 Total transition : 71098

Hence I'm questioning the necessity of the debug-info duplication.

-- 
Dmitry
