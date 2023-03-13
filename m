Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D696CC61DA4
	for <linux-clk@archiver.kernel.org>; Mon, 13 Mar 2023 22:26:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbjCMW07 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Mar 2023 18:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjCMW06 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Mar 2023 18:26:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F16128F721
        for <linux-clk@vger.kernel.org>; Mon, 13 Mar 2023 15:26:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 77E0661520
        for <linux-clk@vger.kernel.org>; Mon, 13 Mar 2023 22:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDBCCC433EF;
        Mon, 13 Mar 2023 22:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678746416;
        bh=Rw6n5sv5dFk9wcWcbiT5FXi1EWySgPgNtxOn4KpBlJ4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=R+lQY8euSugoDU5liSzvtdGAcB73XWuuBhan99k2U6o/lyiYDWgO5RE8f6QqERYhh
         AhrIrulNzuBqBTKu9UV+ijU2LSe9stNRg2S2X/itUgue9GXOWkh3SJ8698u3ApuvDl
         MFPeBN/6ouvg+pwpP9jFcgFsMJ6ZxVCToLjjESc95EdRo5itrjt+skmHZocqE9WGNX
         LWR7gybiQ7kl7R84h+OOT+RmMtItbeTinATWyGIhdC7uetVQahp97ZD5pNfXc5nj5o
         yf0zuINVAeXsrBNiinzTeg1W7KQqSi/gE5Gty8L4fiQLI9OxRxzaYM/sAPrmn4ufuQ
         SgGCldk1Hk9Eg==
Message-ID: <a794bd7b3ee514a508c2af3d2b594d10.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230310074940.3475703-1-alexander.stein@ew.tq-group.com>
References: <20230310074940.3475703-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] clk: rs9: Fix suspend/resume
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-clk@vger.kernel.org
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 13 Mar 2023 15:26:54 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Alexander Stein (2023-03-09 23:49:40)
> Disabling the cache in commit 2ff4ba9e3702 ("clk: rs9: Fix I2C accessors")
> without removing cache synchronization in resume path results in a
> kernel panic as map->cache_ops is unset, due to REGCACHE_NONE.
> Enable flat cache again to support resume again. num_reg_defaults_raw
> is necessary to read the cache defaults from hardware. Some registers
> are strapped in hardware and cannot be provided in software.
>=20
> Fixes: 2ff4ba9e3702 ("clk: rs9: Fix I2C accessors")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> There is also a series to not panic when using regcache_sync on
> REGCACHE_NONE maps at [1].

And it was rejected?

>=20
> [1] https://lore.kernel.org/lkml/20230310073911.3470892-1-alexander.stein=
@ew.tq-group.com/T/#u
>
