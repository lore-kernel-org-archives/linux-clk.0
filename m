Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90579374730;
	Mon, 14 Sep 2026 08:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373774; cv=none; b=eCQWS5V1zfwS47Np1+XbLtbkzOLRiq68rGBRg2w5B7LytA+a5oBuwyeYs6cwggDqLOQ5Xp60WeqfE6Wvbm5/RTEVq/DhGNDdiO3jmR5EXKGj73fK65/I+ENAEQnKS/sidQmLYISYc7uSha+38t9P6BlorVazWDhSkinDrOPpHgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373774; c=relaxed/simple;
	bh=wVOGZOIoAqD9kxg/V5gIB3ga+5nuc8Ne44/nZXD7tYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JYZ0Yxw5Bw0CTdr4gmVMhQw1zAg67+ibZtYjpjCE++v0VrOXf5wIKKhjFD/eIzKvUDH4IuHIpZeoJKSQAebyhwGlGjbgBIoc3zNKEiz2+AptLyZGahBT/reQBCzNsaS5GPnU42iatpPtvKORgCJ2JsLXs9/EKUD8BoYtzymrh3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FkB1NNcP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FkB1NNcP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789373771;
	bh=wVOGZOIoAqD9kxg/V5gIB3ga+5nuc8Ne44/nZXD7tYI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FkB1NNcPSaQdSCKxeLfrLHsnDAMpai8mhY09L76wHyr+2PrJMNd/4fULMtGh3lR+r
	 xbqanqYeS3GnPAQPaJDnp8odwhsNxOjryyMKOsz2TbvJBJV3RC068Dmr9yRsjobESa
	 jF6P66B8xMaLdqZQ7XQNMUCx/FVEiFvnIxh95kh37nzvnS5AFk014cP3RrVNmHN+YE
	 TRvuN4b/ooPxsgsont6UHgnQiMmkQZ+6nV4G/s6CttVeIrMvkSDFOxUMVQ/8SE7anE
	 TdH6GI7TS1uUjVQ5BkK4hDQjP9sHNo1W/Fx+zhAfk++IAtpvBTtELbkTRJK3tpeuto
	 lDM8WVHhz9hkQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2443817E020C;
	Mon, 14 Sep 2026 10:16:11 +0200 (CEST)
Message-ID: <88272aca-2a9e-4a75-b7f2-4f7aac8b6d18@collabora.com>
Date: Mon, 14 Sep 2026 10:16:10 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask width
To: Ryan Brue <ryanbrue.dev@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
 <20260912-mt8173-fix-dds-mask-width-v1-2-3d0c0292c85c@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260912-mt8173-fix-dds-mask-width-v1-2-3d0c0292c85c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/26 08:40, Ryan Brue wrote:
> All eight PLLs in mt6795's pllfhs[] have pcwbits = 21, so the FHCTL DDS
> field is bits 20:0, but _FH() declares .dds_mask = GENMASK(21, 0). As on
> MT8173, new_dds from mtk_pll_calc_values() is always 21-bit, so admitting
> bit 21 of FHCTL_MON into the poll in hopping_hw_flow() can only make it
> time out. The same mask feeds the CON1 write-back and fhctl_set_ssc_regs().
> 
> Unlike MT8173 this path has a user: mt6795-sony-xperia-m5.dts switches
> FHCTL on for mainpll, mpll and msdcpll, with SSC.
> 
> Found by inspection while fixing MT8173. I have no MT6795 hardware, so
> this one is untested.
> 
> Fixes: f222a1baec5f ("clk: mediatek: mt6795: Add support for frequency hopping through FHCTL")
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

