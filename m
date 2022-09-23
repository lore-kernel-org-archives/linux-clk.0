Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33311C6FA86
	for <linux-clk@archiver.kernel.org>; Fri, 23 Sep 2022 10:34:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbiIWKeM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Sep 2022 06:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbiIWKeK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Sep 2022 06:34:10 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED86417892;
        Fri, 23 Sep 2022 03:34:09 -0700 (PDT)
Received: from p508fdb48.dip0.t-ipconnect.de ([80.143.219.72] helo=phil.fritz.box)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1obg0S-0005sI-Pr; Fri, 23 Sep 2022 12:34:04 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, zhangqing@rock-chips.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, mturquette@baylibre.com,
        linux-kernel@vger.kernel.org, sboyd@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH v3] dt-bindings: clock: convert rockchip,rk3128-cru.txt to YAML
Date:   Fri, 23 Sep 2022 12:34:00 +0200
Message-Id: <166392923326.537565.17809786432219638710.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <4e69a06d-7b53-ab48-1e50-2b29ff3a54e6@gmail.com>
References: <4e69a06d-7b53-ab48-1e50-2b29ff3a54e6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 18 Sep 2022 16:29:41 +0200, Johan Jonker wrote:
> Convert rockchip,rk3128-cru.txt to YAML.

Applied, thanks!

[1/1] dt-bindings: clock: convert rockchip,rk3128-cru.txt to YAML
      commit: f878a26a2a61abae9cb4d01a04a49dfac209b37c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
