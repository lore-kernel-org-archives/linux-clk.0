Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F927C76196
	for <linux-clk@archiver.kernel.org>; Wed, 29 Mar 2023 02:36:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjC2CgB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Mar 2023 22:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbjC2CgA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Mar 2023 22:36:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 580772D52;
        Tue, 28 Mar 2023 19:35:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E0F0661A3F;
        Wed, 29 Mar 2023 02:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C6EC433EF;
        Wed, 29 Mar 2023 02:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680057357;
        bh=dOPI+7kbiLv+6sjn3CpUFJC87YUYZUOBaNF55nQe+mw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Upj82R16KUjHvPso3W9AG10NnPbO+qslQ/Z0AIPouMCvQFc6JufjqS+rO2Iaxbv9+
         UlvNkvMBmqWTd46pIRr/EbQg+8uEOvJdsoAdFhy6bhUqomxT3y6Yv51vzqD8XirZZJ
         vCOkdBgvvLbo9iHby7s8Xazoj8bUUhJE0VgK3phVv15kABRfc2OEeIhAVErjHzso2s
         IHcnRxOjVg1gvORYeaMXzRKa+NwQVu3CxUFgYZwN4fY/+ocln5QyxfLLXcIEsYqQP/
         xZr4BEUPdBXEgKN6iu2GyXJ2VlOq/pmYbgEGmyPu6vaAzMFk1egHQbfLqo/E/rtI0+
         2eXGBR84p2hAQ==
Message-ID: <c1ac101deba42babb9b3ab9bce825b65.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230312161512.2715500-6-u.kleine-koenig@pengutronix.de>
References: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de> <20230312161512.2715500-6-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 05/30] clk: bcm: Convert to platform remove callback returning void
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Tue, 28 Mar 2023 19:35:55 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2023-03-12 09:14:47)
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
