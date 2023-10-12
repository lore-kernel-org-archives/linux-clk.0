Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AABF0CDB46E
	for <linux-clk@archiver.kernel.org>; Thu, 12 Oct 2023 10:57:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235675AbjJLK5K (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Oct 2023 06:57:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235674AbjJLK5K (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Oct 2023 06:57:10 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D04B8
        for <linux-clk@vger.kernel.org>; Thu, 12 Oct 2023 03:57:08 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d9a4c0d89f7so869675276.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Oct 2023 03:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697108228; x=1697713028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXsH2wAbuu1LZ+xVuXFZUVdPOgCW2cpv03v3rr+MUKM=;
        b=HOM19ZedhaIEcq8oEbdJIjEKhWK8hLoy9tDKgnFBrrADp3LL9OO/pnIvaxGaGVbfHp
         ukltIpyLtM1V6X0x1UmtMGjWBRC+oGP2w8NMhxoC1S+8KnGzaZRHikSlBDMdDrWy3mBv
         faDsYYbutNkewVwQimrQZ8muEUUYovbv1NZtNmKS54J4JGbvHxIF3o5OD3u8gv5vEdth
         y0Yu2QxGYzcKEpAMqFjuWPB1HengGo1KU5GLw62NT60ZKTd3gJhuJ2aemT+L/QNSE2L/
         +/H61H8hM7KXeCPZhO9slcADzaFm6nFz4N6HiVzdlGM8F91uQaTEf0hgZbti5MGGyIJL
         DjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697108228; x=1697713028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXsH2wAbuu1LZ+xVuXFZUVdPOgCW2cpv03v3rr+MUKM=;
        b=Xk/qmSsw/drdQYB2fKtxHLs/xcm0fqnqyIjBJ9g6oiDKb8ASoNcHngn5SkXC7zEWTw
         smgHpTJgE64G+52gc7n6DQe5oUfqD58zdhxdfLS/yWGlJZGH7S8lumH160CGugAZppmy
         QmdZ1bqoMABl7tc4dOAZs3jmU4cvAWkCXs8oKJtO4zkBY0FXdviECbx3j1RhH+An9fEA
         tbAatQ7twlszX7u74AUCFWp4RRHJ335UFVckBCnU8pnDU+lG8/h5wuaKBoOicYUGj9LG
         Vw/SpRFTwtxIhanal1HWnANtADw0keL5PXnJhVvqiGzepNmgbKklk2xTZ1dtPqgyTC+0
         CkWQ==
X-Gm-Message-State: AOJu0YxrF6F/oIE4cg9dWcZuOk27J1IwAELBWxnHOrMg4nIjRw7jr14J
        QuiOj6k57mp8ZtGX5utY3OrTByqcXPnjdjyHvcSKkg==
X-Google-Smtp-Source: AGHT+IHoONc3hJii7RYcVkxb1UvFrk39Aq1j5ObRTTPqLaWzUuSZjNk8uWTkxQSzrzNgSo8ZjFPFsI+716xNwL6U+X0=
X-Received: by 2002:a25:d48:0:b0:d9a:4e29:6354 with SMTP id
 69-20020a250d48000000b00d9a4e296354mr8267648ybn.39.1697108228053; Thu, 12 Oct
 2023 03:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-5-peter.griffin@linaro.org> <CAPLW+4m4zUFfRWMo+KC1ymGAgHtbLxyx6L99Qd0vJYQXmmCvbw@mail.gmail.com>
In-Reply-To: <CAPLW+4m4zUFfRWMo+KC1ymGAgHtbLxyx6L99Qd0vJYQXmmCvbw@mail.gmail.com>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Thu, 12 Oct 2023 11:56:56 +0100
Message-ID: <CADrjBPpgPKO49Ndtu=L30iqidpfZO8hUZKQrorZGzsb7tztDhg@mail.gmail.com>
Subject: Re: [PATCH v3 04/20] dt-bindings: watchdog: Document Google gs101 &
 gs201 watchdog bindings
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Sam,

Thanks for the review.

On Wed, 11 Oct 2023 at 23:58, Sam Protsenko <semen.protsenko@linaro.org> wr=
ote:
>
> On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > Add the "google,gs101-wdt" and "google,gs201-wdt" compatibles to the
> > dt-schema documentation.
> >
> > gs101 SoC has two CPU clusters and each cluster has its own dedicated
> > watchdog timer (similar to exynos850 and exynosautov9 SoCs).
> >
> > These WDT instances are controlled using different bits in PMU
> > registers.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../devicetree/bindings/watchdog/samsung-wdt.yaml      | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yam=
l b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > index 8fb6656ba0c2..67c8767f0499 100644
> > --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > @@ -17,6 +17,8 @@ description: |+
> >  properties:
> >    compatible:
> >      enum:
> > +      - google,gs101-wdt                      # for Google gs101
> > +      - google,gs201-wdt                      # for Google gs201
> >        - samsung,s3c2410-wdt                   # for S3C2410
> >        - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 a=
nd Exynos4
> >        - samsung,exynos5250-wdt                # for Exynos5250
> > @@ -42,13 +44,13 @@ properties:
> >    samsung,cluster-index:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >      description:
> > -      Index of CPU cluster on which watchdog is running (in case of Ex=
ynos850)
> > +      Index of CPU cluster on which watchdog is running (in case of Ex=
ynos850 or Google gsx01)
>
> Please stick to 80 characters per line when possible.

Will fix in v4.

Peter
