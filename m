Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971FDC4361B
	for <linux-clk@archiver.kernel.org>; Sat, 19 Dec 2020 23:54:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A48623407
	for <linux-clk@archiver.kernel.org>; Sat, 19 Dec 2020 23:54:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgLSXyu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 19 Dec 2020 18:54:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:36718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726853AbgLSXyt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 19 Dec 2020 18:54:49 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608422049;
        bh=aEg+rdpwz411phur98atSKJ1umbvrbvgkWU5352/C5Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tpIXwBnlj1kLgFwI5bq7Wu/a2zuA0yg9/zB9Czjv0MxVTofw51xyQIBkce3Yqx0Hw
         IFUV+RrvYVFh85aJ25vooqMhkQo0R0aQpUuQEU74UOsFusezNMLZfx/PrXGb++eXXd
         skxu/ODT8hibMK7OJ9mOqM1DmPUwoGrYl5fqksyI7iqMpXQkRt/xGe2SAxub/Igzzb
         b40JE7oSmDUYsUmiGyEJ6ZOmW4BV/hB/LwKT31pilQ0L8UQPhzbWeXUhDODE9cVVOj
         i50RwEKBZFrGytbEhsWj931gJfFGFhkaGQ9peCEf+PPOlwIlI6Ly06x56+RIy7z2st
         +C3I0vQ0Td2aA==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201202203817.438713-1-jernej.skrabec@siol.net>
References: <20201202203817.438713-1-jernej.skrabec@siol.net>
Subject: Re: [PATCH] clk: sunxi-ng: Make sure divider tables have sentinel
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, jernej.skrabec@siol.net,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
To:     Jernej Skrabec <jernej.skrabec@siol.net>, mripard@kernel.org,
        wens@csie.org
Date:   Sat, 19 Dec 2020 15:54:08 -0800
Message-ID: <160842204805.1580929.8454441856574875160@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jernej Skrabec (2020-12-02 12:38:17)
> Two clock divider tables are missing sentinel at the end. Effect of that
> is that clock framework reads past the last entry. Fix that with adding
> sentinel at the end.
>=20
> Issue was discovered with KASan.
>=20
> Fixes: 0577e4853bfb ("clk: sunxi-ng: Add H3 clocks")
> Fixes: c6a0637460c2 ("clk: sunxi-ng: Add A64 clocks")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---

Applied to clk-next
