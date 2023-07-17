Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E60C001B0
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jul 2023 14:08:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231931AbjGQOIs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Jul 2023 10:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232102AbjGQOIg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jul 2023 10:08:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFF3B10D8;
        Mon, 17 Jul 2023 07:08:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 69BEC6108B;
        Mon, 17 Jul 2023 14:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CFB1C433C7;
        Mon, 17 Jul 2023 14:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689602908;
        bh=1C/1zFzPAcvFdNbVlwJcLs0b2J8Mxp77yP1oYPB/Bd0=;
        h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
        b=nkxZhT6S2eQD3ZswL6Gq1CcBLtuji6c7eqZ+k4btRrwenFlKWnbi48oaHWQXOOIBU
         GdvkpGaxI/dZAAgl1/yJsNYZcf765oz/sngpFXAomD+EsRSyJVWM2enAmRfprtXVzo
         EALL9EGM3W+q7lPE1uFdHEg/zGW9ZmGOT5Z6kIOvWhXya5fVi+IHNfXetAihrdJq7y
         MkmX2NKWFLgq8UgQpQILDuw23qz3lR7VDHCZiLi8ZaJh4cvtOg68GWPG7v7p/r8Az/
         /DHKJcuNvrQC0FqMQR0o1EPkEumytWR9yRyvLg+XK8mNqlH/IJihqLWOORe7JgllEX
         UZ8SuJBJA1aDQ==
Message-ID: <5721cdc0f98faea5c00051a3e6c8701c.mripard@kernel.org>
Date:   Mon, 17 Jul 2023 14:08:26 +0000
From:   "Maxime Ripard" <mripard@kernel.org>
To:     "Frank Oltmanns" <frank@oltmanns.dev>
Subject: Re: [PATCH v4 06/11] clk: sunxi-ng: Add helper function to find
 closest rate
In-Reply-To: <20230717-pll-mipi_set_rate_parent-v4-6-04acf1d39765@oltmanns.dev>
References: <20230717-pll-mipi_set_rate_parent-v4-6-04acf1d39765@oltmanns.dev>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
        "Andre Przywara" <andre.przywara@arm.com>,
        "Chen-Yu Tsai" <wens@csie.org>,
        "Jernej Skrabec" <jernej.skrabec@gmail.com>,
        "Maxime Ripard" <mripard@kernel.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        "Roman Beranek" <me@crly.cz>,
        "Samuel Holland" <samuel@sholland.org>,
        "Stephen Boyd" <sboyd@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 17 Jul 2023 15:34:30 +0200, Frank Oltmanns wrote:
> The default behaviour of clocks in the sunxi-ng driver is to select a
> clock rate that is closest to but less than the requested rate.
> 
> Add the ccu_is_better_rate() helper function that - depending on the
> fact if thc CCU_FEATURE_CLOSEST_RATE flag is set - decides if a rate is
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
