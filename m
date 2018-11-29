Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 680AAC43441
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 12:30:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 00617205C9
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 12:30:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gbI9EJ2L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00617205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbeK2Xft (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Nov 2018 18:35:49 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39798 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbeK2Xft (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Nov 2018 18:35:49 -0500
Received: from avalon.localnet (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C76655A;
        Thu, 29 Nov 2018 13:30:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1543494635;
        bh=nTSV6kWOMh50KzHs+gFzjFYwYmG/gfCsiVrRLt3w6k8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gbI9EJ2Le5uMtts76E79zRyrffVHaK9MalVVPVrotsB3TuVfo7GnuKashOLTiB8+p
         68O1qXhmfnwUehDyCJqq4J1Efe++8fWhF3NxItWnaalkeQYCw6t92JYgXO7OnGlFIc
         yKp1yaXhgjEY6eLqxQQVgz2SlPL5yi5AlzyuTMzM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/13] clk: renesas: Miscellaneous fixes
Date:   Thu, 29 Nov 2018 14:31:03 +0200
Message-ID: <32174624.vDOvzGRv0l@avalon>
Organization: Ideas on Board Oy
In-Reply-To: <20181129105008.10239-1-geert+renesas@glider.be>
References: <20181129105008.10239-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Geert,

On Thursday, 29 November 2018 12:49:55 EET Geert Uytterhoeven wrote:
> 	Hi Mike, Stephen, Laurent, Kieran,
> 
> This patch series contains several fixes for the Renesas Clock drivers
> and DT bindings, and a small simplification:
>   - Removal of non-existent clocks,
>   - Addition of the CPEX clocks, which can be used a source for a timer
>     (CMT1),
>   - Correction of DU parent clocks.
> Most of these have been found by skimming the Hardware Manual Errata.
> 
> This has been boot-tested on Salvator-X(S) (R-Car H3, M3-W, M3-N), Eagle
> (R-Car V3M), and Draak (R-Car D3), except for the DU parts.
> Testing of the DU on R-Car D3 and E3 would be appreciated, as the DU
> driver may have a workaround for the incorrect parent clock rates.

As explained in my review of 09/13, I believe the DU clock patches to both be 
correct and have no effect for D3 and E3. No action is needed on the DU side, 
there is no workaround for the incorrect frequency.

> I intend to queue this in clk-renesas-for-v4.21.
> 
> Thanks!
> 
> Geert Uytterhoeven (12):
>   dt-bindings: clock: r8a7795: Remove CSIREF clock
>   dt-bindings: clock: r8a7796: Remove CSIREF clock
>   clk: renesas: r8a774a1: Add CPEX clock
>   clk: renesas: r8a7795: Add CPEX clock
>   clk: renesas: r8a7796: Add CPEX clock
>   clk: renesas: r8a77965: Add CPEX clock
>   clk: renesas: r8a77970: Add CPEX clock
>   clk: renesas: r8a77995: Correct parent clock of DU
>   clk: renesas: r8a77995: Remove non-existent VIN5-7 module clocks
>   clk: renesas: r8a77995: Remove non-existent SSP clocks
>   clk: renesas: r8a77995: Add missing CPEX clock
>   clk: renesas: r8a77995: Simplify PLL3 multiplier/divider
> 
> Takeshi Kihara (1):
>   clk: renesas: r8a77990: Correct parent clock of DU
> 
>  drivers/clk/renesas/r8a774a1-cpg-mssr.c       |  1 +
>  drivers/clk/renesas/r8a7795-cpg-mssr.c        |  1 +
>  drivers/clk/renesas/r8a7796-cpg-mssr.c        |  1 +
>  drivers/clk/renesas/r8a77965-cpg-mssr.c       |  1 +
>  drivers/clk/renesas/r8a77970-cpg-mssr.c       |  1 +
>  drivers/clk/renesas/r8a77990-cpg-mssr.c       |  4 ++--
>  drivers/clk/renesas/r8a77995-cpg-mssr.c       | 15 ++++++---------
>  include/dt-bindings/clock/r8a7795-cpg-mssr.h  |  2 +-
>  include/dt-bindings/clock/r8a7796-cpg-mssr.h  |  2 +-
>  include/dt-bindings/clock/r8a77995-cpg-mssr.h |  5 +++--
>  10 files changed, 18 insertions(+), 15 deletions(-)

-- 
Regards,

Laurent Pinchart



