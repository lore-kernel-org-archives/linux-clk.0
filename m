Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A262DC6FD1C
	for <linux-clk@archiver.kernel.org>; Tue, 14 Mar 2023 07:22:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbjCNHWP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Mar 2023 03:22:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjCNHWO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Mar 2023 03:22:14 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B51B60411
        for <linux-clk@vger.kernel.org>; Tue, 14 Mar 2023 00:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678778532; x=1710314532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QSbp+j3Lryzh5nHW/M+6DxKV/MdRyvj9Id1UXRl9KLo=;
  b=pHTvIo7s/jTFehEq3hvYq9Qunc0C8y0kCfHC9KXEsLR916ddotKwrTN4
   oJVX5IA33tkYC7tKFuzweLNXreNvH50vO3LpRzXFcOkVuAErfemcCadoj
   tuh7RGAJPjsHupB+zgZA7KT5tTpiKObI4VLOsnCtES6YjSz0YtCC9bqFx
   uVw9PWLa3/ZWF5Ubr2EbCMi5JXdeGi+hkzdtYrrE4k+VUuqbCxIH0xQfA
   3A+/BBkS3/u08CLf5CpTcFo7+/v9aA6mxRdzi1/6l9bpZEYk7U//6cvop
   /Q1rvHWmLoqZPv5R23N9sviqvG+wy4eOVCVj+PuC90OS2IrjGLh8ybO9p
   g==;
X-IronPort-AV: E=Sophos;i="5.98,259,1673910000"; 
   d="scan'208";a="29664688"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 14 Mar 2023 08:22:10 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 14 Mar 2023 08:22:10 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 14 Mar 2023 08:22:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678778530; x=1710314530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QSbp+j3Lryzh5nHW/M+6DxKV/MdRyvj9Id1UXRl9KLo=;
  b=WRO2xVcb6HMnuHqosrd5FrI6Dkm6cKTGBJN8E/stKhAsKqgAJXywCWVX
   iO4g2gwdksEI6AHb3ko+tvgS+yv1A20EcPN6UTFYg/PxeyGNyRCpCwTAI
   zKhT5MHBGSQtc7jDrzVtgd3TZTGdw8y2toeGgsc8oCuErPz/ERspicpsp
   M7oMIMIxvxSpBlHbFTTqrLzzO8NZwgwIdmrWpFfsrvJIon42MMoKW+PaQ
   IchnSHMZ15Lgy5fIDxaf7FSAfWwvnovUEMsA+D5nXd0ldP/5SjJS7zGjw
   w/5vor2p9BYAZPmmPDCcgdDs83midPJ0vERhP0EeO3eyA4KG1Kb+FSvR7
   A==;
X-IronPort-AV: E=Sophos;i="5.98,259,1673910000"; 
   d="scan'208";a="29664687"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 14 Mar 2023 08:22:10 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 0FA0C280056;
        Tue, 14 Mar 2023 08:22:10 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/1] clk: rs9: Fix suspend/resume
Date:   Tue, 14 Mar 2023 08:22:07 +0100
Message-ID: <3227516.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <a794bd7b3ee514a508c2af3d2b594d10.sboyd@kernel.org>
References: <20230310074940.3475703-1-alexander.stein@ew.tq-group.com> <a794bd7b3ee514a508c2af3d2b594d10.sboyd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am Montag, 13. M=E4rz 2023, 23:26:54 CET schrieb Stephen Boyd:
> Quoting Alexander Stein (2023-03-09 23:49:40)
>=20
> > Disabling the cache in commit 2ff4ba9e3702 ("clk: rs9: Fix I2C accessor=
s")
> > without removing cache synchronization in resume path results in a
> > kernel panic as map->cache_ops is unset, due to REGCACHE_NONE.
> > Enable flat cache again to support resume again. num_reg_defaults_raw
> > is necessary to read the cache defaults from hardware. Some registers
> > are strapped in hardware and cannot be provided in software.
> >=20
> > Fixes: 2ff4ba9e3702 ("clk: rs9: Fix I2C accessors")
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > There is also a series to not panic when using regcache_sync on
> > REGCACHE_NONE maps at [1].
>=20
> And it was rejected?

v2 has been accepted and is available at [1] in regmap's for-next branch.

Best regards,
Alexander

[1] https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git/
commit/?id=3Dfd883d79e4dcd2417c2b80756f22a2ff03b0f6e0
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


