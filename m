Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435C8C433F5
	for <linux-clk@archiver.kernel.org>; Wed,  8 Dec 2021 18:28:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234072AbhLHScP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Dec 2021 13:32:15 -0500
Received: from mail-ua1-f52.google.com ([209.85.222.52]:40758 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234545AbhLHScO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Dec 2021 13:32:14 -0500
Received: by mail-ua1-f52.google.com with SMTP id y5so6296201ual.7;
        Wed, 08 Dec 2021 10:28:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UVO1G9di67cOfq2fGeBP/29806GCl8TXzVflyNkiiRs=;
        b=eI5sic0WpjOxq0DEuNco/r1pwF9apjaLV3crSC2AujCubYJ9zAxD4ipEO28CP6nVNM
         6LTCF3MPqMZWPK/B8KQHjaUO4rosQzFIqb0E2Z/DtOsgr6XNmN7ec8Fh7ZxDQ3o0jCY9
         CaoMieK7yHRrlGPPgxm+E63fZxeCoFUmBLmTAGqK2lcglWptQ+B6EBxFphaTQDy/DNsV
         own4ZIxXGzS+tLUCrhtZIqcJfkaljt9dai4EKRgQO/+qup8A71Ro8UibnxS9iLQqreTk
         M4x1DFryn2kp3rbvURJahhAW4ZuVos1hJW6irP8IyxDpBkXkPZyBIezsGu/xTYQcK6YS
         p50g==
X-Gm-Message-State: AOAM532YfBAFhCYWEBbhPIJ/auU7XzLZodWW75T4tm+CotLEnmR8EV0T
        x2NNadpSK3ySEGRH/oJ5UfljBjQ5pY9HyQ==
X-Google-Smtp-Source: ABdhPJwaIm3tJEgztIsWmh+TtRj5EAf3zD7NIxV+TvOF/mtDGUMNhpddGH+b4vUnMBuXq/atHaDNHw==
X-Received: by 2002:ab0:2a10:: with SMTP id o16mr10752232uar.36.1638988121591;
        Wed, 08 Dec 2021 10:28:41 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id u14sm2299542vkk.12.2021.12.08.10.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Dec 2021 10:28:41 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id ay21so6251643uab.12;
        Wed, 08 Dec 2021 10:28:41 -0800 (PST)
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr10373916uai.89.1638988120928;
 Wed, 08 Dec 2021 10:28:40 -0800 (PST)
MIME-Version: 1.0
References: <20211130140724.10750-1-conor.dooley@microchip.com>
 <20211130140724.10750-3-conor.dooley@microchip.com> <CAMuHMdV=QNtz0rRLQv+=k+GGuSyKANFjGQ1YTKaKwcmzsvf5RA@mail.gmail.com>
 <3e2a08f5-d1b0-e2d3-c418-4b5b352f0800@microchip.com>
In-Reply-To: <3e2a08f5-d1b0-e2d3-c418-4b5b352f0800@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Dec 2021 19:28:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW15iBaPqgAjq2tpXHwKtL0yPv4RuXtuqmbExgRP8BVGQ@mail.gmail.com>
Message-ID: <CAMuHMdW15iBaPqgAjq2tpXHwKtL0yPv4RuXtuqmbExgRP8BVGQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] clk: microchip: Add driver for Microchip PolarFire SoC
To:     Conor Dooley <Conor.Dooley@microchip.com>
Cc:     Daire.McNamara@microchip.com,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        david.abdurachmanov@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>,
        Cyril.Jean@microchip.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Conor,

On Wed, Dec 8, 2021 at 4:30 PM <Conor.Dooley@microchip.com> wrote:
> Just going to ack the other items you raised for now, but curious about
> this one:
> On 06/12/2021 15:53, Geert Uytterhoeven wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >> +static void mpfs_clk_unregister_cfg(struct device *dev, struct clk_hw *hw)
> >> +{
> >> +       struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
> >> +
> >> +       devm_clk_hw_unregister(dev, hw);
> >> +       kfree(cfg_hw);
> >
> > This is freeing a part of the big array allocated with devm_kzalloc()?
> I took a look at this, and I don't think it is freeing the devm
> allocated array.
>
> To me, what is actually being freed is an element in the array of
> structs passed to mpfs_clk_register_cfgs in the probe function.
> However, this struct is statically defined - so its elements shouldn't
> be freed at all?

You're right, it's part of the static array.  I was misled by the
back-and-forth conversions between the different types.
Regardless, the kfree() calls should be removed.

> drivers/clk/clk-bm1880.c has the same behaviour in the unregister
> function, where it calls kfree on the elements of a static array of clk
> structs. So if my understanding is correct it would need fixing there too.

If that is true (didn't check), it needs to be fixed, too.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
