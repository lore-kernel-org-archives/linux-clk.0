Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E101C25B67
	for <linux-clk@archiver.kernel.org>; Tue, 24 Oct 2023 01:47:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjJXBrW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Oct 2023 21:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbjJXBrW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Oct 2023 21:47:22 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 926ADD7E;
        Mon, 23 Oct 2023 18:47:20 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A4DC433C8;
        Tue, 24 Oct 2023 01:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698112040;
        bh=mO3XCjY6Z0lxeyk7f7BJMy9qpCv7zZnFBymSDfJlDWg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rJrG57SVlu4spNUaY4iPdXEtxyYZWOT7fb29l8P8JM4S/7pxetWDhYqsyNO7EXbcw
         EatHJxOfWwk1Ff5Cm0x8u3BcMC3SMQEjmjilYtr1E47o5xQqqjDXMxbq/Xx22j9h1x
         wLZdOBAWHS2eHUTXGjmngNvEBpHeQ3X64sFDAQIF+Fk7QsY+W0DJkqYbcHs4Y9jBj8
         KYbPF5PJ5p2cXY9jc1mLAsgkjxLFcTp6R8acJdM1bX3dycKdM0Tl82elIXlAPcSirv
         VrbX4bQ25xCAGTX+Mu6765zvmIw0kcr/Z57pqYRqGmufMCRrPwacnMq17dmjEPUwbA
         1byHUuCsyROTA==
Message-ID: <b0af9e04bafb07e8a73e8f242a4ff556.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231018070144.8512-1-zhangqing@rock-chips.com>
References: <20231018070144.8512-1-zhangqing@rock-chips.com>
Subject: Re: [PATCH v4 0/4] rockchip: add GATE_LINK
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, huangtao@rock-chips.com,
        andy.yan@rock-chips.com
To:     conor+dt@kernel.org, heiko@sntech.de, kever.yang@rock-chips.com,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, zhangqing@rock-chips.com
Date:   Mon, 23 Oct 2023 18:47:17 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Elaine Zhang (2023-10-18 00:01:40)
> Recent Rockchip SoCs have a new hardware block called Native Interface
> Unit (NIU), which gates clocks to devices behind them. These effectively
> need two parent clocks.
> Use GATE_LINK to handle this.

Why can't pm clks be used here? The qcom clk driver has been doing that
for some time now.=20

 $ git grep pm_clk_add -- drivers/clk/qcom/
