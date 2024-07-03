Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D4213A27E
	for <linux-clk@vger.kernel.org>; Wed,  3 Jul 2024 10:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720003843; cv=none; b=UwVeJ4aQ1wyVwAqNdNdphy0lF8HWfNizVXzC3Fk19ZGbmWnwvPTPkgKeHTakrzMk1RC3v3rMFeyWvrr+yTzZEsW7eiRL2yvk8I0k5SO4Z+D+4d7476/dbknp+DGc4Z+ob2QzabPXH6PZ7/k8i89hrQ9fxjgGJR/baswDu8QSp1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720003843; c=relaxed/simple;
	bh=97g5hVGvQ1qwpc2CPaPuBD9gaA9Pvxly1JlZf2rwD3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzHMnmdNphAZt4tZRnYko+GG1RXSWgToHJIrxCsv//BAHLKkMHiOKGBK+xWyEYpR9VfSxvOeMNad8Xwu66iqZLKdjRjr8axaVfmpcHmFtbt8gM+BR+EMp9U1M3G+am+zWxK/cEu8GjtZri5gm/Drb42DOEZFuJdUHltFNA19oh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F4C8QV16; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F4C8QV16"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52e8b27f493so3796144e87.2
        for <linux-clk@vger.kernel.org>; Wed, 03 Jul 2024 03:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720003840; x=1720608640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mAbweGD+BN+79RknZZB5w0QdvnNoIWN8iG0fgQ2u8ZA=;
        b=F4C8QV160Oz6Ca5n57eEGTogOSb210p84C3bvYKLKi81s7xhv0XKJw1KHMuiVaa12U
         sDauLBwUZNi137ILUZKwf5Z+MgUyO0LYkIsrYW5mbtYQZr2upiCLpZAOnUntWe598zju
         IQRtbViUFGOafI0n6W45pRjN4am2FCjiJeGoh/8g07GfMEiZIQZgHyL3/9SCQe/OTJ+V
         pBpoK0OdH/D0zxIUUEfOVZoJvVPZh3N/zQuFe3ZbI7JRaN0AGc2+icKMby2WIDwptVmn
         0dyLAMhuwABvvqnB6f3ktfB5YFMsf/IyAfGmpfLrppnIoNwiCtF6EBBBovg7gBBXL/hI
         JTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720003840; x=1720608640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mAbweGD+BN+79RknZZB5w0QdvnNoIWN8iG0fgQ2u8ZA=;
        b=hoU0ntNLOZgRVeqx5SNnnODDoasLcNBIZStL6FX2n1/WprDXCQ5tOLPGVB8hMImGzB
         bEekWGfx0s7e3gWvLEl6OO7yWszAf8Fq9kLMk+8/ThTROY+mLqvwDXfeh97daiyG0voT
         Ajp3vi8CwlE/3Nw2B1//ZGWM5iMBx89NVK2+oInafn/RDML2xgms98AYrkhjEVQXhFiC
         Rfuj8ki0eV3OwclZGr6UazJ63iVD35o00W8qTy/zCtwQTow6N9jTVcArsj4NoB6oU3TR
         rEjyciUE4vnsqSfc2VeTrhCR+XC5xyrRlGlQGYOS8NGlYC7C3qfUoeXDh/99d38aTnoK
         ca9w==
X-Forwarded-Encrypted: i=1; AJvYcCXGaLMQR0rNUxMWTtuylLpDMcUZryzEU0Ye+nBGBLcfwdPjk73IduNiR1XXIvfW/1QwP82sDPrpAQZ4Y3HZV/gw/x9Y6ncP8mjz
X-Gm-Message-State: AOJu0YyoHhEc6fQ0BSLsTpi0rjUjHc3FKL9UTGrofpYv3koSsAEtOmfa
	I+i2u8xkUMN8/E1n9OJVYnvhVYBGz8/j7riMDrHmpb+xySAz+gJ8gEsyj5VQzqc=
X-Google-Smtp-Source: AGHT+IHOOKL4YyNeD/zQtvaedknaKcTA38zEaMOgcwZsU9QXJ4gpOSNYzoc+NWDud4SlyJkddZjdUA==
X-Received: by 2002:a05:6512:39d3:b0:52e:7688:2817 with SMTP id 2adb3069b0e04-52e8266eaebmr6364231e87.17.1720003839232;
        Wed, 03 Jul 2024 03:50:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab0b7fesm2128928e87.31.2024.07.03.03.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:50:38 -0700 (PDT)
Date: Wed, 3 Jul 2024 13:50:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michal Simek <michal.simek@amd.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 08/10] clk: qcom: lpasscc-sc8280xp: Constify struct
 regmap_config
Message-ID: <wc5hbb77tc2dalf6feg23ptdxdd7cjhshkgnbeiknalqicu7gn@jghelw744yot>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
 <20240703-clk-const-regmap-v1-8-7d15a0671d6f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703-clk-const-regmap-v1-8-7d15a0671d6f@gmail.com>

On Wed, Jul 03, 2024 at 11:50:21AM GMT, Javier Carrasco wrote:
> `lpass_audiocc_sc8280xp_regmap_config` and `lpasscc_sc8280x_regmap_config`
> are not modified and can be declared as const to move their data to a
> read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/clk/qcom/lpasscc-sc8280xp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
