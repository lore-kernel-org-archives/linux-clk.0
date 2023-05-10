Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D069C77B7C
	for <linux-clk@archiver.kernel.org>; Wed, 10 May 2023 21:13:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237089AbjEJVND (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 May 2023 17:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237096AbjEJVNC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 May 2023 17:13:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A701FD9
        for <linux-clk@vger.kernel.org>; Wed, 10 May 2023 14:12:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4199E6358F
        for <linux-clk@vger.kernel.org>; Wed, 10 May 2023 21:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A3DC433D2;
        Wed, 10 May 2023 21:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683753176;
        bh=xzZ8anraspomAQ3Z3TNT/9LYwPg/pMkYSnpX/MrEHoo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=M4XipHTHSLERIWlDYWN+CZ4Xy583i+sIN0ZqPqHJ1YW9ARgmJ12dP/ebA4a9t922y
         lSx0bM+9oEEHeqwsMQ22Oi1To1S5tnzNpks3DkVohSoMR3FJYwE+o1DuMlvmPoxJkK
         6lsOxjTSUsPvn90RrQXMSR7YDPnnKgOnNxWg4W2fNKO2RT9IyCnXZ4UAPWK8h3Wgh2
         VtdU/Vqngf3KXGVQWDOXafr9fUPAimZHyElo539Pjsy9sQlUS/2VRsycrbFJiYz6eo
         CACczDMtcWdAwdjSk6MpaIJshzfEXe3cNKnIuHHzNOIURCdlGRxpFBGwLFtiEwJu7c
         nfLxFiknPAwlQ==
Message-ID: <4b244635959253ec964d5757b818c83a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230427125531.622202-1-u.kleine-koenig@pengutronix.de>
References: <20230427125531.622202-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] clk: Switch i2c drivers back to use .probe()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de
To:     Michael Turquette <mturquette@baylibre.com>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Wed, 10 May 2023 14:12:54 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2023-04-27 05:55:31)
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() from
> struct i2c_driver.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied to clk-next
