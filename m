Return-Path: <SRS0=N9em=Z7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 247E9C43603
	for <linux-clk@archiver.kernel.org>; Mon,  9 Dec 2019 02:37:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB6F620700
	for <linux-clk@archiver.kernel.org>; Mon,  9 Dec 2019 02:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575859032;
	bh=KwTcMhxxQxSTWeCjOkeJmE5iBWvBtzmK8AUbPh94n54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=jnSNG6jP/9Ab0nzaWR/X4U44PRd93E6ZeDmA89cmLP6BK7zAC/DtDsZKzqzbKzWED
	 prDqhVoxZ004WPbqganja/iFR1ZLtEF+NwkqJKeqtzpzMursOVAW4VoGyfqzP5/s2h
	 hECqOwO8jsF3+fCFKYwy9wZPaiSabYvwZP3Kp6wc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbfLIChL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 8 Dec 2019 21:37:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:42218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726841AbfLIChL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 8 Dec 2019 21:37:11 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EED5A206F4;
        Mon,  9 Dec 2019 02:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575859030;
        bh=KwTcMhxxQxSTWeCjOkeJmE5iBWvBtzmK8AUbPh94n54=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hjNX6VXVtN71ykx9twRtu+K3Dmxs+V5KGy0KHaoNRZt9mlE8F1rVMdOQYoWho7vQt
         3bPSfCjK9ydbcg3gVZYf+tfuMGtyoXd6ukg+kcZtlnHiWBggrFbdlD21VMatYDS1KJ
         0vFpHs8w1mWve8L2qYeg5e7NFlDMp3Bkrb+yy+zE=
Date:   Mon, 9 Dec 2019 10:36:54 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Jacky Bai <ping.bai@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, linux-clk@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: imx8m: Suppress bind attrs
Message-ID: <20191209023653.GV3365@dragon>
References: <ce34606bb3876f7506f483db7623fcba6da04810.1574344160.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce34606bb3876f7506f483db7623fcba6da04810.1574344160.git.leonard.crestez@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Nov 21, 2019 at 03:52:17PM +0200, Leonard Crestez wrote:
> The clock drivers on imx8m series are registered as platform devices and
> this opens the possibility of reloading the driver at runtime.
> 
> This doesn't actually work: clocks are never removed and attempting to
> bind again results in registration errors and a crash. Almost all
> devices depend on clocks anyway so rebinding is unlikely to ever be
> useful
> 
> Fix this by explicitly suppressing bind attrs like several other
> clock drivers.
> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Applied, thanks.
