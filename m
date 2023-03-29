Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB73C6FD18
	for <linux-clk@archiver.kernel.org>; Wed, 29 Mar 2023 02:39:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbjC2CjG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Mar 2023 22:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbjC2CjE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Mar 2023 22:39:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A15DB3AB3;
        Tue, 28 Mar 2023 19:38:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E6BAEB81EA9;
        Wed, 29 Mar 2023 02:38:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE14C433D2;
        Wed, 29 Mar 2023 02:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680057533;
        bh=Lwd2eI+IwG7D8Garptk/+K0bkfClzm1cokWixtQ60I4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=c/1V8dpudtc+Z+ZuIiXws+dt0gXUh/0jjKJljyzLeyK5y44P3dPe4qqxmSigjim9I
         ++vdb/PJziUK/8nJyksHpQ4tXk+4nXA1k+R03UyXyCr985Ma4GHpj1+drgqD8QKu15
         2/wxpHnaRdZDzwEdB4A9btUFI6FkZQAURjuANpkBLBiRoOWTD+PwJX95g/cOH5hewy
         eyvFZ6JRqIup9tq4Pa0KwtEUl8sYeK4i2DJUzyHQhdGWc92tb0DiLWGp/JA24drwyN
         2L9Hwhg9Cg+W2SH4B5RvRTm2SXAhN84dvzaSuwReYq801fMLTOzMqbccHxJO2+pCLs
         LUTaUyKcR2G1w==
Message-ID: <7aeb8c75ea87f23950d55e980d0ea339.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230312161512.2715500-18-u.kleine-koenig@pengutronix.de>
References: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de> <20230312161512.2715500-18-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 17/30] clk: hisilicon: Convert to platform remove callback returning void
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Tue, 28 Mar 2023 19:38:51 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2023-03-12 09:14:59)
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
