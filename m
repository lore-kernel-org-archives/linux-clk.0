Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276C92E3F2;
	Thu, 27 Jun 2024 09:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719480723; cv=none; b=b0cayuHI/Du/mJGCra465Ir7oHAOIAPtNuVWR+Bs5Hxj5nhmb1456QEj/lnlmv/6otB+ecRTxT8/2fY2quNaFgiVVACvPN8lYtwxFg4aPWXNd7p5PtfOHpUJP9gKYCUWIfu9+SCyWk6XBT8fIiDfKpnF3PUHZ1iQObOnDl4Avyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719480723; c=relaxed/simple;
	bh=TY/JIoC6ugiSt1vh1S1LiiWPH2kBv0+KbHABX4i++dE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I7bf9GdkQYxRSYFhnVYz8+qIYPpLos9IPNWaWRYY3eTEZfcyVSuLJkeyxTCDvIH7mR+dEs9KQxKxxgtjem0gr0UnZeYDbu4SVrCEZemEy0Q0X/TsTQ9hySXTiTBmp7dbgMkxl2lC2HjfNfHzO1aYQ4HQj4tYToKV344ObNtU+DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nZMPD7nd; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nZMPD7nd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719480720;
	bh=TY/JIoC6ugiSt1vh1S1LiiWPH2kBv0+KbHABX4i++dE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nZMPD7ndRXIGEFR1FqnItQPbMNXRDG2/Ig9YF7Krz9UtdsKYF85eM4YcpymoJj3Jt
	 yQA3vG/NnVtLZfqjINEOE7scRnjiDvzAPtmlNtZcwr2VTramllR62TpZZvjcd8taSk
	 IfewdyNHZgKnyRKY6IQEh7TSM4Z0r1mveSR3Mw4EQN0oW38lti+P4LDkG5sDgKhfqq
	 FrmQsHsCVNnf7GaCFJMVArcBA4PwlMrcc3dFnh1L10Sa+UqrBB7tjy9eN6uswZS4SM
	 752G6cD+Q/vYWuCqU2Mh7kzZK8Ceo8Wb7EoEgK58/JHTuK2rvMMRbOqXQt1cDHeZNc
	 sBcdSNtkBdVag==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C3EC237810CD;
	Thu, 27 Jun 2024 09:31:59 +0000 (UTC)
Message-ID: <b866c259-e547-40fd-8cbc-365182f90a78@collabora.com>
Date: Thu, 27 Jun 2024 11:31:59 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] clk: en7523: remove pcie reset open drain
 configuration for EN7581
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-clk@vger.kernel.org
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 lorenzo.bianconi83@gmail.com, conor@kernel.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, nbd@nbd.name, john@phrozen.org, dd@embedd.com,
 catalin.marinas@arm.com, will@kernel.org, upstream@airoha.com
References: <cover.1718282056.git.lorenzo@kernel.org>
 <af02d142d069015376506dd05215f30f0606039f.1718282056.git.lorenzo@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <af02d142d069015376506dd05215f30f0606039f.1718282056.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 13/06/24 14:47, Lorenzo Bianconi ha scritto:
> PCIE reset open drain configuration will be managed by pinctrl driver.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


