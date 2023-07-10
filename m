Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04405C001B0
	for <linux-clk@archiver.kernel.org>; Mon, 10 Jul 2023 05:05:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbjGJFF4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Jul 2023 01:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbjGJFFY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Jul 2023 01:05:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 231D710EB;
        Sun,  9 Jul 2023 22:04:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9FE0E60E26;
        Mon, 10 Jul 2023 05:04:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE82C433CA;
        Mon, 10 Jul 2023 05:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688965483;
        bh=sokvzETFKZC41G3wVx4ImZdZy5HEdd2PWZtA9rXFHrI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lh9aJynOtSUeK1d7Ukri4iaHcseh6EzHo63eoS+z4FgnL4whjuiQg39RbjgNXagIr
         mrXa5WuFEb2fy3gLURIPQ9bBA+OiVhuoMIbsJKGWN/YIGQIFjXu6gBAaHLgggKHWeT
         XWtEVo+Fn3HsbtQAwG+Y6ElbSJ6tA9WwTMVMwDORKTOyGxEiGO/2exCl75ZgQN9+QP
         pH5KKUnr0Y1c2rDR0CDqX7Hlb72C1anw6c5uun2w1QcJ/h2Hi4gskxtE+WBig/mSYD
         HnSl9wTnTSs5WoqxmaXfXMmLiFDyiXg8KfMP7c2g22VBpONcIAD/cHMhmWOXM8P+u1
         k6UaDOLxXztCw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v2 0/3] Fix up 8280 GCC GDSCs
Date:   Sun,  9 Jul 2023 22:07:23 -0700
Message-ID: <168896565971.1376307.5044970624310354958.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230620-topic-sc8280_gccgdsc-v2-0-562c1428c10d@linaro.org>
References: <20230620-topic-sc8280_gccgdsc-v2-0-562c1428c10d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon, 26 Jun 2023 19:48:05 +0200, Konrad Dybcio wrote:
> Part of the SC8280XP GDSCs were not fully described and others were
> missing. This series attempts to fix that.
> 
> As usual with the laptop stuff, please test it on your setup to make sure
> everybody's still happy.
> 
> 
> [...]

Applied, thanks!

[1/3] clk: qcom: gcc-sc8280xp: Add missing GDSC flags
      commit: 2fd02de27054576a4a8c89302e2f77122c55e957
[3/3] clk: qcom: gcc-sc8280xp: Add missing GDSCs
      commit: 4712eb7ff85bd3dd09c6668b8de4080e02b3eea9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
