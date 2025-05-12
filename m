Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B004722ACDC
	for <linux-clk@vger.kernel.org>; Mon, 12 May 2025 14:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747061243; cv=none; b=VFBgE2+uPrPp975f17Mr8ewNhjXls5xssVduQy28U+jLAYNkfM1grfQPcVWrQUc1N8xRcQv1579e/8kW8vdkjDhYoyrDDa748ZzoE8pPhbd0PPoXVrYH8LYpXQq92q3138tdF0cUKsMJQ1JAYyNiQEOp/y8HcgEC2E16VWSm54E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747061243; c=relaxed/simple;
	bh=V4Ph5xtnAXExwa0AvHsQNBY96hLABXlDrBOSwKl/GUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAvCEE8hLlQy1yaVIi1QhoUCIdCtNeDs0NBxG69m+5eTWuA8ZiDpvPxq++9aGLC2QkSrynEsnFjjCLTlk8sSbOphwjFbUFbBdEnskllh609iYUi5zxhxX+s0T2Pzfh/K5HH/9ApCzlJupFM1n+qq+vaUzPc3VwgTyngf2DQrppM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BN/zqeUq; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BN/zqeUq"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5fcaff7274bso5329205a12.2
        for <linux-clk@vger.kernel.org>; Mon, 12 May 2025 07:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747061239; x=1747666039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m14oScEaTjZatQKNom70YWJQE9ioUexgQ6aHqmSRsUg=;
        b=BN/zqeUqrqXDS3i7sbj4A93tntjS2lUYe4YIdTli//alO9Xe1SMlTSE0PBmdP84AOY
         dZqKTZoRLYC7GV/TYX+i3D0dJG6f42cLJfoQXuHhYeOZoqumQSdr0KdIiMH9wPfiQ5lx
         QY2wZdc5R5Lw0mciAi2Q84Jqs0kA4xbc9v2y9z34F8OzwFvyCMuH5xlioSOYCbkEvbc4
         Xdk2o2Gw6+Z/M4KGjMlaPnZmyfcct6klZ4EpuP/o3BsDd/8J9UcygcNenNOL7bLb9GE8
         bfmc1Zx+xnZXVHclRebhHpgiQBOARVoXKjSZjx6rQqv5GvuFHrEyMB4v3G1DKNZK7hJ4
         xSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061239; x=1747666039;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m14oScEaTjZatQKNom70YWJQE9ioUexgQ6aHqmSRsUg=;
        b=tvpMVh7LYNyOoMjFKIQVFSzWuclPO8xBDJABk3rjHeQOwvlJqjwKGRDSUGK9yE58P4
         BRPsvw/hBPZBBcVaoz44WkTzGdDDOg3mqtGqTDlQSRnCmSAtJLJS0a9Tp0TINtb4Zu73
         LPx7eIOsNeX4z2F2uxiuaDuM7YVSob4RtMHdIVbsAC5Ddh/jZN//N4YXgEk5mTEAuRQ9
         ih15kvlPBO5tXn1zLW7cBdEzkZ6B4XnpxYmJqBND6CyYzLZu3m3YQQ8SG4TrVUK+oVJr
         Tf5FO5H2HmYEv1pZvTOX1EvcjQyh8l5J2fF5hvd9vC6S8YwN6L74NBI0+yRhEmN/gFkp
         F3PA==
X-Forwarded-Encrypted: i=1; AJvYcCVF1DvQrEdWbcP7Ivz9G8p6fHJcO1/BKJSMV6KVKTkW68JO1pwfex2YAINREdSwNqWLPAAH+im4n8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaQpNUIWhuIKgI9UsnimiNgKsfEbzrlMDGheBMyNut3aS3cwXZ
	G6XDwO6G/gfuYf2IbyXF4cimPmoA63ef5ttMdH/qq0w/0/bhwK+Z2YJbqqpEOlM=
X-Gm-Gg: ASbGnctiTGO96u/8GKmv6EgpfXrcauMv6/RjaVK0ln0o63LJOY+EPbXvY+FMbiQ5uhI
	yvbfQ+FKYvRwUMDep10pHURFOHCLnc5b6ZB/loMtmUltgyOSIoxsb2siOpr02kU7+oPxei34RiK
	XQE9AOX8qY6BGUX9w4mkdDtIfWLsvurwkSjMmvI4vooo5l+cTfKTXebj9q/J97I+kr7lnHBINoc
	Om6CcfEbzJoI2yl1UYIZGb1w8vBWaeRkOvwW69NSQ0VpYjGa4VHFpHZo+IacWygidKxYYyZVpXw
	gWCvjwxvBFYYOYvnGMeCpEGOz+UaMLIkfG3dmCVN30mGtwJxF15EFGQXKII=
X-Google-Smtp-Source: AGHT+IE/hLZQy5Y7DCvbr4+of/4o1aU9oPBRNPSjrbd3z0hNDt9f/aX/QapKka7eYc2tafxRyG/spA==
X-Received: by 2002:a05:6402:42c9:b0:5fc:954e:efb6 with SMTP id 4fb4d7f45d1cf-5fca073136fmr10674228a12.6.1747061238595;
        Mon, 12 May 2025 07:47:18 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cc26483sm5844513a12.22.2025.05.12.07.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 07:47:18 -0700 (PDT)
Message-ID: <bcf3089b-04d3-40ad-8673-db0e727fa72e@tuxon.dev>
Date: Mon, 12 May 2025 17:47:16 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: at91: sama7d65: Add missing clk_hw to
 parent_data
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1746561722.git.Ryan.Wanner@microchip.com>
 <41611e4b1eb2abd867523f707791292c6cdbc8b5.1746561722.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <41611e4b1eb2abd867523f707791292c6cdbc8b5.1746561722.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 06.05.2025 23:04, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> The main_xtal clk_hw struct is not passed into parent_data.hw causing
> the main_osc to not have a parent causing a corrupted clock tree.
> Passing the main_xtal struct into the parent_data struct will
> ensure the correct parent structure for main_osc and a correct clock
> tree.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/sama7d65.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index a5d40df8b2f2..1e9d3c393883 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -1100,7 +1100,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>  	struct regmap *regmap;
>  	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
>  	struct clk_hw *td_slck_hw, *md_slck_hw;
> -	static struct clk_parent_data parent_data;
> +	static struct clk_parent_data parent_data = {0};
>  	struct clk_hw *parent_hws[10];
>  	bool bypass;
>  	int i, j;
> @@ -1138,6 +1138,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>  
>  	parent_data.name = main_xtal_name;
>  	parent_data.fw_name = main_xtal_name;
> +	parent_data.hw = main_xtal_hw;

Is this line still needed with the initialization of parent data above:

	static struct clk_parent_data parent_data = {0};

>  	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
>  						 &parent_data, bypass);
>  	if (IS_ERR(main_osc_hw))

