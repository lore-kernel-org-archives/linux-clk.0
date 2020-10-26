Return-Path: <SRS0=xpy6=EB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D1DC4363A
	for <linux-clk@archiver.kernel.org>; Mon, 26 Oct 2020 02:55:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7DD732224A
	for <linux-clk@archiver.kernel.org>; Mon, 26 Oct 2020 02:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603680919;
	bh=gb1WbQt5E9LHrMjJFx5SqW0vqDsqYEv3z3FfTwdd/TI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=gDkhfQEn/2iHew5aNCJYrhW8BKoCS7NZV1bd2+5Udx8lxMR3WA/pBrqMIV6zGhTFE
	 TMg7mYnFF3z+qvTAWKKn9GQROffmU6bjGk/1ckGs1Wb3Lppne2XmlRK4laBVLfxSmg
	 eNtfqE7Vux+B2gJiKqcE+Go8CkKgcyRVNhCFs+0Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1420361AbgJZCzT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Oct 2020 22:55:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:50548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389379AbgJZCzT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 25 Oct 2020 22:55:19 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B9E5A2222C;
        Mon, 26 Oct 2020 02:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603680918;
        bh=gb1WbQt5E9LHrMjJFx5SqW0vqDsqYEv3z3FfTwdd/TI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pNPyupL6jT8xa3CJ0GW8npamD0igQX3FI/h6zWxvBZlDwJfMLFHyg2xAEOfpgI24u
         20b0Lr1WDcuigBx0Eb6aIJFkDslsqC39ou65Lxq8PQyhJFwU4gReXsyr02f05U79I8
         FvwNwRCzqrEtUOr1Vcj5HzNAup4rbUacEJON0Erc=
Date:   Mon, 26 Oct 2020 10:55:12 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sboyd@kernel.org, mturquette@baylibre.com, fabio.estevam@nxp.com,
        linux-imx@nxp.com, kernel@pengutronix.de
Subject: Re: [PATCH v7 00/11] clk: imx8: add new clock binding for better pm
 support
Message-ID: <20201026025512.GD9880@dragon>
References: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jul 29, 2020 at 04:00:07PM +0800, Dong Aisheng wrote:
> This patch series is a preparation for the MX8 Architecture improvement.
> As for IMX SCU based platforms like MX8QM and MX8QXP, they are comprised
> of a couple of SS(Subsystems) while most of them within the same SS
> can be shared. e.g. Clocks, Devices and etc.
> 
> However, current clock binding is using SW IDs for device tree to use
> which can cause troubles in writing the common <soc>-ss-xx.dtsi file for
> different SoCs.
> 
> This patch series aims to introduce a new binding which is more close to
> hardware and platform independent and can makes us write a more general
> drivers for different SCU based SoCs.
> 
> Another important thing is that on MX8, each Clock resource is associated
> with a power domain. So we have to attach that clock device to the power
> domain in order to make it work properly. Further more, the clock state
> will be lost when its power domain is completely off during suspend/resume,
> so we also introduce the clock state save&restore mechanism.
> 
> It's based on latest shanw/for-next branch.
> 
> The top commit is:
> 3c1a41dab7b8 Merge branch 'imx/defconfig' into for-next
> 
> ChangeLog:
> v6->v7:
>  * addressed all comments from Stephen
>  * rebased to latest shawn/for-next
> v5->v6:
>  * add scu clk unregister if add provider failed
> v4->v5:
>  * Address all comments from Stephen
> v3->v4:
>  * use clk-indices for LPCG to fetch each clks offset from dt
> v2->v3:
>  * change scu clk into two cells binding
>  * add clk pm patches to ease the understand of the changes
> v1->v2:
>  * SCU clock changed to one cell clock binding inspired by arm,scpi.txt
>    Documentation/devicetree/bindings/arm/arm,scpi.txt
>  * Add required power domain property
>  * Dropped PATCH 3&4 first, will send the updated version accordingly
>    after the binding is finally determined,
> 
> Dong Aisheng (11):
>   dt-bindings: firmware: imx-scu: new binding to parse clocks from
>     device tree
>   dt-bindings: clock: imx-lpcg: add support to parse clocks from device
>     tree
>   clk: imx: scu: add two cells binding support
>   clk: imx: scu: bypass cpu power domains
>   clk: imx: scu: allow scu clk to take device pointer
>   clk: imx: scu: add runtime pm support
>   clk: imx: scu: add suspend/resume support
>   clk: imx: imx8qxp-lpcg: add parsing clocks from device tree
>   clk: imx: lpcg: allow lpcg clk to take device pointer
>   clk: imx: clk-imx8qxp-lpcg: add runtime pm support
>   clk: imx: lpcg: add suspend/resume support

Applied all, thanks.
