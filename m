Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7BAC6FD1C
	for <linux-clk@archiver.kernel.org>; Mon, 20 Mar 2023 19:41:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbjCTTlN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Mar 2023 15:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbjCTTkk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Mar 2023 15:40:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23F69198F
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 12:35:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C21EA617AF
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 19:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144D2C4339C;
        Mon, 20 Mar 2023 19:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679340944;
        bh=qu8DeqsmcJyPxNU0rND2wauwcQbq3kv14Xzxpd60JWo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=N5V7FDKU1iobk3x7V66e+lUDWAHAX/ov7BZS4BtUcoh2NgeePHwGH3wE3PeffDre+
         ss0H7eJO9l5pCJy/GNK2YWNVFys+h1R5bVJ+Bwg6yzk3rv3VXI9WQ6Jvatt0LAZiDc
         RQ9Eng005s5l5Re+rfsW1Sg2t+sLQMspKD0hRms18xm5mXgN6O2L6OAYkQdPZOc5CW
         IBS8Ew0FH4Pzn1VoSms+8shP80HSD1GyCsEAaVj2eyzTGI0V3BkOQgMC8laGW1LJml
         b7/+B7n0YIsOpV+QxVfuSu0UuPPruqXPSt/mAIuSoEm8OQinYHaMsiLI/cZ4lqqlPe
         T3PBem5Oyzipw==
Message-ID: <47c091b45aac1dc7a88e154a70e9a655.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3227516.44csPzL39Z@steina-w>
References: <20230310074940.3475703-1-alexander.stein@ew.tq-group.com> <a794bd7b3ee514a508c2af3d2b594d10.sboyd@kernel.org> <3227516.44csPzL39Z@steina-w>
Subject: Re: [PATCH 1/1] clk: rs9: Fix suspend/resume
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 20 Mar 2023 12:35:41 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Alexander Stein (2023-03-14 00:22:07)
> Am Montag, 13. M=EF=BF=BDrz 2023, 23:26:54 CET schrieb Stephen Boyd:
> > Quoting Alexander Stein (2023-03-09 23:49:40)
> >=20
> > > Disabling the cache in commit 2ff4ba9e3702 ("clk: rs9: Fix I2C access=
ors")
> > > without removing cache synchronization in resume path results in a
> > > kernel panic as map->cache_ops is unset, due to REGCACHE_NONE.
> > > Enable flat cache again to support resume again. num_reg_defaults_raw
> > > is necessary to read the cache defaults from hardware. Some registers
> > > are strapped in hardware and cannot be provided in software.
> > >=20
> > > Fixes: 2ff4ba9e3702 ("clk: rs9: Fix I2C accessors")
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > > There is also a series to not panic when using regcache_sync on
> > > REGCACHE_NONE maps at [1].
> >=20
> > And it was rejected?
>=20
> v2 has been accepted and is available at [1] in regmap's for-next branch.
>=20

So this still needs to be applied and backported to fix stable kernels?
