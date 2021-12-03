Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D16C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  3 Dec 2021 01:27:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376725AbhLCBay (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Dec 2021 20:30:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356794AbhLCBax (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Dec 2021 20:30:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72908C06174A
        for <linux-clk@vger.kernel.org>; Thu,  2 Dec 2021 17:27:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2A59FB8256E
        for <linux-clk@vger.kernel.org>; Fri,  3 Dec 2021 01:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B44C00446;
        Fri,  3 Dec 2021 01:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638494847;
        bh=Rq2P+8hNLkrNb2do5AuXUe7qnQ0iupy2I5JXh6KOc9U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HIAH0SNOQpgU10WkluUzrBt9mJbSidpGZJ+cqKddkjGyItxiHwwjjjB8YIoTwzjgI
         cf/RelQRx/FlXPA1MAJIZNftnhtcA/lLlPdSxuEx5+loEgvgbkb/1Nu41Rwop9h1dZ
         0OFcTn5eJBiv9G+Vtxti0PO+2d/8GWQ1vaDEOeavYFzb0JyXYuAwJTL6/7w4cTUZHz
         Gg3oTD7XM6hVozQkodm82o0mVE+T6eJWntQLMFnZxdY8b/p8QsklNW4Ac3C1+z2nYc
         nH10W1c8rI4rvwnol8EYzxiYathuI6F1tGi+x+/ulP0hpV8YsH9G+kR3+JORCOKU1x
         JfAWPUDY1x8Aw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9929a56462bfdd491c43c233abc4341fc14dac1d.1637139796.git.shubhrajyoti.datta@xilinx.com>
References: <9929a56462bfdd491c43c233abc4341fc14dac1d.1637139796.git.shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH] clk: zynq: pll: Fix kernel-doc warnings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     michal.simek@xilinx.com, mturquette@baylibre.com,
        shubhrajyoti.datta.gmail.com@xilinx.com, git@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-clk@vger.kernel.org
Date:   Thu, 02 Dec 2021 17:27:26 -0800
User-Agent: alot/0.9.1
Message-Id: <20211203012727.C5B44C00446@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2021-11-17 01:08:54)
> Fix the following kernel-doc warning
>=20
> drivers/clk/zynq/pll.c:15: warning: missing initial short description on =
line:
>  * struct zynq_pll
> drivers/clk/zynq/pll.c:96: warning: No description found for return value=
 of 'zynq_pll_is_enabled'
> drivers/clk/zynq/pll.c:116: warning: No description found for return valu=
e of 'zynq_pll_enable'
> drivers/clk/zynq/pll.c:187: warning: No description found for return valu=
e of 'clk_register_zynq_pll'
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---

Applied to clk-next
