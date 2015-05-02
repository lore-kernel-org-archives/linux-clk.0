Return-Path: <moinejf@free.fr>
Date: Sat, 2 May 2015 10:55:23 +0200
From: Jean-Francois Moine <moinejf@free.fr>
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Mike Turquette <mturquette@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Stephen
 Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Gregory Clement
 <gregory.clement@free-electrons.com>, Michael Welling <mwelling@ieee.org>,
 Russell King <rmk+linux@arm.linux.org.uk>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/4] clk: si5351: Some fixes
Message-ID: <20150502105523.1e6dd07c@armhf>
In-Reply-To: <554347AA.3070502@gmail.com>
References: <1430415954-29517-1-git-send-email-sebastian.hesselbarth@gmail.com>
	<20150501111406.0aa23c7b@armhf>
	<554347AA.3070502@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Fri, 01 May 2015 11:30:18 +0200
Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com> wrote:

> > I applied the patches 2 and 3, and the audio and video in the Cubox
> > work fine again. Thanks. =20
>=20
> Ok, good. You mentioned that on v3.19-rc1 it still "works" i.e. despite
> the broken/missing clk_get/clk_prepare_enable?
>=20
> Can you check the stable (v3.19, v4.0) versions and see how far we
> should backport the fix?

v3.19 works, v4.0 does not.

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
