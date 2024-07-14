Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C417132106
	for <linux-clk@vger.kernel.org>; Sun, 14 Jul 2024 13:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720964396; cv=none; b=rZsp6HBiDGR7nTr15tqUJbvDATyNobqb6eu/vtKJkChBUNfbkFsGY5AkGzqo3g6FaeWuAHb3npniIcfRIBWwGVntnLlypfMe5RgQB8aeNKC8zjia+Ke4A3ga4tc0BxXummHOTc3iwXT6vGQpvhTTSoCpZW1p9XZraENp3+Ja2tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720964396; c=relaxed/simple;
	bh=ZRPQcaFMU/qRhT0WKNPSFjrNVmy7iseSYLfohdrjFNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Eh7teczPesLztCmy1RpuN2eoeUxUoWfew/ehGRzNSRQVoA0AZc+dfuW1EoFs53sSDQLSLWY/UYKXrMZR6U8f8Z/dPzAoFqeldlWvgWkn/6Mc////hDyuW36LlrH5Oah4hn3oo/WjNPIAGeL4QXvF0XYv7hVZFNiKsS2PR0lLFVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=CGp6LVzt; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="CGp6LVzt"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4266f3e0df8so23636625e9.2
        for <linux-clk@vger.kernel.org>; Sun, 14 Jul 2024 06:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720964393; x=1721569193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hXhsgB5kcttJ8ekP07uZnqVAhfWI+txG6dIDu3n/Ejg=;
        b=CGp6LVztg9tFNQmfau66cDC6H9WwjiMQBfjBnNJNDA7IDTT1XxVglxVvHTkvvPDbeP
         2dLdnYuyhdeG31wzzeYSeNvjYdqkgV0kmZICnL182HPE+A/KbCLwd2y/7QeVXC3elVzp
         GzYGZMH5wovMiscatJZQUg8AbDZsRdGKRGjAOnlOQzVwY3lcLEMIl2JZOecwl9eoQroa
         cb0DfvuroAlA36Bn3t27purfCXgRI+Sp1StTVu0rfl4ohhTG88o7tVCeuxCWI8sv/Yxe
         3ZqdIZ0xfTTDnp2hXc+bZZsLeLshA4/aeJdwhaCtvsm7iJ4pc9AJJV+22ZDO53VYolTt
         MQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720964393; x=1721569193;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hXhsgB5kcttJ8ekP07uZnqVAhfWI+txG6dIDu3n/Ejg=;
        b=VBJXIpS7t9faThzwC9wIJ9Jgvg5xomU7jWF1Fr/aHF4h5XDCTI75ecBEx/vBC5qfJ0
         g21paI9qyC6fHSP3atay5eAR6k4nM9LXD38XGomB/CXr8vt2QqHub5Jra4hXnUa2dDZd
         dEBgxI+Iq7DQmaKkzp71HEZbSVDGUruuHKnmy8QYMmyAPr7nzKmllUEW2CE87ubeu56o
         Wn50EAUWS9Tj9phchHWS4iC/09ahenxbvmH10TbX0CYJzv7KC+Mro3ROvL97L9hal67p
         dMKDoaVTJ/PN3mk/NCYfrZj2Q0RW+uQsibQWb7ntAhCIGrB5lqPWm0MhaPY4oD4DYfpL
         wyeg==
X-Forwarded-Encrypted: i=1; AJvYcCXR+2DkCsP9FO9T/bH/Qn+13WqiRy5FiyqQwP6BsvC68XSbnEmyQ8cc/MIXru97PKAPdZGXbKReW7aKapTYf1hsY8IaGF1Qg/uL
X-Gm-Message-State: AOJu0Yx2ue0o8E+mP5MuhUQZ58akz2Aoi050i6rNrW3WStTEIEm+pCo5
	G+jcRG5cEt8SxJgRsv8+SfPpLxsTk2pghwOHyP019b7jFuP2IEdUHK/5D1bL+Jo=
X-Google-Smtp-Source: AGHT+IHZ55PvKzpIXyAWZZwdSfOUuHbPyEFib4pjtaWAvo7Wf8TZY7mQZPs6KJ5I7pPxMEqbAjVjCw==
X-Received: by 2002:a5d:47a9:0:b0:366:e7e2:13c8 with SMTP id ffacd0b85a97d-367cea46a0bmr13958112f8f.11.1720964392929;
        Sun, 14 Jul 2024 06:39:52 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dafbea9sm3871306f8f.82.2024.07.14.06.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jul 2024 06:39:52 -0700 (PDT)
Message-ID: <50e216ba-6bb1-4794-806e-75a75d778d4b@tuxon.dev>
Date: Sun, 14 Jul 2024 16:39:51 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/27] clk: at91: sama7g5: move mux table macros to
 header file
Content-Language: en-US
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240703102011.193343-1-varshini.rajendran@microchip.com>
 <20240703102743.195858-1-varshini.rajendran@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240703102743.195858-1-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 03.07.2024 13:27, Varshini Rajendran wrote:
> Move the mux table init and fill macro function definitions from the
> sama7g5 pmc driver to the pmc.h header file since they will be used
> by other SoC's pmc drivers as well like sam9x7.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>  drivers/clk/at91/pmc.h     | 16 ++++++++++++++++
>  drivers/clk/at91/sama7g5.c | 35 ++++++++++-------------------------
>  2 files changed, 26 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index 91d1c6305d95..4fb29ca111f7 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -121,6 +121,22 @@ struct at91_clk_pms {
>  
>  #define ndck(a, s) (a[s - 1].id + 1)
>  #define nck(a) (a[ARRAY_SIZE(a) - 1].id + 1)
> +
> +#define PMC_INIT_TABLE(_table, _count)			\
> +	do {						\
> +		u8 _i;					\
> +		for (_i = 0; _i < (_count); _i++)	\
> +			(_table)[_i] = _i;		\
> +	} while (0)
> +
> +#define PMC_FILL_TABLE(_to, _from, _count)		\
> +	do {						\
> +		u8 _i;					\
> +		for (_i = 0; _i < (_count); _i++) {	\
> +			(_to)[_i] = (_from)[_i];	\
> +		}					\
> +	} while (0)
> +
>  struct pmc_data *pmc_data_allocate(unsigned int ncore, unsigned int nsystem,
>  				   unsigned int nperiph, unsigned int ngck,
>  				   unsigned int npck);
> diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
> index e6eb5afba93d..6706d1305baa 100644
> --- a/drivers/clk/at91/sama7g5.c
> +++ b/drivers/clk/at91/sama7g5.c
> @@ -16,21 +16,6 @@
>  
>  #include "pmc.h"
>  
> -#define SAMA7G5_INIT_TABLE(_table, _count)		\
> -	do {						\
> -		u8 _i;					\
> -		for (_i = 0; _i < (_count); _i++)	\
> -			(_table)[_i] = _i;		\
> -	} while (0)
> -
> -#define SAMA7G5_FILL_TABLE(_to, _from, _count)		\
> -	do {						\
> -		u8 _i;					\
> -		for (_i = 0; _i < (_count); _i++) {	\
> -			(_to)[_i] = (_from)[_i];	\
> -		}					\
> -	} while (0)
> -
>  static DEFINE_SPINLOCK(pmc_pll_lock);
>  static DEFINE_SPINLOCK(pmc_mck0_lock);
>  static DEFINE_SPINLOCK(pmc_mckX_lock);
> @@ -1119,17 +1104,17 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>  		if (!mux_table)
>  			goto err_free;
>  
> -		SAMA7G5_INIT_TABLE(mux_table, 3);
> -		SAMA7G5_FILL_TABLE(&mux_table[3], sama7g5_mckx[i].ep_mux_table,
> -				   sama7g5_mckx[i].ep_count);
> +		PMC_INIT_TABLE(mux_table, 3);
> +		PMC_FILL_TABLE(&mux_table[3], sama7g5_mckx[i].ep_mux_table,
> +			       sama7g5_mckx[i].ep_count);
>  		for (j = 0; j < sama7g5_mckx[i].ep_count; j++) {
>  			u8 pll_id = sama7g5_mckx[i].ep[j].pll_id;
>  			u8 pll_compid = sama7g5_mckx[i].ep[j].pll_compid;
>  
>  			tmp_parent_hws[j] = sama7g5_plls[pll_id][pll_compid].hw;
>  		}
> -		SAMA7G5_FILL_TABLE(&parent_hws[3], tmp_parent_hws,
> -				   sama7g5_mckx[i].ep_count);
> +		PMC_FILL_TABLE(&parent_hws[3], tmp_parent_hws,
> +			       sama7g5_mckx[i].ep_count);
>  
>  		hw = at91_clk_sama7g5_register_master(regmap, sama7g5_mckx[i].n,
>  				   num_parents, NULL, parent_hws, mux_table,
> @@ -1215,17 +1200,17 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>  		if (!mux_table)
>  			goto err_free;
>  
> -		SAMA7G5_INIT_TABLE(mux_table, 3);
> -		SAMA7G5_FILL_TABLE(&mux_table[3], sama7g5_gck[i].pp_mux_table,
> -				   sama7g5_gck[i].pp_count);
> +		PMC_INIT_TABLE(mux_table, 3);
> +		PMC_FILL_TABLE(&mux_table[3], sama7g5_gck[i].pp_mux_table,
> +			       sama7g5_gck[i].pp_count);
>  		for (j = 0; j < sama7g5_gck[i].pp_count; j++) {
>  			u8 pll_id = sama7g5_gck[i].pp[j].pll_id;
>  			u8 pll_compid = sama7g5_gck[i].pp[j].pll_compid;
>  
>  			tmp_parent_hws[j] = sama7g5_plls[pll_id][pll_compid].hw;
>  		}
> -		SAMA7G5_FILL_TABLE(&parent_hws[3], tmp_parent_hws,
> -				   sama7g5_gck[i].pp_count);
> +		PMC_FILL_TABLE(&parent_hws[3], tmp_parent_hws,
> +			       sama7g5_gck[i].pp_count);
>  
>  		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
>  						 &sama7g5_pcr_layout,
