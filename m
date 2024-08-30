Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE836192D77
	for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2024 14:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725029211; cv=none; b=lLNcfFrsMNseUhGiSQZbOn/GjXULkkLbg/ghYKFl0amKEn00oBf00nluQ0THBe0qr4/VXB+44AC2/ouaBmmQwxr5wlCnCoZI9htWLxk1Jwf+5Xa9jlWkDZ1AY7MxfQyUL1jMf74ewGAjEeoQqkRGZT0UmP61Qo/lzYYPwIjG8ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725029211; c=relaxed/simple;
	bh=7a3kpXNTN1Wp34TqvLAxv/ksOuiwpxmzAvPgmREL5Xs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hgU57Z7WtsBzQuDIeKX5N6cnhGUHx9LpuLiZ5fPO7RA17OET0UsGswINvDQwOV2jlhIOHh4+cH6m5+ojUEECH89Nv1E/jamPJUiypARvymQpPFRzZzq05/PY645d7d7RlM6mFGsQuxl8/sSGjiwvU+qBtJPI2BRbbm/U8FvNxhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=caLXsRH9; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="caLXsRH9"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42bb8cf8a5bso12764815e9.2
        for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2024 07:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725029206; x=1725634006; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Brwv7WkyKWkecwEKCwzjm/DnVp0GE0+gH9FyFHdLPWE=;
        b=caLXsRH9vl0YVE/i9QJL+3q2gxQCb7r58+zNKjy6qhVN5ZCJfirWONFdDZcUGtlYhq
         lNFHS4X9PENByRBKEFNci6yG6TzDT/8zlPl34SBqhPWZ43n6ZGe5awA4+o3gO5lhyQTL
         T4OjSoZNnjHR/WelOtlh4xtvfvyv3rZSmYKGgZ3Pe6BetMDFFSDvyEss7MLPtRqSb7ax
         UKWD6G+fsij9D2PuizIWAlLl1Bn8zZerwAFhLdKPYRsHkOISUQKzLBLaGeYdBuj/JU44
         RcAt+hNcpnU25c2a9FLDhTOCOtl47ZIPvIXJ8ePSFEyItv1KBIi+1+Sh62K26v8vNsVg
         9Bzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725029206; x=1725634006;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Brwv7WkyKWkecwEKCwzjm/DnVp0GE0+gH9FyFHdLPWE=;
        b=fxfd5qfI4CZHgAzBR8f87LgO0afpED8kq6z0wh34e1E0Mow8DKZnGAz2HlsIckUX5b
         s/yNpBL7FflaMgIxnnIk+0EUcbz0UljrCD33RgggseFDFg8OWGwKH/5yhaYDLcI4a/fL
         K4Z9qdnkASjaevQ6U5M8FwEYHrxDlO3mknRdwM/Qd1uDUgCvnp3j0sdVSFSospaQs2qv
         /nX95dw/juTkfa2J6tcTucAT/2KZZXw16bD6RyFVg7pAZr0QA/HkyiPs70ZHEoadhuaZ
         LtRSeMSsCXQVKQuZY6J9HXUE5CAViuNMBYKNP0m4LzAzL8QqTibCPLKomiAhe3n1AnIM
         J0MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtfgBLi19xeMx73n8itQYaX+cOssbtG2MQO5gumprCJfiz/m5AVcyJY3jWbozr6w8LPwIhnoSVoC0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8NO9FSyRipyrvryYsSSfhT/iIPJU2BDZ25BhiZIN9qMDo6TLh
	I8AIcla0PdbNk5SitKEAGDxja2rc0oCpuPCO6MLt54Pz3SmsYHbRR2ZF+WEIASWrgr2exTA1blC
	h
X-Google-Smtp-Source: AGHT+IEjziblHdL1ANj39f0Tsx5zrgnDRCiXQmkd4mvEzUd9Pok8R2rHgDvXpf4OC34vXqXaoNYHpw==
X-Received: by 2002:a05:600c:1c83:b0:426:62df:bdf0 with SMTP id 5b1f17b1804b1-42bb0256d38mr46357805e9.10.1725029205602;
        Fri, 30 Aug 2024 07:46:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:bd15:900f:f8f5:46f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df0f41sm48102005e9.19.2024.08.30.07.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:46:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chen Yufan <chenyufan@vivo.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  opensource.kernel@vivo.com
Subject: Re: [PATCH v1] clk: meson: axg-audio: Use dev_err_probe() to
 simplfy code
In-Reply-To: <20240830080103.12811-1-chenyufan@vivo.com> (Chen Yufan's message
	of "Fri, 30 Aug 2024 16:01:03 +0800")
References: <20240830080103.12811-1-chenyufan@vivo.com>
Date: Fri, 30 Aug 2024 16:46:44 +0200
Message-ID: <1jfrqmrru3.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 30 Aug 2024 at 16:01, Chen Yufan <chenyufan@vivo.com> wrote:

> Use dev_err_probe() can make code a bit simpler.

It surely does but ...

>
> Signed-off-by: Chen Yufan <chenyufan@vivo.com>
> ---
>  drivers/clk/meson/axg-audio.c | 12 ++++--------

Why this driver alone ?

I have nothing against the change you are doing but I would not want to get a
single patch for each and every amlogic clock drivers.

>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
> index e03a5bf899c0..0637b05a4c89 100644
> --- a/drivers/clk/meson/axg-audio.c
> +++ b/drivers/clk/meson/axg-audio.c
> @@ -1761,10 +1761,8 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
>  		return PTR_ERR(regs);
>  
>  	map = devm_regmap_init_mmio(dev, regs, &axg_audio_regmap_cfg);
> -	if (IS_ERR(map)) {
> -		dev_err(dev, "failed to init regmap: %ld\n", PTR_ERR(map));
> -		return PTR_ERR(map);
> -	}
> +	if (IS_ERR(map))
> +		return dev_err_probe(dev, PTR_ERR(map), "failed to init regmap: %ld\n");

This does not inspire a lot of confidence. Did you perfom any test
before sending this ?

I know you sent a v2 fixing this, but still ...

>  
>  	/* Get the mandatory peripheral clock */
>  	clk = devm_clk_get_enabled(dev, "pclk");
> @@ -1772,10 +1770,8 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
>  		return PTR_ERR(clk);
>  
>  	ret = device_reset(dev);
> -	if (ret) {
> -		dev_err_probe(dev, ret, "failed to reset device\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to reset device\n");
>  
>  	/* Populate regmap for the regmap backed clocks */
>  	for (i = 0; i < data->regmap_clk_num; i++)

Finally, it does not apply on my tree.
Check the PR sent to Stephen, you'll get all the details.

https://lore.kernel.org/linux-clk/1jjzfyrsbh.fsf@starbuckisacylon.baylibre.com/

-- 
Jerome
