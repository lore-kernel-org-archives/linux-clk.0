Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E54B1C6FD1F
	for <linux-clk@archiver.kernel.org>; Tue, 14 Mar 2023 03:25:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbjCNDZy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Mar 2023 23:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjCNDZo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Mar 2023 23:25:44 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8C9075861;
        Mon, 13 Mar 2023 20:25:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 74568B816E4;
        Tue, 14 Mar 2023 03:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1609C433D2;
        Tue, 14 Mar 2023 03:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678764306;
        bh=LfCZNwjOlVYN0x6GoeUL5szz6dZJkIiz+TcBLuPkVhY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V8dSxK7QaIQwFIpctpoyOo27eQxdXn5eXMrDJPD/xprh29fTrQWwox2rhx19Ax9p0
         R8SbL2F15q3PBfy56nUaNHAQfUEquHrV/RuxQvZ+Ou0ebqU9VWthCvitZ7NnSNpVIT
         zzvhYUD1vX9iAi01chH0Ql9UuYaI5IYDW2bpDXghG25uq4gXArFdXl774Z0WcJAs9L
         sUH9lnnk2JXsJEDIqbQxe1c9ws4OJ4eLd2AdJmnUm7HDp0/hheag8b8Q4isWCqzrdO
         WBrgycbxAbPg/+aZR0aokactnol0EP0mmX5QjAHeMDYT9lvuwYljqGehY+z37JrsQK
         NXLrFEnbWiW9g==
Date:   Tue, 14 Mar 2023 11:24:57 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-arm-kernel@lists.infradead.org,
        Adam Ford <aford173@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx8mn: specify #sound-dai-cells for SAI
 nodes
Message-ID: <20230314032457.GO143566@dragon>
References: <20230228215244.166627-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228215244.166627-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 28, 2023 at 10:52:44PM +0100, Marek Vasut wrote:
> Add #sound-dai-cells properties to SAI nodes.
> 
> Reviewed-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Fixes: 9e9860069725 ("arm64: dts: imx8mn: Add SAI nodes")
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied, thanks!
