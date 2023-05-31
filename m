Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51876C77B7C
	for <linux-clk@archiver.kernel.org>; Wed, 31 May 2023 08:56:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234973AbjEaI4n (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 31 May 2023 04:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234905AbjEaI4m (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 May 2023 04:56:42 -0400
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7041BE;
        Wed, 31 May 2023 01:56:40 -0700 (PDT)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
        by fd01.gateway.ufhost.com (Postfix) with ESMTP id 85C8D8132;
        Wed, 31 May 2023 16:56:32 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 31 May
 2023 16:56:32 +0800
Received: from [192.168.125.80] (113.72.147.198) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 31 May
 2023 16:56:31 +0800
Message-ID: <bb490143-e04c-495d-7519-323b653b7351@starfivetech.com>
Date:   Wed, 31 May 2023 16:56:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v6 02/11] clk: starfive: Add StarFive JH7110
 System-Top-Group clock driver
Content-Language: en-US
To:     Xingyu Wu <xingyu.wu@starfivetech.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>
CC:     Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20230518101234.143748-1-xingyu.wu@starfivetech.com>
 <20230518101234.143748-3-xingyu.wu@starfivetech.com>
From:   Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20230518101234.143748-3-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [113.72.147.198]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 18 May 2023 18:12:25 +0800, Xingyu Wu wrote:
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> 
> Add driver for the StarFive JH7110 System-Top-Group clock controller.
> 
> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>  drivers/clk/starfive/Kconfig                  |  11 ++
>  drivers/clk/starfive/Makefile                 |   1 +
>  .../clk/starfive/clk-starfive-jh7110-stg.c    | 173 ++++++++++++++++++
>  3 files changed, 185 insertions(+)
>  create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-stg.c
> 
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index 5d2333106f13..d252c03bfb81 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -39,3 +39,14 @@ config CLK_STARFIVE_JH7110_AON
>  	help
>  	  Say yes here to support the always-on clock controller on the
>  	  StarFive JH7110 SoC.
> +
> +config CLK_STARFIVE_JH7110_STG
> +	tristate "StarFive JH7110 System-Top-Group clock support"
> +	depends on CLK_STARFIVE_JH7110_SYS
> +	select AUXILIARY_BUS
> +	select CLK_STARFIVE_JH71X0
> +	select RESET_STARFIVE_JH7110

Please drop the above three lines because these three options
are already selected by CLK_STARFIVE_JH7110_SYS. Ditto to for
the isp and vout clock drivers.

With that fixed,
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>

Best regards,
Hal

> +	default m if ARCH_STARFIVE
> +	help
> +	  Say yes here to support the System-Top-Group clock controller
> +	  on the StarFive JH7110 SoC.

