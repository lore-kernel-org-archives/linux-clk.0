Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E68C07E99
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jul 2021 18:55:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90E1F613C3
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jul 2021 18:55:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbhGIS6K (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Jul 2021 14:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbhGIS6K (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jul 2021 14:58:10 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA82DC0613E6
        for <linux-clk@vger.kernel.org>; Fri,  9 Jul 2021 11:55:26 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id l26so13380340oic.7
        for <linux-clk@vger.kernel.org>; Fri, 09 Jul 2021 11:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uB9Eme5ZVBV7EnqQMMLYyAMl/eqDXMgXY7i7Hw0mKEs=;
        b=d/bcCehuBJn2d5ELJK1ULtS7j+/2lTPxvJVjr3DmntKvjNVfJxq0FhhIwA9aHOF2VX
         KWN+HE9FuUeYGQnhxoYTvDlsNLmZOhnCYV9FpfMRimPX20aysF37Y3n/QPcAnxUiRrWy
         Fjp2l0QqoOAJKU7LE7jybbhxpv2j/qNSXu0F1HNLDPwn+ChKmhdxaknYwFkv8vX+/x9I
         Pdl/HYfnVmKM00aClOSH4udWXT2nk6qflavGzMxKUmNtDLnGicz4twI9u0IwRB2tCbm+
         YiMxgmvrkZREKNex8vMOUgVfhvU7kin+735VlbqiG3Zup5VvNhZnlhX1fCn1IUVq0jeg
         GQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uB9Eme5ZVBV7EnqQMMLYyAMl/eqDXMgXY7i7Hw0mKEs=;
        b=CDGplfc/JZLeNy/pQHf9kqHhbneJTSW1+jBlhEZhK5465DAho9GmqT6/DPZ6qfiZpe
         HZ1zhPmXeIHKTTy9ablHWH62Hvjc3pMBvoELFKYqtFFZaPA52dv/a8zYRlmgn5VzzmsB
         0YWNrTwKo/6pT5IWWsJiaJp5OZHjX+PCHwZSxXu61YBmJMYlILORTbElXRnNY6ApJKxw
         xHwST9Ga9DRctK//b4mQ/3Gs0cIgQ8Dk4PWme5r9vhGOHe2OwYx2Wwr1Kt7Jamyew5Wd
         HQ1guZsQFuWz0zAu9/rrTgpY6FLkVHjRFdeTFnvICxSAE0DI2ANiAGKIkg0Dwb6yvtK4
         Ckfw==
X-Gm-Message-State: AOAM533TJiB7O+LB6zZGQ9pNP9Ae8IMVyHkJ8L0EdaXOez4Rhi1VkYww
        AaLwhXsHO+/k7uCcGGJf4WfdVA==
X-Google-Smtp-Source: ABdhPJzCEqCusHOgpOD/C7bb+a/2dnNpEdSnz6mJFimLIERNNw654/5qKRCQE7P+dxPA/RFOR23VWg==
X-Received: by 2002:a54:4513:: with SMTP id l19mr329034oil.36.1625856926173;
        Fri, 09 Jul 2021 11:55:26 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j23sm1387888oie.9.2021.07.09.11.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 11:55:25 -0700 (PDT)
Date:   Fri, 9 Jul 2021 13:55:23 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/7] arm64: dts: qcom: sm8250: remove mmcx regulator
Message-ID: <YOibmxZ8IwGncqjS@yoga>
References: <20210709173202.667820-1-dmitry.baryshkov@linaro.org>
 <20210709173202.667820-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709173202.667820-6-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri 09 Jul 12:32 CDT 2021, Dmitry Baryshkov wrote:

> Switch dispcc and videocc into using MMCX domain directly. Drop the now
> unused mmcx regulator.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 4c0de12aaba6..2a468b85dc09 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -271,13 +271,6 @@ memory@80000000 {
>  		reg = <0x0 0x80000000 0x0 0x0>;
>  	};
>  
> -	mmcx_reg: mmcx-reg {
> -		compatible = "regulator-fixed-domain";
> -		power-domains = <&rpmhpd SM8250_MMCX>;
> -		required-opps = <&rpmhpd_opp_low_svs>;
> -		regulator-name = "MMCX";
> -	};
> -
>  	pmu {
>  		compatible = "arm,armv8-pmuv3";
>  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> @@ -2362,7 +2355,7 @@ videocc: clock-controller@abf0000 {
>  			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
>  				 <&rpmhcc RPMH_CXO_CLK>,
>  				 <&rpmhcc RPMH_CXO_CLK_A>;
> -			mmcx-supply = <&mmcx_reg>;
> +			power-domains = <&rpmhpd SM8250_MMCX>;
>  			clock-names = "iface", "bi_tcxo", "bi_tcxo_ao";
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
> @@ -2627,7 +2620,7 @@ opp-358000000 {
>  		dispcc: clock-controller@af00000 {
>  			compatible = "qcom,sm8250-dispcc";
>  			reg = <0 0x0af00000 0 0x10000>;
> -			mmcx-supply = <&mmcx_reg>;
> +			power-domains = <&rpmhpd SM8250_MMCX>;
>  			clocks = <&rpmhcc RPMH_CXO_CLK>,
>  				 <&dsi0_phy 0>,
>  				 <&dsi0_phy 1>,
> -- 
> 2.30.2
> 
