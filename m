Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFB73ED117
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 11:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102231; cv=none; b=Q/yuh/LIeYQnhZnuYTUR+39pMWRtm1qIES5AJthNVxZOMbOdqJP+nwgN41vjKw0ULD6Xe/brcxTr8bfhieaSfaCU1fTfpJmhKPnzaQ57A1VZAeOpOZGiT+GJNdY/VNaGu9lz/PfLrFC5Ox/kfzQpy/RfJxwW1Gg8ef+icwzUAII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102231; c=relaxed/simple;
	bh=2azSRqyFV+owNxP9S5U/2/KiWIBGYAW64WefxqX8o+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dq8B4q+VgFZ5oIVJ7QdLZoh3te/bpVdfmYwaiYQLb/qAT0LHhPqHsQv+epWeGdkkWgwrf8w3Y224xI5UKUiUpUwEHsxf3eioASiateQGHjTSBfe0Sj23fwxtYTQ8FwKt2SnR6zvTmbAvZjCSdO7SMCsNr6ZR1oO06UiN2gy9ABw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zqLsGYIo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zqLsGYIo"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso10454395e9.3
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 04:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779102224; x=1779707024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ym6sU3N+ufw6A47V79Zg3TdaXBrPKwoqv75wbzIWhrg=;
        b=zqLsGYIotoXeoHpfVNbNGabN/5Eyt28OizbZhUvDyX4Cjgqm4BC89pfWSUpiZ83enQ
         Gw+PdL2Y567k9b1GfTywVB3SvX/3lgE+JWZV6swedwk+9Gj3Qd8imU5oACRKz6sZ8mNk
         e64bumy+g/uKIf2uKy00MAH6YjFeThFG7Kpd7sIMj57pU932f4p45QmJhaWR0WF3YtMh
         qY8I5QIkRFfzeCmZziVDSX+8ooBW4wfDMTgaTISjy9NwCqGLe1vgHsiqyHl+BPB+mFGZ
         wNkwtDwjjH+PsSTbBrbf0XwjXxbPxwlC3Me5FRQDFIvA1gfdnX0QczM9eWazFVGbAw8C
         znzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779102224; x=1779707024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ym6sU3N+ufw6A47V79Zg3TdaXBrPKwoqv75wbzIWhrg=;
        b=AB5/BVF839p4FtkIFl40NSauvmAtbtV4lTp48YL2ngK235A6No8vIVyrdxeqT0JnP6
         En1P+QvhkzS38fuaCIwxLZRWq+rRrnRIjjNEM+9694aaWF1RLihEvc/+Wrq4Q2uq4ywS
         G5JPH+fh+VWNN906sDPbFNI+hoPockakTAa3ItTRUDvEdYH1HaqmdTGFY800kTYjudQF
         5lO41G5/U9SCD6AGlXBkh20J4QEou0pr2PSa+KVEeEjt0S8of49JeH9CjF2yj3now12b
         qUtPNdooBHXjsjLx9UoD8BsyoY6zVkhIM0WkfBbCIb0fMXwuHm9w950VexecOVhFEt8M
         rNBA==
X-Forwarded-Encrypted: i=1; AFNElJ91Uy8b5fVEhN/tcw+Sm2VpHBIT6fvy+u0CmVArUmPu9afsOthzbAIy/lr10EzgE5rhnUvXpyRtu0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YysdnNwNGTTaWt1iZagjX8zkaozDYOmT3z9mBRCvzmHsUGAdS/S
	9pwPGtD7r44zuXRKYExkc7BNY1Uf3RrBwBx7zkWF2GP6NDE20mY6gWm3NSAVTpJssv0=
X-Gm-Gg: Acq92OH8ywhNvLd0cov+lkdW4rZ/BP6lSOq2EZqfGDFodulDd6OW+XobKYkmNfzQfUB
	QglcFtvsfgIAuzRrIrVxiyF3LrrVNcopsclp/UKHKRRG0Jutn7R6/vnIVWltJPi23z43OPpQPaD
	NzHVqjIlHtcR0Jpo+U5CwbcrdhBH1KLzbyL1FNhhp0dTCRKdh3QfwTd7yw4uwr+Acy+iZPo1Sv4
	u9tZTFkhms4IQt9X4wVxO+uaYAQRtTrf7l1laEI7qgyNEhKkjdzzYg7PKNiGefVJzekgP0lnEZv
	1Q0gIdulO1gS8aMB+REwKr0hQz1IzOunEQfdlWQ8ncAJaVwxuGpapWD+xTqf/+A7YXKtnA6Zsj+
	cHXMVAJhciaWb2y42IWWK1GddmdslchhY+dU6FQ7/m3OANQA1vdW1xpaSTsaUa8KhjotiwTH5v7
	VapE1uA4fL14QJho1u71xXCPFHbvpDx00=
X-Received: by 2002:a05:600c:310f:b0:48f:d346:e646 with SMTP id 5b1f17b1804b1-48fe60d5693mr204370815e9.10.1779102223732;
        Mon, 18 May 2026 04:03:43 -0700 (PDT)
Received: from [10.11.12.109] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5694fcasm229778475e9.5.2026.05.18.04.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 04:03:43 -0700 (PDT)
Message-ID: <1cfd32ac-4f28-4478-9f39-e75c3e12fd44@linaro.org>
Date: Mon, 18 May 2026 14:03:40 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: samsung: acpm: add initial Exynos850 support
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260512-exynos850-acpm-clk-v1-0-837532ddbf38@linaro.org>
 <20260512-exynos850-acpm-clk-v1-2-837532ddbf38@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260512-exynos850-acpm-clk-v1-2-837532ddbf38@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/12/26 11:40 PM, Alexey Klimov wrote:
> The Exynos850 SoC utilizes the APM co-processor for clock management
> via ACPM, similar to the GS101 SoC.
> 
> Add the Exynos850-specific clock variant array (including mif, int,
> cpucl0, cpucl1, g3d, aud, cam, disp, and cp) and wire it up to the
> driver data infrastructure. Add the "exynos850-acpm-clk" device ID
> to enable dynamic instantiation of these clocks during probe().
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/clk/samsung/clk-acpm.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
> index 604604b5b814..d9b2604db03a 100644
> --- a/drivers/clk/samsung/clk-acpm.c
> +++ b/drivers/clk/samsung/clk-acpm.c
> @@ -40,6 +40,18 @@ struct acpm_clk_driver_data {
>  		.name		= cname,		\
>  	}
>  
> +static const struct acpm_clk_variant exynos850_acpm_clks[] = {
> +	ACPM_CLK("mif"),
> +	ACPM_CLK("int"),
> +	ACPM_CLK("cpucl0"),
> +	ACPM_CLK("cpucl1"),
> +	ACPM_CLK("g3d"),
> +	ACPM_CLK("aud"),
> +	ACPM_CLK("cam"),
> +	ACPM_CLK("disp"),
> +	ACPM_CLK("cp"),
> +};

What clocks did you test from the array?

you need bindings for the clocks, otherwise you'll reference the clocks
in device tree with raw integers. See:
See include/dt-bindings/clock/google,gs101-acpm.h.

Since the bindings patch have to be defined in their own patch:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> +
>  static const struct acpm_clk_variant gs101_acpm_clks[] = {
>  	ACPM_CLK("mif"),
>  	ACPM_CLK("int"),
> @@ -57,6 +69,12 @@ static const struct acpm_clk_variant gs101_acpm_clks[] = {
>  	ACPM_CLK("bo"),
>  };
>  
> +static const struct acpm_clk_driver_data acpm_clk_exynos850 = {
> +	.clks = exynos850_acpm_clks,
> +	.nr_clks = ARRAY_SIZE(exynos850_acpm_clks),
> +	.mbox_chan_id = 0,
> +};
> +
>  static const struct acpm_clk_driver_data acpm_clk_gs101 = {
>  	.clks = gs101_acpm_clks,
>  	.nr_clks = ARRAY_SIZE(gs101_acpm_clks),
> @@ -173,6 +191,7 @@ static int acpm_clk_probe(struct platform_device *pdev)
>  }
>  
>  static const struct platform_device_id acpm_clk_id[] = {
> +	{ "exynos850-acpm-clk", (kernel_ulong_t)&acpm_clk_exynos850 },
>  	{ "gs101-acpm-clk", (kernel_ulong_t)&acpm_clk_gs101 },
>  	{}
>  };
> 

