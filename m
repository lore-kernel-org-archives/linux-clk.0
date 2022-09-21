Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A54EC32771
	for <linux-clk@archiver.kernel.org>; Wed, 21 Sep 2022 07:19:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbiIUHTb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Sep 2022 03:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbiIUHTX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Sep 2022 03:19:23 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80CDC5EDEA
        for <linux-clk@vger.kernel.org>; Wed, 21 Sep 2022 00:19:21 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id cc5so8334305wrb.6
        for <linux-clk@vger.kernel.org>; Wed, 21 Sep 2022 00:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=E6f+URSdOX05jCBtwcXT8Rm2Ummjdbd9pwKRLdE+3/Q=;
        b=e6FCHYiWX/YiGw9hnCUu4ucp+blseaG8xhAH+iFbbu8fBpmcHIThynILwHqc3tglLW
         bL8BzDFNpBk6dO0zUm1dsCGInrNRT8sPLnRWp5mMhOU32kL621xrgnfDHX1s+fo6rqxy
         Y+U1YzodHWqNQPCRWs1WfG/BZWr3XsRLG1+JoEBmgnRS1oDr+Hn+twtbfojmqRPY1gYE
         3h9cx7iHymtrjV7mY8z3UwMbq07Dktek0O8pDnTvJ7F/ThNP48b0fTAihyxDA6E0LDmv
         /xo+yefKGLRtCNXNqs3gRhrov4Kg7KvRrgFWAa0whEEG7tdKecnDNnf9uXZGw48PB8U1
         xN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=E6f+URSdOX05jCBtwcXT8Rm2Ummjdbd9pwKRLdE+3/Q=;
        b=ZQLFyGfys+aGqm3ozLNdAcHpZiD5pwmDv3N1OFoHeFQmHE7DDHVsq0+D1MnKi1Imn2
         F4kcZ3jyImt2jlx/M1/q90oFH2P8bOLaOdq0r0M/OABxc4tVGUJ1gPUQ53HucEywj/mz
         A8Bae80m/tsVAjehBXafvERxLK0FVlkXDpJlIzKIgIEo1rm/4CS0muFb6ll4OLnScrOq
         TEH5lpFexbH878VlKXGcOhMs95cZSHDqkEmWeUoEYu/syZtnbBWHiFV9LgPWDvO0y+Oq
         o8rVfmUbrM9Fv2aJSGRVd2GQqJ7WldkFcV5ED72jGYZR/hS//TLwxK7C3Gygh/FsWZW0
         iQLQ==
X-Gm-Message-State: ACrzQf1Hk62s6N2u/f/3famDbz3k+1Y966/Zoo0BtKODWvxhkg6ttUuw
        pb+j2Aj2QYQsoYpnsh8rcN0VRg==
X-Google-Smtp-Source: AMsMyM5hIRfNw0jpDUXcuH3Ju/IpGBuQ5fddogkkUOJUpeUZkCIeoi0sQ98v1nRtIfDZ/iAizXdVWg==
X-Received: by 2002:a5d:4a48:0:b0:22a:e55d:535d with SMTP id v8-20020a5d4a48000000b0022ae55d535dmr13418791wrs.308.1663744760016;
        Wed, 21 Sep 2022 00:19:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8ce3:ff4e:ae9b:55f3? ([2a01:e0a:982:cbb0:8ce3:ff4e:ae9b:55f3])
        by smtp.gmail.com with ESMTPSA id f12-20020a05600c154c00b003b4931eb435sm2044258wmg.26.2022.09.21.00.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 00:19:19 -0700 (PDT)
Message-ID: <e012e586-286d-e553-8c13-97feba66c80c@linaro.org>
Date:   Wed, 21 Sep 2022 09:19:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/2] clk: qcom: rpmhcc: add sdm670 clocks
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220920223734.151135-1-mailingradian@gmail.com>
 <20220920223734.151135-3-mailingradian@gmail.com>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro
In-Reply-To: <20220920223734.151135-3-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/09/2022 00:37, Richard Acayan wrote:
> The Snapdragon 670 uses the RPMh mailbox for most of the clocks used in
> SDM845 but omits two. Add clock data for SDM670 so the driver doesn't fail
> to resolve a clock.
> 
> Link: https://android.googlesource.com/kernel/msm/+/443bd8d6e2cf54698234c752e6de97b4b8a528bd%5E%21/#F7
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   drivers/clk/qcom/clk-rpmh.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index c07cab6905cb..82d87a0602fe 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -382,6 +382,26 @@ static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
>   	.num_clks = ARRAY_SIZE(sdm845_rpmh_clocks),
>   };
>   
> +static struct clk_hw *sdm670_rpmh_clocks[] = {
> +	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> +	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
> +	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
> +	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
> +	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
> +	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
> +	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> +	[RPMH_CE_CLK]		= &sdm845_ce.hw,
> +};
> +
> +static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
> +	.clks = sdm670_rpmh_clocks,
> +	.num_clks = ARRAY_SIZE(sdm670_rpmh_clocks),
> +};
> +
>   DEFINE_CLK_RPMH_VRM(sdx55, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
>   DEFINE_CLK_RPMH_VRM(sdx55, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
>   DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
> @@ -715,6 +735,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
>   	{ .compatible = "qcom,sc8180x-rpmh-clk", .data = &clk_rpmh_sc8180x},
>   	{ .compatible = "qcom,sc8280xp-rpmh-clk", .data = &clk_rpmh_sc8280xp},
>   	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
> +	{ .compatible = "qcom,sdm670-rpmh-clk", .data = &clk_rpmh_sdm670},
>   	{ .compatible = "qcom,sdx55-rpmh-clk",  .data = &clk_rpmh_sdx55},
>   	{ .compatible = "qcom,sdx65-rpmh-clk",  .data = &clk_rpmh_sdx65},
>   	{ .compatible = "qcom,sm6350-rpmh-clk", .data = &clk_rpmh_sm6350},

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
