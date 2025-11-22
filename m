Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEF724A05D;
	Sat, 22 Nov 2025 11:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763812239; cv=none; b=OpNfYOF0naOutQ7mS6A7G0CgBWq9Ggu2ZRtl8ltMD9LMwGIwwhoE5l2UPPkhuezeH/VwhjBkHIful6P5ZIo5loRLpSgSvZYtmrFAKOw9ZdIOnhS4zOwEAp538de23f1bEHTnqhoRP4PfGgktMN5yCnMpx4ZJjAv+unf7U1JnPXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763812239; c=relaxed/simple;
	bh=OFSEwnamRuB2MNtMzqeCzJDKd4lbApIQ3cHPmcydhUM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:In-Reply-To:
	 Content-Type:References; b=mFeOxGSXK/ojUdfJfeNDqSvgSf/jbcU4UXTvP4nf6ud36APt8s0u8owwRoPVZdNA1wD6G2ZDVXSYdghExZXWoxM+xteKLwwU01K7RxaZs8xhifpdcmHU/dK8tN7zbo9pxN9qyUWoxkKzevSIL3cGFfq6vMuwF4wmG6I0eEG1fq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=BsZjmNqA; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="BsZjmNqA"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251122114223euoutp02a865adc7452e5f90cd2c14db70458d11~6UW_ahNXk1064910649euoutp02D;
	Sat, 22 Nov 2025 11:42:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251122114223euoutp02a865adc7452e5f90cd2c14db70458d11~6UW_ahNXk1064910649euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763811743;
	bh=SGLaM+urYg0Vv3ieWczJVk93J9IdI6KYj5H+J8X+y3M=;
	h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
	b=BsZjmNqATOZm6x8qZF7sfQToegD8qekT6vuwMvfrYo3v4HczMnvB8w9pDT7SME9wE
	 hgQq/EnnoHIVB38YQk0un47ypNrJ1VVX77dAO/f55vwnCbsuW8x/Lg74pRelj2WuYH
	 EwpiR3kDAgc7iXZjsBNnOkFf7XAclI8K/xkJ0OFo=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251122114222eucas1p24f8f3e7694749a27fb423cef4feeea98~6UW9WpQF-3156331563eucas1p2M;
	Sat, 22 Nov 2025 11:42:22 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251122114221eusmtip29f79269c395c0c2dff1d9551b3d2b603~6UW76k8t21359313593eusmtip2a;
	Sat, 22 Nov 2025 11:42:21 +0000 (GMT)
Message-ID: <1b2c290b-5716-4a07-82b3-e53c35af2150@samsung.com>
Date: Sat, 22 Nov 2025 12:42:20 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/13] drm: starfive: jh7110: Enable display
 subsystem
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: Conor Dooley <conor@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
	<hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Xingyu
	Wu <xingyu.wu@starfivetech.com>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay
	Abraham I <kishon@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
	Armstrong <neil.armstrong@linaro.org>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
	Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Simona
	Vetter <simona@ffwll.ch>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
	<tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
	Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
	Ghiti <alex@ghiti.fr>, Marek Szyprowski <m.szyprowski@samsung.com>, Icenowy
	Zheng <uwu@icenowy.me>, Maud Spierings <maudspierings@gocontroll.com>, Andy
	Yan <andyshrk@163.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
	linux-riscv@lists.infradead.org
Content-Language: en-US
In-Reply-To: <e1696331-1271-46a8-adb6-9fed4521f22b@samsung.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251122114222eucas1p24f8f3e7694749a27fb423cef4feeea98
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251108010451eucas1p1c7bf340dbd2b1b7cbfb53d6debce7a2e
X-EPHeader: CA
X-CMS-RootMailID: 20251108010451eucas1p1c7bf340dbd2b1b7cbfb53d6debce7a2e
References: <CGME20251108010451eucas1p1c7bf340dbd2b1b7cbfb53d6debce7a2e@eucas1p1.samsung.com>
	<20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
	<20251110-clang-baking-b8b27730356e@spud>
	<00e897dc-9966-439b-a74a-7604a1870027@samsung.com>
	<20251111-footing-eclair-332f5f0769f2@spud>
	<20251111-matriarch-diocese-b314e7bdaf81@spud>
	<e1696331-1271-46a8-adb6-9fed4521f22b@samsung.com>



On 11/13/25 15:57, Michal Wilczynski wrote:
> 
> 
> On 11/11/25 19:37, Conor Dooley wrote:
>> On Tue, Nov 11, 2025 at 06:14:48PM +0000, Conor Dooley wrote:
>>> On Tue, Nov 11, 2025 at 04:33:28PM +0100, Michal Wilczynski wrote:
>>>>
>>>>
>>>> On 11/10/25 20:35, Conor Dooley wrote:
>>>>> On Sat, Nov 08, 2025 at 02:04:34AM +0100, Michal Wilczynski wrote:
>>>>>> This series enables the display subsystem on the StarFive JH7110 SoC.
>>>>>> This hardware has a complex set of dependencies that this series aims to
>>>>>> solve.
>>>>>>
>>>>>> I believe this is a PHY tuning issue that can be fixed in the new
>>>>>> phy-jh7110-inno-hdmi.c driver without changing the overall architecture.
>>>>>> I plan to continue debugging these modes and will submit follow up fixes
>>>>>> as needed.
>>>>>>
>>>>>> The core architectural plumbing is sound and ready for review.
>>>>>>
>>>>>> Notes:
>>>>>> - The JH7110 does not have a centralized MAINTAINERS entry like the
>>>>>>   TH1520, and driver maintainership seems fragmented. I have therefore
>>>>>>   added a MAINTAINERS entry for the display subsystem and am willing to
>>>>>>   help with its maintenance.
>>>>>
>>>>> Yeah, bunch of different folks wrote the drivers, so lots of entries.
>>>>> Pretty much all as you've done here, authors are responsible for the
>>>>> individual components and Emil is the platform maintainer but
>>>>> responsible for most drivers.
>>>>>
>>>>> Do you need any feedback dt wise on the RFC, or is it too likely that
>>>>> we'll both waste our breath if the DRM folks don't approve of your
>>>>> approach for the rest of this series?
>>>>
>>>> Hi Conor,
>>>>
>>>> Thank you for your response.
>>>>
>>>> That's a fair point about the risk of the DRM approach being rejected.
>>>> While I can't be certain, I'm hopeful that part is relatively
>>>> straightforward, as it primarily integrates other recently reviewed
>>>> (though not yet merged) components like the inno-hdmi bridge and dc8200
>>>> drivers.
>>>>
>>>> To be honest, I was more concerned that the DT part of the series would
>>>> be more problematic. Given that, I would find it very helpful to get
>>>> your feedback on the DT aspects now, if you have the time.
>>>
>>> Right. You'll definitely want some actual DRM people to weigh in though
>>> before making changes, I am really not familiar enough with this type of
>>> hardware to know if the breakdown is correct.
>>
>> It looks generally sane to me chief, but as I said I am not really
>> familiar enough with this sort of hardware to have a real take on it.
>> Sorry, you'll need to get your affirmation about how you've laid stuff
>> out elsewhere :/
> 
> Thanks for the look, Conor.
> 
> I appreciate the sanity check on the DT side. I'll focus on getting the
> necessary feedback from the DRM maintainers regarding the architectural
> breakdown before spinning a v2.
> 
> [Adding Dmitry Baryshkov and highlighting Maxime, Heiko, and Robert]
> 
> Could you folks take a brief look at the driver split in this series?
> 
> Conor has reviewed the DT bindings and they look sane to him, but we
> need to verify that the architectural split between the
> phy-jh7110-inno-hdmi and the DRM bridge driver is acceptable for this
> Innosilicon IP.
> 
> I am particularly interested if the current handling of the PHY tuning
> parameters (as described in the cover letter) fits the modern DRM
> bridge/PHY paradigm, or if this should be modeled differently given the
> similarities to Rockchip implementations.
> 
> Best regards,

Hi folks,

Just a gentle ping on this series.

I am primarily waiting on architectural feedback regarding the split
between the DRM bridge and the PHY driver.

If I don't receive any objections soon, I'll assume the current
structure is acceptable and proceed with addressing the known PHY tuning
issues for v2.

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
