Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1DE366059
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 15:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526785; cv=none; b=R2wLR1gq89LYeVKi136kNhldx8qxHFny9E3jfQ8Ab1mPzGW/K45rClglCwpJHI7NdMAJsbZdGzUTGfcVLVZFpmixnHj5U7JO8sKVkG23upo7bobaexB5fw5lVzFfmM7D+X2jCDArGciuCAVDA8/nEvFk1EvxCm1/+IgxfRa2Mfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526785; c=relaxed/simple;
	bh=qZD6WXR12VGGRK9ww74KR3y68Gkiobom73rZY8FSd1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hxbo/xuXhavAgCK+X5eMhDZZ2r6bDujFveyDbgUHiEoeq8s0C2I9ajp4WnHPBB+5wnJ2XdSQ+kTqC3NzCtnAEnH9S3+JcP5ZaqggUxwHjGD64tK55zowzHQexwLFWVp19L4vllz7jASDu2p05cS7p8hh2elHblYQCw81R+DJ/YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ohP/Ycbh; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ohP/Ycbh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YKT+iclIkSdV8c83ayGvWA3kBucltRdTlZe/rREsEHU=; b=ohP/YcbhZlaXjUOdIKusH5/749
	BUSEOC+y9mXd9+qYms4ENrSUy33ONfAxB1JM+bRRDYpCFrQuF15e6FbcgjPOZHHDmev4FLDdi5C+b
	C+zV02RVLkK8T8CnNom7bLyUn+VFE/CxhzO1eIxPgkNE/vOG6pbhcdbrjIU3Sa1P9B0AV4X02dwBt
	7XrMskavy3jhcrolfvOSpGFOtJTlZrFGwpwJ00XsbZC6n3go8LhIuoclGaB1nKzH2tTXPycyY1Ed8
	X+dlACmr8lNv+E7+eZynuvI0brbbJhOP62X+KexrTEt6wIBnJmrm3wBsiOi9h3pR+E1lccR0SzcB6
	lMblik8A==;
Received: from [189.89.57.42] (helo=[192.168.18.14])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1vkkk9-00AW7o-Gv; Tue, 27 Jan 2026 16:12:37 +0100
Message-ID: <53fce710-8b0f-490a-b48d-9c5a17802533@igalia.com>
Date: Tue, 27 Jan 2026 12:12:31 -0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] Power Management for Raspberry Pi V3D GPU
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
References: <20260126-v3d-power-management-v4-0-caf2df16d4e2@igalia.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20260126-v3d-power-management-v4-0-caf2df16d4e2@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 26/01/2026 14:26, Maíra Canal wrote:
> This series introduces Runtime Power Management (PM) support for the
> Raspberry Pi V3D GPU.
>
> Currently, the V3D clock remains enabled for the entire system uptime,
> even when the GPU is idle. With the introduction of Runtime PM, the
> clock can now be disabled during idle periods. For example, with this
> series applied on a Raspberry Pi 5, if we check `vcgencmd measure_clock
> v3d`, we get:
>
> (idle)
>
> $ vcgencmd measure_clock v3d
> frequency(0)=0
>
> (running glmark2)
>
> $ vcgencmd measure_clock v3d
> frequency(0)=960016128
>
> One particular change was required in v3 to ensure a meaningful
> reduction in idle power consumption: the V3D clock rate must be
> explicitly set to the minimum rate during suspend. As explained in an
> inline comment, this is needed as some firmware versions may not fully
> power off the clock when its state is set to off. This issue can be
> mitigated by setting the clock rate to 0 during suspend. For this same
> reason, PATCH 1/6 has been added in v3.
>
> Apart from that, the v3d patches are mostly identical to v2, but rebased
> on top of drm-misc-next.
>
> To ease testing in Raspberry Pi 4 and 5, I prepared a downstream branch
> backporting this series to rpi-6.18.y [1].
>
> [1] https://github.com/mairacanal/linux-rpi/tree/v3d/downstream/power-management-6.18

The whole series is:

Reviewed-by: Melissa Wen <mwen@igalia.com>

>
> Best regards,
> - Maíra
>
> ---
> v1 -> v2: https://lore.kernel.org/r/20250728-v3d-power-management-v1-0-780f922b1048@igalia.com
>
> - [1/5] NEW PATCH: "clk: bcm: rpi: Add missing logs if firmware fails" (Stefan Wahren)
> - [2/5] Remove the "Fixes:" tag (Stefan Wahren)
> - [2/5] dev_err_ratelimited() instead of dev_err() (Stefan Wahren)
> - [2/5] Instead of logging the clock ID, use clk_hw_get_name(hw) to log the name (Stefan Wahren)
> - [2/5] Add a newline character at the end of the log message (Stefan Wahren)
> - [2/5] Use CLK_IS_CRITICAL for all clocks that can't be disabled (Maxime Ripard)
> - [3/5] NEW PATCH: "clk: bcm: rpi: Maximize V3D clock"
> - [4/5] Use devm_reset_control_get_optional_exclusive() (Philipp Zabel)
> - [4/5] Make sure that resource are cleaned in the inverse order of allocation (Philipp Zabel)
>
> v2 -> v3: https://lore.kernel.org/r/20250731-v3d-power-management-v2-0-032d56b01964@igalia.com
>
> - Rebased on top of drm-misc-next
> - Patches "[PATCH v2 1/5] clk: bcm: rpi: Add missing logs if firmware
>    fails", "[PATCH v2 2/5] clk: bcm: rpi: Turn firmware clock on/off when
>    preparing/unpreparing", and "[PATCH v2 3/5] clk: bcm: rpi: Maximize
>    V3D clock" were applied to clk-next.
> - [1/4] NEW PATCH: "clk: bcm: rpi: Let V3D consumers manage clock rate"
> - [2/4] NEW PATCH: "clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as CLK_IGNORE_UNUSED"
> - [3/4] Added Philipp's R-b (Philipp Zabel)
> - [4/4] s/drm_err/DRM_ERROR
> - [4/4] Set the clock rate to 0 during suspend and to the maximum rate
>    during resume
>
> v3 -> v4: https://lore.kernel.org/r/20260116-v3d-power-management-v3-0-4e1874e81dd6@igalia.com
>
> - Rebased on top of drm-misc-next
> - [1/6, 3/6] Add Melissa's A-b (Melissa Wen)
> - [2/6] NEW PATCH: "clk: bcm: rpi: Add a comment about RPI_FIRMWARE_SET_CLOCK_STATE
>    behavior" (Stefan Wahren)
> - [4/6] NEW PATCH: "drm/v3d: Use devm_reset_control_get_optional_exclusive()" (Melissa Wen)
> - [5/6] Include more context to the commit message (Melissa Wen)
> - [5/6, 6/6] Instead of creating the function v3d_gem_allocate(), use v3d_gem_init()
>    and move HW initialization out of it (Melissa Wen)
>
> ---
> Maíra Canal (6):
>        clk: bcm: rpi: Let V3D consumers manage clock rate
>        clk: bcm: rpi: Add a comment about RPI_FIRMWARE_SET_CLOCK_STATE behavior
>        clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as CLK_IGNORE_UNUSED
>        drm/v3d: Use devm_reset_control_get_optional_exclusive()
>        drm/v3d: Allocate all resources before enabling the clock
>        drm/v3d: Introduce Runtime Power Management
>
>   drivers/clk/bcm/clk-raspberrypi.c |  15 ++--
>   drivers/gpu/drm/v3d/Makefile      |   3 +-
>   drivers/gpu/drm/v3d/v3d_debugfs.c |  23 +++++-
>   drivers/gpu/drm/v3d/v3d_drv.c     | 163 ++++++++++++++++++--------------------
>   drivers/gpu/drm/v3d/v3d_drv.h     |  21 +++++
>   drivers/gpu/drm/v3d/v3d_gem.c     |  25 +++---
>   drivers/gpu/drm/v3d/v3d_irq.c     |  15 ++--
>   drivers/gpu/drm/v3d/v3d_mmu.c     |  12 ++-
>   drivers/gpu/drm/v3d/v3d_power.c   |  96 ++++++++++++++++++++++
>   drivers/gpu/drm/v3d/v3d_submit.c  |  19 ++++-
>   10 files changed, 273 insertions(+), 119 deletions(-)
> ---
> base-commit: 68e28facbc8ab3e701e1814323d397a75b400865
> change-id: 20250728-v3d-power-management-eebb2024dc96
>

