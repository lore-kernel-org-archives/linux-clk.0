Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65DD9EB64DC
	for <linux-clk@archiver.kernel.org>; Wed, 28 Jun 2023 20:52:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231439AbjF1Uv7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Jun 2023 16:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231609AbjF1Uv5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Jun 2023 16:51:57 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0DDE194;
        Wed, 28 Jun 2023 13:51:56 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-98377c5d53eso29990766b.0;
        Wed, 28 Jun 2023 13:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687985515; x=1690577515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H09su0JFKNP1Fr2cMqvDj35F61R1G5GRKDatbkayncI=;
        b=HhKl0a8N+ZKyZOg/yyWu2wih6yNx8S4yuWQkB7m/pi8Ms3UVGXqwsDDq/4qptTm4XC
         0Gt3AhtG2RA86n76l7v7J+F2Mzif/vKYYlQS6xNQl2VX2Uyq8JK1MtzB97bXsy7nRH0/
         4WVbQ4GN90ugYr/aWRQEyaugh/RBNdkGj5dvj/zrDTr5La8pf1mWzUyH5MbvcrNXMjGY
         xPbk019pAtqGRKJ0H7SGKlPeXDYyt58gVsXvmNqMRyK1OP6DeUULsKKb/9A/a5nb8ovK
         +ANHBtNdS4FRxFomULwxZKkHyeNXhE/S+SvQAcISQs036hJGYhQwy5d7zz2wGWKWDswx
         Dk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687985515; x=1690577515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H09su0JFKNP1Fr2cMqvDj35F61R1G5GRKDatbkayncI=;
        b=FWjJLpd/Sj0apHjCY1KEr92uH4HaAtcIIW7Ifi/Oz8RGNw4ihe7vENobxnBRlDwsW8
         u7RHtQjGw4y8XcPWAIu9v1+rI2VXLC/t5TYO5NZZfUJ79CMwVvd9zRECDxl5PU3CLSDt
         pdM8kSEy57PnL1hN0MU8rSsTZM23UZZJqgSrVddpSoZBPlpRTcEnubO4zd5VJqzCeK0L
         bQw0kE0kjh2pNFaHajZlthKrcrL/VhbeSm8b+pTd4pDIF77GLedMoXXUu5EeZ5MLUp6o
         oS3nxG3J/I0rGZRUAd4Sqx19QQbJ3M7MQnmX3pJbaJ9zwtvOnSOaLb9gN9zYFXcX7kv8
         85DQ==
X-Gm-Message-State: AC+VfDzapoZAp1sai3g9dqcJQpQwNEy2dlia2GR6BWOzwgKoI+2ZaXuh
        vDeraoc7ICjcDJqpdZq2P5y8vNGJGYZM3SEI0OxnFPfo
X-Google-Smtp-Source: ACHHUZ6ZHBQJxCh+FwiIqR9kqXjpG7Tcm/91+2ol36od0qJFABIuiBJMSCabSpWrShyknE0rzh7IBfR2eiQrWsFTbLE=
X-Received: by 2002:a17:906:d542:b0:977:95f4:5cca with SMTP id
 cr2-20020a170906d54200b0097795f45ccamr29993727ejc.54.1687985514876; Wed, 28
 Jun 2023 13:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
 <20230607201641.20982-2-ddrokosov@sberdevices.ru> <CAFBinCAO14zcgY66UyJO9UxuCWf1N-Lsx=iYNTJL=cwXoJv__Q@mail.gmail.com>
 <20230628141839.ea7qzotr5un6f2ij@CAB-WSD-L081021>
In-Reply-To: <20230628141839.ea7qzotr5un6f2ij@CAB-WSD-L081021>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Wed, 28 Jun 2023 22:51:43 +0200
Message-ID: <CAFBinCBzmYQu-+1A8MxZ+r551Jeym29fg9ErZJkftTEdL2b=-A@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] arm64: dts: meson: a1: introduce PLL and
 Peripherals clk controllers
To:     Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc:     neil.armstrong@linaro.org, jbrunet@baylibre.com,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
        conor+dt@kernel.org, kernel@sberdevices.ru,
        sdfw_system_team@sberdevices.ru, rockosov@gmail.com,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jun 28, 2023 at 4:18=E2=80=AFPM Dmitry Rokosov <ddrokosov@sberdevic=
es.ru> wrote:
[...]
> >
> > >                         gpio_intc: interrupt-controller@0440 {
> > note to self: at some point we'll have to re-order &gpio_intc, but
> > that's out of scope for this patch
>
> I have noticed that the 'meson-a1.dtsi' file contains unsorted items. As
> part of the current patch series, I can re-order them to improve the dt
> structure.
That would be awesome!
