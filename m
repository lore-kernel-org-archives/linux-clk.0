Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8332A32ED22
	for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 18:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768846489; cv=none; b=u/7wUkZ4FmFG0ch7d+agZ+Wm8esB5h/Dk2pPqExazkF1i8lW6J8ohAFc16JH6ILpImAVz1IsGDjyg1eHZCAXzaqXpWXeh+btcZDcOTyajbdTWlq1QDI3SU5BDnBZC0Ly4/AJTa2UF9UwHdQeLd5jVSUg8JfkPzXvfn5miI0otD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768846489; c=relaxed/simple;
	bh=R62ip0d3Ah3ZHGBbnwwq68SBTIiq4tgpDhhAOV/4tbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t4lNFmW4zpdufuBB6or+a+P1b2l9qaCvlETsD0oukJqOrlX0hZShQQzJVk64V9fphUkjMGcs/t4r5tR3PvdAsK007huIP0Na3itxmetXA/CoStkN3emNaIAjkJ1GkWTBI1mSRGnBdXqhUJ4sLiCR7CaCArTqbRekUVqlR7pysLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aEjkzCxZ; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aEjkzCxZ"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6505d3adc3aso7179219a12.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 10:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768846487; x=1769451287; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bQtPqL0gQRVYb0zOyJRISSCzXN2uXU8LTr7YiBj/NpQ=;
        b=aEjkzCxZxAAAB98H6HoLWZPl//X2rvz/BNyZaz0o2Pn8lT4INRRtW39GKZOvBdFYk4
         OVvIAi+jBzVLUtTSTPNkRDZGVvFkiV5aR7lwf5mC1p9oI3yxPwpZYOIKn0nhAlctWV+3
         /+5WQ2hvNLkZ2+mK/ZN9HsOiwTsi/f2ecYjvFnIrmU2PmBKIBYl7FhjFD5pQr1RKGnst
         8+Sxm4cVveGQeC+S1LeRWQNoBd32eJm/TV6U7PH5ROT0Wt9iyAV82wOIszdM01RASV0+
         BHOvEHTTOfgj+Xp2Z2oo6GxUiIBZgrfxEwUikncVMt6vJWoSRznCErRTTT+pp/uCYDWD
         gi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768846487; x=1769451287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQtPqL0gQRVYb0zOyJRISSCzXN2uXU8LTr7YiBj/NpQ=;
        b=ebJTSdgAKbx4NtqZD775HybGY3tGmuw1lkdKB9jf0qLX+K6WVMMzd9U+NQKCHCnBba
         vpZsmBNhszRSMuLOhgLo9UO5DMSBXI3AqwZ/zo8hwlAV3NgIHNjfuWsN+2IDhkI+uWQK
         nGZ42xhO4j8tj5paod0SKj05NGm2g9TXsnzP+1CDNZl96c0GfnqXzDy4dnMogwpDMX88
         8FB1hPHkoM2xcTujzzEBWJHXsbUbDbkiVX73/R9B72JeY8NPUZNUYnFMU59Hd8dF4p60
         HObOXfY+st1NuXSJ4lqpHU1Te3l616RQM8a7Cs9YClpnUNy6C1+WJ2/4kvCtiNI0sC7a
         SkrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/F0rGthiEym6x8xaDMG02uVdl5/fGQp0gF4k1nkcu5YZQT8fFyakEkkTBhvTkENo3+K61BchAr+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUeT+QZ/rvG8Rf1+Kld4GIT+GqqGkYA9VPMcOlIreBggRUOlgO
	qkVxUe1NA6ktEbaG1CKglNIly933y3JLPN2oNlQAMaiDinmaOC2sXYc8DTMlH3LkzmI=
X-Gm-Gg: AY/fxX4ErKflmxKLdhgDpAc/O8Ax7+k9F9QtAA7fFE3yoeI04INkYb/Eq7Z8mdFDC3x
	nC4zwdvZsy4ZnszZNW/AOaVQ+6dJVSpv/ZjtMLvkKIH3yVb7f611fnfmYK1fC0OlWkQRjMN7KXZ
	Yh30OqhohPw6QUBEZQKAJrW6AtzBh6eU95XzBPZCKT+9BkTmopie+niupzQ/Vrrf8tdwEWzjxba
	bPwWMwgFCPmiP5ncPN3dyvqjq29hbRcto8EKFzPNjOmvN5BHAIk89p3YtsgyNKS3IcGZrfEaC6q
	5ri7G9KdkPwglForE2KCMadW3v2uVb7wV/cCeF6qJ1Y/wne3E0AA+Iy6XiRShxvjht1mkXwTl41
	+HjL0Op5QCW/ZND3veJib5MSGpoIwMkvyBGOvOo/gz+hUvL+MMEYSxJWP9BTXLV2xr2SDja/jKZ
	+vDnIveU62RWRrv0njfA==
X-Received: by 2002:a17:907:3da8:b0:b77:1a42:d5c0 with SMTP id a640c23a62f3a-b8796b3ed8cmr936424266b.43.1768846486170;
        Mon, 19 Jan 2026 10:14:46 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452cdb01csm10834235a12.8.2026.01.19.10.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 10:14:45 -0800 (PST)
Message-ID: <724052ab-6222-4a5b-b504-334dd59a876b@tuxon.dev>
Date: Mon, 19 Jan 2026 20:14:43 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/16] PCI: rzg3s-host: Make configuration reset lines
 optional
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-8-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260114153337.46765-8-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/14/26 17:33, John Madieu wrote:
> Some SoC variants such as RZ/G3E handles configuration reset control
> through PCIe AXI registers instead of dedicated reset lines. Make cfg_resets
> optional by using devm_reset_control_bulk_get_optional_exclusive() to allow
> SoCs to use alternative or complementaty reset control mechanisms.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> ---
>   drivers/pci/controller/pcie-rzg3s-host.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index 44728771afa3..fcedccadecf6 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1161,9 +1161,9 @@ static int rzg3s_pcie_resets_prepare_and_get(struct rzg3s_pcie_host *host)
>   	if (ret)
>   		return ret;
>   
> -	return devm_reset_control_bulk_get_exclusive(host->dev,
> -						     data->num_cfg_resets,
> -						     host->cfg_resets);
> +	return devm_reset_control_bulk_get_optional_exclusive(host->dev,
> +							      data->num_cfg_resets,
> +							      host->cfg_resets);
>   }
>   
>   static int rzg3s_pcie_host_parse_port(struct rzg3s_pcie_host *host)

