Return-Path: <SRS0=WJeD=SU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D1ABC10F14
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 21:51:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 65DD9217D7
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 21:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555624280;
	bh=L/jy+ki1G6XvOhi+e0M4DbKRIZVch5UOXxHGwVc/nvE=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=y0zBWPokc8Etg1k5Ul0vgH82YoPCzYcZlkGy/2zrRL9O6blaW2Q+LDRQB15kEIst7
	 iU2ea4+PTTk7ZBr2b+b4aEtYCWOnz3dYnsNpcWgJfcLGFgqsD+rTm3cf6+G8zeHMjB
	 7bLTt1aBDe0xqYo5oO/168sKJXmAwEBUIIBswE3o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbfDRVvU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Apr 2019 17:51:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:51990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725853AbfDRVvT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Apr 2019 17:51:19 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6255E2087F;
        Thu, 18 Apr 2019 21:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555624279;
        bh=L/jy+ki1G6XvOhi+e0M4DbKRIZVch5UOXxHGwVc/nvE=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=DFl4+rIq3oNF8O8Bdw9xwB6IVdqcjKEdyR7l7F3FMfzjXMTNMQRQJjWXDnv1/j7fE
         9PpziyHglRbLVZT9a2cklZrK+1mdJ/nwNH6igtF+FMjD07133Tb81OEUpJ9UQe1/Bd
         NGqSbwANTW0Jir4lBSMw3tCbQxA41dIss1PBVecw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190418111211.10474-3-jonas.gorski@gmail.com>
References: <20190418111211.10474-1-jonas.gorski@gmail.com> <20190418111211.10474-3-jonas.gorski@gmail.com>
Cc:     Anatolij Gustschin <agust@denx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@xilinx.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH RFT V3 2/8] clk: fractional-divider: add explicit big endian support
To:     Jonas Gorski <jonas.gorski@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Message-ID: <155562427872.15276.10102650026056427528@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 18 Apr 2019 14:51:18 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jonas Gorski (2019-04-18 04:12:05)
> Add a clock specific flag to switch register accesses to big endian, to
> allow runtime configuration of big endian fractional divider clocks.
>=20
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---

Applied to clk-next

