Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E86C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 29 Oct 2021 06:42:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9D1861151
	for <linux-clk@archiver.kernel.org>; Fri, 29 Oct 2021 06:42:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232053AbhJ2GpQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Oct 2021 02:45:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:56252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230252AbhJ2GpQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 29 Oct 2021 02:45:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6180E600EF;
        Fri, 29 Oct 2021 06:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635489768;
        bh=i7vsYO/aq+qtfFVL3WNN7t4dt+Ran+zcKeLEf5z34W8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HGILTzHA9KkTYqs0f9Wk9j5vtZGGnBxfa3il48MDhLLFy5emnNd6CXzCOC7GZHNVW
         P6//p/kiowmD5dgASG57nHq6KeipevghEBtLs/r2mLCuD1pC2taNTwfG0xUMDu7UoV
         Sanb6OKjQF2tBcyWSQR7Ije10KILHsuSIiId8e7ukNzTcs0Z0XeJ1CBTOVbURWvVch
         EJ1/pqc4gqncFw2F4Pe8ysBr7ImavEK8evoySPZzxtZwhkbuHuVhPzmOCpFdD7xzsL
         HrZC35D3NWRizRWU7pliqbUyw2eWueut5m+10pGbAAPX95JJPRjcAldUafL1LKuUlw
         L/TczIEEWrDBA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211027132616.1039814-3-heiko@sntech.de>
References: <20211027132616.1039814-1-heiko@sntech.de> <20211027132616.1039814-3-heiko@sntech.de>
Subject: Re: [PATCH 2/2] clk: rockchip: drop module parts from rk3399 and rk3568 drivers
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kernel@esmil.dk, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, heiko@sntech.de
To:     Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org
Date:   Thu, 28 Oct 2021 23:42:47 -0700
Message-ID: <163548976724.15791.12515100208357999661@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2021-10-27 06:26:16)
> Both of these drivers were converted to real drivers and got a tristate
> build option. But them being builtin_platform_drivers, they only ever
> should be build-in - as the name suggests.
>=20
> So adapt the Kconfig symbol and drop the MODULE_* parts from the drivers.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
