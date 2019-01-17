Return-Path: <SRS0=NuDk=PZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49ADCC43387
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 10:51:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1889E20657
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 10:51:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="CyrunIee"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727709AbfAQKvN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jan 2019 05:51:13 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:59740 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbfAQKvN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Jan 2019 05:51:13 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 122A725B760;
        Thu, 17 Jan 2019 21:51:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547722269; bh=0HHBmFWcXgQw5fADbstoNnmbUbjDsBJYBjzH3v7471A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CyrunIeehIVTPEO3SWSuvBkSf338Hl4xFBLCz8+r/TE4QRUgwPF6NEIM/Ui2YYGmK
         BvMst1Nz1uOSBAdmiMhEBc/qGfOvLMdV4AR9Y5rcEMwIJCjqxEiXnzg60geaBrRjDh
         E5C8DcvN4Wvz64ARbGTFzSM0I3zZuNPKsll62mrM=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 5B25B940459; Thu, 17 Jan 2019 11:51:07 +0100 (CET)
Date:   Thu, 17 Jan 2019 11:51:07 +0100
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
Subject: Re: [PATCH 02/11] dt-bindings: arm: renesas: Add si-linux cat87[45]
 boards
Message-ID: <20190117105107.dtuttem7x7ovaey2@verge.net.au>
References: <1547663874-29411-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547663874-29411-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1547663874-29411-3-git-send-email-fabrizio.castro@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jan 16, 2019 at 06:37:45PM +0000, Fabrizio Castro wrote:
> This patch adds board cat874 (powered by the RZ/G2E) and board
> cat875 (that sits on top of cat874). Both boards are made by
> Silicon Linux.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
> index 5e9d486..9e1e07b 100644
> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> @@ -108,6 +108,14 @@ properties:
>  
>        - description: RZ/G2E (R8A774C0)
>          items:
> +          - enum:
> +              - si-linux,cat874 # Silicon Linux RZ/G2E 96board platform (CAT874)

Can I confirm that "96board platform" is correct for this board - I don't
see it in the documentation I have, but that may not mean much.


That aside, I'd like to wait for Rob to indicate if he will accept
patch 1, which adds si-linux as a vendor, before I apply this patch.

> +          - const: renesas,r8a774c0
> +
> +      - items:
> +          - enum:
> +              - si-linux,cat875 # Silicon Linux sub board for CAT874 (CAT875)
> +          - const: si-linux,cat874
>            - const: renesas,r8a774c0
>  
>        - description: R-Car M1A (R8A77781)
> -- 
> 2.7.4
> 
