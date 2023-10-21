Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99ACDC25B48
	for <linux-clk@archiver.kernel.org>; Sat, 21 Oct 2023 15:55:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbjJUPzD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 21 Oct 2023 11:55:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbjJUPzC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 Oct 2023 11:55:02 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F8CB197;
        Sat, 21 Oct 2023 08:55:00 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F85C433CB;
        Sat, 21 Oct 2023 15:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697903700;
        bh=rADjEC3+J56oQ24XMQsTgK76ldNR17htP9+GmNLvZY8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ko2w6dkscB1fGgRvomBzvk/oWxlAu+0gzt3Oyt23oTTf+lDp0eJMnI0/zSKdo/YCS
         R5Hb/6yM2mezlNACoasYC/Z8tHqbo42qxqU60VXyntO1JcJbjpyehSt9ygpAgSue/q
         2jLXbMP/jMvdb39qWYEBeJ+35ObaxEdx39sbbgVl8HmAu4yNL1eI3+X8wBE5PYEUFU
         hmzkpsg0RexTPIuSfeg1ARDwU9afMp2td8Slv0632+nHCDMPwqCk/X8+bUdFBXK2sC
         GlsX7Cdusb0IdhdJNZYhj6esSnvEEejdQLgP3JGrR/x8ZTzC0kZHAd213znE/UJaNQ
         vQHZRVaRdDrZA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] clk: qcom: cbf-msm8996: Convert to platform remove callback returning void
Date:   Sat, 21 Oct 2023 08:58:35 -0700
Message-ID: <169790390705.1690547.7623433071492517440.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230911151548.672485-1-u.kleine-koenig@pengutronix.de>
References: <20230911151548.672485-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon, 11 Sep 2023 17:15:48 +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: cbf-msm8996: Convert to platform remove callback returning void
      commit: abaf59c470a7c9c59bda8da3517ec2ff0513f5a6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
