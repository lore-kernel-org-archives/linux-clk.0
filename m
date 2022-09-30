Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A0DC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 22:12:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232720AbiI3WMY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 18:12:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232686AbiI3WMT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 18:12:19 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B39101806D0;
        Fri, 30 Sep 2022 15:12:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C54E2B82A4D;
        Fri, 30 Sep 2022 22:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74725C433C1;
        Fri, 30 Sep 2022 22:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664575928;
        bh=Jo/Vgfba9De5xy/v6raQyqYE0lJYMx5B8RCbTNv97jY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bpwc+/EhGxFQzXBU6jftrABmxHnosUtKVU6MmlJ0n8UeqaiP29iqthhd9wUd7wLjJ
         I2+AfP59xvbdCvG2Dm/BcBGxm3J82KQrVO05I79uQRCVJ4/Q+u1Cn+VZnAQHx3OqvX
         dCoi7tmEIdV72rDz70kCyFzgrQ7tpbe3yf2UnhLsF3tmucIhXXqhVbQHfJPNKLmkCY
         Kz5S58GL/yep3UGdeAl7v7/cueFcaIKU2vyCyj69jX1jclE7ekIChsdPDnZzHKmPCG
         kND6wxv+6fR5/HP3ZFsOvD3Nerg3oyNuR6VoGpAb/64igxdFqKs9Q2TZ3oH7yxjopm
         rVZd2X8Bfu9MA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220822152652.3499972-5-msp@baylibre.com>
References: <20220822152652.3499972-1-msp@baylibre.com> <20220822152652.3499972-5-msp@baylibre.com>
Subject: Re: [PATCH v4 4/4] clk: mediatek: add driver for MT8365 SoC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Fabien Parent <parent.f@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Fri, 30 Sep 2022 15:12:06 -0700
User-Agent: alot/0.10
Message-Id: <20220930221208.74725C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Markus Schneider-Pargmann (2022-08-22 08:26:52)
> From: Fabien Parent <fparent@baylibre.com>
>=20
> Add clock drivers for MT8365 SoC.
>=20
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---

Applied to clk-next
