Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F201143873;
	Thu, 16 May 2024 09:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715853042; cv=none; b=OEMXuMMXCXxse6XDJLObxa/fx1nQwo0PnMHqQGk6FvOoCuk9Q8ZBMASwAT4Dh5ZgGbYJmLYXp1JGffXoBEXKwcNHU9VWET5vGz9hrohfdkvmGmtwaIR00AtA1pvQh2fCZnLv7tsRnAjRXhvwZUY6oyM4e2rKlPaWN2Pm/OJfmDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715853042; c=relaxed/simple;
	bh=z9sYBN1GXOQTKyqZZ1nZmU2g6DHXGrqMOoKhcIqWs9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EpMTIZ/jVpnh7N3zni0TYht2H+LW3lyZxll2wrl8kzWOrD6WcFWt4fKYrd1fuXgtpwNDeV2++uLWLIAqtMOPCGt/znO7hTkG4ldVc76s/w8kGSPrtphpVvQ7e4U8JqbNNEbvCfYLpA3Gv+rha9Xna0h9yIC53XG4XrpsNlNtwIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=N4BZ0Brn; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="N4BZ0Brn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715853039;
	bh=z9sYBN1GXOQTKyqZZ1nZmU2g6DHXGrqMOoKhcIqWs9U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N4BZ0BrnTU64m908PNEC9vWiCMjdDCndeqUw+l8ur6HNGpOdzEl+pxK+tQRi59Xl7
	 i9tG7iCQ/WD2FzNHd1pqaNKB7OJAAcCg1P3173/V6X1kyFOpkSodBQpO4vmFLcLGCj
	 iXI1QZa/AVIgZfZg6LBnG55wqploUjH3gjnQM/DOid71XaLscezGRxIjBKjeEAATpY
	 SZraOjqOHWHMwdubz94cjhh87HHQT/o/Rv/pPiVARTm+ZU308LI+6lsJ1Becut+QjZ
	 UzlSh7MKY8qR7bjNM5LGWc6cyB2Xf/4+2AJ7LqTzti7XjEjK2SpqoJqOaf1xGNIOto
	 Z4mZNTt5We7rA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 427AD37821A9;
	Thu, 16 May 2024 09:50:38 +0000 (UTC)
Message-ID: <97b1fbfc-e059-46c7-9bb1-75cdaa2d2159@collabora.com>
Date: Thu, 16 May 2024 11:50:37 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: en7523: Add reset-controller support for EN7581
 SoC
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-clk@vger.kernel.org
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 lorenzo.bianconi83@gmail.com, conor@kernel.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, nbd@nbd.name, john@phrozen.org, dd@embedd.com,
 catalin.marinas@arm.com, will@kernel.org, upstream@airoha.com
References: <cover.1715777643.git.lorenzo@kernel.org>
 <0f7b04c2101db1a974dc45017bee285ffb25d80f.1715777643.git.lorenzo@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <0f7b04c2101db1a974dc45017bee285ffb25d80f.1715777643.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 15/05/24 14:58, Lorenzo Bianconi ha scritto:
> Introduce reset API support to EN7581 clock driver.
> 
> Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Heh, that's exactly the usual MediaTek reset controller :-D

> ---
>   drivers/clk/clk-en7523.c | 96 +++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 94 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 381605be333f..18798b692b68 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -6,6 +6,7 @@
>   #include <linux/of.h>
>   #include <linux/of_device.h>
>   #include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
>   #include <dt-bindings/clock/en7523-clk.h>
>   
>   #define REG_PCI_CONTROL			0x88
> @@ -65,8 +66,18 @@ struct en_clk_gate {
>   	struct clk_hw hw;
>   };
>   
> +#define RST_NR_PER_BANK		32

Please move this definition at the beginning of this file, grouping that with
the others.

..snip...

> @@ -456,12 +542,14 @@ static int en7523_clk_probe(struct platform_device *pdev)
>   	en7523_register_clocks(&pdev->dev, clk_data, base, np_base);
>   
>   	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> -	if (r)
> +	if (r) {
>   		dev_err(&pdev->dev,
>   			"could not register clock provider: %s: %d\n",
>   			pdev->name, r);
> +		return r;
> +	}
>   
> -	return r;
> +	return en7523_reset_register(&pdev->dev, np_base, soc_data);

If en7523_reset_register fails, you want to call of_clk_del_provider(), so
you can't just return like this...

Cheers,
Angelo

>   }
>   
>   static const struct en_clk_soc_data en7523_data = {
> @@ -480,6 +568,10 @@ static const struct en_clk_soc_data en7581_data = {
>   		.unprepare = en7581_pci_unprepare,
>   		.disable = en7581_pci_disable,
>   	},
> +	.reset_data = {
> +		.base_addr = REG_RESET_CONTROL2,
> +		.n_banks = 2,
> +	},
>   	.hw_init = en7581_clk_hw_init,
>   };
>   



