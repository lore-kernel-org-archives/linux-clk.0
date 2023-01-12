Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE95CC54EBD
	for <linux-clk@archiver.kernel.org>; Thu, 12 Jan 2023 23:55:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233143AbjALXzI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Jan 2023 18:55:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjALXzG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jan 2023 18:55:06 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D4D85D6BF;
        Thu, 12 Jan 2023 15:55:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 09291621DA;
        Thu, 12 Jan 2023 23:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F47EC433D2;
        Thu, 12 Jan 2023 23:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673567704;
        bh=6JXd3dhYuAnJUhOGAFmPnFDqbMlERPLgMefQvHqdju8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nd/2zSrWBWVo58yPu14uchzVWbmWy/k86JQjzNw45qGXj2HuTSYdd7dV4j4m5vNKO
         FSCd+XJIGBAcxhXHSBiQXTeTIeTVQ2Kgcvr9xuRePBy0xyx6EAGncTqa87ZbhIQi2y
         WTiscz903srXcXNzSwGf/MU3zDVFUAcNUrdl+g2q8gJZFIWrpn4VIA0rutFndOuor5
         45Kb/vIj0bQwDA+Jisz8h11rw2FWeQubQ/grReS4/RAbHu0ZyRZ8hbfQte1rv3LB6j
         7fHmqcE/hVMNPKwaMursPV1hupbyZX1iQNj/GnxjV3Hv57WZ69DPqv7bhmB4SyXR9+
         Y8s4jLwx27UGQ==
Message-ID: <7687837da16c41ffca3cda747483f2d1.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221219171058.164381-1-m.felsch@pengutronix.de>
References: <20221219171058.164381-1-m.felsch@pengutronix.de>
Subject: Re: [PATCH 1/2] clk: imx8mp: fix sai4 clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de
To:     Anson.Huang@nxp.com, Marco Felsch <m.felsch@pengutronix.de>,
        abelvesa@kernel.org, festevam@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, shawnguo@kernel.org
Date:   Thu, 12 Jan 2023 15:55:02 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marco Felsch (2022-12-19 09:10:57)
> The reference manual don't mention a SAI4 hardware block. This would be
> clock slice 78 which is skipped (TRM, page 237). Remove any reference to
> this clock to align the driver with the reality.
>=20
> Fixes: 9c140d992676 ("clk: imx: Add support for i.MX8MP clock driver")
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
