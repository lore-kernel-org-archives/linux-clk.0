Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A7DC74A4B
	for <linux-clk@archiver.kernel.org>; Mon, 13 Mar 2023 18:54:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231340AbjCMSyo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Mar 2023 14:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231542AbjCMSy1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Mar 2023 14:54:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33966D535;
        Mon, 13 Mar 2023 11:53:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A3C4C61469;
        Mon, 13 Mar 2023 18:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BAB5C433D2;
        Mon, 13 Mar 2023 18:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678733280;
        bh=/d48bhLyzRVyeGxbnJF3Qv5h7/XTC0mhguBxZRlvvqU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=GfHGVKoxU0W/N2wLo63mnd3Wc7tjoxw0cGbP7H/w/QB19ZggiY552NYKNip1AuS7O
         yyEhBH5QUlTGepcYtQ0rYggBoxFGql5gkm+/6tE56b+9lS7Aszl6U3Uw11ZuLiRxbl
         icEgjpYGDpuvQaidAQ+DoXKSfAmEC9XMwwHAe5fteGtrtJ8x/7Lx0KXHS9HEmbzWLO
         RTfX5PzuiaXOTdpdG4PJEil+sMdxq5mEBJWaH60BSkHM8rFfpRuQ3Gzu7rihSDEYUp
         Hi1BVYbP7E5WI9ncfgl22zSPBmHMqY9zEoEFS18oQT76bnG8/W0hZTazCNFmWO9OX/
         Tze0GVrUJZQOg==
Message-ID: <f0333440693d55316a064e3ad1dbd307.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230206100105.861720-8-angelogioacchino.delregno@collabora.com>
References: <20230206100105.861720-1-angelogioacchino.delregno@collabora.com> <20230206100105.861720-8-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 7/7] clk: mediatek: mt8195: Add support for frequency hopping through FHCTL
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
Date:   Mon, 13 Mar 2023 11:47:58 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2023-02-06 02:01:05)
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
