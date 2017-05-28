Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:35014 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750776AbdE1PHD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 28 May 2017 11:07:03 -0400
MIME-Version: 1.0
In-Reply-To: <20170527102308.1988-4-icenowy@aosc.io>
References: <20170527102308.1988-1-icenowy@aosc.io> <20170527102308.1988-4-icenowy@aosc.io>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 28 May 2017 23:06:38 +0800
Message-ID: <CAGb2v67zr5BNub45=Uap86sfs5qOsJiiYyaxqPK8-cbYsrtK9Q@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] pinctrl: sunxi: add A20 support to A10 driver
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sat, May 27, 2017 at 6:23 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
> As A20 is designed as a pin-compatible upgrade of A10, their pin
> controller are very similar, and can share one driver.
>
> Add A20 support to the A10 driver.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
