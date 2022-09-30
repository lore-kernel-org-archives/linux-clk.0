Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BADC433FE
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 21:51:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbiI3Vvd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 17:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbiI3VvV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 17:51:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A4210E5F8;
        Fri, 30 Sep 2022 14:51:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CA40562523;
        Fri, 30 Sep 2022 21:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EFEAC433D7;
        Fri, 30 Sep 2022 21:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664574677;
        bh=nr1/vfx1Es+ThZi0qWA/X/E2uhESa3S4OB1x0/rCIoE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uKzuNQC69cSDoupGwG9flV3Wy6LYtSjt4t4JFWpvDb6qsoehkvfhx8YzYDrYbCngx
         Q9KmO+iQNnwyt3IcOA64ZdbbxFWach86wYw5CumChKSYCCATHQEOcvRQA7ObIGXuka
         03l2LoRcX2XCIoZDzYRJYE9eATIhD98sTNAgpPFfAex7ypuvozUhP1sKe3Lk02a0Bq
         US+Yden3zmnoaoiH+8TrBCcJDsvVWbqTR33PDj325W9PbDtKNpvbF8yZ9pBhg1u4rg
         FpBPylKoQhuRsjnT+rjLtjwkFGjcWjLvzgdT6fbBouvHoz0V4mJC//ieCcyR3fIznj
         cJ4mdJ2jvFQEQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220623115719.52683-3-andriy.shevchenko@linux.intel.com>
References: <20220623115719.52683-1-andriy.shevchenko@linux.intel.com> <20220623115719.52683-3-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 3/3] clkdev: Simplify devm_clk_hw_register_clkdev() function
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Fri, 30 Sep 2022 14:51:15 -0700
User-Agent: alot/0.10
Message-Id: <20220930215117.2EFEAC433D7@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Andy Shevchenko (2022-06-23 04:57:19)
> Use devm_add_action_or_reset() instead of devres_alloc() and
> devres_add(), which works the same. This will simplify the
> code. There is no functional changes.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied to clk-next
