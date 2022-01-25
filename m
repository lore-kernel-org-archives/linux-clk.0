Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C880C4332F
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 03:33:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1323400AbiAYD2Q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Jan 2022 22:28:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S3416476AbiAYCDw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Jan 2022 21:03:52 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D32C09B048
        for <linux-clk@vger.kernel.org>; Mon, 24 Jan 2022 17:16:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D998961212
        for <linux-clk@vger.kernel.org>; Tue, 25 Jan 2022 01:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7F1C340E4;
        Tue, 25 Jan 2022 01:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643073402;
        bh=ko+yNlpEZakOjE9e9H7Tws2prldYC7Nn2VWMGiNYTdk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=swrFoe1utzTpBq4k1cPNyuE9zM6SmaoyyjRvOJH91LHz3Zv/zBKhS8e0aG6Q29y5Y
         +ACMOAwjhzTsRy7vPwb+HJOI9XrwvkwFyXE1Y48/tvQZ1hGEYnImBXaskErKHU/an9
         zaqv9sIRSOoeXRfz461kB6Nu+NwfWDX/7vedfUE/kWIsGEakt9/o7jWE/V5SPJnDJX
         9tyqLcW3qdoezaNKdbGLf3duWDf/YRIXY4GII1VqBwAhEMT98QJtyVNbhnL9MOv246
         CP6Zjoz6ArHK/QM1hEWSAnOLcaqMZZMTK9xuGQuBYu9rMO1V8OoL2McSDHOeYa1ucw
         UhAr65Uhg1mOw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220118202958.1840431-1-marex@denx.de>
References: <20220118202958.1840431-1-marex@denx.de>
Subject: Re: [PATCH 1/5] clk: stm32mp1: Split ETHCK_K into separate MUX and GATE clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     jneuhauser@dh-electronics.com, Marek Vasut <marex@denx.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
To:     Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
Date:   Mon, 24 Jan 2022 17:16:40 -0800
User-Agent: alot/0.10
Message-Id: <20220125011642.3C7F1C340E4@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2022-01-18 12:29:54)
> The ETHCK_K are modeled as composite clock of MUX and GATE, however per
> STM32MP1 Reference Manual RM0436 Rev 3, Page 574, Figure 83. Peripheral
> clock distribution for Ethernet, ETHPTPDIV divider is attached past the
> ETHCK_K mux, and ETH_CLK/eth_clk_fb clock are output past ETHCKEN gate.
> Therefore, in case ETH_CLK/eth_clk_fb are not in use AND PTP clock are
> in use, ETHCKEN gate can be turned off. Current driver does not permit
> that, fix it.
>=20
> This patch converts ETHCK_K from composite clock into a ETHCKEN gate,
> ETHPTP_K from composite clock into ETHPTPDIV divider, and adds another
> NO_ID clock "ck_ker_eth" which models the ETHSRC mux and is parent clock
> to both ETHCK_K and ETHPTP_K. Therefore, all references to ETHCK_K and
> ETHPTP_K remain functional as before.
>=20
> [1] STM32MP1 Reference Manual RM0436 Rev 3, Page 574,
>     Figure 83. Peripheral clock distribution for Ethernet
>     https://www.st.com/resource/en/reference_manual/dm00327659-stm32mp157=
-advanced-armbased-32bit-mpus-stmicroelectronics.pdf
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christophe Roullier <christophe.roullier@foss.st.com>
> Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---

Applied to clk-next
