Return-Path: <SRS0=Uisa=CW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B44DC43461
	for <linux-clk@archiver.kernel.org>; Sun, 13 Sep 2020 01:22:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCF1721531
	for <linux-clk@archiver.kernel.org>; Sun, 13 Sep 2020 01:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599960143;
	bh=y8a3OJP3haDXbzePNeSbyxmT9jkJUYcxakmTJFNOiFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=QWiCbKUOlu4pEBUa55FWBUjcL3lm7Om3Csdz0eiCzC7/mbtComZKWoCm1I7e19J3s
	 L1tve3Ksj69TwxdVw+LyhJSbyeislaOlpesAvGWlrgG2UAtW15M1xZZ5/md76I1ebK
	 IyQRoi109o7ervgTucKOABzetuzP1yC6xrO8JwtE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbgIMBWV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 12 Sep 2020 21:22:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:40696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725889AbgIMBWU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 12 Sep 2020 21:22:20 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E428E214F1;
        Sun, 13 Sep 2020 01:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599960140;
        bh=y8a3OJP3haDXbzePNeSbyxmT9jkJUYcxakmTJFNOiFQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1SQsJkTqqRanoOE3vqLC5laDxtT52IkyVPydZ4ZRPWS2mgmqOnWsYLHUwNeigbAux
         nr+vN2WxWOUA314kcn/wstn4tn4qOnNtuApd49oXynMRiKcBryBmpw1/ueoSh8/MT1
         nLTUadGJMZWP59IX8Gl35GDf6vkV76IaFHf2+JH4=
Date:   Sun, 13 Sep 2020 09:22:14 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: imx: gate2: Fix a few typos
Message-ID: <20200913012213.GD25109@dragon>
References: <20200905151017.1086353-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200905151017.1086353-1-j.neuschaefer@gmx.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Sep 05, 2020 at 05:10:16PM +0200, Jonathan Neuschäfer wrote:
> A few words were misspelled in this comment.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

Applied, thanks.
