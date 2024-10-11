Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078B13EA64
	for <linux-clk@vger.kernel.org>; Fri, 11 Oct 2024 03:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728617997; cv=none; b=QmhEgHv8Now6+BvT8qGqUHBdwM77OAKQaXEHIlwlDDS+n4umv5Hk5NBbDnhZJXSRH9NI7OzE0050x6XnDlWmlRLbTm7tnvl+R5mpf0fKAlUEhyzj2j5QSqAp5uZX7cGPxvrzcLT0roF0cwZL8FTDzO0nfhDvkBCUmGa6jVsx6aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728617997; c=relaxed/simple;
	bh=jJr72Btlst23Co6eGQQWE1fKuypwSCtoPs3YQEVE6DE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LFJDuZ8Qpc072ZA7w7NeEVGFinmb99LcVGTZSS+oDf1Eqzb3M9lCnhuoIjrEtEM+eVaxC3gsdLAXB77WQ4DRCxhbUl/HLA325Nq2S6xRFTqNidWqaF5PozrGtBN6ZITJaQMAIBeg2EN+eP0pziBroGHXxvoC4/1hJdl7DVcBgLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=MX3PNXS+; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="MX3PNXS+"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id D5B038929F;
	Fri, 11 Oct 2024 05:39:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1728617993;
	bh=uWS5slj0pT9o4QUSNSFv+mXM3NdSBsqdzN99/5GzSsI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MX3PNXS+eiZLSu2ARDGE8KT3QXoZ8UpYyqbaI4+/t5Xcq2UINcx5qSfXBoHNwscNy
	 plRX2h5fqQceTflwG9BexofGJCqKgr6bgO2Phf4vP+pnZcOer9lm+jVTMIlR5DgTgh
	 EdLRbfjcRUYlekgxznYz53Gt1hTankoGxiJbdzQb8NFuiCZpznT+0rV1dnnth2mPMS
	 POeYzTtAIvQ8g20GB/gh+rtMdkzzzGvGBuTcevngZWPNGmpGJEITfaQ13sSTEsVSdG
	 LLUZ/s7u3BYDZxV057utio3LfXw6I+5uGvN33gdjs+lf3RkmWCZZqj/e0qstMWwWK2
	 cJFasF63657Wg==
Message-ID: <0e47b529-59f2-4d25-8c5d-30ca1dc4e964@denx.de>
Date: Fri, 11 Oct 2024 03:59:30 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm: bridge: ldb: Configure LDB clock in .mode_set
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20241008223846.337162-1-marex@denx.de>
 <20241008223846.337162-2-marex@denx.de>
 <d6a34efa-47ad-439b-8b0c-a427cf087cb3@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <d6a34efa-47ad-439b-8b0c-a427cf087cb3@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/10/24 9:15 AM, Liu Ying wrote:
> On 10/09/2024, Marek Vasut wrote:
>> The LDB serializer clock operate at either x7 or x14 rate of the input
> 
> Isn't it either x7 or 3.5x?

Is it 3.5 for the dual-link LVDS ?
I don't have such a panel right now to test.

[...]

>> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
>> index 0e4bac7dd04ff..a3a31467fcc85 100644
>> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
>> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
>> @@ -278,6 +278,16 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
>>   	return MODE_OK;
>>   }
>>   
>> +static void fsl_ldb_mode_set(struct drm_bridge *bridge,
>> +			       const struct drm_display_mode *mode,
>> +			       const struct drm_display_mode *adj)
>> +{
>> +	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
>> +	unsigned long requested_link_freq = fsl_ldb_link_frequency(fsl_ldb, mode->clock);
>> +
>> +	clk_set_rate(fsl_ldb->clk, requested_link_freq);
> 
> The mode_set callback won't be called when only crtc_state->active
> is changed from false to true in an atomic commit, e.g., blanking
> the emulated fbdev first and then unblanking it.  So, in this case,
> the clk_set_rate() in fsl_ldb_atomic_enable() is still called after
> those from mxsfb_kms or lcdif_kms.
> 
> Also, it doesn't look neat to call clk_set_rate() from both mode_set
> callback and atomic_enable callback.

I agree the mode_set callback is not the best place for this.
Do you know of a better callback where to do this ? I couldn't find one.

> The idea is to assign a reasonable PLL clock rate in DT to make
> display drivers' life easier, especially for i.MX8MP where LDB,
> Samsung MIPI DSI may use a single PLL at the same time.
I would really like to avoid setting arbitrary clock in DT, esp. if it 
can be avoided. And it surely can be avoided for this simple use case.
