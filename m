Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CB3C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 15 Jun 2022 22:22:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242770AbiFOWWO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Jun 2022 18:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236639AbiFOWWN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Jun 2022 18:22:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1423EA9F;
        Wed, 15 Jun 2022 15:22:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AA4EFB81FDF;
        Wed, 15 Jun 2022 22:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7F6C3411A;
        Wed, 15 Jun 2022 22:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655331730;
        bh=1nC5jIN044WTHCeNMJqPjFmb8cMtWmx3+OQYJ6joA5M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RvfWMUIYTyFTog+jdb8K+kedvgRguVogSH4e5gXhz5mK56Q/WuRv1MrmMtYk9okN4
         JlSila7xJod3hLbVaxW7Ef+MnRdtYkx1nEP7JpgR2xIfRgghE1VpaWMQIc4IhR/iiS
         oDDAUOXaqq4Wl4TVF6zcMFDePV9SDtS04TsID6Mw8BItmDOhAq0TbYHvNrKohs3cn8
         YR61igA0iz0k9ZOpG2QV4MdoaJi62Oa669EUV/pUBVpOkilhlZg7+aZeRJuLc/tz5y
         WrczKB//BnAdl5zZ3l6ptnnCB+T0pdzOIOLRfnWmcUcDPuJK3aNmMPyCznGcDNy4ng
         No9mwRmb5u8fw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <edbfccf3-0723-b570-1315-a0951b530a66@denx.de>
References: <20220517235919.200375-1-marex@denx.de> <20220615201027.DFCC3C3411A@smtp.kernel.org> <edbfccf3-0723-b570-1315-a0951b530a66@denx.de>
Subject: Re: [PATCH v3 1/2] dt-bindings: clk: Introduce 'critical-clocks' property
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Wed, 15 Jun 2022 15:22:08 -0700
User-Agent: alot/0.10
Message-Id: <20220615222210.3D7F6C3411A@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2022-06-15 14:55:17)
> On 6/15/22 22:10, Stephen Boyd wrote:
> > Quoting Marek Vasut (2022-05-17 16:59:18)
> >> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.tx=
t b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> >> index f2ea53832ac63..d7f7afe2cbd0c 100644
> >> --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> >> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> >> @@ -169,6 +169,22 @@ a shared clock is forbidden.
> >>   Configuration of common clocks, which affect multiple consumer devic=
es can
> >>   be similarly specified in the clock provider node.
> >>  =20
> >> +=3D=3DCritical clocks=3D=3D
> >> +
> >> +Some platforms require some clocks to be always running, e.g. because=
 those
> >> +clock supply devices which are not otherwise attached to the system. =
One
> >> +example is a system where the SoC serves as a crystal oscillator repl=
acement
> >> +for a programmable logic device. The critical-clocks property of a cl=
ock
> >> +controller allows listing clock which must never be turned off.
> >> +
> >> +   clock-controller@a000f000 {
> >> +        compatible =3D "vendor,clk95;
> >> +        reg =3D <0xa000f000 0x1000>
> >> +        #clocks-cells =3D <1>;
> >> +        ...
> >> +        critical-clocks =3D <UART3_CLK>, <SPI5_CLK>;
> >=20
> > Historically "critical" is overloaded in the clk framework. We should
> > avoid using that name. What does "critical" even mean?
>=20
> It means those clock must not be turned off, but there is no consumer=20
> described in DT.

So it means "always on".

>=20
> > Instead I'd prefer "always-on-clocks" here, so we can indicate that
> > these clks should always be on. It would also parallel the property in
> > the regulator framework.
>=20
> This property name is derived from protected-clock which you introduced. =

> I think it would be better to stay consistent within the clock framework =

> property names ?

protected-clocks is based on assigned-clocks. There isn't a
CLK_IS_PROTECTED flag. I'm not following your argument at all here,
sorry.
