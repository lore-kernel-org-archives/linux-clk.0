Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89231C4332F
	for <linux-clk@archiver.kernel.org>; Tue,  5 Apr 2022 05:57:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbiDEF7U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Apr 2022 01:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbiDEF7S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Apr 2022 01:59:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A8DE69CC9;
        Mon,  4 Apr 2022 22:57:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 482E8614F1;
        Tue,  5 Apr 2022 05:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9AA6C3411D;
        Tue,  5 Apr 2022 05:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649138237;
        bh=7pj/VsdJEt9B346xffaVvpgCX2CBQOykJf14EXzZNq0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CvL9Vo/v0oFs8BscK0R4DkbjqVqB/ijvs9Dvf/0+wSO5ndJuGDmNaZtmjdQEkbY8N
         ub2//DjPmuykNyqCrmGIX0HV3OyALNL7Zyd5Ddgq3bZb2T4o02HAk21boncypmHAUC
         hcgvW0BvjX344XDmIamrDYEhmDgFDtIv9J9Q3gjDWlCGAyKk8VFNZpr6/OMW3GVofy
         Ks1TkN4vJSSeUZr+vnt7ynZixKIYRmu95sp3Q6mDB5BFFp+6C53ZSA9mb5uEowJx5/
         1ttuVBrY9TT13sJsNg7QXe5a4DNHpQvRR0EFYHXeSDenxRq5tTSZQu7xZFELkcM+WV
         Vh+swJGLRwQzQ==
Date:   Tue, 5 Apr 2022 11:27:12 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        dmaengine@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v6 5/8] dmaengine: dw: dmamux: Introduce RZN1 DMA router
 support
Message-ID: <YkvaOKmamLF+Mp7m@matsya>
References: <20220404133904.1296258-1-miquel.raynal@bootlin.com>
 <20220404133904.1296258-6-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220404133904.1296258-6-miquel.raynal@bootlin.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04-04-22, 15:39, Miquel Raynal wrote:
> The Renesas RZN1 DMA IP is based on a DW core, with eg. an additional
> dmamux register located in the system control area which can take up to
> 32 requests (16 per DMA controller). Each DMA channel can be wired to
> two different peripherals.
> 
> We need two additional information from the 'dmas' property: the channel
> (bit in the dmamux register) that must be accessed and the value of the
> mux for this channel.
> 
> Aside from the driver introduction, as these devices are described as
> subnodes of the system controller, we also need the system controller
> (clock) driver to populate its children manually. Starting from now on,
> one child can be the dmamux.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/clk/renesas/r9a06g032-clocks.c |   3 +-

This should be a different patch, not in this...

> +++ b/drivers/dma/dw/rzn1-dmamux.c
> @@ -0,0 +1,157 @@
> +// SPDX-License-Identifier: GPL-2.0-only

...

> +
> +MODULE_LICENSE("GPL");

This is not consistent with the SPDX tag..

> +MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com");
> +MODULE_DESCRIPTION("Renesas RZ/N1 DMAMUX driver");
> -- 
> 2.27.0

-- 
~Vinod
