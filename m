Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:33069 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752061AbdEVIsz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 May 2017 04:48:55 -0400
Received: by mail-io0-f172.google.com with SMTP id p24so77005336ioi.0
        for <linux-clk@vger.kernel.org>; Mon, 22 May 2017 01:48:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170504135006.16483-1-icenowy@aosc.io>
References: <20170504135006.16483-1-icenowy@aosc.io>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 22 May 2017 10:48:53 +0200
Message-ID: <CACRpkdYwsyo6YT6SinisMDxhGEox5iRHZgO7xQpv-xTMjy-FOg@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Initial Allwinner R40 support
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, May 4, 2017 at 3:49 PM, Icenowy Zheng <icenowy@aosc.io> wrote:

> This is the first non-RFC version of this patchset, which added basical
> support including I2C, UART and MMC to the mainline Linux.
>
> The pinctrl driver of A20 is also merged into the one of A10 before
> R40 support is added into the A10 driver.

I'd be happy to merge the pinctrl parts as soon as you fixed the
things pointed out during review. Include Rob's ACKs on the
DT binding patches please.

Yours,
Linus Walleij
