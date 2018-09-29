Return-Path: <SRS0=2F0X=ML=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE57C43143
	for <linux-clk@archiver.kernel.org>; Sat, 29 Sep 2018 00:16:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E5DC20779
	for <linux-clk@archiver.kernel.org>; Sat, 29 Sep 2018 00:16:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KGHi7Lw0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E5DC20779
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbeI2Gm7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 29 Sep 2018 02:42:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:60452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726804AbeI2Gm6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 29 Sep 2018 02:42:58 -0400
Received: from localhost (unknown [104.132.0.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 411E82073F;
        Sat, 29 Sep 2018 00:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1538180207;
        bh=ahVqU302gaGN/1LzPV3a6ytYwKJ57RVRNkKiqVzMTxo=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=KGHi7Lw0E8FHBLDAaxOblTstqUdKZGREH3ti6wyS/eKijI57SjSVSkgMHXGY21dV2
         XpnU8jCGDyBqgMncMzSc5RxwxvUV5uqkx1rRov350PCMp0ay/81Pwjbsr02/+ziqCT
         itmnW6S3ilH6sf1FWruW5DbuutYWSFmI+6PL7xUI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180925073405.26491-1-geert+renesas@glider.be>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20180925073405.26491-1-geert+renesas@glider.be>
Message-ID: <153818020658.119890.10677896555733020032@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH] clk: renesas: Convert to SPDX identifiers
Date:   Fri, 28 Sep 2018 17:16:46 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2018-09-25 00:34:05)
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> =

> This patch updates license to use SPDX-License-Identifier
> instead of verbose license text.
> =

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> [rebased against clk-spdx]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next

