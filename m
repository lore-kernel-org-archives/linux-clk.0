Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA1CC43612
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 21:09:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7ED4A208C2
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 21:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544821741;
	bh=qtv9fCbo5zble2Uy57MuGKLgicbzVs3JmMyN85OaTuw=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=jrnxvY8jaUAFl8T5ZbVPpOUOgV9uJ2IXHntCi4MAZDwu/8MHKgddi1H1DUYA7xUhc
	 4YGWFw9LkLL6c0yEDgeBMQOHKyYe8n37yI8UaRZJlGGKHLkf547yha4xi4iBpubqac
	 IOSxwKzaNRjfL4XZF5xWK/fYdMo7tTVwuB9t71UM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731063AbeLNVJA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Dec 2018 16:09:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:56830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730734AbeLNVJA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 14 Dec 2018 16:09:00 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 860A8208C1;
        Fri, 14 Dec 2018 21:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544821740;
        bh=qtv9fCbo5zble2Uy57MuGKLgicbzVs3JmMyN85OaTuw=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=jAAOyUTSi9Qvrjc0UmI25nb06qnK8Io2Nrp6Z7iPyiqBxRuATcu6yOCTHd23Fz7P/
         F3sTV7LCdsESM0vv2TFNMUCVk3z2Kn27oc6maD0/bPvYxvclhyv6Oy/ocWyuBeiNVW
         6OzrVIEkQbpMytaLP5n0kRfUGjDWD0I5GJ/eKzj0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1544715442-8902-3-git-send-email-aisheng.dong@nxp.com>
Subject: Re: [PATCH V12 2/5] clk: imx: add scu clock common part
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
References: <1544715442-8902-1-git-send-email-aisheng.dong@nxp.com> <1544715442-8902-3-git-send-email-aisheng.dong@nxp.com>
Message-ID: <154482173946.19322.455504829466810893@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Aisheng Dong <aisheng.dong@nxp.com>
Date:   Fri, 14 Dec 2018 13:08:59 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng Dong (2018-12-13 07:42:54)
> Add SCU clock common part which will be used by client clock drivers.
> SCU clocks are totally different from the legacy clocks (No much
> legacy things can be reused), it's using a firmware interface now based
> on SCU protocol. So a new configuration option CONFIG_MXC_CLK_SCU is adde=
d.
>=20
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Applied to clk-next

