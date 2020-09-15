Return-Path: <SRS0=RhxI=CY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4EEC43461
	for <linux-clk@archiver.kernel.org>; Tue, 15 Sep 2020 00:42:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93C4221655
	for <linux-clk@archiver.kernel.org>; Tue, 15 Sep 2020 00:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600130548;
	bh=Z8nw5c5Q3CbMFYKlnZVQaLNFFNaRL8zeiJI4Pjg8QjA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=e2Sc7I/ecWcldon4katcILVzmr3T41YTMfo/6LtI8v70z5QwYo5DZEvg7gkUy7ZzS
	 RUnYmok8ApcjP0KWdNQy8826RCOckGazJbCalbC0Uywvqv1RQPSTToRo+4GyUnLcCv
	 b9abcyxPN8PnPvMFUri6eUPXETct1e3Ulpnuiumw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgIOAm2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Sep 2020 20:42:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:39428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726140AbgIOAmZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 14 Sep 2020 20:42:25 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DB3D6212CC;
        Tue, 15 Sep 2020 00:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600130545;
        bh=Z8nw5c5Q3CbMFYKlnZVQaLNFFNaRL8zeiJI4Pjg8QjA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lMvIQJAwSYVMOVtGPPdcU1iMcLFddgA1mIKbgnXlxJkCbC38IjIQ1Msr8SuVHByO2
         FBW0OVCG9x4jVYGjPDmvGXHCi1IESAoY8/XdXXrRtXio5HQFUClmVP2BAZzRMqgNP8
         dpnSm+VPvJQXsHFhwEOpTqgCvbs6flA66PYOnEkg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200914022304.23908-1-zhangqing@rock-chips.com>
References: <20200914022225.23613-1-zhangqing@rock-chips.com> <20200914022304.23908-1-zhangqing@rock-chips.com>
Subject: Re: [PATCH v4 5/6] clk: rockchip: fix the clk config to support module build
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com,
        kever.yang@rock-chips.com, Elaine Zhang <zhangqing@rock-chips.com>
To:     Elaine Zhang <zhangqing@rock-chips.com>, heiko@sntech.de
Date:   Mon, 14 Sep 2020 17:42:23 -0700
Message-ID: <160013054380.4188128.8368118577491128179@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Elaine Zhang (2020-09-13 19:23:04)
> use CONFIG_COMMON_CLK_ROCKCHIP for Rk common clk drivers.
> use CONFIG_CLK_RKXX for Rk soc clk driver.
> Mark CONFIG_CLK_RK3399 to "tristate",
> to support building Rk3399 SoC clock driver as module.
>=20
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Reviewed-by: Kever Yang <kever.yang@rock-chips.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
