Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CAE801
	for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 00:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753835656; cv=none; b=PI6vEfDPoCgRF6LukV9QCEUpo8iQtbM9dCkzBO9OOkfEPnXTonEWIHLCscsK8UyU/V067DfShGnjRI8Peh/lCW8RvzEeyO6JuyoY9U2tm+leHCMymSvmdCnSG6yYz/7MHwlCF4a7MnKf+In5uSvc+f0VTKoH5L8GfXCCV0qoO/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753835656; c=relaxed/simple;
	bh=3yxShgWDTj1P75PH9My48xhkCOAXnqb3UKriGHOxNSQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=m5rGVYeFQ246pFJ4643kPjMx3+1UaEE9yDIS2wSjrdLXe+QGnIiOAKkWfcQypJPN+RIbDAc4+3hXxJA0BKBdf7jWNC3dguUb2PwECfbzi8JMcxjEUV4C+K78f+7uYlc0x2BPIidIxq+LKGSykpQuz9cXeF07NX3CD0YRT6PZzsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=PdriTaZx; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="PdriTaZx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
	Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=oI1HU+X2QvkDN0X8D2sP6JUwO9r6yHAwSbZ+2hPxM+4=; b=PdriTaZxIYLp8N+JmOkJIyZ8uY
	CkZ37+ffpV6jmPXbEdlI+eP9zSei+Y1gWM5+FdVUAF5qQBJ+bSXB0Nx1LLHcfQeeCbJjB7rFn9rYg
	OoKjUvFJLXs2GQf7zl1qD0Ats7iaetNko37mLQPolyAEc8C0kzCfx0yO6xRIMNT1lm/X8p9J0ahlM
	ejKy5O13L+9maPJ0cfs+ffoSgafq7+jxftN6rHV8nGsZR9u1wwWIjcUi0tAoKLd/jboQje2Q5qyAz
	auzdMXeBeot60SrHm2RAUF8G+FFJhXoP7q1NKNpdk2AYD1t/dp3w1HPQ+J19Kdn1Gr3DandlS6PR3
	/K2iymHw==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1ugulb-005gEJ-Qz; Wed, 30 Jul 2025 02:34:00 +0200
Message-ID: <38d12f53-8c8a-4713-b1f9-0e8ffdf71f98@igalia.com>
Date: Tue, 29 Jul 2025 21:33:50 -0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>, Melissa Wen <mwen@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
 <20250728-v3d-power-management-v1-1-780f922b1048@igalia.com>
 <20250729-tall-fluffy-grouse-f5deec@houat>
 <1bc23ad0-7273-4ddf-a0ef-4a80186f2581@igalia.com>
 <20250729-whispering-accelerated-raptor-134e8a@houat>
 <b8c0f9be-a57e-49b3-8113-cbb9307facd9@igalia.com>
Content-Language: en-US
In-Reply-To: <b8c0f9be-a57e-49b3-8113-cbb9307facd9@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/07/25 13:19, Maíra Canal wrote:
> Hi Maxime,
> 
> On 29/07/25 09:14, Maxime Ripard wrote:
>> On Tue, Jul 29, 2025 at 08:53:51AM -0300, Maíra Canal wrote:
>>> Hi Maxime,
>>>
>>> On 29/07/25 04:27, Maxime Ripard wrote:
>>>> Hi Maíra,
>>>>
>>>> On Mon, Jul 28, 2025 at 09:35:38AM -0300, Maíra Canal wrote:
>>>>> Currently, when we prepare or unprepare RPi's clocks, we don't 
>>>>> actually
>>>>> enable/disable the firmware clock. This means that
>>>>> `clk_disable_unprepare()` doesn't actually change the clock state at
>>>>> all, nor does it lowers the clock rate.
>>>>>
>>>>>   From the Mailbox Property Interface documentation [1], we can see 
>>>>> that
>>>>> we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
>>>>> off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
>>>>> prepare and an unprepare hook for RPi's firmware clock.
>>>>>
>>>>> As now the clocks are actually turned off, some of them are now marked
>>>>> with CLK_IGNORE_UNUSED or CLK_IS_CRITICAL, as those are required since
>>>>> early boot or are required during reboot.
>>>>
>>>> What difference is there between the CLK_IGNORE_UNUSED and
>>>> CLK_IS_CRITICAL clocks?
>>>
>>>  From my understanding, CLK_IGNORE_UNUSED will prevent the clock to be
>>> gated during boot (on "clk: Disabling unused clocks"), but after it, the
>>> clock can be gated.
>>>
>>> With CLK_IS_CRITICAL, the clock will never be disabled.
>>
>> Yeah, that's correct.
>>
>>> For example, RPI_FIRMWARE_M2MC_CLK_ID is used by vc4. It needs to be
>>> enabled at boot (I tested; if not enabled, it won't boot). However,
>>> after vc4 is probed, we would like vc4 to have control of it and be able
>>> to unprepare it in `vc4_hdmi_runtime_suspend()`. If I set it as
>>> CLK_IS_CRITICAL, vc4 won't be able to unprepare it.
>>
>> If the clock can be disabled by Linux, but it breaks some drivers if
>> it's not enabled during their probe, something is fishy somewhere, and
>> it's likely it would be just as broken if you compiled the driver as a
>> module.
>>
>> Even then, some of the other clocks should probably never be disabled,
>> like the CPU clock.
> 
> I'll mark RPI_FIRMWARE_ARM_CLK_ID and RPI_FIRMWARE_CORE_CLK_ID as
> critical. Are there any other clocks you think should never be disabled?
> 
>>
>>> I only set RPI_FIRMWARE_PIXEL_BVB_CLK_ID as critical, as, otherwise, the
>>> RPi won't reboot.
>>
>> Why?
> 
> I'll have to dig a bit into vc4 HDMI code and to investigate the reason
> (and maybe fix the issue there).

After some investigation, I believe that those display-related should be
set to CLK_IGNORE_UNUSED. It's not that it breaks some drivers if not
enabled, but it breaks hardware functionality and the device won't boot.
See, for example, clk-bcm2835 in which all PLL and PLL dividers clocks
are marked with CLK_IGNORE_UNUSED and some with CLK_IS_CRITICAL.

Maybe Dave has some input about the topic?

So far, I'm planing to keep CLK_IGNORE_UNUSED to the display-related
clocks and remove CLK_IS_CRITICAL from RPI_FIRMWARE_PIXEL_BVB_CLK_ID. If
you have any objections about it, let me know.

Best Regards,
- Maíra

> 
> Best Regards,
> - Maíra
> 

