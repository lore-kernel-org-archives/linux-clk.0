Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9D143AC3;
	Mon, 20 May 2024 09:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716198437; cv=none; b=JDKTf24zN5/R2v551tnJW8XEjid+32MwYLC1agSMG2Zv36s1fwrY0+jcM8q5BdrVdbaNc+wh2m0SuvXpAbnAP+zx09Jw1Fr9WpLEH4dNf1AfkvZXseR0ej2aDl+Bec+WtQv0N/c+MLpe40r4WOC39luui/2cyF03vCSdXOJIHE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716198437; c=relaxed/simple;
	bh=GDN0xtEiHNDbdJ5kosY4UN0gJVL08Jafz1DkF3NTeFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJhw3/4FIZBEHclYYpUOjjacDZkZcKwhGYxW8123A/Py8ANLlW2zUEP9PiqCgnViwSKysO/JzyTO1V1EY784z1d1Nwy8C8UxblaguoEQiCDp2i3Esy+r2qPR2Wf0UrCCXlywjuJs2x/nVcMv2XE3Orf0IvOcWp3nr9Y/uPSm8Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mN7qpwM4; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mN7qpwM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716198434;
	bh=GDN0xtEiHNDbdJ5kosY4UN0gJVL08Jafz1DkF3NTeFQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mN7qpwM4jnqdrFTRxfbh6vKWxwLlPvNep/2hd/UG/Jx7QUKAXXI8nrxABZJq8kShd
	 4roLTMrF2F+8tR7keij/GEcUWYvlx46kTk6rLhlVkrSRSRWXrGrNVEq1g7sTuOnG7K
	 O/s6QP5CguJduUWOjkzFXgS93du7zedTwXKmZ4QTTPMZUkxs3kpcAZc3Ub/Bgnldt2
	 iUS9+ltI9PNJsVAAoBhhQ+j1ke3itijGOiEc6UfIIyjfUBYVoFJqvOyIrN5xmZn6F+
	 DvSj3qI8pynWmSp7ZsTZpnbRPrAz/8EAdzKiAEhkw7QMpwvv5ztCqzIFEqICZY7AwO
	 Ua1WyKuFXgOTw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 18F50378218E;
	Mon, 20 May 2024 09:47:13 +0000 (UTC)
Message-ID: <a9d0da82-844e-4542-bba4-7d75abab0a34@collabora.com>
Date: Mon, 20 May 2024 11:47:12 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: airoha: Add reset-controller support
 to EN7581 clock node
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-clk@vger.kernel.org
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 lorenzo.bianconi83@gmail.com, conor@kernel.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, nbd@nbd.name, john@phrozen.org, dd@embedd.com,
 catalin.marinas@arm.com, will@kernel.org, upstream@airoha.com
References: <cover.1715948628.git.lorenzo@kernel.org>
 <f4d0c98cc67cf6b299e685052e8737dc500c8b25.1715948628.git.lorenzo@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <f4d0c98cc67cf6b299e685052e8737dc500c8b25.1715948628.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 17/05/24 14:28, Lorenzo Bianconi ha scritto:
> Introduce reset capability to scuclk clock-controller device-tree node
> for EN7581 SoC.
> 
> Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


