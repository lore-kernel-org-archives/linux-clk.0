Return-Path: <SRS0=gleC=RP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5BDC43381
	for <linux-clk@archiver.kernel.org>; Tue, 12 Mar 2019 16:52:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 850FF2087C
	for <linux-clk@archiver.kernel.org>; Tue, 12 Mar 2019 16:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1552409558;
	bh=QfIp4DqgAnSYJPPhlqon1dkLG6cJoS6h+QjASzRJ8ZQ=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=jrrQyegrTm+PaGM41+Wf7xi373TpI6c4Cf1xl4vxhLQZYS3ZgdDZiEqA+r6RRRpRU
	 iu52RjNr3p8Zh1GWAdg8b43goZArhKEFrzbHZioAldG5QOloZ8Up46Zn+ZWJjRPIhS
	 H6B1GPqxGppQTgVPdVy6CgSY0e1hKKN/7bkiXoxU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbfCLQwi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Mar 2019 12:52:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:58554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725894AbfCLQwh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 12 Mar 2019 12:52:37 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3E9A92054F;
        Tue, 12 Mar 2019 16:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1552409557;
        bh=QfIp4DqgAnSYJPPhlqon1dkLG6cJoS6h+QjASzRJ8ZQ=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=Q5OKhMGFvfpRqCevJ+BtAnJ0rISgpRGQCK7dFsTlVOzVcfmjLX0N1nSXI6jDNf5ld
         KVYta/LvKce+IkrbXrLtxrTtx7zgdUTHEXAq5JIc2pnc8hw3Vlrx/EEmhMGtlLc+Vo
         Jemf3LruFiHJM7G5jG0s1nMpCj2LYVfHuRhvH6AM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190312110016.29174-4-m.tretter@pengutronix.de>
References: <20190312110016.29174-1-m.tretter@pengutronix.de> <20190312110016.29174-4-m.tretter@pengutronix.de>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 3/5] clk: zynqmp: do not export zynqmp_clk_register_mux
Cc:     kernel@pengutronix.de, Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Michael Tretter <m.tretter@pengutronix.de>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Message-ID: <155240955647.20095.10179114897194099184@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Tue, 12 Mar 2019 09:52:36 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2019-03-12 04:00:14)
> zynqmp_clk_register_mux is an internal function of the driver that only
> should be used from clkc.c. Therefore, there is no need to export that
> function.
>=20
> Follow the suit of the other files of the driver and do not export the
> register function.

Does this mean that the divider file shouldn't export the divider
registration function either? Please add a patch for that if it's the
case. Otherwise this looks fine given that the code using this function
is always built in.

