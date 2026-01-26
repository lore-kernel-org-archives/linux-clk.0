Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1046B13DDAE
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 11:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769425553; cv=none; b=Wya5wtv8HFD+Mmd1ZV+Yb/9bib9LDCCQ+gqBc/xpZqB/J6p/27CC6gnIDheUthoJyTKp49604d4QB/fUgAkRxP62ZnKEIf5llbVduLZnvVCeTWKX9pdseh85C6hobkgw+u9kapD5nJy4oJUrOIKDF14bjrO8lYdBZMTAOiz3Y1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769425553; c=relaxed/simple;
	bh=svsHx86gCXHOt9lDm9UaiD2VqEcy9P0nDBdnqYDH7fs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ojCXctPNG+XrjCJiA2gokAsLhPDQrfGvdPbGtvY41v6RGM/HV+IoKs/rl+MxZYxExSTWwAI1AFXqoABhjdFwFCDnR4hdgb99tgu9zXlaKOAcUoyXhodD8fqWdzxSD4f/YCnnuFIlLw2elu3zEnCYGKf8KUb3IUMjaZUyjPD8DJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=DSJXpNiv; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="DSJXpNiv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZuODv4byBDoO7r5ORDZZKB4tCzJ8s4CMikv3WI8hr/Y=; b=DSJXpNivAlcWV1w9ugI0E425/J
	kXYNh+EOtBME+oBjgHiDyVQ8WB+b7+X3Vbl91kXX6p4aY8QSY5ax2S2V8JTT2v4Fid9/suotJvhI3
	sb3/WgcwAW3bzibDOyQrncYSBkXVPJiU8TjNKc2Q2XBky730iUAQ7G4i+kK12aPMLsY0J/b1JNaoD
	vhCcWvfBz3TFKMskx23Y4s2Bl4NDGcQDfZngO59bOpIWhxd9B9IbNyryFYl2bxWC+mH4ZVPYnY4sq
	zdfr0I89VW3ohxuB/nzTCPtw3YqniJK/VDLVMFY9QVH66fVpKTdS97MDtJxmIcVHwRRLtYFIxyzrf
	5byoU4gg==;
Received: from [189.89.57.42] (helo=[192.168.18.14])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1vkKPZ-00A0Ol-V5; Mon, 26 Jan 2026 12:05:38 +0100
Message-ID: <9ee3b7f0-9262-4f6f-bec6-6fd9978e3754@igalia.com>
Date: Mon, 26 Jan 2026 08:05:30 -0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/v3d: Allocate all resources before enabling
 the clock
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>,
 Iago Toral Quiroga <itoral@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>, Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20260116-v3d-power-management-v3-0-4e1874e81dd6@igalia.com>
 <20260116-v3d-power-management-v3-3-4e1874e81dd6@igalia.com>
 <b652e476-af2f-4af7-aa95-3b987f6e1bde@igalia.com>
 <dbd3c9e7-c60f-4223-8ca6-c55d2398cc3c@igalia.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <dbd3c9e7-c60f-4223-8ca6-c55d2398cc3c@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24/01/2026 14:48, Maíra Canal wrote:
> Hi Melissa,
>
> On 23/01/26 12:53, Melissa Wen wrote:
>>
>>
>> On 16/01/2026 17:19, Maíra Canal wrote:
>>> Move all resource allocation operations before actually enabling the
>>> clock, as those operations don't require the GPU to be powered on.
>> What are the benefits of doing it?
>
> This is mostly a preparation for the next patch. In the next patch, I'll
> move all code related to powering on and preparing the GPU into the
> resume() hook. Since resource allocation must occur before resume(),
> this patch prepares the necessary groundwork for that.

Can you include this explanation to the commit message?

>
>>>
>>> While here, use devm_reset_control_get_optional_exclusive() instead of
>>> open-code it.
>> Overall LGTM. But I think this patch could be split into smaller units.
>> Maybe something like:
>> 1. remove open-coded part
>> 2. split gem resource allocation from initialization
>> 3. move all resource allocation
>
> I can certainly do that. My initial thinking was to keep these changes
> together, since they are closely related and all serve the same
> preparatory goal for the upcoming resume() refactoring. From my
> perspective, keeping them together helps preserve that context.

As a reviewer, splitting these changes into separate patches would make 
review simpler.
I think the open-coded improvement isn't super attached to the resource 
allocation, right?
And you can preserve context in the commit message.

Melissa

>
> Best regards,
> - Maíra
>
>>
>> Melissa
>>

