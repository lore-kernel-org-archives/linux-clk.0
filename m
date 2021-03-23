Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B22C433DB
	for <linux-clk@archiver.kernel.org>; Tue, 23 Mar 2021 07:30:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5932619BC
	for <linux-clk@archiver.kernel.org>; Tue, 23 Mar 2021 07:30:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbhCWHaI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Mar 2021 03:30:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:44224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229622AbhCWH3l (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 23 Mar 2021 03:29:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96357619AB;
        Tue, 23 Mar 2021 07:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616484580;
        bh=Aj5SamPuQDIK94vu6wAnw3TzJIL9R+1C87wF3TyVc1w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=EzlGxsxTsHITh7w8RrzfAKsKGjEMXv8PFuX5FcfTMhgJ2IR0rdqHjAFMTri1aPYs5
         hHrG19NbREgNZVZ8btyJBWh50RZ41FPgTES1TbwqEb3Pdlnmics6N+ZBzslyooOPN6
         0ig5K3qyypY0KXarnustNWGKw56sEZHtVjdsqSy2nM1SU1M0H4YFngswO7NsMW45JN
         btodP6kxbPM1zYWhyhCQsgs7t89W6MKfVoY4sWv9MkZPVv1R5kDPdpjND77Nr5iTIz
         xFNTsc6FVlZHIrKYqOU9hg4umMRmd/Lt+SWBMfACuuuT0Qi9n/dIaKX0qiEuxm8+5V
         EEg4bhmzW1Etw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1616140054-5141-1-git-send-email-tdas@codeaurora.org>
References: <1616140054-5141-1-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH] clk: qcom: camcc: Update the clock ops for the SC7180
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 23 Mar 2021 00:29:39 -0700
Message-ID: <161648457933.3012082.10324281519544090271@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Taniya Das (2021-03-19 00:47:34)
> Update the RCGs to use shared ops to park the RCGs at XO.

s/Update/fix/?

Can you also elaborate more on why we need to park the RCGs here for all
these different clks? Is the camera driver supposed to not touch these
and let the firmware take over? Is there zero coordination between the
kernel and the firmware?

>=20
> Fixes: 15d09e830bbc ("clk: qcom: camcc: Add camera clock controller drive=
r for SC7180")
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
