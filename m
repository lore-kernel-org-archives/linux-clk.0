Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCC4C64EC7
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 00:58:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjCAA6u (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 19:58:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjCAA6t (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 19:58:49 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBDCB1B326;
        Tue, 28 Feb 2023 16:58:48 -0800 (PST)
Received: from pecola.lan (unknown [159.196.93.152])
        by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 78B1F20034;
        Wed,  1 Mar 2023 08:58:43 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1677632325;
        bh=XqQEKej9m4ZxFPC0M8Q/uruz4T2jtJ1NZcWFPw4Wi08=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References;
        b=IEMwFCw7WBkdwyGPf0VY9Esdv5jarp+T1HLzaMRaJEivoSlBHO0mt8R5cvXuA9LVY
         zth1lSOk2sXsaTufETKM3UGnjVUuBvkxb7eGC2aXw9lxSJi0monZ1NV9JU1LHzbOFD
         LlPBB0CT5UQD8MEaCp/uQmXP60mY9tx1zZv2PWBvF1b9XExViOkX2a25lGkiQARcWF
         dwHcUs/jSKWVvmINlM6/JbNoSPhOowRjGBzU4ftD6P3iF5IB28LpN30Jg42dMzmMDV
         RbjQ2evatCnqhPc47830+Z0ZRver/Pr0K/L8+QpCEkjymDKLAcWKMofq2t3cHhpymx
         fjbNm7934Z2YA==
Message-ID: <1024ddf2c4047e5a6cd516809d4d15ea5e0349b6.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 3/5] clk: ast2600: Add full configs for I3C clocks
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     Joel Stanley <joel@jms.id.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Andrew Jeffery <andrew@aj.id.au>
Date:   Wed, 01 Mar 2023 08:58:43 +0800
In-Reply-To: <CACPK8XfZCaLK+1kRkHa+wvGyt3YCwiZDR7CKRPKxdjuBFH+01Q@mail.gmail.com>
References: <20230228091638.206569-1-jk@codeconstruct.com.au>
         <20230228091638.206569-4-jk@codeconstruct.com.au>
         <CACPK8XfZCaLK+1kRkHa+wvGyt3YCwiZDR7CKRPKxdjuBFH+01Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Joel,

Thanks for the review. Some replies inline:

> > @@ -15,7 +16,7 @@
> >=20
> > =C2=A0#include "clk-aspeed.h"
> >=20
> > -#define ASPEED_G6_NUM_CLKS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 71
> > +#define ASPEED_G6_NUM_CLKS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 72
>=20
> NUM_CLKS seems dangerous. Should we instead use
> ARRAY_SIZE(aspeed_g6_gates)?

Yep, that would have saved me some time debugging. That would suit as a
separate change though, would you like it in the same series?

> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* USB 2.0 port1 phy 40MHz c=
lock */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hw =3D clk_hw_register_fixed=
_rate(NULL, "usb-phy-40m", NULL,
> > 0, 40000000);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aspeed_g6_clk_data->hws[ASPE=
ED_CLK_USBPHY_40M] =3D hw;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* i3c clock: source from apll, d=
ivide by 8 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regmap_read(map, ASPEED_G6_CLK_SE=
LECTION5, &val);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val &=3D ~(I3C_CLK_SELECTION | AP=
LL_DIV_SELECTION);
>=20
> Is there any value in registering a mux device here? See the emmc
> extclk device.

We won't be doing any mux configuration here, so I figure the static
setup is fine.

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D FIELD_PREP(I3C_CLK_SELEC=
TION,
> > I3C_CLK_SELECT_APLL_DIV);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D FIELD_PREP(APLL_DIV_SELE=
CTION, APLL_DIV_8);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regmap_write(map, ASPEED_G6_CLK_S=
ELECTION5, val);
>=20
> This is a departure in style from the existing code. The existing
> code did things like this:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regmap_update_bits(map, ASPEED=
_G6_CLK_SELECTION1, GENMASK(10, 8), BIT(10));
>=20
> Which uses the regmap API instead of FIELD_PREP macros.

Yep, that's much nicer, I'll change. The FIELD_PREP parts are just from
the initial ASPEED implementation.

Cheers,


Jeremy
