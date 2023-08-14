Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC04C04E69
	for <linux-clk@archiver.kernel.org>; Mon, 14 Aug 2023 03:25:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232734AbjHNDZT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 13 Aug 2023 23:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232769AbjHNDZM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 13 Aug 2023 23:25:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17705110;
        Sun, 13 Aug 2023 20:25:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A2DF762832;
        Mon, 14 Aug 2023 03:25:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44443C433C8;
        Mon, 14 Aug 2023 03:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691983511;
        bh=3oCwMbbgxoWd4bFDAMFrjO2Kylm6RSlN4XoiFhvla00=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u9rVwxoazJKH9w+C2K1Qq9ZvsyiWwSeYwVA2/yzVS+Ju49NlEg8KxMso1uFOUtll4
         g2KXLA0yucav8ef0ApD6GKCSLjdl5N/cnpT2gxjZLxGDn/aL9QQsBFEYuncQ1BCOvi
         0kwj3/n/NxP9OmLTYDz8CzBtmBq1OXTGpkvj6L29cL3i/9krawRVK1EfCZril97hrp
         2kOh6UvctoKMPNMdKAcvF59oe/jh9flHXKdexBFvnETd5LS/jyDjEZTjQ9ERQkTwV/
         cEaXYsnqshJmDeGW8jdwPhRMxKKrRNmKJyr369DKRnlW7UNhRvflFoLjV4QwWeFJdb
         qcW6mjMMlwRFw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     linux-clk@vger.kernel.org,
        =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: qcom: gcc-msm8917: Enable GPLL0_SLEEP_CLK_SRC
Date:   Sun, 13 Aug 2023 20:27:40 -0700
Message-ID: <169198364319.2443702.10110671002846666656.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802170317.205112-1-otto.pflueger@abscue.de>
References: <20230802170317.205112-1-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Wed, 02 Aug 2023 19:03:15 +0200, Otto Pflüger wrote:
> I left this clock disabled for some reason and this made GPLL0_EARLY
> report a zero rate because it has this clock set as the parent clock.
> 
> This is fixed in this series by adding the clock to qcom,gcc-msm8917.h
> and the clock list. The clock definition is also changed to use the
> correct enable/disable operations for this type of clock.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: gcc-msm8917: Add definition for GPLL0_SLEEP_CLK_SRC
      commit: 593576a369ec885275a1a368a6838844b78b4f35
[2/2] clk: qcom: gcc-msm8917: Enable GPLL0_SLEEP_CLK_SRC
      commit: d863492886930a1a6f7c0d9dda8f728077b540f0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
