Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80691AAC4
	for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 00:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729645184; cv=none; b=DDyyUpJrMll6UbWw1B1Rn5sSoGLdMswdCsrzvqGachSAPNLPY6elWc9SV0o1Gbs+MmVfKZ4jGIi9O5d657Lng/dBHqrq0EZS/FD+mgJNIb1NDlknQnvly2cTGu3CYNfegbTqIh9x2bKEDlJTMOENMR72LfceGWke9d+6n0oiXxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729645184; c=relaxed/simple;
	bh=idR+Fwjjg7zWYvGKOdSzRwmcxlHdUIelU8ITMoQ6PLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q9B6g3bPq1bWEVVsKCnk+0kLSZBtiHKdZ6QYDWU0Y1/gclB7Yu0+Rpjf5iq2pYZMQEgZ+XlxEl0bFx9cdHzMjXwdxTdBQzyQDZm1r7Bgid8NqNG7xo3/P1tFnRAmmap23NvXefAHEqXVLx0evG3JFFqltHFF+vYWk6a8M6qGMuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=hqZUj3ss; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="hqZUj3ss"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A86C3892B8;
	Wed, 23 Oct 2024 02:59:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729645181;
	bh=eUdWWm3QvzO53KX32iFo1AxrLYZlLD5bgsQ9SGmEUns=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hqZUj3ssLkX4a5FSJAjDaeuQ1kUZv4tpenMM/2f2FOVJkp34gIrIjyb2mBSLS4w0J
	 ODfrT2jfhSxBWEf9u2yxRsizdQbY58ZP+0BWe191TsQUn+5oQGlEVpY4JqRO6rtyA/
	 ll/DLEQIlQGxww9+D4Um+TkPETHnd8G+Z+jghfi3BHS6Z87cczpOzeCPFjrVLR8BvS
	 FkbfjwzhjGs8oIEq7gofuxpx7M4aSDmpAetXc8YvDBrRb0xC+JFIrzC8dT2qlCjzTo
	 WKRESBHacHx45U8hlPQJK3UywsPemNE1l8nrQ2MmE3VhqXYEFJagvVJXXSkBsp1JsF
	 ZVJOkJTHjcJww==
Message-ID: <e8f54ebf-9693-4cec-bbdd-ea2e6d9e85f8@denx.de>
Date: Wed, 23 Oct 2024 02:55:37 +0200
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
 <0e47b529-59f2-4d25-8c5d-30ca1dc4e964@denx.de>
 <3341a6a7-ac0e-4594-a670-b3a6d583b344@nxp.com>
 <207b20ff-cc7b-40aa-8dde-bc5aabdfb414@denx.de>
 <6d7ec7de-4d48-4273-a707-c70e34996787@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <6d7ec7de-4d48-4273-a707-c70e34996787@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/22/24 7:59 AM, Liu Ying wrote:

[...]

>>> Anyway, I don't think it is necessary to manage the clk_set_rate()
>>> function calls between this driver and mxsfb_kms or lcdif_kms
>>> because "video_pll1" clock rate is supposed to be assigned in DT...
>>
>> I disagree with this part. I believe the assignment of clock in DT is only a temporary workaround which should be removed. The drivers should be able to figure out and set the clock tree configuration.
> 
> I think the clock rate assignment in DT is still needed.
> A good reason is that again we need to share one video PLL
> between MIPI DSI and LDB display pipelines for i.MX8MP.

You don't really need to share the Video PLL , you can free up e.g. PLL3 
and use it for one video output pipeline, and use the Video PLL for the 
other video pipeline, and then you get accurate pixel clock in both 
pipelines.

>>>>> The idea is to assign a reasonable PLL clock rate in DT to make
>>>>> display drivers' life easier, especially for i.MX8MP where LDB,
>>>>> Samsung MIPI DSI may use a single PLL at the same time.
>>>> I would really like to avoid setting arbitrary clock in DT, esp. if it can be avoided. And it surely can be avoided for this simple use case.
>>>
>>> ... just like I said in patch 1/2, "video_pll1" clock rate needs
>>> to be x2 "media_ldb" clock rate for dual LVDS link mode. Without
>>> an assigned "video_pll1" clock rate in DT, this driver cannot
>>> achieve that.
>>
>> This is something the LDB driver can infer from DT and configure the clock tree accordingly.
> 
> Well, the LDB driver only controls the "ldb" clock rate. It doesn't
> magically set the parent "video_pll1" clock's rate to 2x it's rate,
> unless the driver gets "video_pll1_out" clock by calling
> clk_get_parent() and directly controls the PLL clock rate which
> doesn't look neat.

It isn't nice, but it actually may solve this problem, no ?

>>> And, the i.MX8MP LDB + Samsung MIPI DSI case is
>>> not simple considering using one single PLL and display modes
>>> read from EDID.
>> You could use separate PLLs for each LCDIF scanout engine in such a deployment, I already ran into that, so I am aware of it. That is probably the best way out of such a problem, esp. if accurate pixel clock are the requirement.
> 
> I cannot use separate PLLs for the i.MX8MP LDB and Samsung MIPI
> DSI display pipelines on i.MX8MP EVK, because the PLLs are limited
> resources and we are running out of it.  Because LDB needs the pixel
> clock and LVDS serial clock to be derived from a same PLL, the only
> valid PLLs(see imx8mp_media_disp_pix_sels[] and
> imx8mp_media_ldb_sels[]) are "video_pll1_out", "audio_pll2_out",
> "sys_pll2_1000m" and "sys_pll1_800m".  All are used as either audio
> clock or system clocks on i.MX8MP EVK, except "video_pll1_out".

Could you use Video PLL for LDB and PLL3 for DSI then ?

I think this could still be configurable per board, it shouldn't be such 
that one board which attempts to showcase everything would prevent other 
boards with specific requirements from achieving those.

> You probably may use separate PLLs for a particular i.MX8MP platform
> with limited features, but not for i.MX8MP EVK which is supposed to
> evaluate all SoC features.
Right, that, exactly.

[...]
