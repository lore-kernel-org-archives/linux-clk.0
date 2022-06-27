Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C060EC43334
	for <linux-clk@archiver.kernel.org>; Mon, 27 Jun 2022 06:17:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232266AbiF0GRX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Jun 2022 02:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiF0GRW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Jun 2022 02:17:22 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8953D5F41;
        Sun, 26 Jun 2022 23:17:20 -0700 (PDT)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1o5i3f-0002kD-Vc; Mon, 27 Jun 2022 08:17:16 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Elaine Zhang <zhangqing@rock-chips.com>, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 1/5] dt-binding: clock: Document rockchip,rk3588-cru bindings
Date:   Mon, 27 Jun 2022 08:17:15 +0200
Message-ID: <1896998.PYKUYFuaPT@diego>
In-Reply-To: <20220623160329.239501-2-sebastian.reichel@collabora.com>
References: <20220623160329.239501-1-sebastian.reichel@collabora.com> <20220623160329.239501-2-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Sebastian,

Am Donnerstag, 23. Juni 2022, 18:03:25 CEST schrieb Sebastian Reichel:
> From: Elaine Zhang <zhangqing@rock-chips.com>
> 
> Document the device tree bindings of the rockchip rk3588 SoC
> clock and reset unit.
> 
> This also contains the header, which is shared betwen the DT
> files and the kernel driver containing the clock and reset IDs.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> [add additional clocks IDs for gate clocks, which are handled via
>  separate DT nodes in the vendor kernel]
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/clock/rockchip,rk3588-cru.yaml   |   59 +
>  include/dt-bindings/clock/rk3588-cru.h        | 1516 +++++++++++++++++
>  2 files changed, 1575 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
>  create mode 100644 include/dt-bindings/clock/rk3588-cru.h

please split the binding and dt-binding-header into separate patches.
Depending on what gets merged when, I will need a shared-branch
for the header, so don't want to also carry the yaml binding in there.

Thanks
Heiko


