Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F896C433B4
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:16:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D0AA611EE
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:16:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhDHAQU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 20:16:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:42332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhDHAQT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Apr 2021 20:16:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50DF161178;
        Thu,  8 Apr 2021 00:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617840969;
        bh=WkWojShefQJsv3oaRMrNFc29H+bunI03F4WFzBAd0EI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=X+TtWiZpLctLweXBi/ikHwVQZrLPJQTfcAf+I3uqmhF5iOdhsoMKeyywjrpvqO1k5
         12TPyS1OQCHlZg7YaNiuJ0T5Ayc1AXFADdNAezKQMfGs9Pq6VYauaZJfeHlF2qTKJ2
         eH3pFespMb+CAqJA+EEg8MagmWxAXtbARN+ysiLn2v0uzi+ccv8CMsd0sEjjiKAQIt
         CBV/iMtf+4nAIso3WdV9D/TRm9wwP8y3O+T1Wl1WqOaB3wePbBv8+bH/ja7kVEMagE
         3U0PGKalShlQWOK8KrQLBq75k9c7JfjWol40SrFcjniNnOV0djFxC6vSXS+gRTaPkV
         m5AexkvXw/uQQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-16-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-16-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 15/33] clk: qcom: dispcc-sdm845: get rid of the test clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:16:08 -0700
Message-ID: <161784096813.3790633.9577234061449289054@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:25)
> The test clock isn't in the bindings and apparently it's not used by
> anyone upstream.  Remove it.
>=20
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
