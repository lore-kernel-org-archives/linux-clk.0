Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F80B165F01
	for <linux-clk@vger.kernel.org>; Sat, 23 Nov 2024 09:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732352761; cv=none; b=PddA2GrpiVqPIh4Fz5X6OVzw6k5MeqejolU2B1TUN6htxAw2p8NkDsp9xAQfFx+HWJVir1l9hV7k8Jyl4sUyNcLU0uWB+EzMpFigd/8kFFuRB2dfW/3v7f/Q1UfIwQlf3aMeLB195Pi08QzHIvt+bzQatx/+sWCx7YbPvbr7AQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732352761; c=relaxed/simple;
	bh=Dca5lQQZBUuYnZig9XxYqsF1j66VHHMxoeFJ12Du3jU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ebe/auDl8feXAw3VF1F5GchBmP/CB3oadwPGTDGBqRkNzLBU16cTNcf3ymYMsvyMoXNGj9AORAgFSlAAt3WMPTsYtSlFMWHu42cjwIVCWAG1dwVgdFUPTtLV0Q01NGuCfuUctJcKNciIp39YSPO4dWbZoFbdSjGreKC+PLVjDyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FNAJ981c; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FNAJ981c"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-724f0f6300aso583096b3a.2
        for <linux-clk@vger.kernel.org>; Sat, 23 Nov 2024 01:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732352759; x=1732957559; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xZiVNGou0sUPR+VUZtEVpUsLh0jpbMmext51WC1uOek=;
        b=FNAJ981cPe5tnAAV6pv/2mxEsw61y+jFgByg064fT1NZqYLclaehCqF9Kr75HiJde4
         dGG8EnDHyGqG69nFZgRosgL9Li85G54mzyKogPY5BEFxDF9dZnFI3q8+N6O7IUbL/r0e
         /zAgMdhcAWgHEFzLX+nmoMlR8hCi9689OCW9a1w2ysjZJHjO2clBl0OZz8lbEqDiwhGx
         dJjVojiBs0Cdl2zgtFA5rR6y3BqQHX0KefVPkXJKMrOAnxqjjTZt9EZoY3Vilo6UcQ+D
         ql75GSbn9GLjDE1FxsbUktTzM4WtO9boCSopO1l9deRAC6H9FqJEHNUjP3WYcuawZZn6
         rr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732352759; x=1732957559;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZiVNGou0sUPR+VUZtEVpUsLh0jpbMmext51WC1uOek=;
        b=i2ADs0YUDaPJKQpmralkYQoieWqz5xFlziQKxp1xSxHvAdyZRZmeWzADiy5rUyOw/h
         DDB0akF8YC6om0zZ77IsSvTFbI6N2Ob/80lxi6jl6rdEQhLZbHvShKpqO62r4lHdNUHX
         peckdtVoKxUM/e4KIohyzNkT5Ny8xf6TkNeRLYKUXMkKI34puFBK64ssp5x94ry+5xTE
         8Yqr7aeEZliZXq3sVZms6urWiDroGA96gWmzvoCvUxue0SM0pGKhM8nOzruBtv//aoht
         RKmM57QTzETmoUodEFNo1yDqGY5lc/xo3ZW6TUCB00WFLt5WqaMqiStQBrZa99fRMtO+
         b3aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx/OpaVpgbmPzZGP5pd6aiR6eP7WbMVuoop+D4kLUTfvz8Sm9CF+bRNl45VgvLk7eF6K8uqxZUrhs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEZotI1jj6NagOR5j75FpLogHNqC2XbzjujmCDIFjA1QSfyUXB
	uNC4oBOerlc+T1d1NNGimvdD0ENUBpo3JqBg8siqX1iCXh7nLsVg91WS409z7E8tZQBNL/B3fuI
	=
X-Gm-Gg: ASbGncs7MCkrjZlYVfgzyi3Vr44vfG/t0JWxQFcHzmrXEDO3X/QvnNPi5pwqCaJynQZ
	0cx6XolF1IE8zuR53fGa4luMJSdC0BckrxuZc+b7lY9L9JWVyn+NJyTRVirLq21iPzNWrVspT37
	qodEl7Ezc2/m5xCzGY3v86HJtUqVywjKBcv+CCtcsbZLPFs51iczIFa/x3epBk/ei4wxDI6rLPm
	yZKXsuNN8hls0SMPOMpj452txQN9jUvmypW10NtgNO4ubvUJ3noAGECWeajzeZ/xQ==
X-Google-Smtp-Source: AGHT+IGmEszMNhZtwje0Xvl4SgF09bMp9/3Vg2UfRxuTgmP2VK0VjGMW/4vV+mCtT1R8tU+WzR0uag==
X-Received: by 2002:a05:6a00:244e:b0:724:591e:ea20 with SMTP id d2e1a72fcca58-724df66d881mr7872246b3a.14.1732352758798;
        Sat, 23 Nov 2024 01:05:58 -0800 (PST)
Received: from thinkpad ([2409:40f2:101e:13d7:85cf:a1c4:6490:6f75])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de532db3sm2877085b3a.93.2024.11.23.01.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 01:05:58 -0800 (PST)
Date: Sat, 23 Nov 2024 14:35:49 +0530
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
Subject: Re: [PATCH v4 2/6] PCI: mediatek-gen3: rely on
 clk_bulk_prepare_enable() in mtk_pcie_en7581_power_up()
Message-ID: <20241123090549.epzrv5o2i5q2mgz7@thinkpad>
References: <20241118-pcie-en7581-fixes-v4-0-24bb61703ad7@kernel.org>
 <20241118-pcie-en7581-fixes-v4-2-24bb61703ad7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241118-pcie-en7581-fixes-v4-2-24bb61703ad7@kernel.org>

On Mon, Nov 18, 2024 at 09:04:54AM +0100, Lorenzo Bianconi wrote:
> Replace clk_bulk_prepare() and clk_bulk_enable() with
> clk_bulk_prepare_enable() in mtk_pcie_en7581_power_up() routine.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 4d1c797a32c236faf79428eb8a83708e9c4f21d8..3cfcb45d31508142d28d338ff213f70de9b4e608 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -948,12 +948,6 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	pm_runtime_enable(dev);
>  	pm_runtime_get_sync(dev);
>  
> -	err = clk_bulk_prepare(pcie->num_clks, pcie->clks);
> -	if (err) {
> -		dev_err(dev, "failed to prepare clock\n");
> -		goto err_clk_prepare;
> -	}
> -
>  	val = FIELD_PREP(PCIE_VAL_LN0_DOWNSTREAM, 0x47) |
>  	      FIELD_PREP(PCIE_VAL_LN1_DOWNSTREAM, 0x47) |
>  	      FIELD_PREP(PCIE_VAL_LN0_UPSTREAM, 0x41) |
> @@ -966,17 +960,15 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	      FIELD_PREP(PCIE_K_FINETUNE_MAX, 0xf);
>  	writel_relaxed(val, pcie->base + PCIE_PIPE4_PIE8_REG);
>  
> -	err = clk_bulk_enable(pcie->num_clks, pcie->clks);
> +	err = clk_bulk_prepare_enable(pcie->num_clks, pcie->clks);
>  	if (err) {
>  		dev_err(dev, "failed to prepare clock\n");
> -		goto err_clk_enable;
> +		goto err_clk_prepare_enable;
>  	}
>  
>  	return 0;
>  
> -err_clk_enable:
> -	clk_bulk_unprepare(pcie->num_clks, pcie->clks);
> -err_clk_prepare:
> +err_clk_prepare_enable:
>  	pm_runtime_put_sync(dev);
>  	pm_runtime_disable(dev);
>  	reset_control_assert(pcie->mac_reset);
> 
> -- 
> 2.47.0
> 

-- 
மணிவண்ணன் சதாசிவம்
