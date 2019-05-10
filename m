Return-Path: <SRS0=JHcd=TK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14DE7C04A6B
	for <linux-clk@archiver.kernel.org>; Fri, 10 May 2019 17:37:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D39C4217D6
	for <linux-clk@archiver.kernel.org>; Fri, 10 May 2019 17:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1557509845;
	bh=u8hWeVj3XoAErt5dCdOn71vsL+AxoM2DGoFvFOxbdKo=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=1mi58APzRDhgMBDrcRd+Vh/rNvyXZHFQy5DbdJlnyf4LN140crJ0MEgjpnppm4O2c
	 dZzoyyckZWN6WoqBG4AM8wHgjRy1oVTEayM59rXKazCjgAz+zRvt5jl2SekzwluqIW
	 dTVeDqLoBN8v12fDXGTUIPJbzO0XX0Gng9n9op/s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbfEJRhZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 10 May 2019 13:37:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:59048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727916AbfEJRhZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 10 May 2019 13:37:25 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7418F20882;
        Fri, 10 May 2019 17:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557509844;
        bh=u8hWeVj3XoAErt5dCdOn71vsL+AxoM2DGoFvFOxbdKo=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=FWQ7nA8yA5jTt1QLv/ezUcpDBHmepM6VBA5IpNAh4OE3556etLqEVYiGfxYtmCZUR
         d7+Pa9QLBh3kb9N3Uq1/A/RuOdu4LV8ODIqrm4BFfvM9RpyWli+NgG2ZWovKQSpNws
         KlKxwIRdqaHvPH6+0D8e7yJYnR92Iomifb9DRuFU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190510032746.GF15856@dragon>
References: <8776296d079b3b4d67d4421656238757a8ad373d.1556046082.git.leonard.crestez@nxp.com> <20190510032746.GF15856@dragon>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: imx6sll: Fix mispelling uart4_serial as serail
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>
Message-ID: <155750984356.14659.16650159344577092731@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Fri, 10 May 2019 10:37:23 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2019-05-09 20:27:47)
> On Tue, Apr 23, 2019 at 07:05:08PM +0000, Leonard Crestez wrote:
> > This looks like a copy-paste error. This string is not referenced
> > anywhere so it's safe to rename it.
> >=20
> > Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
>=20
> I see this keep coming, so have to ask you to fix your patch sender.
> The base64 encoding makes it very difficult to apply patch.  I have done
> manual applying for your patches a couple of times, and I thought that's
> just accident.  It seems not.  Please fix and resend.=20
>=20

I already applied this one. Sorry, forgot to send the email.

