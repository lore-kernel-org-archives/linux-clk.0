Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6D5C65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 11:46:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1FE6220849
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 11:46:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="bPZRY74U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FE6220849
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbeLMLqc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 06:46:32 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:8999 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727826AbeLMLqc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Dec 2018 06:46:32 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c1246950000>; Thu, 13 Dec 2018 03:46:29 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 13 Dec 2018 03:46:31 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 13 Dec 2018 03:46:31 -0800
Received: from [10.26.11.125] (172.20.13.39) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 13 Dec
 2018 11:46:29 +0000
Subject: Re: [PATCH V2 08/21] clk: tegra: dfll: round down voltages based on
 alignment
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20181213093438.29621-1-josephl@nvidia.com>
 <20181213093438.29621-9-josephl@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <c1ce50e0-fccf-aa37-361c-4dd9367b092d@nvidia.com>
Date:   Thu, 13 Dec 2018 11:46:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181213093438.29621-9-josephl@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544701589; bh=oDthzxuE74SejfjxcEIQD9xRRx51Ge2buzNvAx78kGY=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=bPZRY74U6esombBjCaLk4oBsqGEwR5YA8iHyhnFd5JY2x1j3sBEpsDQ5xYrwcg6VX
         +lEeQzPgBqduQRYB1+xoPHRPCYot7A5Aq0T4p+g3vOW21ZHb8FWg12amLMWdeqJP/Q
         MX+9ncGMrO9hLO+n2yBU4P3sgfTRCCYdoPkNmd1BeGq4nJXS9PpknM0DPkU3JIYro8
         4AQava20kFTT8NBdUQtWdw6yqNut//3Al9sFwa32o71KGe/uzZBabF3KhtdCzIRG1L
         lK6fG1QVuoO3aERWVfOxuDQyjgRp/UF20sNYnjpQ0H1vv+BvAyzKXkC3uAKfiKFGrf
         XNjVS2I94GKHA==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 13/12/2018 09:34, Joseph Lo wrote:
> When generating the OPP table, the voltages are round down with the
> alignment from the regulator. The alignment should be applied for
> voltages look up as well.
> 
> Based on the work of Penny Chiu <pchiu@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> *V2:
>  - s/align_volt/align_step/
>  - s/reg_volt/reg_volt_id/
> ---
>  drivers/clk/tegra/clk-dfll.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
> index 72e02898006c..b3668073d9b4 100644
> --- a/drivers/clk/tegra/clk-dfll.c
> +++ b/drivers/clk/tegra/clk-dfll.c
> @@ -804,17 +804,17 @@ static void dfll_init_out_if(struct tegra_dfll *td)
>  static int find_lut_index_for_rate(struct tegra_dfll *td, unsigned long rate)
>  {
>  	struct dev_pm_opp *opp;
> -	int i, uv;
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
> @@ -1532,15 +1532,17 @@ static int dfll_init(struct tegra_dfll *td)
>   */
>  static int find_vdd_map_entry_exact(struct tegra_dfll *td, int uV)
>  {
> -	int i, n_voltages, reg_uV;
> +	int i, n_voltages, reg_volt_id, align_step;
>  
> +	align_step = uV / td->soc->alignment.step_uv;
>  	n_voltages = regulator_count_voltages(td->vdd_reg);
>  	for (i = 0; i < n_voltages; i++) {
> -		reg_uV = regulator_list_voltage(td->vdd_reg, i);
> -		if (reg_uV < 0)
> +		reg_volt_id = regulator_list_voltage(td->vdd_reg, i) /
> +			      td->soc->alignment.step_uv;
> +		if (reg_volt_id < 0)

I don't think that this will work. If the step is say 10000 and we
return an error code greater than -10000, we will end up with 0.

>  			break;
>  
> -		if (uV == reg_uV)
> +		if (align_step == reg_volt_id)
>  			return i;
>  	}
>  
> @@ -1554,15 +1556,17 @@ static int find_vdd_map_entry_exact(struct tegra_dfll *td, int uV)
>   * */
>  static int find_vdd_map_entry_min(struct tegra_dfll *td, int uV)
>  {
> -	int i, n_voltages, reg_uV;
> +	int i, n_voltages, reg_volt_id, align_step;
>  
> +	align_step = uV / td->soc->alignment.step_uv;
>  	n_voltages = regulator_count_voltages(td->vdd_reg);
>  	for (i = 0; i < n_voltages; i++) {
> -		reg_uV = regulator_list_voltage(td->vdd_reg, i);
> -		if (reg_uV < 0)
> +		reg_volt_id = regulator_list_voltage(td->vdd_reg, i) /
> +			      td->soc->alignment.step_uv;
> +		if (reg_volt_id < 0)

Same here.

>  			break;
>  
> -		if (uV <= reg_uV)
> +		if (align_step <= reg_volt_id)
>  			return i;
>  	}
>  
> 

-- 
nvpublic
