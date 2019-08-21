Return-Path: <SRS0=LMZy=WR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C20C3A59E
	for <linux-clk@archiver.kernel.org>; Wed, 21 Aug 2019 09:01:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 543FF2339E
	for <linux-clk@archiver.kernel.org>; Wed, 21 Aug 2019 09:01:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbfHUJBX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Aug 2019 05:01:23 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:41438 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbfHUJBW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Aug 2019 05:01:22 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5E44225B7CF;
        Wed, 21 Aug 2019 19:01:20 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 55EC09405AE; Wed, 21 Aug 2019 11:01:18 +0200 (CEST)
Date:   Wed, 21 Aug 2019 11:01:18 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clk: emev2: Rename bindings documentation
 file
Message-ID: <20190821090118.uhhjha2lomnxonqf@verge.net.au>
References: <20190819135630.18462-1-horms+renesas@verge.net.au>
 <20190821075620.GB28351@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190821075620.GB28351@bigcity.dyn.berto.se>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Aug 21, 2019 at 09:56:20AM +0200, Niklas Söderlund wrote:
> Hi Simon,
> 
> Thanks for your work.
> 
> On 2019-08-19 15:56:30 +0200, Simon Horman wrote:
> > Rename the device tree clock bindings for Renesas EMMA Mobile EV2
> > from emev2-clock.txt to emev2-renesas,emev2-smu.txt.
> 
> Should this not be renesas,emev2-smu.txt to align with the compatible 
> string?

Yes indeed, I'll prepare v2.

> > 
> > This is part of an ongoing effort to name bindings documentation files for
> > Renesas IP blocks consistently, in line with the compat strings they
> > document.
> > 
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> > Based on v5.3-rc1
> > ---
> >  .../bindings/clock/{emev2-clock.txt => emev2-renesas,emev2-smu.txt}       | 0
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  rename Documentation/devicetree/bindings/clock/{emev2-clock.txt => emev2-renesas,emev2-smu.txt} (100%)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/emev2-clock.txt b/Documentation/devicetree/bindings/clock/emev2-renesas,emev2-smu.txt
> > similarity index 100%
> > rename from Documentation/devicetree/bindings/clock/emev2-clock.txt
> > rename to Documentation/devicetree/bindings/clock/emev2-renesas,emev2-smu.txt
> > -- 
> > 2.11.0
> > 
> 
> -- 
> Regards,
> Niklas Söderlund
> 
