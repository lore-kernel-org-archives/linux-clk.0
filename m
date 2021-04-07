Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A1D2C433ED
	for <linux-clk@archiver.kernel.org>; Wed,  7 Apr 2021 22:41:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65A0861177
	for <linux-clk@archiver.kernel.org>; Wed,  7 Apr 2021 22:41:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbhDGWmB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 18:42:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:56330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229449AbhDGWmB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Apr 2021 18:42:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C85161057;
        Wed,  7 Apr 2021 22:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617835311;
        bh=5lZb+aAr8K92mCDz3Mco+1StlTnl7CvhSeYNRB7lNMs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qZRjQYeFkeG8p1L76Bglc3C5myAukg63MKI16XUnquzVpmkj2V0RL5/B5quyl3HoK
         9Ov9m6Cr9csPp3gPPK5b4dOptydF0RdbRa3bKcOp2XuhptubeVB/8k+eYhobuh++z8
         pUxcN90CuvN7NYYLIvNBNcsNHD6LFjCXttZjHQHHrUpyX33ncY8YfAqIld2UXmnIaR
         bOJICEvUNvxZNNW2W9pvrbmYB1S4zUQ2T/Wrf6lO3OeL8QsOauR7mkkFtum6aBZacP
         QADhHnj8AAaTTNlrIhlM6FLXd8BJHqrHtOHJU6GgRJDFH6JbfcyEVwHR8kUr3d4llA
         q9yEuCx0P9C6g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
References: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] clk: fixed: fix double free in resource managed fixed-factor clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Daniel Palmer <daniel@0x0f.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 15:41:49 -0700
Message-ID: <161783530964.3790633.16412468884239960912@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-06 16:06:06)
> devm_clk_hw_register_fixed_factor_release(), the release function for
> the devm_clk_hw_register_fixed_factor(), calls
> clk_hw_unregister_fixed_factor(), which will kfree() the clock. However
> after that the devres functions will also kfree the allocated data,
> resulting in double free/memory corruption. Just call
> clk_hw_unregister() instead, leaving kfree() to devres code.
>=20
> Reported-by: Rob Clark <robdclark@chromium.org>
> Cc: Daniel Palmer <daniel@0x0f.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>=20
> Stephen, this fix affects the DSI PHY rework. Do we have a chance of
> getting it into 5.12, otherwise there will be a cross-dependency between
> msm-next and clk-next.

Think I can get this into the last fixes PR. One question though, I
think this follows the pattern that things like clk-divider.c use for
devm. Are those also broken?
