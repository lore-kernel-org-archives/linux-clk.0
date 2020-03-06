Return-Path: <SRS0=hB7x=4X=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBD2C10DCE
	for <linux-clk@archiver.kernel.org>; Fri,  6 Mar 2020 10:31:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 45D6A20866
	for <linux-clk@archiver.kernel.org>; Fri,  6 Mar 2020 10:31:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgCFKbJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Mar 2020 05:31:09 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36954 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgCFKbJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Mar 2020 05:31:09 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id EC114296FC2
Message-ID: <8f3ef079b0c96d65e5855a58efd6d8dc32cd32e7.camel@collabora.com>
Subject: Re: [PATCH 1/2] ARM: Rockchip: Handle rk3288/rk3288w revision
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Kever Yang <kever.yang@rock-chips.com>,
        Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc:     =?ISO-8859-1?Q?Myl=E8ne?= Josserand 
        <mylene.josserand@collabora.com>, linux@armlinux.org.uk,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, kernel@collabora.com,
        linux-clk@vger.kernel.org
Date:   Fri, 06 Mar 2020 07:30:56 -0300
In-Reply-To: <933e1ce3-68be-9e78-18a3-eb3d4e038cfb@rock-chips.com>
References: <20200302155703.278421-1-mylene.josserand@collabora.com>
         <2221545.2vEflg7qi2@diego>
         <5fa8402863c7fb4171d8b2021a776b9ac0be1596.camel@collabora.com>
         <35989681.7qWAQounLj@diego>
         <8b993ec8ae9dccc6a8633cfe5e5b6d40d58ffbae.camel@collabora.com>
         <506e1aeda3ed14276734f22f320b0ceb6a4b06b0.camel@collabora.com>
         <933e1ce3-68be-9e78-18a3-eb3d4e038cfb@rock-chips.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 2020-03-06 at 10:44 +0800, Kever Yang wrote:
> Hi Ezequiel,
> 
> 
> On 2020/3/5 下午7:35, Ezequiel Garcia wrote:
> > (Adding Kever to the loop)
> > 
> > On Thu, 2020-03-05 at 08:32 -0300, Ezequiel Garcia wrote:
> > > On Thu, 2020-03-05 at 01:51 +0100, Heiko Stübner wrote:
> > > > Hi Ezequiel,
> > > > 
> > > > Am Donnerstag, 5. März 2020, 01:03:30 CET schrieb Ezequiel Garcia:
> > > > > Hi Heiko,
> > > > > 
> > > > > On Wed, 2020-03-04 at 11:59 +0100, Heiko Stübner wrote:
> > > > > > Hi,
> > > > > > 
> > > > > > Am Montag, 2. März 2020, 16:57:02 CET schrieb Mylène Josserand:
> > > > > > > Determine which revision of rk3288 by checking the HDMI version.
> > > > > > > According to the Rockchip BSP kernel, on rk3288w, the HDMI
> > > > > > > revision equals 0x1A which is not the case for the rk3288 [1].
> > > > > > > 
> > > > > > > As these SOC have some differences, the new function
> > > > > > > 'soc_is_rk3288w' will help us to know on which revision
> > > > > > > we are.
> > > > > > what happened to just having a different compatible in the dts?
> > > > > > Aka doing a
> > > > > > 
> > > > > > rk3288w.dtsi with
> > > > > > 
> > > > > > #include "rk3288.dtsi"
> > > > > > 
> > > > > > &cru {
> > > > > > 	compatible = "rockchip,rk3288w-cru";
> > > > > > }
> > > > > > 
> > > > > I guess you have something like this in mind:
> > > > > 
> > > > > static void __init rk3288_clk_init(struct device_node *np)
> > > > > {
> > > > >          __rk3288_clk_init(np, RK3288_SOC_REV_RK3288W);
> > > > > }
> > > > > CLK_OF_DECLARE(rk3288_cru, "rockchip,rk3288-cru", rk3288_clk_init);
> > > > > 
> > > > > static void __init rk3288w_clk_init(struct device_node *np)
> > > > > {
> > > > >          __rk3288_clk_init(np, RK3288_SOC_REV_RK3288);
> > > > > }
> > > > > CLK_OF_DECLARE(rk3288_cru, "rockchip,rk3288w-cru", rk3288w_clk_init);
> > > > > 
> > > > > And the rest is mostly untouched, except the revision is
> > > > > no longer queried and is now passed by the DT?
> > > > Essentially yes, but I guess I was more thinking along the lines of
> > > > the rk3188/rk3066a/rk3188a (drivers/clk/rockchip/clk-rk3188.c)
> > > > 
> > > > 
> > > > > This would be cleaner for the kernel, with the obvious
> > > > > drawback being that you now have to maintain
> > > > > another DTS.
> > > > Right now we would end up with the pretty minimal devicetree
> > > > having just that cru. So not very invasive.
> > > > 
> > > > 
> > > > > This could be an inconvenience. I believe
> > > > > RK3288W is meant as a direct replacement for RK3288,
> > > > > so folks building products would expect to just use
> > > > > RK3288W, and not really bother with passing a
> > > > > different DTS or what not.
> > > > Not sure I follow. As below, I don't think boards will magically switch
> > > > between soc variants, so a boards devicetree should just include
> > > > the variant - especially as I don't really know how many
> > > > additional new boards we will see with it (rk3288 being quite old itself).
> > > > 
> > > It's not about new boards, any company does sells some RK32888-based product,
> > > will eventually want to produce some more.
> > > 
> > > If I understand correctly, RK3288W is the SoC that Rockchip is now offering,
> > > and not RK3288 anymore.
> 
> No, the RK3288 will continue to supply to the legacy projects which may 
> have a long contract with Rockchip,
> 
> and RK3288W is the recommend to use in all new project.
> 

I guess this means that if a company not having a long contract
wants to keep producing an RK3288-based product, it will have to
resort to RK3288W.

And IIRC, it's meant to be a direct replacement.
 
> > > So, if you have to produce another batch of _the same RK3288_ product,
> > > you'll have to use RK3288W. In other words, they would "just switch"
> > > between SoC variants.
> > > 
> > > In fact, such a case motivates these patches :-)
> > > 
> > > > > > I somehow don't expect boards to just switch between soc variants
> > > > > > on the fly.
> > > > > > 
> > > > > While I agree they are nasty, quirks like this
> > > > > are not uncommon.
> > > > > 
> > > > > > Also, doing things in mach-rockchip is not very future-proof:
> > > > > > 
> > > > > There is actually no reason to keep this in mach-rockchip, right?
> > > > > 
> > > > > The quirk could be placed in other places. For instance,
> > > > > directly in the clock driver.
> > > > Mapping the hdmi controller inside the clock driver to read some "random"
> > > > register that hopefully indicates an (undocumented) distinction between soc
> > > > variants.
> > > > 
> > > > Somehow just having that minimal devicetree for the "w" sounds
> > > > way cleaner ;-) .
> 
> I agree with Heiko on this.
> 
> What Rockchip done is:
> 
> - kernel is using "rockchip,rk3288w" compatible to identify rk3288w, 
> which is clean in kernel;
> 
> - kernel evb dts do not have compatible "rockchip,rk3288w" for we would 
> like to identify it dynamic in bootloader;
> 
> - We use U-Boot to identify the rk3288w with HDMI reg value, and pass it 
> to kernel via modify the
> 
>     dtb pass to kernel, so that we can support all kind of rockchip 
> customer projects with any kind of rk3288;
> 
> - For upstream kernel, it make sense to add "rockchip,rk3288w" in board 
> dts for which using rk3288w SoC.
> 

So you proposing to move this revision detection code
from the kernel to all the bootloaders (U-Boot is not the
only one, right?).

I understand that bootloaders are maybe less strict
to quirks like this, but OTOH this approach seems like
just movint things around, plus requiring now to update
two components, instead of just one.

And also, are we sure the bootloaders maintainers
will accept the quirk?

Thanks,
Ezequiel

 



