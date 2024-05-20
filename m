Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD43243AC0;
	Mon, 20 May 2024 09:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716198436; cv=none; b=B9lcug5Fvje03tM9P3ar1AjnD+zJzV6wRMWDS86w1Roil3rcFam9uyoujp4eaxLnyhEy5O/wAir8Zv3rb3WxTcmrHevNNv7HBDD2cKNtVPgSc+UyvTu+Gio3KQjlV4J0YtyI1Xe8Ek0q/K790SZkfSiDqKeMkLYc7mrhZ4PBlME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716198436; c=relaxed/simple;
	bh=z6L9Up/vc/JzAq3WJ8Pd2qq7gNVGuAorYS/WUMcSFAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=olsmDGFxqlFEuKIGnUA7fHZ/LXDcxKnfzqbPFYTm06zzrO0coLdcQueYRK5wnAScCKme079cTAcHIf/hJHj76xC04cmlYT6VjaibVwTWY1ucHRoIDFzCYFiyr1hjCEeiOjaAXEUZfON64gv3a4LxISC2UXgN+FBv1uN9memhNDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PQrrz3HH; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PQrrz3HH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716198432;
	bh=z6L9Up/vc/JzAq3WJ8Pd2qq7gNVGuAorYS/WUMcSFAY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PQrrz3HHiOaBXYfFFHIL4VebuLhQmXs/VNqmwUVwTwuZ0Sy9laH+LZh4miHRb3XDo
	 b025OYLzHp/I8cbjnqhWiSg2RmA6n0K4SzhI9NAX9qmnhB5htwc0k7ynC6eC9Slg5d
	 i5FIPJ9VvSYX4PIplD3T/Df6UG9GL0Z6G7uCgvcpLpQcbUiZ/QvRDVh3ndo5c6vJB+
	 6fxKoPAv4szsPhbQUwyUGVADLQ4hxPyvU36c1tBsXYkqkiJWCv4z5u555geNQ71HgR
	 kyyQFWOwAZy62vNNKCw4b+p/lNNybUnrG9feIWBcYfOEMbPTaYB/x3BTc4sXGrZzgs
	 TYErMXcxJG28A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BFAE037820CD;
	Mon, 20 May 2024 09:47:11 +0000 (UTC)
Message-ID: <9f11dad7-164d-4bbe-846a-9915c21e5157@collabora.com>
Date: Mon, 20 May 2024 11:47:11 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: en7523: Add reset-controller support for
 EN7581 SoC
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-clk@vger.kernel.org
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 lorenzo.bianconi83@gmail.com, conor@kernel.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, nbd@nbd.name, john@phrozen.org, dd@embedd.com,
 catalin.marinas@arm.com, will@kernel.org, upstream@airoha.com
References: <cover.1715948628.git.lorenzo@kernel.org>
 <c3792ad7f8b6fabaec42efa4bb429582278aae26.1715948628.git.lorenzo@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <c3792ad7f8b6fabaec42efa4bb429582278aae26.1715948628.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 17/05/24 14:28, Lorenzo Bianconi ha scritto:
> Introduce reset API support to EN7581 clock driver.
> 
> Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


