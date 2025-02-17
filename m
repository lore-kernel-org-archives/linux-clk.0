Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E171A841E
	for <linux-clk@vger.kernel.org>; Mon, 17 Feb 2025 09:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739783451; cv=none; b=LW64jErPyVRWj/YUvkNGiuC2OlBWVmTmpZ5PPxbPcMwxzAdOJcMX1oNxmfmYcChnEc6pN7YZ2GP5yGTUAcrWXWxbDtrv/hit1jzvqyq30UyYFi0QmNyBnIGNlSSxZCHq/yL3W47bH3ELNYMzJgIsgKLXKKLG5VdwmHGpJHbtoCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739783451; c=relaxed/simple;
	bh=+8uc3Cl4FDkfpG7IvlrGiw305nAtrrtdyAjwd5EfOBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BY2RtM50nXFyBpQFvVb/Gc6/sMUy9u3N76k1YQMjUxC+vW4Y0r+xTQ2reoEQ9lhWXiDzxOo+4zip8YfYmhJzfFUcLtze/GjMzeUqCCkV5lts1YxM5Pe5rfSMCOKAYih+pJEo7Au/OGszgVGDdJvqMR06bJDQ9s4jX5sXD+dHTSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aRbj+VwH; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aRbj+VwH"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abb8f586d68so147540866b.0
        for <linux-clk@vger.kernel.org>; Mon, 17 Feb 2025 01:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739783448; x=1740388248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fM64uRKLmrwWOZ1Ir+jCO/kphMaDgkxnNNITVcvwwUI=;
        b=aRbj+VwHE2odjl1FWHLcw2nuW8wMlVRUX6M2ZdpQq2ECkc32IFGrsw7mpJGhyfzYcC
         PnD3Xqf/nfjWZ6oh0XXcr1SnqG9bYEXviDGvKnRVTQkRSXYZ933rNu5hoH9vsfe6vzqa
         8pAAXcOAeup/r+uq+dfbEsBGTbKtZqAe5SRIMbrAiTgJIufQrewsBfhJY3rHSuHqNKxK
         z7i7IqJb37c+dDLEVo8Z7Z37TUzHDeKITNYvVo7AQLjQrCz7b9Y4U/WaPjybJmWT5hRu
         egNKek7CuzPLRqeWzs/Hf/eiKQhNxH/Atbr1GiKsHTtkS/fFoUWgO1RgH+SEsVtyYP2y
         1+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739783448; x=1740388248;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fM64uRKLmrwWOZ1Ir+jCO/kphMaDgkxnNNITVcvwwUI=;
        b=lalSAabC11Ac+xyGVcUMZ9yJnk+jLwGZZ7Rz4EzBNtBegRs26uLsx3Sh6rlZHgTyAI
         xExU7TTjSsVD+pS555xhFLUwBLVOgktCe4+JO9iS38TG+3ZAuyymWAv/79gaNpRvBPvy
         iKETw6BBPzjCLv6V/NIaghWy4SsGi+EEfm3YJbIlTylxkejvxyniSvDxuRw1OPOnVpBb
         ZcdCegiBbXIFUI8qAtEik5cIittVOM4SjJY6NhuuNh4MLS1UiauZIVtb/E9S0l+q8LI9
         o+oGbdN+Nm/YmVXisF04pdJE9eN1nnVYa6S/IA2ToBUsi8o/xalR3PiQ0MUqC/Zz3J5b
         RrZw==
X-Forwarded-Encrypted: i=1; AJvYcCUR7bZEmlJ1QP7TEiYQdclcvdD8XliX646OtG9Of4d18Acmqc+UxDCD3rL7iirF4uISR+WKf6WbTg4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx67CJtJs5GAtkJXHqR1Vat5AtNXxBwB7W4ryT1p2DaK0gikGFz
	dU+hOs5jkbxk7UOzdgu6HPrLZfkokQ6cTv2wX0Ss9WWEE4i4uQ8u+vRMtRzYys0=
X-Gm-Gg: ASbGncuJMUgNvl0z77qGfpjBDgnks7sMc5pSBf+93NK6QzuyCRpR4tEGIg7/P0vOSDB
	MKpAFY7eLpfwuVitLm5PBoBMAmvk57StRbHQ41pUhY5J4TVK00zgVlvBrkVj2K1diwr9JXDL/CK
	KmQIzVtkUHlw0dEXqqt6K5KTBSztUlufbJRs2NNiTp2r15P82QPbqY2gDTtJ75Om2Tae2ObGwbd
	d3rraHxBM8VmQGGaQdkFSc2FvMUIJ52rlE8uvmhTzfepSALhOx1022kCNOY/gdkJrzu9+4vDdlb
	qW4LkA6t7HW62Hw6HzZWK9k=
X-Google-Smtp-Source: AGHT+IHrxbwT11nHlNtihnFEo6GxLB5WUZzVMCb1sDWISI6fMsTNPgPdGYggA0tSbgXZaPERaVzy5g==
X-Received: by 2002:a17:907:da4:b0:ab7:a5f2:ed22 with SMTP id a640c23a62f3a-abb70a7c9b4mr851455266b.1.1739783448057;
        Mon, 17 Feb 2025 01:10:48 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba3d765acsm91405266b.130.2025.02.17.01.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 01:10:47 -0800 (PST)
Message-ID: <116c9e5c-8bb3-422a-a52d-9d6d8c79e10a@tuxon.dev>
Date: Mon, 17 Feb 2025 11:10:46 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/16] nvmem: microchip-otpc: Fix swapped 'sleep' and
 'timeout' parameters
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250211065223.4831-1-ada@thorsis.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250211065223.4831-1-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11.02.2025 08:52, Alexander Dahl wrote:
> Makes no sense to have a timeout shorter than the sleep time, it would
> run into timeout right after the first sleep already.
> While at it, use a more specific macro instead of the generic one, which
> does exactly the same, but needs less parameters.
> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> Fixes: 98830350d3fc ("nvmem: microchip-otpc: add support")

Fixes tag goes above you SoB tag.

> ---
> 
> Notes:
>     v2:
>     - Add Fixes tag
> 
>  drivers/nvmem/microchip-otpc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
> index e2851c63cc0b4..bf7e5167152cb 100644
> --- a/drivers/nvmem/microchip-otpc.c
> +++ b/drivers/nvmem/microchip-otpc.c
> @@ -85,8 +85,8 @@ static int mchp_otpc_prepare_read(struct mchp_otpc *otpc,
>  	writel_relaxed(MCHP_OTPC_CR_READ, otpc->base + MCHP_OTPC_CR);
>  
>  	/* Wait for packet to be transferred into temporary buffers. */
> -	return read_poll_timeout(readl_relaxed, tmp, !(tmp & MCHP_OTPC_SR_READ),
> -				 10000, 2000, false, otpc->base + MCHP_OTPC_SR);
> +	return readl_relaxed_poll_timeout(otpc->base + MCHP_OTPC_SR, tmp,
> +					  !(tmp & MCHP_OTPC_SR_READ), 2000, 10000);
>  }
>  
>  /*

