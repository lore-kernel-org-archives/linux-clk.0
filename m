Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5ACC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 15 Mar 2022 23:52:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240824AbiCOXxi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Mar 2022 19:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344372AbiCOXxh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Mar 2022 19:53:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEEF65DA6E;
        Tue, 15 Mar 2022 16:52:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1C1C6B819C4;
        Tue, 15 Mar 2022 23:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B005FC340E8;
        Tue, 15 Mar 2022 23:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647388340;
        bh=sOtInCF0hZ6fW10dwSAqSoHzmwagl4Jp1zLZzFMYLUc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=D2ZoP6D4NiAUBM2aPLInRYm34sGnWhrQOUC5T8siHrQnFeyD5MI8qOj0OKz+JiJYw
         FHVFvrhsRlqo47/VdlBqd+soJ0nL1mccvi6cvkZ3eobIagR1HiK4S5v7AtqoclQZNT
         ZHHXYvb8VqcC6xp+vBks/0vz1W0hhCUygL1Pmm/sc7OtSsthM4T6+ZfmToMkCrOAbG
         Wl/r87EWzp1od8ycREDLwv+PDwUeI+Tm4XsJNAS1aVJ/SWw3vkaNR0wtwSdpQiElTg
         zuR7KiBxeXaQRB2bGh1iBYWmbX1+CV+ZRs6Nlb3Z30HCsS4oophhhuTm1wEPvBuc9x
         cp7MDWgiT0+bA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <00479d7f-1124-de8b-d125-40f8139331f1@denx.de>
References: <20220215084412.8090-1-marex@denx.de> <20220215084412.8090-2-marex@denx.de> <20220217222328.7F7B3C340E8@smtp.kernel.org> <77c85470-5378-8c8b-8e5f-d57c83773ed6@denx.de> <4f1b946d-ee82-bd0e-c51e-100c23b87fdf@denx.de> <20220312050419.2AB91C340EE@smtp.kernel.org> <00479d7f-1124-de8b-d125-40f8139331f1@denx.de>
Subject: Re: [PATCH 2/3] clk: Introduce 'critical-clocks' property
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Tue, 15 Mar 2022 16:52:18 -0700
User-Agent: alot/0.10
Message-Id: <20220315235220.B005FC340E8@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2022-03-12 02:26:17)
> On 3/12/22 06:04, Stephen Boyd wrote:
> > Quoting Marek Vasut (2022-03-09 12:54:35)
> >> On 2/21/22 01:58, Marek Vasut wrote:
> >>> On 2/17/22 23:23, Stephen Boyd wrote:
> >>>
> >>>> I see that there isn't any more 'clock-critical' in the kernel's dts=
 so
> >>>> I wonder if we would be able to get rid of that function or at least
> >>>> hollow it out and see if anyone complains. Either way, what is the
> >>>> actual problem trying to be solved? If the crystal oscillator isn't =
used
> >>>> anywhere in the kernel why are we registering it with the clk framew=
ork?
> >>>
> >>> The problem is the other way around -- the SoC clock IPs often have a
> >>> couple of general purpose clock routed to various SoC IO pins, those
> >>> clock can be used for any purpose, and those are already registered w=
ith
> >>> kernel clock framework. Some devices save on BoM and use those general
> >>> purpose clock to supply clock networks which are otherwise not
> >>> interacting with the kernel, like some CPLD for example. Since from t=
he
> >>> kernel point of view, those clock are unused, the kernel can turn tho=
se
> >>> clock OFF and that will make the entire device fail.
> >>>
> >>> So this critical-clocks property permits marking clock which must not
> >>> ever be turned OFF accordingly.
> >>
> >> How can we proceed here ?
> >=20
> > Why are we registering the clks with the framework on device that are
> > saving on BoM and using them outside of the kernel. What is the use of
> > kernel memory for struct clk_core that aren't ever used?
>=20
> Those clock may be used to supply a device in DT on another hardware=20
> using the same SoC.
>=20
> Take e.g. this random git grep result:
>=20
> arch/arm/boot/dts/imx7d-remarkable2.dts
> / {
>    wifi_pwrseq {
>      ...
>      clocks =3D <&clks IMX7D_CLKO2_ROOT_DIV>;
>      ...
>    };
> };
>=20
> This IMX7D_CLKO2_ROOT_DIV is one such general purpose clock output. In=20
> the aforementioned case, it is used to supply 32 kHz clock to a WiFi=20
> chip, i.e. it has a consumer in DT. These clock are registered by the=20
> platform clock driver:
>=20
> drivers/clk/imx/clk-imx7d.c
>=20
> But those clock can also be used to supply e.g. CPLD which has no other=20
> connection to the SoC but the clock. That is where it needs this=20
> critical-clocks property. Because then there is no consumer in DT. So=20
> the kernel will now think the clock are not used and will turn them off=20
> after boot, thus e.g. crashing such platform.
>=20
> So in the later case, the DT would contain the following to avoid the cra=
sh:
> &clks {
>    critical-clocks =3D <IMX7D_CLKO2_ROOT_DIV>;
> };

Got it. Why, in the latter case, would we register the clk with the clk
framework? I can see that they're "critical" in the sense that there's
no consumer node in DT and we want to make sure that nothing turns it
off. But it's also wasteful to even register the clk with the kernel
because no device is using it. It feels like we need a property like
'clock-dont-register' which is very simiilar to 'protected-clocks'.
There's already a binding for 'protected-clocks' so maybe that should be
reused and the definition of what the property means can be flexible to
handle the various use cases. The cases would be first this one here
where a clock doesn't matter because nobody uses it and second how it is
used on qualcomm SoCs where they have blocked access to certain clk
registers in the firmware so that the system crashes if we try to
read/write those clk registers.

The dt-binding can be reworded as "the OS shouldn't use these clks" and
then the implementation can skip registering those clks with the
framework.
