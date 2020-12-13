Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C57C4167B
	for <linux-clk@archiver.kernel.org>; Sun, 13 Dec 2020 05:50:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 678872312F
	for <linux-clk@archiver.kernel.org>; Sun, 13 Dec 2020 05:50:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730187AbgLMFun (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 13 Dec 2020 00:50:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:48320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729324AbgLMFun (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 13 Dec 2020 00:50:43 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607838602;
        bh=Wg6PvRNApW3CNV+26RMZUrHSYGuBMV/HXJs4EOxoFQY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hMToTDDjktOwDjGzzYlWOOzgx3Vft2Oo6RKoL3wOuLnTzYpcvZAVE76bjvBWi49DR
         TCApg9IN+u+qtuzLfIxLOBmA+E4I7HK20hBt8PUVeZU5vYdscaFLNKH5A9UG22+YFm
         EYKjPTzhNG2+HwWzgmKEj0H3T7Gp4Yg610Ape88tT0m0FvB4Ea1oQiW4aed1LjNcO0
         20xEsXKP1IgVBwiaq0C8DcTljZ8TKVt4R+f1HfDGu2+TPZzAP6jQvdstMtdixZhz0/
         BZbwfnLpifaDzZp/xLRHJ0hFhHToE67fgq9WZtNKRL6EnbWYKedwoOJWR/vX+jyq4q
         D2vZ/2kvzYntA==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201116075532.4019252-1-m.tretter@pengutronix.de>
References: <20201116075532.4019252-1-m.tretter@pengutronix.de>
Subject: Re: [PATCH 00/12] soc: xilinx: vcu: Convert driver to clock provider
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     rajanv@xilinx.com, tejasp@xilinx.com, dshah@xilinx.com,
        rvisaval@xilinx.com, michals@xilinx.com, kernel@pengutronix.de,
        robh+dt@kernel.org, mturquette@baylibre.com,
        Michael Tretter <m.tretter@pengutronix.de>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Date:   Sat, 12 Dec 2020 21:50:00 -0800
Message-ID: <160783860077.1580929.7577989890301235621@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2020-11-15 23:55:20)
> Hello,
>=20
> the xlnx_vcu soc driver is actually a clock provider of a PLL and four ou=
tput
> clocks created from the PLL via dividers.
>=20
> This series reworks the xlnx_vcu driver to use the common clock framework=
 to
> enable other drivers to use the clocks. I originally posted a series to e=
xpose
> the output clocks as fixed clocks [0]. This series now implements the full
> tree from the PLL to the output clocks. Therefore, I am sending a separate
> series that focuses on the clocks, but it depends on v4 of the previous s=
eries
> [1].

After this series is this anything besides a clk provider? If it's only
providing clks it would make sense to move the driver into drivers/clk/
