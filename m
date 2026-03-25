Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972F93C8716
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 11:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436570; cv=none; b=H8RsZDcxKGsY8tw2jiezwa4nql8stRe07YMmn8Z6UW+Q/dN9rgSbBWopnS4l0tp+W3nYMTVOfxrqFWOxUnHS81LCZBOOe1CQhjcl3BtKzUs+7BWl++TUh81jgOOO8qcfIQ1gCRnj1dSVU7LNv0FkoOFqXJWzuTtLVEyLehOBJTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436570; c=relaxed/simple;
	bh=qs3lZMqQEg4enzgFnIcVeyjtpcmV+MdUo1kmK2zvUJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=klJVc9RclFPLKNMYPNT8lm1USDi6l4D7c+YeXhfDuzy6nJZCUDVBwDipnjWBP4TbHmkDz5F19315/pUuHNn5PTmDsdzcB3TwqQwPIDzQtx7V5vhm3v5tqlPHsIjH/HScBZn4/ZzDhD6Rw/xjPd/NbcO3V1B7cL098492vXzwA8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=jdmNBq0G; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="jdmNBq0G"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260325110244euoutp017e1dc1d2b3263c2adc64c53d5166bc1b~gEKd3LhK-0638406384euoutp01E
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 11:02:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260325110244euoutp017e1dc1d2b3263c2adc64c53d5166bc1b~gEKd3LhK-0638406384euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774436564;
	bh=5TENbPqJiqN8gJ2OLLr9A5N0XRqryi/AdnBno+1Cr8Q=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=jdmNBq0G3l0ac+iBrxQvKk7jBdm8Zev7dgMOfhi+D/7Ej4x5MrWHYigVa0E5wgHsf
	 3TEuafXXl1Ar/TmSWgBIWJIJ1se31P4h18iP/wCue1rLlaaIoU8IJ2XSYEVT3Er/41
	 DqneuAyE259ggexAMCAMBFyomLdnBkMUPNU8FLXE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260325110244eucas1p1ea280137c0b94e1f5b79d5578da7fedf~gEKdfMCHg2549225492eucas1p1r;
	Wed, 25 Mar 2026 11:02:44 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260325110242eusmtip266f05f327a6eb6ca9d92996263e0cba0~gEKbsHQ5z1659816598eusmtip2Y;
	Wed, 25 Mar 2026 11:02:42 +0000 (GMT)
Message-ID: <9b574ac5-09fa-4e7a-b2bb-a339fbb319bc@samsung.com>
Date: Wed, 25 Mar 2026 12:02:41 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol
 initialization
To: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: sudeep.holla@arm.com, philip.radford@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org,
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260310184030.3669330-9-cristian.marussi@arm.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260325110244eucas1p1ea280137c0b94e1f5b79d5578da7fedf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260325110244eucas1p1ea280137c0b94e1f5b79d5578da7fedf
X-EPHeader: CA
X-CMS-RootMailID: 20260325110244eucas1p1ea280137c0b94e1f5b79d5578da7fedf
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
	<20260310184030.3669330-9-cristian.marussi@arm.com>
	<CGME20260325110244eucas1p1ea280137c0b94e1f5b79d5578da7fedf@eucas1p1.samsung.com>

On 10.03.2026 19:40, Cristian Marussi wrote:
> Add proper error handling on failure to enumerate clocks features or
> rates.
>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

This patch landed yesterday in linux-next as commit 0d8b0c8068a8 
("firmware: arm_scmi: Harden clock protocol initialization"). In my 
tests I found that it causes a regression on RK3568 Odroid-M1 board 
(arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts), cpufreq and GPU 
device are not probed properly:

# dmesg | grep scmi
scmi_core: SCMI protocol bus registered
arm-scmi arm-scmi.0.auto: Using scmi_smc_transport
arm-scmi arm-scmi.0.auto: SCMI max-rx-timeout: 30ms / max-msg-size: 
104bytes / max-msg: 20
scmi_protocol scmi_dev.1: Enabled polling mode TX channel - prot_id:16
arm-scmi arm-scmi.0.auto: SCMI Notifications - Core Enabled.
arm-scmi arm-scmi.0.auto: Malformed reply - real_sz:8 calc_sz:4  
(loop_num_ret:1)
arm-scmi arm-scmi.0.auto: SCMI Protocol v2.0 'rockchip:' Firmware 
version 0x0
arm-scmi arm-scmi.0.auto: Enabling SCMI Quirk 
[quirk_clock_rates_triplet_out_of_spec]
scmi-clocks scmi_dev.3: probe with driver scmi-clocks failed with error -22

# cat /sys/kernel/debug/devices_deferred
fde60000.gpu
cpufreq-dt

# dmesg | grep fde60000.gpu
rockchip-pm-domain fdd90000.power-management:power-controller: 
sync_state() pending due to fde60000.gpu
panfrost fde60000.gpu: get clock failed -517
panfrost fde60000.gpu: clk init failed -517
panfrost fde60000.gpu: get clock failed -517
panfrost fde60000.gpu: clk init failed -517

...

> ---
>   drivers/firmware/arm_scmi/clock.c | 22 ++++++++++++++++------
>   1 file changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> index c9b62edce4fd..bf956305a8fe 100644
> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c
> @@ -402,10 +402,16 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
>   		    SUPPORTS_RATE_CHANGE_REQUESTED_NOTIF(attributes))
>   			clk->rate_change_requested_notifications = true;
>   		if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
> -			if (SUPPORTS_PARENT_CLOCK(attributes))
> -				scmi_clock_possible_parents(ph, clk_id, cinfo);
> -			if (SUPPORTS_GET_PERMISSIONS(attributes))
> -				scmi_clock_get_permissions(ph, clk_id, clk);
> +			if (SUPPORTS_PARENT_CLOCK(attributes)) {
> +				ret = scmi_clock_possible_parents(ph, clk_id, cinfo);
> +				if (ret)
> +					return ret;
> +			}
> +			if (SUPPORTS_GET_PERMISSIONS(attributes)) {
> +				ret = scmi_clock_get_permissions(ph, clk_id, clk);
> +				if (ret)
> +					return ret;
> +			}
>   			if (SUPPORTS_EXTENDED_CONFIG(attributes))
>   				clk->extended_config = true;
>   		}
> @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
>   	for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
>   		cinfo->clkds[clkid].id = clkid;
>   		ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> -		if (!ret)
> -			scmi_clock_describe_rates_get(ph, clkid, cinfo);
> +		if (ret)
> +			return ret;
> +
> +		ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> +		if (ret)
> +			return ret;
>   	}
>   
>   	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

