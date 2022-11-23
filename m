Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EAE3C43219
	for <linux-clk@archiver.kernel.org>; Wed, 23 Nov 2022 02:22:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235468AbiKWCWj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Nov 2022 21:22:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235494AbiKWCWf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Nov 2022 21:22:35 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4B2511464;
        Tue, 22 Nov 2022 18:22:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6AFC7619F3;
        Wed, 23 Nov 2022 02:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0851C433C1;
        Wed, 23 Nov 2022 02:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669170153;
        bh=G8ldD5XLNgFkctdiUvzV7hGQ8thaimppY8W3c2//TmE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fmexUNdzDfqgfx1vJ/IpfDup6gOUkmLdk71MuJHe5DYvgy7GKcYVaD/fw97jVW52g
         OsARX/e2VtQTgajMIdM/bdmTp7MQLu5xJefBaQYvDAUJ82o8aSa0EujbCmZl2Bxz/x
         cn77XdlxDOB81rspvlNxMCRlkTRAKWSYMQUR9NUpPWHxq2EqjApuOVMYALIWEtYQ4i
         irm384WQ9VXT2Qrfo9hwAWZTiobn9xterynwA7RSc0qrtw0pVu/23mkwrfM8nb1x7Q
         dPc9TXXfKfgA7lnRPhYCLKH3cGTOXUHQ6+6mRKW9Py29p87riIkEgFnZHUC0tSCCCs
         PgJkLc18qVsNA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221122130732.48537-2-andriy.shevchenko@linux.intel.com>
References: <20221122130732.48537-1-andriy.shevchenko@linux.intel.com> <20221122130732.48537-2-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 2/3] clk: fractional-divider: Show numerator and denominator in debugfs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 22 Nov 2022 18:22:30 -0800
User-Agent: alot/0.10
Message-Id: <20221123022233.C0851C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Andy Shevchenko (2022-11-22 05:07:31)
> It's very useful to see what are the values of the fractional divider.
> For that, add respective debugfs files.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied to clk-next
