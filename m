Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2EC1C76196
	for <linux-clk@archiver.kernel.org>; Wed, 29 Mar 2023 02:41:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbjC2ClY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Mar 2023 22:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjC2ClW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Mar 2023 22:41:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6F163590;
        Tue, 28 Mar 2023 19:41:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 546B461A36;
        Wed, 29 Mar 2023 02:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB03FC433D2;
        Wed, 29 Mar 2023 02:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680057659;
        bh=zuozHBuWCDYNtslDn9v8L/ENdxX4HSBRrx3nqpC+TLI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sURFnNKD06ID3SkW0vhmt03yUajB2M5a4xZWtOHahFa+drcharpla0GvMmjwyZQBD
         aOZpEQzJIun90MTNTwQOH2+t5PJkiRfluLocpet74Oi99eGEX1lidpNQEhoowskXcT
         ctbu6H7zudBq3lWhd4KWvUkLeEpRyvj4g91kRsDqOFQiSbwfBjOQesWF7pkHiX+nAj
         IjoG7DfGgRyYPRoUKlwllXkCxHir4SaflL/6lyaOQBGtzf1TJwJLiJXbIVwO/3+dWt
         XIISViroTpgAVFQDph9y3pJJK6gTMFJU1iF7WA8mgsjEk1tR5tmgLlsG3NN1YEH99T
         r13p4js5Pu8OA==
Message-ID: <3e31adce4f70aa6a9fbe913b1bcc2b9c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230312161512.2715500-30-u.kleine-koenig@pengutronix.de>
References: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de> <20230312161512.2715500-30-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 29/30] clk: x86: Convert to platform remove callback returning void
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Tue, 28 Mar 2023 19:40:57 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2023-03-12 09:15:11)
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
