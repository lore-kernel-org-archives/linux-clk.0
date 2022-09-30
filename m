Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52DEC433FE
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 21:51:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232562AbiI3VvT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 17:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232532AbiI3VvN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 17:51:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 991311116FA;
        Fri, 30 Sep 2022 14:51:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0D6EEB82A43;
        Fri, 30 Sep 2022 21:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D389C43470;
        Fri, 30 Sep 2022 21:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664574668;
        bh=3tpoejLOIkWsztKs5fhhgkAnTRQrpJkyyxgs9Gx7Cr0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=EjSmOo71JwWk33A45mno0MCQXa7nuTkqJXuARosGrqS8RZhbiTFP9YynsIAU0D7p6
         OcJTbdfqo/Po1znXtMrUG4V0Uxn7rgh7Eke7OiYT9PdhPkwLaA3xYNdPaPixdK8CpO
         0Uxvnoh8251CfV+pLneBPpdgh3ZzWyR1rXNOeKjVZRUBpDqP4eB2B0odLqCImFQ54c
         jxIMhUfqglZ6OEjSCOxz3eYNLVs0wr8QFlJE+EUvWfsHJ7y8VdkviXP3GSHh5lDEea
         40UCyTytn8kX+95adlzYKFsV8HTnldozAv5dQLqR4XfL1kJFyFg5FE2ypnhg1o2MYX
         2iNzB/TIS98jQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220623115719.52683-2-andriy.shevchenko@linux.intel.com>
References: <20220623115719.52683-1-andriy.shevchenko@linux.intel.com> <20220623115719.52683-2-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 2/3] clkdev: Remove never used devm_clk_release_clkdev()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Fri, 30 Sep 2022 14:51:06 -0700
User-Agent: alot/0.10
Message-Id: <20220930215108.9D389C43470@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Andy Shevchenko (2022-06-23 04:57:18)
> For the entire history of the devm_clk_release_clkdev() existence
> (since 2018) it was never used. Remove it for good.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied to clk-next
