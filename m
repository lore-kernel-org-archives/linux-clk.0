Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19576165F01
	for <linux-clk@vger.kernel.org>; Sat, 23 Nov 2024 09:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732353076; cv=none; b=a1+F7gKOLfeTBJrbjnwwat81pGHwg0vKuFSQ8++y/S8+J4hyHNEdlD/fnR6GmqkeMnLLzbqV/T+kNT1S499RxQR7afprIdfMUfK9SSYYY52HyaBTOaNX89n7wOZpO6R6DLzUmAtQhEd244qfrnF9zA2Q5SEnLhkDB6VsDMIm+f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732353076; c=relaxed/simple;
	bh=yVWC+NTwGEIK2g8k/Fx61C9vuvFQGIEubVnwE8WWha0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s06SoImtZDfv485N+hZyjkMRVfgZ1HooQTLj0W5S6aSkdFTm9hh5y4YwL39PhrNzHuKcEOfTifpqj1ZJqPaGFt+a2jsuWnkvG3gBDlYv9Lyqp7rvfS8qeO3yWLzHi7abxz8ft/ob9Oxe5oJqJMFqG3siRnlWZqsijdzXurezdyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zeIfEInD; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zeIfEInD"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7f43259d220so2258551a12.3
        for <linux-clk@vger.kernel.org>; Sat, 23 Nov 2024 01:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732353073; x=1732957873; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hth4LIFfFqiX8BxvmFXuMrsAdL3uE4QFJCpdQRVIJ/k=;
        b=zeIfEInDCLrFgAVTEUgfp84DbqR6xpNCmFxTYXx5QFnsYUUFENcSeIQnsJq0FAo+Gg
         MVpEe4WrRcgjQwFWjRCuF9S9CzHzjDl/9+Pf9md62kb8TOwrE4Cm4ot0Wrpn1bt+kwpy
         qtjJK6tZ1Dgy2BONC7252sZmxU2U03KnI7JA/+riYb+waHC0KyWyGmwNTLp30h4C8GKO
         WAK5lrr45zStuCAYq7VcC+DRG1D9D/qjdXi0JaQVDjqwhzf0M6MCCpPBbhcQLaTIA+yn
         Jr6IH1rFSffcByfCa8vhDW/mskSjE9LyXDbtYWcvpOniVjlw2ibIxUE58tHbAs0EXZRr
         3G/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732353073; x=1732957873;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hth4LIFfFqiX8BxvmFXuMrsAdL3uE4QFJCpdQRVIJ/k=;
        b=JN3JLIgNvY8mzWyEOFaQdnL3JB1cAonWpTpoVoNYLOH3MnUYZ86zAJgOnBpos8OvHZ
         gntJwAbjF0H6PfCAFJMjnKprUxhqTEs+Kqag9kp/WxjkHWjqFVx42Ybz6bCR6uey0ONz
         pWlJHKIl8OUxwS0jiJHuDZKx9O7qMQ9GCf/tEd95C/6m6y/zMsJOSRqfxX6hFhFzybr2
         Idljsee8Ij0pQvyTQLJYjZ4lrqQ/6MUmCJ906m1qgnrYjBdkFug73nACBHMge2uZjIjU
         XabaR/VOGttRdY9DeMEPHZts5m1+ndIjH6oRieZYukrKTCgML7T1iSTbLPMV4srrYpIN
         BE1g==
X-Forwarded-Encrypted: i=1; AJvYcCWSzXN8xxmCN5g9DmaPQ8BMuBEdhIruy0Cj2GI/mOaPdbnhkA2u89u2niZsYNo8wF0HEhAkmZhsHkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1OlZsOfzUa71gdlW1CT8tHMM+PI0REX4uyJ85QhMzJvKODaho
	1oVOA+wbHKLeQNHIPSIGjWwX7fMVub/aV3tPANeYaB5sERT6laD//Co51vv0CA==
X-Gm-Gg: ASbGnctKSE1i7IQdzeKLkaFqLhhCSUKdSWydGAaH1FY0CCo0IASoIXtK0Eoi11AJLIP
	EzVQwPsGVivcFOSeH5D30RMhm/lA63mddH0NdzqvKJyIiZJqZKAoYCYHJVou7iYSZHNYliIyRXt
	kTV9WgvxHJiyIUxWd5SK3fOgVVyAebpoXJzdq7vSzg33O5bTo+mz0yeOTk2YH+0CNSWGwZHC8FW
	7vdTX2X953KICn8s2HsKUF4d16q3J4Hf26XFaMbkn9Kc+Xpo8eFuSPGghkjaLNTAw==
X-Google-Smtp-Source: AGHT+IHSwQx5I6ydm2NN+J7aExyMX6mGiatTpiQcH3JLyc+Ei93oibZfVSEA6ImzJbB21LtSvMRsqw==
X-Received: by 2002:a05:6a20:a112:b0:1dc:32a:d409 with SMTP id adf61e73a8af0-1e09e5cba7dmr7832706637.39.1732353073302;
        Sat, 23 Nov 2024 01:11:13 -0800 (PST)
Received: from thinkpad ([2409:40f2:101e:13d7:85cf:a1c4:6490:6f75])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcbdb796esm2566484a12.0.2024.11.23.01.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 01:11:12 -0800 (PST)
Date: Sat, 23 Nov 2024 14:41:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 6/6] PCI: mediatek-gen3: rely on msleep() in
 mtk_pcie_en7581_power_up()
Message-ID: <20241123091106.bpkzqjafvxa5yief@thinkpad>
References: <20241118-pcie-en7581-fixes-v4-0-24bb61703ad7@kernel.org>
 <20241118-pcie-en7581-fixes-v4-6-24bb61703ad7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241118-pcie-en7581-fixes-v4-6-24bb61703ad7@kernel.org>

On Mon, Nov 18, 2024 at 09:04:58AM +0100, Lorenzo Bianconi wrote:
> Since mtk_pcie_en7581_power_up() runs in non-atomic context, rely on
> msleep() routine instead of mdelay().
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index f47c0f2995d94ea99bf41146657bd90b87781a7c..69f3143783686e9ebcc7ce3dff1883fa6c80d0f4 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -926,7 +926,7 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	 * Wait for the time needed to complete the bulk assert in
>  	 * mtk_pcie_setup for EN7581 SoC.
>  	 */
> -	mdelay(PCIE_EN7581_RESET_TIME_MS);
> +	msleep(PCIE_EN7581_RESET_TIME_MS);
>  
>  	/*
>  	 * Unlike the other MediaTek Gen3 controllers, the Airoha EN7581
> @@ -954,7 +954,7 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	 * Wait for the time needed to complete the bulk de-assert above.
>  	 * This time is specific for EN7581 SoC.
>  	 */
> -	mdelay(PCIE_EN7581_RESET_TIME_MS);
> +	msleep(PCIE_EN7581_RESET_TIME_MS);
>  
>  	/* MAC power on and enable transaction layer clocks */
>  	reset_control_deassert(pcie->mac_reset);
> 
> -- 
> 2.47.0
> 

-- 
மணிவண்ணன் சதாசிவம்
