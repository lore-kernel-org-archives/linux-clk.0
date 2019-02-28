Return-Path: <SRS0=eSXj=RD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7FEC43381
	for <linux-clk@archiver.kernel.org>; Thu, 28 Feb 2019 02:16:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 49BEB218A5
	for <linux-clk@archiver.kernel.org>; Thu, 28 Feb 2019 02:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1551320167;
	bh=1wUhbJN+Gop84TwnGzWWetTBDUMQxJV5H28RQ12PQHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=V0oCt6gdwNQ/MmlaF0HzDvs20UgbwllM/6bkFG5PZQvNwXuM3X4klIhiuqMNBBNNr
	 hTD1WUZRvYV4VkeCLmfyz1PaM8SIy+Q1U/ZG9azAO8Q5sA/4X64HlgLpC27SrCYDqV
	 a64N9Vciil0eAITcWHUPqHnUnJZPHEj0oujSuaPw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730254AbfB1CQG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Feb 2019 21:16:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:41766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730240AbfB1CQG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 27 Feb 2019 21:16:06 -0500
Received: from dragon (unknown [139.162.86.229])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 378EC218A2;
        Thu, 28 Feb 2019 02:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1551320166;
        bh=1wUhbJN+Gop84TwnGzWWetTBDUMQxJV5H28RQ12PQHU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FFyqE2ehnRpnr9O3sY3yqvy5sj10MyMJ6uh6JFqzQJ2hAP8ra8JFNTdXyiGquC2iJ
         5FJKMdOHEksoAqZbPLHSqIW2Sl5WYjQqeJSKrdlUJ6MIq68HIpw9J95wTRHXcZr0hO
         QSoaziTsicnAZdYrw+6YHHlBLEm/2CuPluUacODw=
Date:   Thu, 28 Feb 2019 10:15:12 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Abel Vesa <abel.vesa@nxp.com>, Bai Ping <ping.bai@nxp.com>,
        Carlo Caione <ccaione@baylibre.com>,
        Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] clk: imx8mq: Add support for the CLKO1 clock
Message-ID: <20190228021509.GA26041@dragon>
References: <20190131002056.12024-1-festevam@gmail.com>
 <155078140414.77512.3157214123340597508@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155078140414.77512.3157214123340597508@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Feb 21, 2019 at 12:36:44PM -0800, Stephen Boyd wrote:
> Quoting Fabio Estevam (2019-01-30 16:20:56)
> > Add the entry for the CLKO1 clock.
> > 
> > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > ---
> 
> Applied to clk-next but I had to fix the whole DT binding number because
> I don't know what this patch is based on. In fact, please get everyone
> involved at NXP and whoever else is working on i.MX clk drivers to
> coordinate somehow. I just spent 20 minutes working through the set of
> imx patches in my inbox and I see approximately 6 different authors all
> sending out a few clks at a time for the same drivers with zero
> information about what the patches are based on or what order they're
> supposed to be applied in.
> 
> If someone wants to collect all the patches and indicate on the list
> they've picked them up and will be sending them as a pull request that's
> fine.

I will help collect the i.MX platform clock patches and send you as
pull request.

Shawn
