Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B29C43381
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 19:38:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C485C204EC
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 19:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1553024339;
	bh=Swh4Nx9EHbpfn9+3aXW+jQdf511OrEPyZz7sHqxAcRo=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=oSjjQqDSqcIRfKzGEi0uD3JlGcM18sAWaJtwWaST9YvTINNqDiy2V8GzgS+zPr4K2
	 c8gDRw1uHGZJNw7kvHubUTuGIEGudCaxB3P/L2nq6FvoT8wcuDkj0YxAYXQfSJh/o5
	 2uyKMyTFzYSo0v8+znS5L+9apEqUR8Al4bpkgB/Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbfCSTi7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Mar 2019 15:38:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:47914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726627AbfCSTi7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 19 Mar 2019 15:38:59 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B36B20811;
        Tue, 19 Mar 2019 19:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1553024338;
        bh=Swh4Nx9EHbpfn9+3aXW+jQdf511OrEPyZz7sHqxAcRo=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=pZu94NU1Z5I7+K24aFIVqGOvb1qYW85/uJZLVEaBlmNBKLdHiT1pm8q77cyUZf6Zl
         fBvZYowX0itBSdNylaoh00qp5V8Lmvi3sRba4QB2Rie6szd2Ym5xt7NnsyoSR33jLw
         hcX8w/RGWax6kkK4lsgkc2jZ7Pb3gch+7A77ExEA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190319143759.21650-1-maxime.ripard@bootlin.com>
References: <20190319143759.21650-1-maxime.ripard@bootlin.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] clk: sunxi: Add Kconfig options
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
To:     Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <155302433780.20095.8306789134509103174@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Tue, 19 Mar 2019 12:38:57 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2019-03-19 07:37:59)
> We used to have a clock framework that isn't really used these days, exce=
pt
> for a few clocks and/or SoCs. Most of the time, the new framework and
> drivers (sunxi-ng) will provide everything needed for the customer devices
> to operate properly.
>=20
> Since we're not needing it that much, it might make sense to disable those
> drivers, for example when we want to reduce the kernel size. Let's add
> options in Kconfig that can be disabled if needed, but are still on by
> default to keep the same features in the standard case.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>=20
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

