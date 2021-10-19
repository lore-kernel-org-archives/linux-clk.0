Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E1FFC4332F
	for <linux-clk@archiver.kernel.org>; Tue, 19 Oct 2021 23:59:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17A2960FC3
	for <linux-clk@archiver.kernel.org>; Tue, 19 Oct 2021 23:59:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhJTABO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Oct 2021 20:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbhJTABH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Oct 2021 20:01:07 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B21A7C061776
        for <linux-clk@vger.kernel.org>; Tue, 19 Oct 2021 16:58:52 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id i24so11031697lfj.13
        for <linux-clk@vger.kernel.org>; Tue, 19 Oct 2021 16:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VBm7jtj/ZXVVra/TlZ+Gn2zJ75uYPRf6l4Ohw8Odwuk=;
        b=kBYqS9v3Mh1aOv2lZ2w5uJUwWD+cTky8rytXCq7SWAqhKxicYnpFXsvZSlgQATHx7V
         ZtzIalE+E9sc8opoo61bJq42d3PMpt6q6UbQXMEKG4ZXAYgpScs6XEXK7bp64vafE1cR
         JF0FT0Irc2/cshcXacKRj4iYnl7rv6QLPrTd81paQuLS3Olf6SACBqNIQAoZ5xFRAsXn
         xermakalhrrfm9N+lRoBM85Qvd8JmnE2xQUi+rp4N9l129CJ63x7FopNWJfF9nXSr9k2
         pZr4qbfl6V9+fy7fEfdLi5tlIKjLGJsDScdhhn+kufbc35zGbpja+8+ca3YYjcLmxm2g
         Ugmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VBm7jtj/ZXVVra/TlZ+Gn2zJ75uYPRf6l4Ohw8Odwuk=;
        b=fQV66Rf486oIlv7dvuDPf6RHNXlylKhSanNpAAMLFnjYqX8+7cAAaUl29CWE0MBCor
         b3yMqOqzwiMcoedgpyOMQTdmGbuAifBv25M0dsfmZUDvZsuhDrl1G7iXKwutcjc2ofxQ
         k6xC0FqFZGNdJLQVY5PxtfU609EIIClIFOWIVScMd/ROhj+GtnL+BCoZCdVPdSOkkWo2
         9ki0jwUb2Mk4TIyUz6eyo3mpLJQRdSEbPaqJ0q03WzNEgv9/4i93XbnfUU5JGdCdIxmD
         baC1srmiNuyYfUcvD6ZD2IXLTJk4KsIK1xb7mt4i3m3DpTn7ilLvpdhQ+FEzmD4zU7do
         MnfQ==
X-Gm-Message-State: AOAM530bOuzhBxJGGrcZeeub5wyjTyDBtjXNn2Gklxx0aDPwDesUaKNx
        70wSQ61tZM49nfeXnTb8bN3HLqV0fcsl7Eu/C6kySUT2dGegQg==
X-Google-Smtp-Source: ABdhPJwR8QRR057Fq/S8qBaN/ibwLdey2yezfIvwP+GumGiriYZOka6QuQmOhXY4MoBPnTfgGO/sy8hG7S3kOHOClCo=
X-Received: by 2002:a19:c10d:: with SMTP id r13mr9038828lff.339.1634687931005;
 Tue, 19 Oct 2021 16:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210921184803.1757916-1-linus.walleij@linaro.org> <20210921184803.1757916-2-linus.walleij@linaro.org>
In-Reply-To: <20210921184803.1757916-2-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Oct 2021 01:58:39 +0200
Message-ID: <CACRpkdbpAshdn9GTQRHVXpe7VpCAUmiEo+RdEVLzSjq7VJA=Og@mail.gmail.com>
Subject: Re: [PATCH 2/2 v3] clk: ux500: Add driver for the reset portions of PRCC
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Sep 21, 2021 at 8:50 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> The Ux500 PRCC (peripheral reset and clock controller) can also
> control reset of the IP blocks, not just clocks. As the PRCC is probed
> as a clock controller and we have other platforms implementing combined
> clock and reset controllers, follow this pattern and implement the PRCC
> rest controller as part of the clock driver.
>
> The reset controller needs to be selected from the machine as Ux500 has
> traditionally selected its mandatory subsystem prerequisites from there.
>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

One month has passed, can we merge this patch?

Philipp's review comments should be addressed.

Yours,
Linus Walleij
