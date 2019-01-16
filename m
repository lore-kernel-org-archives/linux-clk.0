Return-Path: <SRS0=O/eU=PY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2ABFC43387
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jan 2019 11:02:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 767FD20859
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jan 2019 11:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547636563;
	bh=QLhLCxeA4QZjFn1gUqzDY/Nse0vqxvXw4fNn68EKHiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=rA4N1vF4g7MKQkbAp+2lx5kZR7+a7jVT8PLq3rcWqk6ed1alZP+EVBwJRZY2R5oCz
	 0dUmDGQcKyDV1r0Ugv2lJALlOgA2Js/y/poZSDx+wRw703oTov+6Ifd7dLoIYYG2+n
	 nPJvfQn41HB0IqqGSw0GGrSgC5MQTr8iFy0KtAFU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389534AbfAPLCn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Jan 2019 06:02:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:34368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732555AbfAPLCn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 16 Jan 2019 06:02:43 -0500
Received: from dragon (61-216-91-114.HINET-IP.hinet.net [61.216.91.114])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 28FF620657;
        Wed, 16 Jan 2019 11:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1547636562;
        bh=QLhLCxeA4QZjFn1gUqzDY/Nse0vqxvXw4fNn68EKHiw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n8WSX+Cdw8VtGJigfrwtwCupx9wXHDDituNFtzfWcDsb6XClZc8sWjTLRc0e07bh0
         uZtkSjjxq3dMOP/8dbIh3+UlOmXRZVcj75G9HvZg30x6cg5cgRiphNbheWK9CIbJKe
         ZQFHE6Zh5Oow5hm2d5KaYLGWpkn7BaI0492K5HUg=
Date:   Wed, 16 Jan 2019 19:02:17 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH RESEND v1 0/4] dt-binding: clk: prepare for imx8qm clock
 support
Message-ID: <20190116110216.GN15808@dragon>
References: <1547207400-28307-1-git-send-email-aisheng.dong@nxp.com>
 <AM0PR04MB42115D3E98B8B319936AC60E80820@AM0PR04MB4211.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR04MB42115D3E98B8B319936AC60E80820@AM0PR04MB4211.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jan 16, 2019 at 05:40:01AM +0000, Aisheng Dong wrote:
> Ping...
> 
> BTW, as the first two patches change the same firmware binding doc fs.scu.txt.
> I'm not sure whether it should go to Shawn's tree for the binding part, or Stephen's clock tree.
> 
> Shawn & Stephen,
> What's your suggestion?

I can apply the first two to my tree as long as Rob and Stephen ack on
them.

Shawn

> 
> Regards
> Dong Aisheng
> 
> > From: Aisheng Dong [mailto:aisheng.dong@nxp.com]
> > Sent: Friday, January 11, 2019 7:56 PM
> > 
> > After a bit more investigation on IMX8QM, it seemed SCU clock can be used in
> > a similar way as IMX8QXP. So update the binding and driver to be a bit generic
> > for easily extension of IMX8QM support later.
> > 
> > Dong Aisheng (4):
> >   dt-bindings: fsl: scu: add fallback compatible string for clock
> >   dt-bindings: fsl: scu: add imx8qm scu clock support
> >   clk: imx: scu: add fallback compatible string support
> >   dt-bindings: imx8-clock: add a53 and a72 clock id
> > 
> >  Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 7 +++++--
> >  drivers/clk/imx/clk-imx8qxp.c                               | 1 +
> >  include/dt-bindings/clock/imx8-clock.h                      | 6 ++++--
> >  3 files changed, 10 insertions(+), 4 deletions(-)
> > 
> > --
> > 2.7.4
> 
