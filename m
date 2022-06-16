Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD42C43334
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jun 2022 02:35:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbiFPCfh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Jun 2022 22:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347736AbiFPCfh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Jun 2022 22:35:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CC5033A10
        for <linux-clk@vger.kernel.org>; Wed, 15 Jun 2022 19:35:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3C6CAB82205
        for <linux-clk@vger.kernel.org>; Thu, 16 Jun 2022 02:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09D4C3411A;
        Thu, 16 Jun 2022 02:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655346933;
        bh=TuS0MZEPJI89zvJLKPo+aQCDqChW5p6zNknVvVOlCrw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=aXhI0r+9ntU9u2bCJZftf7HzrRc8m1Ia7r3M9MvtDM+bTg0200yECJovmgWosxj3W
         H6OubxgQKb3uLT+Khqpw5J3KyuqagMhc/0/WpPEmgD80vAcSYVcj5/GNTwGg+EmFnU
         hrTnVrf6HyIMX7ShfjL8nPcCThwqMASV00RUt731ZWHPY1+Nr4tTt5vIQdGyxo6kK4
         ku4B9P3d/rPQMVBXAOFrbn14uNmgP2fFlpMYnb8NpjSIWP4/mXEwEy7nKozDofndAP
         7smCINbRjWagEQEXB/p0X6obpi7IZIHC95PfoVjZ9WVsifU4mhYTEfVwu3z7Q7j5dx
         E4B43dR7QiKMA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220520075737.758761-3-u.kleine-koenig@pengutronix.de>
References: <20220520075737.758761-1-u.kleine-koenig@pengutronix.de> <20220520075737.758761-3-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v9 2/4] clk: generalize devm_clk_get() a bit
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de,
        Michael Turquette <mturquette@baylibre.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
To:     Russell King <linux@armlinux.org.uk>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Wed, 15 Jun 2022 19:35:30 -0700
User-Agent: alot/0.10
Message-Id: <20220616023533.C09D4C3411A@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2022-05-20 00:57:35)
> Allow to add an exit hook to devm managed clocks. Also use
> clk_get_optional() in devm_clk_get_optional instead of open coding it.
> The generalisation will be used in the next commit to add some more
> devm_clk helpers.
>=20
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Alexandru Ardelean <aardelean@deviqon.com>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied to clk-next
