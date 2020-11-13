Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E9EC388F7
	for <linux-clk@archiver.kernel.org>; Fri, 13 Nov 2020 08:11:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D1CA2073C
	for <linux-clk@archiver.kernel.org>; Fri, 13 Nov 2020 08:11:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6LiCQIC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbgKMILW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Nov 2020 03:11:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:52232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbgKMILW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 13 Nov 2020 03:11:22 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A9C64206D9;
        Fri, 13 Nov 2020 08:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605255081;
        bh=q7R0ZJDODTZcOxWdt3jAqjnMWNyOJbFIt8pXF6LGNt4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=l6LiCQICXEhVpbskIMBx/95dvbCNC1vayy/peszqYiL1yFABOyvMkK5tYBA2sBj1I
         x6GJ65poI9UWlFOPoygr3y4XRGxbAIUmyzzOzQm55F9LCFZm11Gt/Rb/NxCg8Ukv7i
         z6Qkuc1JWAxqt2A9nD2t5Oln3ZgzwdVgpTXKOa18=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <BL0PR04MB65144DA979067F3760D26B01E7E60@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com> <20201107081420.60325-9-damien.lemoal@wdc.com> <160525270249.60232.12874105352298232293@swboyd.mtv.corp.google.com> <BL0PR04MB6514621FDC804DAD854AFA06E7E60@BL0PR04MB6514.namprd04.prod.outlook.com> <160525398691.60232.17463845218341195554@swboyd.mtv.corp.google.com> <BL0PR04MB65144DA979067F3760D26B01E7E60@BL0PR04MB6514.namprd04.prod.outlook.com>
Subject: Re: [PATCH 08/32] riscv: Fix kernel time_init()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sean Anderson <seanga2@gmail.com>
To:     Damien Le Moal <Damien.LeMoal@wdc.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org
Date:   Fri, 13 Nov 2020 00:11:20 -0800
Message-ID: <160525508016.60232.12394737512819290718@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Damien Le Moal (2020-11-12 23:57:19)
> On 2020/11/13 16:53, Stephen Boyd wrote:
> >=20
> > Yes it's fine. Just the commit text reads as "If of_clk_init() is not
> > called in time_init() then nothing works" which is true but made me
> > wonder if it was because it needed to be super early or not. The commit
> > text could be a little clearer here.
>=20
> OK. I will clarify the commit message in V2. Working on it now.

Thanks!

>=20
> > We don't have any good solution for a fallback to call of_clk_init()
> > somewhere later. I do wonder if we should generalize this though and
> > call of_clk_init() from start_kernel() directly via some Kconfig that
> > architectures select if they need it for their timer and then move it to
> > an initcall if architectures don't select the config. Or throw it into
> > the of_platform_default_populate_init() hook if the architecture doesn't
> > need to call it early.
>=20
> This last idea seems reasonable and probably the easiest. And I think it =
could
> be done unconditionally even if the arch calls of_clk_init() early as the
> already populated clock provider nodes would not be initialized again.
>=20

Also of_clk_init() is for the CLK_OF_DECLARE() users and if they can
wait to platform bus population time then they could be converted to
regular old platform device drivers. Maybe the problem is the clk driver
you're using is only using CLK_OF_DECLARE() and not registering a
platform driver?
