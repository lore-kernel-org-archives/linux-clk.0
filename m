Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E8413210A
	for <linux-clk@vger.kernel.org>; Sun, 14 Jul 2024 13:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720964337; cv=none; b=iZgKLQfC0/gtuCPNBO3Gum1ubCi0CSNH9SXHDHgaVJbNlEHM5nJXkX7QCu+9DpQEa/tNiO+W/pp6lK8evnfeNk7Hvi8TGmA2Opr7yLBP+dALDpEhGe2CBkqRaP7XU6T/65zy0p3TvcyCE7VTPapA49yF+YK0Bb5kaTPWZyqKy24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720964337; c=relaxed/simple;
	bh=B3xuHRBuHoa230RyJGbZ5wSJRZMe9eb0eEMIE4pfxng=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lNA9TAeodmafkwi7WCFlH1USJd8TRiv3pT3KO5hfDL0E4YKlzHtOScTOG9XqsrDeo7bHEePgyP5UcyUUKsd92AZNEcROzmY6mLQTS0K5gPcoEY9N0DqU57laJb089WL6Rl+LFox21awKnw+NvdIwOtfmYZkAst3VQNxDfsNGb54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ghOS0W+R; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ghOS0W+R"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4266ea6a488so26869085e9.1
        for <linux-clk@vger.kernel.org>; Sun, 14 Jul 2024 06:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720964334; x=1721569134; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r39c9BCN+jg7BbDLwYi3q6RBwDCZYgJj4DGme1UyFk8=;
        b=ghOS0W+Rv5e+9STuJ0x5VdBI6oWU1jBwiwBg7g4MX3v6gIcbqxvncnSju/9WQDDmQU
         +F1OCm0daxEAoKyKwCnm+3ooeaQZt4duJftqD9DB2eeU289JLSMRC34N8k+3HfbMCO+V
         sgE1QsSx+l0Skjvw5gbWmpdQDkxjlXhi1LiRS/mLGt78raolAaYnxR4t1Co9aKRR60uz
         5DfPtRgk7DNyu5oY++cYm1HYlPSpvNrjFVJgc18fFH22Wga9ct8YVTa2ilUm4B5yXmjh
         TiRVdC8HEWgmkP6c8ILl4U9N0N1weweuguKrKxQZbKdGkIQpGfB1PUe1+vyX0gwiSBbH
         Ccqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720964334; x=1721569134;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r39c9BCN+jg7BbDLwYi3q6RBwDCZYgJj4DGme1UyFk8=;
        b=BTfYAr411BqqZLQQcHt+lpH3pRmd1aq+TlM6Zkdg7FKA2J0WPlzkmLQGdo73tdWyir
         WosoFu0aQcHAd7fUzaFb7M6e/NbY1jRUJRBdwJmq6FeTd/MMc4JT2yU8JP29/ZcNFJu8
         XhJuYVsaC85MS8VFFKy7l+Fg2iI0qp1LAo+4eKllZJoCekkS0QNqkpFr8GvqfQ8Rj5C8
         iFhFJv73ZdO06pgs8znuNuhL4UYgrMoRtTLiQBd6DAEFldgVrzrVhnvFLekzDtWI8pne
         36zSuPMz4ZUVJErA2pIEIc77SpnVXSJkrGeh57dDUEnqfGEkd3hcIey533SMzGfsD/YM
         XLTg==
X-Forwarded-Encrypted: i=1; AJvYcCXnioGSh7OUbC2jqYa8jSGj5tQ3M8nFoE5gGSstpN60Nqbu+uhywp/0Gdle2VPrVENPOW6k5uEk3jMTHGh/OjoaZASFfs0LDhXE
X-Gm-Message-State: AOJu0Ywq/ulXesb7LVvp9IqvgIsxtgQC+OVMueWybyh+l7rtuHqAXHpv
	FWgBFMpO96Ei3MDsIz4bR4T9yYH9s3oso6qEIpbOLlBVRmKLvCrP3Gs0C7+lxCaW/8DURB9QE+e
	d
X-Google-Smtp-Source: AGHT+IE4jtSEO1yWmx3Qfi8/Ckim4CjNiCjfZEXUY8ozTD2+o0rwCjYBEaETyLa0t6w2X2UpuO1rHg==
X-Received: by 2002:a05:600c:22d4:b0:425:81bd:e5ee with SMTP id 5b1f17b1804b1-426707d07c5mr146355945e9.16.1720964333986;
        Sun, 14 Jul 2024 06:38:53 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dafbea9sm3871306f8f.82.2024.07.14.06.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jul 2024 06:38:53 -0700 (PDT)
Message-ID: <c6e9f1d7-b262-41ff-87cb-6087004b6fdc@tuxon.dev>
Date: Sun, 14 Jul 2024 16:38:52 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/27] dt-bindings: clock: at91: Allow PLLs to be
 exported and referenced in DT
Content-Language: en-US
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240703102011.193343-1-varshini.rajendran@microchip.com>
 <20240703102749.195907-1-varshini.rajendran@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240703102749.195907-1-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 03.07.2024 13:27, Varshini Rajendran wrote:
> Allow PLLADIV2 and LVDSPLL to be referenced as a PMC_TYPE_CORE
> clock from phandle in DT for sam9x7 SoC family.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
> Changes in v5:
> - Updated Acked-by tag.
> ---
>  include/dt-bindings/clock/at91.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/at91.h b/include/dt-bindings/clock/at91.h
> index 3e3972a814c1..6ede88c3992d 100644
> --- a/include/dt-bindings/clock/at91.h
> +++ b/include/dt-bindings/clock/at91.h
> @@ -38,6 +38,10 @@
>  #define PMC_CPU			(PMC_MAIN + 9)
>  #define PMC_MCK1		(PMC_MAIN + 10)
>  
> +/* SAM9X7 */
> +#define PMC_PLLADIV2		(PMC_MAIN + 11)
> +#define PMC_LVDSPLL		(PMC_MAIN + 12)
> +
>  #ifndef AT91_PMC_MOSCS
>  #define AT91_PMC_MOSCS		0		/* MOSCS Flag */
>  #define AT91_PMC_LOCKA		1		/* PLLA Lock */
