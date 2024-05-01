Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF72E542
	for <linux-clk@vger.kernel.org>; Wed,  1 May 2024 16:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714582196; cv=none; b=PR9CARJ1Wzi2Hoi5vAjHn1ciXO2xf8W19J5TMoETJXHrga0DPM9A8Ezkntg55boKmuYN4PaEzfHNDFHZ6F5cj+09EcPMFAYOS2Vkhk0TxerPLjx4G23Ah0D/HRMvu3DmPP+p/JGggHVGggFnJOfwuHCvx/0xfGRgsovD0FlPlUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714582196; c=relaxed/simple;
	bh=3JSARQIpGMNBBAy7nmsP79Gq+hsfBR+N6MeC2K/TmP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQGl+SWz7dqJoVp7wBF62SWBVjg9DAM+g1/VETlUP4aV1GMNxUZWZY663+FVJqZsezkbbJKyfieq8n2O0lAxQWsQTepFs1nVizBuMEdqohA9c8NPz1I67prVpSPxhRFMwCVNiX2dpORUMqyU7VnHm5aIjoO7LAMpgBKEWlmcjRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OSOQN1zI; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OSOQN1zI"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1ec76185c0fso2205ad.1
        for <linux-clk@vger.kernel.org>; Wed, 01 May 2024 09:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714582194; x=1715186994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cepHyqKwqWvx30NtahhDLdkap0UgBbDdcS3cIZcnbio=;
        b=OSOQN1zIi36oxS4WXLif2UwFnJD6RV9lCS00BhHIxdOJt9RNh1ZRYaG7DvEcWzGp/B
         ySar+tERnu7NN5GNzK0yUJRrKeWXGxwj7dvGrCzy7PKqnNWT1n//ViAxF8phIl/shAya
         kw9l6zJKe3YXgzLGt1KmmrxUWyUPIydJK3a0qUytF6oAKfPsIpb0QmA1iq6uNyHUgL54
         3fkL6XqTJpvJjgDH23KEz/fXU2cf6tbgLSDkaSDjAsqwu7g1m+/3aS/kWERNUEz5vlN9
         3gWMX9GY/qSrcMII9DTpdtCB+ZWrDebncVfdLDEsfX4at7WNBzdDmeSO1OMFhGmlMKxW
         jOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714582194; x=1715186994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cepHyqKwqWvx30NtahhDLdkap0UgBbDdcS3cIZcnbio=;
        b=coEgi6yh928u53t90fny14IWoRXCMhptM0mfNakq7KPMoAkN71/wDBgjyNp6puo6Fn
         NdgGxp4g9G02TdXrMclGg8g6cnOaNMurWVCfP2u2iyFeDCCB1GqPUHjLGmSrB8Iu5JK/
         F/h2mxjTLRL8UsCHY3PNWJkWLryNGWR0ZH2u3i1gsghpo7jJsL7XmWNiY4rgQ2kaYkmF
         GKRaa4Aote5Q1nX3h9NIQYGX7e519r2O5lvmLYNHTvsLEIGJilFCaj/sL//eIEkXEd3y
         JKj4IpJu49fclcNL4OmWBPEVqhpK3eqpmf58jYOuaRSvzPqioqGSO6CQV9f6xh9pVbc+
         5WlA==
X-Forwarded-Encrypted: i=1; AJvYcCUHIbn6eg7kr+uqYOjRYCNprZ1PQJ2ckwmNExKH+vjBd+gGbbSc2McMbs9zhGCu2ujS6BX6ow2isBrGoF25KAH/1O9X8BhCYWez
X-Gm-Message-State: AOJu0Yx5jeXfg6ddfV+KccAdRql6E0AZb7wmo1XTKw4AQCncAChD27qK
	fEhe7/k1DAvuvq8qWXcwiGw1KsVNU0205C+Z/7hvdxOLC24/TkFe4v9DYLVZFQ==
X-Google-Smtp-Source: AGHT+IHQqhtGtE9tvxLfm8Jh6wSQPY6ndh8+WXu/q2oaOTBz/QmJS5CUhGvF7oYJsnqJUozYFMpHQw==
X-Received: by 2002:a17:903:22ca:b0:1ea:2838:e599 with SMTP id y10-20020a17090322ca00b001ea2838e599mr199000plg.17.1714582193896;
        Wed, 01 May 2024 09:49:53 -0700 (PDT)
Received: from google.com (100.22.168.34.bc.googleusercontent.com. [34.168.22.100])
        by smtp.gmail.com with ESMTPSA id db5-20020a17090ad64500b002a53b33afa3sm1576661pjb.8.2024.05.01.09.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 09:49:53 -0700 (PDT)
Date: Wed, 1 May 2024 09:49:50 -0700
From: William McVicker <willmcvicker@google.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	David Lechner <david@lechnology.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2] clk: samsung: exynos-clkout: Remove misleading
 of_match_table/MODULE_DEVICE_TABLE
Message-ID: <ZjJyrkNfWQR3tsGM@google.com>
References: <CGME20240426092626eucas1p23da5ce328d98bc13e721c2c88caa2247@eucas1p2.samsung.com>
 <20240426092616.4187022-1-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240426092616.4187022-1-m.szyprowski@samsung.com>

On 04/26/2024, Marek Szyprowski wrote:
> Since commit 9484f2cb8332 ("clk: samsung: exynos-clkout: convert to
> module driver") this driver is instantiated as MFD-cell (matched by
> platform device name) not as a real platform device created by OF code.
> Remove of_match_table and change related MODULE_DEVICE_TABLE to simple
> MODULE_ALIAS to avoid further confusion.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos-clkout.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
> index 503c6f5b20d5..e2968784d307 100644
> --- a/drivers/clk/samsung/clk-exynos-clkout.c
> +++ b/drivers/clk/samsung/clk-exynos-clkout.c
> @@ -75,7 +75,6 @@ static const struct of_device_id exynos_clkout_ids[] = {
>  		.data = &exynos_clkout_exynos5,
>  	}, { }
>  };
> -MODULE_DEVICE_TABLE(of, exynos_clkout_ids);
>  
>  /*
>   * Device will be instantiated as child of PMU device without its own
> @@ -237,7 +236,6 @@ static SIMPLE_DEV_PM_OPS(exynos_clkout_pm_ops, exynos_clkout_suspend,
>  static struct platform_driver exynos_clkout_driver = {
>  	.driver = {
>  		.name = "exynos-clkout",
> -		.of_match_table = exynos_clkout_ids,
>  		.pm = &exynos_clkout_pm_ops,
>  	},
>  	.probe = exynos_clkout_probe,
> @@ -248,4 +246,5 @@ module_platform_driver(exynos_clkout_driver);
>  MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
>  MODULE_AUTHOR("Tomasz Figa <tomasz.figa@gmail.com>");
>  MODULE_DESCRIPTION("Samsung Exynos clock output driver");
> +MODULE_ALIAS("platform:exynos-clkout");

As mentioned by Krzysztof in v1, please create a `platform_device_id` table so
that this is scalable in case we need to add other aliases in the future. For
example, something like this:


static const struct platform_device_id exynos_clkout_platform_ids[] = {
	{ "exynos-clkout" },
	{}
};
MODULE_DEVICE_TABLE(platform, exynos_clkout_platform_ids);

static struct platform_driver exynos_clkout_driver = {
	.driver = {
		.name = "exynos-clkout",
		.pm = &exynos_clkout_pm_ops,
	},
	.probe = exynos_clkout_probe,
	.id_table = exynos_clkout_platform_ids,
...


Thanks,
Will
