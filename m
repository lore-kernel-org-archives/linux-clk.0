Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03738147C86;
	Thu, 11 Apr 2024 11:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712834100; cv=none; b=eyJWprqsjJOQu/TLRVA3BnMhCVipjsmZpr3nT+uz7MacYjJ7cIXnrvACiUiEdxcaXXWkl4wh+eeE0ElhFg11bOjwjyu1EMk1vQhmXvaf93HvlQO7+MlC5FOBNnqz51FhXJR8K/7ohss4fvFcsNB6VE3zDLayG/jffl6Ryle51DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712834100; c=relaxed/simple;
	bh=1Wio06GCDmmgIyhqZ2kYvHa+VRTbVW1+zV+94cMb37I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LMV/iE6E/CWdLtpM7BSxlhUAAxuXORNFXE/fpNDEwsKY0BdAtO80CbbClTrdxPrFBRS+6/Na0J4EAHj1jmeLCybCVmJwMFMAMPBtVKSu4egudVluWdmG+Ju1grocCMQr9OuCaZVyL46te2FIZT2hmZjqk0XuhbYQhSPkIJkgKeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UWwrN4Gu; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UWwrN4Gu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712834096;
	bh=1Wio06GCDmmgIyhqZ2kYvHa+VRTbVW1+zV+94cMb37I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UWwrN4Gu1AJd4b5fra8ol6VHShmnABQYE1fUZoUfCZVysjvRU3YThO8Ya59pIXG0T
	 /1JoQHBMq6QcQWosUXcKhnZ+AJCIDK/HYnuotFtxWJpF5fiibUXDI3Dk15R7buOYUj
	 2Y99BJMBBOZ7h7iRpUrwFAwUNPdC4NKDzYEW5MDtCK0EM6abrQEgFtxKcsSXS4vh0u
	 IhoRGkvc7wQMV4JxWhfJatBile7a1wdBlWY/LVDpBnoONwqY1dpjEhWbXQacRnULuS
	 T/lhDbLbkenkjLLwJIAHZ1jE8Ko/YeucjDRNMLZJ1yZCsN3+xVxHQCKYz22aJ7onun
	 ou+fNiYRsAdOw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D0A333780BFE;
	Thu, 11 Apr 2024 11:14:55 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-clk@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, 
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, nbd@nbd.name, 
 john@phrozen.org, devicetree@vger.kernel.org, dd@embedd.com, 
 catalin.marinas@arm.com, will@kernel.org, upstream@airoha.com, 
 lorenzo.bianconi83@gmail.com
In-Reply-To: <cover.1712399980.git.lorenzo@kernel.org>
References: <cover.1712399980.git.lorenzo@kernel.org>
Subject: Re: (subset) [PATCH v2 0/4] Introduce clock support for Airoha
 EN7581 SoC
Message-Id: <171283409577.156755.4799825842114274746.b4-ty@collabora.com>
Date: Thu, 11 Apr 2024 13:14:55 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sat, 06 Apr 2024 12:43:40 +0200, Lorenzo Bianconi wrote:
> this series is based on the following series:
> https://patchwork.kernel.org/project/linux-arm-kernel/cover/cover.1709975956.git.lorenzo@kernel.org/
> 
> Changes since v1:
> - add .enable()/disable() callbacks to pcie ops
> - introduce en_clk_soc_data data structure in order to define multiple clk_ops
>   for each supported SoC
> - rename clock node from system-controller to clock-controller
> - add missing item descriptions in dt-binding
> 
> [...]

Applied to v6.9-next/dts64, thanks!

[2/4] arm64: dts: airoha: Add EN7581 clock node
      commit: 1dd2e7b97c3c8554f3339397ef6656d90af3ae1d

Cheers,
Angelo


