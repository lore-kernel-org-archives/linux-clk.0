Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCAFCA0ED4
	for <linux-clk@archiver.kernel.org>; Mon, 11 Sep 2023 22:00:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355517AbjIKWAQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Sep 2023 18:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244439AbjIKUce (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Sep 2023 16:32:34 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5BEFB;
        Mon, 11 Sep 2023 13:32:31 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D300C433C7;
        Mon, 11 Sep 2023 20:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694464350;
        bh=Nz9UgSpoElaBhMustx9ODq3COylfItg02BZZWs2qYag=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=S4OxBNwvvuRZpnLO8RQ+RUvIVe3N22yb6L/ochbJknxlwlvr4kp4zK/5xtu79coJp
         zevRaC0etotCPe/JaoPrLF5aiUBC0Bpu19aoByU+agGzo2ytsqAC9B6AU1v5N64FXF
         iIGoEJBcbA2DcT/XBe3hHDazQ20QwgC8g+qlFNmyTL80LfKuE9EhyZ/u4R+jZUPhA8
         uWR1sd166ejq224IbbaVwXc/yqtrdGeuAIM996veYpEh1iXx6VcA8TU3NPxLamBHRW
         rxooS4Pl1ELcTowTN2DcOL2vMEvOcFFz3GlPnCTkVHoLNERBhy75XARoz49c8L/km/
         QDp8Ka3r8T8wA==
Message-ID: <4f69467568f1bdf03c2ce8267a3d0cea.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230824104812.147775-5-biju.das.jz@bp.renesas.com>
References: <20230824104812.147775-1-biju.das.jz@bp.renesas.com> <20230824104812.147775-5-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v5 4/4] clk: vc3: Make vc3_clk_mux enum values based on vc3_clk enum values
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 11 Sep 2023 13:32:28 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Biju Das (2023-08-24 03:48:12)
> Make vc3_clk_mux enum values depend upon vc3_clk enum values=C3=82=C2=A0t=
o avoid
> any accidental breakage in the future.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Applied to clk-fixes
