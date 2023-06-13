Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44250C7EE43
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 01:20:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbjFMBUo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 21:20:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236433AbjFMBUn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 21:20:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6AA21728;
        Mon, 12 Jun 2023 18:20:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 20F8A62E74;
        Tue, 13 Jun 2023 01:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FA9C433D2;
        Tue, 13 Jun 2023 01:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686619237;
        bh=nMTjj6z1aJO7b2UchCOr1ylRwdXqGyT5I/GFrTW51Q8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nOnXZOmRkf9MNLKNySEhayFAHH2rHoxjPb86DdV9ltPb7lKLIk8d7FGOFfc/KaF2C
         2d0eHk7oelFeUWpq3nKquDWvEK4f+B+7Oo6O4ulsqTW+u3gQHlnZMg7zvdtnSPO+iW
         /ADiUs6uvJR7v7E2sq70y2WC5sBtd7ifMizL4cfNPZnSP5v2411FNnklcZYNU5REuq
         TNllPv7pAjNDkRipPwlm5Wf2JFHog0V24m/Lq7R2UksjlwZh5hmYG7JVG7/pzFbs1w
         8E8mExKmmyeod3AlK7UDqLgxirLDrNHBY0Rg8VstL0STBd30GNtCd03D8RDTMoUQX9
         QTOHQpnASS4JQ==
Message-ID: <e88bc99a407c1c12b22e20d7b29fbc5e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230516135205.372951-3-angelogioacchino.delregno@collabora.com>
References: <20230516135205.372951-1-angelogioacchino.delregno@collabora.com> <20230516135205.372951-3-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 2/2] clk: mediatek: Remove CLK_SET_PARENT from all MSDC core clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        wenst@chromium.org, chun-jie.chen@mediatek.com,
        mandyjh.liu@mediatek.com, miles.chen@mediatek.com,
        zhaojh329@gmail.com, daniel@makrotopia.org,
        nfraprado@collabora.com, rex-bc.chen@mediatek.com,
        Garmin.Chang@mediatek.com, msp@baylibre.com,
        yangyingliang@huawei.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, mturquette@baylibre.com
Date:   Mon, 12 Jun 2023 18:20:35 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2023-05-16 06:52:05)
> Various MSDC core clocks, used for multiple MSDC controller instances,
> share the same parent(s): in order to add parents selection in the
> mtk-sd driver to achieve an accurate clock rate for all modes, remove
> the CLK_SET_RATE_PARENT flag from all MSDC clocks for all SoCs: this
> will make sure that a clk_set_rate() call performed for a clock on
> a secondary controller will not change the rate of a common parent,
> which would result in an overclock or underclock of one of the
> controllers.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---

Applied to clk-next
