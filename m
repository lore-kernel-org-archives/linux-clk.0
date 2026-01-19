Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623CF35EDC2
	for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 14:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768831479; cv=none; b=t56pOwI++9EfvmN8xuBqaSQHqKc7mEDDtWAPDUUbeWmsIO20UkQHnj8roz4gs5TnrdjHAYDDH6B+PTWweh6jLMwsLQbROfLdKBJwozbIqrTVXYhPdxKztCmilIhjls9sNG+d2PDdjVsFEiuImZl5BzUc1cR9Uqno3NF40KlbqK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768831479; c=relaxed/simple;
	bh=m2uBx0rH9BBwtr/Uco1kTewsgSVG+SUQOTeuEoSlDOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C3b8n8sRDWvaVYTni+ps/6rxItgLvpQWnlSz68c6DF453melzEhVfALFIdEbMMhnQuyH9SheWj2wSUh1pOPa3H0adUI4qz8+V0oUGlURHuqVFEXmyuDeWNcmuPIFpfG+p0MLC1o5M3a8dY+crwfxsUaV6SIejWxUHDimAA1Kssk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cREaGaRF; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cREaGaRF"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so2087917f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 06:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768831477; x=1769436277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S+uiJg79CSTOd7IU+Zjr8vG48esanihoaH1GIX6WcHY=;
        b=cREaGaRFDQFI5hL97AT7ZRhouQ8ZAcoaODf9B8xIP2SiQfkWbmPLLndfGFr21SwMN4
         fYryGwaaikaOtlOtw9W/OyX2SC1vKlU7lCEZfGzmS1AA56bhj5S3dZpxmbIPgao0nIYK
         WiJb4ob6B4Q72iRlsaqHB8ekMcSdg8lk9oLDb1YZQJ6MOzbEHXmCrQNzE9FavQyI1hZD
         1ooOigIQR8Bzqul48yt68DS4j15LIGY9EImCMWyBsP/SRboorOxhXV47JrpAi6+8xNQC
         pfsZ4oVs42SbZ9k9fVUGfIwiXc2kMGhhKTOEZcO4B/YPU8d8HGLuwKFvBweYQ7wtgLTm
         2jzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768831477; x=1769436277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+uiJg79CSTOd7IU+Zjr8vG48esanihoaH1GIX6WcHY=;
        b=XJT5DbDKM8M+Oao+pvmomFzW7xUlLQ31K07rp/1hCDfywkY4ZGfJ3BvjuPdFx/zpne
         Ovrr9/XjL9TuCLEEdGECH++gE74RVsqkwocmFJXVAwHdHkbf1me67Qlxqaj+QT+1PX+M
         fSjI8+qa9Q44YVCMkXhEYMdSPK9gjixWZZl2u/Qbq0ax0ahaGAqPO0s3KAfkWc19h3Ow
         7+fkydt310hJ8c8X8VcAkhNBdLDxhK/Ca5J8JutqBacKxn7Om99J/UiPyFmq66Ti5TkQ
         rwQvF80iYaf401W+Etgv8qMgGREg/mD1o/mDIYnPIY+N2v9SrysxlIeNqSpIyjXN+rm/
         LKxw==
X-Forwarded-Encrypted: i=1; AJvYcCXnEJlNmnbu8GN4z/MLg0WW4ShZj6PK7klyrg8VjupPKtSeaWAZ9SJsdJlHVNFsbuoIdqck1KVahNw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9sXeDSzGuK0I9b64PAMQwezCEOA6WDnfP1tQLd3M/awWl1kww
	fnit0fJ1ndk4Vch7FJekZ3QZ11D1vfDvX90YNZ7ZpBLWxW7MvZz1h8KrKpjQjiLuSzk=
X-Gm-Gg: AZuq6aIY6uQDKekPHzA1lHSQ3/Ko8ajYSI7/+rBhQnv0mXZYsjcsh4r6fH0G15vx89Y
	t1SOmrXhwse0HgR2VCW4aRhp1Wyv7HL5Q716KYCzR8PqJJY34QH9zbuv4otwcr/86GWgAxSvZ5c
	bKzH154K2if4E8gPkZFyf+RU1GNLxzSd7DfbWcyDxXuqw3KiofD/Uk4DAewwT6ZlHtQhF0NlnZp
	LyPvLajTqoytHK/e3HZtlg/HMw3uNkR0XncjPQGZGM09hbsc9G8ShQ8Hb19jp52fAhB2T7M7CoA
	va8sNvtzmsP31S2twd2zEzAqkP3a9IjAnqslWF0hUPt+0t7ydeIcsyFBLmYwjy2VmQHJSZLVE/1
	4UvXKZe3iwN4aaJWqhWZd4wsGEraJ/EvB8JlmYmgkqUu0WdZVQHZNY3qX1AFj9+eyXK3yNxo9bg
	gtybvAJe3GiUwag9QjAg==
X-Received: by 2002:a05:6000:400c:b0:430:f742:fbc7 with SMTP id ffacd0b85a97d-4356a0296e9mr13698492f8f.14.1768831476764;
        Mon, 19 Jan 2026 06:04:36 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921df9sm24010322f8f.3.2026.01.19.06.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 06:04:35 -0800 (PST)
Message-ID: <f6c7cea6-fbd0-4b3a-ab89-a3c26be11ce6@tuxon.dev>
Date: Mon, 19 Jan 2026 16:04:33 +0200
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
controller driver".

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

