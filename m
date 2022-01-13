Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819F5C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jan 2022 21:21:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235229AbiAMVVJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jan 2022 16:21:09 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:52616 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235004AbiAMVVJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jan 2022 16:21:09 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CC956B8238A;
        Thu, 13 Jan 2022 21:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B561C36AEA;
        Thu, 13 Jan 2022 21:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642108866;
        bh=eExCLSo4IBc5vsBIn91cwXO1Hl+MHGGra6rNWEwBxnc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=p099yIMl+VDHasope6hcEEsyaB02MYifaEcElLJXdk+W6Ft2bkwL3nRwRnx6jSHbR
         U9BB4CuDL3cVTypeASQ87PNEiGElXNoB83IalUr7G5QLCvR2PmgCoG/74zK+ZYCKH3
         PWj1gGe998slkmavlx1QJOYuUob1OXUAcR7pfO66tXmEUro9tkUueeA7tr9gh+vcjr
         QlhBGv0x3wH5AZjTVo/JXri3PIK3FjaO5qPft0ujmBSOo4aF6iyIikzXX9/rjTtZlz
         C9BYQT9ZAl6LDV9DQJPIJf3IyaNuiO5PXQtW05IOTRyjYu0qlfvPdiYOTQ/I92w1H4
         y6u6XJUHr4Erw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220111072529.GJ11243@kili>
References: <20220111072529.GJ11243@kili>
Subject: Re: [PATCH] clk: visconti: Fix uninitialized variable in printk
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Date:   Thu, 13 Jan 2022 13:21:05 -0800
User-Agent: alot/0.9.1
Message-Id: <20220113212106.8B561C36AEA@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dan Carpenter (2022-01-10 23:25:29)
> The "pll_clck" variable is uninitialized.  The "ret" error code was
> supposed to be printed instead.
>=20
> Fixes: b4cbe606dc36 ("clk: visconti: Add support common clock driver and =
reset driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Applied to clk-next
