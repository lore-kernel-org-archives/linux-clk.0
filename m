Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C740C001B0
	for <linux-clk@archiver.kernel.org>; Sat, 15 Jul 2023 13:20:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjGONUM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 15 Jul 2023 09:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjGONUL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 15 Jul 2023 09:20:11 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BEB02D75
        for <linux-clk@vger.kernel.org>; Sat, 15 Jul 2023 06:20:09 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fb761efa7aso4744338e87.0
        for <linux-clk@vger.kernel.org>; Sat, 15 Jul 2023 06:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689427208; x=1692019208;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LQhW1Szg22yqLkreXfyXXQvcUFN3IT4if2hwRUU8Cro=;
        b=NvdsTgoHDj9lXC27YxlV+qyjrrqmsN3ASm9uJKOxzM8fGqcHBtp+G/5vHiFoHiEV7f
         5nY6ReNSZy3379lMIBDJpnCI9E4+PvF2BupzxYxetcrQfuema/wf9bKmF3+ULS7+xIEQ
         1aMK5F8dsXlXOypgqjDm+0pv/V7XluGjHQQHkYuRXCWLRbajn7z6lNE4fCFnI4Uy3G7P
         AOS43d7wD/gvc+088w4tENBN4oSbZFyAnKBBv3aW75IEaXwXihLXKcFhfm4Rab1fPdly
         18tuV1PCJrJl/9AizCtwi/4R0ajHTkcB0gK6OlySUFutT6nR9G+KWAct9tsWPbT9Q9QN
         XGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689427208; x=1692019208;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LQhW1Szg22yqLkreXfyXXQvcUFN3IT4if2hwRUU8Cro=;
        b=GSUHZsYxGYQ3Itv3fnqCzZ6u5MVTLfuSWev0qL4WYFkRWZkgg77IJda5OM1LVyMbYR
         p7JCC74fAOAQNUjr3xI0TzFJlOVQm93eLtyYaI6n3C0P9GHWiMsn4Xkcah+bs0xQI+sZ
         O5r7f2e90TY/XiupM6djNNWAuxior3D/pKTQSHjSw368s5/NjJ0dQIctcpUbUDFNzXGX
         DfYi53ck0Gy4VLG3VZbujhJRS1Fu1SYT29TUyr47xYB0FtUaEi1eWoGNRtYXMk4GrqPU
         Geh1cRJKMpWp08UGMARuf+6DECrmV3UV3USyAEf2VtkZYTv4qiI5LzDvG9mUBaHjRGpt
         j96A==
X-Gm-Message-State: ABy/qLahWwJl+s4ioxp8/d3pez3C1suEMdqzDRVv833E9NkTX9P5MvQE
        W76cL5z342Wbkeoj0Y9U0Tp46w==
X-Google-Smtp-Source: APBJJlES0cvWT/cjYNdwu6j4QPnvmRbj3dgKlgYXs0/CAx0JRyeNJftRz20dfFsV4Lm2Iqeydw5o0Q==
X-Received: by 2002:a19:6459:0:b0:4fb:9105:58b0 with SMTP id b25-20020a196459000000b004fb910558b0mr4853169lfj.20.1689427207697;
        Sat, 15 Jul 2023 06:20:07 -0700 (PDT)
Received: from [192.168.1.101] (abxi167.neoplus.adsl.tpnet.pl. [83.9.2.167])
        by smtp.gmail.com with ESMTPSA id n6-20020a195506000000b004fd36c89c3csm437698lfe.43.2023.07.15.06.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 06:20:07 -0700 (PDT)
Message-ID: <a2d362d0-3a58-0835-5106-fb60f0c3e4d0@linaro.org>
Date:   Sat, 15 Jul 2023 15:20:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V3 4/6] clk: qcom: gcc-qdu1000: Update GCC clocks as per
 the latest hw version
Content-Language: en-US
To:     Imran Shaik <quic_imrashai@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230706105045.633076-1-quic_imrashai@quicinc.com>
 <20230706105045.633076-5-quic_imrashai@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230706105045.633076-5-quic_imrashai@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 6.07.2023 12:50, Imran Shaik wrote:
> Update the GCC clocks as per the latest hw version of QDU1000 and
> QRU100 SoCs.
> 
> Co-developed-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
> Changes since v2:
>  - Split the patch as per the review comments
>  - Newly added
> 
>  drivers/clk/qcom/gcc-qdu1000.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-qdu1000.c b/drivers/clk/qcom/gcc-qdu1000.c
> index 8df7b7983968..991fb2bc97e9 100644
> --- a/drivers/clk/qcom/gcc-qdu1000.c
> +++ b/drivers/clk/qcom/gcc-qdu1000.c
> @@ -1131,6 +1131,26 @@ static struct clk_branch gcc_ddrss_ecpri_dma_clk = {
>  	},
>  };
>  
> +static struct clk_branch gcc_ddrss_ecpri_gsi_clk = {
> +	.halt_reg = 0x54298,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.hwcg_reg = 0x54298,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x54298,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "gcc_ddrss_ecpri_gsi_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_aggre_noc_ecpri_gsi_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_aon_ops,
> +		},
> +	},
> +};
> +
>  static struct clk_branch gcc_ecpri_ahb_clk = {
>  	.halt_reg = 0x3a008,
>  	.halt_check = BRANCH_HALT_VOTED,
> @@ -2521,6 +2541,8 @@ static struct clk_regmap *gcc_qdu1000_clocks[] = {
>  	[GCC_AGGRE_NOC_ECPRI_GSI_CLK] = &gcc_aggre_noc_ecpri_gsi_clk.clkr,
>  	[GCC_PCIE_0_PHY_AUX_CLK_SRC] = &gcc_pcie_0_phy_aux_clk_src.clkr,
>  	[GCC_PCIE_0_PIPE_CLK_SRC] = &gcc_pcie_0_pipe_clk_src.clkr,
> +	[GCC_GPLL1_OUT_EVEN] = &gcc_gpll1_out_even.clkr,
Looks like you split it too much.. this clock is not being defined in this patch.

Konrad
> +	[GCC_DDRSS_ECPRI_GSI_CLK] = &gcc_ddrss_ecpri_gsi_clk.clkr,
>  };
>  
>  static const struct qcom_reset_map gcc_qdu1000_resets[] = {
