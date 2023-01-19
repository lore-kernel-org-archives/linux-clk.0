Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD4EC004D4
	for <linux-clk@archiver.kernel.org>; Thu, 19 Jan 2023 11:20:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbjASLUF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Jan 2023 06:20:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbjASLT4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Jan 2023 06:19:56 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E94069228
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 03:19:54 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so3334732wma.1
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 03:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=2foPOEb90UyA/MJALqYP5FbUTQrze1RPaG+nVIqRt0I=;
        b=Ieu72sdcmYgGG3PlfHBUHxJl3gj5WnemeYAPms2q289TVEz15wrbeBvyW6Ieiz9sgU
         h6NIXPwaRQ16ix6KvIS02bHmZgstuFhggpao9Aa6KBtuJFC0kAaXc5pQN36Cax/QnUoK
         2PUvMD74UXn0x24Q/bOIWHIM2IHyTpLNp8qrYv+8USV+E9vZ1cvDNw8M2vPhnFxYlB/E
         nQGXh9EzF5wVMNFlQWPdVWg4sKPcEWZy0+O9n64a2FNqFC+EFvSJGFnH2kPerxUQyw3C
         5tUbad55722X1YpjyDPLvn6IUptP64Cdnc4moxTUJJ8qfmS+SZFyu02BgslurtJhOrs5
         0VWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2foPOEb90UyA/MJALqYP5FbUTQrze1RPaG+nVIqRt0I=;
        b=ErwBANlInBYcUrpFbYuhcGPV/WDtJoIx3MCPul8LOaKa/+GjJNsk95oCryrEgTZypl
         mcPJ5tsqv4ykRYAnkrFcQRMBS2CF9DGH0XaHRBwqTZPfFCYHak1pHMnBZSmphj1lZXFa
         PzoazKVuP0OiOQFbY98+hVF9n9PTKIY96QZNuJCoCUkm4zES8gqQRrUQi0ePc0INABd/
         BJDXuM3VuTMybQ5zMpMXPtHstuAkp+XUauckmvxhDd4Y9r851wkt50AgekG5Ss42FAjH
         ySV4MMkUE2cE9euQAeSMeTDacA38Y2t7Dic7IUxL9nAvrxkCa1YpyLQmIJyfe1JsFDpD
         6Dzg==
X-Gm-Message-State: AFqh2kofv5opkCLOLXOGpMEdFA9yVc9fZQzR5DoAf/QB7iEkPzjFFU4N
        d7COKeOXo4jmtDK8zUbbOLp71Q==
X-Google-Smtp-Source: AMrXdXvNO3Z4PWh6/DvCNgXXqNwnt7jnRnqMnqd9gIR5iYvzRWp6qf4higUbmzz63oEaUcdAIP4haQ==
X-Received: by 2002:a1c:750e:0:b0:3da:fcf6:7146 with SMTP id o14-20020a1c750e000000b003dafcf67146mr9912297wmc.14.1674127193017;
        Thu, 19 Jan 2023 03:19:53 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id l27-20020a05600c2cdb00b003d99da8d30asm4909913wmc.46.2023.01.19.03.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 03:19:52 -0800 (PST)
References: <20230116074214.2326-1-yu.tu@amlogic.com>
User-agent: mu4e 1.8.10; emacs 28.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     "kelvin . zhang" <Kelvin.Zhang@amlogic.com>,
        "qi . duan" <qi.duan@amlogic.com>
Subject: Re: [PATCH V6 0/3] Add S4 SoC PLL and Peripheral clock controller
Date:   Thu, 19 Jan 2023 12:18:30 +0100
In-reply-to: <20230116074214.2326-1-yu.tu@amlogic.com>
Message-ID: <1jilh2ydns.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon 16 Jan 2023 at 15:42, Yu Tu <yu.tu@amlogic.com> wrote:

> 1. Add S4 SoC PLL and Peripheral clock controller dt-bindings.
> 2. Add PLL and Peripheral clock controller driver for S4 SOC.
>
> Yu Tu (3):
>   dt-bindings: clock: document Amlogic S4 SoC PLL & peripheral clock
>     controller
>   clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver
>   clk: meson: s4: add support for Amlogic S4 SoC peripheral clock
>     controller

You are adding 2 controller driver with this series.
Making 2 driver patches on clk/ is good. Please do the same for the bindings

>
> V5 -> V6: Change send patch series, as well change format and clock flags.
> V4 -> V5: change format and clock flags and adjust the patch series as suggested
> by Jerome.
> V3 -> V4: change format and clock flags.
> V2 -> V3: Use two clock controller.
> V1 -> V2: Change format as discussed in the email.
>
> Link:https://lore.kernel.org/all/20221123021346.18136-1-yu.tu@amlogic.com/
>
>  .../clock/amlogic,s4-peripherals-clkc.yaml    |  104 +
>  .../bindings/clock/amlogic,s4-pll-clkc.yaml   |   50 +
>  MAINTAINERS                                   |    1 +
>  drivers/clk/meson/Kconfig                     |   25 +
>  drivers/clk/meson/Makefile                    |    2 +
>  drivers/clk/meson/s4-peripherals.c            | 3874 +++++++++++++++++
>  drivers/clk/meson/s4-peripherals.h            |  218 +
>  drivers/clk/meson/s4-pll.c                    |  875 ++++
>  drivers/clk/meson/s4-pll.h                    |   88 +
>  .../clock/amlogic,s4-peripherals-clkc.h       |  131 +
>  .../dt-bindings/clock/amlogic,s4-pll-clkc.h   |   30 +
>  11 files changed, 5398 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>  create mode 100644 drivers/clk/meson/s4-peripherals.c
>  create mode 100644 drivers/clk/meson/s4-peripherals.h
>  create mode 100644 drivers/clk/meson/s4-pll.c
>  create mode 100644 drivers/clk/meson/s4-pll.h
>  create mode 100644 include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>  create mode 100644 include/dt-bindings/clock/amlogic,s4-pll-clkc.h
>
>
> base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2

