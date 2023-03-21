Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA0BC74A5B
	for <linux-clk@archiver.kernel.org>; Tue, 21 Mar 2023 17:47:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbjCURrq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Mar 2023 13:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbjCURrp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Mar 2023 13:47:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97FDC2131
        for <linux-clk@vger.kernel.org>; Tue, 21 Mar 2023 10:47:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2625061D68
        for <linux-clk@vger.kernel.org>; Tue, 21 Mar 2023 17:47:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1A4C433EF;
        Tue, 21 Mar 2023 17:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679420832;
        bh=XB7WZL6pp7xEC6Aj1Ev+oZwqb0fuKm89bh6xIVOY8wA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nCTgnXbNXknGuuHLD4Cdkrgab970RPXhcWfB8qZ4s0rTtMWFpTnDHgRnh9SWY1vbE
         AjQqOlVPwRJ2UoEM8RKqNaqD6AUQ+vb0r+FnEvR/JlQEy1iv93URip7ICJdmY84CDA
         Pg+o7jxeFlzeVZHexSqe/ydO6dBA+dOdd1JYzrL6Y2KMstCJvv5ZaH2kSYtbwAYvCP
         R1u1+NalhDzh3L2Udx+Q23VKt7D3LbFGXjRWKx4QcjFQtkdr3Zhy7Aee8/WefhZ1Om
         36jJjW8RnAcwODSqQNbt7ImNpTzdZI5/orUdP+dFPM53G86Md6EHI3TgQw8mdWD0oz
         HqjgrtiUkCDTg==
Message-ID: <00aeb1e5154dd888ac716f2ded6d1190.sboyd@kernel.org>
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
Date:   Tue, 21 Mar 2023 10:47:10 -0700
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

Applied to clk-fixes
