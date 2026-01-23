Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1F726CE11
	for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 15:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769183102; cv=none; b=S0PLMoJTCOojOOS8+bD4jXC+npDkYn/XqDRFXdrdnhvX+duuRZX4A3qe+ABjhWPVyzieKkfnJ4+YQvWmNAqCgjrjboSN0v4xfcSeq+mV/scrwQhgiX209LR8S5RuKFlhoQwEh1lT73OBrulWuI5EghIQxGPtt7dWyEAZUo6ocMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769183102; c=relaxed/simple;
	bh=rmrVutlv4IFhsoL1dEYQRQ1A+JNmwztdnll5fkSW1b8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uG4VzhtS9RLKxhH14ODFU8TVxn8qNuLzlJAImapTsNn15LQXy9erTakmMQ0GvwY19c4t/X3m2rR7oNCISuWb4BscdZo2DjxhUAcqt3M8DX78VzwzLBCjCk7zOsmGARK+Uq9aqLfyLZOFKB+JHcyNy/8vpbo3M3zDccvTGZ3uu34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=BPrfNPwX; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="BPrfNPwX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EKIZGMQIyFIPLyCGSOYC7IbcvQsfF7qx2cMcNenv5mQ=; b=BPrfNPwXKh4u+9NJJm2EB9fgcd
	nck8GtTefULPgGdXxo5a9Lst1ph9Oo8oHXlFr2G2L5mlo1B9405o1sHxThT+iHFiCzPNcQ+lybMo0
	d4IwoyvwsXG0n6s7/RXUbysRpjZOHlL8+sh9OqUNWibJ/EPOACqoJAEZ/SYzSC8Lyr+do5WWGcVKX
	QbW4E0yUHbJoUZDwqEp0P7566grUPXwUggUYas9QOJ2EkM4CidYQuCITue97mvk+F4v4B7j9btm4S
	sX2RRIX8U/1ECP+orelcVg8netSV6iTIkyFMvhqoTmvBeM35ZWRIM/BykptDLwRqcuYuiCsNO7xSv
	slFW2TgA==;
Received: from [189.89.57.42] (helo=[192.168.18.14])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1vjJL3-008xSQ-Vv; Fri, 23 Jan 2026 16:44:46 +0100
Message-ID: <c74a8884-9322-45c8-a960-a6bb1227f553@igalia.com>
Date: Fri, 23 Jan 2026 12:44:39 -0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] clk: bcm: rpi: Let V3D consumers manage clock rate
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
 <20260116-v3d-power-management-v3-1-4e1874e81dd6@igalia.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20260116-v3d-power-management-v3-1-4e1874e81dd6@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 16/01/2026 17:19, Maíra Canal wrote:
> Remove the `maximize` infrastructure and don't set `minimize` for the
> V3D clock, giving consumers full control over its rate.
>
> On some firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
> actually power off the clock. To achieve meaningful power consumption
> reduction, consumers need to set the clock rate to minimum before
> disabling it. Forcing the clock to maximum rate in the clock framework
> prevents this, as consumers don't have any flexibility over the clock
> rate.
>
> This change enables the v3d driver to control the clock rate directly
> in its suspend/resume callbacks.

Acked-by: Melissa Wen <mwen@igalia.com>

>
> Fixes: 6526402b9bac ("clk: bcm: rpi: Maximize V3D clock")
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/clk/bcm/clk-raspberrypi.c | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
> index 1a9162f0ae31e330c46f6eafdd00350599b0eede..9783385d5859836898683209e320fcc928dfdc71 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -68,7 +68,6 @@ struct raspberrypi_clk_variant {
>   	char		*clkdev;
>   	unsigned long	min_rate;
>   	bool		minimize;
> -	bool		maximize;
>   	u32		flags;
>   };
>   
> @@ -136,7 +135,6 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
>   	},
>   	[RPI_FIRMWARE_V3D_CLK_ID] = {
>   		.export = true,
> -		.maximize = true,
>   	},
>   	[RPI_FIRMWARE_PIXEL_CLK_ID] = {
>   		.export = true,
> @@ -387,9 +385,6 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
>   		}
>   	}
>   
> -	if (variant->maximize)
> -		variant->min_rate = max_rate;
> -
>   	if (variant->min_rate) {
>   		unsigned long rate;
>   
>

