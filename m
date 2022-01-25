Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA8BC433FE
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 03:33:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1323324AbiAYD1y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Jan 2022 22:27:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349744AbiAYCAn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Jan 2022 21:00:43 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCB12C09B047
        for <linux-clk@vger.kernel.org>; Mon, 24 Jan 2022 17:16:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4FBC661212
        for <linux-clk@vger.kernel.org>; Tue, 25 Jan 2022 01:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B5FC340E4;
        Tue, 25 Jan 2022 01:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643073391;
        bh=kc+g6ITavbbQw+IHrNc9P2tQVl1HkLw8o6r843h1QaI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sSxge+ArTE+xYAcpztTaPgmVB2/C9SVXAoPHT4ZcmhvayrDAFPREKThrJQ2eY2My9
         waezny0L25haJQJ/nwLmmHy7wo9y4Z1aXSAt0DbdM9OqP70R+jqVU2MTYhmAvjbH/n
         1NaepN9wiDgqtx+7ivOfni7t0UjKexi1WHnfv8mQWSLK94E1Rf9addAlRczDF2BZ8F
         udm6b9/n4jjl2SXNRlX3v3y1srVqZedk9ImWmNbubT2OrTirjJ6OnS4RN66r5L57ah
         DAX11KH5BZq+PMy3iLnzVfsRlPifhSHqLg7zhaE4PtjC9lH8ZEja5mKKeINLOfpxDb
         vIw3bYs90V0Bw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220118202958.1840431-2-marex@denx.de>
References: <20220118202958.1840431-1-marex@denx.de> <20220118202958.1840431-2-marex@denx.de>
Subject: Re: [PATCH 2/5] clk: stm32mp1: Add parent_data to ETHRX clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     jneuhauser@dh-electronics.com, Marek Vasut <marex@denx.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
To:     Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
Date:   Mon, 24 Jan 2022 17:16:29 -0800
User-Agent: alot/0.10
Message-Id: <20220125011631.A3B5FC340E4@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2022-01-18 12:29:55)
> Pass parent_data to ETHRX clock with new fw_name =3D "ETH_RX_CLK/ETH_REF_=
CLK".
> By default, this change has no impact on the operation of the clock drive=
r.
> However, due to the fw_name, it permits DT to override ETHRX clock parent,
> which might be needed in case the ETHRX clock are supplied by external cl=
ock
> source.
>=20
> Example of MCO2 supplying clock to ETH_RX_CLK via external pad-to-pad wir=
e:
> &rcc {
>          clocks =3D <&rcc CK_MCO2>;
>          clock-names =3D "ETH_RX_CLK/ETH_REF_CLK";
> };
>=20
> Note that while this patch permits to implement this rare usecase, the is=
sue
> with ethernet RX and TX input clock modeling on MP1 is far more complex a=
nd
> requires more core plumbing.
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
