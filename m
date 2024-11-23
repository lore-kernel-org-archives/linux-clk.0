Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089CE257D
	for <linux-clk@vger.kernel.org>; Sat, 23 Nov 2024 09:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732353035; cv=none; b=p49LFlL/rRUfgjzLbuCUPQEyk3hLlJX3bsicPnvtw6scq5GVcszzCTydQze0558BIUxwI7OR4e+9VXGW069AUK8Sz5nBBKMLYv+HMLujijv/fq+zN74aozshkBqW1VGaPmyajmeuNN0iCUMBz1g/NmbW9m1ztPjdlfxIDwyEq80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732353035; c=relaxed/simple;
	bh=YrDXDQaF2u79zCUNwK+NQ/EBwGihi7NjZ43+gmAFMKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GoGNfU3ddVgCPA9u2jeQHMWFRGfcsf4StBQeiGEoF9FVjG9+Cs/h4TK037tUo9gpsB4T7z9VJLVu0fiemilXuOQ5iCZh0PpzabFcg89nBCYkHNA/k9gYPTFXQaqY2U0Ji868RN40/b0Fene9k8WCCkysDqmC5U9ASt/wrOgswCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RBOkdZ8U; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RBOkdZ8U"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-724f1ce1732so347977b3a.1
        for <linux-clk@vger.kernel.org>; Sat, 23 Nov 2024 01:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732353033; x=1732957833; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rKjam0B/w5hfD9V6wh4VdWDXNhOxELwdpw95PhwOCuE=;
        b=RBOkdZ8UhHVKNl8jT5hMHkqwiq8CdAycMlwDMsNarAtUlsCWIgzyNZ+Pp+rQr9JLnz
         oJiNRoXsyGjC/+i/kcjYqVxGdwjFlivu5kth6tAxZydDodFwJkob3+G/LA8cVdJrLhLi
         GwW1ewTmmOtNQekxU5wWrlk/dwLRaRMGw208Es5xM9AUthU7a7e9JJ8dtXe1nyD8Dz3s
         1mRCetuBK0X8YnEZzIED1aeOJVBCfMa2GDvr5QNDvvfeu4YEYhYJh1J7gY7h1o0lI4e0
         fH5H9Ha3kFXIBwXi/d70LXDthDWdrOmm44sZIhK5GrpHhItMxu2r2HwrIddjdInsLJRf
         AkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732353033; x=1732957833;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rKjam0B/w5hfD9V6wh4VdWDXNhOxELwdpw95PhwOCuE=;
        b=EI8W7Cjfp5Yl3wLSzqaYvXV/rYlXgyolCO/1CpUD7Sb0GboZ1XIo/2IofFO7oYxKMG
         VA20S1uv85B79BHdpMca4tBY4efGKEeWyTfmLEzMXCXKmqZm6dJUJGWp7e/xDI/vxGQL
         IeLAPTvKORPutuWUulQj8zbjcrNaF5Vfz5QRWWgS1Cl0sXt+Ey6jqa8R0oQ5h95YhEYi
         D5cYb1APp/n09+nZfdky5XtokZx8F1ldaUMiHzaUioRUHIxyYjF3dGYy3oBzFGkeGx3B
         6M4qKSOma+MMTg1SUDalc/2r7yQ1yXg4ciCD/SRVV2M0AOvSy/e3l5LozRIQQsKAo66S
         //TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxUFmyIZ4BUGLbgrGfYOB/S5wYnremvfhjZBoEHrhHO4h1Hcn2oEYoUT7F8QlXMByHrsjOSPWYlsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZu9ASMmGXLvKlROnJNNzr/jmizNUcC0qsqVRvFpLmFHyExw2N
	tnb1eDN2B6XcX+NQEfbGcvDAFvscUt+NtJK7LDyjdUOr3RXxLAurvJRXCX1kRQ==
X-Gm-Gg: ASbGncvEaH+mW5g6LVxjhD2Q3SDbBbw5Dx1mQpLaLvirkaoMDIgDXSjARufAYTZXced
	F1BfXSNBByxivTOimZAYAYNJqROVsKC3+5kFZfP8eYvkeB54JjwqojXE+nbEV3LQ7YVa2vCUzGS
	jekhLTZc4ORJu2TYZR43G9AKe2gsmBVvf5gj/nXl3PY2k28l+hgOGNdChhYqDgrfLe2YJXWCy8o
	aK/675ZGBBfdgYzf45CWKFCxBxz3jg9EnwPQm3fA/fVfqoFLRWloE+RdKhuHcuMUw==
X-Google-Smtp-Source: AGHT+IHj2ihR3OTEsdM875zHnE9nbqW0UuK2wW3/aojdIeu60uxcPJQ+XX/fzZd0wj3T8K2tm2vwLg==
X-Received: by 2002:a17:90a:d40b:b0:2ea:5dcf:6f5d with SMTP id 98e67ed59e1d1-2eb0e528054mr7801274a91.16.1732353033351;
        Sat, 23 Nov 2024 01:10:33 -0800 (PST)
Received: from thinkpad ([2409:40f2:101e:13d7:85cf:a1c4:6490:6f75])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2eb0cd35e98sm2942936a91.0.2024.11.23.01.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 01:10:32 -0800 (PST)
Date: Sat, 23 Nov 2024 14:40:26 +0530
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
Subject: Re: [PATCH v4 5/6] PCI: mediatek-gen3: Add reset delay in
 mtk_pcie_en7581_power_up()
Message-ID: <20241123091026.qxoeb2qye7kcwikj@thinkpad>
References: <20241118-pcie-en7581-fixes-v4-0-24bb61703ad7@kernel.org>
 <20241118-pcie-en7581-fixes-v4-5-24bb61703ad7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241118-pcie-en7581-fixes-v4-5-24bb61703ad7@kernel.org>

On Mon, Nov 18, 2024 at 09:04:57AM +0100, Lorenzo Bianconi wrote:
> Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
> causing occasional PCIe link down issues. In order to overcome the
> problem, PCIe block is reset using REG_PCI_CONTROL (0x88) and
> REG_RESET_CONTROL (0x834) registers available in the clock module
> running clk_bulk_prepare_enable in mtk_pcie_en7581_power_up().
> In order to make the code more readable, move the wait for the time
> needed to complete the PCIe reset from en7581_pci_enable() to
> mtk_pcie_en7581_power_up().
> Reduce reset timeout from 250ms to PCIE_T_PVPERL_MS (100ms).
> 

and this reduced timeout has no impact on the behavior? If so, it'd be good to
state it explicitly. But this information can be added while applying the patch,
so no need to resend just for this.

> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/clk/clk-en7523.c                    | 1 -
>  drivers/pci/controller/pcie-mediatek-gen3.c | 7 +++++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 22fbea61c3dcc05e63f8fa37e203c62b2a6fe79e..bf9d9594bef8a54316e28e56a1642ecb0562377a 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -393,7 +393,6 @@ static int en7581_pci_enable(struct clk_hw *hw)
>  	       REG_PCI_CONTROL_PERSTOUT;
>  	val = readl(np_base + REG_PCI_CONTROL);
>  	writel(val | mask, np_base + REG_PCI_CONTROL);
> -	msleep(250);
>  
>  	return 0;
>  }
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index e4f890a73cb8ada7423301fa7a9acc3e177d0cad..f47c0f2995d94ea99bf41146657bd90b87781a7c 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -980,6 +980,13 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  		goto err_clk_prepare_enable;
>  	}
>  
> +	/*
> +	 * Airoha EN7581 performs PCIe reset via clk callabacks since it has a
> +	 * hw issue with PCIE_PE_RSTB signal. Add wait for the time needed to
> +	 * complete the PCIe reset.
> +	 */
> +	msleep(PCIE_T_PVPERL_MS);
> +
>  	return 0;
>  
>  err_clk_prepare_enable:
> 
> -- 
> 2.47.0
> 

-- 
மணிவண்ணன் சதாசிவம்
