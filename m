Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789A9C433E0
	for <linux-clk@archiver.kernel.org>; Tue,  5 Jan 2021 22:36:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D6FE22EBD
	for <linux-clk@archiver.kernel.org>; Tue,  5 Jan 2021 22:36:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730728AbhAEWgG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Jan 2021 17:36:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729176AbhAEWgG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Jan 2021 17:36:06 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE6AC061795
        for <linux-clk@vger.kernel.org>; Tue,  5 Jan 2021 14:35:25 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id b26so2190267lff.9
        for <linux-clk@vger.kernel.org>; Tue, 05 Jan 2021 14:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ahZlAn0+MJ2JO85Il4zqrFNJA3yrxvXOMtixl0o8ZDM=;
        b=xuV05iXPoA0k4FUH7uDKhum9x67A5+g0WrawAcxr+1nwNNKfzDFFhw6RcXhGVjrdAG
         DIPpNcT0tMeqTolY+1UHSqvl7wF97ndSycgqsK5KNZXYOFouXEAZcmV0db14uxPi/xTw
         fkiZrDeIfCVzxFPh/s6f5MjQjTE3FbzD//H1CaneHnQ65EKqNmVFIkbD/Q8s3qRbnfpF
         oeHplvWvkyArKkqqQjholOIaGROH0SMwCIhye89WnfvVn9lg7Rsy+dje5qrZY0xghJSO
         IVRZp+VQXtSVeFeCiWvHmfOs8HhPvx9IfbltAGF1/00sbuHYdVKbwxTKfWFe05h5vvVQ
         dbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ahZlAn0+MJ2JO85Il4zqrFNJA3yrxvXOMtixl0o8ZDM=;
        b=OIXWLeSYIbql1457IXIoBe+4CocWz6yzltjOtFBMFq+TYV2sZ//HQHadg3eid6Uy71
         rrGFCtsczVmx7UNJqEdNWTJ5NpKS6LYM6dWrKSBZ2k7m9TYvFEa/JK3KA/Jz99cAh7Ic
         jHPyQ55lqZolD+h8cJDmXuec3pJSmSI3H/lu2diM1s3XyziA8J7qdyGUptEY6jE6cplT
         K3ryPCMv7ljgvrcDHsYQQwpBLvjF1J/DVyR6KRx7qg8UAlhDrQkC1RJD91m+8WY9yrgJ
         h/H6IM5CQyY/7Z73IoCVNzH6huIkbs2pfvxAuct0VCIbZouCG4gpBHpFVLjuILL+Ezhd
         Itng==
X-Gm-Message-State: AOAM5320hGkHa3RA7s2v4HIk8pT/dd+9XPAEvkmSBai8gMC7+MDhZast
        rXhIChtC2va40+9MEcJESFpLXeg4fWBF4tYKvaXpWw==
X-Google-Smtp-Source: ABdhPJzKIX1tyqxO7DBuxtMjhEds0Yt3Gvxf2kvrIu6dSu4kg7r3sapM7iAm3kjKr+iyrDzk5lF6EH5VLy/XUJEFifg=
X-Received: by 2002:a2e:9dc3:: with SMTP id x3mr800336ljj.326.1609886124436;
 Tue, 05 Jan 2021 14:35:24 -0800 (PST)
MIME-Version: 1.0
References: <20210103100007.32867-1-samuel@sholland.org> <20210103100007.32867-3-samuel@sholland.org>
In-Reply-To: <20210103100007.32867-3-samuel@sholland.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Jan 2021 23:35:13 +0100
Message-ID: <CACRpkdZbNUxizfV5Oo8F8b0bsjNcBF6JfP=ufykNLeqErvU-ug@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] pinctrl: sunxi: h6-r: Add s_rsb pin functions
To:     Samuel Holland <samuel@sholland.org>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andre Przywara <andre.przywara@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Jan 3, 2021 at 11:00 AM Samuel Holland <samuel@sholland.org> wrote:

> As there is an RSB controller in the H6 SoC, there should be some pin
> configuration for it. While no such configuration is documented, the
> "s_i2c" pins are suspiciously on the "alternate" function 3, with no
> primary function 2 given. This suggests the primary function for these
> pins is actually RSB, and that is indeed the case.
>
> Add the "s_rsb" pin functions so the RSB controller can be used.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Is it OK if I just apply this patch to the pinctrl tree?

Yours,
Linus Walleij
