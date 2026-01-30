Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161FD3081BD
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 07:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769756799; cv=none; b=dKQfq3nbCljR7kFHMnHb7sZMONJXnJXNhaP6Nk28tDvsqD7oE1Ma8nsgLXpWL3Yy5XzEZz6w+ArE4koe3BT+36AjchhZduK2OYRYCbjOjonBwcPS+1uazgVWWUq3H2/Y8vTwKJb7SToJMMWHsAeNA+de+PFQSfGj8zmE/L7qaoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769756799; c=relaxed/simple;
	bh=s0CHURudGzYLC+hzi+ZJIPjJMX3Kvv/uYTN/tO6I6ng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uylPbjA0zyRJAyyl8IpMxhUPafsDnUKqRIdKn5aFApKOkMIRdRAQ7LEDEtXHQXz9txwvBi6NfcsTmjfGQWsZV0TA8HesQpgVS8BWFHGFeA4EPxNLNvpJsDYES4m1P73h2QvG/aSYbasT6Fvgvxke3tYXCvLAD3S+zGpZihVI5g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=USwK9gMy; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="USwK9gMy"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fb2314f52so1066186f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 23:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769756794; x=1770361594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JnG6xg4PsOUKKQ1jkLAF2YDjC5bopGJAX+gen6DcvE0=;
        b=USwK9gMyjJdSiQJboEKwAL2UYXknXXUWleKrptdNAfWHU0eLn2fWGcBRI7POdl+Yb7
         CWHbq81Hel/qv6Pb6iUc5pawbX470pjs7moiyoRHeFVrN9adxatQkM7S0Zvv1u8VCLBn
         YZEyKzqLX6xCRa8quFV9e9oYEfg1n8rk3e1XXp0SiJzz5lLahfc177QUwBmq9pbqeunv
         cz3hr9AxEA05ojZs07pTUqMiP9tdZSzAjlLnk2bHaOT+WsOyL5NAk+omzvcOpHG6FVhz
         kfMuFiCY7pSpD4z0+398h9dpkuXCBbqK2T4wpNzMJdE0fTGSpsXKfgixsOUlw+4j5+5k
         qK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769756794; x=1770361594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JnG6xg4PsOUKKQ1jkLAF2YDjC5bopGJAX+gen6DcvE0=;
        b=ecqoTM61ZadgMExGLA4pM4BTUAQv6oib5rdtydug3R1wF8gzEpfXVaIC7zockWhfw/
         dfORiqNr3/hLaYwbKoP0ouwNW/u8mYclw5qKWxrfej9+PXa5wkeqil+qDmY8kbVISija
         Q+WxlLKvMFGCjRZRnWpZvOUi03sEzfPJkFXuUI6zm83qQmOLH4NaZe5xzPlAMjLE3MWp
         QAkrMQWfuK9akmDQv46E412G1ZDr88B307oT719+SFmcpc2DYeYfTG9xfvf+CPVQeFjZ
         AEWPoz60FacDGjkkVCgl2dVGezdbexFGwzrOG0RjEhBK9hmXuGz8+U+5/v48bwINi21O
         1mBw==
X-Forwarded-Encrypted: i=1; AJvYcCVKFyDfKRBx5LisXJBSRGToHOvOnrQgNkrcjfYg3VeHNtbnUy0GyBXn7sldWiabmWmgYEfVgSnd/n4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLUUUFkNty0CaZ02kXPilbt+gkXdfEyjvTjc+5WTcv4dqAoITZ
	oNbSLgqKM7rROrdOpxIp/6eTdpf+pHktaB3Hq+P7y5lNSr1IoUJ4OOCOiW4lprHnML8=
X-Gm-Gg: AZuq6aKCOgaWCebUuj+7WgW981/EjNQhRg3kwQk9C/2RFGGyqFz62VZHl3tx11Pnu7S
	qdIBouVS/NZZ2eZIWY1gPuCTQ/9RkNSy3RjnNN5yJIX9U6k/UVPRWFXkMQ5YaAX9UWQLkPtWZrm
	k1JpeJ8ViRjrwj3wWXfAtFKQYzZVoxAAQwTe/Mx6Sp/Uxj3Nz7K3V8xpFI9XIjhLcv5MQ92gC05
	AMchSWvqYVIfjXVBLMAm52E55QbH7iEO+zEo4hRNFI6GjePaVephJJd7zHI3K9MAmC3RNMTsPFC
	xNR0CEgLQr87hrLjljRFpgAT6jZnzSnwuoOZS/Vl7UcLftjkOSZN+mtVk5XAF0DdSJ5mtaf1cY/
	ArsByqMxM7l5ZYkREB3m/S+q/VQGoA6sYxdC6SlhHjMPzXfaY/RWDqqZqvMNHiOJkiSgifwmC/p
	cp3ey2WwVYChvWa6N6IQ==
X-Received: by 2002:a05:6000:40da:b0:431:8f8:7f1e with SMTP id ffacd0b85a97d-435f3aaf81cmr2905850f8f.48.1769756794284;
        Thu, 29 Jan 2026 23:06:34 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1353ac2sm21442766f8f.38.2026.01.29.23.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 23:06:33 -0800 (PST)
Message-ID: <878697e8-9770-4707-83c8-e8c3834c4447@tuxon.dev>
Date: Fri, 30 Jan 2026 09:06:31 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/31] clk: at91: clk-usb: add support for
 clk_parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <37dfe16abee98a6b768fbb3b82c0b8cd23bb6e44.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <37dfe16abee98a6b768fbb3b82c0b8cd23bb6e44.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> @@ -818,18 +817,22 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   				switch (sam9x7_plls[i][j].p) {
>   				case SAM9X7_PLL_PARENT_MAINCK:
>   					parent_data[0] = AT91_CLK_PD_NAME("mainck");
> -					hw = sam9x7_pmc->chws[PMC_MAIN];
> +					parent_rate = clk_hw_get_rate(sam9x7_pmc->chws[PMC_MAIN]);
>   					break;
>   				case SAM9X7_PLL_PARENT_MAIN_XTAL:
> +					struct clk *main_xtal;
> +					main_xtal = of_clk_get_by_name(np, main_xtal_name);
> +					if (IS_ERR(main_xtal))
> +						goto err_free;
>   					parent_data[0] = AT91_CLK_PD_NAME(main_xtal_name);
> -					hw = main_xtal_hw;
> +					parent_rate = clk_get_rate(main_xtal);
> +					clk_put(main_xtal);
>   					break;

Could you please let me know why is this change related to USB? It looks to me 
that it should go in a different patch. Same for the similar changes done on 
sama7d65.c. Sorry for not noticing it previously.

The rest LGTM.

Thank you,
Claudiu
