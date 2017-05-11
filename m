Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:37222 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965015AbdEKOlw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 May 2017 10:41:52 -0400
Received: by mail-it0-f43.google.com with SMTP id g126so20985709ith.0
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2017 07:41:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170504135006.16483-5-icenowy@aosc.io>
References: <20170504135006.16483-1-icenowy@aosc.io> <20170504135006.16483-5-icenowy@aosc.io>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 May 2017 16:41:50 +0200
Message-ID: <CACRpkdapcjoSaCpKev6tTuMVF5ZEQ61HkUMMAC3npJnnYWzNcA@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] pinctrl: sunxi: switch A20's pinctrl driver to
 use the A10 version
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

On Thu, May 4, 2017 at 3:50 PM, Icenowy Zheng <icenowy@aosc.io> wrote:

> As we added A20 support to A10 pinctrl driver, now we can delete the
> dedicated A20 pinctrl driver, and enable A10 driver for A20.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Looks all right to me but I'm waiting for Maxime's review on these
patches.

Yours,
Linus Walleij
