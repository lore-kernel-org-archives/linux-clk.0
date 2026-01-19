Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFE636C596
	for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 14:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768831435; cv=none; b=Pl3gkVOjZQVabw4UQ8Yx2NDppDC0zGdyw9SnlOh961Hm+45+YPmCXaEp/41Vgf7A2gWLg5qXv8oUIDHnjb7g6h2TW1+FzmuSjV7Cm5XJ0W/mW4l8uXuxH6lo6MMPylI2G6XFWczawIkh+ywDuogSKvq1aimTCefQqIq7wfW+70c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768831435; c=relaxed/simple;
	bh=mTAE+Uz1BGS1b5G0yeV0TYVfbfqnRu+U7F6kK79xBH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uyhphTfc949Wh9GnDxkTeMMQQZrrjzBsVuVUu+Ke1uLWKcya+0vcPuxWYV35c5P6spbsnlyPxOo28hfPvGG19v5xqhtClYNFWP6wP3V8mhqtLsiKl0CHBGgVVBp1vGFK+8FXMOPvp6tY1NwIMaqLdEdt7aqWN1zmS0w1WWWOpmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oijIVXgQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oijIVXgQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee9817a35so23466755e9.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 06:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768831429; x=1769436229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qi0fMsnbGNNAqeW2KXFtzgi15jKwvRfrQtKC+NHQLH0=;
        b=oijIVXgQ4xqiS2NrmPLq6TR0f50MbnFwamEvVEThd4u5/cgjFxI8Fpocc0jELJE8Un
         wzvavK7XRcjYMvB11KowGsyzSBDjqwkxWPYeBGg3vb6zoCSfcvuvxqk4VvVngzLEblPe
         Q62S41vvzGwYYP/wqJlp2PvMr6Uq10aOT4gO+2lj39uGKOsACT3+oBnNPeH9aB+gErew
         6Km1zv/o/EhoBpzf+u273glZp17hZLZB+jjPOy/FEz2+x3P5WMpUaeehYmsWAK1SxkmZ
         YTV1PyclP+6opjHTt9Y/AsH4McuFDDSi78LsqpYdLxP6EuyYphQB1hlB245BmCzbm8zu
         gXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768831429; x=1769436229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qi0fMsnbGNNAqeW2KXFtzgi15jKwvRfrQtKC+NHQLH0=;
        b=LGQHkxAlzC8hKRChtmPBUMIg8mpzUQVgTc6JZFmnPgY6AdrpEtcL6DqW2L4h5ayxW8
         3EOxwsJLBrmF0PMa6IayHY8pqXCSuWM6mCi2doKMYQuGN2hHWWMyjx5AfzTkDDwVi9eB
         w4Ez6sWuFw2K9BOgbOxfovnY+hJJPxEWW/KXxSUHkkXyKJEK2jWxEsgMvB2BEU95Zt2q
         xXS4G8YiK6R/Yq8cMXaLMjDSTiZumNyBtTlC1kEmT6w3uyzXlnZ8iaTztzND8e/VMC1n
         zggfDPSQHxOI1eazQKz3FhL5BNW1AlwFuPIKUawBVaJYTCKjmDGVutPTg/k6mopr8def
         sx9w==
X-Forwarded-Encrypted: i=1; AJvYcCX4erfCpizle1INClbCvJnhUMkR1B4MBTk92UPPYpptEsVHuBdzm0F5XBRsVMVWHgytF+FiQr78QTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdCsGTc8PiuEEFu+rqGw+Clr1DyHtAsJZsk86KJq9WKh/daUeQ
	lNjtYR4lkMoP5zRRXdiZTnBbETKTqk9vR/vC00sQ7zsa0eEJOkM4xXkBAVvCQvVRXjI=
X-Gm-Gg: AY/fxX6Att3VdgQjHVq7UO4Fg1FD+WxuaBSy9XTRs4psCmCea5NqwAQi/MQrgr6EYVH
	3aJCOWsf4M8gAp0FDEdy+MW2XAolHTC9gvvLo/FUG7M14jmOozd4E6Gbun5XY0vXjpL8VZr7HJY
	sguUlMEYwFfhF3OUS3cMsCrfPeRSRsYBfL5IvDsUJl7m1a6UIootQMM4fpa/k0+aT0Ir5iILUTc
	dvZzDwuaxNTrHy8PfRgQnjqyCV2hkSihoDcsEcIuvVDfnkcbYUfO1Da5SrVZl+WL5AAiZ1CtDuO
	OGWlymEjihRQ2nBSfzzpeT1/NvbTisSnToU2OQZDHXvFBCyYRYExzp57IbLnOfiKhpHbWN2iFXx
	fPtK/HdqooTyGM2s5RTBq36VdnezkMkjBbFojb5XkbvC+LheukMsNsFvBZwwvvnCd9C5Y+hGki/
	0bqgBffC/xbgmqigep0A==
X-Received: by 2002:a05:600c:c48e:b0:47e:e970:b4e4 with SMTP id 5b1f17b1804b1-4801e3494b7mr155374755e9.29.1768831428511;
        Mon, 19 Jan 2026 06:03:48 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f3b7a5f94sm266035795e9.0.2026.01.19.06.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 06:03:47 -0800 (PST)
Message-ID: <fb7ec096-372b-48f4-b6ed-e224a05d55e2@tuxon.dev>
Date: Mon, 19 Jan 2026 16:03:45 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/16] PCI: rzg3s-host: Fix reset handling in probe error
 path
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-2-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260114153337.46765-2-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, John,

On 1/14/26 17:33, John Madieu wrote:
> Fix incorrect reset_control_bulk_deassert() call in the probe error
> path. When unwinding from a failed pci_host_probe(), the configuration
> resets should be asserted to restore the hardware to its initial state,
> not deasserted again.
> 
> Fixes: 7ef502fb35b2 ("PCI: rzg3s-host: Add Renesas RZ/G3S SoC host driver")

The title of the commit with SHA1 7ef502fb35b2 is "PCI: Add Renesas RZ/G3S host 
controller driver". With that addressed:

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>   drivers/pci/controller/pcie-rzg3s-host.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index 5aa58638903f..c1053f95bc95 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1588,7 +1588,7 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
>   
>   host_probe_teardown:
>   	rzg3s_pcie_teardown_irqdomain(host);
> -	reset_control_bulk_deassert(host->data->num_cfg_resets,
> +	reset_control_bulk_assert(host->data->num_cfg_resets,
>   				    host->cfg_resets);
>   rpm_put:
>   	pm_runtime_put_sync(dev);

