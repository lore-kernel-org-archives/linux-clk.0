Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:52678 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752461AbdGLWzt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Jul 2017 18:55:49 -0400
Date: Wed, 12 Jul 2017 15:55:47 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: joro@8bytes.org, robin.murphy@arm.com, robh+dt@kernel.org,
        mark.rutland@arm.com, will.deacon@arm.com,
        m.szyprowski@samsung.com, robdclark@gmail.com,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, sricharan@codeaurora.org,
        stanimir.varbanov@linaro.org, architt@codeaurora.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V4 4/6] iommu/arm-smmu: Add the device_link between
 masters and smmu
Message-ID: <20170712225547.GA22780@codeaurora.org>
References: <1499333825-7658-1-git-send-email-vivek.gautam@codeaurora.org>
 <1499333825-7658-5-git-send-email-vivek.gautam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1499333825-7658-5-git-send-email-vivek.gautam@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/06, Vivek Gautam wrote:
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index ddbfa8ab69e6..75567d9698ab 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -1348,6 +1348,7 @@ static int arm_smmu_add_device(struct device *dev)
>  	struct arm_smmu_device *smmu;
>  	struct arm_smmu_master_cfg *cfg;
>  	struct iommu_fwspec *fwspec = dev->iommu_fwspec;
> +	struct device_link *link = NULL;

Unnecessary initialization?

>  	int i, ret;
>  
>  	if (using_legacy_binding) {
> @@ -1403,6 +1404,16 @@ static int arm_smmu_add_device(struct device *dev)
>  
>  	pm_runtime_put_sync(smmu->dev);
>  
> +	/*
> +	 * Establish the link between smmu and master, so that the
> +	 * smmu gets runtime enabled/disabled as per the master's
> +	 * needs.
> +	 */
> +	link = device_link_add(dev, smmu->dev, DL_FLAG_PM_RUNTIME);
> +	if (!link)
> +		dev_warn(smmu->dev, "Unable to create device link between %s and %s\n",
> +			 dev_name(smmu->dev), dev_name(dev));
> +
>  	return 0;
>  

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
