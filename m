Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 783C7C74A5B
	for <linux-clk@archiver.kernel.org>; Mon, 13 Mar 2023 18:48:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbjCMSsQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Mar 2023 14:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231473AbjCMSsJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Mar 2023 14:48:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC84867C7;
        Mon, 13 Mar 2023 11:47:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C0F66B811E3;
        Mon, 13 Mar 2023 18:47:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 610B1C433B0;
        Mon, 13 Mar 2023 18:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678733261;
        bh=KNZm7BF1ODafgReuskP+IS2SkYTX3gtgFqvZ/7EdkYo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LFalRcQc24xar7l0NpoULgI9kgyJ6yOXKYI1svfUl47FuvmUPkZsVCc4GpBGN6EHi
         GidjYPM5QtOIcRN8a5HrfGx9mA+EsxotR490GD3FcTWIozuIHLaCRrX0OSGT5q419t
         gakKkb45n1HQesFJkv/Z9UKcCWkSKYmx/TR45hceZjZx9WswHb4VPNglGygbFGLxWZ
         z574PRl+OmdnssuNu3g3sJzpDmIA38kI3LwwjBJhQFrJA1TE535tnrQ+0vYgZdTC3I
         A7lVLNmrQ59MDZxI44AL7aXW06EppXplupssT+eDnG+TGsgHYXdvZZsR/JhTyTgV/x
         JuWBEKCEAIM9Q==
Message-ID: <bb73082166b0c28d15035da36b629642.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230206100105.861720-6-angelogioacchino.delregno@collabora.com>
References: <20230206100105.861720-1-angelogioacchino.delregno@collabora.com> <20230206100105.861720-6-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 5/7] clk: mediatek: mt8173: Add support for frequency hopping through FHCTL
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
Date:   Mon, 13 Mar 2023 11:47:39 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2023-02-06 02:01:03)
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
