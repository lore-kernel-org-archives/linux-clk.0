Return-Path: <SRS0=khTx=SO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1392DC10F14
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 18:34:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFDBE218C3
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 18:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555094072;
	bh=mVLYzy+Wnn/s1Slr78PSMcOBetd7m3L0tYhj6HdxCNY=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=VyQjpaK73z+AYZ4JGK5VGc4hQHFk4BjhoPg97rTHCssbXjuCEhd1d6rOROUsk/xl3
	 fRiNsTAnTI7pFJ6M6TtnobzoH+Lj/bSMQuLWkgRQ1VTAmHVDz6+iLp7LTaai4kb6UQ
	 zmSGouH+a/UKIDU6GFEyw9rZdYvrrZ2AzTNGGlPQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbfDLSec (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Apr 2019 14:34:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:51414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726797AbfDLSec (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 12 Apr 2019 14:34:32 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7B30B20652;
        Fri, 12 Apr 2019 18:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555094071;
        bh=mVLYzy+Wnn/s1Slr78PSMcOBetd7m3L0tYhj6HdxCNY=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=JJB614w2Ntwcmu76Cy0o4sJWMZyUp84YBcrlKUhnaOMYvpttZc8Xww9/UOXJJ9XfV
         pj9GWPdOAVjZriw6as+4c/kUNFbI9ly9hMfJuwIcsGbPx+IxPvlmnhglUQ+MLQupRH
         9d3Bxnl7c30Tz8SWfVD/P3Qsrcud/kzS6ngfo1GE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <VI1PR04MB55330D9C5E2DE905333070F4EE280@VI1PR04MB5533.eurprd04.prod.outlook.com>
References: <cover.1555077720.git.leonard.crestez@nxp.com> <7dd868d4673f155faa8c52d80a01d01aed2ea247.1555077720.git.leonard.crestez@nxp.com> <155508743438.20095.5061509575513490354@swboyd.mtv.corp.google.com> <VI1PR04MB55330D9C5E2DE905333070F4EE280@VI1PR04MB5533.eurprd04.prod.outlook.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/4] clk: imx: Fix PLL_1416X not rounding rates
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Robin Gong <yibin.gong@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Angus Ainslie <angus@akkea.ca>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        "linux-pm@lists.infradead.org" <linux-pm@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>
To:     Jacky Bai <ping.bai@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>
Message-ID: <155509407072.20095.14633592159299137519@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Fri, 12 Apr 2019 11:34:30 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Leonard Crestez (2019-04-12 09:51:37)
> On 4/12/19 7:43 PM, Stephen Boyd wrote:
> > Quoting Leonard Crestez (2019-04-12 07:10:03)
> >> Code which initializes the "clk_init_data.ops" checks pll->rate_table
> >> before that field is ever assigned to so it always picks
> >> "clk_pll1416x_min_ops".
> >>
> >> This breaks dynamic rate rounding for features such as cpufreq.
> >>
> >> Fix by checking pll_clk->rate_table instead, here pll_clk refers to
> >> the constant initialization data coming from per-soc clk driver.
> >=20
> > Any Fixes tag here?
>=20
> Fixes: 8646d4dcc7fb ("clk: imx: Add PLLs driver for imx8mm soc")
>=20
> That's the only commit on this file, it's only for a very new SOC.
>=20

Ok. I take it I should push this into clk-fixes so it can fix badness in
the v5.1 series?

