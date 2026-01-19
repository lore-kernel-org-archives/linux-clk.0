Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4952633BBA2
	for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 18:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768846449; cv=none; b=jEfuiVkjS7ZkTEj+tiaYtks9uSQrqlb7lqBF2/d1Yc336xMWUbf0Kv6eElPwwSnnpqIcU0tl/86xH/Ef9Ovil7/iRkZXofi4nsX4wXbr/fTNwhXL0nYFLZvO4mI1hrPEi1IEah5ubm4kQRdMiATwxf/1cXS2StFlv0GwUWeJOQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768846449; c=relaxed/simple;
	bh=4Fyy5F1MbMK5D2+wXHupBsG43QgqkaYW96mBVoNyYG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AhkA4z4lu2qWECCoSau6+JK+utsSRvRiieItf09TovxOHU+9Gyzfu2M2r63sPDZctdwP18swvwXFUN2co0A3WIDnCuupA8Trh3xEXqhriSpXsLof5TSzCyDPGl/kPAxsdv4+nzsP3zmeyUlXQGOGjFeW5eV4F66JKqLNzsaq6ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Mq28j4HU; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Mq28j4HU"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64b608ffca7so7070076a12.3
        for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 10:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768846445; x=1769451245; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aAqjEspXY6zk1wpaBVOJfPfZZ59MneWSNApqQkZLBm8=;
        b=Mq28j4HUfqmtaUsKJ+z12lidoKBriXs4AnZDuGlTGqwjxt3VeNKT8Sp3AgP1DN6mJA
         gMjoQDCwTlhzj6Voq4nNd/4vPUfFnkMY8aUkENVP8w2jKNyGTS8KNVOK8JxOOrLMUtJV
         B7vYoHhAZ4kxinZXyAAl5JNLvbbYeUQG9kmTv499RoN18kF7zfjWSEPwXwo2Nu1d4qLA
         5OtDcqU44zw/jQbjvC2HkHJ2n/6U6iUcsp+tzaJXrWji/F6eSf+D22xPR8kyvcohbjt1
         aAS2EPX49Acg95mCC2Eml7/tXj/IsONtw/4Hzx3xkriDR6j1/e2r5udz4Us3GxftJagT
         VVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768846445; x=1769451245;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAqjEspXY6zk1wpaBVOJfPfZZ59MneWSNApqQkZLBm8=;
        b=hx8NIvweDJNF5np2bq5B4zvCNR4IhHISAYBKDnomAGNIK7E4jRxN1rMPMkiTk+tblI
         0LQEEOie7QsrgJuZfyMNam+VJfAHSSbNl3+k6WC7uMYuQnOHuo5HPJNONLFX3g9bV0xU
         me00K+bvOfi+ETM7D3C5mnoZY80n2CGlM+JpPwgpTmR2372Q1+SeovTu/OS4J9tzh1gj
         eACVJlVMKYzePvxN2e5YVI03yUuEaacamwxARwiyvWtVScPYQvUVVfQtmse5DuOOQVBN
         nc+22Wi9v68BOI0r+ebjy5dIdNkn+V2Cx+H3Hrv0w7bXMz6b57C+e+B8m48y4Auwyoyr
         VlfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyB6bLGOtXWRi457dB3sAnQP9NDXIjEWrc7b5Eo/BOkpt+9IYCTrbUfEevOChu1HnM7cyKrinom5o=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsb/uYuxYwy3cffgpnx6joppniiqPWhmA2TtQViGRkyhCiueWJ
	iJj/bck6JB0e0nQg/WB72X6wQt6HPWV0KECA2LqfrEFLPpVlLzjoHuyFcGRkaWzvogU=
X-Gm-Gg: AY/fxX6k3lPEOltxB4L1HZJM1Xz5GVozjmPv1qlkwjkJ8UhPQArsVgdUrONLiRWI7cc
	0ugdJ5H99RftWKG5bE3vFaUTNcmfagi4BpheLap0uOrAMC/9piX8FBSMQykqDaes3x4/tTKr7Uj
	axKsbyL2e0eNkhrgOw7V+Oox3ZKV4f6/J8N9QvvmVwjS5RynhmOIRlC31/ch6d8I42WlJlu4+Ou
	ssChViYCeUk/uQgrbStETBXTfGMN+/bMWLvaqqEho15gLzb69oPcpsaR0mG0Sy9RMsCg7Ogf+Pj
	wZbuf4CghO4qCjcvFCw+s/Qq4oTIHOYec/FQF83s+SEew77TruAyltOwIeFxcmlvQQEOvziFLxx
	HyAE4BAQJBfTurFGd1VbC2nsrRyADc/LfM6S29JZpJBUKqiShdJ6zAOPrfZj49EFHAwcJU+t6yX
	Nz9bOpCEFhGmQe6Tj/mvwx9XHIjJ9R
X-Received: by 2002:a17:907:a05:b0:b87:2e8a:e256 with SMTP id a640c23a62f3a-b8796afd52fmr1113254066b.31.1768846445120;
        Mon, 19 Jan 2026 10:14:05 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a2f1a3sm1155867766b.62.2026.01.19.10.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 10:14:04 -0800 (PST)
Message-ID: <34bd51e6-c93d-40fd-bf5a-8f476c4e1776@tuxon.dev>
Date: Mon, 19 Jan 2026 20:14:02 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/16] PCI: rzg3s-host: Make SYSC register offsets
 SoC-specific
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-7-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260114153337.46765-7-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, John,

On 1/14/26 17:33, John Madieu wrote:
> In preparation for adding RZ/G3E support, move the RST_RSM_B register
> offset and mask into a SoC-specific data structure. Compared with RZ/G3S,
> the RZ/G3E SYSC controls different functionalities for the PCIe controller.
> 
> Make SYSC operations conditional on the presence of register offset
> information, allowing the driver to handle SoCs that don't use the
> RST_RSM_B signal.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>   drivers/pci/controller/pcie-rzg3s-host.c | 93 +++++++++++++++++-------
>   1 file changed, 67 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index 205b60421be1..44728771afa3 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -159,10 +159,6 @@
>   
>   #define RZG3S_PCI_CFG_PCIEC			0x60
>   
> -/* System controller registers */
> -#define RZG3S_SYS_PCIE_RST_RSM_B		0xd74
> -#define RZG3S_SYS_PCIE_RST_RSM_B_MASK		BIT(0)
> -
>   /* Maximum number of windows */
>   #define RZG3S_MAX_WINDOWS			8
>   
> @@ -174,6 +170,34 @@
>   /* Timeouts experimentally determined */
>   #define RZG3S_REQ_ISSUE_TIMEOUT_US		2500
>   
> +/**
> + * struct rzg3s_sysc_function - System Controller register function descriptor
> + * @offset: Register offset from the System Controller base address
> + * @mask: Bit mask for the function within the register
> + */
> +struct rzg3s_sysc_function {
> +	u32 offset;
> +	u32 mask;
> +};
> +
> +/**
> + * struct rzg3s_sysc_info - RZ/G3S System Controller function info
> + * @rst_rsm_b: Reset RSM_B function descriptor
> + */
> +struct rzg3s_sysc_info {
> +	struct rzg3s_sysc_function rst_rsm_b;
> +};
> +
> +/**
> + * struct rzg3s_sysc - RZ/G3S System Controller descriptor
> + * @regmap: System controller regmap
> + * @info: System controller info
> + */
> +struct rzg3s_sysc {
> +	struct regmap *regmap;
> +	const struct rzg3s_sysc_info *info;
> +};
> +
>   /**
>    * struct rzg3s_pcie_msi - RZ/G3S PCIe MSI data structure
>    * @domain: IRQ domain
> @@ -203,6 +227,7 @@ struct rzg3s_pcie_host;
>    *                power-on
>    * @cfg_resets: array with the resets that need to be de-asserted after
>    *              configuration
> + * @sysc_info: SYSC functionalities
>    * @num_power_resets: number of power resets
>    * @num_cfg_resets: number of configuration resets
>    */
> @@ -210,6 +235,7 @@ struct rzg3s_pcie_soc_data {
>   	int (*init_phy)(struct rzg3s_pcie_host *host);
>   	const char * const *power_resets;
>   	const char * const *cfg_resets;
> +	struct rzg3s_sysc_info sysc_info;
>   	u8 num_power_resets;
>   	u8 num_cfg_resets;
>   };
> @@ -233,7 +259,7 @@ struct rzg3s_pcie_port {
>    * @dev: struct device
>    * @power_resets: reset control signals that should be set after power up
>    * @cfg_resets: reset control signals that should be set after configuration
> - * @sysc: SYSC regmap
> + * @sysc: SYSC descriptor
>    * @intx_domain: INTx IRQ domain
>    * @data: SoC specific data
>    * @msi: MSI data structure
> @@ -248,7 +274,7 @@ struct rzg3s_pcie_host {
>   	struct device *dev;
>   	struct reset_control_bulk_data *power_resets;
>   	struct reset_control_bulk_data *cfg_resets;
> -	struct regmap *sysc;
> +	struct rzg3s_sysc *sysc;
>   	struct irq_domain *intx_domain;
>   	const struct rzg3s_pcie_soc_data *data;
>   	struct rzg3s_pcie_msi msi;
> @@ -1516,6 +1542,7 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
>   	struct device_node *sysc_np __free(device_node) =
>   		of_parse_phandle(np, "renesas,sysc", 0);
>   	struct rzg3s_pcie_host *host;
> +	struct rzg3s_sysc *sysc;
>   	int ret;
>   
>   	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*host));
> @@ -1527,6 +1554,13 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
>   	host->data = device_get_match_data(dev);
>   	platform_set_drvdata(pdev, host);
>   
> +	host->sysc = devm_kzalloc(dev, sizeof(*host->sysc), GFP_KERNEL);
> +	if (!host->sysc)
> +		return -ENOMEM;
> +
> +	sysc = host->sysc;
> +	sysc->info = &host->data->sysc_info;
> +
>   	host->axi = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(host->axi))
>   		return PTR_ERR(host->axi);
> @@ -1540,15 +1574,16 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> -	host->sysc = syscon_node_to_regmap(sysc_np);
> -	if (IS_ERR(host->sysc)) {
> -		ret = PTR_ERR(host->sysc);
> +	sysc->regmap = syscon_node_to_regmap(sysc_np);
> +	if (IS_ERR(sysc->regmap)) {
> +		ret = PTR_ERR(sysc->regmap);
>   		goto port_refclk_put;
>   	}
>   
> -	ret = regmap_update_bits(host->sysc, RZG3S_SYS_PCIE_RST_RSM_B,
> -				 RZG3S_SYS_PCIE_RST_RSM_B_MASK,
> -				 FIELD_PREP(RZG3S_SYS_PCIE_RST_RSM_B_MASK, 1));
> +	ret = regmap_update_bits(sysc->regmap,
> +				 sysc->info->rst_rsm_b.offset,

This can stay on the previous line to spare one extra line of code.

The rest LGTM.

Thank you,
Claudiu
