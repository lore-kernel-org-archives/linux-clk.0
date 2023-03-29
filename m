Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55B1C6FD18
	for <linux-clk@archiver.kernel.org>; Wed, 29 Mar 2023 02:40:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbjC2Cka (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Mar 2023 22:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbjC2Ck0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Mar 2023 22:40:26 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D359330EA;
        Tue, 28 Mar 2023 19:40:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 65F94B81F90;
        Wed, 29 Mar 2023 02:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F5CDC433D2;
        Wed, 29 Mar 2023 02:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680057608;
        bh=PFuEwU6pEOeBb2Vmcxw+W09YQDloaKZhzbAOEcm33cM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=GydfQZYooLh35K89OuoXpR+sMten21glN8o5NsOpPNYURQg2NON0DY9iUnhmLT5C4
         9FytJdrGuKOlAfqGS3dmpg7+fd4qds0QyNbUeJrRB0kBQPHT9RfEAvjRG92K74zNbY
         iR0rbG0ZHm+Bc5LMLnA1PSXSdMXH/0v7mIkhc/6QhmG3TiVKJmc0azCicFnnYjArVu
         ycPT84Je7HD1XQJV6iAvros8bM/OmE1R4LS6Y7SNVHobWIHF/drbqQBZ9GA4/fvABz
         ZNjQavLrCeHbd7W/Hju28FeSg2jlzUeubsTeoI9ZIrL7i8Eaj9yuWMrtWcORyBTLe2
         2weUGSM5fHWzw==
Message-ID: <03b3693098b4efac3cb7070791528ff8.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230312161512.2715500-26-u.kleine-koenig@pengutronix.de>
References: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de> <20230312161512.2715500-26-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 25/30] clk: stm32: Convert to platform remove callback returning void
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Tue, 28 Mar 2023 19:40:06 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2023-03-12 09:15:07)
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
