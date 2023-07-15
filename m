Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF513C001B0
	for <linux-clk@archiver.kernel.org>; Sat, 15 Jul 2023 14:10:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbjGOOKQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 15 Jul 2023 10:10:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbjGOOKP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 15 Jul 2023 10:10:15 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DE521986
        for <linux-clk@vger.kernel.org>; Sat, 15 Jul 2023 07:10:13 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b702319893so44030611fa.3
        for <linux-clk@vger.kernel.org>; Sat, 15 Jul 2023 07:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689430211; x=1692022211;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4/HgrrJLRtL0tsKuEEIQX/EB6sVcuOV+jDM348VHvvo=;
        b=uLHg07ks8ri6zX2K6z4bJBgrPhsb8W2TnnbTH+mlzGJUQvBKFbi3f5JjjVWkAatB7N
         4xLhLVgjz0ZSpuLEQ9ipOdhI5nI4qTJf9tkZY0T7ngZMlH36382DYNElgHRNeNiDdJeh
         YOzbPe5pVEZQb6LVG1OKtkd5Sj2M7+pddIBBgnWkVkTnJZjbwxej018ASPhT7PQRPGz2
         jLMA4wOMzEDDE6wbzMtFeEF35yLka82fhnVmmQo07g2ZydjNTr7EECYmjkFSy4FnZxzt
         zg4FZlm4SyEel64azdjepD9C/Wi5DF0Dl3QX+NcgsBvF7oiqrCXOEjq7UEPv/E5Tta89
         /RYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689430211; x=1692022211;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4/HgrrJLRtL0tsKuEEIQX/EB6sVcuOV+jDM348VHvvo=;
        b=eIQXIEFvkzcS7GXC2N0A2VtO5sh6VV78ZGb0myBzhSrTwYJccayx7Hnwl4N5iLe3bA
         WzNxrQ2UOUHttT4hjHUZaqGMJCK9tMgVRjOqyISi4hb/go5qRkevGQ7fU56jOLYauPSy
         3CiXaQCwW8VU/UfnB1ZBtcuz0gUcEe8JHB1pmG9QHRc57o3IuRDu3lwGfBfOBvJfhHBt
         UBTdCFwJqnovmBJCzYmdQee79E63KyI4p4Q4LTX27w4TQRgZTQLhR7hg9i1dcy1z81OC
         nuW1cvqO3o6dE6u37ktFGeLvlNNd6/B/9eaQyAXdaRF9PBC+BgDMK5OA3VngHYf285GH
         IgFg==
X-Gm-Message-State: ABy/qLaUfAjthoJoMjmOkNGGdxtrWjggsJ8ibSgeSrNbBPNvLdweDJXV
        APepWQzj9p+rF2KOCDMjjr9uQA==
X-Google-Smtp-Source: APBJJlEMFD+ccsnkWg4VBRDUKkSs7u8L7ZD48yDlojb/6aXDzaXQiB3/wIJNYlFnS8WT1nQsBs0h2Q==
X-Received: by 2002:a2e:9d12:0:b0:2b9:318e:1423 with SMTP id t18-20020a2e9d12000000b002b9318e1423mr862143lji.12.1689430211525;
        Sat, 15 Jul 2023 07:10:11 -0700 (PDT)
Received: from [192.168.1.101] (abxi167.neoplus.adsl.tpnet.pl. [83.9.2.167])
        by smtp.gmail.com with ESMTPSA id l8-20020a2e8688000000b002b6d3261571sm2507223lji.99.2023.07.15.07.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 07:10:11 -0700 (PDT)
Message-ID: <b8b2db1b-dbfc-591e-f074-1366e5ac576a@linaro.org>
Date:   Sat, 15 Jul 2023 16:10:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] clk: qcom: ipq5332: drop the mem noc clocks
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_anusha@quicinc.com, quic_saahtoma@quicinc.com
References: <20230710102807.1189942-1-quic_kathirav@quicinc.com>
 <20230710102807.1189942-2-quic_kathirav@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230710102807.1189942-2-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10.07.2023 12:28, Kathiravan T wrote:
> Due to the recent design changes, all the mem noc clocks will be
> configured by the bootloaders and it will be access protected by the TZ
> firmware. So drop these clocks from the GCC driver.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
Are there any IPQ5332s outside Qualcomm labs that will presumably
never get that TZ update?

Konrad
>  drivers/clk/qcom/gcc-ipq5332.c | 95 ----------------------------------
>  1 file changed, 95 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq5332.c b/drivers/clk/qcom/gcc-ipq5332.c
> index a75ab88ed14c..939925baa9eb 100644
> --- a/drivers/clk/qcom/gcc-ipq5332.c
> +++ b/drivers/clk/qcom/gcc-ipq5332.c
> @@ -1635,42 +1635,6 @@ static struct clk_branch gcc_mdio_slave_ahb_clk = {
>  	},
>  };
>  
> -static struct clk_branch gcc_mem_noc_q6_axi_clk = {
> -	.halt_reg = 0x19010,
> -	.halt_check = BRANCH_HALT,
> -	.clkr = {
> -		.enable_reg = 0x19010,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(const struct clk_init_data) {
> -			.name = "gcc_mem_noc_q6_axi_clk",
> -			.parent_hws = (const struct clk_hw*[]) {
> -				&gcc_q6_axim_clk_src.clkr.hw,
> -			},
> -			.num_parents = 1,
> -			.flags = CLK_SET_RATE_PARENT,
> -			.ops = &clk_branch2_ops,
> -		},
> -	},
> -};
> -
> -static struct clk_branch gcc_mem_noc_ts_clk = {
> -	.halt_reg = 0x19028,
> -	.halt_check = BRANCH_HALT_VOTED,
> -	.clkr = {
> -		.enable_reg = 0x19028,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(const struct clk_init_data) {
> -			.name = "gcc_mem_noc_ts_clk",
> -			.parent_hws = (const struct clk_hw*[]) {
> -				&gcc_qdss_tsctr_div8_clk_src.hw,
> -			},
> -			.num_parents = 1,
> -			.flags = CLK_SET_RATE_PARENT,
> -			.ops = &clk_branch2_ops,
> -		},
> -	},
> -};
> -
>  static struct clk_branch gcc_nss_ts_clk = {
>  	.halt_reg = 0x17018,
>  	.halt_check = BRANCH_HALT_VOTED,
> @@ -3339,42 +3303,6 @@ static struct clk_branch gcc_nssnoc_pcnoc_1_clk = {
>  	},
>  };
>  
> -static struct clk_branch gcc_mem_noc_ahb_clk = {
> -	.halt_reg = 0x1900c,
> -	.halt_check = BRANCH_HALT,
> -	.clkr = {
> -		.enable_reg = 0x1900c,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(const struct clk_init_data) {
> -			.name = "gcc_mem_noc_ahb_clk",
> -			.parent_hws = (const struct clk_hw*[]) {
> -				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
> -			},
> -			.num_parents = 1,
> -			.flags = CLK_SET_RATE_PARENT,
> -			.ops = &clk_branch2_ops,
> -		},
> -	},
> -};
> -
> -static struct clk_branch gcc_mem_noc_apss_axi_clk = {
> -	.halt_reg = 0x1901c,
> -	.halt_check = BRANCH_HALT_VOTED,
> -	.clkr = {
> -		.enable_reg = 0xb004,
> -		.enable_mask = BIT(6),
> -		.hw.init = &(const struct clk_init_data) {
> -			.name = "gcc_mem_noc_apss_axi_clk",
> -			.parent_hws = (const struct clk_hw*[]) {
> -				&gcc_apss_axi_clk_src.clkr.hw,
> -			},
> -			.num_parents = 1,
> -			.flags = CLK_SET_RATE_PARENT,
> -			.ops = &clk_branch2_ops,
> -		},
> -	},
> -};
> -
>  static struct clk_regmap_div gcc_snoc_qosgen_extref_div_clk_src = {
>  	.reg = 0x2e010,
>  	.shift = 0,
> @@ -3390,24 +3318,6 @@ static struct clk_regmap_div gcc_snoc_qosgen_extref_div_clk_src = {
>  	},
>  };
>  
> -static struct clk_branch gcc_mem_noc_qosgen_extref_clk = {
> -	.halt_reg = 0x19024,
> -	.halt_check = BRANCH_HALT,
> -	.clkr = {
> -		.enable_reg = 0x19024,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(const struct clk_init_data) {
> -			.name = "gcc_mem_noc_qosgen_extref_clk",
> -			.parent_hws = (const struct clk_hw*[]) {
> -				&gcc_snoc_qosgen_extref_div_clk_src.clkr.hw,
> -			},
> -			.num_parents = 1,
> -			.flags = CLK_SET_RATE_PARENT,
> -			.ops = &clk_branch2_ops,
> -		},
> -	},
> -};
> -
>  static struct clk_regmap *gcc_ipq5332_clocks[] = {
>  	[GPLL0_MAIN] = &gpll0_main.clkr,
>  	[GPLL0] = &gpll0.clkr,
> @@ -3451,8 +3361,6 @@ static struct clk_regmap *gcc_ipq5332_clocks[] = {
>  	[GCC_LPASS_SWAY_CLK_SRC] = &gcc_lpass_sway_clk_src.clkr,
>  	[GCC_MDIO_AHB_CLK] = &gcc_mdio_ahb_clk.clkr,
>  	[GCC_MDIO_SLAVE_AHB_CLK] = &gcc_mdio_slave_ahb_clk.clkr,
> -	[GCC_MEM_NOC_Q6_AXI_CLK] = &gcc_mem_noc_q6_axi_clk.clkr,
> -	[GCC_MEM_NOC_TS_CLK] = &gcc_mem_noc_ts_clk.clkr,
>  	[GCC_NSS_TS_CLK] = &gcc_nss_ts_clk.clkr,
>  	[GCC_NSS_TS_CLK_SRC] = &gcc_nss_ts_clk_src.clkr,
>  	[GCC_NSSCC_CLK] = &gcc_nsscc_clk.clkr,
> @@ -3573,10 +3481,7 @@ static struct clk_regmap *gcc_ipq5332_clocks[] = {
>  	[GCC_XO_DIV4_CLK] = &gcc_xo_div4_clk.clkr,
>  	[GCC_IM_SLEEP_CLK] = &gcc_im_sleep_clk.clkr,
>  	[GCC_NSSNOC_PCNOC_1_CLK] = &gcc_nssnoc_pcnoc_1_clk.clkr,
> -	[GCC_MEM_NOC_AHB_CLK] = &gcc_mem_noc_ahb_clk.clkr,
> -	[GCC_MEM_NOC_APSS_AXI_CLK] = &gcc_mem_noc_apss_axi_clk.clkr,
>  	[GCC_SNOC_QOSGEN_EXTREF_DIV_CLK_SRC] = &gcc_snoc_qosgen_extref_div_clk_src.clkr,
> -	[GCC_MEM_NOC_QOSGEN_EXTREF_CLK] = &gcc_mem_noc_qosgen_extref_clk.clkr,
>  	[GCC_PCIE3X2_PIPE_CLK_SRC] = &gcc_pcie3x2_pipe_clk_src.clkr,
>  	[GCC_PCIE3X1_0_PIPE_CLK_SRC] = &gcc_pcie3x1_0_pipe_clk_src.clkr,
>  	[GCC_PCIE3X1_1_PIPE_CLK_SRC] = &gcc_pcie3x1_1_pipe_clk_src.clkr,
