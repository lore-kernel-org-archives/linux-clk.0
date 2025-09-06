Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2911F4CAF
	for <linux-clk@vger.kernel.org>; Sat,  6 Sep 2025 18:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757183986; cv=none; b=tlQh+ocy1ADAyoj45dFG1Haf0XNfK8RfYeeXtr7ZRwfVzPTMTD+jQt1Dr8Y15RqqTFj1KRPbwhD1qYGIPuNM3sTSYIzIpEusmhH6FgjEopszYjqLEVsHYH4jmXsLUWPZfCk3/JTmewfY9QQfcL7YfdnhlWBnYVwBam2WY9okWIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757183986; c=relaxed/simple;
	bh=mqKzqDN5pv56Hlr8iaat2mwZNL44CqNS4/HxIZpY2wo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GDCZ1zHfB1iM5V/l720inB21jbNSTd4EMqeSf9AXspAPUlpLI05Z5czIX7+a841mVhbQP93l5Mb9sVOMTrkjqUHbIfsomivm8CjvlFqV/W5NwGlWVq9mrPOUDcqxxH3NuGaB9lgfBXnylBJDrjjdrK/Mt94WYEtkCeGL8uVIvOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Zhsocsv6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Zhsocsv6"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45ddc7d5731so7301615e9.1
        for <linux-clk@vger.kernel.org>; Sat, 06 Sep 2025 11:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757183982; x=1757788782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FzYoPBV1TwgFlHltcxFw4KPza8jbsfJi3V/Uo8JU8Kc=;
        b=Zhsocsv6NX6c+sMLbV4dUBjyRObeKbJmc+CVLlkMm3SdAYDj340AMf2kpP83YoL1m2
         ciRXxY4GcsbobnwCfojKLu+mVZ5DIEM2wxtYAJf50j04W0sYG+HjLK/LvY1W7f6ZLeJG
         K5G97GbNHtLmwT3nAHEkiLK/6r2yzLvaucQZRMbQM6LPKug6kucOBDO+lsaWMZOA7tcb
         r9uHuTcYghUypGLXfknq0WbyGKgSDeGBLjc+VhFrjBGUi031Xrgd88IyhSx6VNXAV60p
         YqWSVXCQBFqDURpP0uC5v/4UJt1EQanATjhGMqfDknWf3tnhIotIHPc2XUGn6zfSHRJ9
         zDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757183982; x=1757788782;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FzYoPBV1TwgFlHltcxFw4KPza8jbsfJi3V/Uo8JU8Kc=;
        b=r8DVr7ne85khkqaKXgyHS/59o8EH5tYQptVsWqU+fbZVQg0JZVBvZmp3hzbA2l/nTu
         7WZTtu4szgI9k/UosQeksvzdh6e+CGq6BzvQUfJ9PsYAmHZhD18pl5rdnzrUckNBJX3A
         xuirBQ9MFIkU0XEB9SFxcQQYmEQfeGr/RxY0uM+VuOJHCaE90ThziTXqNLmqH5JQtXf7
         ZtsCp9bR3J4L6nrIOuxq5UiMYYO0xE3n0jJ8Bt/R8SVa82h4hJr2EdiZ93Uzje5xUBlR
         nNZkzP8bf5ZBbgY8yyla+tbA3j9C6snIla3RWCXl9tzVfOJ8G5v3SdUibqyyjoxaNkJI
         BItQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr/8036KqiH9tlTL6Mw0yyCOFRu2tWvNE7HQf+Bb9Cx09Zb8UrsmtppNILOFPBmwFTQJ/6h6l5lG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YycOingKotvg+yGdE/hnfmfa9irfxCos1JNiNvVACalA5SJfcSZ
	iLzD6yVQcF7wE9b+7gGG7P703qnsQu1d+CDWe9ftu8bdQf7+IMlzxcn7Kxl3ek3NuRs=
X-Gm-Gg: ASbGncsTYuq8kwpHcbjA5qGQKNBd9nzqvHAyJxU3QvktNCKsdMTja9+BulRjMgGjVso
	/3ZgEoqlVa3QCguUT9JhMpAiqNwovBGlTjNviHHzAXxEYMNIW0JnQcL/O349dWxPLEwWa97I9Xy
	49n9/HXWDsseEskJ7TXGRojlqqFBStp3EDWbSz7mtIn4BwaOiDzChvqtxUVXqx+1mPeZhIhBsBM
	Abc5+exlxEbbocKV/HnycWFprpPeWW8FHkssQ88qJcThMo7CzaBTcfjPJgofX/PU1BOlKGrQ8MT
	wOmpKsd2ERyLsP/YTXEym9BzwFNMOXtv0+9UvVx7gxKL0IeP8Zy7biEVPgkY70QxxXY4iV00/ws
	9bj7MD1PV3PZzDEyHhpMEIW7Cvp0Oy7U=
X-Google-Smtp-Source: AGHT+IEok3JkRuMAdY7AX3j0CwwrHcGk5yIN66Gyo2mCztRV7/vmj7BLBPHvxLpcqnHCDGsjiMhyVg==
X-Received: by 2002:a05:600c:1d07:b0:45d:d609:1199 with SMTP id 5b1f17b1804b1-45ddded6ef0mr31784415e9.30.1757183981627;
        Sat, 06 Sep 2025 11:39:41 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8ab832sm373687575e9.23.2025.09.06.11.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:39:41 -0700 (PDT)
Message-ID: <2377eaff-6142-45ef-a966-0176c147c094@tuxon.dev>
Date: Sat, 6 Sep 2025 21:39:40 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 13/32] clk: at91: sama7d65: switch to parent_hw and
 parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <676e618850df0db8dd880c36cd9b6dcef7b17b8b.1752176711.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <676e618850df0db8dd880c36cd9b6dcef7b17b8b.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/10/25 23:07, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Switch the system clocks to use parent_hw and parent_data. Having this
> allows the driver to conform to the new clk-system API.
> 
> The parent registration is after the USBCK registration due to one of
> the system clocks being dependent on USBCK.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/sama7d65.c | 37 +++++++++++++++++++++++--------------
>   1 file changed, 23 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index f10faabc7ffe..1553dc3152a4 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -533,23 +533,23 @@ static struct {
>   /*
>    * System clock description
>    * @n:	clock name
> - * @p:	clock parent name
> + * @p:	clock parent hw
>    * @id: clock id
>    */
> -static const struct {
> +static struct {
>   	const char *n;
> -	const char *p;
> +	struct clk_hw *parent_hw;
>   	u8 id;
>   } sama7d65_systemck[] = {
> -	{ .n = "uhpck",		.p = "usbck", .id = 6 },
> -	{ .n = "pck0",		.p = "prog0", .id = 8, },
> -	{ .n = "pck1",		.p = "prog1", .id = 9, },
> -	{ .n = "pck2",		.p = "prog2", .id = 10, },
> -	{ .n = "pck3",		.p = "prog3", .id = 11, },
> -	{ .n = "pck4",		.p = "prog4", .id = 12, },
> -	{ .n = "pck5",		.p = "prog5", .id = 13, },
> -	{ .n = "pck6",		.p = "prog6", .id = 14, },
> -	{ .n = "pck7",		.p = "prog7", .id = 15, },
> +	{ .n = "uhpck",		.id = 6 },
> +	{ .n = "pck0",		.id = 8, },
> +	{ .n = "pck1",		.id = 9, },
> +	{ .n = "pck2",		.id = 10, },
> +	{ .n = "pck3",		.id = 11, },
> +	{ .n = "pck4",		.id = 12, },
> +	{ .n = "pck5",		.id = 13, },
> +	{ .n = "pck6",		.id = 14, },
> +	{ .n = "pck7",		.id = 15, },
>   };
>   
>   /* Mux table for programmable clocks. */
> @@ -1283,10 +1283,19 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   
>   		sama7d65_pmc->pchws[i] = hw;
>   	}
> -

Worth keeping this blank line.

> +	/* Set systemck parent hws. */
> +	sama7d65_systemck[0].parent_hw = usbck_hw;
> +	sama7d65_systemck[1].parent_hw = sama7d65_pmc->pchws[0];
> +	sama7d65_systemck[2].parent_hw = sama7d65_pmc->pchws[1];
> +	sama7d65_systemck[3].parent_hw = sama7d65_pmc->pchws[2];
> +	sama7d65_systemck[4].parent_hw = sama7d65_pmc->pchws[3];
> +	sama7d65_systemck[5].parent_hw = sama7d65_pmc->pchws[4];
> +	sama7d65_systemck[6].parent_hw = sama7d65_pmc->pchws[5];
> +	sama7d65_systemck[7].parent_hw = sama7d65_pmc->pchws[6];
> +	sama7d65_systemck[8].parent_hw = sama7d65_pmc->pchws[7];
>   	for (i = 0; i < ARRAY_SIZE(sama7d65_systemck); i++) {
>   		hw = at91_clk_register_system(regmap, sama7d65_systemck[i].n,
> -					      sama7d65_systemck[i].p, NULL,
> +					      NULL, &AT91_CLK_PD_HW(sama7d65_systemck[i].parent_hw),
>   					      sama7d65_systemck[i].id, 0);
>   		if (IS_ERR(hw))
>   			goto err_free;

