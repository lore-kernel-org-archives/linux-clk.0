Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E65921D3F6;
	Mon, 24 Nov 2025 08:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763974032; cv=none; b=R6XjH5VFHzlbC2fRiJDTyVdsnSmXFgEEsIu/YQNup38QSG6NrHR5t6ekaRK/uac2a1AFoMSldE+kfb1l/MoM2DjHgZEsI2muRGzHmqUGCjassgRoxxuqA0Bz6BzoGs+suMjqhSSb520Vi0Uuu76W/lngFY2jBPS8ALbeqSSI3LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763974032; c=relaxed/simple;
	bh=Lh/Fvv6yUxE9thBp9vYaxzBuy27oKjRvkalfxWUJRGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aa+Ju8UvpFT4Pc3OlvMK3wiZoUf8Ci1a+flyaYwaFjU/tQqGdNf1HaoFJ0uFy31qrqXjHdtfH4grUwHyywRp9Ok/wsZQVFUuqGHWxU0y3YzBOQBVkPPf1h90X6CrxV500gfWVNieGCxn/STe0Clm1qkzGOqILS2jXVnO18YyZ9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Yju8eTl0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Yju8eTl0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763974021;
	bh=Lh/Fvv6yUxE9thBp9vYaxzBuy27oKjRvkalfxWUJRGM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yju8eTl02ktUwBS3epbE6CWaJ2t86j+NXq+KOFwYDhYNBPGqG9yQuus5P4S0g7OXG
	 QZncMgYs1Eb2yVbwxIg7RjdRzzYIpTH7r8cBqc+OhyyWNDd0zAx1funsaNgvOah4uh
	 3PBWBiMEOsaggJHjnp5jocu90zp7TVCfyL+Q8SF1s+cNMRnDdrUa7SyiXXAhimgn3d
	 xDFy3njJPRyuR+jU5I47vg6dr0Kj9hE0URDMw8oUQ9LlUWzwb9/TG7g6dXumsMtkAr
	 Sdy34LoNt8JxYmPrA9sbwYWHctNvjtWOAK7P3NEmozgbpwUCxwFeErcsb0iLdcEvhT
	 vQicr/3uc7LFg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5AC9617E1123;
	Mon, 24 Nov 2025 09:47:01 +0100 (CET)
Message-ID: <402f3df4-15e7-4903-ab27-fe80be609073@collabora.com>
Date: Mon, 24 Nov 2025 09:47:00 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: Fix error handling in runtime PM setup
To: Haotian Zhang <vulab@iscas.ac.cn>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com
Cc: nfraprado@collabora.com, laura.nao@collabora.com, wenst@chromium.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20251123154315.1564-1-vulab@iscas.ac.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251123154315.1564-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 23/11/25 16:43, Haotian Zhang ha scritto:
> devm_pm_runtime_enable() can fail due to memory allocation. The current
> code ignores its return value, and when pm_runtime_resume_and_get() fails,
> it returns directly without unmapping the shared_io region.
> 
> Add error handling for devm_pm_runtime_enable(). Reorder cleanup labels
> to properly unmap shared_io on pm_runtime_resume_and_get() failure.
> 
> Fixes: 2f7b1d8b5505 ("clk: mediatek: Do a runtime PM get on controllers during probe")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


