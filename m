Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD572AEE2
	for <linux-clk@vger.kernel.org>; Sat, 26 Apr 2025 13:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745674556; cv=none; b=kSXmLauGor70Zayoumj+OqqWROL3ARYk2rYbJ6+XrIMicYXsqW/1gcotubCt20j+HS7C21YW6MvNf7Lmf17CM7GRs9cJR8AKzmh7LhWvzweAPb86PV9NZCHSRY+vPlqVrVOMX6yCcg+i2Lgu6sooUC6POejkYXhGlCvKPmJ05nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745674556; c=relaxed/simple;
	bh=yYCXS8YQZQjB4/1VmgQsilzMSLtC1TAavLUrwufzZm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sXLtEGl7k1VcpVse+P3lUOAfRGbtFALh1Kn5qSOuG+McA0ZVxIosSPxG4qnE+lmCnVEcLV5jXMFrCQwo818Vrwvpf+LkSu3vVNnlpTavGE49hAUw49T7dMD7afwcwtrZ8YlMBVb9gGJizfa3qJp+pTpyEWvwIC1lwMBM5GveVgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KlQN0NUe; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KlQN0NUe"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f728aeedacso2381307a12.2
        for <linux-clk@vger.kernel.org>; Sat, 26 Apr 2025 06:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1745674552; x=1746279352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tpKqYnXH25f3lqGlUZbd0EpV+dGbWQ4Gs839plYWRIY=;
        b=KlQN0NUemRBsu832EMeh6yyEqeGgVZ4fwQLH3wQT1m5B2scWGir3G1iqQyse3TX7js
         e2R8ckaJP+M8S3eMmUIfMAhobiL/ZuVFDdIRecn5b3xCcKk49y90yY8LTUR/sZWPmnca
         M7BXUNS+t05m0KqfL5NLbrauF1kkHfqIrHGU0YHgUg7DZN8Vjy0DCIehRmntQ8hgYKTu
         MCouS45uVX7FLkB4Yf4g1m8XdB0HSFwBSJMl8km7+D+KhsfnViaHmPSsWSEZR/Q61b9I
         eaDvqSwjSWbkhhOALpXsGn2dED9zPLwLJzGRm+lbChG+kJKHmnwDreb0F9PTYI8ja1vS
         19Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745674552; x=1746279352;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tpKqYnXH25f3lqGlUZbd0EpV+dGbWQ4Gs839plYWRIY=;
        b=p499zXVmmXrW3aKLu8s8i8+eNofloVECzOojvnpVSCwHMmryLHz2mWaRP+RhT5cm6o
         2qXZ6cJrXmkd+Y+mv7RtsaQ3c9grKmGzq5jGfrh0v7IzZuTckfW1h5I5tvxeoSzLdmGj
         /YE7zVQ2KvsDBL8JZ2bJWuRzKB1Gb+xsqWd5vookrLybBslnJ8On+9dVV4dsLAs+3vVS
         z2TlvaEDzfJGNEYaLRKf/A4/orOeruRMmFXcnn4MbgTUcEnxBPBX8QsmvmEbxmttyPeY
         1sTJp8FaAL9vO4KdP+Qf07cqNy2JpVs9tdnsiQtdSroSHwkjSb6pJFUcPlcnJD8K369v
         YUZg==
X-Forwarded-Encrypted: i=1; AJvYcCVEEeYmYVIJHPARH/aH6w17ba87jaNThlvs4rzshScy+aWIMKd3yE9IzgOKzSBs6j6iM5QqjToTHIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxenhwzH+EvWIRsScYN3HR7yBR3ZwiDECiADe6UmdwWoTAAy9Qw
	+T/3iOj3WG0CzqXRNuFUDbU+xeJvk3tQq/hF3IzERWmxnO9pPKB86+nX5KtCQrw=
X-Gm-Gg: ASbGncuqdkD0k/VVuVoFK2xuLOSqpjy0zALtVc6bp1P/trLpNKMFgjW0SnT9mmexsSo
	V8T9y8XRfd+J0vLZu5VZ9sUH91mCLucfGKyJ1vyldlfs2lr9xtXq1Ft0JtsBLmBnCmrCLacnGBz
	nzygEEZ44tAl/U6pdeGYS4FckBzofXN6e+9e87+tyYHU17ARt7WgedZqD7+N5gVsMx8iAI0+KeP
	5T4hJuvs3+yh4S2jWNvhfUYysblzPrEjiOW3H/GxAanEL6X3KDp1RtbYZWXyf2ZoQhCYg9ZgCWE
	JT4NkMGyrvlT+jEQhxTTqOjRvvkytNSdec+b5GS31J+iqr9cEMBHV41f6m9V
X-Google-Smtp-Source: AGHT+IEqy1Bjndt2pvxsKMV5+EcxiW6j9NOhnrynY2cN18NYigRKOQiOJgaMqvmfCZqpsJ/rAvLIew==
X-Received: by 2002:a05:6402:4286:b0:5f6:23d2:e6f7 with SMTP id 4fb4d7f45d1cf-5f723a1346fmr5017034a12.32.1745674552326;
        Sat, 26 Apr 2025 06:35:52 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7035464e6sm2639700a12.64.2025.04.26.06.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 06:35:51 -0700 (PDT)
Message-ID: <47b54406-42d8-41cd-a561-9073db09666e@tuxon.dev>
Date: Sat, 26 Apr 2025 16:35:50 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] clk: at91: sama7d65: Add missing clk_hw to
 parent_data
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com
Cc: sboyd@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <cover.1742916867.git.Ryan.Wanner@microchip.com>
 <d634ae4f72bca022e205b03c01415e90fda0bc01.1742916867.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <d634ae4f72bca022e205b03c01415e90fda0bc01.1742916867.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 25.03.2025 17:55, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> The main_xtal clk_hw struct is not passed into parent_data.hw causing an
> issue with main_osc parent. 

Can you please describe the issue?

> Passing the main_xtal struct into the
> parent_data struct will ensure the correct parent structure.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/sama7d65.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index a5d40df8b2f2..08306261c9c7 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -1138,6 +1138,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>  
>  	parent_data.name = main_xtal_name;
>  	parent_data.fw_name = main_xtal_name;
> +	parent_data.hw = main_xtal_hw;

I think, from time to time, you can still hit some random failure as the
parent_data.index is still not initialized. I think the problem may be
solved by doing something like:

-	static struct clk_parent_data parent_data;
+	static struct clk_parent_data parent_data = {0};

Can you please check with this?

Thank you,
Claudiu


>  	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
>  						 &parent_data, bypass);
>  	if (IS_ERR(main_osc_hw))

