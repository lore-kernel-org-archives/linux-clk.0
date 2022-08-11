Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4992C19F2A
	for <linux-clk@archiver.kernel.org>; Thu, 11 Aug 2022 15:03:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234706AbiHKPDN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Aug 2022 11:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbiHKPDJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Aug 2022 11:03:09 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4844A2B242
        for <linux-clk@vger.kernel.org>; Thu, 11 Aug 2022 08:03:08 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id l4so21623198wrm.13
        for <linux-clk@vger.kernel.org>; Thu, 11 Aug 2022 08:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=vQK3cje1YW6RQJgjcy3d9bgWRuIOhioPF24vfhnMEIg=;
        b=XoF5O9uH+oXYAGTj0NjjT9vsU3ZggE4sW8IKVohxPNDNUNnXtWQUZgfn2Cc6UHlN2W
         etGIYSSES6be94jhNJ6JDVXlEfDkODHW9zudQVgKvYYtIoTQwrFvvnZX/kz+lx6+KCcg
         tg2Rg6ymo3t2f0Fy3HVYx06Pp8lVOSqf0Tt3g2CO0PRa5DxzTDxvEKoF0FtY7ADGd/db
         EfKWkVlLKau3TSvju8OJfwK/zZx01HyzRxwkF50Skv2cvVAMv/pjo04UAGIWm/VtNWrP
         np7Y91gjCXsLUOZfDEGELbsGRwSnzwvquwO/SpUvpTJ+jo13MrHam47eEu+ZeH18PzKD
         cTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=vQK3cje1YW6RQJgjcy3d9bgWRuIOhioPF24vfhnMEIg=;
        b=7xmOPTkPmU8sMKLf5Un8kg7vLZO2g2YwtT8jSlgG+2qeOUY8MmI/4rvOK2QgNQdbnQ
         lbcPsUy4HDrz+MT/oP/cfkaEfvg5sk1ky2rbrVKaF7sC9/nX0bbEVkPgHOCJ0XJoJgwV
         cpgx9pwuTcDGvIZoCfHPT8upcj3eaAAQAnc01uk/I9rTKXKTPzZH8zG5wOxSo2nc5Sgy
         7cDtFXen9WBakiQ+J3L4/qnwdK85mUKk6fIn6SMNNKxgwIsnEglJLXk1r47Gi2YMb3NK
         0s1bbvAz23eJQuBPMDK84vpAcEHzE54EWirptjIXoOt5yCKw5aly+Q7CKVx3HAiskW22
         ktpw==
X-Gm-Message-State: ACgBeo2OPhpV1l5Dcy0bAhHBRX5O7xJeWYA7U1E4qOpR6eeV8dCjCgsV
        g0ROxvlXZAlXcOy9kwsc1TLrhw==
X-Google-Smtp-Source: AA6agR6803pgzvPz7ylnUdMiBJ44dkMy17yJHE0FnHC+xf8HInDR4IwyEzQ6dWUZvnJICTtIpqWVDQ==
X-Received: by 2002:a5d:61d0:0:b0:220:839f:dc95 with SMTP id q16-20020a5d61d0000000b00220839fdc95mr19739950wrv.241.1660230186709;
        Thu, 11 Aug 2022 08:03:06 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id a23-20020a1cf017000000b003a53de38c0dsm8231802wmb.14.2022.08.11.08.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 08:03:05 -0700 (PDT)
Date:   Thu, 11 Aug 2022 18:03:04 +0300
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
Message-ID: <YvUaKPkv3jWFVeAL@linaro.org>
References: <20220625013235.710346-1-marex@denx.de>
 <20220625013235.710346-3-marex@denx.de>
 <YrnOTaLS2r7QBMNx@linaro.org>
 <66f689d9-a691-8bf6-62a2-48fac6eb3938@denx.de>
 <YrqxZFvKen7QybA9@linaro.org>
 <8d3fcbd9-2fd0-bf90-afa0-a21a79c81dbb@denx.de>
 <DU0PR04MB9417D9CE71ED2A72C5515D91889F9@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <e54590c4-7e94-0b97-9415-c970a170c6e1@denx.de>
 <YvUQMpfxjH+szgpx@linaro.org>
 <0255ea59-fb70-4dc6-6477-5531981366e1@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0255ea59-fb70-4dc6-6477-5531981366e1@denx.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-08-11 16:30:20, Marek Vasut wrote:
> On 8/11/22 16:20, Abel Vesa wrote:
> > On 22-08-04 11:31:33, Marek Vasut wrote:
> > > On 8/4/22 11:13, Peng Fan wrote:
> > > > > Subject: Re: [PATCH v3 3/6] clk: imx: imx8mp: Add audiomix block control
> > > > > 
> > > > > On 6/28/22 09:44, Abel Vesa wrote:
> > > > > > On 22-06-27 18:23:33, Marek Vasut wrote:
> > > > > > > On 6/27/22 17:35, Abel Vesa wrote:
> > > > > > > > On 22-06-25 03:32:32, Marek Vasut wrote:
> > > > > > > > > Unlike the other block control IPs in i.MX8M, the audiomix is
> > > > > > > > > mostly a series of clock gates and muxes. Model it as a large
> > > > > > > > > static table of gates and muxes with one exception, which is the
> > > > > > > > > PLL14xx . The PLL14xx SAI PLL has to be registered separately.
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > Again, there is a chance that the blk-ctrl driver might disable the
> > > > > > > > PD from under this.
> > > > > > > 
> > > > > > > Can you elaborate a bit more on this ? How/why do you think so ?
> > > > > > 
> > > > > > At some point, the PDs from the Audiomix IP block will be added to the
> > > > > > drivers/soc/imx/imx8mp-blk-ctrl.c. Then, you'll have 2 drivers with
> > > > > > the same address range and the imx8mp-blk-ctrl also has runtime PM
> > > > > enabled.
> > > > > 
> > > > > Why would the PDs be added into the block control driver?
> > > > > 
> > > > > The audiomix is purely a clock mux driver, not really a block control driver
> > > > > providing PDs of its own.
> > > > 
> > > > I recalled that with with blk-ctrl working as clock provider, there is dead lock
> > > > issue, if the blk-ctrl node has a power-domain entry. Not very sure.
> > > 
> > > How can I verify that ? Lockdep ?
> > > 
> > > I run this series for months and haven't seen a lock up or splat.
> > 
> > Audiomix (and every mix actually) has a PD. Once you add the PD, you'll
> > end up with an ABBA deadlock between genpd lock and clock prepare lock.
> 
> Unlike the other mix drivers, this is a pure clock driver, not a power
> domain driver. The PD is already available to this clock driver, see:
> [PATCH v3 5/6] arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX

When you will enable the runtime PM for this driver, the deadlock is
going to happen and it will be in some scenario like:
    clk_disable_unused_subtree
      -> clk_prepare (takes prepare lock) (for a clock from your driver)
	-> runtime pm (takes genpd lock)
	  -> clk_prepare (tries to take prepare lock again) (for the clock of the PD)

> 
> Can you please elaborate on the deadlock problem ?
> Because really, I just don't see it.
> 
> Were you able to reproduce the deadlock with this driver ?
> 
> > Have a read here:
> > 
> > https://lore.kernel.org/lkml/160453833813.3965362.13967343909525787375@swboyd.mtv.corp.google.com/T/#m0160265b0604ac8a524fedae7845e9f60bae67ef
> 
> Which part of the lengthy thread do you refer to ? I suspect the 'permalink'
> might help pointing to specific email in the thread.
> 
> Note that the aforementioned thread discusses the other mix drivers which
> are PDs, this driver is not, there is a difference.
