Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71E22E3F2;
	Thu, 27 Jun 2024 09:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719480690; cv=none; b=U5BQYFnKwmZXRATem+Yj3uNbnMN34dvVbPio0rz2FL2twPll7icF+1yeiFwwFM72nFq5UqMeWB3XHTPNqfC7WZToWjd+cJIfapZ0f2bWuBLaEt344sTC+UbYYdi0BEoEfrMnDc7FAu9R2La5gXoDUQjhw30Xac5kMDEg53wKLKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719480690; c=relaxed/simple;
	bh=a+f5w/dBbMnpvpwgEofHgihe0259EcoYm0wIugs49jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sIb/yYH4SN48UuNlkKRm8Sk/MnlLMP33OgGwfwcfveAaP31D63o9E/czncBZJ6aFASfjyWS1FIsJaTj2x886EVH71EHPfXvaH+PdZ/H40RR+dSk8ICSVA6JbVyUqApA3o1BWJPk+DLfy6YoaZe5urLSLbRuVMoWGaUVhbpWsbVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Tssxqw0+; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Tssxqw0+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719480687;
	bh=a+f5w/dBbMnpvpwgEofHgihe0259EcoYm0wIugs49jc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tssxqw0+d5aALTzeG2rLnW7ABQ+zqie3wFFPsHM3VTta6cIeVIIpuzhCVq0RYYTqq
	 Q/w3K03Qqmlu2QRgKnYIfKPbCQFp0DqrAYY0uqy2FxSkJ7XvZc7lIz0vmsPz9oL2Cn
	 ztigRWaMJi6ot6IQXPLYCk+l34ZAzXkBtx8RqKWQz9oArN5Opf/3wxxYMPMGE/PanZ
	 aTMX5zmnhLi7eH1Ns5roJtXyFG3JSJ7p9pJqPLJ+dWaDJSno2a2UWl63U/feteij7s
	 qX6T1nxuK84WZgTvd5DIQgB78PW0k0WhrGvdDjBY0ZsWRYiZ/wUaV45yaxpPIlr/NH
	 46DByay34fK1Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 129CF37810CD;
	Thu, 27 Jun 2024 09:31:26 +0000 (UTC)
Message-ID: <a64a0a40-7052-4541-a34b-49b9a643a0a1@collabora.com>
Date: Thu, 27 Jun 2024 11:31:25 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: en7523: Add reset-controller support for
 EN7581 SoC
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-clk@vger.kernel.org
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 lorenzo.bianconi83@gmail.com, conor@kernel.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, nbd@nbd.name, john@phrozen.org, dd@embedd.com,
 catalin.marinas@arm.com, will@kernel.org, upstream@airoha.com
References: <cover.1718282056.git.lorenzo@kernel.org>
 <20ebe87f8928918ae244677cf85e4e249285759d.1718282056.git.lorenzo@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20ebe87f8928918ae244677cf85e4e249285759d.1718282056.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 13/06/24 14:47, Lorenzo Bianconi ha scritto:
> Introduce reset API support to EN7581 clock driver.
> 
> Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>   drivers/clk/clk-en7523.c | 200 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 197 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index ccc394692671..00638714fe08 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c

..snip..

> @@ -423,6 +505,102 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
>   	clk_data->num = EN7523_NUM_CLOCKS;
>   }
>   
> +static int en7523_reset_update(struct reset_controller_dev *rcdev,
> +			       unsigned long id, bool assert)
> +{
> +	struct en_rst_data *rst_data;
> +	void __iomem *addr;

struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
void __iomem *addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
u32 val;

val = readl(addr);
etc etc

> +	u32 val;
> +
> +	rst_data = container_of(rcdev, struct en_rst_data, rcdev);
> +	addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
> +
> +	val = readl(addr);
> +	if (assert)
> +		val |= BIT(id % RST_NR_PER_BANK);
> +	else
> +		val &= ~BIT(id % RST_NR_PER_BANK);
> +	writel(val, addr);
> +
> +	return 0;
> +}
> +
> +static int en7523_reset_assert(struct reset_controller_dev *rcdev,
> +			       unsigned long id)
> +{
> +	return en7523_reset_update(rcdev, id, true);
> +}
> +
> +static int en7523_reset_deassert(struct reset_controller_dev *rcdev,
> +				 unsigned long id)
> +{
> +	return en7523_reset_update(rcdev, id, false);
> +}
> +
> +static int en7523_reset_status(struct reset_controller_dev *rcdev,
> +			       unsigned long id)
> +{
> +	struct en_rst_data *rst_data;
> +	void __iomem *addr;
> +
> +	rst_data = container_of(rcdev, struct en_rst_data, rcdev);
> +	addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];

same here, just init while declaring.

> +
> +	return !!(readl(addr) & BIT(id % RST_NR_PER_BANK));
> +}
> +
> +static int en7523_reset_xlate(struct reset_controller_dev *rcdev,
> +			      const struct of_phandle_args *reset_spec)
> +{
> +	struct en_rst_data *rst_data;
> +
> +	rst_data = container_of(rcdev, struct en_rst_data, rcdev);

ditto

> +	if (reset_spec->args[0] >= rcdev->nr_resets)
> +		return -EINVAL;
> +
> +	return rst_data->idx_map[reset_spec->args[0]];
> +}
> +
> +static const struct reset_control_ops en7523_reset_ops = {
> +	.assert = en7523_reset_assert,
> +	.deassert = en7523_reset_deassert,
> +	.status = en7523_reset_status,
> +};
> +
> +static int en7523_reset_register(struct platform_device *pdev,
> +				 const struct en_clk_soc_data *soc_data)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct en_rst_data *rst_data;
> +	void __iomem *base;
> +
> +	/* no reset lines available */
> +	if (!soc_data->reset.idx_map_nr)
> +		return 0;
> +
> +	base = devm_platform_ioremap_resource(pdev, 2);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	rst_data = devm_kzalloc(dev, sizeof(*rst_data), GFP_KERNEL);
> +	if (!rst_data)
> +		return -ENOMEM;
> +
> +	rst_data->bank_ofs = soc_data->reset.bank_ofs;
> +	rst_data->idx_map = soc_data->reset.idx_map;
> +	rst_data->base = base;
> +
> +	rst_data->rcdev.nr_resets = soc_data->reset.idx_map_nr;
> +	rst_data->rcdev.of_xlate = en7523_reset_xlate;
> +	rst_data->rcdev.ops = &en7523_reset_ops;
> +	rst_data->rcdev.of_node = dev->of_node;
> +	rst_data->rcdev.of_reset_n_cells = 1;
> +	rst_data->rcdev.owner = THIS_MODULE;
> +	rst_data->rcdev.dev = dev;
> +
> +	return devm_reset_controller_register(dev, &rst_data->rcdev);
> +}
> +
>   static int en7523_clk_probe(struct platform_device *pdev)
>   {
>   	struct device_node *node = pdev->dev.of_node;
> @@ -455,12 +633,23 @@ static int en7523_clk_probe(struct platform_device *pdev)
>   	en7523_register_clocks(&pdev->dev, clk_data, base, np_base);
>   
>   	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> -	if (r)
> +	if (r) {

it's simpler if you just use dev_err_probe() at this point...

if (r)
	return dev_err_probe(.......)

>   		dev_err(&pdev->dev,
>   			"could not register clock provider: %s: %d\n",
>   			pdev->name, r);
> +		return r;
> +	}
>   
> -	return r;
> +	r = en7523_reset_register(pdev, soc_data);
> +	if (r) {

if (r) {
	of_clk_del_provider....
	return dev_err_probe(......)
};

after which

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


