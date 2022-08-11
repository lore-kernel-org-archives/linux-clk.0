Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C00C19F2A
	for <linux-clk@archiver.kernel.org>; Thu, 11 Aug 2022 15:15:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234627AbiHKPPC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Aug 2022 11:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbiHKPPB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Aug 2022 11:15:01 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 755BC9082D
        for <linux-clk@vger.kernel.org>; Thu, 11 Aug 2022 08:14:59 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 186-20020a1c02c3000000b003a34ac64bdfso2875600wmc.1
        for <linux-clk@vger.kernel.org>; Thu, 11 Aug 2022 08:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=ETzSnvsiKes8csC/yvGahitYFBB+SSj8tmi8udpJ2XI=;
        b=V9l/bt1ojR/jAhCedAsWh28c8LGD/3iMTqf8kqcUFVZX3OME60OQapWL1RccNiKqou
         bedkVf+KtsOmgcWkpiVpcFikURI+kOlIRuIbs/9+rp/e21IcUvDN1QL0GusT54S2nUiZ
         q+UXTqwSNL8O2Hs91WzZPmJoquIvy3Hwk4rLAwU8G3AHBLiB1s8J/3fbQ/y1WW6ZWKdV
         f24KJiLuMh1tVKK21CrG9aEeCUjr7uxgM2JyBizTltbxjJUj8EKwmLlG4InieKMSJ6TH
         3oOU4RfRB03K+zQTfD10403opKofnagSRPt18coKu03V8EpZeBBukG7D7UZezNRGOxD+
         Qanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=ETzSnvsiKes8csC/yvGahitYFBB+SSj8tmi8udpJ2XI=;
        b=fb5v2fWhxnfXmqzToUsICLRnTrz2fXIhB/AkanrbUH7L9lQ32dmj3CIrxnEjM2opmY
         MsSUW8N0gGWMS8yntP3Cfdrk3B9QDG7pG5eeQtRq4swycECRtLrS7a07PvozEYyJoSL+
         8yaj6+U90q5UGZtFKAbGhuqLKzbcS2ajyKNXNjx8bM/4pRqzQM2XDxrWdZlUAN7NPqhW
         zk7wyxaPkHVjITUfUxI8NGxZM9VyD0/uGN2Kibbt0ygi983bj7+IJdKfFmQc5gLY9pvm
         meh+z5cMBBB29s/jyArSBzOH1ATaChgBXZuTdp0Az21t6POg4/sI0TPTt25g8rLoFfHu
         GIZQ==
X-Gm-Message-State: ACgBeo0Hzz8bnNK4NOouGFxacCC0E8fY/tOlKBpmBmMIyX94h0+Ko1vI
        V+tLDPfpDBZPWD5/jzrNawtLdw==
X-Google-Smtp-Source: AA6agR4HB+w35MSquox1T1EFcA0Wzlwlg6/sgNsPnwQpRdPsKME0msYdtWtsQlb/BkI3JwPwYiUp+A==
X-Received: by 2002:a1c:cc08:0:b0:3a5:1ffe:bdb4 with SMTP id h8-20020a1ccc08000000b003a51ffebdb4mr5725527wmb.188.1660230898019;
        Thu, 11 Aug 2022 08:14:58 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id g11-20020a5d698b000000b0021eff2ecb31sm20315671wru.95.2022.08.11.08.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 08:14:56 -0700 (PDT)
Date:   Thu, 11 Aug 2022 18:14:55 +0300
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
Message-ID: <YvUc71kz+S+wM2e3@linaro.org>
References: <20220625013235.710346-3-marex@denx.de>
 <YrnOTaLS2r7QBMNx@linaro.org>
 <66f689d9-a691-8bf6-62a2-48fac6eb3938@denx.de>
 <YrqxZFvKen7QybA9@linaro.org>
 <8d3fcbd9-2fd0-bf90-afa0-a21a79c81dbb@denx.de>
 <DU0PR04MB9417D9CE71ED2A72C5515D91889F9@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <e54590c4-7e94-0b97-9415-c970a170c6e1@denx.de>
 <YvUQMpfxjH+szgpx@linaro.org>
 <0255ea59-fb70-4dc6-6477-5531981366e1@denx.de>
 <YvUaKPkv3jWFVeAL@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvUaKPkv3jWFVeAL@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-08-11 18:03:04, Abel Vesa wrote:
> On 22-08-11 16:30:20, Marek Vasut wrote:
> > On 8/11/22 16:20, Abel Vesa wrote:
> > > On 22-08-04 11:31:33, Marek Vasut wrote:
> > > > On 8/4/22 11:13, Peng Fan wrote:
> > > > > > Subject: Re: [PATCH v3 3/6] clk: imx: imx8mp: Add audiomix block control
> > > > > > 
> > > > > > On 6/28/22 09:44, Abel Vesa wrote:
> > > > > > > On 22-06-27 18:23:33, Marek Vasut wrote:
> > > > > > > > On 6/27/22 17:35, Abel Vesa wrote:
> > > > > > > > > On 22-06-25 03:32:32, Marek Vasut wrote:
> > > > > > > > > > Unlike the other block control IPs in i.MX8M, the audiomix is
> > > > > > > > > > mostly a series of clock gates and muxes. Model it as a large
> > > > > > > > > > static table of gates and muxes with one exception, which is the
> > > > > > > > > > PLL14xx . The PLL14xx SAI PLL has to be registered separately.
> > > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > Again, there is a chance that the blk-ctrl driver might disable the
> > > > > > > > > PD from under this.
> > > > > > > > 
> > > > > > > > Can you elaborate a bit more on this ? How/why do you think so ?
> > > > > > > 
> > > > > > > At some point, the PDs from the Audiomix IP block will be added to the
> > > > > > > drivers/soc/imx/imx8mp-blk-ctrl.c. Then, you'll have 2 drivers with
> > > > > > > the same address range and the imx8mp-blk-ctrl also has runtime PM
> > > > > > enabled.
> > > > > > 
> > > > > > Why would the PDs be added into the block control driver?
> > > > > > 
> > > > > > The audiomix is purely a clock mux driver, not really a block control driver
> > > > > > providing PDs of its own.
> > > > > 
> > > > > I recalled that with with blk-ctrl working as clock provider, there is dead lock
> > > > > issue, if the blk-ctrl node has a power-domain entry. Not very sure.
> > > > 
> > > > How can I verify that ? Lockdep ?
> > > > 
> > > > I run this series for months and haven't seen a lock up or splat.
> > > 
> > > Audiomix (and every mix actually) has a PD. Once you add the PD, you'll
> > > end up with an ABBA deadlock between genpd lock and clock prepare lock.
> > 
> > Unlike the other mix drivers, this is a pure clock driver, not a power
> > domain driver. The PD is already available to this clock driver, see:
> > [PATCH v3 5/6] arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX
> 
> When you will enable the runtime PM for this driver, the deadlock is
> going to happen and it will be in some scenario like:
>     clk_disable_unused_subtree
>       -> clk_prepare (takes prepare lock) (for a clock from your driver)
> 	-> runtime pm (takes genpd lock)
> 	  -> clk_prepare (tries to take prepare lock again) (for the clock of the PD)
> 

Actually, I'm wrong, that is not a deadlock, but this one is:

[   11.667711][  T108] -> #1 (&genpd->mlock){+.+.}-{3:3}:
[   11.675041][  T108]        __lock_acquire+0xae4/0xef8
[   11.680093][  T108]        lock_acquire+0xfc/0x2f8
[   11.684888][  T108]        __mutex_lock+0x90/0x870
[   11.689685][  T108]        mutex_lock_nested+0x44/0x50
[   11.694826][  T108]        genpd_lock_mtx+0x18/0x24
[   11.699706][  T108]        genpd_runtime_resume+0x90/0x214 (hold genpd->mlock)
[   11.705194][  T108]        __rpm_callback+0x80/0x2c0
[   11.710160][  T108]        rpm_resume+0x468/0x650
[   11.714866][  T108]        __pm_runtime_resume+0x60/0x88
[   11.720180][  T108]        clk_pm_runtime_get+0x28/0x9c
[   11.725410][  T108]        clk_disable_unused_subtree+0x8c/0x144
[   11.731420][  T108]        clk_disable_unused_subtree+0x124/0x144
[   11.737518][  T108]        clk_disable_unused+0xa4/0x11c (hold prepare_lock)
[   11.742833][  T108]        do_one_initcall+0x98/0x178
[   11.747888][  T108]        do_initcall_level+0x9c/0xb8
[   11.753028][  T108]        do_initcalls+0x54/0x94
[   11.757736][  T108]        do_basic_setup+0x24/0x30
[   11.762614][  T108]        kernel_init_freeable+0x70/0xa4
[   11.768014][  T108]        kernel_init+0x14/0x18c
[   11.772722][  T108]        ret_from_fork+0x10/0x18

[   11.777512][  T108] -> #0 (prepare_lock){+.+.}-{3:3}:
[   11.784749][  T108]        check_noncircular+0x134/0x13c
[   11.790064][  T108]        validate_chain+0x590/0x2a04
[   11.795204][  T108]        __lock_acquire+0xae4/0xef8
[   11.800258][  T108]        lock_acquire+0xfc/0x2f8
[   11.805050][  T108]        __mutex_lock+0x90/0x870
[   11.809841][  T108]        mutex_lock_nested+0x44/0x50
[   11.814983][  T108]        clk_unprepare+0x5c/0x100 ((hold prepare_lock))
[   11.819864][  T108]        imx8m_pd_power_off+0xac/0x110
[   11.825179][  T108]        genpd_power_off+0x1b4/0x2dc
[   11.830318][  T108]        genpd_power_off_work_fn+0x38/0x58 (hold genpd->mlock)
[   11.835981][  T108]        process_one_work+0x270/0x444
[   11.841208][  T108]        worker_thread+0x280/0x4e4
[   11.846176][  T108]        kthread+0x13c/0x14

All it needs is the runtime PM in your current driver.

Bottom line is, we cannot have clock providers that have PDs that have
in turn their own clocks.

So we need to drop the blk_ctrl as clock providers and go with Lucas's
approach.

> > 
> > Can you please elaborate on the deadlock problem ?
> > Because really, I just don't see it.
> > 
> > Were you able to reproduce the deadlock with this driver ?
> > 
> > > Have a read here:
> > > 
> > > https://lore.kernel.org/lkml/160453833813.3965362.13967343909525787375@swboyd.mtv.corp.google.com/T/#m0160265b0604ac8a524fedae7845e9f60bae67ef
> > 
> > Which part of the lengthy thread do you refer to ? I suspect the 'permalink'
> > might help pointing to specific email in the thread.
> > 
> > Note that the aforementioned thread discusses the other mix drivers which
> > are PDs, this driver is not, there is a difference.
