Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2D8257D
	for <linux-clk@vger.kernel.org>; Sat, 23 Nov 2024 09:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732352822; cv=none; b=uVNNM5D/InJM6ca74r92kCGhbAypTCTKfbjPPl1p9yWKlM/jCMCe7AWOaJd0CU6yi1tj71MOr2Fn67cbTNmE2Kg22GS0rMT2voVW5ywDprI92+jjr1XLkPrHjIpYo7M6HNSRbovfSIwTjXBqClA9ZChQlTzA6k9CDqx5R4fj4mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732352822; c=relaxed/simple;
	bh=zsSAW+XK5JeI5gVARmUmgZjByt9qyUKUI9oqemfJ5zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+Nxy3+c4VE93mvKHlLRjSZ4JSzLVzVbCsnAIxfcssWqO48h5F/XMkihlU4VboRQxQ3F9xdHsX8rNYqttYFj4gwP7yThFlCkUQZA6NRmMmE+kfraeaezlu9oAmBHNEcOpBFWRVvJhCV3PHzTyqErZP/49QT2m9nkYemdZcC3C90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r5z6K4dz; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r5z6K4dz"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7245a9d0e92so3265627b3a.0
        for <linux-clk@vger.kernel.org>; Sat, 23 Nov 2024 01:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732352820; x=1732957620; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yZTqoEwTktGmXK3Qx5NYMXzlUej11tS8qvukucVyF4s=;
        b=r5z6K4dz2ThFAUpZARN7/Cz8+YXfgxfx1yEPU3MFFlzoUNCKZIVodxbKlEjei5RBhX
         WqvVYHirdp8LZGNrGJDOrg5IatX0w9Ru+w15IiiFy9wcZBM8AdSfVZC7mtzU15efPzdx
         Zjbhe+PzZHhrGwa6We190XyzVczZWArvp1U5UEgoCBi9vMPYusiOE9WOhZyykik2D86v
         63CHSMVEIovx/VJeVQRXJt+jxtjKmAW75nbI3Jq8wIUfMc4CmoVxKTh04/FMrhXoyZui
         1jh+x3SsMGghMRv5y/6hvGqSA9XYgGeD9XwDbgdqHH/xTQ/ArVdnZDsAi9insLk3YNYu
         Ei7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732352820; x=1732957620;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yZTqoEwTktGmXK3Qx5NYMXzlUej11tS8qvukucVyF4s=;
        b=ADlTQ0oLwj2rOu2I69X05DgAw1OfIOqaTVIThbGsAyjK3YOyFIH/TvdSUyQoJX23Nu
         x4k8gsKAEzcyzZ3EvVekAs9s+Awn6uevx2Va/jBXg8xhkJcJmymgvmx/Zb8y8KvkPSK5
         ylG7S7mvJBn+wxz2DpPUeaQ+GQF7VLa/r6fhvljBh86pE5huVDYRy5SYI8DP5QefQysK
         l8hhCutulJ5vArqi1RVElgdjgX5I+dqTgoVmnRrmvw38XKjqZaH0tUPQPZFAxsleYTaD
         bnhJL9fI84o5dIy9iYHyAPICKvB5EHt0NwZ0qRoBl64Ep207QyfVUxS7xniJ6oFjUzP4
         o4Dg==
X-Forwarded-Encrypted: i=1; AJvYcCV+OCre2r2tkp3wxpV7v1KqfKjn1YuXjN45E8wakuWDPym4kQ/RP/H7W3TpkEJ4YYvyILxJRUfQOis=@vger.kernel.org
X-Gm-Message-State: AOJu0YznuRU3WUUbNg1qv0LPbqYLGU9zvaaIrn31NoHFlorTIWi3tsdQ
	z7LA1AnApraRIlaReChhD4QqQZdFvV9uX00yI6Wz8LSMXQmqTE1nAXON2l9bdw==
X-Gm-Gg: ASbGncs1AiA41s3lEty0gakNZLgNwfIlEys6lHhsPlQkY+XyHHKT9OMw0HQ1ZUb8ETa
	Ob3aP5Cn2Xezls4ADfjYf9VZjvkrL9AFBxF546Lg8FZb1gCTXNmILsuqdqhij5xAl1IGpl7Py4Y
	BpMZYJJnYRad6/idf5f2Te86NkQus5/47F6FbaeIeTGHGaYO9EX/UVdz9D7bwICHf55TYldBQKC
	MRHsoQVQFHgGC56XWyCRX2kv3yHPR2Y0v7ZZP6WPiRdym+CPLt5U63Bd0CHmH23ww==
X-Google-Smtp-Source: AGHT+IEpLHPVaJh+gwdLw83uetAfenPlalM1R5vdNmWHzoapvFpd0b11woYH7NFKGd9VPGuqxv2wQg==
X-Received: by 2002:a05:6a00:3ccc:b0:71e:64fe:965f with SMTP id d2e1a72fcca58-724df666260mr9268664b3a.20.1732352819705;
        Sat, 23 Nov 2024 01:06:59 -0800 (PST)
Received: from thinkpad ([2409:40f2:101e:13d7:85cf:a1c4:6490:6f75])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de55503bsm2966517b3a.142.2024.11.23.01.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 01:06:58 -0800 (PST)
Date: Sat, 23 Nov 2024 14:36:50 +0530
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
Subject: Re: [PATCH v4 3/6] PCI: mediatek-gen3: Move reset/assert callbacks
 in .power_up()
Message-ID: <20241123090650.imccksnmovmt2pps@thinkpad>
References: <20241118-pcie-en7581-fixes-v4-0-24bb61703ad7@kernel.org>
 <20241118-pcie-en7581-fixes-v4-3-24bb61703ad7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241118-pcie-en7581-fixes-v4-3-24bb61703ad7@kernel.org>

On Mon, Nov 18, 2024 at 09:04:55AM +0100, Lorenzo Bianconi wrote:
> In order to make the code more readable, the reset_control_bulk_assert()
> for PHY reset lines is moved to make it pair with
> reset_control_bulk_deassert() in mtk_pcie_power_up() and
> mtk_pcie_en7581_power_up(). The same change is done for
> reset_control_assert() used to assert MAC reset line.
> 
> Introduce PCIE_MTK_RESET_TIME_US macro for the time needed to
> complete PCIe reset on MediaTek controller.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 3cfcb45d31508142d28d338ff213f70de9b4e608..2b80edd4462ad4e9f2a5d192db7f99307113eb8a 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -125,6 +125,8 @@
>  
>  #define MAX_NUM_PHY_RESETS		3
>  
> +#define PCIE_MTK_RESET_TIME_US		10
> +
>  /* Time in ms needed to complete PCIe reset on EN7581 SoC */
>  #define PCIE_EN7581_RESET_TIME_MS	100
>  
> @@ -912,6 +914,14 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	int err;
>  	u32 val;
>  
> +	/*
> +	 * The controller may have been left out of reset by the bootloader
> +	 * so make sure that we get a clean start by asserting resets here.
> +	 */
> +	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> +				  pcie->phy_resets);
> +	reset_control_assert(pcie->mac_reset);
> +
>  	/*
>  	 * Wait for the time needed to complete the bulk assert in
>  	 * mtk_pcie_setup for EN7581 SoC.
> @@ -986,6 +996,15 @@ static int mtk_pcie_power_up(struct mtk_gen3_pcie *pcie)
>  	struct device *dev = pcie->dev;
>  	int err;
>  
> +	/*
> +	 * The controller may have been left out of reset by the bootloader
> +	 * so make sure that we get a clean start by asserting resets here.
> +	 */
> +	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> +				  pcie->phy_resets);
> +	reset_control_assert(pcie->mac_reset);
> +	usleep_range(PCIE_MTK_RESET_TIME_US, 2 * PCIE_MTK_RESET_TIME_US);
> +
>  	/* PHY power on and enable pipe clock */
>  	err = reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
>  	if (err) {
> @@ -1070,14 +1089,6 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
>  	 * counter since the bulk is shared.
>  	 */
>  	reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
> -	/*
> -	 * The controller may have been left out of reset by the bootloader
> -	 * so make sure that we get a clean start by asserting resets here.
> -	 */
> -	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
> -
> -	reset_control_assert(pcie->mac_reset);
> -	usleep_range(10, 20);
>  
>  	/* Don't touch the hardware registers before power up */
>  	err = pcie->soc->power_up(pcie);
> 
> -- 
> 2.47.0
> 

-- 
மணிவண்ணன் சதாசிவம்
