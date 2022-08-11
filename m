Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA9CC19F2A
	for <linux-clk@archiver.kernel.org>; Thu, 11 Aug 2022 14:20:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234479AbiHKOUl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Aug 2022 10:20:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234759AbiHKOUk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Aug 2022 10:20:40 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 868173718F
        for <linux-clk@vger.kernel.org>; Thu, 11 Aug 2022 07:20:38 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id v3so21604749wrp.0
        for <linux-clk@vger.kernel.org>; Thu, 11 Aug 2022 07:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=oAu4rLsbkfwY0q195xrm4U9G4+iut3PY+RfEWpIsPVs=;
        b=lwjPirfCqMGdjC3h1qmd0+XKzNujCVDdOkcCPPem0rMqbQsiqhWYXRnXF5HCEOq382
         VuIrNaNIMc5vouhGmvxtcJdOGPDqsIrMeMj6jXNjpkHmKQ7PPLHIlPQCBilMWyM3mVNU
         SGIywhQpgJTuYx4KqcMT8XYxu7isulLCPuFUyCjvWykh7vYPjXaGuihgVGFEQtgsV45+
         JwPf+oKSIu7DdpwVe/VHIaem7UtCSKEuUwem8adwWMYItYsUS2so/WhNJXYqOxleCWGy
         5tBdFAvx53dI6IVOljqJ13DFgbCC+QfZpnIc8B32IfzDhOPPp8b6hm8DC7pJOrN1s/10
         lQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=oAu4rLsbkfwY0q195xrm4U9G4+iut3PY+RfEWpIsPVs=;
        b=lfDMan7yQOY1Rlc5+fYldwoM98n+qFx4t0yC6nVb/SfdMBtKJN+bROiHntcGt8m7hr
         DZtvEMYWGgemO9VQM6eOvPwLxUTGF3mLZVU8Cn0FzMqe3F+7JSQEaNeYdVlkRYJStvlL
         teCoWMatUodOzzDv38M4bclJ4EaSohMueX5zSgSuZes/02U6KZMRrkfwXUQf6R+Tm9Wn
         NpbFjLYtR/A48wL4BfTS5YjE4QBlQejOBAwH6UaRHhWdnEt1UOZm3+7hW+nK2IQlJ0Uw
         zZWb0I9Rom605CYIonkPlz7xn0TwFw8dv8pqinrYp/GBqDWEbNnvz/TlRj+YgWV7UKv8
         aKWg==
X-Gm-Message-State: ACgBeo3GEl8FzktFMzu+p310HjFhNNK+XCehTid2Cp8QbivDGkEw8oG2
        VljCTTy5L8zCvBr2R12S/JuMSQ==
X-Google-Smtp-Source: AA6agR5cGTbrD/weV7svfRSaI2vnprahyiRZQ7HmEhOAMRH8epMF9O8uFZJkHA91jPmED3rXoelJqA==
X-Received: by 2002:a5d:5581:0:b0:20f:fc51:7754 with SMTP id i1-20020a5d5581000000b0020ffc517754mr21071168wrv.413.1660227637035;
        Thu, 11 Aug 2022 07:20:37 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id y12-20020adfd08c000000b00220592005edsm19079749wrh.85.2022.08.11.07.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 07:20:36 -0700 (PDT)
Date:   Thu, 11 Aug 2022 17:20:34 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Marek Vasut <marex@denx.de>
Cc:     Peng Fan <peng.fan@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Abel Vesa <abel.vesa@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v3 3/6] clk: imx: imx8mp: Add audiomix block control
Message-ID: <YvUQMpfxjH+szgpx@linaro.org>
References: <20220625013235.710346-1-marex@denx.de>
 <20220625013235.710346-3-marex@denx.de>
 <YrnOTaLS2r7QBMNx@linaro.org>
 <66f689d9-a691-8bf6-62a2-48fac6eb3938@denx.de>
 <YrqxZFvKen7QybA9@linaro.org>
 <8d3fcbd9-2fd0-bf90-afa0-a21a79c81dbb@denx.de>
 <DU0PR04MB9417D9CE71ED2A72C5515D91889F9@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <e54590c4-7e94-0b97-9415-c970a170c6e1@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e54590c4-7e94-0b97-9415-c970a170c6e1@denx.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-08-04 11:31:33, Marek Vasut wrote:
> On 8/4/22 11:13, Peng Fan wrote:
> > > Subject: Re: [PATCH v3 3/6] clk: imx: imx8mp: Add audiomix block control
> > > 
> > > On 6/28/22 09:44, Abel Vesa wrote:
> > > > On 22-06-27 18:23:33, Marek Vasut wrote:
> > > > > On 6/27/22 17:35, Abel Vesa wrote:
> > > > > > On 22-06-25 03:32:32, Marek Vasut wrote:
> > > > > > > Unlike the other block control IPs in i.MX8M, the audiomix is
> > > > > > > mostly a series of clock gates and muxes. Model it as a large
> > > > > > > static table of gates and muxes with one exception, which is the
> > > > > > > PLL14xx . The PLL14xx SAI PLL has to be registered separately.
> > > > > > > 
> > > > > > 
> > > > > > Again, there is a chance that the blk-ctrl driver might disable the
> > > > > > PD from under this.
> > > > > 
> > > > > Can you elaborate a bit more on this ? How/why do you think so ?
> > > > 
> > > > At some point, the PDs from the Audiomix IP block will be added to the
> > > > drivers/soc/imx/imx8mp-blk-ctrl.c. Then, you'll have 2 drivers with
> > > > the same address range and the imx8mp-blk-ctrl also has runtime PM
> > > enabled.
> > > 
> > > Why would the PDs be added into the block control driver?
> > > 
> > > The audiomix is purely a clock mux driver, not really a block control driver
> > > providing PDs of its own.
> > 
> > I recalled that with with blk-ctrl working as clock provider, there is dead lock
> > issue, if the blk-ctrl node has a power-domain entry. Not very sure.
> 
> How can I verify that ? Lockdep ?
> 
> I run this series for months and haven't seen a lock up or splat.

Audiomix (and every mix actually) has a PD. Once you add the PD, you'll
end up with an ABBA deadlock between genpd lock and clock prepare lock.

Have a read here:

https://lore.kernel.org/lkml/160453833813.3965362.13967343909525787375@swboyd.mtv.corp.google.com/T/#m0160265b0604ac8a524fedae7845e9f60bae67ef
