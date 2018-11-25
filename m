Return-Path: <SRS0=4kPz=OE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA01CC04EBA
	for <linux-clk@archiver.kernel.org>; Sun, 25 Nov 2018 12:50:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 877A72086B
	for <linux-clk@archiver.kernel.org>; Sun, 25 Nov 2018 12:50:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="KqgJ4WeU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 877A72086B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbeKYXlJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Nov 2018 18:41:09 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41357 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbeKYXlH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Nov 2018 18:41:07 -0500
Received: by mail-lf1-f66.google.com with SMTP id c16so11536167lfj.8
        for <linux-clk@vger.kernel.org>; Sun, 25 Nov 2018 04:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rgKdsQBuKUgq5aJ4Gauhtd25HWjQ3W/6tZZcT1TNouM=;
        b=KqgJ4WeUzCdietKa1HLTBnwqrtvgHQYzu5YNbX2c8F1oSVaOMiho0kXPYfd5ZZ/dOd
         9dQUbkau+6F8lS2HCBJyqVJ9k5clnJGEQGEmMGC+Y1LES9GvkQYaJsek6/t+S6+Xb+7e
         RGfFuOW2cb6BAYpnX36+rW5xNeho84lgJnWbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rgKdsQBuKUgq5aJ4Gauhtd25HWjQ3W/6tZZcT1TNouM=;
        b=uQ5dD+g9qEwCHjS3dGx3sJOXP04p0hbnKqoB4FOK0W1kmR5wihZP6jW7Q53MDrM9Nr
         zTQAE9q6IcaT4qws9BQzbNcxKlw1aIF2vu3ZFBKfiTAOwauiDqkY0TZIAcpngnCqGiQB
         A4epYrXA1uR6oc1ydjgh/aI5YTIxu3yBcaaorIClRDduMWYiQ+rXqfaJpNVMo35G/J4n
         IRAnIqmZLNCBuZLTp3eoqdMkMKmOr5T/3uKIFUABp/LfMdQTwuWR4yHcXZXXm/BRyaFY
         WE8TqKDsPcArcMh7jD3NAgkRTEWMTktCSPqPTgmbqxGqdf+dYgmrnN+ZzYfUsBIVY3y6
         vuVw==
X-Gm-Message-State: AGRZ1gLspahXAazkk+E0AwZLbP/iHaJ+uPy53E3xU033vIc9qU7jDsLN
        GN9yiKb5GnCtbSR1DhbejPvtOVniakr5jIC2W9h0kw==
X-Google-Smtp-Source: AJdET5fmTiDIZprkDHy8Zec+rjjB4ADDeodBOpglW0ANT93mLh0pWboPlYhy9b/LRWLchCdkimfb/l1JzGeEp5dO4Y4=
X-Received: by 2002:a19:5154:: with SMTP id f81mr14406017lfb.96.1543150205471;
 Sun, 25 Nov 2018 04:50:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1543131714.git.mesihkilinc@gmail.com> <233099b6384217ddaf5147e54859359acd56be0e.1543131714.git.mesihkilinc@gmail.com>
In-Reply-To: <233099b6384217ddaf5147e54859359acd56be0e.1543131714.git.mesihkilinc@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 25 Nov 2018 13:49:53 +0100
Message-ID: <CACRpkdb6dbGMdLznm8F_jV2zj9dJfiwTK5w-8YShxwiPALE3+g@mail.gmail.com>
Subject: Re: [RFC PATCH v4 11/17] pinctrl: sunxi: add support for suniv
 F1C100s (newer F-series SoCs)
To:     mesihkilinc@gmail.com
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-sunxi@googlegroups.com,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Icenowy Zheng <icenowy@aosc.io>,
        Rob Herring <robh+dt@kernel.org>, julian.calaby@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Nov 25, 2018 at 8:44 AM Mesih Kilinc <mesihkilinc@gmail.com> wrote:

> The suniv F1C100s chip (several new F-series SoCs) of Allwinner has a
> pin
> controller like other SoCs from Allwinner.
>
> Add support for it.
>
> Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
> Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Patch applied to the pin control tree for v4.21.

Yours,
Linus Walleij
