Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB83C4332F
	for <linux-clk@archiver.kernel.org>; Sat, 31 Dec 2022 06:01:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231329AbiLaGBR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 31 Dec 2022 01:01:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiLaGBR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 31 Dec 2022 01:01:17 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27AD42624;
        Fri, 30 Dec 2022 22:01:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7B957B81C26;
        Sat, 31 Dec 2022 06:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E2CC433EF;
        Sat, 31 Dec 2022 06:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672466473;
        bh=To32hwWD5SVzKLBkF3hs0CxunCb8jmqRRT6nF/cLFNk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HiajMuI7P41qI4akUJb4y5KEAvOXUB+oJgzZiDus57LNqhkFy0ZnQ0Ft1CxWPHsRz
         3bb8c4VzxCLl1baY45dQLfZOAAaOvj23t42RAFAQokORm1IpvKoZ0QX0dnY1T4y6LZ
         815SL7CKZasJO0ApiJYbIR5roeiKPDiq9suP2s2rFk+vWKoKnt6tBoCFRio2MOaQuK
         kwlSycmLc4hpjfVPP5/mahx3Yjqv2xhGgySOQmVpym7BJazm2QaB3uTQP391dH8LDW
         d2b2zwItizifWmPkbEfFGZYcDylbloGZRgLP7jdgiwsnS7T65pCOc89fg7odxQMXhd
         GsRgZH6Zpcfjw==
Date:   Sat, 31 Dec 2022 14:01:04 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     sboyd@kernel.org, abelvesa@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        mturquette@baylibre.com, l.stach@pengutronix.de, peng.fan@nxp.com,
        alexander.stein@ew.tq-group.com, gregkh@linuxfoundation.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: imx8mp: correct usb clocks
Message-ID: <20221231060103.GC6112@T480>
References: <1664549663-20364-1-git-send-email-jun.li@nxp.com>
 <1664549663-20364-3-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1664549663-20364-3-git-send-email-jun.li@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Sep 30, 2022 at 10:54:23PM +0800, Li Jun wrote:
> After commit cf7f3f4fa9e5 ("clk: imx8mp: fix usb_root_clk parent"),
> usb_root_clk is no longer for suspend clock so update dts accordingly
> to use right bus clock and suspend clock.
> 
> Fixes: fb8587a2c165 ("arm64: dtsi: imx8mp: add usb nodes")
> Cc: stable@vger.kernel.org # v5.19+
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Acked-by: Shawn Guo <shawnguo@kernel.org>
> Signed-off-by: Li Jun <jun.li@nxp.com>

Applied, thanks!
