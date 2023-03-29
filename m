Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E4EC76196
	for <linux-clk@archiver.kernel.org>; Wed, 29 Mar 2023 02:36:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbjC2CgP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Mar 2023 22:36:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbjC2CgO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Mar 2023 22:36:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9212530F2;
        Tue, 28 Mar 2023 19:36:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 01D9161A34;
        Wed, 29 Mar 2023 02:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58FFAC433D2;
        Wed, 29 Mar 2023 02:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680057370;
        bh=WmJmMI95xFPjcXFei5n9hmtwuoAolY2//4hi8k3DaZE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ESMOgiAlEsPBL6K9EnK9Jk2VpCe7BgWdi0AHzOo9QbvZamAEks644Sbk1kNy6Y3WP
         YrRRihZS8mtE1U8zVoazSGbyhGQW0CoOslZgx8PgDtDWOx94TDM47iaIU9Pr8z1Muz
         rxhrJ2/8PDXR72KrNTZevUuuk6Lv7gc87KlLe0M3w78jYbLF3ORfSjcEvarcVFzS1Q
         sSH3hMS2vWrgFjJ22tzqXYI4JOQXdLnwmhu4Yky4E1EXwKbgn5+zw3FN6um91VzdgN
         rxpJz5TLYQIdAt+BcW7Avhk+GqC/UsFbi9fam92BdwEOCNJGqQ3IouEQ9N44bm5vew
         iFTqSCsQrY/ag==
Message-ID: <b984da5ffb17aaf119b424e65632b815.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230312161512.2715500-7-u.kleine-koenig@pengutronix.de>
References: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de> <20230312161512.2715500-7-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 06/30] clk: axi-clkgen: Convert to platform remove callback returning void
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Tue, 28 Mar 2023 19:36:08 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2023-03-12 09:14:48)
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
