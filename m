Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 645FDC46CA1
	for <linux-clk@archiver.kernel.org>; Thu, 12 Oct 2023 11:24:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347161AbjJLLY0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Oct 2023 07:24:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347162AbjJLLYZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Oct 2023 07:24:25 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39D71E0
        for <linux-clk@vger.kernel.org>; Thu, 12 Oct 2023 04:24:23 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5a7d532da4bso10790187b3.2
        for <linux-clk@vger.kernel.org>; Thu, 12 Oct 2023 04:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697109862; x=1697714662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evuVw3Hi5rX09lLTvA3SZKrLQPpeaol5FfcaHKUVQ3A=;
        b=pC8qsOokKo5AbJkBrTwjJRBiT/rfEBNg5zwnSUHxXYyX8E9oqJfB51849zwB4E8OQP
         nIqncBces2P7P3UlGIySWzHiUnVa2XB7XV5D2Nh9S04oeqnfQzltsZj+Tc0ANIgadgg3
         zg3Oy8r4BI6cxZ5krRgUtvdzg3WNjpdZ5Xm1bQ/INGeKCZXnvrZBjPmsuWcIeh1HNH/C
         4AkqSDvtO6i8oow/yuDKeaEc2N2ydjrmRzuqx8UuqwcYM/heWiWZ9H4Y/g5Eg/9LLONe
         lLyPhNsWzpxpGf8m/1RyTayegn9aYGso5k2uq94upg+YAp/S/2W9Y2AsiZZ/ww6RE3Rr
         iJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697109862; x=1697714662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evuVw3Hi5rX09lLTvA3SZKrLQPpeaol5FfcaHKUVQ3A=;
        b=R8avIE2pJBf/gHc+bv8RLbSV2XojiWgaU5A5OxGHRaCSOSklYUxRHSLUSWH8l11FBK
         zH4uzIMsLRO3H8X0oUuLL2UEffaUKhVwKNQLtNEEYvrGDHoD2KVRSrmK5nBw7lk9ydQd
         0UvgRNoC760bNqRY6fDfspbpYT4ua/eLOTRzWw03tLC+zp0XJ7Cfumi2Z3mwjFeNBEFq
         hPrhlR9aNbQfeZsxqyrXJFbyeJwdzVzvog0725UiT6rSmh4MijD38iH+Y/TqEgiecs5d
         hNalHTagyjtdN8IvMN7Z4brynk0UjV2gp2zXG2ig6YBN7r09azpcW/4ZcHkCKptbg6Tu
         0+1Q==
X-Gm-Message-State: AOJu0YyXh5zon+ICSp5kYjy9o6usW4tFnz7zAfm6XjBoZn+mKCm3B1ZM
        XZ7np3kOAYy4ku60hQt54AIvAO9P75eXDf4/uaZX1g==
X-Google-Smtp-Source: AGHT+IEyd9tU65OM05MFMUmFMfOwvob54pQV19I0WfH9OarQjpgIdu1hzRGw1nnfN1MVfenUQvBfK98TGAMRRXEgjxQ=
X-Received: by 2002:a05:690c:3744:b0:5a7:d4a2:cd13 with SMTP id
 fw4-20020a05690c374400b005a7d4a2cd13mr6139438ywb.8.1697109862319; Thu, 12 Oct
 2023 04:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <20231010224928.2296997-8-peter.griffin@linaro.org> <CAPLW+4nO8kfUbQ6wJDjG_Ft0HAu_j3gAvcLLHU3BAHnALqaULA@mail.gmail.com>
In-Reply-To: <CAPLW+4nO8kfUbQ6wJDjG_Ft0HAu_j3gAvcLLHU3BAHnALqaULA@mail.gmail.com>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Thu, 12 Oct 2023 12:24:11 +0100
Message-ID: <CADrjBPr6GY3YQdADhJZ7RC65-mUdYQ=Pk4XbOQ4nwfZt3EYr=w@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] dt-bindings: pinctrl: samsung: add
 gs101-wakeup-eint compatible
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
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

On Thu, 12 Oct 2023 at 00:12, Sam Protsenko <semen.protsenko@linaro.org> wr=
ote:
>
> On Tue, Oct 10, 2023 at 5:49=E2=80=AFPM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > gs101 is similar to newer Exynos SoCs like Exynos850 and ExynosAutov9
> > where more than one pin controller can do external wake-up interrupt.
> > So add a dedicated compatible for it.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml      | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-=
wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,p=
inctrl-wakeup-interrupt.yaml
> > index 1de91a51234d..7cddce761c46 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-=
interrupt.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-=
interrupt.yaml
> > @@ -29,6 +29,7 @@ description: |
> >  properties:
> >    compatible:
> >      enum:
> > +      - google,gs101-wakeup-eint
> >        - samsung,s3c2410-wakeup-eint
> >        - samsung,s3c2412-wakeup-eint
> >        - samsung,s3c64xx-wakeup-eint
> > @@ -99,6 +100,7 @@ allOf:
> >              enum:
> >                - samsung,exynos850-wakeup-eint
> >                - samsung,exynosautov9-wakeup-eint
> > +              - google,gs101-wakeup-eint
>
> Maybe move it on top, to keep the list sorted alphabetically?

Will fix in v4
