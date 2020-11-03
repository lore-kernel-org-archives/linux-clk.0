Return-Path: <SRS0=je5o=EJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E74CC2D0A3
	for <linux-clk@archiver.kernel.org>; Tue,  3 Nov 2020 17:38:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 139DB22264
	for <linux-clk@archiver.kernel.org>; Tue,  3 Nov 2020 17:38:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FqmmT6V8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728889AbgKCRiu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Nov 2020 12:38:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728690AbgKCRiu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Nov 2020 12:38:50 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C70C0613D1
        for <linux-clk@vger.kernel.org>; Tue,  3 Nov 2020 09:38:50 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id u127so19169526oib.6
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2020 09:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6yq0B3gvpA5I9jO0QaxOACvCmaKCwDtvfH76pkYCkZg=;
        b=FqmmT6V8Gq5zNDIRdAcsPxa3SHsggSSNGDGshs9JNs2boyl4bwPhwJvkChemdgu8sQ
         8g2z9V5syZcqucGxPh97feZDakb+BmVINkLo8avFUzEv38aC/OVzMdmrhq2Db3D7IDbA
         DAE5DBqAk9bVC59sFuSRAFsy57q+Ckyl4WCT9fakS/H5JmJX/zuLpBtNOSudLhwi79Lg
         h155UN0cN2fM/3gR5qV+FC604ThUqXqqSpxTK4Up6THGOgyx3ecwMZ4g8/CJSTPwnxsB
         j17Jji8+K47Z/mVwX3f1Ro2UH6C0HqHfIHvR1uUfYb4f/6OoCh8XMNNALRoACXkNzB9w
         /j6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6yq0B3gvpA5I9jO0QaxOACvCmaKCwDtvfH76pkYCkZg=;
        b=hb26QfgJOGM81Z9lS1Ovtw8MyNVYgk4s9OIB+g3xIS3fyWGNbQtCgBW3RSx/dgpat6
         qqQxOJTSf9yboW7dznVsu3M5o38O9NSWNgeBGv3GwZ4RMXg4Xv+2kmL6DGToe3N06CDo
         16+xfR9WdkX5+/nttSNkcIlnB9lAz+8dNUvfKXeMRc6saqORQ923A3DI25cEB/qRdRBy
         mQjCrsJp9FbE4+VMpJ3tQVcyflvDtBnsYUocC1eHeVe4vLUdC2qVOZeXqnyuf9XqvBSs
         hd3EaHh+WRlcvfZsfAFpekIfa+kE33AtkYQCCjXvCs5vuLbpDeFETEjVLy1mPaocQj3x
         kcPA==
X-Gm-Message-State: AOAM5336dVdVz8VGU/re3BPGqG46VA4vwv+0/8qVZRGhaifg8Ta0OZ9V
        H6BQX3en+KdNN78IBNvCimIB8g==
X-Google-Smtp-Source: ABdhPJypPLRjFtGH2biL/X5Yn96B4TBH3Vu+himb7NU0CUAstfPyiQfNjdgy9o775vs0mUl4QvjBxw==
X-Received: by 2002:aca:fcd5:: with SMTP id a204mr146080oii.161.1604425129714;
        Tue, 03 Nov 2020 09:38:49 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h3sm4288352oom.18.2020.11.03.09.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 09:38:48 -0800 (PST)
Date:   Tue, 3 Nov 2020 11:38:47 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: clock: Introduce RPMHCC bindings for
 SDX55
Message-ID: <20201103173847.GQ3151@builder.lan>
References: <20201028074232.22922-1-manivannan.sadhasivam@linaro.org>
 <20201028074232.22922-4-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201028074232.22922-4-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed 28 Oct 02:42 CDT 2020, Manivannan Sadhasivam wrote:

> From: Vinod Koul <vkoul@kernel.org>
> 
> Add compatible for SDX55 RPMHCC and DT include.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Given that you handled the patch on its way here you should add your
Signed-off-by.

When doing so feel free to add my:
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  include/dt-bindings/clock/qcom,rpmh.h                    | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> index a46a3a799a70..a54930f111ba 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> @@ -19,6 +19,7 @@ properties:
>      enum:
>        - qcom,sc7180-rpmh-clk
>        - qcom,sdm845-rpmh-clk
> +      - qcom,sdx55-rpmh-clk
>        - qcom,sm8150-rpmh-clk
>        - qcom,sm8250-rpmh-clk
>  
> diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
> index 2e6c54e65455..cd806eccb7dd 100644
> --- a/include/dt-bindings/clock/qcom,rpmh.h
> +++ b/include/dt-bindings/clock/qcom,rpmh.h
> @@ -21,5 +21,6 @@
>  #define RPMH_IPA_CLK				12
>  #define RPMH_LN_BB_CLK1				13
>  #define RPMH_LN_BB_CLK1_A			14
> +#define RPMH_QPIC_CLK				15
>  
>  #endif
> -- 
> 2.17.1
> 
