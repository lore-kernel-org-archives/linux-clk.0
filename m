Return-Path: <SRS0=o7Wn=UM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA50C31E49
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jun 2019 20:48:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3DFC021537
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jun 2019 20:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560458887;
	bh=H1APmz4uK9ccVsYdF4n6bh54danBGEaWI7jnHJJpFp8=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=U1/kuuP/6FP9GtpSoUt677v1aLxazYCERYswKAoiyrNDpgoynd5JEpW3vqDcgNKCP
	 JypW2Gj5EOWw/NnHb9VUVyr4G5Xl6/LCFHAAtXYWvNM01/ZrawW/KOgtCxlWFUlEcH
	 FQo2gh1nOpprE40le7X72pM/I/PxtAuR5agGAwg0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729718AbfFMUsG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jun 2019 16:48:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:34660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725747AbfFMUsG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Jun 2019 16:48:06 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1EF442133D;
        Thu, 13 Jun 2019 20:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560458885;
        bh=H1APmz4uK9ccVsYdF4n6bh54danBGEaWI7jnHJJpFp8=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=QmXkX+dJzVMh+SLeIpnwXUylGjU6fGNxVFA58oQA4FajliSdoIldV6QKDDg9N2NnY
         KbEyl8LL9ZMgLRA3rHwTpcvo/g1XMCcdW0fB2Xipz9BJUw8LzlRZg53IjVHaoELOU7
         ecV8aCW0wcLKLotoavMl77xvKJ4jsjY7h4fWjSwE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7hlfy54836.fsf@baylibre.com>
References: <a834836da8de689ec541093f3226a853af001fe4.camel@baylibre.com> <20190612230201.3692F20896@mail.kernel.org> <df0dad551db9f344e53db134a3c5a25d5d51ae63.camel@baylibre.com> <7hlfy54836.fsf@baylibre.com>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] clk: meson: fixes for v5.2
Cc:     "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 13 Jun 2019 13:48:04 -0700
Message-Id: <20190613204805.1EF442133D@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Kevin Hilman (2019-06-13 12:07:57)
> Jerome Brunet <jbrunet@baylibre.com> writes:
>=20
> > On Wed, 2019-06-12 at 16:02 -0700, Stephen Boyd wrote:
> >> Quoting Jerome Brunet (2019-06-11 05:23:33)
> >> > Dear clock maintainers,
> >> >=20
> >> > Below is a request to pull a couple of fixes on Amlogic clocks for v=
5.2
> >> > These are typos in recently added clocks, the most annoying one bein=
g in
> >> > the DT binding identifier on the MPLL50M which is used by the networ=
k PLL.
> >> >=20
> >> > Regards
> >> >=20
> >> > The following changes since commit a188339ca5a396acc588e5851ed7e19f6=
6b0ebd9:
> >> >=20
> >> >   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> >> >=20
> >> > are available in the Git repository at:
> >> >=20
> >> >   git://github.com/BayLibre/clk-meson.git tags/clk-meson-5.2-1-fixes
> >> >=20
> >> > for you to fetch changes up to 3ff46efbcd90d3d469de8eddaf03d12293aaa=
50c:
> >> >=20
> >> >   clk: meson: meson8b: fix a typo in the VPU parent names array vari=
able (2019-05-20 12:11:08 +0200)
> >> >=20
> >> > ----------------------------------------------------------------
> >>=20
> >> Thanks. Pulled into clk-next.
> >>=20
> >
> > Hi Stephen,
> >
> > This was actually meant for clk-fixes
> > We could probably cope with next, but it would be preferable if the typ=
o in the
> > bindings was fixed by the 5.2 release.
>=20
> Yes please.  That would help my dependency management also.
>=20

I pulled it into fixes. Don't worry, it was just a typo due to my usage
of wrong key binding.

