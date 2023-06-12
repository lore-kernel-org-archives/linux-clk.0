Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D30CEC7EE2E
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 09:12:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233235AbjFLJMO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 05:12:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230511AbjFLJLa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 05:11:30 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7EB25B92
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:06:22 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f7f543fe2fso40816035e9.2
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686560781; x=1689152781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cfthyup1MM34d0KPR41lO7/SV8nsTNgfaRPuqAAmHjE=;
        b=RKFp2NK0zdHnKIFeM6f7rUowCZzE2y9qekqT+LTMxeK/YmE4lYWYNgRQnMt4Q/j5XY
         lMVhwj5Z9QYHhvn1cyrNiHnqqZ2CGlYb8JWFVkWVODpVTn2CAP7l6Y0WJ6la46eYtzw0
         SiA23a41q9Jn19pS6WAS+snPVV/fdjB80/a9TDkjlZNbEvybZEDACnqsKdGexl7WaedC
         mVq62YRfoo6CetEr+1Xz/9a5rVtNj4dXY1xwgNd3cuuUzlXzcM1hv6rOeTnYLR2mHgGH
         /ZbIc4w8XVMWsStCDNJzBERKPzaLK+EdWC7U0XJSlGwwCBzAaxm+ClAXDgnXH5XRQony
         e6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686560781; x=1689152781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cfthyup1MM34d0KPR41lO7/SV8nsTNgfaRPuqAAmHjE=;
        b=XcAccfxGAGRC7epe+ubyYh8pzQS3wVi136OkcVeG6uusX31oqJPKTsRkM1Qal+BsMn
         seY5PLjptpiI+BvOfEkB7xplt/sljvaXSnuOU5esul5uiiqXVI4O2CP/cNThnCXSS6m8
         cg1MzEIvhDNNDRI5XDPTf+DT2tpczk5PDeNXvGC0hB5C8WmOupIOxBP4vz6g+/X1635T
         yafLMUlvz95//VtR020a/YY8cgzd+HUahCvksNAsxIOuuj0WckJOgwjegvoO09LzZhME
         mwJtYgDRa79LQTI2u8Vt8ov4aynJWFE0AIUiNq4E1PvQsF3bXn4pFeFHKF+qiE6svMr8
         vcqQ==
X-Gm-Message-State: AC+VfDxD8Gq/nalgSjwmkKlVGMjktlcQ5aCIvd0XcA5wfBZ+paGHEOwI
        O2/vI+oQBN6JNiD8DjeSXZCLKQ==
X-Google-Smtp-Source: ACHHUZ4+wH0IwnnWvjE8PFwigNlLEgCkL86MFl72DGZKSAmgYyYjdHySxJnwFZhE/T8iPGe8i43fDg==
X-Received: by 2002:a7b:cd13:0:b0:3f7:355f:cd9f with SMTP id f19-20020a7bcd13000000b003f7355fcd9fmr6634879wmj.12.1686560781032;
        Mon, 12 Jun 2023 02:06:21 -0700 (PDT)
Received: from linaro.org ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id m19-20020a7bcb93000000b003f7e75b053dsm10830553wmi.34.2023.06.12.02.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:06:20 -0700 (PDT)
Date:   Mon, 12 Jun 2023 12:06:18 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: imx8m: Add missing interrupt
 property
Message-ID: <ZIbgCk3DjnPLC2iY@linaro.org>
References: <20230510065644.1317577-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510065644.1317577-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-05-10 08:56:41, Alexander Stein wrote:
> All i.MX8M SoC have 2 CCM interrupts, called:
> * Interrupt Request 1
> * Interrupt Request 2
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> Admittedly despite listing them in the interrupt list, there is no
> further description.
> If it is deemed these IRQs are useless, the corresponding property in
> imx8mq.dtsi should be removed instead.
> 
>  Documentation/devicetree/bindings/clock/imx8m-clock.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> index 0dbc1433fede..80539f88bc27 100644
> --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> @@ -24,6 +24,9 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  interrupts:
> +    maxItems: 2
> +
>    clocks:
>      minItems: 6
>      maxItems: 7
> -- 
> 2.34.1
> 
