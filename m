Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:41770 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750828AbdBWPBZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 23 Feb 2017 10:01:25 -0500
From: Heiko Stuebner <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Yan <andy.yan@rock-chips.com>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/7] Rename RK1108 to RV1108
Date: Thu, 23 Feb 2017 16:00:30 +0100
Message-ID: <4369285.zq7cJYMXhu@phil>
In-Reply-To: <CACRpkdbNbGvwUq3uLgekimOwzBZCXf37JW9LCCqLm1so=CMNrw@mail.gmail.com>
References: <1486983566-32265-1-git-send-email-andy.yan@rock-chips.com> <0bbc4151-d954-1a27-48c3-1e8c9cb9e16f@rock-chips.com> <CACRpkdbNbGvwUq3uLgekimOwzBZCXf37JW9LCCqLm1so=CMNrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Linus,

Am Donnerstag, 23. Februar 2017, 11:15:56 CET schrieb Linus Walleij:
> On Tue, Feb 14, 2017 at 1:44 AM, Andy Yan <andy.yan@rock-chips.com> wrote:
> > Hi Heiko & Rob:
> > 
> > On 2017年02月13日 20:51, Heiko Stuebner wrote:
> >> Hi Andy,
> >> 
> >> Am Montag, 13. Februar 2017, 18:59:26 CET schrieb Andy Yan:
> >>> Rockchip finally named this soc as RV1108, so change
> >>> RK1108/rk1108 to RV1108/rv1108 for compatible.
> >> 
> >> renaming existing bindings (that have been in multiple kernel versions
> >> already) always is a hot topic. So I'll be hoping for Rob to give a
> >> go-ahead
> >> for it :-) .
> >> 
> >> Just to confirm, the rk1108/rv1108 is completely new to the market, so
> >> we're
> >> not breaking any existing devices, right?
> >> 
> >     Yes, the 1108 Soc is completely new to market, this change will not
> > 
> > breaking any existing devices.
> 
> Nobody gets hurt. Just rename everything to avoid confusion.
> Just my €0.01.
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Tell me if I can merge a subset of the patches to the pinctrl tree.

I did provide Reviewed-bys for them, so you should be able to merge the 
pinctrl patches (4+5) at your convenience :-)


Thanks
Heiko
