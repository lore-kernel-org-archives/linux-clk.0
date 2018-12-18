Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CD7C43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 10:05:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 155B32184C
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 10:05:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="P8DM7NY8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbeLRKFL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 05:05:11 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:15748 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbeLRKFL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Dec 2018 05:05:11 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c18c64e0000>; Tue, 18 Dec 2018 02:05:02 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 18 Dec 2018 02:05:10 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 18 Dec 2018 02:05:10 -0800
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 18 Dec
 2018 10:05:08 +0000
Subject: Re: [PATCH V3 08/20] clk: tegra: dfll: round down voltages based on
 alignment
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20181218091232.23532-1-josephl@nvidia.com>
 <20181218091232.23532-9-josephl@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <1914601f-8b27-8f90-da21-5a4ae1f0de03@nvidia.com>
Date:   Tue, 18 Dec 2018 10:05:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181218091232.23532-9-josephl@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1545127502; bh=xkXugpE3eyAHGxUcnrBwD5GJ9wnXWHdbgkrVe1z2ZC0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=P8DM7NY8v/8XUEwJvuQ1AJG9qyiKzk8s4qyf8CoRz6UNCrxcH+DxDEdeY7LHuKcgZ
         xQPE36vyPPP4hVaA/97IeEKqEfZQIoUuzBRveJh67Fc0X+zciHwgRjZbCsKd4zNu3N
         N+0isHre4IhTQU6E4cUqEr+kbCRmERWoDHR3LV8s+AuCaNHCKKxrptriDDLl1z3/LM
         VRfGiwvziCBrVZJpjJFfknG0npgD/2m31xnmGCTCXH4XRPpC48XZxqRkWd9LSRy/e0
         eicRU0HlfsPoN0ng4R34nsQ+gwTgOWw9mT4I9ZW/xne7d8wKHZ5Zp4+9q3X66uQQxC
         shoRRRIXug8Ug==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 18/12/2018 09:12, Joseph Lo wrote:
> When generating the OPP table, the voltages are round down with the
> alignment from the regulator. The alignment should be applied for
> voltages look up as well.
> 
> Based on the work of Penny Chiu <pchiu@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> *v3:
>  - fix error handling code when regulator_list_voltage returns error
> *V2:
>  - s/align_volt/align_step/
>  - s/reg_volt/reg_volt_id/
> ---
>  drivers/clk/tegra/clk-dfll.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
> index 96be522398ed..ca9a4ae0d29e 100644
> --- a/drivers/clk/tegra/clk-dfll.c
> +++ b/drivers/clk/tegra/clk-dfll.c
> @@ -804,18 +804,17 @@ static void dfll_init_out_if(struct tegra_dfll *td)
>  static int find_lut_index_for_rate(struct tegra_dfll *td, unsigned long rate)
>  {
>  	struct dev_pm_opp *opp;
> -	unsigned long uv;
> -	int i;
> +	int i, align_step;
>  
>  	opp = dev_pm_opp_find_freq_ceil(td->soc->dev, &rate);
>  	if (IS_ERR(opp))
>  		return PTR_ERR(opp);
>  
> -	uv = dev_pm_opp_get_voltage(opp);
> +	align_step = dev_pm_opp_get_voltage(opp) / td->soc->alignment.step_uv;
>  	dev_pm_opp_put(opp);
>  
>  	for (i = td->lut_bottom; i < td->lut_size; i++) {
> -		if (td->lut_uv[i] >= uv)
> +		if ((td->lut_uv[i] / td->soc->alignment.step_uv) >= align_step)
>  			return i;
>  	}
>  
> @@ -1533,18 +1532,21 @@ static int dfll_init(struct tegra_dfll *td)
>   */
>  static int find_vdd_map_entry_exact(struct tegra_dfll *td, int uV)
>  {
> -	int i, n_voltages, reg_uV;
> +	int i, n_voltages, reg_uV,reg_volt_id, align_step;
>  
>  	if (WARN_ON(td->pmu_if == TEGRA_DFLL_PMU_PWM))
>  		return -EINVAL;
>  
> +	align_step = uV / td->soc->alignment.step_uv;
>  	n_voltages = regulator_count_voltages(td->vdd_reg);
>  	for (i = 0; i < n_voltages; i++) {
>  		reg_uV = regulator_list_voltage(td->vdd_reg, i);
>  		if (reg_uV < 0)
>  			break;
>  
> -		if (uV == reg_uV)
> +		reg_volt_id = reg_uV / td->soc->alignment.step_uv;
> +
> +		if (align_step == reg_volt_id)
>  			return i;
>  	}
>  
> @@ -1558,18 +1560,21 @@ static int find_vdd_map_entry_exact(struct tegra_dfll *td, int uV)
>   * */
>  static int find_vdd_map_entry_min(struct tegra_dfll *td, int uV)
>  {
> -	int i, n_voltages, reg_uV;
> +	int i, n_voltages, reg_uV, reg_volt_id, align_step;
>  
>  	if (WARN_ON(td->pmu_if == TEGRA_DFLL_PMU_PWM))
>  		return -EINVAL;
>  
> +	align_step = uV / td->soc->alignment.step_uv;
>  	n_voltages = regulator_count_voltages(td->vdd_reg);
>  	for (i = 0; i < n_voltages; i++) {
>  		reg_uV = regulator_list_voltage(td->vdd_reg, i);
>  		if (reg_uV < 0)
>  			break;
>  
> -		if (uV <= reg_uV)
> +		reg_volt_id = reg_uV / td->soc->alignment.step_uv;
> +
> +		if (align_step <= reg_volt_id)
>  			return i;
>  	}
>  
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
