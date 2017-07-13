Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:43362 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750920AbdGMFOH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jul 2017 01:14:07 -0400
Subject: Re: [PATCH V4 3/6] iommu/arm-smmu: Invoke pm_runtime during probe,
 add/remove device
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1499333825-7658-1-git-send-email-vivek.gautam@codeaurora.org>
 <1499333825-7658-4-git-send-email-vivek.gautam@codeaurora.org>
 <20170712225459.GZ22780@codeaurora.org>
Cc: joro@8bytes.org, robin.murphy@arm.com, robh+dt@kernel.org,
        mark.rutland@arm.com, will.deacon@arm.com,
        m.szyprowski@samsung.com, robdclark@gmail.com,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, sricharan@codeaurora.org,
        stanimir.varbanov@linaro.org, architt@codeaurora.org,
        linux-arm-kernel@lists.infradead.org
From: Vivek Gautam <vivek.gautam@codeaurora.org>
Message-ID: <5ee0bacd-e557-a6c4-a897-844fb12ea6ae@codeaurora.org>
Date: Thu, 13 Jul 2017 10:43:59 +0530
MIME-Version: 1.0
In-Reply-To: <20170712225459.GZ22780@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,


On 07/13/2017 04:24 AM, Stephen Boyd wrote:
> On 07/06, Vivek Gautam wrote:
>> @@ -1231,12 +1237,18 @@ static int arm_smmu_map(struct iommu_domain *domain, unsigned long iova,
>>   static size_t arm_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
>>   			     size_t size)
>>   {
>> -	struct io_pgtable_ops *ops = to_smmu_domain(domain)->pgtbl_ops;
>> +	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>> +	struct io_pgtable_ops *ops = smmu_domain->pgtbl_ops;
>> +	size_t ret;
>>   
>>   	if (!ops)
>>   		return 0;
>>   
>> -	return ops->unmap(ops, iova, size);
>> +	pm_runtime_get_sync(smmu_domain->smmu->dev);
> Can these map/unmap ops be called from an atomic context? I seem
> to recall that being a problem before.

That's something which was dropped in the following patch merged in master:
523d7423e21b iommu/arm-smmu: Remove io-pgtable spinlock

Looks like we don't  need locks here anymore?

Best Regards
Vivek

>
>
>> +	ret = ops->unmap(ops, iova, size);
>> +	pm_runtime_put_sync(smmu_domain->smmu->dev);
>> +
>> +	return ret;
>>   }
>>   
>>   static phys_addr_t arm_smmu_iova_to_phys_hard(struct iommu_domain *domain,

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

