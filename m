Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D46A3C3420
	for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 12:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776083384; cv=none; b=LljilQs1H8JqFzji02qvh5Ha0tpjTwzdBMTNZAxeY95FpMDsxaoK6oqM4+Vz/nnsdcLJXtdCAnY0uA0ln5l93nWotLO3tS2t7xMKlX0mCFyB2xzfZU/rmnf8H+EaAibIRs+mf5t+dO0IFIZCF/b4l6carjqxwMnpC1E99q9Ba6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776083384; c=relaxed/simple;
	bh=6Zfgby0cOpUu0h6XGPUoh1JZOpiNBDKAVsy5oJ6EO0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J7BuCo7g53Wx/hksLdr3wMTQ1dSoj7tWDA6jvj+G6iIN58fiwVALXZLe+Sc8RSriWmI1IlkOZHRJfXJkfQ6JvdkCHFWXJXBXHx2kns8SFbUWCdpeYPh1gq5B0gFkOXXKFyt4u3JPRmky/RFQezy0tJjyrfjnas+tSF4zQL/w55Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=QsVW+pzP; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="QsVW+pzP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Dy7+J3Nmv3CmyBjyZLXnfY++J8xerQl5T/d1Q6AZ1bc=; b=QsVW+pzP/fktEna0S7j0QJmrsJ
	Sv/GgoChbT8MctDEWJs9+NCQTEW7i8Ofq5fjZY1k7vTrit6euX57QMT32YEozT7MBnsNXJQjOYPr7
	9XUFtLXPhZuBVoGXuIzfV0kYtDpl7ia5PGW7t7Fv6gaQAKZ5TuaCqVCqg5+BvfsuT4S/pETS75Q0Z
	O3tPbSqmVt514KwYuB2YO+rHO1umNrJVgOhYuLxNjI9/fwrB0oABm+56snVkVHRhVYKrcBANu7UdH
	KR8o7nnICXyaVsXXOHEQbcm4eAMizg+7eOdZX3/WFO8KPTHnDISgKXbVM4aoK+CptywUTRPAQ8f+W
	U9S/D1YQ==;
Received: from gwsc.sc.usp.br ([143.107.225.16] helo=[172.24.27.208])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wCGPx-00FOp1-Pk; Mon, 13 Apr 2026 14:29:30 +0200
Message-ID: <b5ab4741-1300-4a43-b491-2b73e052eed0@igalia.com>
Date: Mon, 13 Apr 2026 09:29:24 -0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: bcm: rpi: Mark VEC clock as CLK_IGNORE_UNUSED
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Stefan Wahren <wahrenst@gmx.net>,
 Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel-dev@igalia.com
References: <20260401111416.562279-2-mcanal@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <20260401111416.562279-2-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stephen,

It would be great to land this patch in the next release together with
commit 672299736af6 ("clk: bcm: rpi: Manage clock rate in prepare/
unprepare callbacks"). When possible, could you take a look at it?

Best regards,
- Maíra

On 4/1/26 08:13, Maíra Canal wrote:
> On Raspberry Pi 3B, the VEC clock is used by the VideoCore firmware
> display driver, which remains active until the vc4 driver loads and
> sends NOTIFY_DISPLAY_DONE. If this clock is disabled during boot, a bus
> lockup happens and the firmware becomes unresponsive, causing a complete
> system lockup.
> 
> Mark the VEC clock with CLK_IGNORE_UNUSED so it survives the unused
> clock disablement and remains available until the vc4 driver takes over
> display management.
> 
> Fixes: 672299736af6 ("clk: bcm: rpi: Manage clock rate in prepare/unprepare callbacks")
> Reported-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/clk/bcm/clk-raspberrypi.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
> index df2d246eb6ef..f1a99de6de4f 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -160,6 +160,13 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
>   	[RPI_FIRMWARE_VEC_CLK_ID] = {
>   		.export = true,
>   		.minimize = true,
> +
> +		/*
> +		 * If this clock is disabled during boot, it causes a bus
> +		 * lockup in RPi 3B. Therefore, make sure it's left enabled
> +		 * during boot.
> +		 */
> +		.flags = CLK_IGNORE_UNUSED,
>   	},
>   	[RPI_FIRMWARE_DISP_CLK_ID] = {
>   		.export = true,

