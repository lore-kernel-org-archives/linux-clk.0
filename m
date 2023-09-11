Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3ABCCA0EDA
	for <linux-clk@archiver.kernel.org>; Mon, 11 Sep 2023 22:00:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236711AbjIKV7e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Sep 2023 17:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244438AbjIKUc0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Sep 2023 16:32:26 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE233FB;
        Mon, 11 Sep 2023 13:32:20 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57DB3C433C8;
        Mon, 11 Sep 2023 20:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694464340;
        bh=gkJtNfISerIA7gwmSqPXIKAOxbGkK5wwyEPfgZ0HhLs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sgs/ROxaHaBrq99VhTdvJCJm+mgJNqnQcuMBloJ6IsXQTemSdVAPRlSkaqq6ukcOm
         +JUwz7VRBF+5X6PXQxTR96MzJql2jpVIuHg22ntYZ0RNoqgmTNcMV5ERnZqrV3DHuk
         bl8FxDbWFJmvuWXZI1mvRGcAyh62Vap/tBgX7AKxZb2RfbNreF3sDrtXWO3Llq/UPi
         ZZ3VQvjaepFUxyOnbDxGJW/pwlykiWPvz1JoL8d9YRfJwh1uXFzBH8vXVJu+2ZWYOw
         hlaqAVqzyNJHaoselppsyjyEgEjgMDMJ9Ni1PiOcceIiuomYzHwWZJQkN3uGHCn7/6
         KESdaUonghoTQ==
Message-ID: <dc833f3a32c583ae474e040db1b2eca0.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230824104812.147775-4-biju.das.jz@bp.renesas.com>
References: <20230824104812.147775-1-biju.das.jz@bp.renesas.com> <20230824104812.147775-4-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v5 3/4] clk: vc3: Fix output clock mapping
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 11 Sep 2023 13:32:18 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Biju Das (2023-08-24 03:48:11)
> According to Table 3. ("Output Source") in the 5P35023 datasheet,
> the output clock mapping should be 0=3DREF, 1=3DSE1, 2=3DSE2, 3=3DSE3,
> 4=3DDIFF1, 5=3DDIFF2. But the code uses inverse. Fix this mapping issue.
>=20
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Closes: https://lore.kernel.org/all/CAMuHMdUHD+bEco=3DWYTYWsTAyRt3dTQQt4X=
paejss0Y2ZpLCMNg@mail.gmail.com/
> Fixes: 6e9aff555db7 ("clk: Add support for versa3 clock driver")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-fixes
