Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E1EC433ED
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 02:03:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9E006101E
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 02:03:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232958AbhDACC1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 31 Mar 2021 22:02:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:52278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229515AbhDACCA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 31 Mar 2021 22:02:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7238D61006;
        Thu,  1 Apr 2021 02:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617242520;
        bh=SE8Ddw8xqYPwVsNYTMzPwtzB+KA37mc1aPP98HL5Gzo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=f1Y70QvhohW4SorCCt5Hg5LOcFRXwIZ976OLXPURvjpDgyrQeDnjAO26h3jTSXOw5
         5r4mUNiAStnt26yW1PC0fv3uk0u1A2AU3kLSe759A5iMhhPWguqF7AzytWHcnHRWh5
         x7Hs+k+Oubm6ur/6KZ6DthDKMrWZX4lrNOaUjbXRuESGEcenEo9nAmgYPgvBFWT7uN
         UIHAUCYZm2PcJIbsv1n/V1+bQ5EETW2OsbsRdyq8hLopePmqgn211Aka9wr488FxPU
         8y/jgPsLDWYZqlseRQXfAvwC3vUPxQg9k8wwiaTm3kQBr51HMjQj4/jmlsGiaWJNjQ
         h8uAVDJJFzOOQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210317122221.439105-1-dmitry.baryshkov@linaro.org>
References: <20210317122221.439105-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/8] clk: qcom: dispcc-sc7180: drop unused enum entries
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 31 Mar 2021 19:01:59 -0700
Message-ID: <161724251917.2260335.6088966808085767842@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2021-03-17 05:22:14)
> Drop unused enum entries from the list of parent enums.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/dispcc-sc7180.c | 2 --
>  1 file changed, 2 deletions(-)

I assume this series is superseded.
