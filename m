Return-Path: <SRS0=NtHV=SQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,UPPERCASE_50_75 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BF7C10F13
	for <linux-clk@archiver.kernel.org>; Sun, 14 Apr 2019 14:11:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC7F320684
	for <linux-clk@archiver.kernel.org>; Sun, 14 Apr 2019 14:11:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gqSpzhzm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbfDNOLH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 14 Apr 2019 10:11:07 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33504 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbfDNOLH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 14 Apr 2019 10:11:07 -0400
Received: by mail-lj1-f195.google.com with SMTP id f23so13184624ljc.0;
        Sun, 14 Apr 2019 07:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WYdKuGg2sN9+hoy+wbUAVi9TT4de2ZbhDJYDexPA5z8=;
        b=gqSpzhzm4vna8wT/+FUbC05B9s7s5rJba1eShqG/66m2LJcV/hm9XjIbkvigTqCBh+
         sr/XTqoXd60d02A5DWi5usLwvXSPFzcP4fj7PBaXKAxZT01FD7/0iwG4GaIMM2PzdwDF
         1OXNl73TNPbHatwWn0muXVkZ8yRw/0dPjjB/ZxXFgJle51GO03n5CLOKpgYRGDtlfq9L
         ngvj3NBonUhh/o8l13BR7no5aysoZsVqL/2aBRo3IcNYBjJPy1IU0ESoBzHIbgwK44UY
         b0Jty59osMhNMMQ13fomF8PGU9z8sitr/PF0V4GZIn7uMzvCEl6S/l5jXSy9ahYfqg5c
         PcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WYdKuGg2sN9+hoy+wbUAVi9TT4de2ZbhDJYDexPA5z8=;
        b=hEqg47E+lNXD02tsHCOa5hEPz8/BR2HZtO0H8e4+5ACBXPLLaDPIObl7U2U2FetGMl
         RQ/4RdYguYRqSPJ6Rj0w6VyvNpXoldts8fU5T4oPjBwtaE76DFlscXu17jj3zzEa6nS1
         SaCv+Mm74RQU+dXkJ/oqTBO8YkyvXryKH4GxbCpGjYyYSY/dHNeZzYBhioBHCPcSjoSP
         iuJYM3cO2iOOaT4KNZPKBmI1reKRdx/VTRt0ZUtKGG+hZPksnXAKPCOTK/oaWbYPC+7c
         z8+TKiXqMj1uoIoLPd3R4igEgHUNGCSlBnWDKcQwP4w3aaPcKj+bQPhqjixmHi7p2M3j
         BhVA==
X-Gm-Message-State: APjAAAU8PglPodJfEBppeBhJL9Qk+XZYqJzmjmphoJaOAQHv4MPXP2nK
        FAnkjC++ExpJZFvJuTHmGIU=
X-Google-Smtp-Source: APXvYqxmxoz1IPgeUYIQXV62hxOtXyOZZBXPDa0KEWG/69m9UP7X2rdvRmLQqOMJf5OtgWnybq6RuQ==
X-Received: by 2002:a2e:542:: with SMTP id 63mr38564661ljf.144.1555251063048;
        Sun, 14 Apr 2019 07:11:03 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
        by smtp.googlemail.com with ESMTPSA id v141sm2001622lfa.52.2019.04.14.07.11.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 14 Apr 2019 07:11:02 -0700 (PDT)
Subject: Re: [PATCH v2] dt-bindings: memory: tegra: Add external memory
 controller binding for Tegra210
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20190412080855.387-1-josephl@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f2a98e09-07a6-c46d-0dee-b95995b58eae@gmail.com>
Date:   Sun, 14 Apr 2019 17:11:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190412080855.387-1-josephl@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

12.04.2019 11:08, Joseph Lo пишет:
> Add the binding document for the external memory controller (EMC) which
> communicates with external LPDDR4 devices. It includes the bindings of
> the EMC node and the EMC table of different rates.
> 
> To support high rates for LPDDR4, the EMC table must be trained before
> it can be used for runtime clock switching. It has been done by firmware
> and merged the training data to the table that the kernel can share the
> result. So the bindings are used for both kernel and firmware.
> 
> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> This patch splits from the original patch set that supports EMC scaling
> with binding document and drivers. Because the binding would be shared
> by both firmware and kernel. We want to settle this first. Then we can
> fix the kernel and firmware to support the same.

Hello Joseph,

Very nice to see that T210 will be able to get a non-alienated binding! I have some comments, please see them below.

> Changes in v2:
> * only use "tegra210" string in compatible string and remove the legacy
>   "tegra21" string.
> * clock-frequency -> fix the unit from kilohertz to hertz
> * add "interrupts" property
> * s/nvidia,emc-min-mv/nvidia,emc-min-millivolt/
> * s/nvidia,gk20a-min-mv/nvidia,gk20a-min-millivolt/
> * s/nvidia,source/clock-names/
> * fix lots of properties that use underline to hyphen
> * s/nvidia,emc-clock-latency-change/nvidia,emc-clock-latency-microsecond/
> * add more information in the property descriptions
> ---
>  .../nvidia,tegra210-emc.txt                   | 614 ++++++++++++++++++
>  1 file changed, 614 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
> new file mode 100644
> index 000000000000..318239c3c295
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
> @@ -0,0 +1,614 @@
> +NVIDIA Tegra210 SoC EMC (external memory controller)
> +====================================================
> +
> +Required properties :
> +- compatible : should be "nvidia,tegra210-emc".
> +- reg : physical base address and length of the controller's registers.
> +- clocks : phandles of the possible source clocks
> +- clock-names : names of the possible source clocks
> +- interrupts : Should contain the EMC general interrupt
> +- #address-cells : should be 1
> +- #size-cells : should be 0
> +- nvidia,memory-controller : phandle of the memory controller.
> +- nvidia,use-ram-code : boolean, indicates whether we should use RAM_CODE in
> +		        the register to find matching emc-table nodes
> +
> +The node should contain a "emc-table" subnode for each supported RAM type
> +(see field RAM_CODE in register APB_MISC_PP_STRAPPING_OPT_A), with its unit
> +address being its RAM_CODE.
> +
> +Required properties for "emc-tables" nodes :
> +- nvidia,ram-code : Should contain the value of RAM_CODE this timing set is
> +		    used for.
> +
> +Each "emc-tables" node should contain a "emc-table" subnode for every supported
> +EMC clock rate. The "emc-table" subnodes should have the clock rate in hertz as
> +their unit address.
> +
> +Required properties for "emc-table" nodes :
> +- compatible :  "nvidia,tegra210-emc-table"
> +- nvidia,revision : revision of the parameter set used for this node. All
> +                    nodes in the same "emc-table" should have the same revision
> +- nvidia,dvfs-version : string for the DVFS version of this table

What's the "DVFS version"? Sounds like some kind of software description to me. This is probably irrelevant for upstream.

> +- clock-frequency : frequency in hertz
> +- clock-names : name of clock source to be used for this rate

Please follow the T124 and move out everything clock-related to the clock-and-reset binding.

> +- nvidia,emc-min-millivolt : minimum voltage in millivolt for this rate

What about to move out the voltages description into OPP table?

> +- nvidia,gk20a-min-millivolt : minimum GPU voltage in millivolt for this rate

Could you please explain why memory voltage depends on the GPU's? Is there any kind of electrical coupling in this case and thus this is a voltage regulators coupling?

Is GPU-memory voltage dependency really could vary from board to board? It looks to me that at maximum the dependency could vary between SoC SKU variations and then this probably should be internal to the kernel.

> +- nvidia,src-sel-reg : value of EMC CAR register to be used for this rate
> +- nvidia,needs-training : 1 if needs training at boot, 0 otherwise
> +- nvidia,trained : 1 if initial training has been done by firmware, 0 otherwise
> +- nvidia,periodic-training : 1 if needs periodic training, 0 otherwise
> +- nvidia,trained-dram-clktree-c0d0u0 : training data word
> +- nvidia,trained-dram-clktree-c0d0u1 : training data word
> +- nvidia,trained-dram-clktree-c0d1u0 : training data word
> +- nvidia,trained-dram-clktree-c0d1u1 : training data word
> +- nvidia,trained-dram-clktree-c1d0u0 : training data word
> +- nvidia,trained-dram-clktree-c1d0u1 : training data word
> +- nvidia,trained-dram-clktree-c1d1u0 : training data word
> +- nvidia,trained-dram-clktree-c1d1u1 : training data word
> +- nvidia,current-dram-clktree-c0d0u0 : training data word
> +- nvidia,current-dram-clktree-c0d0u1 : training data word
> +- nvidia,current-dram-clktree-c0d1u0 : training data word
> +- nvidia,current-dram-clktree-c0d1u1 : training data word
> +- nvidia,current-dram-clktree-c1d0u0 : training data word
> +- nvidia,current-dram-clktree-c1d0u1 : training data word
> +- nvidia,current-dram-clktree-c1d1u0 : training data word
> +- nvidia,current-dram-clktree-c1d1u1 : training data word

So the "clktree" properties describe the clock properties, hence should be in the clock-and-reset binding (clock's emc-timings table, see T124 for the example). Same for the rest of clk-related properties below.

> +- nvidia,run-clocks : training data for clock timing of oscillator clock
> +- nvidia,tree-margin : training data for clock timing
> +- nvidia,burst-regs-num : number of values in nvidia,emc-registers
> +- nvidia,burst-regs-per-ch-num : number of values in
> +				 nvidia,emc-burst-regs-per-ch
> +- nvidia,trim-regs-num : number of values in nvidia,emc-trim-regs
> +- nvidia,trim-regs-per-ch-num : number of values in nvidia,emc-trim-regs-per-ch
> +- nvidia,burst-mc-regs-num : number of values in nvidia,emc-burst-mc-regs
> +- nvidia,la-scale-regs-num : number of values in nvidia,emc-la-scale-regs
> +- nvidia,vref-regs-num : number of values in nvidia,emc-vref-regs
> +- nvidia,training-mod-regs-num : number of values in nvidia,training-mod-regs
> +- nvidia,dram-timing-regs-num : number of values in nvidia,emc-dram-timing-regs
> +- nvidia,min-mrs-wait : number of EMC clock count to wait for MRS command
> +- nvidia,emc-mrw : value of the EMC_MRW register
> +- nvidia,emc-mrw2 : value of the EMC_MRW2 register
> +- nvidia,emc-mrw3 : value of the EMC_MRW3 register
> +- nvidia,emc-mrw4 : value of the EMC_MRW4 register
> +- nvidia,emc-mrw9 : value of the EMC_MRW4 register
> +- nvidia,emc-mrs : value of the EMC_MRS register
> +- nvidia,emc-emrs : value of the EMC_EMRS register
> +- nvidia,emc-emrs2 : value of the EMC_EMRS2 register
> +- nvidia,emc-auto-cal-config : value of the EMC_AUTO_CAL_CONFIG register
> +- nvidia,emc-auto-cal-config2 : value of the EMC_AUTO_CAL_CONFIG2 register
> +- nvidia,emc-auto-cal-config3 : value of the EMC_AUTO_CAL_CONFIG3 register
> +- nvidia,emc-auto-cal-config4 : value of the EMC_AUTO_CAL_CONFIG4 register
> +- nvidia,emc-auto-cal-config5 : value of the EMC_AUTO_CAL_CONFIG5 register
> +- nvidia,emc-auto-cal-config6 : value of the EMC_AUTO_CAL_CONFIG6 register
> +- nvidia,emc-auto-cal-config7 : value of the EMC_AUTO_CAL_CONFIG7 register
> +- nvidia,emc-auto-cal-config8 : value of the EMC_AUTO_CAL_CONFIG8 register
> +- nvidia,emc-cfg-2 : value of the EMC_CFG_2 register
> +- nvidia,emc-sel-dpd-ctrl : value of the EMC_SEL_DPD_CTRL register
> +- nvidia,emc-fdpd-ctrl-cmd-no-ramp : value of the EMC_FDPD_CTRL_CMD_NO_RAMP
> +				     register
> +- nvidia,dll-clk-src : value of the CLK_RST_CONTROLLER_CLK_SOURCE_EMC_DLL
> +		       register
> +- nvidia,clk-out-enb-x-0-clk-enb-emc-dll : 1 for enable EMC_DLL in the
> +					   CLK_RST_CONTROLLER_CLK_OUT_ENB_X_SET,
> +					   or 0 for clear in the
> +					   CLK_RST_CONTROLLER_CLK_OUT_ENB_X_CLR
> +- nvidia,emc-clock-latency-microsecond : clock latency value in micro seconds
> +- nvidia,ptfv : a 12 word array of control data for periodic training
> +- nvidia,emc-registers :
> +- nvidia,emc-shadow-regs-ca-train :
> +- nvidia,emc-shadow-regs-quse-train :
> +- nvidia,emc-shadow-regs-rdwr-train :
> +  a 221 word array of the following registers (See TRM 18.10.2 for register
> +  descriptions)
> +	EMC_RC
> +	EMC_RFC
> +	EMC_RFCPB
> +	EMC_REFCTRL2
> +	EMC_RFC_SLR
> +	EMC_RAS
> +	EMC_RP
> +	EMC_R2W
> +	EMC_W2R
> +	EMC_R2P
> +	EMC_W2P
> +	EMC_R2R
> +	EMC_TPPD
> +	EMC_CCDMW
> +	EMC_RD_RCD
> +	EMC_WR_RCD
> +	EMC_RRD
> +	EMC_REXT
> +	EMC_WEXT
> +	EMC_WDV_CHK
> +	EMC_WDV
> +	EMC_WSV
> +	EMC_WEV
> +	EMC_WDV_MASK
> +	EMC_WS_DURATION
> +	EMC_WE_DURATION
> +	EMC_QUSE
> +	EMC_QUSE_WIDTH
> +	EMC_IBDLY
> +	EMC_OBDLY
> +	EMC_EINPUT
> +	EMC_MRW6
> +	EMC_EINPUT_DURATION
> +	EMC_PUTERM_EXTRA
> +	EMC_PUTERM_WIDTH
> +	EMC_QRST
> +	EMC_QSAFE
> +	EMC_RDV
> +	EMC_RDV_MASK
> +	EMC_RDV_EARLY
> +	EMC_RDV_EARLY_MASK
> +	EMC_REFRESH
> +	EMC_BURST_REFRESH_NUM
> +	EMC_PRE_REFRESH_REQ_CNT
> +	EMC_PDEX2WR
> +	EMC_PDEX2RD
> +	EMC_PCHG2PDEN
> +	EMC_ACT2PDEN
> +	EMC_AR2PDEN
> +	EMC_RW2PDEN
> +	EMC_CKE2PDEN
> +	EMC_PDEX2CKE
> +	EMC_PDEX2MRR
> +	EMC_TXSR
> +	EMC_TXSRDLL
> +	EMC_TCKE
> +	EMC_TCKESR
> +	EMC_TPD
> +	EMC_TFAW
> +	EMC_TRPAB
> +	EMC_TCLKSTABLE
> +	EMC_TCLKSTOP
> +	EMC_MRW7
> +	EMC_TREFBW
> +	EMC_ODT_WRITE
> +	EMC_FBIO_CFG5
> +	EMC_FBIO_CFG7
> +	EMC_CFG_DIG_DLL
> +	EMC_CFG_DIG_DLL_PERIOD
> +	EMC_PMACRO_IB_RXRT
> +	EMC_CFG_PIPE_1
> +	EMC_CFG_PIPE_2
> +	EMC_PMACRO_QUSE_DDLL_RANK0_4
> +	EMC_PMACRO_QUSE_DDLL_RANK0_5
> +	EMC_PMACRO_QUSE_DDLL_RANK1_4
> +	EMC_PMACRO_QUSE_DDLL_RANK1_5
> +	EMC_MRW8
> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_4
> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_5
> +	EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_0
> +	EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_1
> +	EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_2
> +	EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_3
> +	EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_4
> +	EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_5
> +	EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_0
> +	EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_1
> +	EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_2
> +	EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_3
> +	EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_4
> +	EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_5
> +	EMC_PMACRO_DDLL_LONG_CMD_0
> +	EMC_PMACRO_DDLL_LONG_CMD_1
> +	EMC_PMACRO_DDLL_LONG_CMD_2
> +	EMC_PMACRO_DDLL_LONG_CMD_3
> +	EMC_PMACRO_DDLL_LONG_CMD_4
> +	EMC_PMACRO_DDLL_SHORT_CMD_0
> +	EMC_PMACRO_DDLL_SHORT_CMD_1
> +	EMC_PMACRO_DDLL_SHORT_CMD_2
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE0_3
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE1_3
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE2_3
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE3_3
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE4_3
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE5_3
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE6_3
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE7_3
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD0_3
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD1_3
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD2_3
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD3_3
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE0_3
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE1_3
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE2_3
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE3_3
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE4_3
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE5_3
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE6_3
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE7_3
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD0_0
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD0_1
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD0_2
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD0_3
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD1_0
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD1_1
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD1_2
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD1_3
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD2_0
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD2_1
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD2_2
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD2_3
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD3_0
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD3_1
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD3_2
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD3_3
> +	EMC_TXDSRVTTGEN
> +	EMC_FDPD_CTRL_DQ
> +	EMC_FDPD_CTRL_CMD
> +	EMC_FBIO_SPARE
> +	EMC_ZCAL_INTERVAL
> +	EMC_ZCAL_WAIT_CNT
> +	EMC_MRS_WAIT_CNT
> +	EMC_MRS_WAIT_CNT2
> +	EMC_AUTO_CAL_CHANNEL
> +	EMC_DLL_CFG_0
> +	EMC_DLL_CFG_1
> +	EMC_PMACRO_AUTOCAL_CFG_COMMON
> +	EMC_PMACRO_ZCTRL
> +	EMC_CFG
> +	EMC_CFG_PIPE
> +	EMC_DYN_SELF_REF_CONTROL
> +	EMC_QPOP
> +	EMC_DQS_BRLSHFT_0
> +	EMC_DQS_BRLSHFT_1
> +	EMC_CMD_BRLSHFT_2
> +	EMC_CMD_BRLSHFT_3
> +	EMC_PMACRO_PAD_CFG_CTRL
> +	EMC_PMACRO_DATA_PAD_RX_CTRL
> +	EMC_PMACRO_CMD_PAD_RX_CTRL
> +	EMC_PMACRO_DATA_RX_TERM_MODE
> +	EMC_PMACRO_CMD_RX_TERM_MODE
> +	EMC_PMACRO_CMD_PAD_TX_CTRL
> +	EMC_PMACRO_DATA_PAD_TX_CTRL
> +	EMC_PMACRO_COMMON_PAD_TX_CTRL
> +	EMC_PMACRO_VTTGEN_CTRL_0
> +	EMC_PMACRO_VTTGEN_CTRL_1
> +	EMC_PMACRO_VTTGEN_CTRL_2
> +	EMC_PMACRO_BRICK_CTRL_RFU1
> +	EMC_PMACRO_CMD_BRICK_CTRL_FDPD
> +	EMC_PMACRO_BRICK_CTRL_RFU2
> +	EMC_PMACRO_DATA_BRICK_CTRL_FDPD
> +	EMC_PMACRO_BG_BIAS_CTRL_0
> +	EMC_CFG_3
> +	EMC_PMACRO_TX_PWRD_0
> +	EMC_PMACRO_TX_PWRD_1
> +	EMC_PMACRO_TX_PWRD_2
> +	EMC_PMACRO_TX_PWRD_3
> +	EMC_PMACRO_TX_PWRD_4
> +	EMC_PMACRO_TX_PWRD_5
> +	EMC_CONFIG_SAMPLE_DELAY
> +	EMC_PMACRO_TX_SEL_CLK_SRC_0
> +	EMC_PMACRO_TX_SEL_CLK_SRC_1
> +	EMC_PMACRO_TX_SEL_CLK_SRC_2
> +	EMC_PMACRO_TX_SEL_CLK_SRC_3
> +	EMC_PMACRO_TX_SEL_CLK_SRC_4
> +	EMC_PMACRO_TX_SEL_CLK_SRC_5
> +	EMC_PMACRO_DDLL_BYPASS
> +	EMC_PMACRO_DDLL_PWRD_0
> +	EMC_PMACRO_DDLL_PWRD_1
> +	EMC_PMACRO_DDLL_PWRD_2
> +	EMC_PMACRO_CMD_CTRL_0
> +	EMC_PMACRO_CMD_CTRL_1
> +	EMC_PMACRO_CMD_CTRL_2
> +	EMC_TR_TIMING_0
> +	EMC_TR_DVFS
> +	EMC_TR_CTRL_1
> +	EMC_TR_RDV
> +	EMC_TR_QPOP
> +	EMC_TR_RDV_MASK
> +	EMC_MRW14
> +	EMC_TR_QSAFE
> +	EMC_TR_QRST
> +	EMC_TRAINING_CTRL
> +	EMC_TRAINING_SETTLE
> +	EMC_TRAINING_VREF_SETTLE
> +	EMC_TRAINING_CA_FINE_CTRL
> +	EMC_TRAINING_CA_CTRL_MISC
> +	EMC_TRAINING_CA_CTRL_MISC1
> +	EMC_TRAINING_CA_VREF_CTRL
> +	EMC_TRAINING_QUSE_CORS_CTRL
> +	EMC_TRAINING_QUSE_FINE_CTRL
> +	EMC_TRAINING_QUSE_CTRL_MISC
> +	EMC_TRAINING_QUSE_VREF_CTRL
> +	EMC_TRAINING_READ_FINE_CTRL
> +	EMC_TRAINING_READ_CTRL_MISC
> +	EMC_TRAINING_READ_VREF_CTRL
> +	EMC_TRAINING_WRITE_FINE_CTRL
> +	EMC_TRAINING_WRITE_CTRL_MISC
> +	EMC_TRAINING_WRITE_VREF_CTRL
> +	EMC_TRAINING_MPC
> +	EMC_MRW15
> +- nvidia,emc-burst-regs-per-ch : a 8 word array of the following registers (See
> +				 TRM 18.10.2 for register descriptions) the
> +				 array containts 2 values for each register,
> +				 one per channel.
> +	EMC_MRW10
> +	EMC_MRW11
> +	EMC_MRW12
> +	EMC_MRW13
> +- nvidia,emc-trim-regs : a 138 word array of the following registers (See TRM
> +			 18.10.2 for register descriptions)
> +	EMC_PMACRO_IB_DDLL_LONG_DQS_RANK0_0
> +	EMC_PMACRO_IB_DDLL_LONG_DQS_RANK0_1
> +	EMC_PMACRO_IB_DDLL_LONG_DQS_RANK0_2
> +	EMC_PMACRO_IB_DDLL_LONG_DQS_RANK0_3
> +	EMC_PMACRO_IB_DDLL_LONG_DQS_RANK1_0
> +	EMC_PMACRO_IB_DDLL_LONG_DQS_RANK1_1
> +	EMC_PMACRO_IB_DDLL_LONG_DQS_RANK1_2
> +	EMC_PMACRO_IB_DDLL_LONG_DQS_RANK1_3
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE0_0
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE0_1
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE0_2
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE1_0
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE1_1
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE1_2
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE2_0
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE2_1
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE2_2
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE3_0
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE3_1
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE3_2
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE4_0
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE4_1
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE4_2
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE5_0
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE5_1
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE5_2
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE6_0
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE6_1
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE6_2
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE7_0
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE7_1
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE7_2
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE0_0
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE0_1
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE0_2
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE1_0
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE1_1
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE1_2
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE2_0
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE2_1
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE2_2
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE3_0
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE3_1
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE3_2
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE4_0
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE4_1
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE4_2
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE5_0
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE5_1
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE5_2
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE6_0
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE6_1
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE6_2
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE7_0
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE7_1
> +	EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE7_2
> +	EMC_PMACRO_IB_VREF_DQS_0
> +	EMC_PMACRO_IB_VREF_DQS_1
> +	EMC_PMACRO_IB_VREF_DQ_0
> +	EMC_PMACRO_IB_VREF_DQ_1
> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0
> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1
> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2
> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3
> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_4
> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_5
> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0
> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1
> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2
> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE0_0
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE0_1
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE0_2
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE1_0
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE1_1
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE1_2
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE2_0
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE2_1
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE2_2
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE3_0
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE3_1
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE3_2
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE4_0
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE4_1
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE4_2
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE5_0
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE5_1
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE5_2
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE6_0
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE6_1
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE6_2
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE7_0
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE7_1
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE7_2
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD0_0
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD0_1
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD0_2
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD1_0
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD1_1
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD1_2
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD2_0
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD2_1
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD2_2
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD3_0
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD3_1
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD3_2
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE0_0
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE0_1
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE0_2
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE1_0
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE1_1
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE1_2
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE2_0
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE2_1
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE2_2
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE3_0
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE3_1
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE3_2
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE4_0
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE4_1
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE4_2
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE5_0
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE5_1
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE5_2
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE6_0
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE6_1
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE6_2
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE7_0
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE7_1
> +	EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE7_2
> +	EMC_PMACRO_QUSE_DDLL_RANK0_0
> +	EMC_PMACRO_QUSE_DDLL_RANK0_1
> +	EMC_PMACRO_QUSE_DDLL_RANK0_2
> +	EMC_PMACRO_QUSE_DDLL_RANK0_3
> +	EMC_PMACRO_QUSE_DDLL_RANK1_0
> +	EMC_PMACRO_QUSE_DDLL_RANK1_1
> +	EMC_PMACRO_QUSE_DDLL_RANK1_2
> +	EMC_PMACRO_QUSE_DDLL_RANK1_3
> +- nvidia,emc-trim-regs-per-ch : a 10 word array of the following registers (See
> +				TRM 18.10.2 for register descriptions)
> +	EMC_CMD_BRLSHFT_0
> +	EMC_CMD_BRLSHFT_1
> +	EMC_DATA_BRLSHFT_0 (channel 0)
> +	EMC_DATA_BRLSHFT_0 (channel 1)
> +	EMC_DATA_BRLSHFT_1 (channel 0)
> +	EMC_DATA_BRLSHFT_1 (channel 1)
> +	EMC_QUSE_BRLSHFT_0
> +	EMC_QUSE_BRLSHFT_1
> +	EMC_QUSE_BRLSHFT_2
> +	EMC_QUSE_BRLSHFT_3
> +- nvidia,emc-vref-regs : a 4 word array of the following registers (See TRM
> +			 18.10.2 for register descriptions) the array containts
> +			 2 values for each register, one per channel.
> +	 EMC_TRAINING_OPT_DQS_IB_VREF_RANK0
> +	 EMC_TRAINING_OPT_DQS_IB_VREF_RANK1
> +- nvidia,emc-dram-timing-regs : a 5 word array of DRAM timing values. These are
> +				not written to registers but used during the
> +				sequence.
> +	T_RP : row pre-charge delay
> +	T_FC_LPDDR4 : frequency change time
> +	T_RFC : refresh cycle time
> +	T_PDEX : power down exit delay
> +	RL : mode register read latency
> +- nvidia,emc-training-mod-regs : a 20 word array of training mod registers
> +- nvidia,emc-save-restore-mod-regs : a 12 word array of save-restore mod
> +				     registers
> +- nvidia,emc-burst-mc-regs : a 33 word array of the following registers
> +			     (See TRM 18.10.1 for register descriptions)
> +	MC_EMEM_ARB_CFG
> +	MC_EMEM_ARB_OUTSTANDING_REQ
> +	MC_EMEM_ARB_REFPB_HP_CTRL
> +	MC_EMEM_ARB_REFPB_BANK_CTRL
> +	MC_EMEM_ARB_TIMING_RCD
> +	MC_EMEM_ARB_TIMING_RP
> +	MC_EMEM_ARB_TIMING_RC
> +	MC_EMEM_ARB_TIMING_RAS
> +	MC_EMEM_ARB_TIMING_FAW
> +	MC_EMEM_ARB_TIMING_RRD
> +	MC_EMEM_ARB_TIMING_RAP2PRE
> +	MC_EMEM_ARB_TIMING_WAP2PRE
> +	MC_EMEM_ARB_TIMING_R2R
> +	MC_EMEM_ARB_TIMING_W2W
> +	MC_EMEM_ARB_TIMING_R2W
> +	MC_EMEM_ARB_TIMING_CCDMW
> +	MC_EMEM_ARB_TIMING_W2R
> +	MC_EMEM_ARB_TIMING_RFCPB
> +	MC_EMEM_ARB_DA_TURNS
> +	MC_EMEM_ARB_DA_COVERS
> +	MC_EMEM_ARB_MISC0
> +	MC_EMEM_ARB_MISC1
> +	MC_EMEM_ARB_MISC2
> +	MC_EMEM_ARB_RING1_THROTTLE
> +	MC_EMEM_ARB_DHYST_CTRL
> +	MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_0
> +	MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_1
> +	MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_2
> +	MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_3
> +	MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_4
> +	MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_5
> +	MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_6
> +	MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_7
> +- nvidia,emc-la-scale-regs : a 24 word array of the following registers
> +			     (See TRM 18.10.1 for register descriptions)
> +	MC_MLL_MPCORER_PTSA_RATE
> +	MC_FTOP_PTSA_RATE
> +	MC_PTSA_GRANT_DECREMENT
> +	MC_LATENCY_ALLOWANCE_XUSB_0
> +	MC_LATENCY_ALLOWANCE_XUSB_1
> +	MC_LATENCY_ALLOWANCE_TSEC_0
> +	MC_LATENCY_ALLOWANCE_SDMMCA_0
> +	MC_LATENCY_ALLOWANCE_SDMMCAA_0
> +	MC_LATENCY_ALLOWANCE_SDMMC_0
> +	MC_LATENCY_ALLOWANCE_SDMMCAB_0
> +	MC_LATENCY_ALLOWANCE_PPCS_0
> +	MC_LATENCY_ALLOWANCE_PPCS_1
> +	MC_LATENCY_ALLOWANCE_MPCORE_0
> +	MC_LATENCY_ALLOWANCE_HC_0
> +	MC_LATENCY_ALLOWANCE_HC_1
> +	MC_LATENCY_ALLOWANCE_AVPC_0
> +	MC_LATENCY_ALLOWANCE_GPU_0
> +	MC_LATENCY_ALLOWANCE_GPU2_0
> +	MC_LATENCY_ALLOWANCE_NVENC_0
> +	MC_LATENCY_ALLOWANCE_NVDEC_0
> +	MC_LATENCY_ALLOWANCE_VIC_0
> +	MC_LATENCY_ALLOWANCE_VI2_0
> +	MC_LATENCY_ALLOWANCE_ISP2_0
> +	MC_LATENCY_ALLOWANCE_ISP2_1

Please move out everything MC-related to the MC binding.

-- 
Dmitry
