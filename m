Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1EA9EB64D7
	for <linux-clk@archiver.kernel.org>; Fri, 16 Jun 2023 19:16:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbjFPTQF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Jun 2023 15:16:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjFPTQF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Jun 2023 15:16:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B76D35A7;
        Fri, 16 Jun 2023 12:16:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EB80661DA7;
        Fri, 16 Jun 2023 19:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E547C433CA;
        Fri, 16 Jun 2023 19:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686942963;
        bh=ofFsHK/wLEqitymcfOWTVk2HmZIofaP1whM1QLh+1to=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qNPlL1pRV583d3fkPOEKJEJUiQpSXFW/A5aSNJx/uPs7HIvu8a4rKu4pTGTGQjikX
         hhqMG9tEEJ5ZwJ9xou3Ftx5ktlo71FjHZee/fjQgG1sg7GfkMu0LUZzrhr7De67U1k
         KY07L6K62gDbnZ+1iJtMVn3nfuUFhaiUzne6DBW2oNeBOSeOXPNYQGEqqKydjPNeV6
         A7p1Jptv9s8/jT/98vF/qft9a7pUUjXAT0P35YBQc9hUrhkTSwcVVVZEKxg+apcuDW
         d/Wsk0BxganCUTemETT0k6WI8OSQDg1fOaXPnH6tOAPF6+T9T89Xp1LlwZuloz/APn
         OfGrhvA6rV3eA==
Message-ID: <80b8c250c4e6a68b8efb86662f57edee.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230515-refclk-v3-1-37c0b550f406@ti.com>
References: <20230515-refclk-v3-0-37c0b550f406@ti.com> <20230515-refclk-v3-1-37c0b550f406@ti.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: Add binding documentation for TI Audio REFCLK
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>, Andrew Davis <afd@ti.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Jai Luthra <j-luthra@ti.com>,
        Conor Dooley <conor.dooley@microchip.com>
To:     Conor Dooley <conor+dt@kernel.org>, Jai Luthra <j-luthra@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>
Date:   Fri, 16 Jun 2023 12:16:00 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jai Luthra (2023-06-15 04:55:35)
> Add DT bindings for TI's audio reference clocks (REFCLK) present on AM62
> SoC.
>=20
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---

Applied to clk-next
