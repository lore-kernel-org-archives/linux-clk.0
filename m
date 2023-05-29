Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C43C7EE23
	for <linux-clk@archiver.kernel.org>; Mon, 29 May 2023 20:20:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjE2UUO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 May 2023 16:20:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjE2UUN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 May 2023 16:20:13 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20EFDB7;
        Mon, 29 May 2023 13:20:12 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-514924ca903so3625347a12.2;
        Mon, 29 May 2023 13:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1685391610; x=1687983610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaBaGYCNxPZhOfoDjvgva3si6aUdokMc6Gw8fHEKHuE=;
        b=KfiVQLPJLi42XivH0/2I8b8IaA4agFdHz0r3rtjNs1W6EuPkAsmXg7WOKbVeJPCPgT
         BbK0uX3pJnS3Pv7eVitih7ohKpQyGAZpvzh0Lq5PlbePkTBxQ7ICu32LIfc5yMmVVeHF
         tc/kOgBTSJ1v8YHX3QYrTPPJ0SuGiCm2OPzXsaHvX8FN05aWy9lyslWGWQeB46GmUq86
         1MPdU6XyMhjIOyuN264W/iP03wRp9m2gWqR0AiR1NLka9qoFT/MXtB34mXzIka1VcT9i
         sEAaNpRH+Q3+D8ouWrS0kEQp6mE0jIQ8Wjmum7s1UuODLmWVEMhJaqTugd+qtHHa2Q5v
         G7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685391610; x=1687983610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UaBaGYCNxPZhOfoDjvgva3si6aUdokMc6Gw8fHEKHuE=;
        b=W/ToIMKn40XYi2vU8tTIyoJfZNiry9mlsbNlSSXJT1XzZlVxpSF/NRSgO+DNRoMNjQ
         WDObIeTc8SFUUWnz5uqGrBJ1xTE4F1Phe9Uh67P137RzCzC8FRyzqJRyRk5OqJIeiTxA
         kSU7QcfGLlfqFgGfESojjiKHZMFREqlpwqSj+F9o+AB2Ti7DaOJy5MPy9vjNNQcXbK6h
         UG43IPd+U9GrFubvhMQO249jIa4Jd9YDV1uv8V4amWtNBiMikXfsKvvDPsdzKbI1Dnf7
         Z7eZOP4FjcMAro8mLOFMqio/2teRQxutAqHikBoeuXnMejn/tflgbuKdqk8cty0lo2LE
         R3sw==
X-Gm-Message-State: AC+VfDxnMwuHHQV/xI84pjZZLMTjKRoTQn86advsY+taXeIhOt0CumGu
        WNSQqcx1dBhB0F1BUSk+sVpjSmuyLvyU1DqH6y8=
X-Google-Smtp-Source: ACHHUZ7rEdsB1abIjXBwnJgb2QaZ3rA+DNo7mrBeOxfo1iuRO9GdPORptUnmUP9H+tnsnEMOzr4noDOfQ+3s5zbIE2Q=
X-Received: by 2002:a17:907:9813:b0:965:6cb9:b768 with SMTP id
 ji19-20020a170907981300b009656cb9b768mr250326ejc.31.1685391610344; Mon, 29
 May 2023 13:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230523135351.19133-1-ddrokosov@sberdevices.ru> <20230523135351.19133-7-ddrokosov@sberdevices.ru>
In-Reply-To: <20230523135351.19133-7-ddrokosov@sberdevices.ru>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 29 May 2023 22:19:59 +0200
Message-ID: <CAFBinCA35XC5mo+t-RV+yBA2XzAiVXPR_gX3jO25HA=V5XgnOw@mail.gmail.com>
Subject: Re: [PATCH v16 6/6] clk: meson: a1: add Amlogic A1 Peripherals clock
 controller driver
To:     Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc:     neil.armstrong@linaro.org, jbrunet@baylibre.com,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
        jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, May 23, 2023 at 3:54=E2=80=AFPM Dmitry Rokosov <ddrokosov@sberdevic=
es.ru> wrote:
>
> Introduce Peripherals clock controller for Amlogic A1 SoC family.
>
> A1 SoC has four clock controllers on the board: PLL, Peripherals, CPU,
> and Audio.
> This patchset adds support for Amlogic A1 Peripherals clock driver and
> allows to generate clocks for all A1 SoC peripheral IPs.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
