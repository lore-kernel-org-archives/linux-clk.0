Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56AC3EB64DC
	for <linux-clk@archiver.kernel.org>; Mon,  3 Jul 2023 06:48:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbjGCGsN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Jul 2023 02:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbjGCGsF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Jul 2023 02:48:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65230E47;
        Sun,  2 Jul 2023 23:48:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E2A9060DBF;
        Mon,  3 Jul 2023 06:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71ACC433C8;
        Mon,  3 Jul 2023 06:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688366883;
        bh=LF9Ox8Htv3rolEvmigMZebHpaU16k1YxFdL17HM+3Bg=;
        h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
        b=bP8Vc/5KNXKQxK+6UAbDU2fuA4Abe3mNDhaSegy8AxfYQsvJby8B7EIpYaPxWuwfW
         6sLS0ASmvz/673uxXZ6lTm7jqKhXHpGJOrrthih9K4i8/JGZxnkHxqpBC1I+hm/Gqh
         ubuxVouKBiLvAsJ/ugvTUBnqxi7ZtfSHpuHswl1zKbe72pmbAicnMwOY3QMDSG9dcu
         CJ7xkjE7gk0guVcwJOygEcYm3+QVO2lQdm36IJKkuTvyED/fw8aN2iO1O4gcFDwRoQ
         UXoPf4mJ8IGo/eHzW5uisqMH/Ap9D4zu9GMii4rqpMAX2CFDvquSOE/AasYBWTu43G
         NjbdTXcGK0Aqw==
Message-ID: <7cde12a668f9b0cc0e6654e2e6827419.mripard@kernel.org>
Date:   Mon, 03 Jul 2023 06:47:59 +0000
From:   "Maxime Ripard" <mripard@kernel.org>
To:     "Frank Oltmanns" <frank@oltmanns.dev>
Subject: Re: [PATCH v3 2/8] clk: sunxi-ng: a64: allow pll-mipi to set
 parent's rate
In-Reply-To: <20230702-pll-mipi_set_rate_parent-v3-2-46dcb8aa9cbc@oltmanns.dev>
References: <20230702-pll-mipi_set_rate_parent-v3-2-46dcb8aa9cbc@oltmanns.dev>
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

On Sun, 2 Jul 2023 19:55:21 +0200, Frank Oltmanns wrote:
> The nkm clock now supports setting the parent's rate. Utilize this
> option to find the optimal rate for pll-mipi.
> 
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
