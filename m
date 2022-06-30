Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B375CCA47B
	for <linux-clk@archiver.kernel.org>; Thu, 30 Jun 2022 12:46:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234998AbiF3MqU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Jun 2022 08:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234824AbiF3MqP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Jun 2022 08:46:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C417A2A734;
        Thu, 30 Jun 2022 05:46:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7B5B9B82A7D;
        Thu, 30 Jun 2022 12:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9BDC34115;
        Thu, 30 Jun 2022 12:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656593172;
        bh=V9MEmeKEeiohNLpXwu1MxUWpi7Dg5HhG14rTKC9onXI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KDHMcuslxCDNbeCC218MpOmJ2+QmCsyhr3EU7rCpKJtRpzxnqwmUaovg3f4SayDMf
         nLOQ+5vOH+wxWd4AT0l0jcqBXFPm9rE1tvkvKLks5zdHpQxSkGymkFyRSEuKN4zOvF
         e/gvPee1lMslfNnpMNvot9U4Uh4AApM7gBHmmdgjGZHM06Sqn39gp4w8JrtB+fto1V
         Va87BMEVr3mhufzXbVkSjy333uV+ap+KDfiaP1uPXH1mqfAStMnxxBbanRNLe5/PBp
         wYU6x1xSuuO5U65qEMpelvTPdXLlnszlWCsvsaIL9RGlbcDsZ8/D2exJXtN4j+m0/7
         xLU9U8ls3YdMg==
Date:   Thu, 30 Jun 2022 18:16:07 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v9 6/7] clk: qcom: clk-alpha-pll: add Rivian EVO PLL
 configuration interfaces
Message-ID: <Yr2bDzhj0KoY1RVi@matsya>
References: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
 <20220630081828.2554088-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630081828.2554088-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30-06-22, 11:18, Vladimir Zapolskiy wrote:
> Add and export Rivian EVO PLL configuration and control functions to
> clock controller drivers.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
