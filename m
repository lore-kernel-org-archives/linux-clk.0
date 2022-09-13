Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD66C54EE9
	for <linux-clk@archiver.kernel.org>; Tue, 13 Sep 2022 22:48:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiIMWsR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Sep 2022 18:48:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbiIMWsO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Sep 2022 18:48:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2FBD5727C;
        Tue, 13 Sep 2022 15:48:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7970061646;
        Tue, 13 Sep 2022 22:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43AEAC433D6;
        Tue, 13 Sep 2022 22:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663109292;
        bh=aSUSXcMioo1pZh/bM04Pk9fNxmVSQpzfJjwl0A/9uow=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cENF34gNjcrnsx5pG2sW3jr2A8n+aR4yGV8DLsEiLXmYA2OnxGwnEVYQoZ5SAUiql
         qy/YahnYEkEvZij5Dw+XeORBkLWfdkOx7jbJ8NuEoC+3u7koxMxKXW1KeoHax2hJfR
         o4x5rf186Eo6i0a92gCo0v7ll56slaP1GV8/Zhlv2znnR1SMfkSapYxu7zt5OOX47m
         HYmH++EpliAJFu91ejmr1apbRfXBzW9CAWTdUR6dQnvR/LU5A/v9X+ct3C5468GqJU
         zgVaCNL5OWRCTAxh45mLf2jdEYvoiEI/uGgAlSCXxefcHwcud9vJX1kmQLWPFdr8P6
         cwk1gtKxSTlDA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org, mturquette@baylibre.com,
        agross@kernel.org, sboyd@kernel.org, konrad.dybcio@somainline.org,
        quic_tdas@quicinc.com
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: a53-pll: convert to use parent_data rather than parent_names
Date:   Tue, 13 Sep 2022 17:48:05 -0500
Message-Id: <166310928497.670084.9186085375739597489.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220909103137.3727830-1-dmitry.baryshkov@linaro.org>
References: <20220909103137.3727830-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 9 Sep 2022 13:31:37 +0300, Dmitry Baryshkov wrote:
> Change a53-pll driver to use clk_parent_data rather than always looking
> up the xo clock in the system clock list.
> 
> Note, this change also switches the a53-pll from the global `xo' clock
> to the `xo_board', the clock that is specified as the `xo' clock in the
> DT file.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: a53-pll: convert to use parent_data rather than parent_names
      commit: 867bc3269ee430f5c822967e7b5a37a0ca959443

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
