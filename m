Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38887C19F2A
	for <linux-clk@archiver.kernel.org>; Thu, 11 Aug 2022 17:12:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236185AbiHKRMn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Aug 2022 13:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236049AbiHKRM1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Aug 2022 13:12:27 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B83181A808
        for <linux-clk@vger.kernel.org>; Thu, 11 Aug 2022 09:51:57 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id z16so21923747wrh.12
        for <linux-clk@vger.kernel.org>; Thu, 11 Aug 2022 09:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=SFxEksE2XS5sPTWpIrVAk+v9LrXMBOEgsU+KG0qKIyY=;
        b=r0hD3Q6bOJgFNfGXc3f+wbdJdOsQNQJlK9T0Cbk8mbgtdC5YXUCGvy6tpSLPbcMiLz
         fwZlk8AQYiz97mRvTUml3bkYERf9/oP013iDIeM7Du4sA3DDc5u3AhY0j74JqVoYEVDd
         8p9w67uRINhI4mXAoIq4tDLjVQ7/aWHGAKwcl1Y0iVWrtNOL63L+BEPimO0S2N5n3CI4
         peWsQqz7JJ81xmF5eO08enfunCCDviG23hDLwuUyzfzxRqCYj8l+kVOcjIyJ2fE2OffR
         xwjU0QFI0y2asrbmMTD1S3dP/t/vwxYkjizsT5O8IetYrFYkQEwGi8eJKVtMwzB8QCSc
         7KkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=SFxEksE2XS5sPTWpIrVAk+v9LrXMBOEgsU+KG0qKIyY=;
        b=2U8Gpt/UOz+IHR0YRny7WJo/8k7NtJTER3OUvuD5OKCSsTooqXwP/ehDyJZIroqcVs
         8XdtzndKvgak6cLoqypAJToK6U1AVdqFpsKPVZI7H3FqoDUJJ5yMnm5XLdwPEQoG+vh/
         z9wP8Dw6OH9BE0WA+JMa9DPduRfD/HeeU2xBeCr50/ip4adJzAlw79eFdYajvIkO6bMI
         9lWdKduHLWg+wU2Q7SHPUHm6Kx4xSW9Ugl2UMrweX5FdwHpozylQtIoBd83jZYx2vZNG
         A3oFlZ94iBtEU87x8DFO5zUKXWHl46QDB+j12bQtgs1awXrQe5sCsgusksd9dKZe8M28
         rZgw==
X-Gm-Message-State: ACgBeo3tFTMTTw1vCOcxdGB+XtnSiOoJTjdnxbNi7msLIwd3wOnp+s1D
        VetrabSgwVZHf3/4qv5xDlTQyg==
X-Google-Smtp-Source: AA6agR55jytdesfttuX9FiyyIrdDTFOmkAWH8Dtj8DUkvdDVnF1nrYOD3+J2/85m0xDOkmzklvFT6w==
X-Received: by 2002:a5d:48c8:0:b0:21e:5134:c78c with SMTP id p8-20020a5d48c8000000b0021e5134c78cmr20253728wrs.233.1660236716254;
        Thu, 11 Aug 2022 09:51:56 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id l21-20020a1ced15000000b0039747cf8354sm6383509wmh.39.2022.08.11.09.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 09:51:55 -0700 (PDT)
Date:   Thu, 11 Aug 2022 19:51:54 +0300
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
Message-ID: <YvUzqojzlc3HqXGo@linaro.org>
References: <YrnOTaLS2r7QBMNx@linaro.org>
 <66f689d9-a691-8bf6-62a2-48fac6eb3938@denx.de>
 <YrqxZFvKen7QybA9@linaro.org>
 <8d3fcbd9-2fd0-bf90-afa0-a21a79c81dbb@denx.de>
 <DU0PR04MB9417D9CE71ED2A72C5515D91889F9@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <e54590c4-7e94-0b97-9415-c970a170c6e1@denx.de>
 <YvUQMpfxjH+szgpx@linaro.org>
 <0255ea59-fb70-4dc6-6477-5531981366e1@denx.de>
 <YvUaKPkv3jWFVeAL@linaro.org>
 <9e56dc70-e489-7288-784c-289da9325ed1@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e56dc70-e489-7288-784c-289da9325ed1@denx.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-08-11 18:38:49, Marek Vasut wrote:
> On 8/11/22 17:03, Abel Vesa wrote:
> > On 22-08-11 16:30:20, Marek Vasut wrote:
> > > On 8/11/22 16:20, Abel Vesa wrote:
> > > > On 22-08-04 11:31:33, Marek Vasut wrote:
> > > > > On 8/4/22 11:13, Peng Fan wrote:
> > > > > > > Subject: Re: [PATCH v3 3/6] clk: imx: imx8mp: Add audiomix block control
> > > > > > > 
> > > > > > > On 6/28/22 09:44, Abel Vesa wrote:
> > > > > > > > On 22-06-27 18:23:33, Marek Vasut wrote:
> > > > > > > > > On 6/27/22 17:35, Abel Vesa wrote:
> > > > > > > > > > On 22-06-25 03:32:32, Marek Vasut wrote:
> > > > > > > > > > > Unlike the other block control IPs in i.MX8M, the audiomix is
> > > > > > > > > > > mostly a series of clock gates and muxes. Model it as a large
> > > > > > > > > > > static table of gates and muxes with one exception, which is the
> > > > > > > > > > > PLL14xx . The PLL14xx SAI PLL has to be registered separately.
> > > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > Again, there is a chance that the blk-ctrl driver might disable the
> > > > > > > > > > PD from under this.
> > > > > > > > > 
> > > > > > > > > Can you elaborate a bit more on this ? How/why do you think so ?
> > > > > > > > 
> > > > > > > > At some point, the PDs from the Audiomix IP block will be added to the
> > > > > > > > drivers/soc/imx/imx8mp-blk-ctrl.c. Then, you'll have 2 drivers with
> > > > > > > > the same address range and the imx8mp-blk-ctrl also has runtime PM
> > > > > > > enabled.
> > > > > > > 
> > > > > > > Why would the PDs be added into the block control driver?
> > > > > > > 
> > > > > > > The audiomix is purely a clock mux driver, not really a block control driver
> > > > > > > providing PDs of its own.
> > > > > > 
> > > > > > I recalled that with with blk-ctrl working as clock provider, there is dead lock
> > > > > > issue, if the blk-ctrl node has a power-domain entry. Not very sure.
> > > > > 
> > > > > How can I verify that ? Lockdep ?
> > > > > 
> > > > > I run this series for months and haven't seen a lock up or splat.
> > > > 
> > > > Audiomix (and every mix actually) has a PD. Once you add the PD, you'll
> > > > end up with an ABBA deadlock between genpd lock and clock prepare lock.
> > > 
> > > Unlike the other mix drivers, this is a pure clock driver, not a power
> > > domain driver. The PD is already available to this clock driver, see:
> > > [PATCH v3 5/6] arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX
> > 
> > When you will enable the runtime PM for this driver, the deadlock is
> > going to happen and it will be in some scenario like:
> >      clk_disable_unused_subtree
> >        -> clk_prepare (takes prepare lock) (for a clock from your driver)
> > 	-> runtime pm (takes genpd lock)
> > 	  -> clk_prepare (tries to take prepare lock again) (for the clock of the PD)
> 
> Since you seem to have a test case, can you share the test case, verbatim,
> so I can reproduce it locally ?

I do not have a test case, but we do have a prior experience with this
happening.

> 
> I seem to be asking for that repeatedly and I am not getting any clear
> answer.

I do not have a board to test on anymore.

But anyway, lets apply it and if there is a problem, we can figure it
out later.

> 
> > > Can you please elaborate on the deadlock problem ?
> > > Because really, I just don't see it.
> > > 
> > > Were you able to reproduce the deadlock with this driver ?
> 
> [...]
