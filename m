Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1857FC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 23 Feb 2022 10:31:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235662AbiBWKcT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Feb 2022 05:32:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233965AbiBWKcT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 05:32:19 -0500
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 788F63334C;
        Wed, 23 Feb 2022 02:31:49 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 4B38BC0013;
        Wed, 23 Feb 2022 10:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1645612308;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oOfX/YGFLaxVKjpkH4p+qXiTOuKUa8cjKBNyNjZbJTQ=;
        b=AG1g4TtzufPPwM00YdT69mP4u9h01kU7j0MiJruhBuBhrS2yeqlsaJv2dGRMJf49mfiuj0
        TKg7+362TiW7cb8hUGw7cYYZJcpilO6XBYa/s961lPZbssLVEuf0x1rQaQyuHNjIjutIwp
        4kgJdvM17MUZeXME689Ix08gHmTg2DUxe1VbfGGcF0Q6HDOV348mQ1a4dTJno1AbLxSPF9
        5gy9r48tGk3pTFgA3gA5HVTHJPIN8rjXOpEsqkxfm37JUICeas0DaELwRtpWz+27HPYWWO
        PyNhRphJj+Eiy69BfUgOAdZQHRu/lPJbO/IePdpUUXWIm3HH1CqkecfctXN9oQ==
Date:   Wed, 23 Feb 2022 11:31:43 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     dmaengine@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>
Subject: Re: [PATCH v2 4/8] dma: dmamux: Introduce RZN1 DMA router support
Message-ID: <20220223113143.132c3f98@xps13>
In-Reply-To: <20220222103437.194779-5-miquel.raynal@bootlin.com>
References: <20220222103437.194779-1-miquel.raynal@bootlin.com>
        <20220222103437.194779-5-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


[...]

> +static int rzn1_dmamux_init(void)
> +{
> +	return platform_driver_register(&rzn1_dmamux_driver);
> +}
> +arch_initcall(rzn1_dmamux_init);

I don't think this driver actually needs the arch_initcall() level,
I'll propose a v3 using the regular platform init level.

And this driver is now missing MODULE_* macros.

Thanks,
Miqu=C3=A8l
