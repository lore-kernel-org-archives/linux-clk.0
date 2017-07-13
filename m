Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:58640 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750846AbdGMD7h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Jul 2017 23:59:37 -0400
Subject: Re: [PATCH V4 4/6] iommu/arm-smmu: Add the device_link between
 masters and smmu
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1499333825-7658-1-git-send-email-vivek.gautam@codeaurora.org>
 <1499333825-7658-5-git-send-email-vivek.gautam@codeaurora.org>
 <20170712225547.GA22780@codeaurora.org>
Cc: joro@8bytes.org, robin.murphy@arm.com, robh+dt@kernel.org,
        mark.rutland@arm.com, will.deacon@arm.com,
        m.szyprowski@samsung.com, robdclark@gmail.com,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, sricharan@codeaurora.org,
        stanimir.varbanov@linaro.org, architt@codeaurora.org,
        linux-arm-kernel@lists.infradead.org
From: Vivek Gautam <vivek.gautam@codeaurora.org>
Message-ID: <52b24d55-b7d5-2d50-4bb4-3e94d81c1be6@codeaurora.org>
Date: Thu, 13 Jul 2017 09:29:30 +0530
MIME-Version: 1.0
In-Reply-To: <20170712225547.GA22780@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 07/13/2017 04:25 AM, Stephen Boyd wrote:
> On 07/06, Vivek Gautam wrote:
>> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
>> index ddbfa8ab69e6..75567d9698ab 100644
>> --- a/drivers/iommu/arm-smmu.c
>> +++ b/drivers/iommu/arm-smmu.c
>> @@ -1348,6 +1348,7 @@ static int arm_smmu_add_device(struct device *dev)
>>   	struct arm_smmu_device *smmu;
>>   	struct arm_smmu_master_cfg *cfg;
>>   	struct iommu_fwspec *fwspec = dev->iommu_fwspec;
>> +	struct device_link *link = NULL;
> Unnecessary initialization?

Right, will drop this.
Thanks.

>
>>   	int i, ret;
>>   
>>   	if (using_legacy_binding) {
>> @@ -1403,6 +1404,16 @@ static int arm_smmu_add_device(struct device *dev)
>>   
>>   	pm_runtime_put_sync(smmu->dev);
>>   
>> +	/*
>> +	 * Establish the link between smmu and master, so that the
>> +	 * smmu gets runtime enabled/disabled as per the master's
>> +	 * needs.
>> +	 */
>> +	link = device_link_add(dev, smmu->dev, DL_FLAG_PM_RUNTIME);
>> +	if (!link)
>> +		dev_warn(smmu->dev, "Unable to create device link between %s and %s\n",
>> +			 dev_name(smmu->dev), dev_name(dev));
>> +
>>   	return 0;
>>   

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

