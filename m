Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD0EEB64DC
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jul 2023 14:08:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232027AbjGQOIY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Jul 2023 10:08:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232032AbjGQOIK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jul 2023 10:08:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 448341723;
        Mon, 17 Jul 2023 07:07:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C417461072;
        Mon, 17 Jul 2023 14:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC19C433C7;
        Mon, 17 Jul 2023 14:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689602877;
        bh=qulwdyHb+9uPhm4p3WCoPEZ37M3yifnixVDvq2o+ERM=;
        h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
        b=SeJihIoqimuGmtiSuPXJ5gWEw//j+ImhikcgFKXSJFpVlaQK5/8wRZr+ItAI2RCv0
         vxmGlwoLPO0xF8TP0TfnryuwcGNCopNioiYBwv2enJVlTIzqE8QUAn6fZtEXn4XBrw
         S4TzBQmmRX7pI6SpU/qtNuHwt3IMODL2NoS182r50gCVlqLmPVjtspCh3MglMI3JUM
         3SlqBgVKnrSyOGP1Q9AIUhn2pZxqLj1TeIwE9u06LW6CMOpZ2VcAa7Cgq1W5Ntk10S
         SXlO5Q4fumh6lZ9lPcIclgmu3IoL3SXcrOgY5yeMZDbINz3bOJwd95MfYXGCgfisfx
         MiC6kVjaN84uQ==
Message-ID: <e168b853cd49e09f5ac081db086bef3f.mripard@kernel.org>
Date:   Mon, 17 Jul 2023 14:07:54 +0000
From:   "Maxime Ripard" <mripard@kernel.org>
To:     "Frank Oltmanns" <frank@oltmanns.dev>
Subject: Re: [PATCH v4 02/11] clk: sunxi-ng: nkm: consider alternative
 parent rates when determining rate
In-Reply-To: <20230717-pll-mipi_set_rate_parent-v4-2-04acf1d39765@oltmanns.dev>
References: <20230717-pll-mipi_set_rate_parent-v4-2-04acf1d39765@oltmanns.dev>
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

On Mon, 17 Jul 2023 15:34:26 +0200, Frank Oltmanns wrote:
> In case the CLK_SET_RATE_PARENT flag is set, consider using a different
> parent rate when determining a new rate.
> 
> To find the best match for the requested rate, perform the following
> steps for each NKM combination:
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
