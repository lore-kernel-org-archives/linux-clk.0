Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A2BC74A5B
	for <linux-clk@archiver.kernel.org>; Mon, 13 Mar 2023 18:49:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbjCMStG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Mar 2023 14:49:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbjCMStB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Mar 2023 14:49:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A33462B53;
        Mon, 13 Mar 2023 11:48:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6B9F661416;
        Mon, 13 Mar 2023 18:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C72F2C433EF;
        Mon, 13 Mar 2023 18:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678733270;
        bh=9Z8ToBN/G7IYieOVNp9lKp1J2Q80IWODciLboMPS0yU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TaGuVYZDc7uUdi8c441+1M+3zcsjxtDhKRgMzvCHIeBAQMPvEnku7WxdqEp7RpMF5
         2mAYyi4flD6+U41V98C2zQV/0tO6//FYZ/BfXGyebSyDbSEQtx1GgbL8WtcKRZaQD/
         FnmUkNSE1bVUABWmkedcWLBo/o9vdRFpHEFQMHwAPXogd9/mmRM2B6UJ1bUBtabYfR
         7hVChr4e3aIyTxhWoX2tovwHAHijnQ7s3JPgCTxHPzxnJ6BEQjXLAjfKFodDXnY1ov
         x3nKVR5/J9KwwhqElDqz7K46hK/BpJT0618xeURhRWfZfYJVaIZS7M703vvBIRQmu4
         t32S/NefLh8fA==
Message-ID: <4fe51e2b88df2c189a1a93453766a066.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230206100105.861720-7-angelogioacchino.delregno@collabora.com>
References: <20230206100105.861720-1-angelogioacchino.delregno@collabora.com> <20230206100105.861720-7-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 6/7] clk: mediatek: mt8192: Add support for frequency hopping through FHCTL
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
Date:   Mon, 13 Mar 2023 11:47:48 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2023-02-06 02:01:04)
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
