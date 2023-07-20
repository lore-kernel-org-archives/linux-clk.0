Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DC2EB64DD
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jul 2023 16:30:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230514AbjGTQaI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jul 2023 12:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230499AbjGTQaH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jul 2023 12:30:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B327010FE;
        Thu, 20 Jul 2023 09:30:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5190361B10;
        Thu, 20 Jul 2023 16:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BAFAC433CA;
        Thu, 20 Jul 2023 16:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689870605;
        bh=03iwHF4QsJwEWxnPmziWUq9TV1KY8wz/mguv4Sk1LE0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZdtSogxhUY53FziUIZlXATBwD6poKHBE31eXZep/5b2ApRgl8ITwZDChvBUi08fA1
         ij03rmSV62MOqlR8WwjXPJsbyNsQ8Xt07FvRj2N6rVcRilU8XrkZUf3IeX/ucjDe6j
         bQAzlYc4oiPcTg2pGGWBJNtfZwg4J6JMXnl2oWJO3E+QmrpIvCXokf7BjZiZ8lNNGl
         yivi7Qe+n1P+Tsc2mxu1+cSR4muP2BPvpWskHQhUP004cB4k4lkbexbVp2Ol/J/Me3
         G863G6mFN/yqtEkcRkc4MsGXdNo40mN7Y9NGktM87kus5F3Cz8nA0pvoy4OQCbUsT4
         fBoRsNQ6pdKtA==
From:   Conor Dooley <conor@kernel.org>
To:     Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Xingyu Wu <xingyu.wu@starfivetech.com>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        linux-kernel@vger.kernel.org,
        William Qiu <william.qiu@starfivetech.com>,
        linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v7 0/7] Add PLL clocks driver and syscon for StarFive JH7110 SoC
Date:   Thu, 20 Jul 2023 17:29:50 +0100
Message-Id: <20230720-deck-accent-0dffdaf52958@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230717023040.78860-1-xingyu.wu@starfivetech.com>
References: <20230717023040.78860-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=928; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=nYxKzaQU0UYMnEXg5rTWbgwmIu2gNPam4O84iGUPsLU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCk7E/6cPN4pvklSYW5lokS+pZTwj47I00LOW/vmdVz7Z brE50JfRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACayypiRYUMhb2lrm6Lrj623 H2tFTuEN8V/XGO99R2Dm38xJTPNrcxj+cFuI/T+9gOFVahhju8yawrsPdUWSZfKTNl1zvyLzbNp 3NgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

On Mon, 17 Jul 2023 10:30:33 +0800, Xingyu Wu wrote:
> This patch serises are to add PLL clocks driver and providers by writing
> and reading syscon registers for the StarFive JH7110 RISC-V SoC. And add
> documentation and nodes to describe StarFive System Controller(syscon)
> Registers. This patch serises are based on Linux 6.4.
> 
> PLLs are high speed, low jitter frequency synthesizers in JH7110.
> Each PLL clock works in integer mode or fraction mode by some dividers,
> and the dividers are set in several syscon registers.
> The formula for calculating frequency is:
> Fvco = Fref * (NI + NF) / M / Q1
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[6/7] riscv: dts: starfive: jh7110: Add syscon nodes
      https://git.kernel.org/conor/c/3fcbcfc496f0
[7/7] riscv: dts: starfive: jh7110: Add PLL clocks source in SYSCRG node
      https://git.kernel.org/conor/c/3e6670a28b00

Thanks,
Conor.
