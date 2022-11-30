Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A78C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 30 Nov 2022 13:28:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232030AbiK3N2l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Nov 2022 08:28:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235364AbiK3N2k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Nov 2022 08:28:40 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D462854B20
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 05:28:37 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id j16so26909521lfe.12
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 05:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqYnGfdWZno7qJkEjFYALvPByYByHxsesugRoGAaxQY=;
        b=kyC2X77gxRyf68Ozjsgi+M4lfWWJkiKv52MHYw2+aRwSf04cTREftlX2nIwzdaxAIq
         DEwmlMLfug1SdrmsD4h/1uqhBXSMBWzSC06ZTlnRJNk/qqHnqti8JgnST+n23ZGEfIET
         lBVGz9CTFiqqcuoZblU0UV6J9mQjPIka59MhK3H5zer0KeyjXkr9bAiz6vE6bmDaFV1g
         vAFxHUjExJnr544U2lmdb5mm+WMG1z6ZUnytRNux9zYpUQrNxQi0rQfnRSOkzDydJY+M
         1x2GsNdFRFr9QBfnB48fXNm5ugK7vLOrZVU3H68NkGePu9KGnagAPZD3g/EknWV3KboE
         DCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqYnGfdWZno7qJkEjFYALvPByYByHxsesugRoGAaxQY=;
        b=4H38Nr8D3qFDhPsL8NtE8iuAlzHl41bZ8E/WCMt0nGxenb1Su8KlDNrWuReFKsB21v
         4Vzg/wrrFLANs8mVCByS6u8sHFin+qqpdx6DXZZszn0YGJdVbD0FvXh5cYcAownMN5zl
         hC+XDmggLl46OR6spmlvmaZPMTgbDnFwQKm1IczIChSttBRpuSVEnr41wwA5CGJ/01kG
         uEcs8r9nhrKRwP8epmfYxDUlLc/Lm3DpZkeFBsIRjXdVlNCb6atWiT1cy+gm7EhpyJnx
         Ur9WZdT6tGpuYAA3+Wg0+bOikBZ4FbiEZGEXuCRcCcbg+pENuu7q3lMG0kaqPnAbaAg+
         4HnA==
X-Gm-Message-State: ANoB5pneKqmqVBjvzZRJ2m06IQ531KpdzfOOCHPM5TlLjBwUL+dg4MRN
        6AvJO0J1k6Bva1GxkJwB2Y37w4s3YaJy/Q==
X-Google-Smtp-Source: AA0mqf5yOhzbuVnyvAnWDqVXaXxSR40XjdlS06X77FlAEgdUTkKq3KkQgz1gt4LrOlQbECqg+SMfVQ==
X-Received: by 2002:a05:6512:b8f:b0:4a2:3953:7e43 with SMTP id b15-20020a0565120b8f00b004a239537e43mr15068420lfv.229.1669814916202;
        Wed, 30 Nov 2022 05:28:36 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl. [95.49.125.236])
        by smtp.gmail.com with ESMTPSA id a12-20020a2ebe8c000000b0026fb1c3e6ddsm129241ljr.62.2022.11.30.05.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 05:28:35 -0800 (PST)
Message-ID: <48b22193-d55e-a9e4-41dd-97b855833383@linaro.org>
Date:   Wed, 30 Nov 2022 14:28:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 8/8] clk: qcom: rpm: drop the platform from clock
 definitions
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
References: <20221130131001.20912-1-dmitry.baryshkov@linaro.org>
 <20221130131001.20912-9-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221130131001.20912-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 30.11.2022 14:10, Dmitry Baryshkov wrote:
> A single clock definition can be used on different platforms. Thus the
> platform part of the clock name is not correct (and can be misleading).
> 
> Remove the platform-specific part of the defined clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/clk-rpm.c | 194 +++++++++++++++++--------------------
>  1 file changed, 89 insertions(+), 105 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
> index 747c473b0b5e..bcab76776571 100644
> --- a/drivers/clk/qcom/clk-rpm.c
> +++ b/drivers/clk/qcom/clk-rpm.c
> @@ -31,11 +31,11 @@ static const struct clk_parent_data gcc_cxo[] = {
>  	{ .fw_name = "cxo", .name = "cxo_board" },
>  };
>  
> -#define DEFINE_CLK_RPM(_platform, _name, _active, r_id)			      \
> -	static struct clk_rpm _platform##_##_active;			      \
> -	static struct clk_rpm _platform##_##_name = {			      \
> +#define DEFINE_CLK_RPM(_name, _active, r_id)				      \
> +	static struct clk_rpm clk_rpm_##_active;			      \
> +	static struct clk_rpm clk_rpm_##_name = {			      \
>  		.rpm_clk_id = (r_id),					      \
> -		.peer = &_platform##_##_active,				      \
> +		.peer = &clk_rpm_##_active,				      \
>  		.rate = INT_MAX,					      \
>  		.hw.init = &(struct clk_init_data){			      \
>  			.ops = &clk_rpm_ops,				      \
> @@ -44,9 +44,9 @@ static const struct clk_parent_data gcc_cxo[] = {
>  			.num_parents = ARRAY_SIZE(gcc_pxo),		      \
>  		},							      \
>  	};								      \
> -	static struct clk_rpm _platform##_##_active = {			      \
> +	static struct clk_rpm clk_rpm_##_active = {			      \
>  		.rpm_clk_id = (r_id),					      \
> -		.peer = &_platform##_##_name,				      \
> +		.peer = &clk_rpm_##_name,				      \
>  		.active_only = true,					      \
>  		.rate = INT_MAX,					      \
>  		.hw.init = &(struct clk_init_data){			      \
> @@ -57,20 +57,20 @@ static const struct clk_parent_data gcc_cxo[] = {
>  		},							      \
>  	}
>  
> -#define DEFINE_CLK_RPM_XO_BUFFER(_platform, _name, _active, offset)	      \
> -	static struct clk_rpm _platform##_##_name = {			      \
> +#define DEFINE_CLK_RPM_XO_BUFFER(_name, _active, offset)		      \
> +	static struct clk_rpm clk_rpm_##_name = {			      \
>  		.rpm_clk_id = QCOM_RPM_CXO_BUFFERS,			      \
>  		.xo_offset = (offset),					      \
>  		.hw.init = &(struct clk_init_data){			      \
> -			.ops = &clk_rpm_xo_ops,			      \
> +			.ops = &clk_rpm_xo_ops,				      \
>  			.name = #_name,					      \
>  			.parent_data = gcc_cxo,				      \
>  			.num_parents = ARRAY_SIZE(gcc_cxo),		      \
>  		},							      \
>  	}
>  
> -#define DEFINE_CLK_RPM_FIXED(_platform, _name, _active, r_id, r)	      \
> -	static struct clk_rpm _platform##_##_name = {			      \
> +#define DEFINE_CLK_RPM_FIXED(_name, _active, r_id, r)			      \
> +	static struct clk_rpm clk_rpm_##_name = {			      \
>  		.rpm_clk_id = (r_id),					      \
>  		.rate = (r),						      \
>  		.hw.init = &(struct clk_init_data){			      \
> @@ -403,37 +403,47 @@ static const struct clk_ops clk_rpm_ops = {
>  };
>  
>  /* MSM8660/APQ8060 */
> -DEFINE_CLK_RPM(msm8660, afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
> -DEFINE_CLK_RPM(msm8660, sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
> -DEFINE_CLK_RPM(msm8660, mmfab_clk, mmfab_a_clk, QCOM_RPM_MM_FABRIC_CLK);
> -DEFINE_CLK_RPM(msm8660, daytona_clk, daytona_a_clk, QCOM_RPM_DAYTONA_FABRIC_CLK);
> -DEFINE_CLK_RPM(msm8660, sfpb_clk, sfpb_a_clk, QCOM_RPM_SFPB_CLK);
> -DEFINE_CLK_RPM(msm8660, cfpb_clk, cfpb_a_clk, QCOM_RPM_CFPB_CLK);
> -DEFINE_CLK_RPM(msm8660, mmfpb_clk, mmfpb_a_clk, QCOM_RPM_MMFPB_CLK);
> -DEFINE_CLK_RPM(msm8660, smi_clk, smi_a_clk, QCOM_RPM_SMI_CLK);
> -DEFINE_CLK_RPM(msm8660, ebi1_clk, ebi1_a_clk, QCOM_RPM_EBI1_CLK);
> -DEFINE_CLK_RPM_FIXED(msm8660, pll4_clk, pll4_a_clk, QCOM_RPM_PLL_4, 540672000);
> +DEFINE_CLK_RPM(afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
> +DEFINE_CLK_RPM(sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
> +DEFINE_CLK_RPM(mmfab_clk, mmfab_a_clk, QCOM_RPM_MM_FABRIC_CLK);
> +DEFINE_CLK_RPM(daytona_clk, daytona_a_clk, QCOM_RPM_DAYTONA_FABRIC_CLK);
> +DEFINE_CLK_RPM(sfpb_clk, sfpb_a_clk, QCOM_RPM_SFPB_CLK);
> +DEFINE_CLK_RPM(cfpb_clk, cfpb_a_clk, QCOM_RPM_CFPB_CLK);
> +DEFINE_CLK_RPM(mmfpb_clk, mmfpb_a_clk, QCOM_RPM_MMFPB_CLK);
> +DEFINE_CLK_RPM(smi_clk, smi_a_clk, QCOM_RPM_SMI_CLK);
> +DEFINE_CLK_RPM(ebi1_clk, ebi1_a_clk, QCOM_RPM_EBI1_CLK);
> +DEFINE_CLK_RPM(qdss_clk, qdss_a_clk, QCOM_RPM_QDSS_CLK);
> +DEFINE_CLK_RPM(nss_fabric_0_clk, nss_fabric_0_a_clk, QCOM_RPM_NSS_FABRIC_0_CLK);
> +DEFINE_CLK_RPM(nss_fabric_1_clk, nss_fabric_1_a_clk, QCOM_RPM_NSS_FABRIC_1_CLK);
> +
> +DEFINE_CLK_RPM_FIXED(pll4_clk, pll4_a_clk, QCOM_RPM_PLL_4, 540672000);
> +
> +DEFINE_CLK_RPM_XO_BUFFER(xo_d0_clk, xo_d0_a_clk, 0);
> +DEFINE_CLK_RPM_XO_BUFFER(xo_d1_clk, xo_d1_a_clk, 8);
> +DEFINE_CLK_RPM_XO_BUFFER(xo_a0_clk, xo_a0_a_clk, 16);
> +DEFINE_CLK_RPM_XO_BUFFER(xo_a1_clk, xo_a1_a_clk, 24);
> +DEFINE_CLK_RPM_XO_BUFFER(xo_a2_clk, xo_a2_a_clk, 28);
>  
>  static struct clk_rpm *msm8660_clks[] = {
> -	[RPM_APPS_FABRIC_CLK] = &msm8660_afab_clk,
> -	[RPM_APPS_FABRIC_A_CLK] = &msm8660_afab_a_clk,
> -	[RPM_SYS_FABRIC_CLK] = &msm8660_sfab_clk,
> -	[RPM_SYS_FABRIC_A_CLK] = &msm8660_sfab_a_clk,
> -	[RPM_MM_FABRIC_CLK] = &msm8660_mmfab_clk,
> -	[RPM_MM_FABRIC_A_CLK] = &msm8660_mmfab_a_clk,
> -	[RPM_DAYTONA_FABRIC_CLK] = &msm8660_daytona_clk,
> -	[RPM_DAYTONA_FABRIC_A_CLK] = &msm8660_daytona_a_clk,
> -	[RPM_SFPB_CLK] = &msm8660_sfpb_clk,
> -	[RPM_SFPB_A_CLK] = &msm8660_sfpb_a_clk,
> -	[RPM_CFPB_CLK] = &msm8660_cfpb_clk,
> -	[RPM_CFPB_A_CLK] = &msm8660_cfpb_a_clk,
> -	[RPM_MMFPB_CLK] = &msm8660_mmfpb_clk,
> -	[RPM_MMFPB_A_CLK] = &msm8660_mmfpb_a_clk,
> -	[RPM_SMI_CLK] = &msm8660_smi_clk,
> -	[RPM_SMI_A_CLK] = &msm8660_smi_a_clk,
> -	[RPM_EBI1_CLK] = &msm8660_ebi1_clk,
> -	[RPM_EBI1_A_CLK] = &msm8660_ebi1_a_clk,
> -	[RPM_PLL4_CLK] = &msm8660_pll4_clk,
> +	[RPM_APPS_FABRIC_CLK] = &clk_rpm_afab_clk,
> +	[RPM_APPS_FABRIC_A_CLK] = &clk_rpm_afab_a_clk,
> +	[RPM_SYS_FABRIC_CLK] = &clk_rpm_sfab_clk,
> +	[RPM_SYS_FABRIC_A_CLK] = &clk_rpm_sfab_a_clk,
> +	[RPM_MM_FABRIC_CLK] = &clk_rpm_mmfab_clk,
> +	[RPM_MM_FABRIC_A_CLK] = &clk_rpm_mmfab_a_clk,
> +	[RPM_DAYTONA_FABRIC_CLK] = &clk_rpm_daytona_clk,
> +	[RPM_DAYTONA_FABRIC_A_CLK] = &clk_rpm_daytona_a_clk,
> +	[RPM_SFPB_CLK] = &clk_rpm_sfpb_clk,
> +	[RPM_SFPB_A_CLK] = &clk_rpm_sfpb_a_clk,
> +	[RPM_CFPB_CLK] = &clk_rpm_cfpb_clk,
> +	[RPM_CFPB_A_CLK] = &clk_rpm_cfpb_a_clk,
> +	[RPM_MMFPB_CLK] = &clk_rpm_mmfpb_clk,
> +	[RPM_MMFPB_A_CLK] = &clk_rpm_mmfpb_a_clk,
> +	[RPM_SMI_CLK] = &clk_rpm_smi_clk,
> +	[RPM_SMI_A_CLK] = &clk_rpm_smi_a_clk,
> +	[RPM_EBI1_CLK] = &clk_rpm_ebi1_clk,
> +	[RPM_EBI1_A_CLK] = &clk_rpm_ebi1_a_clk,
> +	[RPM_PLL4_CLK] = &clk_rpm_pll4_clk,
>  };
>  
>  static const struct rpm_clk_desc rpm_clk_msm8660 = {
> @@ -441,46 +451,30 @@ static const struct rpm_clk_desc rpm_clk_msm8660 = {
>  	.num_clks = ARRAY_SIZE(msm8660_clks),
>  };
>  
> -/* apq8064 */
> -DEFINE_CLK_RPM(apq8064, afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
> -DEFINE_CLK_RPM(apq8064, cfpb_clk, cfpb_a_clk, QCOM_RPM_CFPB_CLK);
> -DEFINE_CLK_RPM(apq8064, daytona_clk, daytona_a_clk, QCOM_RPM_DAYTONA_FABRIC_CLK);
> -DEFINE_CLK_RPM(apq8064, ebi1_clk, ebi1_a_clk, QCOM_RPM_EBI1_CLK);
> -DEFINE_CLK_RPM(apq8064, mmfab_clk, mmfab_a_clk, QCOM_RPM_MM_FABRIC_CLK);
> -DEFINE_CLK_RPM(apq8064, mmfpb_clk, mmfpb_a_clk, QCOM_RPM_MMFPB_CLK);
> -DEFINE_CLK_RPM(apq8064, sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
> -DEFINE_CLK_RPM(apq8064, sfpb_clk, sfpb_a_clk, QCOM_RPM_SFPB_CLK);
> -DEFINE_CLK_RPM(apq8064, qdss_clk, qdss_a_clk, QCOM_RPM_QDSS_CLK);
> -DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_d0_clk, xo_d0_a_clk, 0);
> -DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_d1_clk, xo_d1_a_clk, 8);
> -DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a0_clk, xo_a0_a_clk, 16);
> -DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a1_clk, xo_a1_a_clk, 24);
> -DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a2_clk, xo_a2_a_clk, 28);
> -
>  static struct clk_rpm *apq8064_clks[] = {
> -	[RPM_APPS_FABRIC_CLK] = &apq8064_afab_clk,
> -	[RPM_APPS_FABRIC_A_CLK] = &apq8064_afab_a_clk,
> -	[RPM_CFPB_CLK] = &apq8064_cfpb_clk,
> -	[RPM_CFPB_A_CLK] = &apq8064_cfpb_a_clk,
> -	[RPM_DAYTONA_FABRIC_CLK] = &apq8064_daytona_clk,
> -	[RPM_DAYTONA_FABRIC_A_CLK] = &apq8064_daytona_a_clk,
> -	[RPM_EBI1_CLK] = &apq8064_ebi1_clk,
> -	[RPM_EBI1_A_CLK] = &apq8064_ebi1_a_clk,
> -	[RPM_MM_FABRIC_CLK] = &apq8064_mmfab_clk,
> -	[RPM_MM_FABRIC_A_CLK] = &apq8064_mmfab_a_clk,
> -	[RPM_MMFPB_CLK] = &apq8064_mmfpb_clk,
> -	[RPM_MMFPB_A_CLK] = &apq8064_mmfpb_a_clk,
> -	[RPM_SYS_FABRIC_CLK] = &apq8064_sfab_clk,
> -	[RPM_SYS_FABRIC_A_CLK] = &apq8064_sfab_a_clk,
> -	[RPM_SFPB_CLK] = &apq8064_sfpb_clk,
> -	[RPM_SFPB_A_CLK] = &apq8064_sfpb_a_clk,
> -	[RPM_QDSS_CLK] = &apq8064_qdss_clk,
> -	[RPM_QDSS_A_CLK] = &apq8064_qdss_a_clk,
> -	[RPM_XO_D0] = &apq8064_xo_d0_clk,
> -	[RPM_XO_D1] = &apq8064_xo_d1_clk,
> -	[RPM_XO_A0] = &apq8064_xo_a0_clk,
> -	[RPM_XO_A1] = &apq8064_xo_a1_clk,
> -	[RPM_XO_A2] = &apq8064_xo_a2_clk,
> +	[RPM_APPS_FABRIC_CLK] = &clk_rpm_afab_clk,
> +	[RPM_APPS_FABRIC_A_CLK] = &clk_rpm_afab_a_clk,
> +	[RPM_CFPB_CLK] = &clk_rpm_cfpb_clk,
> +	[RPM_CFPB_A_CLK] = &clk_rpm_cfpb_a_clk,
> +	[RPM_DAYTONA_FABRIC_CLK] = &clk_rpm_daytona_clk,
> +	[RPM_DAYTONA_FABRIC_A_CLK] = &clk_rpm_daytona_a_clk,
> +	[RPM_EBI1_CLK] = &clk_rpm_ebi1_clk,
> +	[RPM_EBI1_A_CLK] = &clk_rpm_ebi1_a_clk,
> +	[RPM_MM_FABRIC_CLK] = &clk_rpm_mmfab_clk,
> +	[RPM_MM_FABRIC_A_CLK] = &clk_rpm_mmfab_a_clk,
> +	[RPM_MMFPB_CLK] = &clk_rpm_mmfpb_clk,
> +	[RPM_MMFPB_A_CLK] = &clk_rpm_mmfpb_a_clk,
> +	[RPM_SYS_FABRIC_CLK] = &clk_rpm_sfab_clk,
> +	[RPM_SYS_FABRIC_A_CLK] = &clk_rpm_sfab_a_clk,
> +	[RPM_SFPB_CLK] = &clk_rpm_sfpb_clk,
> +	[RPM_SFPB_A_CLK] = &clk_rpm_sfpb_a_clk,
> +	[RPM_QDSS_CLK] = &clk_rpm_qdss_clk,
> +	[RPM_QDSS_A_CLK] = &clk_rpm_qdss_a_clk,
> +	[RPM_XO_D0] = &clk_rpm_xo_d0_clk,
> +	[RPM_XO_D1] = &clk_rpm_xo_d1_clk,
> +	[RPM_XO_A0] = &clk_rpm_xo_a0_clk,
> +	[RPM_XO_A1] = &clk_rpm_xo_a1_clk,
> +	[RPM_XO_A2] = &clk_rpm_xo_a2_clk,
>  };
>  
>  static const struct rpm_clk_desc rpm_clk_apq8064 = {
> @@ -488,33 +482,23 @@ static const struct rpm_clk_desc rpm_clk_apq8064 = {
>  	.num_clks = ARRAY_SIZE(apq8064_clks),
>  };
>  
> -/* ipq806x */
> -DEFINE_CLK_RPM(ipq806x, afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
> -DEFINE_CLK_RPM(ipq806x, cfpb_clk, cfpb_a_clk, QCOM_RPM_CFPB_CLK);
> -DEFINE_CLK_RPM(ipq806x, daytona_clk, daytona_a_clk, QCOM_RPM_DAYTONA_FABRIC_CLK);
> -DEFINE_CLK_RPM(ipq806x, ebi1_clk, ebi1_a_clk, QCOM_RPM_EBI1_CLK);
> -DEFINE_CLK_RPM(ipq806x, sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
> -DEFINE_CLK_RPM(ipq806x, sfpb_clk, sfpb_a_clk, QCOM_RPM_SFPB_CLK);
> -DEFINE_CLK_RPM(ipq806x, nss_fabric_0_clk, nss_fabric_0_a_clk, QCOM_RPM_NSS_FABRIC_0_CLK);
> -DEFINE_CLK_RPM(ipq806x, nss_fabric_1_clk, nss_fabric_1_a_clk, QCOM_RPM_NSS_FABRIC_1_CLK);
> -
>  static struct clk_rpm *ipq806x_clks[] = {
> -	[RPM_APPS_FABRIC_CLK] = &ipq806x_afab_clk,
> -	[RPM_APPS_FABRIC_A_CLK] = &ipq806x_afab_a_clk,
> -	[RPM_CFPB_CLK] = &ipq806x_cfpb_clk,
> -	[RPM_CFPB_A_CLK] = &ipq806x_cfpb_a_clk,
> -	[RPM_DAYTONA_FABRIC_CLK] = &ipq806x_daytona_clk,
> -	[RPM_DAYTONA_FABRIC_A_CLK] = &ipq806x_daytona_a_clk,
> -	[RPM_EBI1_CLK] = &ipq806x_ebi1_clk,
> -	[RPM_EBI1_A_CLK] = &ipq806x_ebi1_a_clk,
> -	[RPM_SYS_FABRIC_CLK] = &ipq806x_sfab_clk,
> -	[RPM_SYS_FABRIC_A_CLK] = &ipq806x_sfab_a_clk,
> -	[RPM_SFPB_CLK] = &ipq806x_sfpb_clk,
> -	[RPM_SFPB_A_CLK] = &ipq806x_sfpb_a_clk,
> -	[RPM_NSS_FABRIC_0_CLK] = &ipq806x_nss_fabric_0_clk,
> -	[RPM_NSS_FABRIC_0_A_CLK] = &ipq806x_nss_fabric_0_a_clk,
> -	[RPM_NSS_FABRIC_1_CLK] = &ipq806x_nss_fabric_1_clk,
> -	[RPM_NSS_FABRIC_1_A_CLK] = &ipq806x_nss_fabric_1_a_clk,
> +	[RPM_APPS_FABRIC_CLK] = &clk_rpm_afab_clk,
> +	[RPM_APPS_FABRIC_A_CLK] = &clk_rpm_afab_a_clk,
> +	[RPM_CFPB_CLK] = &clk_rpm_cfpb_clk,
> +	[RPM_CFPB_A_CLK] = &clk_rpm_cfpb_a_clk,
> +	[RPM_DAYTONA_FABRIC_CLK] = &clk_rpm_daytona_clk,
> +	[RPM_DAYTONA_FABRIC_A_CLK] = &clk_rpm_daytona_a_clk,
> +	[RPM_EBI1_CLK] = &clk_rpm_ebi1_clk,
> +	[RPM_EBI1_A_CLK] = &clk_rpm_ebi1_a_clk,
> +	[RPM_SYS_FABRIC_CLK] = &clk_rpm_sfab_clk,
> +	[RPM_SYS_FABRIC_A_CLK] = &clk_rpm_sfab_a_clk,
> +	[RPM_SFPB_CLK] = &clk_rpm_sfpb_clk,
> +	[RPM_SFPB_A_CLK] = &clk_rpm_sfpb_a_clk,
> +	[RPM_NSS_FABRIC_0_CLK] = &clk_rpm_nss_fabric_0_clk,
> +	[RPM_NSS_FABRIC_0_A_CLK] = &clk_rpm_nss_fabric_0_a_clk,
> +	[RPM_NSS_FABRIC_1_CLK] = &clk_rpm_nss_fabric_1_clk,
> +	[RPM_NSS_FABRIC_1_A_CLK] = &clk_rpm_nss_fabric_1_a_clk,
>  };
>  
>  static const struct rpm_clk_desc rpm_clk_ipq806x = {
