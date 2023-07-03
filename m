Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359B5EB64DD
	for <linux-clk@archiver.kernel.org>; Mon,  3 Jul 2023 06:48:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbjGCGsj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Jul 2023 02:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbjGCGsg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Jul 2023 02:48:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18EB7E44;
        Sun,  2 Jul 2023 23:48:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ABB2C60DBF;
        Mon,  3 Jul 2023 06:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F039C433C7;
        Mon,  3 Jul 2023 06:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688366902;
        bh=FsU8Ftt54VNvE0ki2nHxYxKZTQIN3r5LayDaz9lGT90=;
        h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
        b=C4LMK8amVSKjvUmKoGdN/GvHAySuidid9nw+aZyIJ7IN8h/c5n1iSPTHxoJepVumf
         /ijk95N+ArSlsqT2uLZdyqvCEqj31UMQEAKrVlVsrpuzBjenL6LR/rRRB7Uw2Lp6yE
         Lmc13Q5AnLPfPUxY1kfCB+IO2eS56VYTec34ddbkgBrMGqNTRj7vtjb/LJwr6kWwxH
         mHhBQOyw/Z9ZXAJj7P/32qhDBhs/LVh1WeeYspBImSJNwOCt5T7zYHT4efOfVK8qi1
         aIbKO/Jwwt+a7ujXbZMmR4eHjT/4WwaE+FyfOl3s5JWFxWiZoypdBgFsDu+0CBBG1j
         vlV77VUDnL8qA==
Message-ID: <1d08e72e9ce227d4fc88d9656d35645f.mripard@kernel.org>
Date:   Mon, 03 Jul 2023 06:48:18 +0000
From:   "Maxime Ripard" <mripard@kernel.org>
To:     "Frank Oltmanns" <frank@oltmanns.dev>
Subject: Re: [PATCH v3 3/8] clk: sunxi-ng: Add feature to find closest rate
In-Reply-To: <20230702-pll-mipi_set_rate_parent-v3-3-46dcb8aa9cbc@oltmanns.dev>
References: <20230702-pll-mipi_set_rate_parent-v3-3-46dcb8aa9cbc@oltmanns.dev>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
        "Andre Przywara" <andre.przywara@arm.com>,
        "Chen-Yu Tsai" <wens@csie.org>,
        "Jernej Skrabec" <jernej.skrabec@gmail.com>,
        "Maxime Ripard" <maxime@cerno.tech>,
        "Michael Turquette" <mturquette@baylibre.com>,
        "Roman Beranek" <me@crly.cz>,
        "Samuel Holland" <samuel@sholland.org>,
        "Stephen Boyd" <sboyd@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 2 Jul 2023 19:55:22 +0200, Frank Oltmanns wrote:
> The default behaviour of clocks in the sunxi-ng driver is to select a
> clock rate that is closest to but less than the requested rate.
> 
> Add the CCU_FEATURE_CLOSEST_RATE flag, which can be used to allow clocks
> to find the closest rate instead.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
