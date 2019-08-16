Return-Path: <SRS0=XVLz=WM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2B7C3A59C
	for <linux-clk@archiver.kernel.org>; Fri, 16 Aug 2019 17:25:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E330721721
	for <linux-clk@archiver.kernel.org>; Fri, 16 Aug 2019 17:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565976311;
	bh=l2UhekZfp46Gm4ghaGYnz4/LUNxAABqLtkbqZkEPCNg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=GJtIxrHGKVZsr7YoX1vLgBRfN3I/Dwui3epIQIfMLDhvrkgy7P3ZeBNhBh1Fmo4B4
	 iiYYZyLiqutwpnB6qDeHgvMP9UjbfmzMI32Bk81XGs+pTOwCYX2ry7PZ8ngpv5RuXc
	 TJsirncmdP9CzpaKMbvpMKc9CA1Qiqz8lzbDzIOg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727577AbfHPRZH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Aug 2019 13:25:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:50244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727529AbfHPRZH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 16 Aug 2019 13:25:07 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 727322086C;
        Fri, 16 Aug 2019 17:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565976306;
        bh=l2UhekZfp46Gm4ghaGYnz4/LUNxAABqLtkbqZkEPCNg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gD5G1dqI0AxFdz7yj5rpcx6Hb/aRlL6atXSEOPhTcs8zDfLbxz4oUOWe6oUctF30d
         7oNlP/OFy7GGEHcR4Mf+JRceID6pn2el9azNIcWpvC44fY3tbCYbRGKW6dp7T4u0Jq
         ol9ZwtqsVTrMkDi66S+6oOdt5xkkBqDevVOyJXa4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190815041037.3470-1-sboyd@kernel.org>
References: <20190815041037.3470-1-sboyd@kernel.org>
Subject: Re: [PATCH] clk: sunxi: Don't call clk_hw_get_name() on a hw that isn't registered
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Fri, 16 Aug 2019 10:25:05 -0700
Message-Id: <20190816172506.727322086C@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stephen Boyd (2019-08-14 21:10:37)
> The implementation of clk_hw_get_name() relies on the clk_core
> associated with the clk_hw pointer existing. If of_clk_hw_register()
> fails, there isn't a clk_core created yet, so calling clk_hw_get_name()
> here fails. Extract the name first so we can print it later.
>=20
> Fixes: 1d80c14248d6 ("clk: sunxi-ng: Add common infrastructure")
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next

