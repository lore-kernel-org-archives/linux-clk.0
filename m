Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF2D376BE0
	for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 14:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768831608; cv=none; b=QCDtHO11cLelJwhi8+72yRYwllgyph51pK8E1dphZOxyzJ6Z6b1FV1pZdZAno0IQFsxYXE8iaNWjYnIQVoY2VM2rViY1MiLbcspAEi/SHgzQKspkGzW71z8WrHHdQr7VB8nXJXGojltuZcGOZ9PlSDHELPTRD6arQK5SQIxgC1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768831608; c=relaxed/simple;
	bh=PaO//h4aaHpeXDKTCutId0QKH8llt3+YpQISpJCLbuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fyXPhlDWO9ojHdpV5ig/Eh1SX6N0L9b5834HV2WJgB9OwwAjT2XUh/ivpKQ4cYVO84Q/IlwudPUhh/SddHxCwPx9gWizXEE2jtLmbdpBts+hCvkhwB0bNVtLqFGC+43jK+S16X2dkh+sR2vmUBcIqw3BS8i/36PvzZzXznSlY8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Zro+wjvY; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Zro+wjvY"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fbc305552so3261328f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 06:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768831604; x=1769436404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NYbPS1Q1egGiEf+FowJflS+CPH/nAP63ilv5+paqrac=;
        b=Zro+wjvYnlwdzhnKyDhs9ZwuUFG9gdqikr6/HWBhWvQZHjBJzodIaSZgCmgYbacTga
         aS46SGkJG69+rIPMMuAYSIkCm3gkclmMCSGKctjKFnrreHZFINpTtA3ojujadP8gx2LK
         xUiZeBJ2fcUGGyeqkfLYyX6yRP7btWg9AUKznBEcgfWFdk0HNeX0KJXRXVDWlH5taI+G
         nH5nf3XfuSMUBY9tu0/LSjRpjMlDFETW6AR2/B7IE/n8VRRgksP+kboYZ1znzWuGwb0A
         OVw8SOxtpsG1W5JhKmhSlsYSb91eHaUqnJhXTSEwvUKM8Fq3OuYldQ+FBZyJ8QuriJgm
         7AZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768831604; x=1769436404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYbPS1Q1egGiEf+FowJflS+CPH/nAP63ilv5+paqrac=;
        b=QkJUoRgGcvsJffv2aih6JsvXd74OhGfJ82ZrAFRGTKDE1GYirLQENq+6249n1d6nKs
         GKdvL4wrCxrEFRBunP3DnsbgB4BNHpAtSkg14Y1zgDerpGxDj0mr8BYmJYgdSVGj4KjT
         x08QDNnMoSEmoLK60liqodE2wYG4Gs0M9ZWcQkd1F4jfTjhWqBPOMv4acJl0PV4tM0GJ
         KWVlS9v+pXZBVU5VvpCD0rpjGgiE83nQ59I58a952Y4qw6xVUPb6UnzVHVviqZ33ZImv
         IxN1KRh77Xe9CoLJz4dYXhE1nULI9w5k6Sg8jYGJ9ukCqErZtws8/ss8SOjqVTlrYWl7
         dJTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYGMJ2s5cXcuyAgRTt7/IZujUKSeJ5y3wJEz/kKJTbwfHc9XVNe7SKQECE48lGWqYCnEflAhMXu28=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw37epr+KSu3RfLRJWnnLJ9Bb42bI5XVHbJoaL5yAC1uw14L5Q1
	lBknwV5RuBwo8CdO9ea4/bdose+N1rqOeGJTZnIMujarj1F7NdRsQRBnfILiSCjx4E0=
X-Gm-Gg: AZuq6aJk2pqOz+6isQMz8rTb3Ng7Er+RxzFL1j5wzf90bTdyZ6jeKTMuYkFlgZaeA47
	S7S7Yft0qrnbX2zKI+qavmCJ9q30VcH0mcW8geroz3Syipotyx65OKd7G2dMWCJtMnZuRswf3Ms
	NMaECoOxzuRn+6OfWaaH+mdGBbhwKTd6oLAKHhR7UFE/dAPWpaQGL0LDtew8UCLZaLnn3+cQRqY
	rB3KIQN1/Khbk0ev+KOS1SnvSUlMYp/m9WGKX+PHlsgSQrxv8yXvFB6U4h6AYplfK+qvX9ts/4w
	ZQ7fSSGsMqXePpGkDN2hxv92T/iFMiE/R7luynTO1Vu5D/JuD5uHKE5dgR3nGFBA7TGzlc2o8K9
	fDlasxQUquuvKON/SKhuTa4EKGMO2mQ3WFUxZC5SuMlykDWxwRtK28hznS6c7vQ3jOL3AaaX/6H
	A1yLc5MHSq79RXaRFeHQ==
X-Received: by 2002:a05:6000:2c05:b0:432:84f9:9803 with SMTP id ffacd0b85a97d-4356a033304mr13973113f8f.3.1768831603708;
        Mon, 19 Jan 2026 06:06:43 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435699271dfsm22767776f8f.15.2026.01.19.06.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 06:06:43 -0800 (PST)
Message-ID: <ade158ba-0532-4eb0-b95c-5c7de16b490d@tuxon.dev>
Date: Mon, 19 Jan 2026 16:06:41 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] PCI: rzg3s-host: Fix inbound window size tracking
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-3-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260114153337.46765-3-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, John,

On 1/14/26 17:33, John Madieu wrote:
> The current implementation incorrectly resets size_id each iteration
> instead of accumulating, causing incorrect remaining size calculations
> when mapping DMA regions across multiple windows.
> 
> Fixes: 7ef502fb35b2 ("PCI: rzg3s-host: Add Renesas RZ/G3S SoC host driver")

Same here with regards to the commit title.

> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>   drivers/pci/controller/pcie-rzg3s-host.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index c1053f95bc95..205b60421be1 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1313,7 +1313,7 @@ static int rzg3s_pcie_set_inbound_windows(struct rzg3s_pcie_host *host,
>   
>   		pci_addr += size;
>   		cpu_addr += size;
> -		size_id = size;
> +		size_id += size;
>   		id++;
>   	}
>   	*index = id;

