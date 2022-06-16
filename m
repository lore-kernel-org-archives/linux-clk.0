Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B69C43334
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jun 2022 02:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235991AbiFPChl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Jun 2022 22:37:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233633AbiFPChj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Jun 2022 22:37:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31DB51EEC4
        for <linux-clk@vger.kernel.org>; Wed, 15 Jun 2022 19:37:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D935BB82205
        for <linux-clk@vger.kernel.org>; Thu, 16 Jun 2022 02:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C70C3411A;
        Thu, 16 Jun 2022 02:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655347055;
        bh=b6VwYrlE26pTq/uMEnhRwrTEic+w/5rV5X/wUq+nDL4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kVOoPiMenETiJ1IiZYy1vFJCWz7mMlGeqzSv9nT88HT/32DylQlL0XYuRk1BAo/8E
         SCNnod5IxMwWswGl7kzwsE0l1uw004JRcBBjqgPyV4jf0hoQBjiUnMdXWjUpm4Y+NH
         1qZg48gzfowz+e0rjApC7vkAKbcgym2iqa7eS9B3t+FJfvsikHpo2V96ltP9VIfBfn
         vpaFPqZV/r/3A0Ia0LgA5xJ2QFxZyBS8mXSh2ll99AG2U9UjfCVMqchw5fCmwO5BQ1
         +1iefCZ+PtK4C2MQ/AA8Sc9ujOibxEwA74Nmjh0J2xKJNdqOrBdxFbjtgKqi/7+NDE
         k+xKr9CxDtkiQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220520075737.758761-4-u.kleine-koenig@pengutronix.de>
References: <20220520075737.758761-1-u.kleine-koenig@pengutronix.de> <20220520075737.758761-4-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v9 3/4] clk: Provide new devm_clk helpers for prepared and enabled clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de,
        Michael Turquette <mturquette@baylibre.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
To:     Russell King <linux@armlinux.org.uk>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Wed, 15 Jun 2022 19:37:33 -0700
User-Agent: alot/0.10
Message-Id: <20220616023735.61C70C3411A@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2022-05-20 00:57:36)
> When a driver keeps a clock prepared (or enabled) during the whole
> lifetime of the driver, these helpers allow to simplify the drivers.
>=20
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Alexandru Ardelean <aardelean@deviqon.com>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/clk/clk-devres.c |  27 ++++++++++
>  include/linux/clk.h      | 109 +++++++++++++++++++++++++++++++++++++++

I was looking for Russell's ack here so tentatively applied to clk-next.
