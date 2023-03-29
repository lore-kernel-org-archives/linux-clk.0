Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE19C76196
	for <linux-clk@archiver.kernel.org>; Wed, 29 Mar 2023 02:39:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbjC2CjW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Mar 2023 22:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbjC2CjS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Mar 2023 22:39:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B4F73C21;
        Tue, 28 Mar 2023 19:39:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C5C2FB81E4A;
        Wed, 29 Mar 2023 02:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 838EAC433D2;
        Wed, 29 Mar 2023 02:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680057546;
        bh=X0dhzLuUJ5cHqjst/sBdQo/tR2QcJ8NyxEBS4h6WxQo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=r189eUhMU6DgnM+c1XZBTEbSW6KfMfVZl3o1XtgZLZf5VKdz2bJEvEy4/U0sXOS8M
         joR/gtDmZulwepIqN5ll+nMdUw/hZxMdwP4UpYHASxCZ1MkBOjTxob/TNDaAJ0/NZW
         VJFcZEoJSNV6ZdWSUwYUzcFkpnxSXErrkeJ4MrcgPdQCB7B2wTUUSqOZjW758XNhpa
         y0Wt5OCVvyLyKI9jFz7VCvG/+PSwukfwelwk/45rz/lVDHeLaXtSgfrcMKKlW08t2y
         WJNXlDCVR9IXyXZpX9bQRsiC5fTEgajaxzPsVUIWp1ywNEoS8Wm9kZM3pur4XZMl/Q
         HJ3w1kXZGOXoA==
Message-ID: <780d70173beb315695cedac6c6eafceb.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230312161512.2715500-19-u.kleine-koenig@pengutronix.de>
References: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de> <20230312161512.2715500-19-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 18/30] clk: keystone: Convert to platform remove callback returning void
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Nishanth Menon <nm@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tero Kristo <kristo@kernel.org>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Tue, 28 Mar 2023 19:39:04 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2023-03-12 09:15:00)
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied to clk-next
