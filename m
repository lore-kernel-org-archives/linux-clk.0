Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0130DC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 17 Feb 2022 21:40:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242901AbiBQVk3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Feb 2022 16:40:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbiBQVk3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Feb 2022 16:40:29 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F52166E24
        for <linux-clk@vger.kernel.org>; Thu, 17 Feb 2022 13:40:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 53A3461699
        for <linux-clk@vger.kernel.org>; Thu, 17 Feb 2022 21:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3523C340E8;
        Thu, 17 Feb 2022 21:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645134013;
        bh=zPrhX6k02e96zl7KllkvOgDxEiUJZNdS53PBR6YrUdw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OQmR4QkM056D63THM2zznP9VUiTMw4cIvoMui4+aPVzMoiL+2BP7DplXcsBuRDE/0
         IoBzs1LG82niyUTLVQ/hE/3JTpVY7FynZg1WCUCI0Ln8FE7Uv9KInyEtpQWAfLV0H/
         EkmYY64GEZBWYLV6nKcn4yiVjRn4uqf4BXIaKGMHNRVIqxIYGrIO0dMT/KrD+ZXop/
         CW8f6ChbfZoc1j+C8T5hYXcD4Qc/SYfPetO+qaDPxKK6H/b4XqvQ5FRoJRKxNF92+h
         9JeV8PeytMbDbiEjo3AAUG+zTMHTxdYMwK9W/umZfdciSC7tEDuxdDuSoNPMsxXCJ0
         CuBUejYjFXeOg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9f05238c-4649-0673-21eb-7b7562d0d5c1@arm.com>
References: <20220110181330.3224-1-alyssa.rosenzweig@collabora.com> <eb6d11af-ff48-a366-d428-77bcaa250a8a@arm.com> <YeF/AYZ0DuKGwLLk@maud> <CAGXv+5H9BsNUdiY6zMH6THKKMvRdPypNtUEVviMHQEjgNGDk_A@mail.gmail.com> <69525223-7d90-5714-bbe9-4d7f0b9a293d@arm.com> <20220119021844.3C225C340E5@smtp.kernel.org> <5d839338-6072-9c52-1893-2f804d937ea1@arm.com> <YelxN/zpdkukBBqy@maud> <c69fcd5d-a79b-ed0e-e803-63bebe987390@collabora.com> <9f05238c-4649-0673-21eb-7b7562d0d5c1@arm.com>
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
        Nicolas Boichat <drinkcat@chromium.org>,
        Chen-Yu Tsai <wenst@chromium.org>
To:     Alyssa Rosenzweig <alyssa@collabora.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Robin Murphy <robin.murphy@arm.com>
Date:   Thu, 17 Feb 2022 13:40:11 -0800
User-Agent: alot/0.10
Message-Id: <20220217214013.A3523C340E8@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Robin Murphy (2022-02-15 07:21:52)
> On 2022-02-15 10:44, AngeloGioacchino Del Regno wrote:
>=20
> All in all this has now convinced me that it *is* worth the slight extra
> effort to put random infracfg stuff in the random infracfg stuff place.
> And by "slight" I mean it turns out I've spent longer writing this prose
> than bashing out the illustrative diff below, which is the last opinion
> I shall have on this matter. Feel free to take it and fix it, or do=20
> anything else if you prefer :)
>=20
> Cheers,
> Robin.
>=20

Acked-by: Stephen Boyd <sboyd@kernel.org>
