Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0539C6FD18
	for <linux-clk@archiver.kernel.org>; Sun, 23 Apr 2023 21:33:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjDWVdv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 23 Apr 2023 17:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbjDWVdu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 23 Apr 2023 17:33:50 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 692FCE6D;
        Sun, 23 Apr 2023 14:33:46 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-94ed7e49541so526302066b.1;
        Sun, 23 Apr 2023 14:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1682285625; x=1684877625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNgSRwBj8Tr3DYpRrmwOO5V4JqGMnYOEx3J0F4U/rfw=;
        b=NiwoXQLnyJthnaPUT27lxaLr1gIpjrm/rnR+ItyLNAEKVtCG/5iqjkhlqSyAzfvN9v
         JPQT5nlts8g6hRegAIOT+KAlO57VfzEB15hI7ZK7Wl2LsxQ7Pl7J6Il5ePY4qoYyd0o3
         M1qr+szsPEQuRuPh1lERLyrR38c1IsoU2yCdhRuU3EsWmgZTf23coRxPNfuBsFI2qosp
         ZLEekB7CuJSErjfEj4yQwALgIho5rhVqMF06SsPofxc4Y4MqkB5OriDMPG/ThghQLNew
         nvyIxZjLorenVO6q5VlF5DTztTPVEKRgqt6E9eYdEbUJcYK6Spbs+EACqTMXJ7P1uxdq
         5kMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682285625; x=1684877625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KNgSRwBj8Tr3DYpRrmwOO5V4JqGMnYOEx3J0F4U/rfw=;
        b=HRiZPnO2G+0jOFTPNSU7WJ1okqWlmbeo9Mnn6YveW21ZeOLtwd2+sgtImLEDSShnwX
         kvfyOCJnyZ4R6YpHrmYG69xbrGfF/vOL1VOMjpYWs9XlpKupcgyO5gzncOUjcTfaCZuP
         eNWeCezHoZoPYw1kdb49tEzE0cp8sYzoJOaNVoskihtL1gdx0vGtrrPLg9usa6WJjWxd
         KazTRr9cQ/xx5mg0SlA/D9hJr8kRG8pmxdX6z+uXN+kJ+BAqwQjuznkgS+GjPa4ccK/H
         B15aPoHhb4ryN7US1K1FIWUQOxE4WEWyRURi+DekHIf502WcNvJRcY6XznTkcMg3ktOQ
         fc2w==
X-Gm-Message-State: AAQBX9c331xidAjnnCWELju7rsOFi9xBxyQtrXd0Uzq9zAzyAZG9EFro
        Hpdx6hETMhWNqDLiCLRApmaIaiByfjSQ4y4J+9Y=
X-Google-Smtp-Source: AKy350bZYEUBkC2DvaA+vOp7bq8BsQKFWmr2op371BzTw808Y9PCcEvGRAg2v/kDmw1DIIy+HbmDrx+hwEegsRm8N+8=
X-Received: by 2002:a17:907:2097:b0:94f:4b90:3057 with SMTP id
 pv23-20020a170907209700b0094f4b903057mr7670837ejb.55.1682285624558; Sun, 23
 Apr 2023 14:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230417065005.24967-1-yu.tu@amlogic.com>
In-Reply-To: <20230417065005.24967-1-yu.tu@amlogic.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sun, 23 Apr 2023 23:33:33 +0200
Message-ID: <CAFBinCCEK0T0fKTc4p2X2rwKD2gG4PN8kKom+YWj9Dk4iK+Scg@mail.gmail.com>
Subject: Re: [PATCH V7 0/4] Add S4 SoC PLL and Peripheral clock controller
To:     Yu Tu <yu.tu@amlogic.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        kelvin.zhang@amlogic.com, qi.duan@amlogic.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

On Mon, Apr 17, 2023 at 8:50=E2=80=AFAM Yu Tu <yu.tu@amlogic.com> wrote:
>
> 1. Add S4 SoC PLL and Peripheral clock controller dt-bindings.
> 2. Add PLL and Peripheral clock controller driver for S4 SOC.
>
> Yu Tu (4):
>   dt-bindings: clock: document Amlogic S4 SoC PLL clock controller
>   dt-bindings: clock: document Amlogic S4 SoC peripherals clock
>     controller
>   clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver
>   clk: meson: s4: add support for Amlogic S4 SoC peripheral clock
>     controller
>
> V6 -> V7: Change send patch series as well change format and clock flags
> suggested by Jerome. Change dt-bindings suggested by Krzysztof.
Jerome currently has very limited time so I'll be trying to continue
with the code-review.
Unfortunately I am running out of time for today, so please give me a
few more days to review your patches.


Thanks four your patience!
Best regards,
Martin
