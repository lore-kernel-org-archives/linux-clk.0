Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066A2C6FD19
	for <linux-clk@archiver.kernel.org>; Mon, 13 Mar 2023 18:48:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbjCMSsz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Mar 2023 14:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbjCMSsw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Mar 2023 14:48:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B97D23DB2;
        Mon, 13 Mar 2023 11:48:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DF6586147A;
        Mon, 13 Mar 2023 18:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9E3C433D2;
        Mon, 13 Mar 2023 18:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678733252;
        bh=GU8KgpwJk2DA/OR7maXDLOg5h4wrn25AGwbgvBf9iqw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=E/zVWhhLHi/WqHCMT7zAoghn3bUcdbovogtM3NORJN7yQoJMzMOeu0AwoW1tpvngq
         lHzXnAMUq6O8FojB+jqRDOG5qrlpFsPi4a8E6Kchobflxujsmyf5sVby0hL3TzQMen
         A2f53L+qQNGuDSuMWxnA7QS0vb0Clz7m3SxDV6kqPpPoxfVxfgFhldoXvzdLboLTdR
         y2kpUDXHXGkoGnHdgB+jI6wekAhKYpI7vFBQsqU4FswG1boXWm8ifVJcELutyhCsFS
         hzbrHswuCe4oTr5F0hZ8MxKyFLKfmY3ghvOjFXvqGJz8ED0QJBm47ijngrkl3DL4kw
         xEbZyxa96Prng==
Message-ID: <a9ee130db23118fb7b94be88d5be70ec.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230206100105.861720-5-angelogioacchino.delregno@collabora.com>
References: <20230206100105.861720-1-angelogioacchino.delregno@collabora.com> <20230206100105.861720-5-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 4/7] clk: mediatek: mt6795: Add support for frequency hopping through FHCTL
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com,
        edward-jw.yang@mediatek.com, johnson.wang@mediatek.com,
        wenst@chromium.org, miles.chen@mediatek.com,
        chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com,
        jose.exposito89@gmail.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Date:   Mon, 13 Mar 2023 11:47:30 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2023-02-06 02:01:02)
> Add FHCTL parameters and register PLLs through FHCTL to add support
> for frequency hopping and SSC. FHCTL will be enabled only on PLLs
> specified in devicetree.
>=20
> This commit brings functional changes only upon addition of
> devicetree configuration.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next
