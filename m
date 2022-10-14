Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BE1C4332F
	for <linux-clk@archiver.kernel.org>; Fri, 14 Oct 2022 20:39:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231569AbiJNUjp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Oct 2022 16:39:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231572AbiJNUjV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Oct 2022 16:39:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F86C108264;
        Fri, 14 Oct 2022 13:38:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0A69F61C3D;
        Fri, 14 Oct 2022 20:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53CD7C433D6;
        Fri, 14 Oct 2022 20:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665779919;
        bh=zD96eUSxSatwE9POdv8DucX3Ox8BNf2yVFULzp6knVo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hkUgk4QXkDFui74OYyvU7iGCacSjsw/u5doG3ZMrfqSQ3HUX/0g9W1CnA0nNT+pJE
         iah1PEGaYg4tT79oHejD5ehxK4hTJZbxGASzdx19O3PIz4QWWW0LyhH/ohj/XWVQsC
         7Rdd27KFPJjN5gRO6q81N33bKvC+IB5UPQ0tI4vZ7pTX8G35ifurA3s1W3xBL3Dt8Z
         3wlkGUVqI0Qu+KXpC9dx94tp+wDSgySvBqlrdreaAYfb8hazlwKFCj7dOSUOMNY1cQ
         4buV8N82Fmrw6OjrSXtQXfnnP5NKnpTworF4Ye4B9inBR/NRHvz8LEEjMGbC6VwMRe
         PcS5Hx/iI1HBg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221011135548.318323-1-angelogioacchino.delregno@collabora.com>
References: <20221011135548.318323-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] clk: mediatek: clk-mux: Add .determine_rate() callback
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com,
        chun-jie.chen@mediatek.com, miles.chen@mediatek.com,
        wenst@chromium.org, maxime@cerno.tech, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Date:   Fri, 14 Oct 2022 13:38:37 -0700
User-Agent: alot/0.10
Message-Id: <20221014203839.53CD7C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2022-10-11 06:55:48)
> Since commit 262ca38f4b6e ("clk: Stop forwarding clk_rate_requests
> to the parent"), the clk_rate_request is .. as the title says, not
> forwarded anymore to the parent: this produces an issue with the
> MediaTek clock MUX driver during GPU DVFS on MT8195, but not on
> MT8192 or others.
>=20
> This is because, differently from others, like MT8192 where all of
> the clocks in the MFG parents tree are of mtk_mux type, but in the
> parent tree of MT8195's MFG clock, we have one mtk_mux clock and
> one (clk framework generic) mux clock, like so:
>=20
> names: mfg_bg3d -> mfg_ck_fast_ref -> top_mfg_core_tmp (or) mfgpll
> types: mtk_gate ->      mux        ->     mtk_mux      (or) mtk_pll
>=20
> To solve this issue and also keep the GPU DVFS clocks code working
> as expected, wire up a .determine_rate() callback for the mtk_mux
> ops; for that, the standard clk_mux_determine_rate_flags() was used
> as it was possible to.
>=20
> This commit was successfully tested on MT6795 Xperia M5, MT8173 Elm,
> MT8192 Spherion and MT8195 Tomato; no regressions were seen.
>=20
> For the sake of some more documentation about this issue here's the
> trace of it:
>=20

Applied to clk-next
