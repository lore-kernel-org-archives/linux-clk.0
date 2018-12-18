Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7010C43612
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 10:55:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 728CC2184C
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 10:55:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="CdPnfuYc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbeLRKzi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 05:55:38 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:59766 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726378AbeLRKzi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 18 Dec 2018 05:55:38 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 43Jvz42wWdz1f;
        Tue, 18 Dec 2018 11:54:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1545130449; bh=aTbPfe/TGM5rBaOy067UU2nhfMhktctmcjT1UlxMoh8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CdPnfuYcqyy+ueAc1a4DKA61A0nSX3kBdTB+IOGqmVWHJoEhRrUirsMVl2YCgOaro
         TPxiXvCFGnTSC3N/4bPjgu86TwvMolQo9kavK7LFAoeKIoOIIDEKiKSYiZdM9CiXYm
         1NhFf6NcPn4eWZjIejZmBgxPHCpMfny9gPiMYcLrvZuJYUIUYBLWrsxNV7ly4lnJix
         WeLd6NW6/KB2ah44L858hr2i9LW7NCwWYeVEylb3fEKlzqFBoyGCDnFIlZ5GmjOsyl
         Fiey6pz8OpFQoBTM0g2SdTv1cZs+Hp/MEmiHHXaOWb1YdQu5Oz43Zk+t1E6UmXFjI8
         eV8Rwgh6B8Yog==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.2 at mail
Date:   Tue, 18 Dec 2018 11:55:33 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [PATCH] clk: at91: optimize clk_round_rate() for AUDIO_PLL
Message-ID: <20181218105533.GA3362@qmqm.qmqm.pl>
References: <772b3869cc992d894d8c1b4296f21100bcbed30d.1545075103.git.mirq-linux@rere.qmqm.pl>
 <154508897026.19322.14961293619238289668@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <154508897026.19322.14961293619238289668@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Dec 17, 2018 at 03:22:50PM -0800, Stephen Boyd wrote:
> Quoting Micha³ Miros³aw (2018-12-17 11:37:05)
> > This makes for 3 clk_round_rate() calls instead of 64 of them on
> > SAMA5D2-based board when searching for 12.288MHz clock.
> Ok, but is that better? Worse? Can you more clearly describe what you're
> doing here? And it's not breaking some other corner case?
> > 
> > Signed-off-by: Micha\u0142 Miros\u0142aw <mirq-linux@rere.qmqm.pl>
> This got all broken. Something on your end?
[...]

linux-clk archives got it right:

https://lore.kernel.org/linux-clk/772b3869cc992d894d8c1b4296f21100bcbed30d.1545075103.git.mirq-linux@rere.qmqm.pl/T/#u

Best Regards,
Micha³ Miros³aw
