Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22763CD68E3
	for <linux-clk@archiver.kernel.org>; Wed, 11 Oct 2023 08:16:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbjJKIQo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Oct 2023 04:16:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbjJKIQn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Oct 2023 04:16:43 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75C70B8
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 01:16:40 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-66cef33a4bdso9835406d6.1
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 01:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697012199; x=1697616999; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nA0RDDaTkiz/7JWtA8mSntXcdVkGEnyXDFoq63BjRlY=;
        b=xl8Go/6yojwnAlAX/9Y6ZEG3orREXWGbRUwpZPFNBqMyv7+E9gYYFpTqJvQbokYEG8
         mx9jPMhbcdZKuVCIXKYR2B7/0UoxrvSQb0Kndcwv5Scrd0lzhYIlpKH9BLDeRGXmo8RC
         MSGJZJ20Ohu7A4jy6JuZKSpgNe0oihcy1jgLyzBeAYKnihl9GzfzJfVrMxMQJrJm1zHy
         TZ7NoxjwHh+6UgQNr9Jc+GxunvO0Vhtneql7YrT5NlkmKL2H7Jo7hGeOlrxXKBIiQyvy
         q7KtpPOg2DcBQYC1silkk3dmQgLFldWfUGA2LJTuQUEcBC9RckC+LIKw7oGVm3kpjFqh
         vhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697012199; x=1697616999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nA0RDDaTkiz/7JWtA8mSntXcdVkGEnyXDFoq63BjRlY=;
        b=QTmjTuK4n7pa7x29puBTrU2bgBfQQnt3YUPGLjn5UKJIfryYmo7Hd5tLGelNxmOPGn
         obH6eO5StbVGtsMbJwP4HmxeWAWQ4Rn2hTS8grGlWssIM01mZu1BhlRnRH578l2Q5x4Z
         5K2I8iHCo2oH0Q7jL++8/yFKtEFkj/Ge6Ha8vkXfnBBfldGULwJauz0RtkSau22PawBF
         D37nRx5QbVEAir/NeIvr/r+DS2dHs0MePD630vp2ovXvk8BOlT6W8iRPpHElWNX+SOHH
         HgRTIAVPqRftQI27NDWh4qUv8hNI2X0JhT1B3co1pH2aYT9ki4O2s9UDFYPzgtZ4aLDs
         K1HQ==
X-Gm-Message-State: AOJu0YzRBv+NpvVrLrT6LVBa2pluUc1h9nNNj73d+LCfAYXNpicynPTd
        sS3L8kaBW2I1mJq1NJ9Oh26JekAD6uzwYoeCDX7m1Q==
X-Google-Smtp-Source: AGHT+IG+0ROOZO1mYXDe5AanejoBg3TXGpWOGx8a61SnY82+auoDhpY/ZD9spxpXsT1DrFa9tocnRlQSlCFjBmjz/zI=
X-Received: by 2002:a0c:aa9a:0:b0:65b:771:f2ea with SMTP id
 f26-20020a0caa9a000000b0065b0771f2eamr15590074qvb.53.1697012199437; Wed, 11
 Oct 2023 01:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231010224928.2296997-1-peter.griffin@linaro.org> <92de302a-f6b5-465c-a5da-2a711861089e@linaro.org>
In-Reply-To: <92de302a-f6b5-465c-a5da-2a711861089e@linaro.org>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Wed, 11 Oct 2023 09:16:27 +0100
Message-ID: <CADrjBPqOmGEzeVEKiysxQNo9+B0=zD3Z+G24fPDKrFsgUXYJjQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
To:     Tudor Ambarus <tudor.ambarus@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Tudor,

Thanks for your reply.

On Wed, 11 Oct 2023 at 07:10, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Hi, Peter,
>
> On 10/10/23 23:49, Peter Griffin wrote:
> > Note 3: In `dt-bindings: pinctrl: samsung: add google,gs101-pinctrl
> > compatible` I tried to narrow the interrupts check to
> > google,gs101-pinctrl but I still see a warning: gs101-oriole.dtb:
> > pinctrl@174d0000: interrupts: [[0, 0, 4],[..] is too long If anyone can
> > educate me on what I've done wrong here it would be most appreciated!
>
> I guess the initial definition of the number of interrupts should
> include the largest min/maxItems. I no longer see the warning with this
> change:

Yes that is how it was in v1. The review feedback though was to narrow
the scope to just google,gs101-pinctrl compatible using if: then: else: which
is what I can't get to work properly.

regards,

Peter.


>
> diff --git
> a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> index 2464bc43aacb..6dc648490668 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> @@ -59,7 +59,8 @@ properties:
>    interrupts:
>      description:
>        Required for GPIO banks supporting external GPIO interrupts.
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 50
>
>    power-domains:
>      maxItems: 1
