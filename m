Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE29BC432BE
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 19:52:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C424360F44
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 19:52:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233841AbhH2Txo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Aug 2021 15:53:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:34854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229451AbhH2Txo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 29 Aug 2021 15:53:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E53C60F3A;
        Sun, 29 Aug 2021 19:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630266771;
        bh=UnLXSThwzjAi/sNiLIlBNC/2EOmsUB6prFr+X6ZUqek=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=SBHeA8qIDZNjtr7pkuk5mSBO1Pu9nH9uJKTWMsrbvbkvEqN8/R85sKtQkmM2f8g7E
         gNkCD6LY7dpaX36eTie4TKyBRNVnO/480pLYPgVom20apPpr9QCh4SXM0om5TInJbG
         mseDzK7j4HV2vXc8fw25bZE8G7Oyrzb4C8FQWBEywueUSYiQPYm7nF/wTVXWKu702p
         UI8jHa8bFlz6PdeaAtxq9NHvxMOQEegdvkUEiWNAGbOonl43xygQkjuEfSWV7kkmXv
         x8fGIdhf2FUMdvW6YVzU1M9ZhylEHh/VkifPZY1PpJJWYiMGHkhbxP7I8GOjwJLj26
         Its7KRGV21wIA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210829193617.4105-2-konrad.dybcio@somainline.org>
References: <20210829193617.4105-1-konrad.dybcio@somainline.org> <20210829193617.4105-2-konrad.dybcio@somainline.org>
Subject: Re: [PATCH RESEND v2 2/9] clk: qcom: gcc-msm8994: Modernize the driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Sun, 29 Aug 2021 12:52:49 -0700
Message-ID: <163026676931.2676726.9571008952095354229@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Konrad Dybcio (2021-08-29 12:36:09)
> Switch to the newer-style parent_data and remove the hardcoded
> xo clock.

This is OK because nothing else is using the hardcoded name of "xo",
like another clk driver on this SoC?
