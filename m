Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D48C77B7F
	for <linux-clk@archiver.kernel.org>; Fri, 19 May 2023 13:57:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbjESN5k (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 May 2023 09:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbjESN5j (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 May 2023 09:57:39 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2E5CA;
        Fri, 19 May 2023 06:57:38 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2005)
        id B229168C7B; Fri, 19 May 2023 15:57:33 +0200 (CEST)
Date:   Fri, 19 May 2023 15:57:33 +0200
From:   Torsten Duwe <duwe@lst.de>
To:     Xingyu Wu <xingyu.wu@starfivetech.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        yanhong.wang@starfivetech.com,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: Add StarFive JH7110 PLL
 clock generator
Message-ID: <20230519135733.GA10188@lst.de>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com> <20230512022036.97987-2-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512022036.97987-2-xingyu.wu@starfivetech.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, May 12, 2023 at 10:20:30AM +0800, Xingyu Wu wrote:
[...]
>  #ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>  #define __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>  
> +/* PLL clocks */
> +#define JH7110_CLK_PLL0_OUT			0
> +#define JH7110_CLK_PLL1_OUT			1
> +#define JH7110_CLK_PLL2_OUT			2

In U-Boot commit 58c9c60b Yanhong Wang added:

+
+#define JH7110_SYSCLK_PLL0_OUT                       190
+#define JH7110_SYSCLK_PLL1_OUT                       191
+#define JH7110_SYSCLK_PLL2_OUT                       192
+
+#define JH7110_SYSCLK_END                    193

in that respective file.

> +#define JH7110_PLLCLK_END			3
> +
>  /* SYSCRG clocks */
>  #define JH7110_SYSCLK_CPU_ROOT			0

If the symbolic names referred to the same items, would it be possible
to keep the two files in sync somehow?

	Torsten
