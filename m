Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 12 Jul 2017 15:54:59 -0700
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
Subject: Re: [PATCH V4 3/6] iommu/arm-smmu: Invoke pm_runtime during probe,
 add/remove device
Message-ID: <20170712225459.GZ22780@codeaurora.org>
References: <1499333825-7658-1-git-send-email-vivek.gautam@codeaurora.org>
 <1499333825-7658-4-git-send-email-vivek.gautam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1499333825-7658-4-git-send-email-vivek.gautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/06, Vivek Gautam wrote:
> @@ -1231,12 +1237,18 @@ static int arm_smmu_map(struct iommu_domain *domain, unsigned long iova,
>  static size_t arm_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
>  			     size_t size)
>  {
> -	struct io_pgtable_ops *ops = to_smmu_domain(domain)->pgtbl_ops;
> +	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> +	struct io_pgtable_ops *ops = smmu_domain->pgtbl_ops;
> +	size_t ret;
>  
>  	if (!ops)
>  		return 0;
>  
> -	return ops->unmap(ops, iova, size);
> +	pm_runtime_get_sync(smmu_domain->smmu->dev);

Can these map/unmap ops be called from an atomic context? I seem
to recall that being a problem before.


> +	ret = ops->unmap(ops, iova, size);
> +	pm_runtime_put_sync(smmu_domain->smmu->dev);
> +
> +	return ret;
>  }
>  
>  static phys_addr_t arm_smmu_iova_to_phys_hard(struct iommu_domain *domain,

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
