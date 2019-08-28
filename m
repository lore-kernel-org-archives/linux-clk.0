Return-Path: <SRS0=KEZg=WY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79986C3A5A1
	for <linux-clk@archiver.kernel.org>; Wed, 28 Aug 2019 22:15:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 48AAD22DA7
	for <linux-clk@archiver.kernel.org>; Wed, 28 Aug 2019 22:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567030530;
	bh=WaS7EWeJ3XuqZ+t3BTqCw1KcVapxDI0am0Bcmciu7Ww=;
	h=In-Reply-To:References:Cc:Subject:To:From:Date:List-ID:From;
	b=pSMVpZXyFATuD7JaX6z97JtDaqlZ5Q1UxoV0X0tpPOyfQTlp/ZaXgyusWBNCiRox8
	 r4X9kF55argU0S3a7tY+cHKNmN7tx1pqZnpZuDYzBUR0u+TODf1dxl4GGDNDEqJ+Fb
	 Wgnf5FMu/NUY4CTmduM0iTvuf2i9qwzIuawHgPLg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbfH1WPa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Aug 2019 18:15:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:52720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726658AbfH1WP3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 28 Aug 2019 18:15:29 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 026C522DA7;
        Wed, 28 Aug 2019 22:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567030529;
        bh=WaS7EWeJ3XuqZ+t3BTqCw1KcVapxDI0am0Bcmciu7Ww=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=wvw9f3ZHg9Rwv/wgwZPyvmRxCLZMkbvDHNX3fOtbIaChIL5RPa+Lv0EXNu3gJkqez
         7iz2BK+siyRe3io8n+7ZNAU5aGp5V9Dpnya77nqSvidFMzhJzCIKvH+ltQIttwJwKn
         dIS2XZfuuBaDvHRpL2uc5qLjQlgBV+BjASw6yVhE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190828102012.4493-5-jbrunet@baylibre.com>
References: <20190828102012.4493-1-jbrunet@baylibre.com> <20190828102012.4493-5-jbrunet@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH RFC 4/5] clk: add placeholder for clock internal data
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 28 Aug 2019 15:15:28 -0700
Message-Id: <20190828221529.026C522DA7@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2019-08-28 03:20:11)
> Add placeholder in clock core to save per clock data.
> Such placeholder could use for clock doing memory allocation in .init().
> It may also be useful for the save/restore_context() callbacks.
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/clk.c            | 13 +++++++++++++
>  include/linux/clk-provider.h |  2 ++
>  2 files changed, 15 insertions(+)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index c703aa35ca37..aa77a2a98ea4 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -83,6 +83,7 @@ struct clk_core {
>         struct hlist_node       debug_node;
>  #endif
>         struct kref             ref;
> +       void                    *priv;

Why? We have container structures around clk_hw that can be used to
store data and clk_ops that should know to deref said clk_hw pointer in
some way to access that data.
