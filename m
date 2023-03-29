Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9437CC6FD18
	for <linux-clk@archiver.kernel.org>; Wed, 29 Mar 2023 02:36:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbjC2Cg0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Mar 2023 22:36:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbjC2CgX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Mar 2023 22:36:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E56E30E1;
        Tue, 28 Mar 2023 19:36:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2209661A3E;
        Wed, 29 Mar 2023 02:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD44C433EF;
        Wed, 29 Mar 2023 02:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680057380;
        bh=gHTsVj20rdPbufdgop3j7YGf1l5BekMM8HKpCwQIt5c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mChJ45T+M/gAOuo3FozWl1lj508yaSH93mXEKOD/RcEVHWkkMXZff9DPo8YGqMhs1
         SmB0AQacIofIYhmRt5mZxdVl4LZw/mO6ABHjjbrOLqFVqoptuhw9SlQIofH7oG7EwC
         K9PjUbEi4gU9WY1zBfvyYUP39FdT+bs9dwDljExSghgBkGdvepFG4LN1qjjWfziNiC
         LQ9eGogA23YOPk+MRSkXoqzEL9Gb+IIr1oc7Io6fmo/Jx9giYe+M2/7UHu4zsvgOdd
         eGPlBQ+Mrl+NWFLx5aqbOF7BeXZU6S+YWCAC6vLqm2xzV+x5J3/RHuUmG7zXQdIDxj
         XyRpswznIPtRQ==
Message-ID: <29796d215dca31e5757ec0fa19274c18.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230312161512.2715500-8-u.kleine-koenig@pengutronix.de>
References: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de> <20230312161512.2715500-8-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 07/30] clk: axm5516: Convert to platform remove callback returning void
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Tue, 28 Mar 2023 19:36:18 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2023-03-12 09:14:49)
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
