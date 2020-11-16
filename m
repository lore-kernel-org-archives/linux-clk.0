Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA6DC55ABD
	for <linux-clk@archiver.kernel.org>; Mon, 16 Nov 2020 07:07:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AF612224F
	for <linux-clk@archiver.kernel.org>; Mon, 16 Nov 2020 07:07:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oZ038gYH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbgKPHGz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Nov 2020 02:06:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:41550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727204AbgKPHGz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 16 Nov 2020 02:06:55 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 580CE2078E;
        Mon, 16 Nov 2020 07:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605510414;
        bh=4vaNtfCqdJUurqy3FJA41ufFG5N1KaaL1IPJ71eCFe8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oZ038gYHLaHG/Z4BTqv8BDY/QNGIh5D7reKoYhwcU1/AkgOuQa7Qqb9S9wVykxpTm
         JVin1f/wdjH5kjgQqxQk1BzJv8fC/wV36vWUKUGYdsh2csBAvbPOKiFHGwsDs57VP3
         79gKITZqNHWcJuFWrHb/5/2pqNf7rRfWlacXtEww=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <BL0PR04MB65142F688DB54141C46D1D92E7E60@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com> <20201107081420.60325-9-damien.lemoal@wdc.com> <160525270249.60232.12874105352298232293@swboyd.mtv.corp.google.com> <BL0PR04MB6514621FDC804DAD854AFA06E7E60@BL0PR04MB6514.namprd04.prod.outlook.com> <160525398691.60232.17463845218341195554@swboyd.mtv.corp.google.com> <BL0PR04MB65144DA979067F3760D26B01E7E60@BL0PR04MB6514.namprd04.prod.outlook.com> <160525508016.60232.12394737512819290718@swboyd.mtv.corp.google.com> <BL0PR04MB65142F688DB54141C46D1D92E7E60@BL0PR04MB6514.namprd04.prod.outlook.com>
Subject: Re: [PATCH 08/32] riscv: Fix kernel time_init()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sean Anderson <seanga2@gmail.com>
To:     Damien Le Moal <Damien.LeMoal@wdc.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org
Date:   Sun, 15 Nov 2020 23:06:52 -0800
Message-ID: <160551041285.60232.8430654706414782453@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Damien Le Moal (2020-11-13 00:23:52)
> On 2020/11/13 17:11, Stephen Boyd wrote:
> >=20
> > Also of_clk_init() is for the CLK_OF_DECLARE() users and if they can
> > wait to platform bus population time then they could be converted to
> > regular old platform device drivers. Maybe the problem is the clk driver
> > you're using is only using CLK_OF_DECLARE() and not registering a
> > platform driver?
>=20
> Yep, correct, that is what I did. SO yes, indeed, if I where to use a reg=
ular
> platform_driver, then the of_clk_init() change would not be needed.
>=20
> For the clock driver, I followed the pattern used by most other drivers w=
ith the
> majority I think using CLK_OF_DECLARE(). I did see some using the platform
> driver declaration though.
>=20
> I could spend time trying to figure out if I can get away without using
> CLK_OF_DECLARE(), but since I think other riscv board clock driver are ar=
riving,
> we may as well keep that of_clk_init() change, no ?
>=20

Sure keeping of_clk_init() in riscv architecture code is fine. It would
be good to use a platform driver though and avoid the use of
CLK_OF_DECLARE() so we don't burden ourselves with more code that
registers clks early unnecessarily.
