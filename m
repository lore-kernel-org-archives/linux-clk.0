Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21725C43334
	for <linux-clk@archiver.kernel.org>; Thu, 30 Jun 2022 12:14:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233783AbiF3MOK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Jun 2022 08:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232632AbiF3MOJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Jun 2022 08:14:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E5861A814;
        Thu, 30 Jun 2022 05:14:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CEEFCB82A3C;
        Thu, 30 Jun 2022 12:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACCF5C34115;
        Thu, 30 Jun 2022 12:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656591246;
        bh=oecAxGvVSF6prH+L81KhIgN8RlECc3U3Sfi5sYWjQvM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CUv7v2mJN+alnqEix6sFmG6Kp32oErBlraOPcAQsRIZlpP+zT1mpRYmTzBjRKEgtH
         Xw5SnBR3vLlwnpFcUGcYC7eJWoYFJsu/8LBMoNwuWePVUmO1E8yjYtRZK/DRh59RCJ
         XW27CZtX5n947DpAwYflu1juxPcQ7QV0Xa9NxsBfdJR6STFj62i/iEjGCmzOuUDU6K
         uAb2w6nqFFXUtLd2DtcfrbayJTBuJH6QagDvb+BAz/gfAHiDdI9tldTgLMhzjscU6R
         AvDXKrJTlNybucW8RjFMYhYprYYe/XkqwOZraKo8oUhHNe8j+XGrdX9QhXk1ZvrtEH
         NXU2IhLPZ6g0g==
Date:   Thu, 30 Jun 2022 17:44:02 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v9 5/7] clk: qcom: clk-alpha-pll: add Lucid EVO PLL
 configuration interfaces
Message-ID: <Yr2TitZR3Yv8z/V1@matsya>
References: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
 <20220630081825.2554069-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630081825.2554069-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30-06-22, 11:18, Vladimir Zapolskiy wrote:
> Add controls for Lucid EVO PLL configuration and export control functions
> to clock controller drivers.

This sound fine but maybe add why we are adding this (to be used in
dispcc driver)... motivation helps :)

Other than this nit, lgtm:

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
