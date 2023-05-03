Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F414C7EE21
	for <linux-clk@archiver.kernel.org>; Wed,  3 May 2023 01:23:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbjECBXG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 May 2023 21:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjECBXG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 May 2023 21:23:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DE241704;
        Tue,  2 May 2023 18:23:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 16FE162505;
        Wed,  3 May 2023 01:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696CAC4339B;
        Wed,  3 May 2023 01:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683076982;
        bh=DFM111KwVuAVwFOHf4ySx6LOPwaddFUFZ7iI0Hqz2z0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hsa/49lH/Ua3Wl6Wl7DAowJZhaOOVvqA7e3XIRbIjM/HQaWNMuyGoTVVICeZV6lVh
         kKc/V2TtOovQCEhmk8o1VQ+7LO0HMXlv6n4rY0IWA53EGn0zxsWPzqaxefsMQ1z+OT
         tef4ifYdyYykRporjUyZMxV7EkJRm5DZIB2EFXNKEiscEvoRiwbjz3w+dNOJrU5qX6
         E7AGX5QkcSs1iPUfi0C7XfOtLi1hZLl897BaTQWxG3gMbT5U3QnbxBL1MCOVNcdVDp
         4Ty/Sf3hU+fzOO7PB6WaNaTJ3VLoqyKgmQE/ekmn+UKAAZykQIJevgNIzD2kXmpt3z
         acbipCdprWXzQ==
Message-ID: <7bad090ac304eff07da84586fc1cd3cc.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230423123828.1346511-1-aford173@gmail.com>
References: <20230423123828.1346511-1-aford173@gmail.com>
Subject: Re: [PATCH] Revert "clk: imx: composite-8m: Add support to determine_rate"
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To:     Adam Ford <aford173@gmail.com>, linux-clk@vger.kernel.org
Date:   Tue, 02 May 2023 18:23:00 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Adam Ford (2023-04-23 05:38:27)
> This reverts commit 156e96ff2172518b6f83e97d8f11f677bc668e22.
>=20
> This patch was found to cause some division issues on the i.MX8MP
> which causes the video clocks to not properly divide when division
> was greate than 8.  This causes video failures on disp1_pix and
> disp2_pix clocks.
>=20
> Until a better solution is found, we'll have to revert this.
>=20
> Signed-off-by: Adam Ford <aford173@gmail.com>
>=20
> diff --git a/drivers/clk/imx/clk-composite-8m.c b/drivers/clk/imx/clk-com=
posite-8m.c
> index 6883a8199b6c..cbf0d7955a00 100644
> --- a/drivers/clk/imx/clk-composite-8m.c

Applied to clk-next
