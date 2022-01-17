Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB7CC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jan 2022 20:54:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235745AbiAQUyA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Jan 2022 15:54:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbiAQUyA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jan 2022 15:54:00 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA39AC061574
        for <linux-clk@vger.kernel.org>; Mon, 17 Jan 2022 12:53:59 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id w204so11220675pfc.7
        for <linux-clk@vger.kernel.org>; Mon, 17 Jan 2022 12:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HYpcsQcNoKf0ZAVU8M7gzKxtBSfWRJWnLsAKCpZawr8=;
        b=6M5ZHb2bzrI5rJSN5z0FqQt5lhcdEk49qd5OYp+/Bd6pv5vqb4azcjyPPzWKxdh/qU
         r1OPUm2SUVRkhVb2OzwvmmOIuc9YCi5H91S7cY2/6ls9ffl8lwZF2HTgnVGYFIO449UT
         Z/RkFkurPAWkBOf7MmI/qkkOTKLOLOxtFb+k2GFAoZl4EVtqmhfGs6ulmbEQDchwKtpM
         HwRG75TQUOkwbB3rR3av56+VuOZ4/ZEhp2ckWbq8lVEyVLh+OkhOFl9oDn9Bb8aKSXPT
         2HAZq79RkOuI+SAQMDN/yPQWq2OuFcE5L+vGItKHmAwG9zUTeUy8HFJMGJgdeR3aADOQ
         bNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HYpcsQcNoKf0ZAVU8M7gzKxtBSfWRJWnLsAKCpZawr8=;
        b=y6OT8FwC8kdKbJnjU+G6gtSDdXIGEv7YA7HHDNBW9ndZFo7fY0ErtVB+e7a/qI2gDj
         C0mTlPYaCBvk6BppOv8sLe1Hhb89/mqjk/oKQlqjTh0M5gCMqpV7U/mlDvq304Rm1P46
         OTu85fdTsG7hArKZH/qpXMm5Jn3iyR3X+g7NsiEpsJeafchRFW0L1f4e6jRIzB8bMEZj
         4stfOIZb3rGf4dKFJGGgjpLgoEXjwc6KuBGw+g+zCB3QlhQZTgHbRMFujOYgWrJoBcui
         F5iuyz25u2AuP4VovAMxHzuAmABKTxZxU8MYb0ozG5kc9jKWI+yV4D6eyF9pQqgwj2oH
         fDOA==
X-Gm-Message-State: AOAM530afVixIIOafEX6dUUyJQYJjdzmAf3KJrFQK3dRgr57QkGTwq9m
        35H91ba/zTA+BJeTXEDgHXPs8t3E69VGtXGBl1ug+g==
X-Google-Smtp-Source: ABdhPJy/EjBSFJfriBqRsICfZ44KCdH2QkjcbzFwFcgd2QpOMma6ckMOY5Y6KmXc4qy/y6xO8ySgb9FwkI4g+2TNK+4=
X-Received: by 2002:a63:90c8:: with SMTP id a191mr21023658pge.622.1642452839185;
 Mon, 17 Jan 2022 12:53:59 -0800 (PST)
MIME-Version: 1.0
References: <CGME20220113122302epcas5p1d45c0714fe286f8f91d0f28c3fad86e4@epcas5p1.samsung.com>
 <20220113121143.22280-1-alim.akhtar@samsung.com> <20220116092325.GA30745@amd>
In-Reply-To: <20220116092325.GA30745@amd>
From:   Olof Johansson <olof@lixom.net>
Date:   Mon, 17 Jan 2022 12:53:48 -0800
Message-ID: <CAOesGMhpw7+5Q3MDAFQTr8-sDFgVXOE=v6h8d8pbHiZn8=3h2g@mail.gmail.com>
Subject: Re: [PATCH 00/23] Add support for Tesla Full Self-Driving (FSD) SoC
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        SoC Team <soc@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Pankaj Dubey <pankaj.dubey@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Jan 16, 2022 at 1:23 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > This patch set adds basic support for the Tesla Full Self-Driving (FSD)
> > SoC. This SoC contains three clusters of four Cortex-A72 CPUs,
> > as well as several IPs.
>
> I'm not thrilled by their naming. Intel does not produce "Intel
> Fastest in world SoC"

If you say so. :)

> , and this chip is not actually suitable for
> autonomous driving :-(.

And AMD's Infinity Fabric isn't.... infinite. Things have names.

That discussion seems off-topic for this patchset. It references a
marketing name used by the company, and as such it makes sense to be
able to cross-reference:
https://www.tesla.com/support/full-self-driving-computer

Tesla seems to have moved away from the initial "Hardware 3" naming
scheme, so using this naming seems as good as any.


-Olof
