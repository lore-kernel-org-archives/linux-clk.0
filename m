Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A59F35F8B1
	for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 13:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768482806; cv=none; b=ZSFKxkhX2BDTGkClWpoTEAnWt9B03jSs0ORFIBKqwMYtIrtRKq3flqGJktANy9RO3B2+6kI9KE68tlkkVrOEFxXEXd8uMjaCznYcECfoHhNkQiE54xGSAn1VNQbfavTZ6MULRAi9jtuJVBxaJKmooJedeDgdor+NNSNr6wRuG0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768482806; c=relaxed/simple;
	bh=oGBIY8OHbiaA6AKM7iezNk4OT2UqUM41E+jU3AXFh04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ilJ1jy2Ba8fc29Ji8YhWICbxdXSuEJu8PkCkEwkOnbEd1tifK8brlvSplWZGix8kBInNEmmdn/aEVs0XIBZry/Umn+uAT0UYk8WmxcOSK5dglTGTqcMwej3QX/gYztLzC7uop51zlnsX9/wM4rr1m1eDqEatYj7tHtcsE21U8Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=e8KMlEet; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="e8KMlEet"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8765b80a52so153086566b.2
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 05:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768482803; x=1769087603; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OcKT38A0UUvdoSzqayVq/UaeSYTimcTVzwN0DmjbeBE=;
        b=e8KMlEetorsdjlDu4nCOoTy3aocLVWJp4SGBuk7cPT/nyqbs17/jVUSlljjAcH0029
         YjJoNxfiJo5dWfbNVhiiFRZDoPxNpNAe4olDxz1YnU84kktRng7PUK+VuLwzBWrmrgMv
         Pm/GaxLWAJN4ulMJAvrmwnpg2E7P3NQHa0L4IwkeO8THc7G2QGJSgEOVwxWMBy6D3wtF
         RuFbc1t53DtFvVMIAxL/9TM8eTH8nJvXULwWBrWe+87wfngBJ7tvd50bi4gS4z7Qcctn
         SYx+sBMVhLtdc83/I20p+/2zFWwYP8AUCpr9hbFV7QSQyl3gk6i7jjHGKFvko6GrY0Ge
         8Fhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768482803; x=1769087603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OcKT38A0UUvdoSzqayVq/UaeSYTimcTVzwN0DmjbeBE=;
        b=poGa8S+MDzyRJvDBwX8PSNBwNoIQi4JsdHr57EI7oJuYPXc3xJmKe50ggEWLEW87Hj
         pYh37M8qbiw7dWgE9AsijC7YkWhxbHjEmkiK2asueX6dvOO473Hs9CCEJETfMUdLi0hv
         6PILb3oTNUB7xUiON51rK/RPIPzUVgM1OmQ/P30J4dFgsM7+Ly0SO3GMWZ2cULXmB5+M
         S3mLk0l/20YN7+EgwEtKRvHEDWYR07H3pqvQTBFz/ZuksN4MOUKu3mjKt5VMi8dzLvgX
         uLaIPW2HMSd4zlxmVIxiIFWjvrdZW9gAFipD0gMapNI8pEepsAi8CLjjqQ6sOfILOE1C
         r7WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJit6vPh3EwBiBNydPo0uKiCszrBrU7bM6oarfyvNumw3rBPwNlT6HaJQpvFsR9zEN1+GyAoDYi+s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjgzq9lpTvBjWvnWLj65/ngJxuwh1p8zxOia1xY5DFejmUDmZu
	yL4UR6cCRlWy1en+qK4L/ytAN64RYtWtxAkWQXJ5zeXF7kC8S69fvsanWqfxqnU5lps=
X-Gm-Gg: AY/fxX7QTYbLSM3sgXYuiAoW83/yu8CoHeP7YnLwr2hQfDy6AFRcyBObks3ee/zK/WZ
	2kz+3ps01pdBQx84LmWoIcvfzCumtS62PhNORrJVVbObOtPGBSG2KCWE/+2wp0a+SuTeAhxH55U
	gxLe/cHcnLaHLy9xF77V8osKe4FhgUJZFJ/6jhl/2wGHDqKFW2JvKEXc7EJZ3+l9lpuYeisPLFX
	jeUl4kIDb/dNHoN0rDJ5FlsOvjcuZotfXxDPBobyy5LHOK5wGPyPWbIHCHoEfiPJ8Kk85znIBUZ
	DYrkMCK05e6BL7FJhE4AKO+03kzsTLEiqRYFJlFXfj/eS+FB+hlpkW0FP2PlQEjZAEN3+CLq9C7
	zJXx6KrtFhAyCqPnfDPHkctuq2gtXO9wpotrau4dFTDblmMPDmz3pZgFiWrdPptSlGdj5bXWSod
	2h/Sr5NWJ9laJ1uv9bf2ilw5Rj6Kdscg==
X-Received: by 2002:a17:907:72c6:b0:b87:5d59:8661 with SMTP id a640c23a62f3a-b87677a7930mr370290966b.42.1768482802627;
        Thu, 15 Jan 2026 05:13:22 -0800 (PST)
Received: from [10.78.104.246] ([46.97.176.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654118772e5sm2534012a12.4.2026.01.15.05.13.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 05:13:21 -0800 (PST)
Message-ID: <2e05a458-b055-44d0-91d5-63091b9eab91@tuxon.dev>
Date: Thu, 15 Jan 2026 15:13:18 +0200
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
From: claudiu beznea <claudiu.beznea@tuxon.dev>
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

This now fits on an 80 chars line, could you please update it like:

	reset_control_bulk_assert(host->data->num_cfg_resets, host->cfg_resets);

Thank you,
Claudiu
