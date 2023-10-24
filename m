Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63810C07545
	for <linux-clk@archiver.kernel.org>; Tue, 24 Oct 2023 18:29:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344117AbjJXS3z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Oct 2023 14:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344125AbjJXS3y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Oct 2023 14:29:54 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C8E1700;
        Tue, 24 Oct 2023 11:29:48 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 979E0C433C7;
        Tue, 24 Oct 2023 18:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698172187;
        bh=DBD2rWLQEyiC0RDc78PSECbeTSuIL4yYh9YnwcYuePk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OlMXTglx8Bxf3AMENvHq9aL0wvNWuAgdDCbHXQjT6UGz1SxWg8kJBu9/cAg2OgXKO
         f8aHpAPw8vrx3uaCTP2K9n2VOYEKhcmfTBM/MTkX/I3+b1d7niRoSpK9AzQJ8jHNYo
         alhool1sX9TdJEMNl/OnMiiIT/zWEJ3fKch3s7z/9deOY1CcJTEUlVuxH14K7I3Toe
         9hY5EUvphqLJBpevsjCdix/CTl30C74fmZ+BMS+EZa5aMwFQQ6u4xurDOGrwsgzjaJ
         CPUSUtwzhY9I/YLC0g43ZzoQpVjWsGCG/0+7YUYr1w2fVHIRdReWnhbat5KUJOknru
         VeaFxyxGUmmmw==
Message-ID: <1d6b63192529f9ffd01d80421943b062.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cd7fa365-28cc-4c34-ac64-6da57c98baa6@moroto.mountain>
References: <cd7fa365-28cc-4c34-ac64-6da57c98baa6@moroto.mountain>
Subject: Re: [PATCH] clk: mediatek: fix double free in mtk_clk_register_pllfh()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Edward-JW Yang <edward-jw.yang@mediatek.com>,
        Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Johnson Wang <johnson.wang@mediatek.com>
Date:   Tue, 24 Oct 2023 11:29:45 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dan Carpenter (2023-10-23 22:00:53)
> The mtk_clk_register_pll_ops() currently frees the "pll" parameter.
> The function has two callers, mtk_clk_register_pll() and
> mtk_clk_register_pllfh().  The first one, the _pll() function relies on
> the free, but for the second _pllfh() function it causes a double free
> bug.
>=20
> Really the frees should be done in the caller because that's where
> the allocation is.
>=20
> Fixes: d7964de8a8ea ("clk: mediatek: Add new clock driver to handle FHCTL=
 hardware")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Applied to clk-next
