Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640C9C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 24 Feb 2022 04:18:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbiBXETV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Feb 2022 23:19:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbiBXETU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 23:19:20 -0500
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBC29246348
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 20:18:49 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id r41-20020a4a966c000000b0031bf85a4124so1881502ooi.0
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 20:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3k6nsUndnaxGq9KrFdUGS0lUU74/xXQS8rZbei+mTJ4=;
        b=QfXCIdQg6ynE2/b9iuVz8gzFFfvo480TDTQblLZrdL0X4oVElQTIXreVApwCaJt+8X
         Y6OW+WD47gnndn3OyBb57hzI53/WV9iaNGhUMYITbREv0uap8GI/jQkBmKnLWczFekIU
         eFBx1xoZH9Beyq65wwttB7uYpSmsHGwV4aPLvi4vF1SbJ6nQAI2m6HtVilBiNQnKst/d
         OTZO2w4H5vS33BdxGztGMJdHLNKVtT6pVh6M1gYpy3HGJUIW0rL4PSv+nUIJvWy3eaVG
         dtxi+MamoE+T7gqUIxQU2nVpZU+ktfhVijwSh+A+bUCFoDQuTg8GQ5lEc23vo9wiGngo
         3dqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3k6nsUndnaxGq9KrFdUGS0lUU74/xXQS8rZbei+mTJ4=;
        b=wNyqzjcfrNXhW2PvARv7T6omEVsAGKDTpWIZTGD+wBQWv1HU3p91V/z2KzEiHt1prW
         KXZZkZMRbslIvFYQjQ9PJtbo/d8CvL7KRDwe9WC4uNKOvAZmktixhkgIJDP2Iyl8ElYq
         RjLbVvOSiqTlNkSk5XJhDKmV/ExUjk/YAg+WTcarryfsu9OOZJEouE+kr1RwBeeFg7hw
         1dYliYxapB18rJfTdMlr+p8kueb5MG/gescjorBMa5T+C6qvVifGxyYFPPr6vl0tdRUQ
         CJE06TYU7v+RwkqP1LXWsga1TOfOf/LS5IzwHnaEds8jNFKIGqhvi4d7CuSPIXGDhdes
         vuyw==
X-Gm-Message-State: AOAM531JRx4EMw7ZyEqGLhfOsw+y9ox7eTribHha2GctNyBZhP/MZ6PS
        4AWC1sEjd8jOauA0OCjJaYLSSA==
X-Google-Smtp-Source: ABdhPJwxeRMbnIgdkJ0zYIx+4TkSJMsh+2992YU/H+8qTI/VUzh/b5ekIWMqVJXeUOq07tWHjkG02g==
X-Received: by 2002:a05:6870:d8b1:b0:ce:c0c9:5f7 with SMTP id dv49-20020a056870d8b100b000cec0c905f7mr5517709oab.73.1645676329255;
        Wed, 23 Feb 2022 20:18:49 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id g11sm818174oan.35.2022.02.23.20.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 20:18:48 -0800 (PST)
Date:   Wed, 23 Feb 2022 22:18:46 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: msm8996: add cxo and sleep-clk to
 gcc node
Message-ID: <YhcHJmM0WaBYP+dw@builder.lan>
References: <20220215201539.3970459-1-dmitry.baryshkov@linaro.org>
 <20220215201539.3970459-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215201539.3970459-5-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 15 Feb 14:15 CST 2022, Dmitry Baryshkov wrote:

> Supply proper cxo (RPM_SMD_BB_CLK1) and sleep_clk to the gcc clock
> controller node.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 91bc974aeb0a..7a46f0f67cbb 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -679,8 +679,10 @@ gcc: clock-controller@300000 {
>  			#power-domain-cells = <1>;
>  			reg = <0x00300000 0x90000>;
>  
> -			clocks = <&rpmcc RPM_SMD_LN_BB_CLK>;
> -			clock-names = "cxo2";
> +			clocks = <&rpmcc RPM_SMD_BB_CLK1>,
> +				 <&rpmcc RPM_SMD_LN_BB_CLK>,
> +				 <&sleep_clk>;
> +			clock-names = "cxo", "cxo2", "sleep_clk";
>  		};
>  
>  		tsens0: thermal-sensor@4a9000 {
> -- 
> 2.34.1
> 
