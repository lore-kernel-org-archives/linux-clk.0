Return-Path: <SRS0=khTx=SO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75C5C10F0E
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 21:21:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ADB4C218C3
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 21:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555104118;
	bh=VBeb4XKixVOeysz7qi56fRzr3k9ctSmF7LOS2g7rrdg=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=RQO+6QCKmS5n9NqE6tvVuqTA6Oh82Wz0WdwaSlnkOJ3coFwjsQPfHyZi5fwwuradb
	 xMMiLeLW3VSxMbZA8VJC2x2Dq1Wpmi7I6Ntv7BbWJ6fVhI0E2QtEO/gXM6+VuLbMcX
	 1+JF6A7KA/Fucyobu3ZO6HZI4QgMswZe9k5pJ44A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbfDLVV6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Apr 2019 17:21:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:59060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726755AbfDLVV6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 12 Apr 2019 17:21:58 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9BEBE2171F;
        Fri, 12 Apr 2019 21:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555104117;
        bh=VBeb4XKixVOeysz7qi56fRzr3k9ctSmF7LOS2g7rrdg=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=DBGhdnt+v591yZVmganrkWL9/iO62HE3qgu3ascsSCFJk9NYLORPgcW3bOXHNARwX
         r4IWNBO2WuGsxHleyR5TjUBaJJ9KhxZr3pbn+tZorrqCRJ5TAtNy/RbaHJVFhFiITC
         nBi2fK1M9XPIg9bJ3/NrHebChXxpUuaDoswY7tnQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7dd868d4673f155faa8c52d80a01d01aed2ea247.1555077720.git.leonard.crestez@nxp.com>
References: <cover.1555077720.git.leonard.crestez@nxp.com> <7dd868d4673f155faa8c52d80a01d01aed2ea247.1555077720.git.leonard.crestez@nxp.com>
Cc:     Robin Gong <yibin.gong@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Angus Ainslie <angus@akkea.ca>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        "linux-pm@lists.infradead.org" <linux-pm@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/4] clk: imx: Fix PLL_1416X not rounding rates
To:     Jacky Bai <ping.bai@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Shawn Guo <shawnguo@kernel.org>
Message-ID: <155510411679.15276.16206154383783988279@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Fri, 12 Apr 2019 14:21:56 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Leonard Crestez (2019-04-12 07:10:03)
> Code which initializes the "clk_init_data.ops" checks pll->rate_table
> before that field is ever assigned to so it always picks
> "clk_pll1416x_min_ops".
>=20
> This breaks dynamic rate rounding for features such as cpufreq.
>=20
> Fix by checking pll_clk->rate_table instead, here pll_clk refers to
> the constant initialization data coming from per-soc clk driver.
>=20
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> ---

Applied to clk-fixes

