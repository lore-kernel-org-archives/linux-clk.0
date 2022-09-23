Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F47FC6FA83
	for <linux-clk@archiver.kernel.org>; Fri, 23 Sep 2022 18:49:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232920AbiIWStq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Sep 2022 14:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbiIWStp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Sep 2022 14:49:45 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B52C017056;
        Fri, 23 Sep 2022 11:49:42 -0700 (PDT)
Received: from p508fdd76.dip0.t-ipconnect.de ([80.143.221.118] helo=phil.fritz.box)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1obnk0-0000Xi-AJ; Fri, 23 Sep 2022 20:49:36 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     andy.yan@rock-chips.com, shawn.lin@rock-chips.com,
        nfraprado@collabora.com, zhangqing@rock-chips.com,
        Johan Jonker <jbx6244@gmail.com>, finley.xiao@rock-chips.com,
        zhengxing@rock-chips.com, jeffy.chen@rock-chips.com,
        mylene.josserand@collabora.com, eric@engestrom.ch
Cc:     Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: clock: rockchip: change SPDX-License-Identifier
Date:   Fri, 23 Sep 2022 20:49:34 +0200
Message-Id: <166395896579.557333.16068266328759395969.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20c6a502-2ff5-bdb1-fb4f-0741f3a2c19c@gmail.com>
References: <20c6a502-2ff5-bdb1-fb4f-0741f3a2c19c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 20 Sep 2022 00:25:07 +0200, Johan Jonker wrote:
> Change SPDX-License-Identifier to (GPL-2.0+ OR MIT)
> for Rockchip clock bindings.

Applied, thanks!

[1/1] dt-bindings: clock: rockchip: change SPDX-License-Identifier
      commit: fffa0fa4d029c10406d417dd33f630bee4b12c02

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
