Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDFE257855
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 14:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769869190; cv=none; b=ezHBiyr4p5guK2KIg/5G4L554Mw9YOeMFK77+n1FoeNHHOkAIBMIp/xQhjD6iIcXYGIEJqV9Hfpio0PWesfkg9UbXQAqjMitFlbLxjBprPccFGL7ENrxDcKq9PAwyn/tVR2L6RGUTYRaSaPZlDiE3Mr1ovs7GNzPySw/ZS1OQHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769869190; c=relaxed/simple;
	bh=Q3e9I/SGFTl+bvLEYYT4oui3vdj5Y9qdelRnwj4958Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UwVzGeaRVGBha6xVOfo12Dx0/r+xGSxsXXFaem39igHSiF40/MaC219a00bqcbfDkaYfFoPVpnvf7XFycza8cnLwizhp+zT9V94PJQZCOYLjJ2r4Viv6l4W65EE8iIBOcO0cuNPZj92HO3rcS9m8ryhVDeKL0oW3y5tiMn9o/D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=gW7qj6Ab; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="gW7qj6Ab"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so23364445e9.0
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 06:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769869187; x=1770473987; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6LG4U0xyn/EsldzzleuKDCZCw6DeoE0txtcEiAls1GQ=;
        b=gW7qj6Aba2gC/Vt6pNj13XE0LKQC6UfgkjGm4scPCwJcXSVNlfQf/AuhxAN1pcOeyF
         PjIgqulRCo4cU/wJn4+ZpzANDLYOsBdXqvRzZI1IPa/0CHCcFsqXZI6fdcJyn4WVIw/+
         BTsiT10zQ7xFgNvvyY75sYJK9RjjY7Ql19ZR7bXYZRcz4LHV3omes8PZppr9KNECRq+z
         4kDFdJ1OoUwMaok+9WOFxlhrw+SneVQJpxw8X5NVB93lOeK/kMItioSq2xoE9DY8czU3
         vOwRx9GAGlVHv/UBbITrGp+9ReMwcYizpGeV7R+V4eDwjv06gsFMg4wF6O7YRqk6gD2y
         KdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769869187; x=1770473987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6LG4U0xyn/EsldzzleuKDCZCw6DeoE0txtcEiAls1GQ=;
        b=AVp7rxv8pDd1jXt2veKbYgfPCDjgwhhYaWZK3LPglSKwzqTsXUFBM8VnEwKaB54S5e
         pZZ0MbMkkV7lo6NsFAu+LJtdaUGjHjggReMaRw6YdYjiV1o/bu3Aumj2JtOpN/A0M+R1
         NtMOe3aDAX5KE7xS4mPitLdOTar9bfvK96Lkn/1ZSRNqVgrienGkN1Se9bAl7dHNHr8y
         EIZ/p+Rv37pVHWhK4XHWfvXe0lZtKpvcgBm5wE0L7KTE8jD2GOZYYwh9e73X9gbL4vDE
         yWuG9L50/ucMTeqCgAtI3JRvDnKm91Fow9Ekd92SnnjRV0LNmmfQlLa9nfAS6dqJT1TL
         0yQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7Hh7xkaRqNLiO7NuXtMpCrzeaArY3Zac22rtDh5mlQ8OUz3GRjmoZvIjRjg0onhKvTXJPik1Yw2s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5iNAFE5f6azzwhYz8cIbv7B38OM8YJ906SXOOzxkxkF5+xocG
	GqAHUH+FGJ2emCBc3fIcfDtAuvF1EgJ6iOtt+6yDfYm5AsNdB8yjnpiGMnCGjf1VrsQ=
X-Gm-Gg: AZuq6aKVKpqejlApj5rde740PQ2HikxLPoQgv9pmTnBKRK0Awi43u3w5ldmEVvVJebl
	mWCudUN8ELdcGPDbIk0hz7JQnxUqqn6ALxVKq512hhRQMIzq6+qZAVUgIu3dlgMn3K1Ts0ViWhD
	MDX/iV3cWnqCT4XuzMJShwh7o6H9vNZlSqXs1kzjkiU4vrx3EX28vSjz+FSH/GN+50Tfh46jkur
	d3+WM8LGv6BqN1L3OZAhzIzoAgacRnkmSZ68zQQuirc9kA8NP94G4FrYww8bh/gVQPJOXgHF45+
	xWunNMASu16GLY6iEvv1Pwq/kKvgfUP01/C5gBatPAI4umK1cbc8Gxw1TayPEi4k8bEQJthA6qA
	UChsdNPvkYdUwrlmDnAorEqy/eAeqE5+PNFLDJMnHOc1VvECf8vrs8mi/wpObiBHYumXV3Uz3i1
	gwjEbK3lqZfi5Zv736ow==
X-Received: by 2002:a05:600c:46c8:b0:47e:e949:37e8 with SMTP id 5b1f17b1804b1-482db4ed389mr82265315e9.30.1769869187325;
        Sat, 31 Jan 2026 06:19:47 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e04a082dsm42641605e9.3.2026.01.31.06.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 06:19:46 -0800 (PST)
Message-ID: <70333077-3223-4f99-bfc9-cd3069a25d98@tuxon.dev>
Date: Sat, 31 Jan 2026 16:19:45 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 29/31] clk: at91: at91sam9g45: switch to parent_data
 and parent_hw
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <8ea67feaf45ddcaa32eab27c3b6716368979e198.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <8ea67feaf45ddcaa32eab27c3b6716368979e198.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Same here as in the previous patch.

On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Switch AT91SAM9G45 clocks to use parent_hw and parent_data. Having
> parent_data instead of parent names improves to clock registration
> speed and re-parenting.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
[ ...]

>   static void __init at91sam9g45_pmc_setup(struct device_node *np)
>   {
>   	const char *slck_name, *mainxtal_name;
> +	struct clk_parent_data parent_data[5];

Please mention in the patch description that you've also changed this while at 
it along with a reason.

Everything else LGTM.


>   	struct pmc_data *at91sam9g45_pmc;
> -	const char *parent_names[6];
> +	struct clk_hw *usbck_hw, *hw;
>   	struct regmap *regmap;
> -	struct clk_hw *hw;
>   	int i;
>   	bool bypass;
>   
