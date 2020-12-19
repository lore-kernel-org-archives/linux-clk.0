Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030F4C4361B
	for <linux-clk@archiver.kernel.org>; Sat, 19 Dec 2020 19:49:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF25B22D01
	for <linux-clk@archiver.kernel.org>; Sat, 19 Dec 2020 19:49:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727428AbgLSTsw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 19 Dec 2020 14:48:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:41610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727426AbgLSTsw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 19 Dec 2020 14:48:52 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608407291;
        bh=Ce/j7CtvzRjMiuC5BCHUDSl68o/51FSMSTpKjkvoH6s=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tsmhVeQsug4YoCNVp9wm9XBXvPNc1c0iBYdBWd5+43dlzJTDNRTPsMp+n50OzekQk
         x6KOcyCnr6fW0RjIUVWG2PhwKrzWdCgocYKzHNz7O+mv4AVdE+KUs4dNW5mX7j1qJ5
         iXdBun/IVuWTx05ZTPG4akm3oZMYHAaq+jzFQWp4bVzYFGPzb6V6I81s3IJ30tR2VY
         fjH+aJRZTUG0dXNhwG61cJ+wgWDBSfPNSQzeQiouQb24VC+64+m0OM+gN619Ta/2SD
         Wv2whm7whu/sTA+yuk1rgZpCkGJa4vwTg96cPOl3jlDeR+151VzxEJd0KXitsZEpns
         rhMY6M4Z1YBlQ==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201120132121.2678997-1-u.kleine-koenig@pengutronix.de>
References: <20201120132121.2678997-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] clk: bcm: dvp: drop a variable that is assigned to only
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org, kernel@pengutronix.de
To:     Michael Turquette <mturquette@baylibre.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Sat, 19 Dec 2020 11:48:10 -0800
Message-ID: <160840729019.1580929.4906376639324547272@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2020-11-20 05:21:21)
> The third parameter to devm_platform_get_and_ioremap_resource() is used
> only to provide the used resource. As this variable isn't used
> afterwards, switch to the function devm_platform_ioremap_resource()
> which doesn't provide this output parameter.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied to clk-next
