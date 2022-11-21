Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF13C43217
	for <linux-clk@archiver.kernel.org>; Mon, 21 Nov 2022 15:56:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbiKUP4q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Nov 2022 10:56:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiKUP4p (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 10:56:45 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 879ACCFA4C
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 07:56:44 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id s5so3304325wru.1
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 07:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gLrf8pFJ9/J1g/QK7YuMf2dUfUQFHFeJtN0xM6Gmens=;
        b=VRBo5if4qzUXy/nhsK1D1Oq2zKGwOyy5TDu2nDtfpjlbVfbaxiBAIoerx5kpb/OMEf
         gWP2AFT6DnGdDFeOb8rH8x3ZckTtvsRMwnhVlpJBp+0DWgvnjvPrQLLBQOxwvBEtDbU/
         Hx341mVq1KdMwMd3SQC/ygleTS5kiPbJNwNu9qwL8fVXepBjn2nAxd9CmZo3+GFr3pRU
         0lXGJK7fi7+SCwn4359CIvYcK4ILRRDU9qtP0dmrxJIEc7GW4BPXByM03LPt0yVh8cw7
         T3paaVleYcAwwUFrr5Jrra1jXX/scBFOefzRZUcGxYVxMRmv5v4Ran7jj98sOWvH3NoT
         l5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLrf8pFJ9/J1g/QK7YuMf2dUfUQFHFeJtN0xM6Gmens=;
        b=V9eAVoo/LmfunBGn2ieVat+Y6/Zt6LnA1L23OHC1fLEzaFW2XBSOSkS7x6oCqi4J2h
         1PmuyuF1CMsKA3WE3qxUgzf1ZMaiDZ2s7Ac/yIUk6k0Jwk+QoCvPV3UcxiB66hwjt7DI
         TUaw/Vr9VY6YBdNoLCK5r/OTdQigFT0V4sI9JyaTGW6p3dTZeBWOhplIqVu+TwdJyHvA
         FEK9F17ZyBY1aGP3YOxu/WVXaxFC+fgz40W9pwnBdTrrUVF08zKkIJNmy6IFEqjGnXNv
         926f/e4LP7+4GgVOKPJsnm3v2MGhuxd/lE2auMuWV7J/2ktIRnGUJpzGeaVIIDssHkSS
         qR9g==
X-Gm-Message-State: ANoB5pmOtzQjqowSY4Cy+6L86Ue+VRQTu5c2/as4upIEzrxMDk+KqBME
        ifZZ3+R6+P41nqJ0W8Lc2jht+w==
X-Google-Smtp-Source: AA0mqf4etBn+a6CY5wJ1uQSVF+zfA6vnlLMaBDO/4ZIhKQv1RISNEa+A5jCKfNfLjUK7jUwFiqyU7A==
X-Received: by 2002:a05:6000:61a:b0:236:8a38:66f1 with SMTP id bn26-20020a056000061a00b002368a3866f1mr11539965wrb.327.1669046203048;
        Mon, 21 Nov 2022 07:56:43 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id g18-20020a5d46d2000000b00236722ebe66sm11475360wrs.75.2022.11.21.07.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 07:56:42 -0800 (PST)
Date:   Mon, 21 Nov 2022 17:56:40 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     sboyd@kernel.org, abelvesa@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, mturquette@baylibre.com, l.stach@pengutronix.de,
        peng.fan@nxp.com, alexander.stein@ew.tq-group.com,
        gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: clocks: imx8mp: Add ID for usb
 suspend clock
Message-ID: <Y3ufuH1UAT+rsjl7@linaro.org>
References: <1664549663-20364-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1664549663-20364-1-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-09-30 22:54:21, Li Jun wrote:
> usb suspend clock has a gate shared with usb_root_clk.
> 
> Fixes: 9c140d9926761 ("clk: imx: Add support for i.MX8MP clock driver")
> Cc: stable@vger.kernel.org # v5.19+
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Li Jun <jun.li@nxp.com>

Applied all. Thanks.

> ---
>  include/dt-bindings/clock/imx8mp-clock.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
> index 9d5cc2ddde89..1417b7b1b7df 100644
> --- a/include/dt-bindings/clock/imx8mp-clock.h
> +++ b/include/dt-bindings/clock/imx8mp-clock.h
> @@ -324,8 +324,9 @@
>  #define IMX8MP_CLK_CLKOUT2_SEL			317
>  #define IMX8MP_CLK_CLKOUT2_DIV			318
>  #define IMX8MP_CLK_CLKOUT2			319
> +#define IMX8MP_CLK_USB_SUSP			320
>  
> -#define IMX8MP_CLK_END				320
> +#define IMX8MP_CLK_END				321
>  
>  #define IMX8MP_CLK_AUDIOMIX_SAI1_IPG		0
>  #define IMX8MP_CLK_AUDIOMIX_SAI1_MCLK1		1
> -- 
> 2.34.1
> 
