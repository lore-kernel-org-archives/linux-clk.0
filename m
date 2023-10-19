Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04EDFCDB465
	for <linux-clk@archiver.kernel.org>; Thu, 19 Oct 2023 08:54:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344920AbjJSIyk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Oct 2023 04:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235238AbjJSIyk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Oct 2023 04:54:40 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5884B12A;
        Thu, 19 Oct 2023 01:54:38 -0700 (PDT)
Received: from i5e861907.versanet.de ([94.134.25.7] helo=phil.lan)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1qtOnR-0001vg-Dr; Thu, 19 Oct 2023 10:54:25 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Chris Morgan <macroalpha82@gmail.com>,
        linux-rockchip@lists.infradead.org
Cc:     Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
        airlied@gmail.com, robh+dt@kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, Chris Morgan <macromorgan@hotmail.com>,
        neil.armstrong@linaro.org, sebastian.reichel@collabora.com,
        daniel@ffwll.ch, linux-clk@vger.kernel.org, sboyd@kernel.org,
        sam@ravnborg.org, conor+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Subject: Re: (subset) [PATCH 0/5] rockchip: Add Powkiddy RK2023
Date:   Thu, 19 Oct 2023 10:54:21 +0200
Message-Id: <169770556939.1297560.13095304413651630727.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231018161848.346947-1-macroalpha82@gmail.com>
References: <20231018161848.346947-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 18 Oct 2023 11:18:43 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Powkiddy RK2023, which is extremely similar to
> existing devices from Anbernic.
> 
> Chris Morgan (5):
>   dt-bindings: display: panel: Update NewVision NV3051D compatibles
>   drm/panel: nv3051d: Add Powkiddy RK2023 Panel Support
>   clk: rockchip: rk3568: Add PLL rate for 115.2MHz
>   dt-bindings: arm: rockchip: Add Powkiddy RK2023
>   arm64: dts: rockchip: add Powkiddy RK2023
> 
> [...]

Applied, thanks!

[3/5] clk: rockchip: rk3568: Add PLL rate for 115.2MHz
      commit: ccf59682a0287b81015dc1939203fac70b818c6b

I've gone forward and grabbed the PLL rate already, so it
can go together with the other rate addition from the fixes
series.

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
