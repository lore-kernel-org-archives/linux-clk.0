Return-Path: <SRS0=qU15=SE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C783C4360F
	for <linux-clk@archiver.kernel.org>; Tue,  2 Apr 2019 11:38:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CA4A420856
	for <linux-clk@archiver.kernel.org>; Tue,  2 Apr 2019 11:38:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCcx3W4g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730580AbfDBLiS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 Apr 2019 07:38:18 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41391 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726930AbfDBLiS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 Apr 2019 07:38:18 -0400
Received: by mail-lj1-f196.google.com with SMTP id k8so2860135lja.8;
        Tue, 02 Apr 2019 04:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=k0ewJAQDdf5YCIk+Ni5zUrorDEq9BxA7+HNYLMivV7A=;
        b=mCcx3W4gYJKRjVOss8VJ9XWLlUW7jJVdcTv3OU9uiGyzgFIDmLQmhihPcz03vuaSax
         3WoTiwI64icC97f0ND4oiRzDNNFClwlVYNjqC+SSGebLcTqEPu6/8Fv+RfZNEvBipVi1
         9J4k/UUuYPHWmmuo7gwTnN9kd0Jw+RQpWVcQuEtbJRTkA8Mom5LTR9SgNwmHYqanEtng
         U89GPPdzMzHd5AlLwqnX0qW1bgUbsWc9/HaTkwM/BCOkaFLluUmtIbwYt5WOt7lgnd2h
         pUYqMNV74Po+9yLvbT9uHLZn13W8SqQlO2ZBDu9Z5TifS/MB2No38/2NGK6HqM6d77pV
         VdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k0ewJAQDdf5YCIk+Ni5zUrorDEq9BxA7+HNYLMivV7A=;
        b=HTWMPrzN7RuTY2JdjzxYnmL1laf+yzMeiQmI7s8ywI6dhG9QdcYxghkv1M7sv7eOin
         wS8dIePFuyaTZt+s9vC3yOJSmjgsJ+qiI73jmyqmbvIz0bgV1oZSP1QlWwQKtPEJHUax
         0Zl1nWu2e238Hl+GQ4AvIIzOFKykdJhHK3jgxMd2FMoX+ZXIkYUo5KydJu8qP9YxPwQv
         jhKBL4WbDuf3fol+QLN7lDyHZfX8/GsBx7HiTEjvtl2wryvZPvP9XLvhAx7SaX0M/63i
         ayOA1F6/O6yYotObk5XTCfzShGxvCOxM1+xyHYHDa4JVo5TI0sQxedIixjK0AcEjoJmW
         Ve2w==
X-Gm-Message-State: APjAAAVlV1OvFrBkj/ry8aag1pUkSWGK/lIA5tG3lRgMBWxB8GuIwRdX
        sp2ICd7cIToTPolWNdQ/NMA=
X-Google-Smtp-Source: APXvYqwKatzcyYAZRLGd+YE+ZLLfcB+5Sl6tgVAgTZ1OqahdcdofcUaXcWIghK+5KB3fl6PnPR41HA==
X-Received: by 2002:a2e:9585:: with SMTP id w5mr21361451ljh.132.1554205093086;
        Tue, 02 Apr 2019 04:38:13 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
        by smtp.googlemail.com with ESMTPSA id x10sm2585317lff.45.2019.04.02.04.38.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Apr 2019 04:38:12 -0700 (PDT)
Subject: Re: [PATCH 5/8] memory: tegra: Add EMC scaling sequence code for
 Tegra210
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20190325074523.26456-1-josephl@nvidia.com>
 <20190325074523.26456-6-josephl@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2ff88007-8c37-3775-88a1-69d3a38c01a9@gmail.com>
Date:   Tue, 2 Apr 2019 14:36:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190325074523.26456-6-josephl@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

25.03.2019 10:45, Joseph Lo пишет:
> This patch includes the sequence for controlling the rate changing for
> EMC frequency and the dynamic training mechanism when the rate reaches
> the higher rates of EMC rate.
> 
> And historically there have been different sequences to change the EMC
> clock. The sequence to be used is specified in the scaling data.
> However, for the currently supported upstreaming platform, only the most
> recent sequence is used. So only support that in this patch.
> 
> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  drivers/memory/tegra/Makefile                 |    2 +-
>  drivers/memory/tegra/tegra210-emc-cc-r21021.c | 1962 +++++++++++++++++
>  drivers/memory/tegra/tegra210-emc-reg.h       |  134 ++
>  drivers/memory/tegra/tegra210-emc.c           |    5 +
>  4 files changed, 2102 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/memory/tegra/tegra210-emc-cc-r21021.c
> 
> diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
> index 36a835620bbd..dcc245b2ef45 100644
> --- a/drivers/memory/tegra/Makefile
> +++ b/drivers/memory/tegra/Makefile
> @@ -12,5 +12,5 @@ obj-$(CONFIG_TEGRA_MC) += tegra-mc.o
>  
>  obj-$(CONFIG_TEGRA20_EMC)  += tegra20-emc.o
>  obj-$(CONFIG_TEGRA124_EMC) += tegra124-emc.o
> -obj-$(CONFIG_TEGRA210_EMC) += tegra210-emc.o tegra210-dt-parse.o
> +obj-$(CONFIG_TEGRA210_EMC) += tegra210-emc.o tegra210-dt-parse.o tegra210-emc-cc-r21021.o
>  obj-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186.o
> diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
> new file mode 100644
> index 000000000000..f577a8c3aa95
> --- /dev/null
> +++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
> @@ -0,0 +1,1962 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2014-2019, NVIDIA CORPORATION.  All rights reserved.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/io.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/of.h>
> +#include <soc/tegra/mc.h>
> +
> +#include "mc.h"
> +#include "tegra210-emc-reg.h"
> +
> +#define DVFS_CLOCK_CHANGE_VERSION	21021
> +#define EMC_PRELOCK_VERSION		2101
> +
> +#define emc_cc_dbg(t, ...) pr_debug(__VA_ARGS__)
> +
> +/*
> + * Enable flags for specifying verbosity.
> + */
> +#define INFO            (1 << 0)
> +#define STEPS           (1 << 1)
> +#define SUB_STEPS       (1 << 2)
> +#define PRELOCK         (1 << 3)
> +#define PRELOCK_STEPS   (1 << 4)
> +#define ACTIVE_EN       (1 << 5)
> +#define PRAMP_UP        (1 << 6)
> +#define PRAMP_DN        (1 << 7)
> +#define EMA_WRITES      (1 << 10)
> +#define EMA_UPDATES     (1 << 11)
> +#define PER_TRAIN       (1 << 16)
> +#define CC_PRINT        (1 << 17)
> +#define CCFIFO          (1 << 29)
> +#define REGS            (1 << 30)
> +#define REG_LISTS       (1 << 31)
> +
> +enum {
> +	DVFS_SEQUENCE = 1,
> +	WRITE_TRAINING_SEQUENCE = 2,
> +	PERIODIC_TRAINING_SEQUENCE = 3,
> +	DVFS_PT1 = 10,
> +	DVFS_UPDATE = 11,
> +	TRAINING_PT1 = 12,
> +	TRAINING_UPDATE = 13,
> +	PERIODIC_TRAINING_UPDATE = 14
> +};
> +
> +/*
> + * PTFV defines - basically just indexes into the per table PTFV array.
> + */
> +#define PTFV_DQSOSC_MOVAVG_C0D0U0_INDEX		0
> +#define PTFV_DQSOSC_MOVAVG_C0D0U1_INDEX		1
> +#define PTFV_DQSOSC_MOVAVG_C0D1U0_INDEX		2
> +#define PTFV_DQSOSC_MOVAVG_C0D1U1_INDEX		3
> +#define PTFV_DQSOSC_MOVAVG_C1D0U0_INDEX		4
> +#define PTFV_DQSOSC_MOVAVG_C1D0U1_INDEX		5
> +#define PTFV_DQSOSC_MOVAVG_C1D1U0_INDEX		6
> +#define PTFV_DQSOSC_MOVAVG_C1D1U1_INDEX		7
> +#define PTFV_DVFS_SAMPLES_INDEX			9
> +#define PTFV_MOVAVG_WEIGHT_INDEX		10
> +#define PTFV_CONFIG_CTRL_INDEX			11
> +
> +#define PTFV_CONFIG_CTRL_USE_PREVIOUS_EMA	(1 << 0)
> +
> +/*
> + * Do arithmetic in fixed point.
> + */
> +#define MOVAVG_PRECISION_FACTOR		100
> +
> +/*
> + * The division portion of the average operation.
> + */
> +#define __AVERAGE_PTFV(dev)						\
> +	({ next_timing->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX] = \
> +	   next_timing->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX] / \
> +	   next_timing->ptfv_list[PTFV_DVFS_SAMPLES_INDEX]; })
> +
> +/*
> + * Convert val to fixed point and add it to the temporary average.
> + */
> +#define __INCREMENT_PTFV(dev, val)					\
> +	({ next_timing->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX] += \
> +	   ((val) * MOVAVG_PRECISION_FACTOR); })
> +
> +/*
> + * Convert a moving average back to integral form and return the value.
> + */
> +#define __MOVAVG_AC(timing, dev)					\
> +	((timing)->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX] /	\
> +	 MOVAVG_PRECISION_FACTOR)
> +
> +/* Weighted update. */
> +#define __WEIGHTED_UPDATE_PTFV(dev, nval)				\
> +	do {								\
> +		int w = PTFV_MOVAVG_WEIGHT_INDEX;			\
> +		int dqs = PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX;		\
> +									\
> +		next_timing->ptfv_list[dqs] =				\
> +			((nval * MOVAVG_PRECISION_FACTOR) +		\
> +			 (next_timing->ptfv_list[dqs] *			\
> +			  next_timing->ptfv_list[w])) /			\
> +			(next_timing->ptfv_list[w] + 1);		\
> +									\
> +		emc_cc_dbg(EMA_UPDATES, "%s: (s=%u) EMA: %u\n",		\
> +			   __stringify(dev), nval,			\
> +			   next_timing->ptfv_list[dqs]);		\
> +	} while (0)
> +
> +/* Access a particular average. */
> +#define __MOVAVG(timing, dev)                      \
> +	((timing)->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX])
> +
> +static u32 update_clock_tree_delay(struct tegra_emc *emc,
> +				   u32 dram_dev_num, u32 channel_mode, int type)
> +{
> +	u32 mrr_req = 0, mrr_data = 0;
> +	u32 temp0_0 = 0, temp0_1 = 0, temp1_0 = 0, temp1_1 = 0;
> +	s32 tdel = 0, tmdel = 0, adel = 0;
> +	u32 cval = 0;
> +	struct emc_table *last_timing = emc->current_timing;
> +	struct emc_table *next_timing = emc->next_timing;
> +	u32 last_timing_rate_mhz = last_timing->rate / 1000;
> +	u32 next_timing_rate_mhz = next_timing->rate / 1000;
> +	int dvfs_pt1 = type == DVFS_PT1;
> +	int dvfs_update = type == DVFS_UPDATE;
> +	int periodic_training_update = type == PERIODIC_TRAINING_UPDATE;
> +
> +	/*
> +	 * Dev0 MSB.
> +	 */
> +	if (dvfs_pt1 || periodic_training_update) {
> +		mrr_req = (2 << EMC_MRR_DEV_SEL_SHIFT) |
> +			(19 << EMC_MRR_MA_SHIFT);
> +		emc_writel(emc, mrr_req, EMC_MRR);
> +
> +		WARN(wait_for_update(emc, EMC_EMC_STATUS,
> +				     EMC_EMC_STATUS_MRR_DIVLD, 1, REG_EMC),
> +		     "Timed out waiting for MRR 19 (ch=0)\n");
> +		if (channel_mode == DUAL_CHANNEL)
> +			WARN(wait_for_update(emc, EMC_EMC_STATUS,
> +					     EMC_EMC_STATUS_MRR_DIVLD, 1,
> +					     REG_EMC1),
> +			     "Timed out waiting for MRR 19 (ch=1)\n");
> +
> +		mrr_data = (emc_readl(emc, EMC_MRR) & EMC_MRR_DATA_MASK) <<
> +			   EMC_MRR_DATA_SHIFT;
> +
> +		temp0_0 = (mrr_data & 0xff) << 8;
> +		temp0_1 = mrr_data & 0xff00;
> +
> +		if (channel_mode == DUAL_CHANNEL) {
> +			mrr_data = (emc1_readl(emc, EMC_MRR) &
> +				    EMC_MRR_DATA_MASK) <<
> +				   EMC_MRR_DATA_SHIFT;
> +			temp1_0 = (mrr_data & 0xff) << 8;
> +			temp1_1 = mrr_data & 0xff00;
> +		}
> +
> +		/*
> +		 * Dev0 LSB.
> +		 */
> +		mrr_req = (mrr_req & ~EMC_MRR_MA_MASK) |
> +			  (18 << EMC_MRR_MA_SHIFT);
> +		emc_writel(emc, mrr_req, EMC_MRR);
> +
> +		WARN(wait_for_update(emc, EMC_EMC_STATUS,
> +				     EMC_EMC_STATUS_MRR_DIVLD, 1, REG_EMC),
> +		     "Timed out waiting for MRR 18 (ch=0)\n");
> +		if (channel_mode == DUAL_CHANNEL)
> +			WARN(wait_for_update(emc, EMC_EMC_STATUS,
> +					     EMC_EMC_STATUS_MRR_DIVLD, 1,
> +					     REG_EMC1),
> +			     "Timed out waiting for MRR 18 (ch=1)\n");
> +
> +		mrr_data = (emc_readl(emc, EMC_MRR) & EMC_MRR_DATA_MASK) <<
> +			   EMC_MRR_DATA_SHIFT;
> +
> +		temp0_0 |= mrr_data & 0xff;
> +		temp0_1 |= (mrr_data & 0xff00) >> 8;
> +
> +		if (channel_mode == DUAL_CHANNEL) {
> +			mrr_data = (emc1_readl(emc, EMC_MRR) &
> +				    EMC_MRR_DATA_MASK) <<
> +				   EMC_MRR_DATA_SHIFT;
> +			temp1_0 |= (mrr_data & 0xff);
> +			temp1_1 |= (mrr_data & 0xff00) >> 8;
> +		}
> +	}
> +
> +	if (dvfs_pt1 || periodic_training_update)
> +		cval = (1000000 * tegra210_actual_osc_clocks(
> +					last_timing->run_clocks)) /
> +		       (last_timing_rate_mhz * 2 * temp0_0);
> +
> +	if (dvfs_pt1)
> +		__INCREMENT_PTFV(C0D0U0, cval);
> +	else if (dvfs_update)
> +		__AVERAGE_PTFV(C0D0U0);
> +	else if (periodic_training_update)
> +		__WEIGHTED_UPDATE_PTFV(C0D0U0, cval);
> +
> +	if (dvfs_update || periodic_training_update) {
> +		tdel = next_timing->current_dram_clktree_c0d0u0 -
> +			__MOVAVG_AC(next_timing, C0D0U0);
> +		tmdel = (tdel < 0) ? -1 * tdel : tdel;
> +		adel = tmdel;
> +		if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
> +		    next_timing->tree_margin)
> +			next_timing->current_dram_clktree_c0d0u0 =
> +				__MOVAVG_AC(next_timing, C0D0U0);
> +	}
> +
> +	if (dvfs_pt1 || periodic_training_update)
> +		cval = (1000000 * tegra210_actual_osc_clocks(
> +					last_timing->run_clocks)) /
> +		       (last_timing_rate_mhz * 2 * temp0_1);
> +
> +	if (dvfs_pt1)
> +		__INCREMENT_PTFV(C0D0U1, cval);
> +	else if (dvfs_update)
> +		__AVERAGE_PTFV(C0D0U1);
> +	else if (periodic_training_update)
> +		__WEIGHTED_UPDATE_PTFV(C0D0U1, cval);
> +
> +	if (dvfs_update || periodic_training_update) {
> +		tdel = next_timing->current_dram_clktree_c0d0u1 -
> +			__MOVAVG_AC(next_timing, C0D0U1);
> +		tmdel = (tdel < 0) ? -1 * tdel : tdel;
> +
> +		if (tmdel > adel)
> +			adel = tmdel;
> +
> +		if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
> +		    next_timing->tree_margin)
> +			next_timing->current_dram_clktree_c0d0u1 =
> +				__MOVAVG_AC(next_timing, C0D0U1);
> +	}
> +
> +	if (channel_mode == DUAL_CHANNEL) {
> +		if (dvfs_pt1 || periodic_training_update)
> +			cval = (1000000 * tegra210_actual_osc_clocks(
> +						last_timing->run_clocks)) /
> +			       (last_timing_rate_mhz * 2 * temp1_0);
> +		if (dvfs_pt1)
> +			__INCREMENT_PTFV(C1D0U0, cval);
> +		else if (dvfs_update)
> +			__AVERAGE_PTFV(C1D0U0);
> +		else if (periodic_training_update)
> +			__WEIGHTED_UPDATE_PTFV(C1D0U0, cval);
> +
> +		if (dvfs_update || periodic_training_update) {
> +			tdel = next_timing->current_dram_clktree_c1d0u0 -
> +				__MOVAVG_AC(next_timing, C1D0U0);
> +			tmdel = (tdel < 0) ? -1 * tdel : tdel;
> +
> +			if (tmdel > adel)
> +				adel = tmdel;
> +
> +			if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
> +			    next_timing->tree_margin)
> +				next_timing->current_dram_clktree_c1d0u0 =
> +					__MOVAVG_AC(next_timing, C1D0U0);
> +		}
> +
> +		if (dvfs_pt1 || periodic_training_update)
> +			cval = (1000000 * tegra210_actual_osc_clocks(
> +						last_timing->run_clocks)) /
> +			       (last_timing_rate_mhz * 2 * temp1_1);
> +		if (dvfs_pt1)
> +			__INCREMENT_PTFV(C1D0U1, cval);
> +		else if (dvfs_update)
> +			__AVERAGE_PTFV(C1D0U1);
> +		else if (periodic_training_update)
> +			__WEIGHTED_UPDATE_PTFV(C1D0U1, cval);
> +
> +		if (dvfs_update || periodic_training_update) {
> +			tdel = next_timing->current_dram_clktree_c1d0u1 -
> +				__MOVAVG_AC(next_timing, C1D0U1);
> +			tmdel = (tdel < 0) ? -1 * tdel : tdel;
> +
> +			if (tmdel > adel)
> +				adel = tmdel;
> +
> +			if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
> +			    next_timing->tree_margin)
> +				next_timing->current_dram_clktree_c1d0u1 =
> +					__MOVAVG_AC(next_timing, C1D0U1);
> +		}
> +	}
> +
> +	if (emc->dram_dev_num != TWO_RANK)
> +		goto done;
> +
> +	/*
> +	 * Dev1 MSB.
> +	 */
> +	if (dvfs_pt1 || periodic_training_update) {
> +		mrr_req = (1 << EMC_MRR_DEV_SEL_SHIFT) |
> +			  (19 << EMC_MRR_MA_SHIFT);
> +		emc_writel(emc, mrr_req, EMC_MRR);
> +
> +		WARN(wait_for_update(emc, EMC_EMC_STATUS,
> +				     EMC_EMC_STATUS_MRR_DIVLD, 1, REG_EMC),
> +		     "Timed out waiting for MRR 19 (ch=0)\n");
> +		if (channel_mode == DUAL_CHANNEL)
> +			WARN(wait_for_update(emc, EMC_EMC_STATUS,
> +					     EMC_EMC_STATUS_MRR_DIVLD, 1,
> +					     REG_EMC1),
> +			     "Timed out waiting for MRR 19 (ch=1)\n");
> +
> +		mrr_data = (emc_readl(emc, EMC_MRR) & EMC_MRR_DATA_MASK) <<
> +			   EMC_MRR_DATA_SHIFT;
> +
> +		temp0_0 = (mrr_data & 0xff) << 8;
> +		temp0_1 = mrr_data & 0xff00;
> +
> +		if (channel_mode == DUAL_CHANNEL) {
> +			mrr_data = (emc1_readl(emc, EMC_MRR) &
> +				    EMC_MRR_DATA_MASK) <<
> +				   EMC_MRR_DATA_SHIFT;
> +			temp1_0 = (mrr_data & 0xff) << 8;
> +			temp1_1 = mrr_data & 0xff00;
> +		}
> +
> +		/*
> +		 * Dev1 LSB.
> +		 */
> +		mrr_req = (mrr_req & ~EMC_MRR_MA_MASK) |
> +			  (18 << EMC_MRR_MA_SHIFT);
> +		emc_writel(emc, mrr_req, EMC_MRR);
> +
> +		WARN(wait_for_update(emc, EMC_EMC_STATUS,
> +				     EMC_EMC_STATUS_MRR_DIVLD, 1, REG_EMC),
> +		     "Timed out waiting for MRR 18 (ch=0)\n");
> +		if (channel_mode == DUAL_CHANNEL)
> +			WARN(wait_for_update(emc, EMC_EMC_STATUS,
> +					     EMC_EMC_STATUS_MRR_DIVLD, 1,
> +					     REG_EMC1),
> +			     "Timed out waiting for MRR 18 (ch=1)\n");
> +
> +		mrr_data = (emc_readl(emc, EMC_MRR) & EMC_MRR_DATA_MASK) <<
> +			   EMC_MRR_DATA_SHIFT;
> +
> +		temp0_0 |= mrr_data & 0xff;
> +		temp0_1 |= (mrr_data & 0xff00) >> 8;
> +
> +		if (channel_mode == DUAL_CHANNEL) {
> +			mrr_data = (emc1_readl(emc, EMC_MRR) &
> +				    EMC_MRR_DATA_MASK) <<
> +				   EMC_MRR_DATA_SHIFT;
> +			temp1_0 |= (mrr_data & 0xff);
> +			temp1_1 |= (mrr_data & 0xff00) >> 8;
> +		}
> +	}
> +
> +	if (dvfs_pt1 || periodic_training_update)
> +		cval = (1000000 * tegra210_actual_osc_clocks(
> +					last_timing->run_clocks)) /
> +		       (last_timing_rate_mhz * 2 * temp0_0);
> +
> +	if (dvfs_pt1)
> +		__INCREMENT_PTFV(C0D1U0, cval);
> +	else if (dvfs_update)
> +		__AVERAGE_PTFV(C0D1U0);
> +	else if (periodic_training_update)
> +		__WEIGHTED_UPDATE_PTFV(C0D1U0, cval);
> +
> +	if (dvfs_update || periodic_training_update) {
> +		tdel = next_timing->current_dram_clktree_c0d1u0 -
> +		       __MOVAVG_AC(next_timing, C0D1U0);
> +		tmdel = (tdel < 0) ? -1 * tdel : tdel;
> +		if (tmdel > adel)
> +			adel = tmdel;
> +
> +		if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
> +		    next_timing->tree_margin)
> +			next_timing->current_dram_clktree_c0d1u0 =
> +				__MOVAVG_AC(next_timing, C0D1U0);
> +	}
> +
> +	if (dvfs_pt1 || periodic_training_update)
> +		cval = (1000000 * tegra210_actual_osc_clocks(
> +					last_timing->run_clocks)) /
> +		       (last_timing_rate_mhz * 2 * temp0_1);
> +
> +	if (dvfs_pt1)
> +		__INCREMENT_PTFV(C0D1U1, cval);
> +	else if (dvfs_update)
> +		__AVERAGE_PTFV(C0D1U1);
> +	else if (periodic_training_update)
> +		__WEIGHTED_UPDATE_PTFV(C0D1U1, cval);
> +
> +	if (dvfs_update || periodic_training_update) {
> +		tdel = next_timing->current_dram_clktree_c0d1u1 -
> +		       __MOVAVG_AC(next_timing, C0D1U1);
> +		tmdel = (tdel < 0) ? -1 * tdel : tdel;
> +		if (tmdel > adel)
> +			adel = tmdel;
> +
> +		if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
> +		    next_timing->tree_margin)
> +			next_timing->current_dram_clktree_c0d1u1 =
> +				__MOVAVG_AC(next_timing, C0D1U1);
> +	}
> +
> +	if (channel_mode == DUAL_CHANNEL) {
> +		if (dvfs_pt1 || periodic_training_update)
> +			cval = (1000000 * tegra210_actual_osc_clocks(
> +						last_timing->run_clocks)) /
> +			       (last_timing_rate_mhz * 2 * temp1_0);
> +
> +		if (dvfs_pt1)
> +			__INCREMENT_PTFV(C1D1U0, cval);
> +		else if (dvfs_update)
> +			__AVERAGE_PTFV(C1D1U0);
> +		else if (periodic_training_update)
> +			__WEIGHTED_UPDATE_PTFV(C1D1U0, cval);
> +
> +		if (dvfs_update || periodic_training_update) {
> +			tdel = next_timing->current_dram_clktree_c1d1u0 -
> +			       __MOVAVG_AC(next_timing, C1D1U0);
> +			tmdel = (tdel < 0) ? -1 * tdel : tdel;
> +			if (tmdel > adel)
> +				adel = tmdel;
> +
> +			if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
> +			    next_timing->tree_margin)
> +				next_timing->current_dram_clktree_c1d1u0 =
> +					__MOVAVG_AC(next_timing, C1D1U0);
> +		}
> +
> +		if (dvfs_pt1 || periodic_training_update)
> +			cval = (1000000 * tegra210_actual_osc_clocks(
> +						last_timing->run_clocks)) /
> +			       (last_timing_rate_mhz * 2 * temp1_1);
> +
> +		if (dvfs_pt1)
> +			__INCREMENT_PTFV(C1D1U1, cval);
> +		else if (dvfs_update)
> +			__AVERAGE_PTFV(C1D1U1);
> +		else if (periodic_training_update)
> +			__WEIGHTED_UPDATE_PTFV(C1D1U1, cval);
> +
> +		if (dvfs_update || periodic_training_update) {
> +			tdel = next_timing->current_dram_clktree_c1d1u1 -
> +			       __MOVAVG_AC(next_timing, C1D1U1);
> +			tmdel = (tdel < 0) ? -1 * tdel : tdel;
> +			if (tmdel > adel)
> +				adel = tmdel;
> +
> +			if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
> +			    next_timing->tree_margin)
> +				next_timing->current_dram_clktree_c1d1u1 =
> +					__MOVAVG_AC(next_timing, C1D1U1);
> +		}
> +	}
> +
> +done:
> +	return adel;
> +}
> +
> +static u32 periodic_compensation_handler(struct tegra_emc *emc, u32 type,
> +					 u32 dram_dev_num,
> +					 u32 channel_mode,
> +					 struct emc_table *last_timing,
> +					 struct emc_table *next_timing)
> +{
> +#define __COPY_EMA(nt, lt, dev)						\
> +	({ __MOVAVG(nt, dev) = __MOVAVG(lt, dev) *			\
> +	   (nt)->ptfv_list[PTFV_DVFS_SAMPLES_INDEX]; })
> +
> +	u32 i;
> +	u32 adel = 0;
> +	u32 samples = next_timing->ptfv_list[PTFV_DVFS_SAMPLES_INDEX];
> +	u32 delay = 2 +
> +		(1000 * tegra210_actual_osc_clocks(last_timing->run_clocks) /
> +		last_timing->rate);
> +
> +	if (!next_timing->periodic_training)
> +		return 0;
> +
> +	if (type == DVFS_SEQUENCE) {
> +		if (last_timing->periodic_training &&
> +		    (next_timing->ptfv_list[PTFV_CONFIG_CTRL_INDEX] &
> +		     PTFV_CONFIG_CTRL_USE_PREVIOUS_EMA)) {
> +			/*
> +			 * If the previous frequency was using periodic
> +			 * calibration then we can reuse the previous
> +			 * frequencies EMA data.
> +			 */
> +			__COPY_EMA(next_timing, last_timing, C0D0U0);
> +			__COPY_EMA(next_timing, last_timing, C0D0U1);
> +			__COPY_EMA(next_timing, last_timing, C1D0U0);
> +			__COPY_EMA(next_timing, last_timing, C1D0U1);
> +			__COPY_EMA(next_timing, last_timing, C0D1U0);
> +			__COPY_EMA(next_timing, last_timing, C0D1U1);
> +			__COPY_EMA(next_timing, last_timing, C1D1U0);
> +			__COPY_EMA(next_timing, last_timing, C1D1U1);
> +		} else {
> +			/* Reset the EMA.*/
> +			__MOVAVG(next_timing, C0D0U0) = 0;
> +			__MOVAVG(next_timing, C0D0U1) = 0;
> +			__MOVAVG(next_timing, C1D0U0) = 0;
> +			__MOVAVG(next_timing, C1D0U1) = 0;
> +			__MOVAVG(next_timing, C0D1U0) = 0;
> +			__MOVAVG(next_timing, C0D1U1) = 0;
> +			__MOVAVG(next_timing, C1D1U0) = 0;
> +			__MOVAVG(next_timing, C1D1U1) = 0;
> +
> +			for (i = 0; i < samples; i++) {
> +				tegra210_start_periodic_compensation(emc);
> +				udelay(delay);
> +
> +				/*
> +				 * Generate next sample of data.
> +				 */
> +				adel = update_clock_tree_delay(emc,
> +							emc->dram_dev_num,
> +							channel_mode,
> +							DVFS_PT1);
> +			}
> +		}
> +
> +		/*
> +		 * Seems like it should be part of the
> +		 * 'if (last_timing->periodic_training)' conditional
> +		 * since is already done for the else clause.
> +		 */
> +		adel = update_clock_tree_delay(emc,
> +					       emc->dram_dev_num,
> +					       channel_mode,
> +					       DVFS_UPDATE);
> +	}
> +
> +	if (type == PERIODIC_TRAINING_SEQUENCE) {
> +		tegra210_start_periodic_compensation(emc);
> +		udelay(delay);
> +
> +		adel = update_clock_tree_delay(emc,
> +					       emc->dram_dev_num,
> +					       channel_mode,
> +					       PERIODIC_TRAINING_UPDATE);
> +	}
> +
> +	return adel;
> +}
> +
> +u32 __do_periodic_emc_compensation_r21021(struct tegra_emc *emc)
> +{
> +	u32 dram_dev_num;
> +	u32 channel_mode;
> +	u32 emc_cfg, emc_cfg_o;
> +	u32 emc_dbg_o;
> +	u32 del, i;
> +	u32 list[] = {
> +		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0,
> +		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1,
> +		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2,
> +		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3,
> +		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0,
> +		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1,
> +		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2,
> +		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3,
> +		EMC_DATA_BRLSHFT_0,
> +		EMC_DATA_BRLSHFT_1
> +	};
> +	u32 items = ARRAY_SIZE(list);
> +	u32 emc_cfg_update;
> +	struct emc_table *current_timing = emc->current_timing;
> +
> +	if (current_timing->periodic_training) {
> +		channel_mode =
> +			!!(current_timing->burst_regs[EMC_FBIO_CFG7_INDEX] &
> +			(1 << 2));
> +		dram_dev_num = 1 + (mc_readl(emc->mc, MC_EMEM_ADR_CFG) & 0x1);
> +
> +		emc_cc_dbg(PER_TRAIN, "Periodic training starting\n");
> +
> +		emc_dbg_o = emc_readl(emc, EMC_DBG);
> +		emc_cfg_o = emc_readl(emc, EMC_CFG);
> +		emc_cfg = emc_cfg_o & ~(EMC_CFG_DYN_SELF_REF |
> +					EMC_CFG_DRAM_ACPD |
> +					EMC_CFG_DRAM_CLKSTOP_PD |
> +					EMC_CFG_DRAM_CLKSTOP_PD);
> +
> +
> +		/*
> +		 * 1. Power optimizations should be off.
> +		 */
> +		emc_writel(emc, emc_cfg, EMC_CFG);
> +
> +		/* Does emc_timing_update() for above changes. */
> +		tegra210_dll_disable(emc, channel_mode);
> +
> +		wait_for_update(emc, EMC_EMC_STATUS,
> +				EMC_EMC_STATUS_DRAM_IN_POWERDOWN_MASK, 0,
> +				REG_EMC);
> +		if (channel_mode)
> +			wait_for_update(emc, EMC_EMC_STATUS,
> +					EMC_EMC_STATUS_DRAM_IN_POWERDOWN_MASK,
> +					0, REG_EMC1);
> +
> +		wait_for_update(emc, EMC_EMC_STATUS,
> +				EMC_EMC_STATUS_DRAM_IN_SELF_REFRESH_MASK, 0,
> +				REG_EMC);
> +		if (channel_mode)
> +			wait_for_update(emc, EMC_EMC_STATUS,
> +				EMC_EMC_STATUS_DRAM_IN_SELF_REFRESH_MASK, 0,
> +				REG_EMC1);
> +
> +		emc_cfg_update = emc_readl(emc, EMC_CFG_UPDATE);
> +		emc_writel(emc, (emc_cfg_update &
> +			    ~EMC_CFG_UPDATE_UPDATE_DLL_IN_UPDATE_MASK) |
> +			   (2 << EMC_CFG_UPDATE_UPDATE_DLL_IN_UPDATE_SHIFT),
> +			   EMC_CFG_UPDATE);
> +
> +		/*
> +		 * 2. osc kick off - this assumes training and dvfs have set
> +		 *    correct MR23.
> +		 */
> +		tegra210_start_periodic_compensation(emc);
> +
> +		/*
> +		 * 3. Let dram capture its clock tree delays.
> +		 */
> +		udelay((tegra210_actual_osc_clocks(current_timing->run_clocks) *
> +			1000) /
> +		       current_timing->rate + 1);
> +
> +		/*
> +		 * 4. Check delta wrt previous values (save value if margin
> +		 *    exceeds what is set in table).
> +		 */
> +		del = periodic_compensation_handler(emc,
> +						    PERIODIC_TRAINING_SEQUENCE,
> +						    dram_dev_num,
> +						    channel_mode,
> +						    current_timing,
> +						    current_timing);
> +
> +		/*
> +		 * 5. Apply compensation w.r.t. trained values (if clock tree
> +		 *    has drifted more than the set margin).
> +		 */
> +		if (current_timing->tree_margin <
> +		    ((del * 128 * (current_timing->rate / 1000)) / 1000000)) {
> +			for (i = 0; i < items; i++) {
> +				u32 tmp =
> +				tegra210_apply_periodic_compensation_trimmer(
> +				current_timing, list[i]);
> +
> +				emc_cc_dbg(EMA_WRITES, "0x%08x <= 0x%08x\n",
> +					   list[i], tmp);
> +				emc_writel(emc, tmp, list[i]);
> +			}
> +		}
> +
> +		emc_writel(emc, emc_cfg_o, EMC_CFG);
> +
> +		/*
> +		 * 6. Timing update actally applies the new trimmers.
> +		 */
> +		emc_timing_update(emc, channel_mode);
> +
> +		/* 6.1. Restore the UPDATE_DLL_IN_UPDATE field. */
> +		emc_writel(emc, emc_cfg_update, EMC_CFG_UPDATE);
> +
> +		/* 6.2. Restore the DLL. */
> +		tegra210_dll_enable(emc, channel_mode);
> +
> +		/*
> +		 * 7. Copy over the periodic training registers that we updated
> +		 *    here to the corresponding derated/non-derated table.
> +		 */
> +		tegra210_update_emc_alt_timing(emc, current_timing);
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Do the clock change sequence.
> + */
> +void emc_set_clock_r21021(struct tegra_emc *emc, u32 clksrc)
> +{
> +	/*
> +	 * This is the timing table for the source frequency. It does _not_
> +	 * necessarily correspond to the actual timing values in the EMC at the
> +	 * moment. If the boot BCT differs from the table then this can happen.
> +	 * However, we need it for accessing the dram_timings (which are not
> +	 * really registers) array for the current frequency.
> +	 */
> +	struct emc_table *fake_timing;
> +	struct emc_table *last_timing = emc->current_timing;
> +	struct emc_table *next_timing = emc->next_timing;
> +
> +	u32 i, tmp;
> +
> +	u32 cya_allow_ref_cc = 0, ref_b4_sref_en = 0, cya_issue_pc_ref = 0;
> +
> +	u32 zqcal_before_cc_cutoff = 2400; /* In picoseconds */
> +	u32 ref_delay_mult;
> +	u32 ref_delay;
> +	s32 zq_latch_dvfs_wait_time;
> +	s32 tZQCAL_lpddr4_fc_adj;
> +	/* Scaled by x1000 */
> +	u32 tFC_lpddr4 = 1000 * next_timing->dram_timings[T_FC_LPDDR4];
> +	u32 tZQCAL_lpddr4 = 1000000;
> +
> +	u32 dram_type, dram_dev_num, shared_zq_resistor;
> +	u32 channel_mode;
> +	u32 is_lpddr3;
> +
> +	u32 emc_cfg, emc_sel_dpd_ctrl, emc_cfg_reg;
> +
> +	u32 emc_dbg;
> +	u32 emc_zcal_interval;
> +	u32 emc_zcal_wait_cnt_old;
> +	u32 emc_zcal_wait_cnt_new;
> +	u32 emc_dbg_active;
> +	u32 zq_op;
> +	u32 zcal_wait_time_clocks;
> +	u32 zcal_wait_time_ps;
> +
> +	u32 emc_auto_cal_config;
> +	u32 auto_cal_en;
> +
> +	u32 mr13_catr_enable;
> +
> +	u32 ramp_up_wait = 0, ramp_down_wait = 0;
> +
> +	/* In picoseconds. */
> +	u32 source_clock_period;
> +	u32 destination_clock_period;
> +
> +	u32 emc_dbg_o;
> +	u32 emc_cfg_pipe_clk_o;
> +	u32 emc_pin_o;
> +
> +	u32 mr13_flip_fspwr;
> +	u32 mr13_flip_fspop;
> +
> +	u32 opt_zcal_en_cc;
> +	u32 opt_do_sw_qrst = 1;
> +	u32 opt_dvfs_mode;
> +	u32 opt_dll_mode;
> +	u32 opt_cc_short_zcal = 1;
> +	u32 opt_short_zcal = 1;
> +	u32 save_restore_clkstop_pd = 1;
> +
> +	u32 prelock_dll_en = 0, dll_out;
> +
> +	int next_push, next_dq_e_ivref, next_dqs_e_ivref;
> +
> +	u32 opt_war_200024907;
> +	u32 zq_wait_long;
> +	u32 zq_wait_short;
> +
> +	u32 bg_regulator_switch_complete_wait_clks;
> +	u32 bg_regulator_mode_change;
> +	u32 enable_bglp_regulator;
> +	u32 enable_bg_regulator;
> +
> +	u32 tRTM;
> +	u32 RP_war;
> +	u32 R2P_war;
> +	u32 TRPab_war;
> +	s32 nRTP;
> +	u32 deltaTWATM;
> +	u32 W2P_war;
> +	u32 tRPST;
> +
> +	u32 mrw_req;
> +	u32 adel = 0, compensate_trimmer_applicable = 0;
> +	u32 next_timing_rate_mhz = next_timing->rate / 1000;
> +
> +	static u32 fsp_for_next_freq;
> +
> +	emc_cc_dbg(INFO, "Running clock change.\n");
> +
> +	fake_timing = get_timing_from_freq(emc, last_timing->rate);
> +
> +	fsp_for_next_freq = !fsp_for_next_freq;
> +
> +	dram_type = emc_readl(emc, EMC_FBIO_CFG5) &
> +		    EMC_FBIO_CFG5_DRAM_TYPE_MASK >>
> +		    EMC_FBIO_CFG5_DRAM_TYPE_SHIFT;
> +	shared_zq_resistor = last_timing->burst_regs[EMC_ZCAL_WAIT_CNT_INDEX] &
> +			     1 << 31;
> +	channel_mode = !!(last_timing->burst_regs[EMC_FBIO_CFG7_INDEX] &
> +			  1 << 2);
> +	opt_zcal_en_cc = (next_timing->burst_regs[EMC_ZCAL_INTERVAL_INDEX] &&
> +			  !last_timing->burst_regs[EMC_ZCAL_INTERVAL_INDEX]) ||
> +			  dram_type == DRAM_TYPE_LPDDR4;
> +	opt_dll_mode = (dram_type == DRAM_TYPE_DDR3) ?
> +		       get_dll_state(next_timing) : DLL_OFF;
> +	is_lpddr3 = (dram_type == DRAM_TYPE_LPDDR2) &&
> +		    next_timing->burst_regs[EMC_FBIO_CFG5_INDEX] &
> +		    1 << 25;
> +	opt_war_200024907 = (dram_type == DRAM_TYPE_LPDDR4);
> +	opt_dvfs_mode = MAN_SR;
> +	dram_dev_num = (mc_readl(emc->mc, MC_EMEM_ADR_CFG) & 0x1) + 1;
> +
> +	emc_cfg_reg = emc_readl(emc, EMC_CFG);
> +	emc_auto_cal_config = emc_readl(emc, EMC_AUTO_CAL_CONFIG);
> +
> +	source_clock_period = 1000000000 / last_timing->rate;
> +	destination_clock_period = 1000000000 / next_timing->rate;
> +
> +	tZQCAL_lpddr4_fc_adj = (destination_clock_period >
> +				zqcal_before_cc_cutoff) ?
> +		tZQCAL_lpddr4 / destination_clock_period :
> +		(tZQCAL_lpddr4 - tFC_lpddr4) / destination_clock_period;
> +	emc_dbg_o = emc_readl(emc, EMC_DBG);
> +	emc_pin_o = emc_readl(emc, EMC_PIN);
> +	emc_cfg_pipe_clk_o = emc_readl(emc, EMC_CFG_PIPE_CLK);
> +	emc_dbg = emc_dbg_o;
> +
> +	emc_cfg = next_timing->burst_regs[EMC_CFG_INDEX];
> +	emc_cfg &= ~(EMC_CFG_DYN_SELF_REF | EMC_CFG_DRAM_ACPD |
> +		     EMC_CFG_DRAM_CLKSTOP_SR | EMC_CFG_DRAM_CLKSTOP_PD);
> +	emc_sel_dpd_ctrl = next_timing->emc_sel_dpd_ctrl;
> +	emc_sel_dpd_ctrl &= ~(EMC_SEL_DPD_CTRL_CLK_SEL_DPD_EN |
> +			      EMC_SEL_DPD_CTRL_CA_SEL_DPD_EN |
> +			      EMC_SEL_DPD_CTRL_RESET_SEL_DPD_EN |
> +			      EMC_SEL_DPD_CTRL_ODT_SEL_DPD_EN |
> +			      EMC_SEL_DPD_CTRL_DATA_SEL_DPD_EN);
> +
> +	emc_cc_dbg(INFO, "Clock change version: %d\n",
> +		   DVFS_CLOCK_CHANGE_VERSION);
> +	emc_cc_dbg(INFO, "DRAM type = %d\n", emc->dram_type);
> +	emc_cc_dbg(INFO, "DRAM dev #: %d\n", dram_dev_num);
> +	emc_cc_dbg(INFO, "Next EMC clksrc: 0x%08x\n", clksrc);
> +	emc_cc_dbg(INFO, "DLL clksrc:      0x%08x\n", next_timing->dll_clk_src);
> +	emc_cc_dbg(INFO, "last rate: %u, next rate %u\n", last_timing->rate,
> +		   next_timing->rate);
> +	emc_cc_dbg(INFO, "last period: %u, next period: %u\n",
> +		   source_clock_period, destination_clock_period);
> +	emc_cc_dbg(INFO, "  shared_zq_resistor: %d\n", !!shared_zq_resistor);
> +	emc_cc_dbg(INFO, "  channel_mode: %d\n", channel_mode);
> +	emc_cc_dbg(INFO, "  opt_dll_mode: %d\n", opt_dll_mode);
> +
> +	/*
> +	 * Step 1:
> +	 *   Pre DVFS SW sequence.
> +	 */
> +	emc_cc_dbg(STEPS, "Step 1\n");
> +	emc_cc_dbg(STEPS, "Step 1.1: Disable DLL temporarily.\n");
> +	tmp = emc_readl(emc, EMC_CFG_DIG_DLL);
> +	tmp &= ~EMC_CFG_DIG_DLL_CFG_DLL_EN;
> +	emc_writel(emc, tmp, EMC_CFG_DIG_DLL);
> +
> +	emc_timing_update(emc, channel_mode);
> +	wait_for_update(emc, EMC_CFG_DIG_DLL,
> +			EMC_CFG_DIG_DLL_CFG_DLL_EN, 0, REG_EMC);
> +	if (channel_mode)
> +		wait_for_update(emc, EMC_CFG_DIG_DLL,
> +				EMC_CFG_DIG_DLL_CFG_DLL_EN, 0, REG_EMC1);
> +
> +	emc_cc_dbg(STEPS, "Step 1.2: Disable AUTOCAL temporarily.\n");
> +	emc_auto_cal_config = next_timing->emc_auto_cal_config;
> +	auto_cal_en = emc_auto_cal_config & EMC_AUTO_CAL_CONFIG_AUTO_CAL_ENABLE;
> +	emc_auto_cal_config &= ~EMC_AUTO_CAL_CONFIG_AUTO_CAL_START;
> +	emc_auto_cal_config |=  EMC_AUTO_CAL_CONFIG_AUTO_CAL_MEASURE_STALL;
> +	emc_auto_cal_config |=  EMC_AUTO_CAL_CONFIG_AUTO_CAL_UPDATE_STALL;
> +	emc_auto_cal_config |=  auto_cal_en;
> +	emc_writel(emc, emc_auto_cal_config, EMC_AUTO_CAL_CONFIG);
> +	emc_readl(emc, EMC_AUTO_CAL_CONFIG); /* Flush write. */
> +
> +	emc_cc_dbg(STEPS, "Step 1.3: Disable other power features.\n");
> +	emc_set_shadow_bypass(emc, ACTIVE);
> +	emc_writel(emc, emc_cfg, EMC_CFG);
> +	emc_writel(emc, emc_sel_dpd_ctrl, EMC_SEL_DPD_CTRL);
> +	emc_set_shadow_bypass(emc, ASSEMBLY);
> +
> +	if (next_timing->periodic_training) {
> +		tegra210_reset_dram_clktree_values(next_timing);
> +
> +		wait_for_update(emc, EMC_EMC_STATUS,
> +				EMC_EMC_STATUS_DRAM_IN_POWERDOWN_MASK, 0,
> +				REG_EMC);
> +		if (channel_mode)
> +			wait_for_update(emc, EMC_EMC_STATUS,
> +					EMC_EMC_STATUS_DRAM_IN_POWERDOWN_MASK,
> +					0, REG_EMC1);
> +
> +		wait_for_update(emc, EMC_EMC_STATUS,
> +				EMC_EMC_STATUS_DRAM_IN_SELF_REFRESH_MASK, 0,
> +				REG_EMC);
> +		if (channel_mode)
> +			wait_for_update(emc, EMC_EMC_STATUS,
> +				EMC_EMC_STATUS_DRAM_IN_SELF_REFRESH_MASK, 0,
> +				REG_EMC1);
> +
> +		tegra210_start_periodic_compensation(emc);
> +
> +		udelay(((1000 *
> +			 tegra210_actual_osc_clocks(last_timing->run_clocks)) /
> +			last_timing->rate) + 2);
> +		adel = periodic_compensation_handler(emc, DVFS_SEQUENCE,
> +						     dram_dev_num,
> +						     channel_mode,
> +						     fake_timing, next_timing);
> +		compensate_trimmer_applicable =
> +			next_timing->periodic_training &&
> +			((adel * 128 * next_timing_rate_mhz) / 1000000) >
> +			next_timing->tree_margin;
> +	}
> +
> +	emc_writel(emc, EMC_INTSTATUS_CLKCHANGE_COMPLETE, EMC_INTSTATUS);
> +	emc_set_shadow_bypass(emc, ACTIVE);
> +	emc_writel(emc, emc_cfg, EMC_CFG);
> +	emc_writel(emc, emc_sel_dpd_ctrl, EMC_SEL_DPD_CTRL);
> +	emc_writel(emc, emc_cfg_pipe_clk_o | EMC_CFG_PIPE_CLK_CLK_ALWAYS_ON,
> +		   EMC_CFG_PIPE_CLK);
> +	emc_writel(emc, next_timing->emc_fdpd_ctrl_cmd_no_ramp &
> +		   ~EMC_FDPD_CTRL_CMD_NO_RAMP_CMD_DPD_NO_RAMP_ENABLE,
> +		   EMC_FDPD_CTRL_CMD_NO_RAMP);
> +
> +	bg_regulator_mode_change =
> +		((next_timing->burst_regs[EMC_PMACRO_BG_BIAS_CTRL_0_INDEX] &
> +		  EMC_PMACRO_BG_BIAS_CTRL_0_BGLP_E_PWRD) ^
> +		 (last_timing->burst_regs[EMC_PMACRO_BG_BIAS_CTRL_0_INDEX] &
> +		  EMC_PMACRO_BG_BIAS_CTRL_0_BGLP_E_PWRD)) ||
> +		((next_timing->burst_regs[EMC_PMACRO_BG_BIAS_CTRL_0_INDEX] &
> +		  EMC_PMACRO_BG_BIAS_CTRL_0_BG_E_PWRD) ^
> +		 (last_timing->burst_regs[EMC_PMACRO_BG_BIAS_CTRL_0_INDEX] &
> +		  EMC_PMACRO_BG_BIAS_CTRL_0_BG_E_PWRD));
> +	enable_bglp_regulator =
> +		(next_timing->burst_regs[EMC_PMACRO_BG_BIAS_CTRL_0_INDEX] &
> +		 EMC_PMACRO_BG_BIAS_CTRL_0_BGLP_E_PWRD) == 0;
> +	enable_bg_regulator =
> +		(next_timing->burst_regs[EMC_PMACRO_BG_BIAS_CTRL_0_INDEX] &
> +		 EMC_PMACRO_BG_BIAS_CTRL_0_BG_E_PWRD) == 0;
> +
> +	if (bg_regulator_mode_change) {
> +		if (enable_bg_regulator)
> +			emc_writel(emc, last_timing->burst_regs
> +				   [EMC_PMACRO_BG_BIAS_CTRL_0_INDEX] &
> +				   ~EMC_PMACRO_BG_BIAS_CTRL_0_BG_E_PWRD,
> +				   EMC_PMACRO_BG_BIAS_CTRL_0);
> +		else
> +			emc_writel(emc, last_timing->burst_regs
> +				   [EMC_PMACRO_BG_BIAS_CTRL_0_INDEX] &
> +				   ~EMC_PMACRO_BG_BIAS_CTRL_0_BGLP_E_PWRD,
> +				   EMC_PMACRO_BG_BIAS_CTRL_0);
> +	}
> +
> +	/* Check if we need to turn on VREF generator. */
> +	if ((((last_timing->burst_regs[EMC_PMACRO_DATA_PAD_TX_CTRL_INDEX] &
> +	       EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQ_E_IVREF) == 0) &&
> +	     ((next_timing->burst_regs[EMC_PMACRO_DATA_PAD_TX_CTRL_INDEX] &
> +	       EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQ_E_IVREF) == 1)) ||
> +	    (((last_timing->burst_regs[EMC_PMACRO_DATA_PAD_TX_CTRL_INDEX] &
> +	       EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQS_E_IVREF) == 0) &&
> +	     ((next_timing->burst_regs[EMC_PMACRO_DATA_PAD_TX_CTRL_INDEX] &
> +	       EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQS_E_IVREF) == 1))) {
> +		u32 pad_tx_ctrl =
> +		    next_timing->burst_regs[EMC_PMACRO_DATA_PAD_TX_CTRL_INDEX];
> +		u32 last_pad_tx_ctrl =
> +		    last_timing->burst_regs[EMC_PMACRO_DATA_PAD_TX_CTRL_INDEX];
> +
> +		next_dqs_e_ivref = pad_tx_ctrl &
> +				   EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQS_E_IVREF;
> +		next_dq_e_ivref = pad_tx_ctrl &
> +				  EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQ_E_IVREF;
> +		next_push = (last_pad_tx_ctrl &
> +			     ~EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQ_E_IVREF &
> +			     ~EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQS_E_IVREF) |
> +			    next_dq_e_ivref | next_dqs_e_ivref;
> +		emc_writel(emc, next_push, EMC_PMACRO_DATA_PAD_TX_CTRL);
> +		udelay(1);
> +	} else if (bg_regulator_mode_change) {
> +		udelay(1);
> +	}
> +
> +	emc_set_shadow_bypass(emc, ASSEMBLY);
> +
> +	/*
> +	 * Step 2:
> +	 *   Prelock the DLL.
> +	 */
> +	emc_cc_dbg(STEPS, "Step 2\n");
> +	if (next_timing->burst_regs[EMC_CFG_DIG_DLL_INDEX] &
> +	    EMC_CFG_DIG_DLL_CFG_DLL_EN) {
> +		emc_cc_dbg(INFO, "Prelock enabled for target frequency.\n");
> +		dll_out = tegra210_dll_prelock(emc, 0, clksrc);
> +		emc_cc_dbg(INFO, "DLL out: 0x%03x\n", dll_out);
> +		prelock_dll_en = 1;
> +	} else {
> +		emc_cc_dbg(INFO, "Disabling DLL for target frequency.\n");
> +		tegra210_dll_disable(emc, channel_mode);
> +	}
> +
> +	/*
> +	 * Step 3:
> +	 *   Prepare autocal for the clock change.
> +	 */
> +	emc_cc_dbg(STEPS, "Step 3\n");
> +	emc_set_shadow_bypass(emc, ACTIVE);
> +	emc_writel(emc, next_timing->emc_auto_cal_config2,
> +		   EMC_AUTO_CAL_CONFIG2);
> +	emc_writel(emc, next_timing->emc_auto_cal_config3,
> +		   EMC_AUTO_CAL_CONFIG3);
> +	emc_writel(emc, next_timing->emc_auto_cal_config4,
> +		   EMC_AUTO_CAL_CONFIG4);
> +	emc_writel(emc, next_timing->emc_auto_cal_config5,
> +		   EMC_AUTO_CAL_CONFIG5);
> +	emc_writel(emc, next_timing->emc_auto_cal_config6,
> +		   EMC_AUTO_CAL_CONFIG6);
> +	emc_writel(emc, next_timing->emc_auto_cal_config7,
> +		   EMC_AUTO_CAL_CONFIG7);
> +	emc_writel(emc, next_timing->emc_auto_cal_config8,
> +		   EMC_AUTO_CAL_CONFIG8);
> +	emc_set_shadow_bypass(emc, ASSEMBLY);
> +
> +	emc_auto_cal_config |= (EMC_AUTO_CAL_CONFIG_AUTO_CAL_COMPUTE_START |
> +				auto_cal_en);
> +	emc_writel(emc, emc_auto_cal_config, EMC_AUTO_CAL_CONFIG);
> +
> +	/*
> +	 * Step 4:
> +	 *   Update EMC_CFG. (??)
> +	 */
> +	emc_cc_dbg(STEPS, "Step 4\n");
> +	if (source_clock_period > 50000 && dram_type == DRAM_TYPE_LPDDR4)
> +		ccfifo_writel(emc, 1, EMC_SELF_REF, 0);
> +	else
> +		emc_writel(emc, next_timing->emc_cfg_2, EMC_CFG_2);
> +
> +	/*
> +	 * Step 5:
> +	 *   Prepare reference variables for ZQCAL regs.
> +	 */
> +	emc_cc_dbg(STEPS, "Step 5\n");
> +	emc_zcal_interval = 0;
> +	emc_zcal_wait_cnt_old =
> +		last_timing->burst_regs[EMC_ZCAL_WAIT_CNT_INDEX];
> +	emc_zcal_wait_cnt_new =
> +		next_timing->burst_regs[EMC_ZCAL_WAIT_CNT_INDEX];
> +	emc_zcal_wait_cnt_old &= ~EMC_ZCAL_WAIT_CNT_ZCAL_WAIT_CNT_MASK;
> +	emc_zcal_wait_cnt_new &= ~EMC_ZCAL_WAIT_CNT_ZCAL_WAIT_CNT_MASK;
> +
> +	if (dram_type == DRAM_TYPE_LPDDR4)
> +		zq_wait_long = max((u32)1,
> +				   div_o3(1000000, destination_clock_period));
> +	else if (dram_type == DRAM_TYPE_LPDDR2 || is_lpddr3)
> +		zq_wait_long = max(next_timing->min_mrs_wait,
> +				   div_o3(360000, destination_clock_period)) +
> +			       4;
> +	else if (dram_type == DRAM_TYPE_DDR3)
> +		zq_wait_long = max((u32)256,
> +				   div_o3(320000, destination_clock_period) +
> +				   2);
> +	else
> +		zq_wait_long = 0;
> +
> +	if (dram_type == DRAM_TYPE_LPDDR2 || is_lpddr3)
> +		zq_wait_short = max(max(next_timing->min_mrs_wait, (u32)6),
> +				    div_o3(90000, destination_clock_period)) +
> +				4;
> +	else if (dram_type == DRAM_TYPE_DDR3)
> +		zq_wait_short = max((u32)64,
> +				    div_o3(80000, destination_clock_period)) +
> +				2;
> +	else
> +		zq_wait_short = 0;
> +
> +	/*
> +	 * Step 6:
> +	 *   Training code - removed.
> +	 */
> +	emc_cc_dbg(STEPS, "Step 6\n");
> +
> +	/*
> +	 * Step 7:
> +	 *   Program FSP reference registers and send MRWs to new FSPWR.
> +	 */
> +	emc_cc_dbg(STEPS, "Step 7\n");
> +	emc_cc_dbg(SUB_STEPS, "Step 7.1: Bug 200024907 - Patch RP R2P");
> +	if (opt_war_200024907) {
> +		nRTP = 16;
> +		if (source_clock_period >= 1000000/1866) /* 535.91 ps */
> +			nRTP = 14;
> +		if (source_clock_period >= 1000000/1600) /* 625.00 ps */
> +			nRTP = 12;
> +		if (source_clock_period >= 1000000/1333) /* 750.19 ps */
> +			nRTP = 10;
> +		if (source_clock_period >= 1000000/1066) /* 938.09 ps */
> +			nRTP = 8;
> +
> +		deltaTWATM = max_t(u32, div_o3(7500, source_clock_period), 8);
> +
> +		/*
> +		 * Originally there was a + .5 in the tRPST calculation.
> +		 * However since we can't do FP in the kernel and the tRTM
> +		 * computation was in a floating point ceiling function, adding
> +		 * one to tRTP should be ok. There is no other source of non
> +		 * integer values, so the result was always going to be
> +		 * something for the form: f_ceil(N + .5) = N + 1;
> +		 */
> +		tRPST = ((last_timing->emc_mrw & 0x80) >> 7);
> +		tRTM = fake_timing->dram_timings[RL] +
> +		       div_o3(3600, source_clock_period) +
> +		       max_t(u32, div_o3(7500, source_clock_period), 8) +
> +		       tRPST + 1 + nRTP;
> +
> +		emc_cc_dbg(INFO, "tRTM = %u, EMC_RP = %u\n", tRTM,
> +			   next_timing->burst_regs[EMC_RP_INDEX]);
> +
> +		if (last_timing->burst_regs[EMC_RP_INDEX] < tRTM) {
> +			if (tRTM > (last_timing->burst_regs[EMC_R2P_INDEX] +
> +				    last_timing->burst_regs[EMC_RP_INDEX])) {
> +				R2P_war = tRTM -
> +					  last_timing->burst_regs[EMC_RP_INDEX];
> +				RP_war = last_timing->burst_regs[EMC_RP_INDEX];
> +				TRPab_war = last_timing->burst_regs[
> +					    EMC_TRPAB_INDEX];
> +				if (R2P_war > 63) {
> +					RP_war = R2P_war +
> +						 last_timing->burst_regs[
> +						 EMC_RP_INDEX] - 63;
> +					if (TRPab_war < RP_war)
> +						TRPab_war = RP_war;
> +					R2P_war = 63;
> +				}
> +			} else {
> +				R2P_war = last_timing->burst_regs[
> +					  EMC_R2P_INDEX];
> +				RP_war = last_timing->burst_regs[EMC_RP_INDEX];
> +				TRPab_war = last_timing->burst_regs[
> +					    EMC_TRPAB_INDEX];
> +			}
> +
> +			if (RP_war < deltaTWATM) {
> +				W2P_war = last_timing->burst_regs[EMC_W2P_INDEX]
> +					  + deltaTWATM - RP_war;
> +				if (W2P_war > 63) {
> +					RP_war = RP_war + W2P_war - 63;
> +					if (TRPab_war < RP_war)
> +						TRPab_war = RP_war;
> +					W2P_war = 63;
> +				}
> +			} else {
> +				W2P_war = last_timing->burst_regs[
> +					  EMC_W2P_INDEX];
> +			}
> +
> +			if ((last_timing->burst_regs[EMC_W2P_INDEX] ^
> +			     W2P_war) ||
> +			    (last_timing->burst_regs[EMC_R2P_INDEX] ^
> +			     R2P_war) ||
> +			    (last_timing->burst_regs[EMC_RP_INDEX] ^
> +			     RP_war) ||
> +			    (last_timing->burst_regs[EMC_TRPAB_INDEX] ^
> +			     TRPab_war)) {
> +				emc_writel(emc, RP_war, EMC_RP);
> +				emc_writel(emc, R2P_war, EMC_R2P);
> +				emc_writel(emc, W2P_war, EMC_W2P);
> +				emc_writel(emc, TRPab_war, EMC_TRPAB);
> +			}
> +			emc_timing_update(emc, DUAL_CHANNEL);
> +		} else {
> +			emc_cc_dbg(INFO, "Skipped WAR\n");
> +		}
> +	}
> +
> +	if (!fsp_for_next_freq) {
> +		mr13_flip_fspwr = (next_timing->emc_mrw3 & 0xffffff3f) | 0x80;
> +		mr13_flip_fspop = (next_timing->emc_mrw3 & 0xffffff3f) | 0x00;
> +	} else {
> +		mr13_flip_fspwr = (next_timing->emc_mrw3 & 0xffffff3f) | 0x40;
> +		mr13_flip_fspop = (next_timing->emc_mrw3 & 0xffffff3f) | 0xc0;
> +	}
> +
> +	mr13_catr_enable = (mr13_flip_fspwr & 0xFFFFFFFE) | 0x01;
> +	if (dram_dev_num == TWO_RANK)
> +		mr13_catr_enable = (mr13_catr_enable & 0x3fffffff) | 0x80000000;
> +
> +	if (dram_type == DRAM_TYPE_LPDDR4) {
> +		emc_writel(emc, mr13_flip_fspwr, EMC_MRW3);
> +		emc_writel(emc, next_timing->emc_mrw, EMC_MRW);
> +		emc_writel(emc, next_timing->emc_mrw2, EMC_MRW2);
> +	}
> +
> +	/*
> +	 * Step 8:
> +	 *   Program the shadow registers.
> +	 */
> +	emc_cc_dbg(STEPS, "Step 8\n");
> +	emc_cc_dbg(SUB_STEPS, "Writing burst_regs\n");
> +	for (i = 0; i < next_timing->num_burst; i++) {
> +		u32 var;
> +		u32 wval;
> +
> +		if (!burst_regs_off[i])
> +			continue;
> +
> +		var = burst_regs_off[i];
> +		wval = next_timing->burst_regs[i];
> +
> +		if (dram_type != DRAM_TYPE_LPDDR4 &&
> +		    (var == EMC_MRW6      || var == EMC_MRW7 ||
> +		     var == EMC_MRW8      || var == EMC_MRW9 ||
> +		     var == EMC_MRW10     || var == EMC_MRW11 ||
> +		     var == EMC_MRW12     || var == EMC_MRW13 ||
> +		     var == EMC_MRW14     || var == EMC_MRW15 ||
> +		     var == EMC_TRAINING_CTRL))
> +			continue;
> +
> +		/* Pain... And suffering. */
> +		if (var == EMC_CFG) {
> +			wval &= ~EMC_CFG_DRAM_ACPD;
> +			wval &= ~EMC_CFG_DYN_SELF_REF;
> +			if (dram_type == DRAM_TYPE_LPDDR4) {
> +				wval &= ~EMC_CFG_DRAM_CLKSTOP_SR;
> +				wval &= ~EMC_CFG_DRAM_CLKSTOP_PD;
> +			}
> +		} else if (var == EMC_MRS_WAIT_CNT &&
> +			   dram_type == DRAM_TYPE_LPDDR2 &&
> +			   opt_zcal_en_cc && !opt_cc_short_zcal &&
> +			   opt_short_zcal) {
> +			wval = (wval & ~(EMC_MRS_WAIT_CNT_SHORT_WAIT_MASK <<
> +					 EMC_MRS_WAIT_CNT_SHORT_WAIT_SHIFT)) |
> +			   ((zq_wait_long & EMC_MRS_WAIT_CNT_SHORT_WAIT_MASK) <<
> +			    EMC_MRS_WAIT_CNT_SHORT_WAIT_SHIFT);
> +		} else if (var == EMC_ZCAL_WAIT_CNT &&
> +			   dram_type == DRAM_TYPE_DDR3 && opt_zcal_en_cc &&
> +			   !opt_cc_short_zcal && opt_short_zcal) {
> +			wval = (wval & ~(EMC_ZCAL_WAIT_CNT_ZCAL_WAIT_CNT_MASK <<
> +					 EMC_ZCAL_WAIT_CNT_ZCAL_WAIT_CNT_SHIFT))
> +			       | ((zq_wait_long &
> +				   EMC_ZCAL_WAIT_CNT_ZCAL_WAIT_CNT_MASK) <<
> +				  EMC_MRS_WAIT_CNT_SHORT_WAIT_SHIFT);
> +		} else if (var == EMC_ZCAL_INTERVAL && opt_zcal_en_cc) {
> +			wval = 0; /* EMC_ZCAL_INTERVAL reset value. */
> +		} else if (var == EMC_PMACRO_AUTOCAL_CFG_COMMON) {
> +			wval |= EMC_PMACRO_AUTOCAL_CFG_COMMON_E_CAL_BYPASS_DVFS;
> +		} else if (var == EMC_PMACRO_DATA_PAD_TX_CTRL) {
> +			wval &=
> +			     ~(EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSP_TX_E_DCC |
> +			       EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSN_TX_E_DCC |
> +			       EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQ_TX_E_DCC |
> +			       EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_CMD_TX_E_DCC);
> +		} else if (var == EMC_PMACRO_CMD_PAD_TX_CTRL) {
> +			wval |= EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_DRVFORCEON;
> +			wval &= ~(EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSP_TX_E_DCC |
> +				  EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSN_TX_E_DCC |
> +				  EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_E_DCC |
> +				  EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_CMD_TX_E_DCC);
> +		} else if (var == EMC_PMACRO_BRICK_CTRL_RFU1) {
> +			wval &= 0xf800f800;
> +		} else if (var == EMC_PMACRO_COMMON_PAD_TX_CTRL) {
> +			wval &= 0xfffffff0;
> +		}
> +
> +		emc_writel(emc, wval, var);
> +	}
> +
> +	/* SW addition: do EMC refresh adjustment here. */
> +	set_over_temp_timing(emc, next_timing, dram_over_temp_state);
> +
> +	if (dram_type == DRAM_TYPE_LPDDR4) {
> +		mrw_req = (23 << EMC_MRW_MRW_MA_SHIFT) |
> +			  (next_timing->run_clocks & EMC_MRW_MRW_OP_MASK);
> +		emc_writel(emc, mrw_req, EMC_MRW);
> +	}
> +
> +	/* Per channel burst registers. */
> +	emc_cc_dbg(SUB_STEPS, "Writing burst_regs_per_ch\n");
> +	for (i = 0; i < next_timing->num_burst_per_ch; i++) {
> +		if (!burst_regs_per_ch_off[i])
> +			continue;
> +
> +		if (dram_type != DRAM_TYPE_LPDDR4 &&
> +		    (burst_regs_per_ch_off[i] == EMC_MRW6 ||
> +		     burst_regs_per_ch_off[i] == EMC_MRW7 ||
> +		     burst_regs_per_ch_off[i] == EMC_MRW8 ||
> +		     burst_regs_per_ch_off[i] == EMC_MRW9 ||
> +		     burst_regs_per_ch_off[i] == EMC_MRW10 ||
> +		     burst_regs_per_ch_off[i] == EMC_MRW11 ||
> +		     burst_regs_per_ch_off[i] == EMC_MRW12 ||
> +		     burst_regs_per_ch_off[i] == EMC_MRW13 ||
> +		     burst_regs_per_ch_off[i] == EMC_MRW14 ||
> +		     burst_regs_per_ch_off[i] == EMC_MRW15))
> +			continue;
> +
> +		/* Filter out second channel if not in DUAL_CHANNEL mode. */
> +		if (channel_mode != DUAL_CHANNEL &&
> +		    burst_regs_per_ch_type[i] >= REG_EMC1)
> +			continue;
> +
> +		emc_cc_dbg(REG_LISTS, "(%u) 0x%08x => 0x%08x\n",
> +			   i, next_timing->burst_reg_per_ch[i],
> +			   burst_regs_per_ch_off[i]);
> +		emc_writel_per_ch(emc, next_timing->burst_reg_per_ch[i],
> +				  burst_regs_per_ch_type[i],
> +				  burst_regs_per_ch_off[i]);
> +	}
> +
> +	/* Vref regs. */
> +	emc_cc_dbg(SUB_STEPS, "Writing vref_regs\n");
> +	for (i = 0; i < next_timing->vref_num; i++) {
> +		if (!vref_regs_per_ch_off[i])
> +			continue;
> +
> +		if (channel_mode != DUAL_CHANNEL &&
> +			vref_regs_per_ch_type[i] >= REG_EMC1)
> +			continue;
> +
> +		emc_cc_dbg(REG_LISTS, "(%u) 0x%08x => 0x%08x\n",
> +			   i, next_timing->vref_perch_regs[i],
> +			   vref_regs_per_ch_off[i]);
> +		emc_writel_per_ch(emc, next_timing->vref_perch_regs[i],
> +				  vref_regs_per_ch_type[i],
> +				  vref_regs_per_ch_off[i]);
> +	}
> +
> +	/* Trimmers. */
> +	emc_cc_dbg(SUB_STEPS, "Writing trim_regs\n");
> +	for (i = 0; i < next_timing->num_trim; i++) {
> +		u64 trim_reg;
> +
> +		if (!trim_regs_off[i])
> +			continue;
> +
> +		trim_reg = trim_regs_off[i];
> +		if (compensate_trimmer_applicable &&
> +		    (trim_reg == EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0 ||
> +		     trim_reg == EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1 ||
> +		     trim_reg == EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2 ||
> +		     trim_reg == EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3 ||
> +		     trim_reg == EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0 ||
> +		     trim_reg == EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1 ||
> +		     trim_reg == EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2 ||
> +		     trim_reg == EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3 ||
> +		     trim_reg == EMC_DATA_BRLSHFT_0 ||
> +		     trim_reg == EMC_DATA_BRLSHFT_1)) {
> +			u32 reg = tegra210_apply_periodic_compensation_trimmer(
> +				  next_timing, trim_reg);
> +			emc_cc_dbg(REG_LISTS, "(%u) 0x%08x => 0x%08x\n", i, reg,
> +				   trim_regs_off[i]);
> +			emc_cc_dbg(EMA_WRITES, "0x%08x <= 0x%08x\n",
> +				   (u32)(u64)trim_regs_off[i], reg);
> +			emc_writel(emc, reg, trim_regs_off[i]);
> +		} else {
> +			emc_cc_dbg(REG_LISTS, "(%u) 0x%08x => 0x%08x\n",
> +				   i, next_timing->trim_regs[i],
> +				   trim_regs_off[i]);
> +			emc_writel(emc, next_timing->trim_regs[i],
> +				   trim_regs_off[i]);
> +		}
> +	}
> +
> +	/* Per channel trimmers. */
> +	emc_cc_dbg(SUB_STEPS, "Writing trim_regs_per_ch\n");
> +	for (i = 0; i < next_timing->num_trim_per_ch; i++) {
> +		u32 trim_reg;
> +
> +		if (!trim_regs_per_ch_off[i])
> +			continue;
> +
> +		if (channel_mode != DUAL_CHANNEL &&
> +			trim_regs_per_ch_type[i] >= REG_EMC1)
> +			continue;
> +
> +		trim_reg = trim_regs_per_ch_off[i];
> +		if (compensate_trimmer_applicable &&
> +		    (trim_reg == EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0 ||
> +		     trim_reg == EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1 ||
> +		     trim_reg == EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2 ||
> +		     trim_reg == EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3 ||
> +		     trim_reg == EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0 ||
> +		     trim_reg == EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1 ||
> +		     trim_reg == EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2 ||
> +		     trim_reg == EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3 ||
> +		     trim_reg == EMC_DATA_BRLSHFT_0 ||
> +		     trim_reg == EMC_DATA_BRLSHFT_1)) {
> +			u32 reg =
> +				tegra210_apply_periodic_compensation_trimmer(
> +						next_timing, trim_reg);
> +			emc_cc_dbg(REG_LISTS, "(%u) 0x%08x => 0x%08x\n",
> +				   i, reg, trim_regs_per_ch_off[i]);
> +			emc_cc_dbg(EMA_WRITES, "0x%08x <= 0x%08x\n",
> +				   trim_regs_per_ch_off[i], reg);
> +			emc_writel_per_ch(emc, reg, trim_regs_per_ch_type[i],
> +					  trim_regs_per_ch_off[i]);
> +		} else {
> +			emc_cc_dbg(REG_LISTS, "(%u) 0x%08x => 0x%08x\n",
> +				   i, next_timing->trim_perch_regs[i],
> +				   trim_regs_per_ch_off[i]);
> +			emc_writel_per_ch(emc, next_timing->trim_perch_regs[i],
> +					  trim_regs_per_ch_type[i],
> +					  trim_regs_per_ch_off[i]);
> +		}
> +	}
> +
> +	emc_cc_dbg(SUB_STEPS, "Writing burst_mc_regs\n");
> +	for (i = 0; i < next_timing->num_mc_regs; i++) {
> +		emc_cc_dbg(REG_LISTS, "(%u) 0x%08x => 0x%08x\n",
> +			   i, next_timing->burst_mc_regs[i],
> +			   burst_mc_regs_off[i]);
> +		mc_writel(emc->mc, next_timing->burst_mc_regs[i],
> +			  burst_mc_regs_off[i]);
> +	}
> +
> +	/* Registers to be programmed on the faster clock. */
> +	if (next_timing->rate < last_timing->rate) {
> +		emc_cc_dbg(SUB_STEPS, "Writing la_scale_regs\n");
> +		for (i = 0; i < next_timing->num_up_down; i++) {
> +			emc_cc_dbg(REG_LISTS, "(%u) 0x%08x => 0x%08x\n",
> +				   i, next_timing->la_scale_regs[i],
> +				   la_scale_regs_off[i]);
> +			mc_writel(emc->mc, next_timing->la_scale_regs[i],
> +				  la_scale_regs_off[i]);
> +		}
> +	}
> +
> +	/* Flush all the burst register writes. */
> +	wmb();

Won't it be a bit more optimal to just read back the lastly written register rather than to flush all of memory writes? 

-- 
Dmitry
