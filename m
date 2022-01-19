Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FE1C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jan 2022 02:18:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350874AbiASCSr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Jan 2022 21:18:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348177AbiASCSr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Jan 2022 21:18:47 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33DC7C061574
        for <linux-clk@vger.kernel.org>; Tue, 18 Jan 2022 18:18:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 99253B81890
        for <linux-clk@vger.kernel.org>; Wed, 19 Jan 2022 02:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C225C340E5;
        Wed, 19 Jan 2022 02:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642558724;
        bh=quWTO0BctwTPOXaro7ImoNZv9OKkQlUcJBr0qz2PkM0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=I2wfYoZPydKxYX2k9hfHwmSPOWsUmeHRg7koyHrH+mcuS7OBh03to7iUvxbs/qqv5
         gqVtqSLy0TWdw0PDT03B/HwWbJ9ekd18DKUyAL1O2ATBPezTTPf2j95nnbPOlFSGU5
         KaWG33xLuIPqwG1LCYX113tUZ3EJC2nintt8SsQwblusOemzpzWOXbAEtz+96ZuPOV
         SaNm2gSkSvT5qsfvXUBPJ4r7N1FpD3LIbPre8s34y8+8tkkqnSDEpCd6J/ZMriHBC4
         /Jwete5LN1X+fytA5sdNCqti7mHiZaqYTh46E1amG+kuu/J6uv0pX8g0M53N/q3pEi
         0eqI10uT6XeSQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <69525223-7d90-5714-bbe9-4d7f0b9a293d@arm.com>
References: <20220110181330.3224-1-alyssa.rosenzweig@collabora.com> <eb6d11af-ff48-a366-d428-77bcaa250a8a@arm.com> <YeF/AYZ0DuKGwLLk@maud> <CAGXv+5H9BsNUdiY6zMH6THKKMvRdPypNtUEVviMHQEjgNGDk_A@mail.gmail.com> <69525223-7d90-5714-bbe9-4d7f0b9a293d@arm.com>
Subject: Re: [PATCH] clk: mediatek: Disable ACP to fix 3D on MT8192
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        linux-mediatek@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Ikjoon Jang <ikjn@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Weiyi Lu <weiyi.lu@mediatek.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Nick Fan <Nick.Fan@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>
To:     Alyssa Rosenzweig <alyssa@collabora.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>
Date:   Tue, 18 Jan 2022 18:18:42 -0800
User-Agent: alot/0.10
Message-Id: <20220119021844.3C225C340E5@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Robin Murphy (2022-01-18 07:01:46)
> On 2022-01-18 07:19, Chen-Yu Tsai wrote:
> > Hi,
> >=20
> > On Fri, Jan 14, 2022 at 9:47 PM Alyssa Rosenzweig <alyssa@collabora.com=
> wrote:
> >>
> >>>> That links to an internal Google issue tracker which I assume has mo=
re
> >>>> information on the bug. I would appreciate if someone from Google or
> >>>> MediaTek could explain what this change actually does and why it's
> >>>> necessary on MT8192.
> >>>>
> >>>> At any rate, this register logically belongs to the MT8192 "infra" c=
lock
> >>>> device, so it makes sense to set it there too. This avoids adding any
> >>>> platform-specific hacks to the 3D driver, either mainline (Panfrost)=
 or
> >>>> legacy (kbase).
> >>>
> >>> Does this really have anything to do with clocks?
> >>
> >> I have no idea. MediaTek, Google, please explain.
> >>
> >>> In particular, "ACP" usually refers to the Accelerator Coherency Port
> >>> of a CPU cluster or DSU, and given the stated symptom of the issue
> >>> affected by it, my first guess would be that this bit might indeed
> >>> control routing of GPU traffic either to the ACP or the (presumably
> >>> non-coherent) main interconnect.
> >>
> >> I'd easily believe that.
> >=20
> > As Robin guessed, "ACP" here does refer to the Accelerator Coherency Po=
rt.
> > And the bit in infracfg toggles whether ACP is used or not.
> >=20
> > Explanation from MediaTek in verbatim:
> >=20
> > -----------------------------------------------------------------------=
--
> > The ACP path on MT8192 is just for experimental only.
> > We are not intended to enable ACP by design.
> >=20
> > But due to an unexpected operation, it was accidently opened by default.
> > So we need a patch to disable the ACP for MT8192.
> > -----------------------------------------------------------------------=
--
>=20
> Aha! That's great, thanks ChenYu!
>=20
> Stephen, my thinking here is that if this feature controls the GPU=20
> interconnect, and only matters when the GPU is going to be used (as=20
> strongly implied by the downstream implementation), then the GPU driver=20
> is the only interested party and may as well take responsibility if=20
> there's no better alternative.
>=20
> I'd agree that if there was already a "base" infracfg driver doing=20
> general system-wide set-and-forget configuration then it would equally=20
> well fit in there, but that doesn't seem to be the case.

Wouldn't this first set-and-forget configuration fit that bill? We can't
have a "base" driver because why?

> Short of trying=20
> to abuse the bp_infracfg data in the mtk-pm-domains driver (which=20
> doesn't seem like a particularly pleasant idea), the code to poke a bit=20
> into a syscon regmap is going to be pretty much the same wherever we add =

> it. There's already a bit of a pattern for MTK drivers to look up and=20
> poke their own infracfg bits directly as needed, so between that and the =

> downstream implementation for this particular bit, leaving it to=20
> Panfrost seems like the least surprising option.
>=20

I'd prefer we leave the SoC glue out of device drivers for subsystems
that really don't want to or need to know about the SoC level details.
The GPU driver wants to live life drawing triangles! :) It doesn't want
to know that the ACP path didn't work out on some SoC it got plopped
down into. And of course GPU is the only interested party, because the
SoC glue for the GPU is all messed up so GPU can't operate properly
without this bit toggled. I wonder where the fix would end up if this
port was shared by more than one driver. Probably back here in the
closest thing there is to the SoC driver.

It's not as simple as poking bits in some SoC glue IO space
unconditionally either. The GPU driver will need to know which SoC is
being used and then only poke the bits if the affected SoC is in use. Or
we'll have some DT binding update to poke the bit if some syscon
property is present in the DT node. Either way, it's a set-and-forget
thing, so the GPU driver will now have some set-and-forget logic for one
SoC out of many that it supports; do it once at boot, grab a regmap,
parse some more stuff to make sure it's needed, poke the bit, release
the regmap, finally start drawing.

Of course, I won't oppose the mess being moved somewhere outside of the
subsystem I maintain ;-) I was mainly curious to understand why the
regmap path is proposed.
