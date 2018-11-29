Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D4DC04EB9
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 21:49:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 262562145D
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 21:49:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1YCHG+R1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 262562145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbeK3I4a (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Nov 2018 03:56:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:37580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726310AbeK3I4a (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 30 Nov 2018 03:56:30 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E76ED20673;
        Thu, 29 Nov 2018 21:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543528179;
        bh=uzOy9kYDm/af7K1AUzzEbhUAvctbA7K01zhKRlOUCq4=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=1YCHG+R1LhULj+6rdRAHtO4pYk8hJPCePh2FQCdd2Bl4TszErwtjrOIrc0OBGF2/x
         PzTMD8Bga4qIIN1aPHHWPVQAPxff1lDVeJIzaESRp7+567tz50lwdx2N5T32uJpY0Z
         FfnlthFLh2GAGQGa35xaC9h/RiHhkgkKO7XeaJd4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181129105008.10239-1-geert+renesas@glider.be>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20181129105008.10239-1-geert+renesas@glider.be>
Message-ID: <154352817823.88331.1370701337973571144@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH 00/13] clk: renesas: Miscellaneous fixes
Date:   Thu, 29 Nov 2018 13:49:38 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2018-11-29 02:49:55)
>         Hi Mike, Stephen, Laurent, Kieran,
> =

> This patch series contains several fixes for the Renesas Clock drivers
> and DT bindings, and a small simplification:
>   - Removal of non-existent clocks,
>   - Addition of the CPEX clocks, which can be used a source for a timer
>     (CMT1),
>   - Correction of DU parent clocks.
> Most of these have been found by skimming the Hardware Manual Errata.
> =

> This has been boot-tested on Salvator-X(S) (R-Car H3, M3-W, M3-N), Eagle
> (R-Car V3M), and Draak (R-Car D3), except for the DU parts.
> Testing of the DU on R-Car D3 and E3 would be appreciated, as the DU
> driver may have a workaround for the incorrect parent clock rates.
> =

> I intend to queue this in clk-renesas-for-v4.21.
> =


Ok. For the whole series:

Acked-by: Stephen Boyd <sboyd@kernel.org>
