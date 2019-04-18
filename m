Return-Path: <SRS0=WJeD=SU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16304C10F0B
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 04:59:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D4B1F2184B
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 04:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555563565;
	bh=aBWFqnOszc1YlYn/I/d3ekW+xuK8MYtaiTOKWIDKDFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=RaqCk1L9bcvU8Aulf48nVa1XncNwBaKV9z556+3lX22wS5IP+uzjhnJLVQzL99W1u
	 o068RF08/Hao0RqBDZicQgInXSv02iG8O5jNQj0oXHkQtSwq4MzmcIuYrxgMt6DD+7
	 gJS+9Xm0A1Wf2Flv5J+UqoTatGS2CVeFKjTSJapQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbfDRE7Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Apr 2019 00:59:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:57896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725888AbfDRE7Z (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Apr 2019 00:59:25 -0400
Received: from localhost (unknown [171.61.90.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A13DF2083D;
        Thu, 18 Apr 2019 04:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555563564;
        bh=aBWFqnOszc1YlYn/I/d3ekW+xuK8MYtaiTOKWIDKDFk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fRgAUtrpIn5sAPLWjJQuUN+LOPNMSqZwFMALxc8RnO6hGiGSzPSDm3aL05tT/k/GY
         2KBdWOQfJvZqwZLzkI7BQZCglgmZKXW5Wya4afgtj68QiGQJuTgok4HKfFSc1dXaBB
         HSyfQOPTzCEG0kSGXknGLwqAbdENCse5iGv+Lhfo=
Date:   Thu, 18 Apr 2019 10:29:18 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 3/7] phy: qcom: Add Qualcomm PCIe2 PHY driver
Message-ID: <20190418045918.GV28103@vkoul-mobl>
References: <20190219060407.15263-1-bjorn.andersson@linaro.org>
 <20190219060407.15263-4-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190219060407.15263-4-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18-02-19, 22:04, Bjorn Andersson wrote:

> +static int qcom_pcie2_phy_power_on(struct phy *phy)
> +{
> +	struct qcom_phy *qphy = phy_get_drvdata(phy);
> +	int ret;
> +	u32 val;
> +
> +	/* Program REF_CLK source */
> +	val = readl(qphy->base + PCIE20_PARF_PHY_REFCLK_CTRL2);
> +	val &= ~BIT(1);
> +	writel(val, qphy->base + PCIE20_PARF_PHY_REFCLK_CTRL2);
> +
> +	usleep_range(1000, 2000);
> +
> +	/* Don't use PAD for refclock */
> +	val = readl(qphy->base + PCIE20_PARF_PHY_REFCLK_CTRL2);
> +	val &= ~BIT(0);
> +	writel(val, qphy->base + PCIE20_PARF_PHY_REFCLK_CTRL2);
> +
> +	/* Program SSP ENABLE */
> +	val = readl(qphy->base + PCIE20_PARF_PHY_REFCLK_CTRL3);
> +	val |= BIT(0);
> +	writel(val, qphy->base + PCIE20_PARF_PHY_REFCLK_CTRL3);

we have this readl, modify and writel pattern in the file. I guess it
makes sense to add a modifyl() with mask and value as args..

-- 
~Vinod
