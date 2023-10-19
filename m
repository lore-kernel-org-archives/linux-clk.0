Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28041CDB482
	for <linux-clk@archiver.kernel.org>; Thu, 19 Oct 2023 08:54:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232908AbjJSIyi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Oct 2023 04:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231792AbjJSIyi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Oct 2023 04:54:38 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E7CCAB;
        Thu, 19 Oct 2023 01:54:35 -0700 (PDT)
Received: from i5e861907.versanet.de ([94.134.25.7] helo=phil.lan)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1qtOnQ-0001vg-JV; Thu, 19 Oct 2023 10:54:24 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Chris Morgan <macroalpha82@gmail.com>,
        linux-rockchip@lists.infradead.org
Cc:     Heiko Stuebner <heiko@sntech.de>, robh+dt@kernel.org,
        devicetree@vger.kernel.org, mturquette@baylibre.com,
        Chris Morgan <macromorgan@hotmail.com>, sboyd@kernel.org,
        linux-clk@vger.kernel.org, conor+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH 0/3] Fixes for RGB30
Date:   Thu, 19 Oct 2023 10:54:20 +0200
Message-Id: <169770556937.1297560.1024214364752104181.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231018153357.343142-1-macroalpha82@gmail.com>
References: <20231018153357.343142-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 18 Oct 2023 10:33:54 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> After preliminary testing, a few users requested that I see if I can
> make the panel run at precisely 60hz. As the device is typically used
> for retro gaming, getting the panel to refresh as close to 60hz as
> possible is important.
> 
> [...]

Applied, thanks!

[1/3] clk: rockchip: rk3568: Add PLL rate for 292.5MHz
      commit: bb8ab7335bd2f55706fd09f5ce431207a746d99a
[2/3] arm64: dts: rockchip: Update VPLL Frequency for RGB30
      commit: 793e0d8988bc0e6bf2ff5c6df7fc81ec8c53a93e
[3/3] arm64: dts: rockchip: Remove UART2 from RGB30
      commit: efa1d1c6c8e4f89eedef9035d1f74fe98861eb30

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
