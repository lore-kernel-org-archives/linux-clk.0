Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DBDCC77B7A
	for <linux-clk@archiver.kernel.org>; Thu, 25 May 2023 04:57:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240182AbjEYE53 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 May 2023 00:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238936AbjEYEzl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 May 2023 00:55:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECB2D19B9;
        Wed, 24 May 2023 21:52:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1973364280;
        Thu, 25 May 2023 04:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62630C4339E;
        Thu, 25 May 2023 04:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684990324;
        bh=QSTqQDi3gNwrr8nuCQMTI4xkv5wsbB9SRaT44L6fSfA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OihU4uMEDjD5Az6i/xPwxttMCYuWcowHsyoWuoHQrR+6KPjPgrMg583bJmyRCN3T0
         hdjlUe3KjAKo13twV3f2fNWbw+YgFrfuBr/WHH3IwiiQK+03raeHBv2dB4y0Fa8Tm/
         2XEfUmLeYbae6RrvaGMKQwI7OLBLBD/YLT9hmwGKLSq7blq2+KtE6UuGX1b6+9cSk5
         idy/m8eDaRIt6Osi21St1JdrrIyFUzfhAb5iTVUr4/TyDkecHWSEWsOAlpnPHtbHXE
         rpieOStmg3q9qOhDybsiWFMHaTxaTRv7KVVgeDXOIF25ssFI/JoGfRTdowNdnPJdEF
         RwyW1pITK5KQQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        quic_ajipan@quicinc.com, quic_jkona@quicinc.com,
        quic_imrashai@quicinc.com
Subject: Re: (subset) [PATCH V5 0/3] Add video clock controller driver for SM8450
Date:   Wed, 24 May 2023 21:54:41 -0700
Message-Id: <168499048180.3998961.7675678602120735175.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230524140656.7076-1-quic_tdas@quicinc.com>
References: <20230524140656.7076-1-quic_tdas@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 24 May 2023 19:36:53 +0530, Taniya Das wrote:
> Add bindings, driver and DT node for video clock controller on SM8450.
> 
> Taniya Das (3):
>   dt-bindings: clock: qcom: Add SM8450 video clock controller
>   clk: qcom: videocc-sm8450: Add video clock controller driver for
>     SM8450
>   arm64: dts: qcom: sm8450: Add video clock controller
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: sm8450: Add video clock controller
      commit: 3c678552b00f90387de14ae965ab6c0bafe8ea12

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
