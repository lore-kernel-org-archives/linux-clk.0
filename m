Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69863C74A5B
	for <linux-clk@archiver.kernel.org>; Tue, 21 Mar 2023 06:21:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbjCUGVA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Mar 2023 02:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbjCUGU7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Mar 2023 02:20:59 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D6B35266
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 23:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1679379655; x=1710915655;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x/JKQO/tvXLKFrfpzBs7bKa38ecdXEcKSMQn3siIxCc=;
  b=jArOACVhV3PIAfAgxq2Nkp2yEyDs3uPC2hoaKtA7tgK3I2kK36YB6J61
   eZgmmt9DOkMzpINld5EDKOtF5Lb/J6P0+sUTpvC1wGeS/Qm/SkTlDIynx
   4PIcJTqdPY6Y68C8DI7sbATT1x+/6nEmdfOCyEsazOUMGBdams5A2jDeW
   mcJT1dhtjLFbtzPyAJqFStXRF05KhRhM0hCfTeCeX2R1UeEStALV9kAdF
   kFmBFYq50H5R06QfEdLgIP6ahRJijQER6LZZC2y335haEYaVpP2qLm2Pk
   XvQwNvSNY+VkHE+8fU2/EG+coHjdF59WZThtnKxI5qiWZjq1YbccmP0RG
   w==;
X-IronPort-AV: E=Sophos;i="5.98,278,1673910000"; 
   d="scan'208";a="29816836"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Mar 2023 07:20:53 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 21 Mar 2023 07:20:53 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 21 Mar 2023 07:20:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1679379653; x=1710915653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x/JKQO/tvXLKFrfpzBs7bKa38ecdXEcKSMQn3siIxCc=;
  b=cx/v5mNcfnc4HI14UYjq64HzbGI7nhU6EAv3kJEMnjyLOlNgE5GEhRx6
   FCilRqoFqhqdDQVW8RWKHw5GXV+eR6MkcBlcOAtdkUZQJFAy89m0+sBmI
   PVO54LHb/+qhZ2z3SlrD9/2PsudTWBZhL7Syg0ZXZa7b+EycTUfATEoN9
   Zln5Tg4w+ZNWOT1PtoZo1hMjQqRDhXDUwTd5bEjODdSYkjciyS01gxGUo
   yYvGPfjLKY33j1VqGLNHL+6aOKZIA7AGiqCJFYL1KjGcb5tzPWyuJcE/J
   thowGw54wGHNzzWweXncDkh4ISeDupiZ8qVlXI3dnuyiKK0brTgPL4Mim
   w==;
X-IronPort-AV: E=Sophos;i="5.98,278,1673910000"; 
   d="scan'208";a="29816835"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Mar 2023 07:20:52 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id CE0D6280056;
        Tue, 21 Mar 2023 07:20:52 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/1] clk: rs9: Fix suspend/resume
Date:   Tue, 21 Mar 2023 07:20:50 +0100
Message-ID: <12182972.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <47c091b45aac1dc7a88e154a70e9a655.sboyd@kernel.org>
References: <20230310074940.3475703-1-alexander.stein@ew.tq-group.com> <3227516.44csPzL39Z@steina-w> <47c091b45aac1dc7a88e154a70e9a655.sboyd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am Montag, 20. M=C3=A4rz 2023, 20:35:41 CET schrieb Stephen Boyd:
> Quoting Alexander Stein (2023-03-14 00:22:07)
>=20
> > Am Montag, 13. M=EF=BF=BDrz 2023, 23:26:54 CET schrieb Stephen Boyd:
> > > Quoting Alexander Stein (2023-03-09 23:49:40)
> > >=20
> > > > Disabling the cache in commit 2ff4ba9e3702 ("clk: rs9: Fix I2C
> > > > accessors")
> > > > without removing cache synchronization in resume path results in a
> > > > kernel panic as map->cache_ops is unset, due to REGCACHE_NONE.
> > > > Enable flat cache again to support resume again. num_reg_defaults_r=
aw
> > > > is necessary to read the cache defaults from hardware. Some registe=
rs
> > > > are strapped in hardware and cannot be provided in software.
> > > >=20
> > > > Fixes: 2ff4ba9e3702 ("clk: rs9: Fix I2C accessors")
> > > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > ---
> > > > There is also a series to not panic when using regcache_sync on
> > > > REGCACHE_NONE maps at [1].
> > >=20
> > > And it was rejected?
> >=20
> > v2 has been accepted and is available at [1] in regmap's for-next branc=
h.
>=20
> So this still needs to be applied and backported to fix stable kernels?

IMHO yes, because without cache nothing will be stored/restored upon suspen=
d/
resume. The other patch in regcache was just to ensure broken drivers (like=
=20
this one in the current state) do not crash the kernel.

Best regards,
Alexander

=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


