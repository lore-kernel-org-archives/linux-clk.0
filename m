Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9732AC433B4
	for <linux-clk@archiver.kernel.org>; Tue, 18 May 2021 20:21:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D826610E9
	for <linux-clk@archiver.kernel.org>; Tue, 18 May 2021 20:21:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236208AbhERUW2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 May 2021 16:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236196AbhERUW2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 May 2021 16:22:28 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 779B9C061573;
        Tue, 18 May 2021 13:21:09 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id n2so16558548ejy.7;
        Tue, 18 May 2021 13:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DVNv5/TDmW8eM40E1W+6CajDOqer3LA7KeZK68HD9Zs=;
        b=JwZWuXuCe98MYT7W12V96e3b9dep79J9PWj4LM1kbhWhl2+dQdFvEBqO7vVCgH/zmd
         bbBdLLKAFhxgtHYT0wU+RUdWvDlnARir3FUtsdIVLStHZFtDq7nCJVWfSfB86APhvu1O
         ONx6f1F1ToiX5fNUpJhuI8CwPzYd0OXMuvEOwxDGBBA+t22b+bprk8Es+Eub55S1f5lE
         dok3qBiZS8sDbmSgswdCGxq6L+rJKZC5pjI1+brMAbg8nToe+TQYOn4RdEJ/kD561E4K
         n2qZj++K1Z7WclksBofNU5+jcFYzzIqO6rhBFSZWtv3rypEDac6vbBw+X4QelFjWBZ5Q
         XMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DVNv5/TDmW8eM40E1W+6CajDOqer3LA7KeZK68HD9Zs=;
        b=GL/O6oBCT80gURAk3F5GdQ73vesDIATgl7/jYs/MfsfXgJtb2FKCbnIRn/Q1GLmGiJ
         jMYJFcTIkZupu8+FUZDxYAD2QlPpzl36/ewdThrgJpdoVnHF51vntUnjuM3hnA6T/er5
         ONaGzkPdTrXPQzluvChZlrsiBJ4DcW/6sZnZcnbVJEEHsHmUZWskdutslC1OF41w434c
         MiH2VfCB5roz2bJMiN3E+0aNA6fRjcWmHyHpm+LhM8N1vl2NMFUke4x8EwL5jZu+ZJ/i
         obz1ePF1R2wMqeQDAJw40BgQu5yryrr1LJ28CDH9+DHbEQI2vWO0s15VQ8Cv1LxjvzV3
         0diA==
X-Gm-Message-State: AOAM530zywoxgQNvljqkAAesyAx25vvCy5uTkhwiRmstaczKDXQqG/Lq
        LisAMEFp2CWA+0ogYUulK5iddAd4fJeNWkj0RiE=
X-Google-Smtp-Source: ABdhPJy2AsTEVS+ozAIFEFGVHQL0XNARwMZwotEQDopeDSzuLKKsBAyTLvSfx6+POAaeZiVm0mr8VeVo42xbAy/nVAw=
X-Received: by 2002:a17:906:fcb4:: with SMTP id qw20mr7996726ejb.216.1621369268217;
 Tue, 18 May 2021 13:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210517203724.1006254-1-martin.blumenstingl@googlemail.com> <1jwnrw1ohh.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jwnrw1ohh.fsf@starbuckisacylon.baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Tue, 18 May 2021 22:20:57 +0200
Message-ID: <CAFBinCCnEXNLL0rvi1XNYKb0xY1+3KMwB=xz24kPgN2H97yzOg@mail.gmail.com>
Subject: Re: [PATCH RFC v1 0/3] clk: meson: rounding for fast clocks on 32-bit SoCs
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, khilman@baylibre.com,
        linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Jerome,

On Tue, May 18, 2021 at 9:37 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Mon 17 May 2021 at 22:37, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
> > On the 32-bit Amlogic Meson8/8b/8m2 SoCs we run into a problem with the
> > fast HDMI PLL and it's OD (post-dividers). This clock tree can run at
> > up to approx. 3GHz.
> > This however causes a problem, because these rates require BIT(31) to
> > be usable. Unfortunately this is not the case with clk_ops.round_rate
> > on 32-bit systems. BIT(31) is reserved for the sign (+ or -).
> >
> > clk_ops.determine_rate does not suffer from this limitation. It uses
> > an int to signal any errors and can then take all availble 32 bits for
> > the clock rate.
> >
> > I am sending this as RFC to start a discussion whether:
> > - this is a good way to solve it?
>
> .determine_rate() was meant to replace .round_rate() so I guess it is
> good to do it :)
ah, now things make more sense.
thanks for the background info

> > - what are the alternatives?
>
> I don't see any ATM. Even with determine_rate(), 4.29GHz limitation
> seems a bit low nowadays. In AML SoC, most PLLs should be able to reach
> 6GHz ... hopefully we won't need that on the 32bits variant ;)
according to the public datasheet the maximum PLL frequency is at around 3GHz
so I also hope that we're safe with this


Martin
