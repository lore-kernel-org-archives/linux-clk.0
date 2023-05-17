Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AE5C77B75
	for <linux-clk@archiver.kernel.org>; Wed, 17 May 2023 14:15:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231865AbjEQOPO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 May 2023 10:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbjEQOPN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 May 2023 10:15:13 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121A9B3
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 07:15:12 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-50bcb229adaso1548381a12.2
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 07:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684332910; x=1686924910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/+DuntF1kGSXfgTxfrwPEsnEtPGyOGiybO9J9yV6hV0=;
        b=YxUXwUSa0MMpWwhVQIBaoMd8+vylj9fXfs7ShwJcW6Kl2dtdhvV/pN0TrPd5bkkks/
         onhgkjcHPY46PLE81aFVxJiX70EdS//f0qLGRpSUos28sXuIUkqPC9kYPtFEqNUcxTUH
         yo3amUqDEONRtPpOPym2tzBqKTnlNdAGSjRGdWINna3F8R2cLvPFl50ll/+wJHuNbiyh
         sxVWEJJiQasi12jgS6qmoi/j1rBYrQ7Id5U19h4b/U+2IYvQ+fV5ECE/Slb8WniYV0RT
         7+X90cStc2kX+BZ4kZhX8ycl9HaC4hOTJYhA9Pfqvfi0PGk+rz+tlFFTv5esV4ar1E/2
         L8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684332910; x=1686924910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+DuntF1kGSXfgTxfrwPEsnEtPGyOGiybO9J9yV6hV0=;
        b=QXh3kxnWrCEsOrm2JJfv6Qx1EJgdwH7lcmm5Vh7TTyDD6YPXnJV85Ev6X8UaJb2rbS
         /7oVL+VVUebY4KilH63Qci/J6Q0UPE2C6kDXczvVA1CBRcGSW3newOK/paEWrQdQXxNk
         cHRs1AW7U/CmhIynHgIsY5jCrZUPKl0KgpQ4WJZXlTMD25OnSDuxrX+V4Oik5+O2/5oy
         xnmnp2ljtBpTWfZil1IJmfeZcyCv2EF5IfWeYZIzARjq9ken64JppXPwS5NcLSVuJ3Zh
         cb2PhrLpPRQjP1HulpEz+kchrMvKsnWjEjZtKnVEdlEYp/k8I9pzmuZhabVyC+TicQUY
         Z/0g==
X-Gm-Message-State: AC+VfDxFrQGRD1QpHi04sX3HiYmFcXmEK3oBWZvGiKasVetl5cUHsQ79
        kzHaAyMcqKzhEcMqSRDcK2/fFw==
X-Google-Smtp-Source: ACHHUZ7v/hjsisoRpms2YFKoT5XjALbav8o1TqyOjf5UQjXZuLtCWsQxiH1ClSgL5DX4UEhoJuJBaQ==
X-Received: by 2002:a17:906:5d06:b0:96a:bf50:3ad9 with SMTP id g6-20020a1709065d0600b0096abf503ad9mr17295497ejt.43.1684332910462;
        Wed, 17 May 2023 07:15:10 -0700 (PDT)
Received: from krzk-bin ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id 30-20020a17090601de00b009662d0e637esm12340013ejj.155.2023.05.17.07.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 07:15:10 -0700 (PDT)
Date:   Wed, 17 May 2023 16:15:08 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     robh+dt@kernel.org, alexandre.belloni@bootlin.com,
        linux-kernel@vger.kernel.org, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        nicolas.ferre@microchip.com, krzysztof.kozlowski+dt@linaro.org,
        conor.dooley@microchip.com, mturquette@baylibre.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 5/5] dt-bindings: clocks: at91sam9x5-sckc: convert to
 yaml
Message-ID: <20230517141508.evb6jg5bcpjzhqve@krzk-bin>
References: <20230517094119.2894220-1-claudiu.beznea@microchip.com>
 <20230517094119.2894220-6-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230517094119.2894220-6-claudiu.beznea@microchip.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 17 May 2023 12:41:19 +0300, Claudiu Beznea wrote:
> Convert Atmel slow clock controller documentation to yaml.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/clock/at91-clock.txt  | 30 --------
>  .../bindings/clock/atmel,at91sam9x5-sckc.yaml | 70 +++++++++++++++++++
>  2 files changed, 70 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/at91-clock.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/atmel,at91sam9x5-sckc.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1782586


sckc@fffffe50: '#clock-cells' is a required property
	arch/arm/boot/dts/at91sam9n12ek.dtb

sckc@fffffe50: 'clocks' is a required property
	arch/arm/boot/dts/at91sam9n12ek.dtb

sckc@fffffe50: 'slck', 'slow_osc', 'slow_rc_osc' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/at91sam9n12ek.dtb
