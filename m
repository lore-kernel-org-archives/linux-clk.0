Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BE0C18E72
	for <linux-clk@archiver.kernel.org>; Mon, 14 Aug 2023 03:25:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232798AbjHNDZX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 13 Aug 2023 23:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232749AbjHNDZG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 13 Aug 2023 23:25:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFF8A110;
        Sun, 13 Aug 2023 20:25:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7578F62832;
        Mon, 14 Aug 2023 03:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F30C433C7;
        Mon, 14 Aug 2023 03:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691983504;
        bh=gKHOZmylORMFLWYt4I2LvpB6ViwfXevxOYSIEZR4/WA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i63kTG+qO3OsiwYPq9nwNtaeyfB8jFIXUA9thlSON6IQWUFJgRQ437XCEAER/8in7
         Y1AA0Z1kl/gq252+y/Qn1drKl1n+8AfI95eqMJBcZ267yU4T33Ecys8z4z6p3fpKDi
         bVfaI+7DL7Aap+78gEiDdWp3Z2uYMPuQ63zOTzEZ4d3Yg3S3z3mY5IHa6PgMba5wdo
         /K/iTkBT2/RUGDFOmv2vVpf9VKSatqi10fW7xyd7MDDp8Bfv/0Wzj4P38upfn+SwT3
         YniG9EjF5WkGtoFAkXGisLPU9WmVWAn2Ze5GS8jWGsuJvSg3LnfT5bY0itRVrLvs8z
         DDsWwViAzh1Cg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs
Date:   Sun, 13 Aug 2023 20:27:35 -0700
Message-ID: <169198364306.2443702.7706860031769913417.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230811-topic-8450_clk-v1-1-88031478d548@linaro.org>
References: <20230811-topic-8450_clk-v1-1-88031478d548@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Fri, 11 Aug 2023 19:35:53 +0200, Konrad Dybcio wrote:
> Use the floor ops to prevent warnings like this at suspend exit and boot:
> 
> mmc0: Card appears overclocked; req 800000 Hz, actual 25000000 Hz
> 
> 

Applied, thanks!

[1/1] clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs
      commit: a27ac3806b0a0e6954fb5967223b8635242e5b8f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
