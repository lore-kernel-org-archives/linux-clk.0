Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E71E270ED9
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 07:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758787038; cv=none; b=N4cg3N7tt/ftdJlhtskr6ah59JoY095+y8hCN9daAmzGzJPFlEYnSPyOeWgpzT61MmEGUQvkMgD5wvEDKW/PiFssbUoOoL2NBFO5NDpN/+8l7+uXeSJl+MkryqaN85qGpfiDA+LTzzXWpXwTj1cNvvE/tS2/57DznBnBV5xNYH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758787038; c=relaxed/simple;
	bh=8UG/lY1q65IrQ+k4c1aGtbV0SXEaFO5qeVMV685BNSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=RGTd6JR8LPBl6uWy8CSxmvVDFMAy5rORNwhd6z5y3ipUVPG688z4xzbgndOLHkTU63zqW/ibjPEgQiSeqgM6EtRsoCXsjQkVVJgR83ty8gInvRzLj7NocxXod8jHNVG8TDs7EbjYmJcY9to4msT4Sc6B67YY/9E6GFAiiQloojo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=TZQ8vvPj; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TZQ8vvPj"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250925075712euoutp02bd943aee745949a64d4da84d736c4ce2~od3zQWv8B0307503075euoutp02L
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 07:57:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250925075712euoutp02bd943aee745949a64d4da84d736c4ce2~od3zQWv8B0307503075euoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758787032;
	bh=+ijBeTVh2qMoqGY4XXlzT1UoXFC5cgdqYwVNgvrBe2U=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=TZQ8vvPjFj5PkMyDHybH6PwN7dyr3NhtdVbEpqMffQ8EpGjF/ePqtm3CIVT7exurA
	 0Ktnnx4yMfDievDvYDVmxXqdf99VFOwreQhODpr+4ii57R5fBmKt8xsmT1xIEcYQaB
	 3C+f5VFdyryFGWVl5/LRz+VORHGL9j30aN36Ml4Q=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250925075711eucas1p26efbb194311a6e22ab593a39b43e12c3~od3yzCY6p2636426364eucas1p2F;
	Thu, 25 Sep 2025 07:57:11 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250925075710eusmtip21342a4d5fdce7eebd984c1532f6130c3~od3x4W-jr1189111891eusmtip2X;
	Thu, 25 Sep 2025 07:57:10 +0000 (GMT)
Message-ID: <727aa0c8-2981-4662-adf3-69cac2da956d@samsung.com>
Date: Thu, 25 Sep 2025 09:57:10 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 2/5] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz
	Julienne <nsaenz@kernel.org>, Florian Fainelli
	<florian.fainelli@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, Maxime
	Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>, Iago Toral
	Quiroga <itoral@igalia.com>, Dom Cobley <popcornmix@gmail.com>, Dave
	Stevenson <dave.stevenson@raspberrypi.com>, Philipp Zabel
	<p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
	Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250731-v3d-power-management-v2-2-032d56b01964@igalia.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250925075711eucas1p26efbb194311a6e22ab593a39b43e12c3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250925075711eucas1p26efbb194311a6e22ab593a39b43e12c3
X-EPHeader: CA
X-CMS-RootMailID: 20250925075711eucas1p26efbb194311a6e22ab593a39b43e12c3
References: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com>
	<20250731-v3d-power-management-v2-2-032d56b01964@igalia.com>
	<CGME20250925075711eucas1p26efbb194311a6e22ab593a39b43e12c3@eucas1p2.samsung.com>

On 31.07.2025 23:06, Maíra Canal wrote:
> Currently, when we prepare or unprepare RPi's clocks, we don't actually
> enable/disable the firmware clock. This means that
> `clk_disable_unprepare()` doesn't actually change the clock state at
> all, nor does it lowers the clock rate.
>
> >From the Mailbox Property Interface documentation [1], we can see that
> we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
> off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
> prepare and an unprepare hook for RPi's firmware clock.
>
> As now the clocks are actually turned off, some of them are now marked
> CLK_IS_CRITICAL, as those are required to be on during the whole system
> operation.
>
> Link: https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface [1]
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>
> ---
>
> About the pixel clock: currently, if we actually disable the pixel
> clock during a hotplug, the system will crash. This happens in the
> RPi 4.
>
> The crash happens after we disabled the CRTC (thus, the pixel clock),
> but before the end of atomic commit tail. As vc4's pixel valve doesn't
> directly hold a reference to its clock – we use the HDMI encoder to
> manage the pixel clock – I believe we might be disabling the clock
> before we should.
>
> After this investigation, I decided to keep things as they current are:
> the pixel clock is never disabled, as fixing it would go out of
> the scope of this series.
> ---
>   drivers/clk/bcm/clk-raspberrypi.c | 56 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 55 insertions(+), 1 deletion(-)

This patch landed recently in linux-next as commit 919d6924ae9b ("clk: 
bcm: rpi: Turn firmware clock on/off when preparing/unpreparing"). In my 
tests I found that it breaks booting of RaspberryPi3B+ board in ARM 
32bit mode. Surprisingly the same board in ARM 64bit mode correctly 
boots a kernel compiled from the same source. The RPi3B+ board freezes 
after loading the DRM modules (kernel compiled from arm/multi_v7_defconfig):

---->8---

[    7.317423] cfg80211: Loading compiled-in X.509 certificates for 
regulatory database
[    7.379464] Console: switching to colour dummy device 80x30
[    7.407475] vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_hvs_ops [vc4])
[    7.434647] input: vc4-hdmi HDMI Jack as 
/devices/platform/soc/3f902000.hdmi/sound/card0/input0
[    7.448937] vc4-drm soc:gpu: bound 3f902000.hdmi (ops vc4_hdmi_ops [vc4])
[    7.455677] vc4-drm soc:gpu: bound 3f806000.vec (ops vc4_vec_ops [vc4])
[    7.462371] vc4-drm soc:gpu: bound 3f004000.txp (ops vc4_txp_ops [vc4])
[    7.468962] vc4-drm soc:gpu: bound 3f206000.pixelvalve (ops 
vc4_crtc_ops [vc4])
[    7.476424] vc4-drm soc:gpu: bound 3f207000.pixelvalve (ops 
vc4_crtc_ops [vc4])
[    7.483831] vc4-drm soc:gpu: bound 3f807000.pixelvalve (ops 
vc4_crtc_ops [vc4])

(system frozen at this point)


> ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

