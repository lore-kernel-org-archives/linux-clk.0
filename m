Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DF2C77B71
	for <linux-clk@archiver.kernel.org>; Fri, 14 Apr 2023 03:33:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbjDNDde (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Apr 2023 23:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbjDNDdc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Apr 2023 23:33:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921D0422B;
        Thu, 13 Apr 2023 20:33:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2936964395;
        Fri, 14 Apr 2023 03:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF533C4339E;
        Fri, 14 Apr 2023 03:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681443208;
        bh=wAf6CIv6GHm/FDZyRjSM/c74sFZxAnT3NJbfTFACTsE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WguM36XSDCxuLNZaf9rZG8uOkVTJr8N1ZpAgvQ329BSscXPYUTLMYgKEMPVroyKPN
         75AS/20a83H3SN1wqT3cF9pXSdEF5rXt47Rd3P3yFbkl/Aozq5CknbZHxUD7Y2vyZQ
         XWWMPUDXKjLDUohFGf4N+QhHBASJGPBrfYTDOtV3vNH2JkUk1UcZ9gC5SAXKXcXH9w
         HuqKB9P5NwcHoUy5X6NC36+AngwxXElXCuuRjI8lV6i/9vPYj32qyLr4ip1TiAw9+T
         gFQYa1esrDPnlGbWBxgy3p9uJwwHIgfT/gWJeexMKbE8Hdk46bHpvxHUgGaVqQB8Zh
         IOtf2Ghmae1fQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-sm8350: fix PCIe PIPE clocks handling
Date:   Thu, 13 Apr 2023 20:37:03 -0700
Message-Id: <168144342195.2459486.9741231480683404215.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412134829.3686467-1-dmitry.baryshkov@linaro.org>
References: <20230412134829.3686467-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 12 Apr 2023 16:48:29 +0300, Dmitry Baryshkov wrote:
> On SM8350 platform the PCIe PIPE clocks require additional handling to
> function correclty. They are to be switched to the tcxo source before
> turning PCIe GDSCs off and should be switched to PHY PIPE source once
> they are working. Swithc PCIe PHY clocks to use clk_regmap_phy_mux_ops,
> which provide support for this dance.
> 
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-sm8350: fix PCIe PIPE clocks handling
      commit: 1a500e0bc97b6cb3c0d9859e81973b8dd07d1b7b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
