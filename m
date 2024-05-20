Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D32D433C2;
	Mon, 20 May 2024 09:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716198439; cv=none; b=Xr43f6wh+pwRsoQYnmwiIozdIwa6SD+NP1qci2/zM14hjvOwI8SC0HK9dqYRTbsEnUnoJ/YQPEbUPhoh6RdGhomCIVkqxti6+GZtyjp/Z3/9IEKE6v7huHMDnZumiWY0ujy5rF2n7YHIGMX3ay3sW6/A964rPueSU3mlvZ/DfqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716198439; c=relaxed/simple;
	bh=QS/4yx7usFdwTKWQvTuwXqgUlCZYHPUOUavgi0BvK74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NYXWxM8sWnB4qJuzvmI2/ohBUOn8Gun+JBI2GlTh+sjU4mYGqcqxDltWUAOx5wPSPKZ0LaGobTmvQz2mNIvBTVmddaRYcul3vKkTkSdHFY5R/tp/5fewejJ9uqjJpTEc5vaPL37XhYvygGyEWxaKdOpaR7ZTHvTLm5TLhwtauNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FC+i2898; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FC+i2898"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716198435;
	bh=QS/4yx7usFdwTKWQvTuwXqgUlCZYHPUOUavgi0BvK74=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FC+i2898dB+gLaVDYZFYl7bTP7Ds9pNmChgtam9JbN5bn1gv4cMCDsl/dYkbtJRuU
	 y2Nyy8nZ1LJJvfVGKh1Rp69SboyY2IEpIxvsFmR5CsGy1rt6VRSYZVmiKR0Dcu2dtw
	 MaG6e+ihUdm3xwhA89j9NbYTmG5KC2NgkvBOnLo9rP2QKIcQSNeAy0Z6nJB568niL6
	 2X146OP2uWQX3fBr5tIH3Pt3A8HMqP3kXpHVUznGejOoSckTQk6aHiJ0BT3nR2mgfR
	 39G9x4bZn1/czMht4LGlTQuj2XlR8QUQxJBo9xtA+V4wMzB4NvFJEzvgRajrRjtiUB
	 QuCt2gzZwWaOQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5E9F13782191;
	Mon, 20 May 2024 09:47:14 +0000 (UTC)
Message-ID: <4bc0dbe5-19aa-42b9-af6d-328fc8be1cb6@collabora.com>
Date: Mon, 20 May 2024 11:47:14 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: airoha: Add reset support to
 EN7581 clock binding
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-clk@vger.kernel.org
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 lorenzo.bianconi83@gmail.com, conor@kernel.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, nbd@nbd.name, john@phrozen.org, dd@embedd.com,
 catalin.marinas@arm.com, will@kernel.org, upstream@airoha.com
References: <cover.1715948628.git.lorenzo@kernel.org>
 <2d8906a2aaeb4d80eaa6d06472735ed79c7c24f9.1715948628.git.lorenzo@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2d8906a2aaeb4d80eaa6d06472735ed79c7c24f9.1715948628.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 17/05/24 14:28, Lorenzo Bianconi ha scritto:
> Introduce reset capability to EN7581 device-tree clock binding
> documentation.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


