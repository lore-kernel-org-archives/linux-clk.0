Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FFBC63777
	for <linux-clk@archiver.kernel.org>; Fri, 27 Nov 2020 19:58:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2D71208D5
	for <linux-clk@archiver.kernel.org>; Fri, 27 Nov 2020 19:58:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bppiD1tl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731014AbgK0T5x (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 27 Nov 2020 14:57:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:35050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730653AbgK0T5J (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 27 Nov 2020 14:57:09 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D9F9208B3;
        Fri, 27 Nov 2020 19:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606507008;
        bh=hD40k2v78JS8MUejTYj7Rnup4W4KIqn/L63Q/BBpWx0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bppiD1tl2IfBfd/S0pS5kJoI93oBhxGkdXrQ/F4bUT0hr5RkAqGvm52w3yYnlzMVQ
         u/PqofDiI2tV0gN2fSoYn2RgEFEqXsqWrgorEakjRjhld+mr5LLjyyV7PIRrrdPZKC
         JnH3U8NAVSA34TzND4TC0oT48JAF5Q9NdqypK3OE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201127090551.50254-1-vulab@iscas.ac.cn>
References: <20201127090551.50254-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] clk: rockchip: Remove redundant null check before clk_prepare_enable
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org
To:     Xu Wang <vulab@iscas.ac.cn>, heiko@sntech.de,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org, mturquette@baylibre.com
Date:   Fri, 27 Nov 2020 11:56:47 -0800
Message-ID: <160650700726.2717324.52988673805116278@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Xu Wang (2020-11-27 01:05:51)
> Because clk_prepare_enable() already checked NULL clock parameter,
> so the additional check is unnecessary, just remove it.
>=20
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
