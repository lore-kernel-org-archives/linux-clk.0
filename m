Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63EF4C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 14 Jan 2022 22:55:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbiANWze (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Jan 2022 17:55:34 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:53932 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbiANWzd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Jan 2022 17:55:33 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5695862047
        for <linux-clk@vger.kernel.org>; Fri, 14 Jan 2022 22:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C6DC36AEA;
        Fri, 14 Jan 2022 22:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642200932;
        bh=M532S7NuMc5guV+TrEqveWTIocIumpQzI6P1DHrrZQU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=QyvA0f0qY8QqYZAbFV5Wq3fsZiJDeU8KPnsow24DmPU8jvx14aHeNQg0j43ajNB1p
         1YONEyYEnDapqSU03zz0pTXoGuAzazVB43mPssU0R1YMRJAFXQ2TrolvckB3m93tUL
         xdmf7oosQeSw+6r1S1OR+P/gHkZrK/RqCHVeOZMAOOmi0DIIK9WqcgsG37sOefnbri
         FudkYswGSXsBWn1gGnyxeh4NT2s2WPusa14xJXrePX6zrKrEwIiI0LDaZ6MtFeS+6W
         lWaU7H3iw28P4FlAwNNjsnhxF5mH6CehCndbXcz+lmNWHFx5rUSkOik9aZ4hNjPeRW
         RPt44RAJSd2Mg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <eb6d11af-ff48-a366-d428-77bcaa250a8a@arm.com>
References: <20220110181330.3224-1-alyssa.rosenzweig@collabora.com> <eb6d11af-ff48-a366-d428-77bcaa250a8a@arm.com>
Subject: Re: [PATCH] clk: mediatek: Disable ACP to fix 3D on MT8192
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Ikjoon Jang <ikjn@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Weiyi Lu <weiyi.lu@mediatek.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Nick Fan <Nick.Fan@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>
To:     Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-mediatek@lists.infradead.org
Date:   Fri, 14 Jan 2022 14:55:30 -0800
User-Agent: alot/0.10
Message-Id: <20220114225532.B0C6DC36AEA@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Robin Murphy (2022-01-14 05:23:51)
> On 2022-01-10 18:13, Alyssa Rosenzweig wrote:
> > Set a mysterious chicken bit in the MT8192 clock driver (!) to get the
> > Mali GPU on MT8192 to work. This workaround is from the downstream Mali
> > driver shipped in ChromeOS. The change there is unsuitable for mainline
> > but good as a reference for the hardware behaviour:
> >=20
> > https://chromium-review.googlesource.com/c/chromiumos/third_party/kerne=
l/+/2781271/5
> >=20
> > That links to an internal Google issue tracker which I assume has more
> > information on the bug. I would appreciate if someone from Google or
> > MediaTek could explain what this change actually does and why it's
> > necessary on MT8192.
> >=20
> > At any rate, this register logically belongs to the MT8192 "infra" clock
> > device, so it makes sense to set it there too. This avoids adding any
> > platform-specific hacks to the 3D driver, either mainline (Panfrost) or
> > legacy (kbase).
>=20
> Does this really have anything to do with clocks? My (uninformed)=20
> impression is that the infracfg blocks are general amalgamations of=20
> configuration registers that simply happen to contain clock and reset=20
> controls among other functionality. In particular, "ACP" usually refers=20
> to the Accelerator Coherency Port of a CPU cluster or DSU, and given the =

> stated symptom of the issue affected by it, my first guess would be that =

> this bit might indeed control routing of GPU traffic either to the ACP=20
> or the (presumably non-coherent) main interconnect.
>=20
> If that is the case, I think this would logically belong as a=20
> SoC-specific quirk in panfrost, where we'd need to retrieve the syscon=20
> regmap for ourselves (see around line 800 of drivers/iommu/mtk_iommu.c=20
> for a similar example).

What's the benefit of putting this into the GPU driver? Is it going to
be runtime managed? It seems most logically related to the SoC or
interconnect, for which there isn't any device driver but there could
be.
