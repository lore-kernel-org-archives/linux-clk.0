Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A7214293;
	Thu, 16 May 2024 09:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715853104; cv=none; b=tA8ulHI9rCKj2U3fu+bV6YofB66r6jDyZJtaqvHlor6jmihtqyyGzXodDjSkoR5Sw2jDUKwqqxw0yOhGAKfj2SppSurT5PYNVuMz3aOMPmMIuls8oDewio5M641lFYbCgDCobufoGOw8mqdJxlxpyOS/SiQpiXIyed1H3DF0yG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715853104; c=relaxed/simple;
	bh=0aW/ZJWAL54Ox3irduYBONLt8QhfNVL4HCdbv2iUix4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=orS2JrAG0ESCc0iNff3O58DZwWrg1ROimKP/YJDfGpmWYkFRLzu6PKJ23RdqN5NmrsdXoWiWIOlBdlpSsf2xQfzQdHXM/xGsmm4Rl6+PqAzfBX0RKxlT0ApmOh4RXIMyZMBizLiue/eBHiHIw0y+AXDN+aLSZk/PZMGhV5VB3NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hUTsbblX; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hUTsbblX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715853100;
	bh=0aW/ZJWAL54Ox3irduYBONLt8QhfNVL4HCdbv2iUix4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hUTsbblX5xoRIM2J3J8BokKruufY/2FDy7KUR45fcF53eNdHNaeN87L+fGHf6j8ww
	 VKVUOoxEAhR/ymyAXwBzBDPcHtJYOIK1ar4bu0V3uHMrvl8XtMBeV41SZWrXd6PzCh
	 bACS/YzeqIFLAW2pz2i1n7SPHVlH3rdue7b8EBAeEYZBx6woLde10cTaA+bFzOM3vU
	 CN6mGUoEld/s+tyneOW2aTMK8Cx0hgRoX0kWfA+JY1YTzgU/Xx4fY/kCpb5aZtolCw
	 JriK0AVqiMbTM/avw8/WFZLBX1xCvYKYthkCF8PUORruebDCBjhRoSE8/e9V/rE5CY
	 61qSS6rf1yd8w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BEDDD37821AA;
	Thu, 16 May 2024 09:51:39 +0000 (UTC)
Message-ID: <807687b0-5da8-4ea5-a712-d121f5188edf@collabora.com>
Date: Thu, 16 May 2024 11:51:39 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] clk: en7523: Remove pcie prepare/unpreare callbacks
 for EN7581 SoC
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-clk@vger.kernel.org
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 lorenzo.bianconi83@gmail.com, conor@kernel.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, nbd@nbd.name, john@phrozen.org, dd@embedd.com,
 catalin.marinas@arm.com, will@kernel.org, upstream@airoha.com
References: <cover.1715777643.git.lorenzo@kernel.org>
 <92afb628058a31357e0c85ed7e41eed0a780bc0f.1715777643.git.lorenzo@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <92afb628058a31357e0c85ed7e41eed0a780bc0f.1715777643.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 15/05/24 14:58, Lorenzo Bianconi ha scritto:
> Get rid of prepare and unpreare callbacks for PCIe clock since they can
> be modeled as a reset line cosumed by the PCIe driver
> (pcie-mediatek-gen3)
> 
> Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


