Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D508C77B7C
	for <linux-clk@archiver.kernel.org>; Fri, 26 May 2023 19:34:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243902AbjEZTe5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 May 2023 15:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244077AbjEZTez (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 May 2023 15:34:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1275ED9;
        Fri, 26 May 2023 12:34:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A0023652F5;
        Fri, 26 May 2023 19:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F963C433EF;
        Fri, 26 May 2023 19:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685129694;
        bh=HJf3MMP08NqgExlW0By+7QlG+fLNCiD32Vvjeap/5uo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Kv6HXst9y7dwk7jK8PjbITJEVD8AJznzWCDN2I7axb2d+uQGDCEPWKDDTfuxemIxY
         /gqeUwKjoEVR9ACopOp3xL2NwxexUWPPfIS5Zpd093owGFLSOLl0slL4F6fZvgBs8z
         6e5SylZ5CQ8mSgVcPsYbvqDNZx+8Qg7DkW35DAUaa2JN+7Ug/caf+Evgftnk5WiioU
         S/N6c6ZBba4wphAwk7NcHqCUDVJnYPoH0OXj9oURnkczvQ5oMbhlVLtUaUBpHDVqyY
         zPTZP5+FGqId4FYrml5wW3g2XCdYVUZkw0/+YfH1+hu0E07rIrNiTzFAFSxxSzIH8V
         rBAFLdfyq4fMA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     konrad.dybcio@linaro.org, linux-kernel@vger.kernel.org,
        will@kernel.org, arnd@arndb.de, catalin.marinas@arm.com,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        jassisinghbrar@gmail.com, nfraprado@collabora.com,
        geert+renesas@glider.be, sboyd@kernel.org, mturquette@baylibre.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        rafal@milecki.pl, linux-arm-msm@vger.kernel.org,
        Devi Priya <quic_devipriy@quicinc.com>,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        dmitry.baryshkov@linaro.org, broonie@kernel.org
Cc:     quic_arajkuma@quicinc.com, quic_kathirav@quicinc.com,
        quic_anusha@quicinc.com, quic_sjaganat@quicinc.com,
        quic_srichara@quicinc.com, quic_ipkumar@quicinc.com
Subject: Re: (subset) [PATCH V3 0/5] Add APSS clock controller support for IPQ9574
Date:   Fri, 26 May 2023 12:38:33 -0700
Message-Id: <168512991479.248818.11621497605486086318.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406061314.10916-1-quic_devipriy@quicinc.com>
References: <20230406061314.10916-1-quic_devipriy@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 6 Apr 2023 11:43:09 +0530, Devi Priya wrote:
> APSS PLL found in IPQ9574 platform is of type Huayra.
> This series adds support for the APSS clock to bump the CPU frequency
> above 800MHz.
> 
> DTS patch is based on the below series
> https://lore.kernel.org/linux-arm-msm/20230404164828.8031-1-quic_devipriy@quicinc.com/
> 
> [...]

Applied, thanks!

[5/5] arm64: defconfig: Enable ipq6018 apss clock and PLL controller
      commit: 3098f34977480c9aa75cf328501f1b47ec49fec7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
