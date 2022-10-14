Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF266C4332F
	for <linux-clk@archiver.kernel.org>; Fri, 14 Oct 2022 20:40:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbiJNUkJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Oct 2022 16:40:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231633AbiJNUjq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Oct 2022 16:39:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA53292CCD
        for <linux-clk@vger.kernel.org>; Fri, 14 Oct 2022 13:39:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F3556B82343
        for <linux-clk@vger.kernel.org>; Fri, 14 Oct 2022 20:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C631C433C1;
        Fri, 14 Oct 2022 20:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665779954;
        bh=8aCICQ4L1IFyUTFpzBn+8hYsEqLqLhnsdZBEARyJYik=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oqaZBvqGur/+kdHldGdYhPevYupOPRtTIlnAhYwSHgiG5dsyeL7q2n0FCij9nwqFH
         3OgTeOjkBFrHdduDTg7rWt+gnDxdJv2XbrnIUq/8Ft0gFxwoVtAuOuS3yjCwF0xF3B
         wvLMEscTd8/qMuleXEoqGtqqIOZ9P+ohLZ0a6mdYsOe62igaHVdKFEHj+Sq3FmcZNt
         P5QIF+/P3UhBh5tmOkuAy54xz3i+8PeWazqeL+I6s5BuTFpq+LvgP1uu5IL3FypDl8
         Y6TWojQ+4yd1e/UaZ1xN0YdR9bwnfKpLNNCoCTi0U4HwxdeSMMMY5YZZFN0cAvVX71
         Hiv1HRICOktGQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221013140745.7801-1-linus.walleij@linaro.org>
References: <20221013140745.7801-1-linus.walleij@linaro.org>
Subject: Re: [PATCH] clk: qcom: gcc-msm8660: Drop hardcoded fixed board clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 14 Oct 2022 13:39:12 -0700
User-Agent: alot/0.10
Message-Id: <20221014203914.9C631C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Linus Walleij (2022-10-13 07:07:45)
> These two clocks are now registered in the device tree as fixed clocks,
> causing a regression in the driver as the clock already exists with
> e.g. the name "pxo_board" as the MSM8660 GCC driver probes.
>=20
> Fix this by just not hard-coding this anymore and everything works
> like a charm.
>=20
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: baecbda52933 ("ARM: dts: qcom: msm8660: fix node names for fixed c=
locks")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to clk-next
