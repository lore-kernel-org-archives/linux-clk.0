Return-Path: <SRS0=MiPE=CG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252E2C433E6
	for <linux-clk@archiver.kernel.org>; Fri, 28 Aug 2020 10:03:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1E742078A
	for <linux-clk@archiver.kernel.org>; Fri, 28 Aug 2020 10:03:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yfZYGfWI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728954AbgH1KC4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Aug 2020 06:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728986AbgH1KCn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Aug 2020 06:02:43 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88927C061234
        for <linux-clk@vger.kernel.org>; Fri, 28 Aug 2020 03:02:42 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w14so658834ljj.4
        for <linux-clk@vger.kernel.org>; Fri, 28 Aug 2020 03:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gg8w7FyxS5olNPP0T/p1d8kcV4d3oP7pvIBcK4KxiMA=;
        b=yfZYGfWIaazhZpa4MiIfi8N1UYAwzELWPkKXWkeWzFH0MlcFmqxKiS+EAg2YC5+qd1
         r+P2+8DvIOePVKtMKrUFWOydQlKrMISbi6KPh/K1RN1eF79khiLQGP0aJL4yAEsHZIhu
         mLlsz7S6XqAjgLOoJe2zsL5z8EP92lbJAhoDJ2HAPkQQYf/4PR6erjtyFQvZ69ZDBFo8
         geVZUT/w4DpGsf2+/cq4vAElPCWJeF8mLbiSZcFNQTPNypLVCx/4XEO+h782UOPyvBvx
         6n8lsxYQb+0daon+8trpyWVpJN1BQcYSAou3pR+PM04gn6qcXNkxjP0Uruyr6u8BIUvE
         XuuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gg8w7FyxS5olNPP0T/p1d8kcV4d3oP7pvIBcK4KxiMA=;
        b=kGRM2EqLSsbRqONdDHuMNkbg0+tklIjqh+BK9LsrUJKYXZt2G9dAifFLGQZjyUbdla
         AuNTzcDo0h9nTe+DQBeyjsz57/6ovC59KS+591Qa7zfaGz3xcCxwyEbJgKy/YixkYjp3
         qHJ59Gq0Ezsbb2nb5XoGVncrioGJg6q3CmNFHbw+K54P/O1GOfJMeJvWQiSPC9+cMOFo
         8ORjmGTAIYu4jHDmmPZSNo36u3Vjt3aQs/FtRLXnxB2sxlppulzWWuNvNiVqRa2LktAx
         0L1Em3Ynj6LoBvo5rAsMmCZmzR+TD/L9tYQqQKZxA5mRY0BFCHfc19sYKUWHcVTnNp1E
         3YIA==
X-Gm-Message-State: AOAM5313oF3tDUA8X8eI9KfmG3hd44FORqlysf66K3WTrSHcZkt0WiUq
        THNl4NaLSCJInAbhxWcJTCB/aDBuxhdrnf/1CFMzNw==
X-Google-Smtp-Source: ABdhPJxGBDDIUGKlDHb7X+U9ZlUuxz6OTVqUpjGGNG25WaTWbUK0lfjyuNiH2UpzdtAP231LGoGkSdCBPbtNK7t7yF8=
X-Received: by 2002:a2e:b80b:: with SMTP id u11mr556502ljo.286.1598608960272;
 Fri, 28 Aug 2020 03:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1595572867.git.frank@allwinnertech.com>
In-Reply-To: <cover.1595572867.git.frank@allwinnertech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 12:02:29 +0200
Message-ID: <CACRpkdYOKOj4r-9U2iHCkdB74fWkm2J0xHqsnH_sE81SV5g1=w@mail.gmail.com>
Subject: Re: [PATCH v5 00/16] Allwinner A100 Initial support
To:     Frank Lee <frank@allwinnertech.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Frank Lee <tiny.windzz@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Icenowy Zheng <icenowy@aosc.io>,
        Ondrej Jirman <megous@megous.com>,
        Corentin Labbe <clabbe@baylibre.com>, bage@linutronix.de,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jul 24, 2020 at 8:53 AM Frank Lee <frank@allwinnertech.com> wrote:

> This patch set adds initial support for allwinner a100 soc,
> which is a 64-bit tablet chip.

Shall I commit the pinctrl patches (if Maxime ACKed) separately
or not? Once Maxime is happy, I am usually happy too.

Yours,
Linus Walleij
