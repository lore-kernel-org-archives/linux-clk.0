Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0766A4D8C3
	for <linux-clk@vger.kernel.org>; Thu, 27 Jun 2024 09:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719480918; cv=none; b=I25EhAVpjqXJ9JVbE+SK5YvQOWkN0YN4cRhzk5Vv/jA6w22wEQU2ti2Agn5pAprogoRtwthTqLhiHhfgN0AX1XdFLTYp2Vp0QKgdHuGTFQ0tKpNYz0fv/0yEmytcCCVyt1YK+nYXwlgCllok88SM0k/uisY6FF3KnPSXL3X0TUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719480918; c=relaxed/simple;
	bh=ij2r1X23h0fQBRYPId2Vih2dfyqZLJYaJ4wvQNOnom0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+wgkjgdUaKvoX20WPoSt6Tg7w4u7DRRQIekko/ZXrYTiIPwL7jabVIPqZzkWFLAhFIyHq9IPs8eb4rBbyqxy1/yUtvKIOai0pmiJZRozT7N5zajuxU7SgBZftkOvXFEsPXLRQC4CEN9l1sUz78ohaKlYEhsRqwlVEVyR4RUsKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qiGZqRjl; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qiGZqRjl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719480915;
	bh=ij2r1X23h0fQBRYPId2Vih2dfyqZLJYaJ4wvQNOnom0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qiGZqRjlhefesMryoosZJZKRj+hAifrg5iBXfC/EU4VmxG6K/svlyrnPHNMa/ze+J
	 gUBAaFMNFMXIO+p3jLK75LdXPOVnPknXqcIs/3KdhFKCStTiJCfKPgQ48rYDq9oxtK
	 XcGwVsIlE7+v7HiQx55vVnbUXlualrFw9r8ZFvr/MinXsdv35ZfJ5gPpIo3fvDSd6T
	 VFlnBoU5WVFwfWEMDkiU5PwXGmDSy91jU/JvxZxhMEuvvpGGljbn8pXFHS1CPFVg7h
	 1mKOQZBUCWRAWLE5vbjcDIA+U4cIWMmNSSQNoYb84loC0D92Da4GVyW+q1tI6gsFtd
	 vNvZ5JJRMK0FA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CE72D378211B;
	Thu, 27 Jun 2024 09:35:14 +0000 (UTC)
Message-ID: <e9357391-fc94-49df-8137-eb1c5e0e3c33@collabora.com>
Date: Thu, 27 Jun 2024 11:35:14 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: en7523: fix rate divider for slic and spi clocks
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-clk@vger.kernel.org
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 lorenzo.bianconi83@gmail.com, linux-arm-kernel@lists.infradead.org,
 nbd@nbd.name, john@phrozen.org, upstream@airoha.com
References: <c491bdea05d847f1f1294b94f14725d292eb95d0.1718615934.git.lorenzo@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <c491bdea05d847f1f1294b94f14725d292eb95d0.1718615934.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 17/06/24 11:25, Lorenzo Bianconi ha scritto:
> Introduce div_offset field in en_clk_desc struct in order to fix rate
> divider estimation in en7523_get_div routine for slic and spi fixed
> rate clocks.
> Moreover, fix base_shift for crypto clock.
> 
> Fixes: 1e6273179190 ("clk: en7523: Add clock driver for Airoha EN7523 SoC")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


