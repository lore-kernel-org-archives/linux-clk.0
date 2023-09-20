Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E3CC04FCD
	for <linux-clk@archiver.kernel.org>; Wed, 20 Sep 2023 18:11:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjITSLc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Sep 2023 14:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjITSLc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Sep 2023 14:11:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D8B6D7;
        Wed, 20 Sep 2023 11:11:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC852C433C8;
        Wed, 20 Sep 2023 18:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695233484;
        bh=eBhQGHLnDBA306YDLUtLnfWfnfa686CaUaNAJLwdKnQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cjBssFR+sHxsHVeFelfJ9QS31m7R5ZqOWqbelESqVVyC3astpMIcQirTaHiXeJzhZ
         Yk30FBs7I8xcxYFDp6UipAdYgVj7y7UW2l1BRaeQx9iNz3BMaH4iF2qhELX8T+6EPj
         Dwd07GRZgBD32pU+uuDT5oL1UdF0U0a8KCsBOTiGYhpnwTM9PjkfhydyqTIPIxITF+
         fYKR6LYuAgdzjBIXd0Yb7Kb721q2+KB9jZmRwKdZrKb33kOy2Xd0THmXmlKdhTulgr
         g0uciVYwXr7u52Flbv69ue49A7Vzfu117RGSM2N/YJbSEkWqcHanSqLC7F/sEU0yoZ
         NdDz1UVfqR54A==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/7] MSM8976 PLL,RPMPD and DTS changes
Date:   Wed, 20 Sep 2023 11:15:30 -0700
Message-ID: <169523372598.2994310.11789786910326394347.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230812112534.8610-1-a39.skl@gmail.com>
References: <20230812112534.8610-1-a39.skl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Sat, 12 Aug 2023 13:24:43 +0200, Adam Skladowski wrote:
> This patch series fixes introduce support for msm8976 pll,
> also brings some adjustments and fixes domains setup and few dts nitpicks.
> 
> Changes since v1
> ================
> 1. Fixed few styling issues
> 2. Changed compatibles for plls
> 3. Added fixes: tag to first patch
> 
> [...]

Applied, thanks!

[6/7] arm64: dts: qcom: msm8976: Split lpass region
      commit: 31c133b4a07e3db456a7e661c96653cd65a25bc6
[7/7] arm64: dts: qcom: msm8976: Fix ipc bit shifts
      commit: 684277525c70f329300cc687e27248e405a4ff9e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
