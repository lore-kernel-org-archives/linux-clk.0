Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2518C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jun 2022 23:11:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234198AbiFVXLh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Jun 2022 19:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234110AbiFVXLg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Jun 2022 19:11:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DB3841982
        for <linux-clk@vger.kernel.org>; Wed, 22 Jun 2022 16:11:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D5A0161B40
        for <linux-clk@vger.kernel.org>; Wed, 22 Jun 2022 23:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1450AC34114;
        Wed, 22 Jun 2022 23:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655939495;
        bh=TO+wwnyZW27AlyWOTK/R3nkk0hFniED2sYdbwRXLyz8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=UpGAdt+cqoCIfJjKU4NQfj14pM4b6tu7yIIFvTUYBJ8D6HrRzPwPhaUcF9XjVCp0a
         RDSJ5o5+3GHIG/TNGemWYduikj2KmCsod4uglmap8YOBmX5nThSbnBayQQkMwjcJBw
         udZasHdo3clnf7LDiL2pjBA1DIRQvdhbcpdhUeXq8kXDMz1NILwl6OtZxKXf/qHnYu
         8f9scgtVAwKSsWoKY9jVh5RWooYwZPy4aA6KL9RQLJoIP7Hvcvkv0qoQ396ml99ldL
         LkqDjKUjv1Hh7S1OKLRfoEEgzmJa1OEDBwYLoQEPXY2MCzwK/XvAPdznQDzmsKk2aI
         9D2W58UYcRM6A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220620171815.114212-1-u.kleine-koenig@pengutronix.de>
References: <0cdc7588-4dc3-266f-aa37-86bf5996497f@samsung.com> <20220620171815.114212-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] clk: Fix pointer casting to prevent oops in devm_clk_release()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        kernel@pengutronix.de,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-clk@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
To:     Russell King <linux@armlinux.org.uk>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Wed, 22 Jun 2022 16:11:31 -0700
User-Agent: alot/0.10
Message-Id: <20220622231135.1450AC34114@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2022-06-20 10:18:15)
> The release function is called with a pointer to the memory returned by
> devres_alloc(). I was confused about that by the code before the
> generalization that used a struct clk **ptr.
>=20
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Fixes: abae8e57e49a ("clk: generalize devm_clk_get() a bit")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied to clk-next
