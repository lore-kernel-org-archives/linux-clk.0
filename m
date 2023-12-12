Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LjmcssMc"
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F88B2136
	for <linux-clk@vger.kernel.org>; Tue, 12 Dec 2023 03:10:27 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a22ed5f0440so47688766b.1
        for <linux-clk@vger.kernel.org>; Tue, 12 Dec 2023 03:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702379425; x=1702984225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jbPV2wMixDIFUWUnk7/umRGjINWl9pny43jKnRcVaGI=;
        b=LjmcssMchsp2xW225BHUxqcynfxPOIgXUBeCfCoFlzAcSbHU99DEyldIt6LYihf91q
         9i9WQBeJxIAqkC/mck94MeMz7dcZ0XTFXl/jmRI7HULbXDSykhkFbNblirvA/DI38eFQ
         XD6Ecrg52NPFYPccxxJB36P8gX1DRUlXcjnoP4u4qT38dFjMFW3j0wv/3hJxb4WDRt8u
         lINOmPTugT/F4YSpU73GlsQ/3J5hKddhd33q+cxajIszr0BZttHC4XLuOlkX7wpHeCOi
         CHv7S+RW5ve5G0Dmgx57mnIWggiMCIFoxWe7seoLcXmUHSvW8EU1j/ck2ou2hO9IGKJ4
         DIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702379425; x=1702984225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbPV2wMixDIFUWUnk7/umRGjINWl9pny43jKnRcVaGI=;
        b=d47dEyPTi8QbT+DruS/oBW+Y3z6I8+3jyY0SbwGWAzbrxdWUpPGECSFgEUzEbzpMcj
         uGB60WQ+fCBd0TrbhzScMwVmt4ItebZ1J55OLOpmLWMry+upSA38eiF0O7KWnQaUR/Wj
         LQaqrCBxOKcpF20HJtG+6Hbghc2IhxtArWMPK43AwPeMgx+4ANfKXItL0t8AyN7rRp3h
         VYnYSuFzMjZiY6ht4TWBghIEDjclfY69qWcmVOrETeYcARE0LBhSxZ1NukAqr0dgGzoD
         Q3KD9t8IpfKbPPefXd9arL3sz6vMpplUNvUYfER0FpYwC10rNZeSQpBhKFdKgEZ7dObY
         7xCw==
X-Gm-Message-State: AOJu0Yx0x6hPbFevKhh9EfF67MphWOZi8eI97sck34ebxdo1K2+tcwH3
	8LRSpB61jn+tZWjyDI9q8GgIkVsOtclqQy+AUW8=
X-Google-Smtp-Source: AGHT+IHF8nf+cDdU2fDdNt+SuMUnOxzNy6eShdVfUfP2lwoyvnkGqx2AO/yon+kGtVkHAOxAZyhRcQ==
X-Received: by 2002:a17:906:1cc2:b0:a1f:69b1:a493 with SMTP id i2-20020a1709061cc200b00a1f69b1a493mr1923458ejh.187.1702379425654;
        Tue, 12 Dec 2023 03:10:25 -0800 (PST)
Received: from linaro.org ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id vu3-20020a170907a64300b00a1cd9627474sm6032983ejc.44.2023.12.12.03.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 03:10:25 -0800 (PST)
Date: Tue, 12 Dec 2023 13:10:23 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: camcc-sc8280xp: Prevent error pointer
 dereference
Message-ID: <ZXg/n0R7joAd1lf/@linaro.org>
References: <210d48ce-6ebc-4a6b-b30f-866d10d41a16@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <210d48ce-6ebc-4a6b-b30f-866d10d41a16@moroto.mountain>

On 23-12-12 12:21:51, Dan Carpenter wrote:
> If "regmap" is an error pointer then calling regmap_update_bits() will
> crash.  We only need to call regmap_update_bits() if we had written to
> it earlier.
> 
> Fixes: ff93872a9c61 ("clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/qcom/camcc-sc8280xp.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
> index 877341e7327e..3dcd79b01515 100644
> --- a/drivers/clk/qcom/camcc-sc8280xp.c
> +++ b/drivers/clk/qcom/camcc-sc8280xp.c
> @@ -3017,14 +3017,15 @@ static int camcc_sc8280xp_probe(struct platform_device *pdev)
>  
>  	ret = qcom_cc_really_probe(pdev, &camcc_sc8280xp_desc, regmap);
>  	if (ret)
> -		goto err_put_rpm;
> +		goto err_disable;
>  
>  	pm_runtime_put(&pdev->dev);
>  
>  	return 0;
>  
> -err_put_rpm:
> +err_disable:
>  	regmap_update_bits(regmap, 0xc1e4, BIT(0), 0);
> +err_put_rpm:
>  	pm_runtime_put_sync(&pdev->dev);
>  
>  	return ret;
> -- 
> 2.42.0
> 
> 
