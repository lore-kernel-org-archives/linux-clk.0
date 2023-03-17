Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8615CC74A5B
	for <linux-clk@archiver.kernel.org>; Fri, 17 Mar 2023 19:12:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbjCQTMj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Mar 2023 15:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjCQTMi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Mar 2023 15:12:38 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04A12D7C3F;
        Fri, 17 Mar 2023 12:12:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A5F38B826C2;
        Fri, 17 Mar 2023 19:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DFFEC433D2;
        Fri, 17 Mar 2023 19:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679080355;
        bh=mJ2DYx2tCFy9khrVBbHTGMC5bHcdNPPifrYSylrXXL8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=NRO7KnZdJkTjimikFdEyBR/U06MQB9gjujyrd+na1Gt5gzn7j29AA29U89YM3jFLL
         Mly2zlli6URIl8cUTV+mE1yjVwWvqAMNOG+VJbfStcOS2pWMXSE/yGRsmY/wTx5dsR
         A8b25C+N30PTo/+MhN8WL32UXOtY6wp7Gwl8Z4D5bxFCnv2LZcqKccPEXMhw9O/Gjo
         Pw1tEri3BoztehxzncVS4umjglNZhiQieRklQEL2bRigqTJku/P3QHiC57DCVwptAq
         wEu1tvslZD/M8YxqP/vAZvGN/CWxAKJeUffRbahfbGclfw+M00NMqddoIpZAC0ZPdN
         Ujvy7qkCW0JJg==
Message-ID: <818d6df5ba8fe125e39bfa0a0fd59cea.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230301163257.49005-1-marex@denx.de>
References: <20230301163257.49005-1-marex@denx.de>
Subject: Re: [PATCH v7 1/5] clk: Introduce devm_clk_hw_register_gate_parent_data()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Adam Ford <aford173@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Abel Vesa <abelvesa@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Fri, 17 Mar 2023 12:12:33 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2023-03-01 08:32:53)
> Add an API for clock gate that uses parent_data for the parent instead of
> a string parent_name.
>=20
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
