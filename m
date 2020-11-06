Return-Path: <SRS0=zIv1=EM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB18C55178
	for <linux-clk@archiver.kernel.org>; Fri,  6 Nov 2020 09:39:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7E8621707
	for <linux-clk@archiver.kernel.org>; Fri,  6 Nov 2020 09:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604655582;
	bh=1g4gEpkJ6os1fH0Br+Av4t0IP/ZRXjnSkZnVAXMh9YE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Rd22Em0NjY0xUYXhl0l+UjFnJMBFX5DBczZ6g4dFiWGYR744XJ8FnoB4jEatR7OJe
	 RAjeF00em0iEGVqaaf1AgmKagc76KM4rvt8JhZX7Uc0gsGN0ONm5T2SzXMhM+J6CS+
	 8cr4zgBW+IFzqxJpqq3c2UKVgP/MqXjvmcYXqSho=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbgKFJji (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Nov 2020 04:39:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:57804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbgKFJji (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Nov 2020 04:39:38 -0500
Received: from localhost (unknown [122.179.17.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 96E5B208FE;
        Fri,  6 Nov 2020 09:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604655577;
        bh=1g4gEpkJ6os1fH0Br+Av4t0IP/ZRXjnSkZnVAXMh9YE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D5EACCXxQEkMvgi+AVT8nJP03ZsM+QYfY84oDR/siL/LWsgzpKSsH7AZ1KcNpaJU4
         6uf0AL06rABDCNXc4sPmM4uqJ7w971pmw1Dr79J/5AC/gSKFCjTfYnZBpJEK0HaY5V
         9E/OBiqnFdTA9iPxAZVmELzQQmJq4HmK7cJboJyE=
Date:   Fri, 6 Nov 2020 15:09:28 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] clk: qcom: Add support for SDX55 RPMh clocks
Message-ID: <20201106093928.GF2621@vkoul-mobl>
References: <20201105104817.15715-1-manivannan.sadhasivam@linaro.org>
 <20201105104817.15715-5-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105104817.15715-5-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05-11-20, 16:18, Manivannan Sadhasivam wrote:
> Add support for following clocks maintained by RPMh in SDX55 SoCs.
> 
> * BI TCXO
> * RF_CLK1
> * RF_CLK1_AO
> * RF_CLK2
> * RF_CLK2_AO
> * QPIC (Qualcomm Technologies, Inc. Parallel Interface Controller)

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
