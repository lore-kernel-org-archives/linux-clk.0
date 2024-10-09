Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2466F1E7C06
	for <linux-clk@vger.kernel.org>; Wed,  9 Oct 2024 15:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728489446; cv=none; b=YJ1jy61XXnS4wOJFzBeOLueMu1dpxz9prbzOomwJqI/umsTcL1IjF7NyCaOESRyHXbVRjsiNqEoYTMJUswc3bIHjAOTxmSEXvPTPD1fgsyDa4sXwgAHaQSU0BRBZqZ/q5z8wGP8BGTlFElMZElF5BU0hrlyodFUtHd9z1yBELFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728489446; c=relaxed/simple;
	bh=mfpWTSiv/BHbmyC2ar7wtFjaEFPtcpuE1zl8ibV/46M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lPp/D5143TBsg0UejOpT7KvCQ6ehZDvinDaLEgMalAvg+tUqOwh1EjfL3Yjh8sXPGL71a6C711zWM3ONcKnGcwCqA/oybPMY/WRySvJx4xx9ll+ObIP8g+t9GJdY1Lr5MqYno0TJDR7mFDj+/pHlTM5rFtPuzq+WOAwKXpudGME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=UmRXYe/J; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="UmRXYe/J"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 69EE888210;
	Wed,  9 Oct 2024 17:57:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1728489443;
	bh=pATmmCqOy1hJfDoeUR05y/DTA1JhK172UEu7pwvJ7j4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UmRXYe/JpFxH4kOLAnDv+eoKlobxizgFfonw/QorT/hAs0wIfEyA92dv0/cA9I6EG
	 sztg/1VEn/o0asMhYavEexGgsrZa1Fi1xfLBlrSRrbT84H52tWuBMgQRaK2O+s9PKw
	 ytahGHTLHZhhzh/gMkqDTflWWXaB+jp57okkGFqtcvRQ7k67wbNCnNd3gNKd8OKBqJ
	 MiGhBBEBUdfV5tcoFARj7GtClphZGcpbhocAbn0jCkcQdfLaRp5otOenK22xPFi5td
	 o+uI3Gm2Ib2XeeOwNRhsbxmLTISAG8+Fq8TIb7hMpJmsv517ZsejvvP8bAPF2zd4DC
	 laMKePHFFsnRw==
Message-ID: <2ad7ecb1-8b62-4c9d-990f-e89530250f21@denx.de>
Date: Wed, 9 Oct 2024 17:41:23 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm: bridge: ldb: Configure LDB clock in .mode_set
To: Isaac Scott <isaac.scott@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
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
 <8a78fcf2f1da1d4b8ca3446e8378517a71bf1e51.camel@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <8a78fcf2f1da1d4b8ca3446e8378517a71bf1e51.camel@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/9/24 12:27 PM, Isaac Scott wrote:
> On Wed, 2024-10-09 at 00:38 +0200, Marek Vasut wrote:
>> The LDB serializer clock operate at either x7 or x14 rate of the
>> input
>> LCDIFv3 scanout engine clock. Make sure the serializer clock and
>> their
>> upstream Video PLL are configured early in .mode_set to the x7 or x14
>> rate of pixel clock, before LCDIFv3 .atomic_enable is called which
>> would
>> configure the Video PLL to low x1 rate, which is unusable.
>>
>> With this patch in place, the clock tree is correctly configured. The
>> example below is for a 71.1 MHz pixel clock panel, the LDB serializer
>> clock is then 497.7 MHz:
> 
> Awesome! Thank you for this, this seems to fix the regression and the
> patches work as expected. I have tested both patches on v6.12-rc2 and
> the display works well.
> 
> For both patches,
> 
> Tested-by: Isaac Scott <isaac.scott@ideasonboard.com>
Thank you for testing, but this patch feels too much like a feature 
development to me. Does the DT tweak I suggested also fix your issue? If 
so, I would really like that DT tweak to be the fix for current release 
and these two patches be feature development for 6.13 cycle. What do you 
think ?
