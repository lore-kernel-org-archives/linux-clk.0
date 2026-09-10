Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C673B6367;
	Thu, 10 Sep 2026 09:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032245; cv=none; b=h6xiE94cepV+8487br/1QABBtADZQeycl3LW9gmqpfQJyPhxeoXcJNU7MCqE81nN/i4tpSfn19N9xbrxQLZ5yRf3IWK1F0LKm//cB5eWyFDERLOhxkGzqgtQEbNOIst1UzOSjTV8yIBqW2SHZxtjw6ZsGU7B/lMFYdrfVDVATc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032245; c=relaxed/simple;
	bh=lO8k/xsn9vJJ5dce2sGr/gdsViGjIJvXorKknr/5sps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l1+E4ZM2AcGG0aKgXqgLufhKgXKK2i/9iiJCvwZUXfVkZ7t7mZ+ZgjJoM583HMIWJNWOww3BjEVW7DP99/tkaEe2joxNyudRNKhtO7sL1NEMDEBgO1vBJsS8vwDbnArtvptEKfdgojJMSnnrk2Sca0e7NbFJBl7emI7qi+8P2uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Az8d1rhU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Az8d1rhU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789032239;
	bh=lO8k/xsn9vJJ5dce2sGr/gdsViGjIJvXorKknr/5sps=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Az8d1rhUo17uOQhc71dhaEE2/xhUuVqKZFU2jsJXGj6zzmdUu0vv5IfPqtIn2uXEa
	 PuGN14rcs/Nho2CLKqI5UbCVOuag1aft5jwFM4oyKSwR0wUTKdECpDJozQXuG80A5C
	 GYzozCqc6/FLZj+45aO1o11ddToNbIJYL0FjwQpnCDILwBC6AbKidD5yG3bO4Bvkwt
	 hqGPytp8V5855AXO6bPOF65il6//9ZX1/Qk3C8Qe6sPbdweJj3DZZkBocnDcNfFG2w
	 l84/tKQpDr0qRjxKgVZz8WVoV7HSjdjzppuyAYJ8mnZDyTeBEIrZ+aHZzc6Bpc2nsp
	 Wcp3VTZyTFu1Q==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CFFA517E0CA6;
	Thu, 10 Sep 2026 11:23:58 +0200 (CEST)
Message-ID: <0c117dbc-facc-4465-a5e0-8fbb822d86a7@collabora.com>
Date: Thu, 10 Sep 2026 11:23:58 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: reset: Fix device registration kernel-doc
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260910033000.15926-1-kmehltretter@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260910033000.15926-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/26 05:30, Karl Mehltretter wrote:
> The comment for mtk_register_reset_controller_with_dev() names the
> older helper and documents np rather than dev. The new helper takes
> a struct device and obtains its device node internally.
> 
> Use the actual function and parameter names and clarify that failures
> return negative error codes.
> 
> Fixes: 761bc64003e3 ("clk: mediatek: reset: Add new register reset function with device")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>   drivers/clk/mediatek/reset.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
> index 562ffd290a22..b09cdcab0c4b 100644
> --- a/drivers/clk/mediatek/reset.h
> +++ b/drivers/clk/mediatek/reset.h
> @@ -60,11 +60,11 @@ struct mtk_clk_rst_data {
>   };
>   
>   /**
> - * mtk_register_reset_controller - Register mediatek clock reset controller with device
> - * @np: Pointer to device.
> + * mtk_register_reset_controller_with_dev - Register a MediaTek reset controller
> + * @dev: Device used to manage the reset controller resources.
>    * @desc: Constant pointer to description of clock reset.
>    *
> - * Return: 0 on success and errorno otherwise.
> + * Return: 0 on success, negative errno otherwise.
>    */
>   int mtk_register_reset_controller_with_dev(struct device *dev,
>   					   const struct mtk_clk_rst_desc *desc);
> 
> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713

Hey, thanks for the patch!
It's almost perfect - just change the first line with:

* mtk_register_reset_controller_with_dev() - Register a MediaTek reset controller

After which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo
