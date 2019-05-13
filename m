Return-Path: <SRS0=NIgS=TN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,UPPERCASE_50_75 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9097C04AA7
	for <linux-clk@archiver.kernel.org>; Mon, 13 May 2019 17:02:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A1C920879
	for <linux-clk@archiver.kernel.org>; Mon, 13 May 2019 17:02:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ssKQ8hdn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731184AbfEMRCz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 May 2019 13:02:55 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42454 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730120AbfEMRCy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 May 2019 13:02:54 -0400
Received: by mail-lj1-f193.google.com with SMTP id 188so11660557ljf.9;
        Mon, 13 May 2019 10:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ahl/+JAj1TLqUpCcKRoEje21ovkCu+pn9BkRA12CT0s=;
        b=ssKQ8hdncQtKmrz3W71QLnHhLMgKKQ0zyYAJVC3GoHqsdx2+0c/ye1YbouDJ5uw+xP
         IQEs8/3VcYvLBRvjNV4+8NGPS12abd11uuNQ4E0pgEi71hpN8JJhYlT4w2OrIFQZ9HvE
         nwmA/VICrogPXLGSJxQZ40adarX4z/rZSYmA8bOH+z3bSRk29sA/MF2cJbuXi3N4NK4+
         oh1OXbsc6NYFYr0z/CrXURm1X3jlTLr/7sdJmuVAQ/14Q55Is2L5F+sf1cc3aOo51Ae4
         sS3s7qx/eMlBY35Lz5zS5XZg+0ywjKnyUzT9CM/fyOrhfjmMBqaKlvheeWBS4FbTiRRd
         qZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ahl/+JAj1TLqUpCcKRoEje21ovkCu+pn9BkRA12CT0s=;
        b=k+DvKzuF+cdkDyqV2rWwzA9KEzJM510KHA6tHgNw9hZbHJRcHgw+4ciAqVqXqXZQTd
         apA7vs2b+Pv+fflaXW3u2y1bTr5Fi0fEjJPXdFj9Daso8alEG4Sa0nwhIuurH5Nx757G
         9E9eH5FDMlyFjVWenG0qP8k252lXFiSTvPz5cAgUPamiv9QQoy3e/aE2WwqbFQunDyoE
         otELfMnaew85hbEDE2VzW6qWKxQz4UTUXKNKGSzO3V6lq4gET2XFWFTiO2sdsiWz7bu2
         KdcSQrbisf93RfSnxPrd9vpI8newftbx7TC+Yy0089QYAhf1Mfap5X9UWgeIh5KFqBjh
         58HA==
X-Gm-Message-State: APjAAAVcvuqIAFJC735PgbcLr3Ox065Ybl4pFURA+lNgOV9uxu9Okj2t
        HGtfqH+WJt6kaMw953RrR2tf/ccM
X-Google-Smtp-Source: APXvYqy+THmpZcWRnW3q5UEoZPFSmJr1/pFht1NZEGGAX4MVSZjqQE43Vb+wqtqYbnMvyJQhf6hMLA==
X-Received: by 2002:a2e:9547:: with SMTP id t7mr14413266ljh.153.1557766969938;
        Mon, 13 May 2019 10:02:49 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
        by smtp.googlemail.com with ESMTPSA id s29sm968400lfc.51.2019.05.13.10.02.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 10:02:46 -0700 (PDT)
Subject: Re: [PATCH V3 5/8] memory: tegra: Add EMC scaling support code for
 Tegra210
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20190510084719.18902-1-josephl@nvidia.com>
 <20190510084719.18902-6-josephl@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dc580a9b-4d37-ae20-888d-3956b284c43b@gmail.com>
Date:   Mon, 13 May 2019 20:02:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510084719.18902-6-josephl@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

10.05.2019 11:47, Joseph Lo пишет:
> This patch adds the required APIs and variables for the EMC scaling
> sequence code on Tegra210.
> 
> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  drivers/memory/tegra/tegra210-emc.c | 1369 +++++++++++++++++++++++++++
>  drivers/memory/tegra/tegra210-emc.h |  722 ++++++++++++++
>  2 files changed, 2091 insertions(+)
> 
> diff --git a/drivers/memory/tegra/tegra210-emc.c b/drivers/memory/tegra/tegra210-emc.c
> index f0471ca7062d..285dfc1ed7c2 100644
> --- a/drivers/memory/tegra/tegra210-emc.c
> +++ b/drivers/memory/tegra/tegra210-emc.c
> @@ -21,11 +21,27 @@
>  #define EMC_CLK_EMC_2X_CLK_SRC_SHIFT			29
>  #define EMC_CLK_EMC_2X_CLK_SRC_MASK			\
>  	(0x7 << EMC_CLK_EMC_2X_CLK_SRC_SHIFT)
> +#define EMC_CLK_SOURCE_PLLM_LJ				0x4
> +#define EMC_CLK_SOURCE_PLLMB_LJ				0x5
>  #define EMC_CLK_MC_EMC_SAME_FREQ			BIT(16)
>  #define EMC_CLK_EMC_2X_CLK_DIVISOR_SHIFT		0
>  #define EMC_CLK_EMC_2X_CLK_DIVISOR_MASK			\
>  	(0xff << EMC_CLK_EMC_2X_CLK_DIVISOR_SHIFT)
>  
> +#define CLK_RST_CONTROLLER_CLK_SOURCE_EMC_DLL		0x664
> +#define DLL_CLK_EMC_DLL_CLK_SRC_SHIFT			29
> +#define DLL_CLK_EMC_DLL_CLK_SRC_MASK			\
> +	(0x7 << DLL_CLK_EMC_DLL_CLK_SRC_SHIFT)
> +#define DLL_CLK_EMC_DLL_DDLL_CLK_SEL_SHIFT		10
> +#define DLL_CLK_EMC_DLL_DDLL_CLK_SEL_MASK		\
> +	(0x3 << DLL_CLK_EMC_DLL_DDLL_CLK_SEL_SHIFT)
> +#define PLLM_VCOA					0
> +#define PLLM_VCOB					1
> +#define EMC_DLL_SWITCH_OUT				2
> +#define DLL_CLK_EMC_DLL_CLK_DIVISOR_SHIFT		0
> +#define DLL_CLK_EMC_DLL_CLK_DIVISOR_MASK		\
> +	(0xff << DLL_CLK_EMC_DLL_CLK_DIVISOR_SHIFT)
> +
>  #define MC_EMEM_ARB_MISC0_EMC_SAME_FREQ			BIT(27)
>  
>  #define TEGRA_EMC_MAX_FREQS		16
> @@ -34,7 +50,46 @@
>  #define CLK_CHANGE_DELAY 100
>  #define TRAINING_TIME 100
>  
> +#define EMC0_EMC_DATA_BRLSHFT_0_INDEX	2
> +#define EMC1_EMC_DATA_BRLSHFT_0_INDEX	3
> +#define EMC0_EMC_DATA_BRLSHFT_1_INDEX	4
> +#define EMC1_EMC_DATA_BRLSHFT_1_INDEX	5
> +
> +#define TRIM_REG(chan, rank, reg, byte)					\
> +	(((EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
> +	   _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte ## _MASK &	\
> +	   next_timing->trim_regs[EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ##	\
> +				 rank ## _ ## reg ## _INDEX]) >>	\
> +	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
> +	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte ## _SHIFT)	\
> +	 +								\
> +	 (((EMC_DATA_BRLSHFT_ ## rank ## _RANK ## rank ## _BYTE ##	\
> +	    byte ## _DATA_BRLSHFT_MASK &				\
> +	    next_timing->trim_perch_regs[EMC ## chan ##			\
> +			      _EMC_DATA_BRLSHFT_ ## rank ## _INDEX]) >>	\
> +	   EMC_DATA_BRLSHFT_ ## rank ## _RANK ## rank ## _BYTE ##	\
> +	   byte ## _DATA_BRLSHFT_SHIFT) * 64))
> +
> +#define CALC_TEMP(rank, reg, byte1, byte2, n)				\
> +	(((new[n] << EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ##	\
> +	   reg ## _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte1 ## _SHIFT) & \
> +	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
> +	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte1 ## _MASK)	\
> +	 |								\
> +	 ((new[n + 1] << EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ##\
> +	   reg ## _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte2 ## _SHIFT) & \
> +	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
> +	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte2 ## _MASK))
> +
>  enum {
> +	TEGRA_DRAM_OVER_TEMP_NONE = 0,
> +	TEGRA_DRAM_OVER_TEMP_REFRESH_X2,
> +	TEGRA_DRAM_OVER_TEMP_REFRESH_X4,
> +	TEGRA_DRAM_OVER_TEMP_THROTTLE, /* 4x Refresh + derating. */
> +	TEGRA_DRAM_OVER_TEMP_MAX,
> +};
> +
> +enum TEGRA_EMC_SOURCE {
>  	TEGRA_EMC_SRC_PLLM,
>  	TEGRA_EMC_SRC_PLLC,
>  	TEGRA_EMC_SRC_PLLP,
> @@ -88,17 +143,499 @@ static const struct supported_sequence supported_seqs[] = {
>  };
>  static const struct supported_sequence *seq = supported_seqs;
>  static DEFINE_SPINLOCK(emc_access_lock);
> +unsigned long dram_over_temp_state = TEGRA_DRAM_OVER_TEMP_NONE;
> +
> +const struct emc_table_register_offset reg_off = {
> +	.burst_regs_off = {
> +		EMC_RC,
> +		EMC_RFC,
> +		EMC_RFCPB,
> +		EMC_REFCTRL2,
> +		EMC_RFC_SLR,
> +		EMC_RAS,
> +		EMC_RP,
> +		EMC_R2W,
> +		EMC_W2R,
> +		EMC_R2P,
> +		EMC_W2P,
> +		EMC_R2R,
> +		EMC_TPPD,
> +		EMC_CCDMW,
> +		EMC_RD_RCD,
> +		EMC_WR_RCD,
> +		EMC_RRD,
> +		EMC_REXT,
> +		EMC_WEXT,
> +		EMC_WDV_CHK,
> +		EMC_WDV,
> +		EMC_WSV,
> +		EMC_WEV,
> +		EMC_WDV_MASK,
> +		EMC_WS_DURATION,
> +		EMC_WE_DURATION,
> +		EMC_QUSE,
> +		EMC_QUSE_WIDTH,
> +		EMC_IBDLY,
> +		EMC_OBDLY,
> +		EMC_EINPUT,
> +		EMC_MRW6,
> +		EMC_EINPUT_DURATION,
> +		EMC_PUTERM_EXTRA,
> +		EMC_PUTERM_WIDTH,
> +		EMC_QRST,
> +		EMC_QSAFE,
> +		EMC_RDV,
> +		EMC_RDV_MASK,
> +		EMC_RDV_EARLY,
> +		EMC_RDV_EARLY_MASK,
> +		EMC_REFRESH,
> +		EMC_BURST_REFRESH_NUM,
> +		EMC_PRE_REFRESH_REQ_CNT,
> +		EMC_PDEX2WR,
> +		EMC_PDEX2RD,
> +		EMC_PCHG2PDEN,
> +		EMC_ACT2PDEN,
> +		EMC_AR2PDEN,
> +		EMC_RW2PDEN,
> +		EMC_CKE2PDEN,
> +		EMC_PDEX2CKE,
> +		EMC_PDEX2MRR,
> +		EMC_TXSR,
> +		EMC_TXSRDLL,
> +		EMC_TCKE,
> +		EMC_TCKESR,
> +		EMC_TPD,
> +		EMC_TFAW,
> +		EMC_TRPAB,
> +		EMC_TCLKSTABLE,
> +		EMC_TCLKSTOP,
> +		EMC_MRW7,
> +		EMC_TREFBW,
> +		EMC_ODT_WRITE,
> +		EMC_FBIO_CFG5,
> +		EMC_FBIO_CFG7,
> +		EMC_CFG_DIG_DLL,
> +		EMC_CFG_DIG_DLL_PERIOD,
> +		EMC_PMACRO_IB_RXRT,
> +		EMC_CFG_PIPE_1,
> +		EMC_CFG_PIPE_2,
> +		EMC_PMACRO_QUSE_DDLL_RANK0_4,
> +		EMC_PMACRO_QUSE_DDLL_RANK0_5,
> +		EMC_PMACRO_QUSE_DDLL_RANK1_4,
> +		EMC_PMACRO_QUSE_DDLL_RANK1_5,
> +		EMC_MRW8,
> +		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_4,
> +		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_5,
> +		EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_0,
> +		EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_1,
> +		EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_2,
> +		EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_3,
> +		EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_4,
> +		EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_5,
> +		EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_0,
> +		EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_1,
> +		EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_2,
> +		EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_3,
> +		EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_4,
> +		EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_5,
> +		EMC_PMACRO_DDLL_LONG_CMD_0,
> +		EMC_PMACRO_DDLL_LONG_CMD_1,
> +		EMC_PMACRO_DDLL_LONG_CMD_2,
> +		EMC_PMACRO_DDLL_LONG_CMD_3,
> +		EMC_PMACRO_DDLL_LONG_CMD_4,
> +		EMC_PMACRO_DDLL_SHORT_CMD_0,
> +		EMC_PMACRO_DDLL_SHORT_CMD_1,
> +		EMC_PMACRO_DDLL_SHORT_CMD_2,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE0_3,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE1_3,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE2_3,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE3_3,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE4_3,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE5_3,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE6_3,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE7_3,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD0_3,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD1_3,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD2_3,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD3_3,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE0_3,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE1_3,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE2_3,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE3_3,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE4_3,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE5_3,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE6_3,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE7_3,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD0_0,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD0_1,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD0_2,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD0_3,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD1_0,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD1_1,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD1_2,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD1_3,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD2_0,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD2_1,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD2_2,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD2_3,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD3_0,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD3_1,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD3_2,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD3_3,
> +		EMC_TXDSRVTTGEN,
> +		EMC_FDPD_CTRL_DQ,
> +		EMC_FDPD_CTRL_CMD,
> +		EMC_FBIO_SPARE,
> +		EMC_ZCAL_INTERVAL,
> +		EMC_ZCAL_WAIT_CNT,
> +		EMC_MRS_WAIT_CNT,
> +		EMC_MRS_WAIT_CNT2,
> +		EMC_AUTO_CAL_CHANNEL,
> +		EMC_DLL_CFG_0,
> +		EMC_DLL_CFG_1,
> +		EMC_PMACRO_AUTOCAL_CFG_COMMON,
> +		EMC_PMACRO_ZCTRL,
> +		EMC_CFG,
> +		EMC_CFG_PIPE,
> +		EMC_DYN_SELF_REF_CONTROL,
> +		EMC_QPOP,
> +		EMC_DQS_BRLSHFT_0,
> +		EMC_DQS_BRLSHFT_1,
> +		EMC_CMD_BRLSHFT_2,
> +		EMC_CMD_BRLSHFT_3,
> +		EMC_PMACRO_PAD_CFG_CTRL,
> +		EMC_PMACRO_DATA_PAD_RX_CTRL,
> +		EMC_PMACRO_CMD_PAD_RX_CTRL,
> +		EMC_PMACRO_DATA_RX_TERM_MODE,
> +		EMC_PMACRO_CMD_RX_TERM_MODE,
> +		EMC_PMACRO_CMD_PAD_TX_CTRL,
> +		EMC_PMACRO_DATA_PAD_TX_CTRL,
> +		EMC_PMACRO_COMMON_PAD_TX_CTRL,
> +		EMC_PMACRO_VTTGEN_CTRL_0,
> +		EMC_PMACRO_VTTGEN_CTRL_1,
> +		EMC_PMACRO_VTTGEN_CTRL_2,
> +		EMC_PMACRO_BRICK_CTRL_RFU1,
> +		EMC_PMACRO_CMD_BRICK_CTRL_FDPD,
> +		EMC_PMACRO_BRICK_CTRL_RFU2,
> +		EMC_PMACRO_DATA_BRICK_CTRL_FDPD,
> +		EMC_PMACRO_BG_BIAS_CTRL_0,
> +		EMC_CFG_3,
> +		EMC_PMACRO_TX_PWRD_0,
> +		EMC_PMACRO_TX_PWRD_1,
> +		EMC_PMACRO_TX_PWRD_2,
> +		EMC_PMACRO_TX_PWRD_3,
> +		EMC_PMACRO_TX_PWRD_4,
> +		EMC_PMACRO_TX_PWRD_5,
> +		EMC_CONFIG_SAMPLE_DELAY,
> +		EMC_PMACRO_TX_SEL_CLK_SRC_0,
> +		EMC_PMACRO_TX_SEL_CLK_SRC_1,
> +		EMC_PMACRO_TX_SEL_CLK_SRC_2,
> +		EMC_PMACRO_TX_SEL_CLK_SRC_3,
> +		EMC_PMACRO_TX_SEL_CLK_SRC_4,
> +		EMC_PMACRO_TX_SEL_CLK_SRC_5,
> +		EMC_PMACRO_DDLL_BYPASS,
> +		EMC_PMACRO_DDLL_PWRD_0,
> +		EMC_PMACRO_DDLL_PWRD_1,
> +		EMC_PMACRO_DDLL_PWRD_2,
> +		EMC_PMACRO_CMD_CTRL_0,
> +		EMC_PMACRO_CMD_CTRL_1,
> +		EMC_PMACRO_CMD_CTRL_2,
> +		EMC_TR_TIMING_0,
> +		EMC_TR_DVFS,
> +		EMC_TR_CTRL_1,
> +		EMC_TR_RDV,
> +		EMC_TR_QPOP,
> +		EMC_TR_RDV_MASK,
> +		EMC_MRW14,
> +		EMC_TR_QSAFE,
> +		EMC_TR_QRST,
> +		EMC_TRAINING_CTRL,
> +		EMC_TRAINING_SETTLE,
> +		EMC_TRAINING_VREF_SETTLE,
> +		EMC_TRAINING_CA_FINE_CTRL,
> +		EMC_TRAINING_CA_CTRL_MISC,
> +		EMC_TRAINING_CA_CTRL_MISC1,
> +		EMC_TRAINING_CA_VREF_CTRL,
> +		EMC_TRAINING_QUSE_CORS_CTRL,
> +		EMC_TRAINING_QUSE_FINE_CTRL,
> +		EMC_TRAINING_QUSE_CTRL_MISC,
> +		EMC_TRAINING_QUSE_VREF_CTRL,
> +		EMC_TRAINING_READ_FINE_CTRL,
> +		EMC_TRAINING_READ_CTRL_MISC,
> +		EMC_TRAINING_READ_VREF_CTRL,
> +		EMC_TRAINING_WRITE_FINE_CTRL,
> +		EMC_TRAINING_WRITE_CTRL_MISC,
> +		EMC_TRAINING_WRITE_VREF_CTRL,
> +		EMC_TRAINING_MPC,
> +		EMC_MRW15,
> +	},
> +	.trim_regs_off = {
> +		EMC_PMACRO_IB_DDLL_LONG_DQS_RANK0_0,
> +		EMC_PMACRO_IB_DDLL_LONG_DQS_RANK0_1,
> +		EMC_PMACRO_IB_DDLL_LONG_DQS_RANK0_2,
> +		EMC_PMACRO_IB_DDLL_LONG_DQS_RANK0_3,
> +		EMC_PMACRO_IB_DDLL_LONG_DQS_RANK1_0,
> +		EMC_PMACRO_IB_DDLL_LONG_DQS_RANK1_1,
> +		EMC_PMACRO_IB_DDLL_LONG_DQS_RANK1_2,
> +		EMC_PMACRO_IB_DDLL_LONG_DQS_RANK1_3,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE0_0,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE0_1,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE0_2,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE1_0,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE1_1,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE1_2,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE2_0,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE2_1,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE2_2,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE3_0,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE3_1,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE3_2,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE4_0,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE4_1,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE4_2,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE5_0,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE5_1,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE5_2,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE6_0,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE6_1,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE6_2,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE7_0,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE7_1,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE7_2,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE0_0,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE0_1,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE0_2,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE1_0,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE1_1,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE1_2,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE2_0,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE2_1,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE2_2,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE3_0,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE3_1,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE3_2,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE4_0,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE4_1,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE4_2,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE5_0,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE5_1,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE5_2,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE6_0,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE6_1,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE6_2,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE7_0,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE7_1,
> +		EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE7_2,
> +		EMC_PMACRO_IB_VREF_DQS_0,
> +		EMC_PMACRO_IB_VREF_DQS_1,
> +		EMC_PMACRO_IB_VREF_DQ_0,
> +		EMC_PMACRO_IB_VREF_DQ_1,
> +		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0,
> +		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1,
> +		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2,
> +		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3,
> +		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_4,
> +		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_5,
> +		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0,
> +		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1,
> +		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2,
> +		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE0_0,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE0_1,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE0_2,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE1_0,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE1_1,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE1_2,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE2_0,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE2_1,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE2_2,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE3_0,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE3_1,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE3_2,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE4_0,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE4_1,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE4_2,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE5_0,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE5_1,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE5_2,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE6_0,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE6_1,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE6_2,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE7_0,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE7_1,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE7_2,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD0_0,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD0_1,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD0_2,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD1_0,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD1_1,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD1_2,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD2_0,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD2_1,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD2_2,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD3_0,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD3_1,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD3_2,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE0_0,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE0_1,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE0_2,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE1_0,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE1_1,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE1_2,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE2_0,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE2_1,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE2_2,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE3_0,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE3_1,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE3_2,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE4_0,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE4_1,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE4_2,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE5_0,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE5_1,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE5_2,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE6_0,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE6_1,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE6_2,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE7_0,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE7_1,
> +		EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE7_2,
> +		EMC_PMACRO_QUSE_DDLL_RANK0_0,
> +		EMC_PMACRO_QUSE_DDLL_RANK0_1,
> +		EMC_PMACRO_QUSE_DDLL_RANK0_2,
> +		EMC_PMACRO_QUSE_DDLL_RANK0_3,
> +		EMC_PMACRO_QUSE_DDLL_RANK1_0,
> +		EMC_PMACRO_QUSE_DDLL_RANK1_1,
> +		EMC_PMACRO_QUSE_DDLL_RANK1_2,
> +		EMC_PMACRO_QUSE_DDLL_RANK1_3
> +	},
> +	.burst_mc_regs_off = {
> +		MC_EMEM_ARB_CFG,
> +		MC_EMEM_ARB_OUTSTANDING_REQ,
> +		MC_EMEM_ARB_REFPB_HP_CTRL,
> +		MC_EMEM_ARB_REFPB_BANK_CTRL,
> +		MC_EMEM_ARB_TIMING_RCD,
> +		MC_EMEM_ARB_TIMING_RP,
> +		MC_EMEM_ARB_TIMING_RC,
> +		MC_EMEM_ARB_TIMING_RAS,
> +		MC_EMEM_ARB_TIMING_FAW,
> +		MC_EMEM_ARB_TIMING_RRD,
> +		MC_EMEM_ARB_TIMING_RAP2PRE,
> +		MC_EMEM_ARB_TIMING_WAP2PRE,
> +		MC_EMEM_ARB_TIMING_R2R,
> +		MC_EMEM_ARB_TIMING_W2W,
> +		MC_EMEM_ARB_TIMING_R2W,
> +		MC_EMEM_ARB_TIMING_CCDMW,
> +		MC_EMEM_ARB_TIMING_W2R,
> +		MC_EMEM_ARB_TIMING_RFCPB,
> +		MC_EMEM_ARB_DA_TURNS,
> +		MC_EMEM_ARB_DA_COVERS,
> +		MC_EMEM_ARB_MISC0,
> +		MC_EMEM_ARB_MISC1,
> +		MC_EMEM_ARB_MISC2,
> +		MC_EMEM_ARB_RING1_THROTTLE,
> +		MC_EMEM_ARB_DHYST_CTRL,
> +		MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_0,
> +		MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_1,
> +		MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_2,
> +		MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_3,
> +		MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_4,
> +		MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_5,
> +		MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_6,
> +		MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_7,
> +	},
> +	.la_scale_regs_off = {
> +		MC_MLL_MPCORER_PTSA_RATE,
> +		MC_FTOP_PTSA_RATE,
> +		MC_PTSA_GRANT_DECREMENT,
> +		MC_LATENCY_ALLOWANCE_XUSB_0,
> +		MC_LATENCY_ALLOWANCE_XUSB_1,
> +		MC_LATENCY_ALLOWANCE_TSEC_0,
> +		MC_LATENCY_ALLOWANCE_SDMMCA_0,
> +		MC_LATENCY_ALLOWANCE_SDMMCAA_0,
> +		MC_LATENCY_ALLOWANCE_SDMMC_0,
> +		MC_LATENCY_ALLOWANCE_SDMMCAB_0,
> +		MC_LATENCY_ALLOWANCE_PPCS_0,
> +		MC_LATENCY_ALLOWANCE_PPCS_1,
> +		MC_LATENCY_ALLOWANCE_MPCORE_0,
> +		MC_LATENCY_ALLOWANCE_HC_0,
> +		MC_LATENCY_ALLOWANCE_HC_1,
> +		MC_LATENCY_ALLOWANCE_AVPC_0,
> +		MC_LATENCY_ALLOWANCE_GPU_0,
> +		MC_LATENCY_ALLOWANCE_GPU2_0,
> +		MC_LATENCY_ALLOWANCE_NVENC_0,
> +		MC_LATENCY_ALLOWANCE_NVDEC_0,
> +		MC_LATENCY_ALLOWANCE_VIC_0,
> +		MC_LATENCY_ALLOWANCE_VI2_0,
> +		MC_LATENCY_ALLOWANCE_ISP2_0,
> +		MC_LATENCY_ALLOWANCE_ISP2_1,
> +	},
> +	.burst_regs_per_ch_off = {
> +		{ .bank = REG_EMC0, .offset = EMC_MRW10, },
> +		{ .bank = REG_EMC1, .offset = EMC_MRW10, },
> +		{ .bank = REG_EMC0, .offset = EMC_MRW11, },
> +		{ .bank = REG_EMC1, .offset = EMC_MRW11, },
> +		{ .bank = REG_EMC0, .offset = EMC_MRW12, },
> +		{ .bank = REG_EMC1, .offset = EMC_MRW12, },
> +		{ .bank = REG_EMC0, .offset = EMC_MRW13, },
> +		{ .bank = REG_EMC1, .offset = EMC_MRW13, },
> +	},
> +	.trim_regs_per_ch_off = {
> +		{ .bank = REG_EMC0, .offset = EMC_CMD_BRLSHFT_0, },
> +		{ .bank = REG_EMC1, .offset = EMC_CMD_BRLSHFT_1, },
> +		{ .bank = REG_EMC0, .offset = EMC_DATA_BRLSHFT_0, },
> +		{ .bank = REG_EMC1, .offset = EMC_DATA_BRLSHFT_0, },
> +		{ .bank = REG_EMC0, .offset = EMC_DATA_BRLSHFT_1, },
> +		{ .bank = REG_EMC1, .offset = EMC_DATA_BRLSHFT_1, },
> +		{ .bank = REG_EMC0, .offset = EMC_QUSE_BRLSHFT_0, },
> +		{ .bank = REG_EMC1, .offset = EMC_QUSE_BRLSHFT_1, },
> +		{ .bank = REG_EMC0, .offset = EMC_QUSE_BRLSHFT_2, },
> +		{ .bank = REG_EMC1, .offset = EMC_QUSE_BRLSHFT_3, },
> +	},
> +	.vref_regs_per_ch_off = {
> +		{ .bank = REG_EMC0,
> +		  .offset = EMC_TRAINING_OPT_DQS_IB_VREF_RANK0, },
> +		{ .bank = REG_EMC1,
> +		  .offset = EMC_TRAINING_OPT_DQS_IB_VREF_RANK0, },
> +		{ .bank = REG_EMC0,
> +		  .offset = EMC_TRAINING_OPT_DQS_IB_VREF_RANK1, },
> +		{ .bank = REG_EMC1,
> +		  .offset = EMC_TRAINING_OPT_DQS_IB_VREF_RANK1, },
> +	},
> +};
>  
>  static inline struct tegra_emc *clk_hw_to_emc(struct clk_hw *hw)
>  {
>  	return container_of(hw, struct tegra_emc, hw);
>  }
>  
> +void emc_writel(struct tegra_emc *emc, u32 val, unsigned long offset)
> +{
> +	writel_relaxed(val, emc->emc_base[REG_EMC] + offset);
> +}
> +
>  u32 emc_readl(struct tegra_emc *emc, unsigned long offset)
>  {
>  	return readl_relaxed(emc->emc_base[REG_EMC] + offset);
>  }
>  
> +u32 emc1_readl(struct tegra_emc *emc, unsigned long offset)
> +{
> +	return readl_relaxed(emc->emc_base[REG_EMC1] + offset);
> +}
> +
> +void emc_writel_per_ch(struct tegra_emc *emc, u32 val, int type,
> +		       unsigned long offset)
> +{
> +	switch (type) {
> +	case REG_EMC:
> +	case REG_EMC0:
> +		return writel_relaxed(val, emc->emc_base[REG_EMC] + offset);
> +	case REG_EMC1:
> +		return writel_relaxed(val, emc->emc_base[REG_EMC1] + offset);
> +	}
> +}
> +
>  u32 emc_readl_per_ch(struct tegra_emc *emc, int type,
>  			    unsigned long offset)
>  {
> @@ -117,6 +654,14 @@ u32 emc_readl_per_ch(struct tegra_emc *emc, int type,
>  	return val;
>  }
>  
> +void ccfifo_writel(struct tegra_emc *emc, u32 val, unsigned long addr,
> +		   u32 delay)
> +{
> +	writel_relaxed(val, emc->emc_base[REG_EMC] + EMC_CCFIFO_DATA);
> +	writel_relaxed((addr & 0xffff) | ((delay & 0x7fff) << 16) | (1 << 31),
> +		       emc->emc_base[REG_EMC] + EMC_CCFIFO_ADDR);
> +}
> +
>  static inline u32 emc_src_val(u32 val)
>  {
>  	return (val & EMC_CLK_EMC_2X_CLK_SRC_MASK) >>
> @@ -181,9 +726,833 @@ static inline unsigned long emc_get_src_clk_rate(void)
>  	rate += div - 1;
>  	do_div(rate, div);
>  
> +
>  	return rate;
>  }
>  
> +static void tegra210_change_dll_src(struct tegra_emc *emc,
> +				    u32 clksrc)
> +{
> +
> +	u32 out_enb_x;
> +	u32 dll_setting = emc->next_timing->dll_clk_src;
> +	u32 emc_clk_src;
> +	u32 emc_clk_div;
> +
> +	out_enb_x = 0;
> +	emc_clk_src = (clksrc & EMC_CLK_EMC_2X_CLK_SRC_MASK) >>
> +		       EMC_CLK_EMC_2X_CLK_SRC_SHIFT;
> +	emc_clk_div = (clksrc & EMC_CLK_EMC_2X_CLK_DIVISOR_MASK) >>
> +		       EMC_CLK_EMC_2X_CLK_DIVISOR_SHIFT;
> +
> +	dll_setting &= ~(DLL_CLK_EMC_DLL_CLK_SRC_MASK |
> +			 DLL_CLK_EMC_DLL_CLK_DIVISOR_MASK);
> +	dll_setting |= emc_clk_src << DLL_CLK_EMC_DLL_CLK_SRC_SHIFT;
> +	dll_setting |= emc_clk_div << DLL_CLK_EMC_DLL_CLK_DIVISOR_SHIFT;
> +
> +	dll_setting &= ~DLL_CLK_EMC_DLL_DDLL_CLK_SEL_MASK;
> +	if (emc_clk_src == EMC_CLK_SOURCE_PLLMB_LJ)
> +		dll_setting |= (PLLM_VCOB <<
> +				DLL_CLK_EMC_DLL_DDLL_CLK_SEL_SHIFT);
> +	else if (emc_clk_src == EMC_CLK_SOURCE_PLLM_LJ)
> +		dll_setting |= (PLLM_VCOA <<
> +				DLL_CLK_EMC_DLL_DDLL_CLK_SEL_SHIFT);
> +	else
> +		dll_setting |= (EMC_DLL_SWITCH_OUT <<
> +				DLL_CLK_EMC_DLL_DDLL_CLK_SEL_SHIFT);
> +
> +	tegra210_clk_emc_dll_update_setting(dll_setting);
> +
> +	if (emc->next_timing->clk_out_enb_x_0_clk_enb_emc_dll)
> +		tegra210_clk_emc_dll_enable(true);
> +	else
> +		tegra210_clk_emc_dll_enable(false);
> +}
> +
> +void do_clock_change(struct tegra_emc *emc, u32 clksrc)
> +{
> +	int err;
> +
> +	mc_readl(emc->mc, MC_EMEM_ADR_CFG);
> +	emc_readl(emc, EMC_INTSTATUS);
> +
> +	tegra210_clk_emc_update_setting(clksrc);
> +
> +	err = wait_for_update(emc, EMC_INTSTATUS,
> +			      EMC_INTSTATUS_CLKCHANGE_COMPLETE, true, REG_EMC);
> +	if (err) {
> +		pr_err("%s: clock change completion error: %d", __func__, err);
> +		WARN_ON(1);
> +	}
> +}
> +
> +struct emc_table *get_timing_from_freq(struct tegra_emc *emc,
> +				       unsigned long rate)
> +{
> +	int i;
> +
> +	for (i = 0; i < emc->emc_table_size; i++)
> +		if (emc->emc_table[i].rate == rate)
> +			return &emc->emc_table[i];
> +
> +	return NULL;
> +}
> +
> +int wait_for_update(struct tegra_emc *emc, u32 status_reg, u32 bit_mask,
> +		    bool updated_state, int chan)
> +{

This and all other global functions have very generic names. Either
squash it all into a single source file and make all functions static,
or change the names to something more unique.

-- 
Dmitry
