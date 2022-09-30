Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17660C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 21:38:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231759AbiI3ViV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 17:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbiI3ViU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 17:38:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9136311E5F3
        for <linux-clk@vger.kernel.org>; Fri, 30 Sep 2022 14:38:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4E321B82A21
        for <linux-clk@vger.kernel.org>; Fri, 30 Sep 2022 21:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04366C433D6;
        Fri, 30 Sep 2022 21:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664573897;
        bh=PgzVp/AEGCCM0mW4ivhwsnkXi4/mlfJHRwO4x5L3HeQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bqfA1EFXeMpaU30sDAF9wOCevNIBhAlLNIqm4sm0vxrnlncE+RWQhwWN78AywHGrw
         I3nrDpOIApyUMo9lbh59EHY2y1TDUA4wdasU6WUVmGBMpC0uxW5KnzJb3cRqKUqe9S
         AM/5qX8nLvdAUl2Naaoznxo7x1MID7WUOcU7I8o+R4CsierA56VfR06aHCN8xxWM2P
         HtcJuWITgAkcF3HeXdrin8KL7ODiZC1wG7kUZgEqZ7sc0siFFGAyL2+FEH47Sa+OBw
         FbuYpkFlXuozQrIWwILZdbMr9Eq0V8tz7lAXU5zdSRSOM07x4/csTtUsjIV7Xk/Q8h
         Ts6zIOjtljxAQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1664517759-19807-1-git-send-email-haibo.chen@nxp.com>
References: <1664517759-19807-1-git-send-email-haibo.chen@nxp.com>
Subject: Re: [PATCH] clk: imx93: correct the flexspi1 clock setting
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     festevam@gmail.com, linux-clk@vger.kernel.org, linux-imx@nxp.com,
        haibo.chen@nxp.com, peng.fan@nxp.com, ping.bai@nxp.com
To:     abelvesa@kernel.org, haibo.chen@nxp.com, kernel@pengutronix.de,
        mturquette@baylibre.com, s.hauer@pengutronix.de,
        shawnguo@kernel.org
Date:   Fri, 30 Sep 2022 14:38:13 -0700
User-Agent: alot/0.10
Message-Id: <20220930213817.04366C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting haibo.chen@nxp.com (2022-09-29 23:02:39)
> From: Haibo Chen <haibo.chen@nxp.com>
>=20
> Correct IMX93_CLK_FLEXSPI1_GATE CCGR setting. Otherwise the flexspi
> always can't be assigned to a parent clock when dump the clock tree.
>=20
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---

Any Fixes tag?
