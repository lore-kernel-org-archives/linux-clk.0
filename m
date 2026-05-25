Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0929A3E5A0A;
	Mon, 25 May 2026 08:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698769; cv=none; b=kHEy0Xu9Gs3g7HSN1xOI+0bCVpfGh1gOKBpIYbm9zY7MDMMZbRtTDK28UFQ1oU9TKBtX67KfRquuDGFAIOGLKTaKG2HdLmuq/gGBLDfCE7T/ZdXgOgS+iwblVu9pifFXhy0T1lNiHwiG7eO7hhUHDTGF4pw0gmYVziM40z25HVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698769; c=relaxed/simple;
	bh=G9Tat5XVlt3hSUrqlBT9oU7ZJpYohFdZokySMUaIDIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VI6UuqL7pVAxsfQthq0ZPwoeBQbXzcDCJmftxVDdpYhGMXy70Mv7sxDG1Fzng4CwTjNrU5EXEFyGz1FpbJa2bzOAJKtrLsEG0q2Yey9u9sfugxjo6VyE2XvpkxCid3Gc7TGbdg/FxWEJbPmxr+RgtE088lYnrR5dyPXhcLdyRDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SEPybhqM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SEPybhqM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779698766;
	bh=G9Tat5XVlt3hSUrqlBT9oU7ZJpYohFdZokySMUaIDIc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SEPybhqMb7/lv52S+LVmFGv3hBCKyhqYfsnBmONXkFqYIKPvVkvPRNQoZFL8anlzV
	 Y1hqBJfSyYsfNSip+7BJcmK7QwaG9JNPVIFb1Gq5J09QVYcTaAk/j7lNw6KPUpwuet
	 bbeQl+oLDTDknbl7Muy6sKCicTMGsU37K02KFBSv+gH7TosQytPRmtFpb+xIVfpUqJ
	 vP3lmlMtv60LT9/0DvIC+SDzDgUUBBnEBgH5QEP/MEoo2tNLveve13CXErtmo1HQqU
	 EVqP+9ICWwy5blUa9i3EPrJzDJ9NWgKgq/G3gJmFnLxAE0iUK5cH/nrmAfyixovqa3
	 cJVia8ZjQdtgw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5E05D17E0CAC;
	Mon, 25 May 2026 10:46:05 +0200 (CEST)
Message-ID: <1b430dea-6d84-4ba5-845f-bdea1c0fa569@collabora.com>
Date: Mon, 25 May 2026 10:46:05 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: mt8196: Select REGMAP_MMIO for vlpckgen
To: Akari Tsuyukusa <akkun11.open@gmail.com>, mturquette@baylibre.com,
 sboyd@kernel.org, bmasney@redhat.com, matthias.bgg@gmail.com,
 wenst@chromium.org, laura.nao@collabora.com
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
References: <20260522133023.355404-1-akkun11.open@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260522133023.355404-1-akkun11.open@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/22/26 15:30, Akari Tsuyukusa wrote:
> The MediaTek MT8196 vlpckgen clock driver uses
> __devm_regmap_init_mmio_clk() by devm_regmap_init_mmio(),
> which is defined in drivers/base/regmap/regmap-mmio.c.
> However, the driver's Kconfig entry does not select REGMAP_MMIO.
> This causes a linker error when REGMAP_MMIO is not enabled.
> 
> Fix this by selecting REGMAP_MMIO in the Kconfig entry.
> 
> Fixes: 2f8b3ae6f0cb ("clk: mediatek: Add MT8196 vlpckgen clock support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/clk/mediatek/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 2c09fd729bab..fd8440122ec2 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -1006,6 +1006,7 @@ config COMMON_CLK_MT8196
>   	tristate "Clock driver for MediaTek MT8196"
>   	depends on ARM64 || COMPILE_TEST
>   	select COMMON_CLK_MEDIATEK
> +	select REGMAP_MMIO
>   	default ARCH_MEDIATEK
>   	help
>   	  This driver supports MediaTek MT8196 basic clocks.

