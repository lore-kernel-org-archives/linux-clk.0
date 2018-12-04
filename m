Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BC3C04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 15:46:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 200672081C
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 15:46:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="VVDutLTD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 200672081C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbeLDPqV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 10:46:21 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:5151 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbeLDPqV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 10:46:21 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c06a14e0000>; Tue, 04 Dec 2018 07:46:22 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 04 Dec 2018 07:46:20 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 04 Dec 2018 07:46:20 -0800
Received: from tbergstrom-lnx.Nvidia.com (172.20.13.39) by
 HQMAIL101.nvidia.com (172.20.187.10) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 4 Dec 2018 15:46:20 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
        id 19BB9407B1; Tue,  4 Dec 2018 17:46:18 +0200 (EET)
Date:   Tue, 4 Dec 2018 17:46:18 +0200
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     Joseph Lo <josephl@nvidia.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 08/19] clk: tegra: dfll: round down voltages based on
 alignment
Message-ID: <20181204154618.GC26056@pdeschrijver-desktop.Nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-9-josephl@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20181204092548.3038-9-josephl@nvidia.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL101.nvidia.com (172.20.187.10)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1543938382; bh=CAv7moa/rHrIfpLTeL8A5gqIXg6pCGZc3ORWQX9e0RQ=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
         X-NVConfidentiality:User-Agent:X-Originating-IP:X-ClientProxiedBy;
        b=VVDutLTDKbyP+FJB51W8o1qDVzffXacHDPGiESNdjq7/02Y16cEzGne1/OTj/sKQn
         ojCuCc5989ygCiJvyhttBpBHLwDCs2CMRIFgjrkbzRztXOtDYEywfMI2PdNBhEgMvY
         w1EcCu0TfrwkRVPnq+aDwGgx799aXcvET1Jb2oLwuK4zNzf/gvUqBHE6QAYlQZMY9I
         N6eTGu0x2693q3PZOotM3pjbxoFp8aXDciLr90XOVPku4D7+awZuyh/3QCMd1/kN5+
         84B0gj0+Ok83WhFZcBGOOPRLc1q5TYUw68NPRJbyuag8DTAv1XroN5OiT5Tr1jidvZ
         rDxJAjKcevUAg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Dec 04, 2018 at 05:25:37PM +0800, Joseph Lo wrote:
> When generating the OPP table, the voltages are round down with the
> alignment from the regulator. The alignment should be applied for
> voltages look up as well.
> 
> Based on the work of Penny Chiu <pchiu@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  drivers/clk/tegra/clk-dfll.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
> index c294a2989f31..4a943c136d4d 100644
> --- a/drivers/clk/tegra/clk-dfll.c
> +++ b/drivers/clk/tegra/clk-dfll.c
> @@ -804,17 +804,17 @@ static void dfll_init_out_if(struct tegra_dfll *td)
>  static int find_lut_index_for_rate(struct tegra_dfll *td, unsigned long rate)
>  {
>  	struct dev_pm_opp *opp;
> -	int i, uv;
> +	int i, align_volt;
>  
>  	opp = dev_pm_opp_find_freq_ceil(td->soc->dev, &rate);
>  	if (IS_ERR(opp))
>  		return PTR_ERR(opp);
>  
> -	uv = dev_pm_opp_get_voltage(opp);
> +	align_volt = dev_pm_opp_get_voltage(opp) / td->soc->alignment.step_uv;
>  	dev_pm_opp_put(opp);
>  
>  	for (i = td->lut_bottom; i < td->lut_size; i++) {
> -		if (regulator_list_voltage(td->vdd_reg, td->lut[i]) == uv)
> +		if ((td->lut_uv[i] / td->soc->alignment.step_uv) >= align_volt)
>  			return i;
>  	}
>  
> @@ -1532,15 +1532,17 @@ static int dfll_init(struct tegra_dfll *td)
>   */

These 2 functions are only valid for I2C mode. We should probably add a
WARN_ON() in case they are called when PWM mode is used and return
-EINVAL.

>  static int find_vdd_map_entry_exact(struct tegra_dfll *td, int uV)
>  {
> -	int i, n_voltages, reg_uV;
> +	int i, n_voltages, reg_volt, align_volt;
>  
> +	align_volt = uV / td->soc->alignment.step_uv;
>  	n_voltages = regulator_count_voltages(td->vdd_reg);
>  	for (i = 0; i < n_voltages; i++) {
> -		reg_uV = regulator_list_voltage(td->vdd_reg, i);
> -		if (reg_uV < 0)
> +		reg_volt = regulator_list_voltage(td->vdd_reg, i) /
> +				td->soc->alignment.step_uv;
> +		if (reg_volt < 0)
>  			break;
>  
> -		if (uV == reg_uV)
> +		if (align_volt == reg_volt)
>  			return i;
>  	}
>  
> @@ -1554,15 +1556,17 @@ static int find_vdd_map_entry_exact(struct tegra_dfll *td, int uV)
>   * */
>  static int find_vdd_map_entry_min(struct tegra_dfll *td, int uV)
>  {
> -	int i, n_voltages, reg_uV;
> +	int i, n_voltages, reg_volt, align_volt;
>  
> +	align_volt = uV / td->soc->alignment.step_uv;
>  	n_voltages = regulator_count_voltages(td->vdd_reg);
>  	for (i = 0; i < n_voltages; i++) {
> -		reg_uV = regulator_list_voltage(td->vdd_reg, i);
> -		if (reg_uV < 0)
> +		reg_volt = regulator_list_voltage(td->vdd_reg, i) /
> +				td->soc->alignment.step_uv;
> +		if (reg_volt < 0)
>  			break;
>  
> -		if (uV <= reg_uV)
> +		if (align_volt <= reg_volt)
>  			return i;
>  	}
>  
> -- 
> 2.19.2
> 
