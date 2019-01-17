Return-Path: <SRS0=NuDk=PZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470F6C43387
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 13:12:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 14FDA20652
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 13:12:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="CWWZ+bvN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728244AbfAQNMD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jan 2019 08:12:03 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:34150 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbfAQNMD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Jan 2019 08:12:03 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2777D25B7E8;
        Fri, 18 Jan 2019 00:11:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547730719; bh=fTFi3yJMHb3fufpa3KR8Li76A6adNKw9txxmjJskzBY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CWWZ+bvNXwtcg6qDBjyLL15vc7KW5/wcioSgm5XuoDJ/E1ktLHmRPhIU7qmFcbfD+
         Y4cWg2yHUgwL1OvDvlOZb7VxiY66NnfZBNI11oJ1hc5/+0444dFxNMPark86Zmn0/4
         87tyl1DBUrTZJa0FePLGYIi65a3ChVIn3Ej6Ed/4=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 13DAA940459; Thu, 17 Jan 2019 14:11:57 +0100 (CET)
Date:   Thu, 17 Jan 2019 14:11:57 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
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
        Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-can@vger.kernel.org, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>,
        ebiharaml@si-linux.co.jp
Subject: Re: [PATCH v2 08/11] clk: renesas: r8a774c0: Add missing CANFD clock
Message-ID: <20190117131156.eq7zh3y5e6koueos@verge.net.au>
References: <1547667945-5588-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1547667945-5588-1-git-send-email-fabrizio.castro@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jan 16, 2019 at 07:45:45PM +0000, Fabrizio Castro wrote:
> This patch adds the missing CANFD clock to the r8a774c0 specific
> clock driver.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> 
> ---
> The relevant documentation should appear in the next version
> of the HW User's manual
> 
> v1->v2:
> * appended R8A774C0_CLK_CANFD as per Geert's comment


Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

