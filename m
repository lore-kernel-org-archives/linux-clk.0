Return-Path: <SRS0=2OLx=EH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B687C2D0A3
	for <linux-clk@archiver.kernel.org>; Sun,  1 Nov 2020 09:27:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 420E820B1F
	for <linux-clk@archiver.kernel.org>; Sun,  1 Nov 2020 09:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604222834;
	bh=S148xYiDLkpqMjXcFmkJzuuhVelRZwJmOjteNJYXqKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=nlqFr7vXjwzcXEpoCL4JOq3KdS6/aIbJ/iRXeLTloxbFiwz7JjMRTLiUlzvp7/+3Z
	 kWJl+0fu0WG6jT+AkQ4VwfAZWfhz9VQGi79JwRuyCc/8Hw4m4nWFr7FLpQXkPhRJSX
	 f7eGYn5A4lQH4D3ghtV2Kqa/KXpkEcTmarcT8obg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbgKAJ1O (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 1 Nov 2020 04:27:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:59290 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725951AbgKAJ1N (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 1 Nov 2020 04:27:13 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 37EFE20706;
        Sun,  1 Nov 2020 09:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604222833;
        bh=S148xYiDLkpqMjXcFmkJzuuhVelRZwJmOjteNJYXqKw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yOXZdPNQ8nzjrOJ1gSC+drld20Na0eN9i3SfWXg2wthRPYUH0p6oEG7DzIJ5w9xJk
         H/NtfnU45L2bcZ6y6NKRFQn6nL3hB/MuIpsHuTcg+lEOgky2liAVvwm15BgDmemjQz
         LKHyvDNB1r4VZU7xfZ90J/y1GdyAX9hGKzirxfsQ=
Date:   Sun, 1 Nov 2020 17:27:06 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: remove redundant assignment to pointer np
Message-ID: <20201101092705.GO31601@dragon>
References: <20201029224007.390762-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029224007.390762-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Oct 29, 2020 at 10:40:07PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer np is being initialized with a value that is never read
> and it is being updated with a value later on. The initialization
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.
