Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895143E834A;
	Sat, 16 May 2026 16:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778950727; cv=none; b=LCtD/OIvrirbXta9a/RWemj6WTQj52ovOwt2sYuYHOTJjQ3X68CjN+OJjjdielOnEpXHY5TMGEybUH0S+s7iufQqv3OaDtRlT5jk0fLrNnHxlKkV2aIpOJMTTp9zTErvyUNkhxNBInVNl/llepzfjGFTZF7/h9WsSD+fdj4WkC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778950727; c=relaxed/simple;
	bh=+E8EJPXozDcy2NNnHsVVm0V6uHV7LCuprw6o1vwgkTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e2gTzsFZwQSZaTBsdnciQPsJSnUfSCizPmIgpyp2QvT7IP20OWIzjUp4gZ6yFZHnP+4NYTrSfydIkzF1FNAZCs/C+3CIhIMtPVb4ePGrI294PwYPMC4o2DcU3OG/zql3gOTTcAWwp6wC8RCqXIMRe0PGg8mfG8OYZgYgyBnaqyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A416AC19425;
	Sat, 16 May 2026 16:58:43 +0000 (UTC)
Message-ID: <e688a26c-c858-4a21-8247-b42bbfb1dec1@tuxon.dev>
Date: Sat, 16 May 2026 19:58:41 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Update gmac clocks and devicetree for sam9x7 mpu
To: Mihai Sain <mihai.sain@microchip.com>, mturquette@baylibre.com,
 sboyd@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, varshini.rajendran@microchip.com,
 cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 ryan.wanner@microchip.com
References: <20260309075329.1528-1-mihai.sain@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260309075329.1528-1-mihai.sain@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/9/26 09:53, Mihai Sain wrote:
> Mihai Sain (4):
>    clk: at91: sam9x7: Remove gmac peripheral clock with ID 67
>    clk: at91: sam9x7: Rename macb0_clk to gmac_clk

Applied to clk-microchip, thanks!

>    clk: at91: sam9x7: Fix gmac_gclk clock definition

Applied to clk-microchip-fixes, thanks!

>    ARM: dts: microchip: sam9x7: fix GMAC clock configuration

Applied to at91-fixes, thanks!
