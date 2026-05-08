Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC35B2F4A18
	for <linux-clk@vger.kernel.org>; Fri,  8 May 2026 21:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778276222; cv=pass; b=BvaiF3snizxHHHOWwUthYHrfqcZW8TmpYO2Ssl58ZEzzp2JRDssRgvW3stkp4lLY0GaHi6VCBQTE6s/6OV5xytyKmdKD8EsLUvlhJ37shPCJSmppW2yyJ5ON7SpT1B2s88jYh0Z5CmtPSfDPRGuwC6FEAaAUfPryMWElmr3QiNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778276222; c=relaxed/simple;
	bh=lN/bsiliA5s6gMUNLN8rptU2mdbXtmGNRGdUP9DfCfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nC1t9BDg2xCjuAJv3MRswh4as3YJaPC5AStn3Jn8v/8LTdg4/8KZBEVRc2BrsPewiBcJNMFjjug5opD8K3XUuaTicjZv05Us0DXX34DLzK2e6UYZ1NPSEYuftSrwdsAGgFEG6VsmqvY8zAZKM8HODYBErXNZYBqwnjnJMwzg7pE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uZo+sGcF; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uZo+sGcF"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bb91b426e40so420389166b.0
        for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 14:37:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778276219; cv=none;
        d=google.com; s=arc-20240605;
        b=ibBnXaHQUD3KYRK0v5g/VTFwc5MymcHIni7Zxa3p1t+VNt7mvWMeok3u2XQ41bRoxM
         6BVC3VqfNXi6XWd1ODYHTZsYtd4r9F7ypmhpEcZhx1wPs7zwt+hVj2muJ+ilJTkLjMt0
         IPHh6UE7epkRU8++QCYaBphvekb6DVL8sg+VILhJyS3H0pG+YEhKLSN7rQNXnXJ0ORzO
         X2cKovpRoTGoEoN1CBwyB4JQiqpoaTpoitqYS94+l7q0N7TGemNkwrZ5zvYSkuiKuPOg
         +TnX5fQAcwG4KraYEl9ViDQKTv8DWy+l7gFlXdjEXD6BVKr0hD9g45eTa+4AIY61Wv5Y
         hyPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8akv8laMlDPorJaM60exVXzt6UM6gDj1onk1kWGCvP0=;
        fh=yHhK2NB9H+VdyB/x6Okr3SLhuIrs1Kvery8kzZApEas=;
        b=Pvc6V0jE38rwc+ZzNduY0J3OLT1JoKqmIJo+KLdxFDDjkrf7ALFAWXNwsZ7r3YqSuN
         b+y3mnXPAN24NZJAvNKd9eVFdY1TdB5qqalYjo2+EMd+hKSXNWgw5hAJ1uCMv/AOW+lu
         Ua4AtOu8bo3YCysYXtRi8m/Qk8hrXAhVSUmUMUHlXH35ml4yC6tTDKsUKgsDOCqVRK7z
         JOAxUhJlv8PkDpTXxDjAetWBL3GUNw0Ll7fIiHuAHh/QCnRXeNTB9+vx827JprnBVyix
         Lj4uEjMjnJIHyUgDHiZkCX7JlXXBQ8AfmR7pSvpId7fGyWics3TrscY0tKsAh8Zqpfp1
         WGxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778276219; x=1778881019; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8akv8laMlDPorJaM60exVXzt6UM6gDj1onk1kWGCvP0=;
        b=uZo+sGcFdU3KxY2bTVK0EqJigfMOrBfXXS+iYmTJG0b1HIQwn4Jd2cDCPFkVFj1laL
         UIzNilVZXmOQgRRiXgEY85QLaf0iIK1Kt32vKP71BoiQLJE9iYvHS5S1GADyMW62bJv/
         I3NUDL9AuxCQR2MZ27ciqMmWDkwqATU8pSVYmMDYu8U84Lk2GjKNN1LfPWXN0hCr41/u
         6FVniJeBY327/Pl7MLk4eolEDEuPhqmsOLg1GtGTPACRf56G+/fscb0BuBeq+p9S4btg
         CZdgiGWOkIIXEEQacG4NuUb40Iuksg1utKYOVEshEy2Ngb1OFWzVvNYF7hA2WudW4AF2
         +YTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778276219; x=1778881019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8akv8laMlDPorJaM60exVXzt6UM6gDj1onk1kWGCvP0=;
        b=sNx77oiGbr0goMaBIiJkvL+nWgxNIMQJu8/qtPODNkoxS/U6YyR/03TX0O+biqyWj7
         49Pu8X7AkZsR6i2h9nNca+piMR7Adg5M5wWP5uxw05jSx/P7KaZNoH8xAGFJBVvpMHXG
         3hmEIC37PxsRJhfriAf5uUUILkQ4O9HWkL7cSYDs4awuw0KgGC+PxLmhz/7ISwJJZL+d
         z9w+5F/kZTNoXVVv7TV4U71Kz8aZ62K9ZbAMYxs4wXz6fIl3QICS7ZnQC8AuSvON/u+N
         MX2ScJ80FmH3vvssRYFv8m/pMRRwT/6yeaHQ9vic6rTzU/KfjUo1BVi4mc+9EglrsA4Y
         Aulg==
X-Forwarded-Encrypted: i=1; AFNElJ8wGHajSZ4V5ZDEJaLN8yiWc8agP7uTu/SuMuHKWXKkXk0ajBOK/9zE2b2uFcTTiJ3AlGvPvSGuxqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCTrns0lGIJfSdPHT46bqZz7bp8QVKLfYyBQrX283HrbGKaDve
	moL+Lilwru51QbQ1Eyfd6JVUv9pm7ENL6un6+tr9X/e+JrUlc4/PCrJojU4EJCYQ1aALTYblxVv
	8S3Zehr9dqFOYGf7EBLIfUys+T4dr937D+tMO0Za+gUtUAJBTMKOcT3G0+Q==
X-Gm-Gg: AeBDiessu58mWVdrQXjHRwKQgREkf9jruDR7Jbv6N7dJ8Phr7YUBFEo01i94ZxQAvFo
	9H9IER//zYvGEe/KCpsuV4aKgDI9MhxXEGxmOGHiRrx/NTB4FhtdoRByguB3+k47w/GCDsViyEw
	jZJvgTLSvKtsK3eEv31SxHEI+a4ST5H82ShQgyWLYJ7wk9tVXZw8z0cqLFQXsu0wEIRMuSU3Lg0
	tWew1XfCAwPrSci7t46vSrAovXCOha5A16Z06IG+FjhWCeebKQpTGpOI8upYpzCLE5hPGvRL3r1
	7BVgbqI+CQA8M+ZRZjHgOq+fLJsHObEzkhBoO/yeNxq+hpPz8GYS
X-Received: by 2002:a17:907:3c86:b0:bc4:b9d3:1013 with SMTP id
 a640c23a62f3a-bc56ae28594mr895321766b.15.1778276219194; Fri, 08 May 2026
 14:36:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org> <20260506-acpm-tmu-helpers-v1-6-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-6-a9cd5daf8355@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 22:36:47 +0100
X-Gm-Features: AVHnY4LevScaePRxr8LSmmB5UEWK-uXM16Hv4m-ApBUuggC82x63FXuRaiJglDQ
Message-ID: <CADrjBPrgkugu_smjW=MH+iDEUTKLaonqkSQBzjUFyKms5p8W0w@mail.gmail.com>
Subject: Re: [PATCH 6/6] firmware: samsung: acpm: Add devm_acpm_get_by_phandle helper
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	jyescas@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 May 2026 at 12:39, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Introduce devm_acpm_get_by_phandle() to standardize how consumer
> drivers acquire a handle to the ACPM IPC interface. Enforce the
> use of the "samsung,acpm-ipc" property name across the SoC and
> simplify the boilerplate code in client drivers.
>
> The first consumer of this helper is the Exynos ACPM Thermal Management
> Unit (TMU) driver. The TMU utilizes a hybrid management approach: direct
> register access from the Application Processor (AP) is restricted to the
> interrupt pending (INTPEND) registers for event identification.
> High-level functional tasks, such as sensor initialization, threshold
> programming, and temperature reads, are delegated to the ACPM firmware
> via this IPC interface.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/firmware/samsung/exynos-acpm.c             | 23 ++++++++++++++++++++++
>  .../linux/firmware/samsung/exynos-acpm-protocol.h  |  6 ++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index 2cebc5456968..a663e15fbad6 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -857,6 +857,29 @@ struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_acpm_get_by_node);
>
> +/**
> + * devm_acpm_get_by_phandle - Resource managed lookup of the standardized
> + * "samsung,acpm-ipc" handle.
> + * @dev: consumer device
> + *
> + * Return: pointer to handle on success, ERR_PTR(-errno) otherwise.
> + */
> +struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
> +{
> +       struct acpm_handle *handle;
> +       struct device_node *np;
> +
> +       np = of_parse_phandle(dev->of_node, "samsung,acpm-ipc", 0);
> +       if (!np)
> +               return ERR_PTR(-ENODEV);
> +
> +       handle = devm_acpm_get_by_node(dev, np);
> +       of_node_put(np);
> +
> +       return handle;
> +}
> +EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
> +
>  static const struct acpm_match_data acpm_gs101 = {
>         .initdata_base = ACPM_GS101_INITDATA_BASE,
>         .acpm_clk_dev_name = "gs101-acpm-clk",
> diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> index 08d9f5c95701..83cbd425b652 100644
> --- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
> +++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> @@ -71,6 +71,7 @@ struct device;
>  #if IS_ENABLED(CONFIG_EXYNOS_ACPM_PROTOCOL)
>  struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
>                                           struct device_node *np);
> +struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev);
>  #else
>
>  static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
> @@ -78,6 +79,11 @@ static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
>  {
>         return ERR_PTR(-ENODEV);
>  }
> +
> +static inline struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
> +{
> +       return ERR_PTR(-ENODEV);
> +}
>  #endif
>
>  #endif /* __EXYNOS_ACPM_PROTOCOL_H */
>
> --
> 2.54.0.545.g6539524ca2-goog
>
