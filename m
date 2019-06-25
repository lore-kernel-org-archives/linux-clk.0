Return-Path: <SRS0=Kcvz=UY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADF2C48BD6
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 18:55:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 00BBC208E3
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 18:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561488932;
	bh=CU/pi1jDqoAxTEEO83+4ZsORpoB/lyIbsA7mD6/R9HY=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=Do45FTCJKdRNegCmoXkaD0auwnvuea+4Fys24UXYam+Gwfx6/1LZ4fkQzuTu1widn
	 e3UJi6ZjzDf+ENFwGtncaosyVX/G5LOvxAr3jGLD/KzCA4NNyMzaT8tMnd6paN3ujg
	 39advGy0B5CgG7wx1KmIGtrggYMBCgn3D0goqmas=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733039AbfFYSzb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jun 2019 14:55:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:53000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730588AbfFYSzb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Jun 2019 14:55:31 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ACAF52085A;
        Tue, 25 Jun 2019 18:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561488929;
        bh=CU/pi1jDqoAxTEEO83+4ZsORpoB/lyIbsA7mD6/R9HY=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=vcR9gmJZJ9TmQdBp8TcKLhGKYvrdW1PlBKzqzOSCiwznX260bcm2xeLhLjpjalFuk
         xIaSshROHzPyZCwur+DKJZ6juJUGyYx9W6LpDJGP5JB7u6t0ZYIS/mNnSdc8oNM+rr
         fQiOUa2dbEWCZem77UsrtRicO7pQh2JeTvZrIVms=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2ba035cc-2381-ce36-3b7d-f5027ef9ef40@ti.com>
References: <1deb7a85-0859-54f1-950a-33de3a08f9fd@ti.com> <20190625011711.3D2D520663@mail.kernel.org> <2ba035cc-2381-ce36-3b7d-f5027ef9ef40@ti.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        linux-clk <linux-clk@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] clk: keystone: changes for 5.3 v2
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
User-Agent: alot/0.8.1
Date:   Tue, 25 Jun 2019 11:55:28 -0700
Message-Id: <20190625185529.ACAF52085A@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tero Kristo (2019-06-25 03:33:50)
> On 25/06/2019 04:17, Stephen Boyd wrote:
> > Quoting Tero Kristo (2019-06-12 04:56:15)
> >> Hi Stephen, Mike, Santosh,
> >>
> >> Here's a 2nd take of the pull request for the clock changes for keysto=
ne
> >> SoC for 5.3. The only change compared to the v1 is to add the required
> >> drivers/firmware change in. This avoids the nasty dependency between t=
he
> >> pull requests between the clock driver and firmware driver.
> >>
> >> -Tero
> >=20
> > Thanks. Pulled into clk-next. I guess we should increase the size of the
> > number of parents that can exist to be more than a u8? We're close to
> > getting there with the new way of specifying clk parents, so maybe we
> > should expand it to an unsigned int, but then we may need to optimize
> > finding parents when searching through all the parents of a clk.
>=20
> For now, this is not an issue with TI SoC:s at least, I think we only=20
> have like 64 parents at max for muxes.

Ok. It doesn't sound like a priority then.

>=20
> > Also, there isn't any quantification of how much better it is to scan DT
> > for all the clks that are used and only register those ones. It would be
> > nice to understand how much better it is to do that sort of scan vs.
> > just populating all clks at boot time.
>=20
> I haven't done measurements lately, but it provides pretty drastic=20
> improvement. On am65x for example, it cuts the scan time from bit more=20
> than 1 second to couple of hundred milliseconds. I don't have=20
> measurements for the new j721e SoC, but I would believe the improvement=20
> is even more with that one.

Cool. Thanks for the numbers.

>=20
> > It may be useful to make the code
> > generic because NXP folks also want to populate clks from DT so maybe we
> > should provide this from the core framework somehow to ask providers to
> > register a particular clk or not. I haven't thought about it at all, but
> > it may come up that we totally rewrite this code in the future to be
> > shared outside of the TI clk driver.
>=20
> It might also be worth thinking whether some sort of lazy clock probe=20
> would be possible... now we register everything at one go, but would it=20
> be possible to only register / reparent clocks once they are actually=20
> requested by some driver?

Sure. Ideally the optimization isn't vendor driver specific.

