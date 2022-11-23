Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E32AC433FE
	for <linux-clk@archiver.kernel.org>; Wed, 23 Nov 2022 14:06:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237720AbiKWOGD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Nov 2022 09:06:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236175AbiKWOFh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Nov 2022 09:05:37 -0500
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5646669DC7;
        Wed, 23 Nov 2022 06:01:55 -0800 (PST)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.fritz.box)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1oxqJq-0008O9-Qm; Wed, 23 Nov 2022 15:01:42 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Xiu Jianfeng <xiujianfeng@huawei.com>, mturquette@baylibre.com,
        sboyd@kernel.org, mturquette@linaro.org
Cc:     Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] clk: rockchip: Fix memory leak in rockchip_clk_register_pll()
Date:   Wed, 23 Nov 2022 15:01:41 +0100
Message-Id: <166921209718.1733563.10543357754581908332.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123091201.199819-1-xiujianfeng@huawei.com>
References: <20221123091201.199819-1-xiujianfeng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 23 Nov 2022 17:12:01 +0800, Xiu Jianfeng wrote:
> If clk_register() fails, @pll->rate_table may have allocated memory by
> kmemdup(), so it needs to be freed, otherwise will cause memory leak
> issue, this patch fixes it.
> 
> 

Applied, thanks!

[1/1] clk: rockchip: Fix memory leak in rockchip_clk_register_pll()
      commit: 739a6a6bbdb793bd57938cb24aa5a6df89983546

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
