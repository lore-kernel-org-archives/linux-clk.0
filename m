Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE30BC0015E
	for <linux-clk@archiver.kernel.org>; Sun, 30 Jul 2023 03:13:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbjG3DNf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 29 Jul 2023 23:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjG3DNe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 29 Jul 2023 23:13:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC6119AB
        for <linux-clk@vger.kernel.org>; Sat, 29 Jul 2023 20:13:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B6F14609FB
        for <linux-clk@vger.kernel.org>; Sun, 30 Jul 2023 03:13:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AEDAC433C7;
        Sun, 30 Jul 2023 03:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690686811;
        bh=xFJd8//SACT5a7J949EskVCzcBOXTxWTCuCstcvO+Qs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EQXLFucd5B/6TMMJvS2ELePbSDFrKrXpnXDcfSVolZpIqfCjM0VsspTpD0lXBUMyq
         QzvfKrYkmpVgcgJ+cnpPmYQjF/0R9yEspJSdr3whG/NpQIHRl9CaR/GXpP2U0ks8Nd
         pBMNJReMKIdN5u0zpQXv95v4w2FpCw9842HKlKHjSX3gna6J1o+OwDP4ha6K6aGRT2
         sSN48NBQJEYrMXX4oJyOui7cjFYkdkLfxUms1I93VcSYx20U6NsHzjBXEVWW9pmnkk
         hXWiE1U8TPw8ypqGRdGgGv+YSzRt/hUwUBeG4IbumaGp3pYiySzilLKp5ggkUCaqY9
         NhRnPOpbjez3g==
Date:   Sun, 30 Jul 2023 11:13:21 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     hs@denx.de, linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        abelvesa@kernel.org, linux-clk@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v3 2/3] ARM: dts: imx6sx: Describe the default LCDIF1
 parent
Message-ID: <20230730031321.GV151430@dragon>
References: <20230712115301.690714-1-festevam@gmail.com>
 <20230712115301.690714-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230712115301.690714-2-festevam@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jul 12, 2023 at 08:53:00AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> A suitable default for the LCDIF parent is the PLL5 clock, so
> describe it in the device tree.
> 
> The imx6sx clock driver harcodes PLL5 as the LCDIF1 parent, but
> in preparation for removing such hardcoding, describe the parent
> relationship via devicetree.
> 
> There are some boards that may want to use a different parent
> for the LCDIF due to EMI reasons, for example.
> 
> With this approch, the user can change the LCDIF parent in the board
> devicetree if needed.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!
