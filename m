Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E6CC433B4
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:18:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CCF8F61165
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:18:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbhDHASQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 20:18:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:43016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230099AbhDHASP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Apr 2021 20:18:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FCBA61132;
        Thu,  8 Apr 2021 00:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617841085;
        bh=tQti4UkuESVWxq/C0v0VoqX50hnSBD26tK6kOs6r6KU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qGQWsqxS6f+geDmahay6+Ozh6IrIBadOJOlq20jBlaxw8zF2rW1rx6fbb10+wBO+I
         SWbWi7bMY5ZpYNAhCi0PWaez2xg+VKniMnkxH5lkKwuJDfETEjwV2Fu7U2y5kszhCG
         JYU7OXOLu8iJVyojQGdL8+UajJtbKJ007nmlQneNDV9cEOL4YjdTe/RV1n+ZLTS/fJ
         gFWHObnKvK4aN9US+s5L6kUUyx2LT6rGFAKXJgwHMWniYDinLWmQzxGUzD9DBGBokd
         ETj+eaUx2ANXszIsy+s7bpnP62wNPhszHgbUshoZCwDl7dF5x4PhCmpRpcUPxyOmZR
         sg28LsXIvplkg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-33-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-33-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 32/33] clk: qcom: gcc-sm8250: use ARRAY_SIZE instead of specifying num_parents
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:18:04 -0700
Message-ID: <161784108450.3790633.2510785694434359453@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:42)
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data easy and errorproof.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
