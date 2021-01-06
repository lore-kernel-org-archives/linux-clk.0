Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D319DC433E0
	for <linux-clk@archiver.kernel.org>; Wed,  6 Jan 2021 20:12:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4EE623131
	for <linux-clk@archiver.kernel.org>; Wed,  6 Jan 2021 20:12:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbhAFUMF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Jan 2021 15:12:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbhAFUME (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jan 2021 15:12:04 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 622C1C061358
        for <linux-clk@vger.kernel.org>; Wed,  6 Jan 2021 12:10:46 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id a12so9388957lfl.6
        for <linux-clk@vger.kernel.org>; Wed, 06 Jan 2021 12:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5fTYl7dFnUNDY76/N/FBKgt5PJcqYVGl1YeIAp29Cb4=;
        b=Qbc+93ieH0Q8qihFPzMggAa8SmXbcWkUTomxAJiIG6B/pDM/RLyfRbEoarG3AzELxh
         ac30doK/+KYIllKtltVEdgGmnZKW+ZjWJxWDXlbsBugbUU+UuX0QC0rY29Z+787Ph3CT
         U2kc1mjPOoxCMRFPNVPNkm5RwMWfF/QpOMoLuBo2IiKQFv8qyOqizq+T7yCZ1urOntmR
         ri1Az6AjLSp3G98+YHSP07VY0oSRQyOJvzCOLyHehs4ef5aALgU1KwDLwVNHdP6u0yVy
         4UzmdtSmfQD/5+7pA36yDyzmXqYw3DhndSkgqu3YcYcWmAJRv+tanx03kFiRManEoxja
         YH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5fTYl7dFnUNDY76/N/FBKgt5PJcqYVGl1YeIAp29Cb4=;
        b=s0RPRyv2twpzx/08RLBvAnV4AYdPWkbvH26TFmPOu+3E7yVDOJ/CugCJrFRdc5TnM1
         881HeMyCs8eR6zYjCTuwkfylfuVuvrpPjPgTPCLpBRVWVbYqwCw56qo3n4hsHecAbsm+
         2vz7rUyyMmQlKgHIaUFc73nXq7lPWs+8tfpSr0v7mlkLueyUTA+dJnzEijM3Vjk3GCkQ
         S3s3JjrLfp3V4zJSpvwJJdbjpzpxxhY4xpG0zZv3kAkH/vQLBGoxe7mipu+hLkwEfPil
         4kQ0SiwPDa3mIDK1llWjCBI1I+79nAs6iK337e6IS0QnoYt93fTzVZtuxDUktNs8H+NG
         IJsw==
X-Gm-Message-State: AOAM531FiIiQ7k3Ch80L+G9kdf2AFWwUziAEhrmROJ/PwwbQfEHALSI8
        fQkhbz1kf3EHDtaqQVCVzce/D9JhcegC1DASFACiLQ==
X-Google-Smtp-Source: ABdhPJyMV/qRlwhsED4wqR63/+mBwb2d/XZZAMB8W7cpRjr16ansOu5Csx6k8LuW95AIPpjuzVysr5H9Fl1Aln+7iaU=
X-Received: by 2002:a05:651c:205b:: with SMTP id t27mr2776550ljo.368.1609963842431;
 Wed, 06 Jan 2021 12:10:42 -0800 (PST)
MIME-Version: 1.0
References: <20210103100007.32867-1-samuel@sholland.org> <20210103100007.32867-3-samuel@sholland.org>
In-Reply-To: <20210103100007.32867-3-samuel@sholland.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 6 Jan 2021 21:10:31 +0100
Message-ID: <CACRpkdagu9Sj9AEcGQYrnAAxUJWZKGZ2zina4XWubQ7WXYU-0A@mail.gmail.com>
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

This patch applied to the pinctrl tree.

Yours,
Linus Walleij
