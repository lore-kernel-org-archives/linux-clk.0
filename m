Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FEB0C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 13 Jul 2022 21:29:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237458AbiGMV3S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Jul 2022 17:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231769AbiGMV3R (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Jul 2022 17:29:17 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02622252D
        for <linux-clk@vger.kernel.org>; Wed, 13 Jul 2022 14:29:16 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id e2-20020a4ab982000000b004354ba9a591so18340oop.0
        for <linux-clk@vger.kernel.org>; Wed, 13 Jul 2022 14:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DAIvkORMY0eHuzO0UF6055+MNm4d5HssuHFf88BN1UI=;
        b=EZHKhsguEAPEJy9bBeWQHr2VgpR//He8sO1V7us4Fzth0GlBVpYEHAbDtuFKNlH9AX
         ny4twiBDh0XOIO+FoW/82qhpHPTv68i4wjXJbIBMsIgYhSEndRHS2N9oXDmFTmXDcvLi
         LSjGvIngTBa94+CxCH9h3iTSF+Mz99KUszPUGVie1LtGTQgPeVkqBLVleOhpa3U9UI7m
         yuRyEbLU3Up0vor3aU8X9Rkqq9KqU27n20PBYMPAKdkj3ADB1Y11r73Bc+B6GleagTY2
         h9TqQFEQkZ+W0RPjFPj2tN4CtAmo1dhIozLNP9tlwXbZIF/9jmnszVbaCq2bekApqi7p
         CliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DAIvkORMY0eHuzO0UF6055+MNm4d5HssuHFf88BN1UI=;
        b=7s7IYDEwqGhfmsm2qFVtOvTUzIkCeLMQUDjnvntGTi+2rXs2lvTp8EMZ9Y/Q1bFhSG
         XKygFI8yNdRGKDIN1rHh6K0Sp5Rx+EQ+GBWQCoNVMhexQSrfVMAXeLFbcgnR1XvqDGrg
         Jrz//UNbREDKvjzQiImAodIkGMosVtouOglghGHf59AtYlUok7SDDaYmTVkDX7p3ADtX
         D9+x+JCsIF3zr5OYlKvkq6z0ancajkxq6EtR26zlk6VNm5U/Ll1eARAiBt6bQCNYixRT
         thcIuPhxZZqUCtxlQwzlVmjQ0J53hBhhP+S9WKK1lZHIEAp7B3HftI83yKiWJjt+TlOb
         v0eg==
X-Gm-Message-State: AJIora+mulkTQw/fWNj8pwlTX5Yb0UPeXtLXGu+54GaRVELvscqCCywp
        DsfzIpDYtf5miHUTDkEd3CHEvRyM6z+Q5A==
X-Google-Smtp-Source: AGRyM1tHTIAmGVl8qjAwCJwYZFFQqlZezy4v4mw7f2zjYYHeDaow0QxrcsOXFWlylngpaVlqoaEBMQ==
X-Received: by 2002:a4a:8f51:0:b0:425:a539:f876 with SMTP id f17-20020a4a8f51000000b00425a539f876mr1973480ool.88.1657747756247;
        Wed, 13 Jul 2022 14:29:16 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r31-20020a4a9662000000b00431d44849e9sm4907783ooi.20.2022.07.13.14.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 14:29:15 -0700 (PDT)
Date:   Wed, 13 Jul 2022 16:29:13 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8660: add pxo/cxo clocks to the
 GCC node
Message-ID: <Ys85KUGnlXlUI+zE@builder.lan>
References: <20220620110739.1598514-1-dmitry.baryshkov@linaro.org>
 <20220620110739.1598514-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620110739.1598514-4-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 20 Jun 06:07 CDT 2022, Dmitry Baryshkov wrote:

> Add pxo/cxo clocks to the GCC device tree node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-msm8660.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
> index 47b97daecef1..61e3ab0ebfd3 100644
> --- a/arch/arm/boot/dts/qcom-msm8660.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
> @@ -50,13 +50,13 @@ cpu-pmu {
>  	};
>  
>  	clocks {
> -		cxo_board {
> +		cxo_board: cxo_board {

As requested by Krzysztof, please use clock-output-names to specify the
name of the clock, and rename the node "cxo-board-clk".

Thanks,
Bjorn

>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
>  			clock-frequency = <19200000>;
>  		};
>  
> -		pxo_board {
> +		pxo_board: pxo_board {
>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
>  			clock-frequency = <27000000>;
> @@ -129,6 +129,8 @@ gcc: clock-controller@900000 {
>  			#power-domain-cells = <1>;
>  			#reset-cells = <1>;
>  			reg = <0x900000 0x4000>;
> +			clocks = <&pxo_board>, <&cxo_board>;
> +			clock-names = "pxo", "cxo";
>  		};
>  
>  		gsbi6: gsbi@16500000 {
> -- 
> 2.35.1
> 
