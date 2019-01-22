Return-Path: <SRS0=Mnuj=P6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39945C282C4
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 14:50:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 055E721019
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 14:50:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Wqp8bxnc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbfAVOuB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jan 2019 09:50:01 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:35008 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728353AbfAVOuA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Jan 2019 09:50:00 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id AEFEE25BEB5;
        Wed, 23 Jan 2019 01:49:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548168596; bh=3gDzWs2d9KB8z32tWySHwF7o35EOlUcDuRA5II5u8rA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wqp8bxncIbe0/gd5t9Lsj3nbDIL3L/VsgD8eKDG9l69wErkCCcJIwCXY7yWGEKGfi
         BngXZW0F9BH94oe1FwlLVrHDRsEqfbms/JHvMtAKTsbNn2khCGs6AIk3Ac+fcA9Mq/
         fs2YI6nX4s21YiU4PmmnjsMcdfrHW5P0S5wIJwOs=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 97C62E2146E; Tue, 22 Jan 2019 15:49:53 +0100 (CET)
Date:   Tue, 22 Jan 2019 15:49:53 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Chris Paterson <Chris.Paterson2@renesas.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <treding@nvidia.com>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Johan Hovold <johan@kernel.org>,
        Lukasz Majewski <lukma@denx.de>,
        Michal Simek <monstr@monstr.eu>,
        Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Ben Whitten <ben.whitten@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
Subject: Re: [PATCH 02/11] dt-bindings: arm: renesas: Add si-linux cat87[45]
 boards
Message-ID: <20190122144953.sevb3flzky6ja23r@verge.net.au>
References: <1547663874-29411-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547663874-29411-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190117105107.dtuttem7x7ovaey2@verge.net.au>
 <TYAPR01MB2285EAE232CCADD7FB95E712B7830@TYAPR01MB2285.jpnprd01.prod.outlook.com>
 <20190117125912.y77powezi74rjtf7@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190117125912.y77powezi74rjtf7@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 17, 2019 at 01:59:12PM +0100, Simon Horman wrote:
> On Thu, Jan 17, 2019 at 12:32:37PM +0000, Chris Paterson wrote:
> > Hello Simon,
> > 
> > > From: Simon Horman <horms@verge.net.au>
> > > Sent: 17 January 2019 10:51
> > > 
> > > On Wed, Jan 16, 2019 at 06:37:45PM +0000, Fabrizio Castro wrote:
> > > > This patch adds board cat874 (powered by the RZ/G2E) and board
> > > > cat875 (that sits on top of cat874). Both boards are made by
> > > > Silicon Linux.
> > > >
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/arm/renesas.yaml | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml
> > > b/Documentation/devicetree/bindings/arm/renesas.yaml
> > > > index 5e9d486..9e1e07b 100644
> > > > --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> > > > +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> > > > @@ -108,6 +108,14 @@ properties:
> > > >
> > > >        - description: RZ/G2E (R8A774C0)
> > > >          items:
> > > > +          - enum:
> > > > +              - si-linux,cat874 # Silicon Linux RZ/G2E 96board platform (CAT874)
> > > 
> > > Can I confirm that "96board platform" is correct for this board - I don't
> > > see it in the documentation I have, but that may not mean much.
> > 
> > The board follows the extended version of the Linaro 96board consumer edition (CE) specification [1].
> > 
> > You can see a pretty picture of the board on the CIP Blog [2].
> > 
> > [1] https://www.96boards.org/specifications/
> > [2] https://www.cip-project.org/blog/2018/10/23/renesas-rz-g2m-96ce-board-adopted-as-arm64-reference-board-for-the-next-cip-slts-kernel
> 
> Thanks Chris, in that case I am fine with this patch.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> > > That aside, I'd like to wait for Rob to indicate if he will accept
> > > patch 1, which adds si-linux as a vendor, before I apply this patch.

It appears that the use of si-linux as a vendor name.
Accordingly I have applied this patch for v5.1.

...
