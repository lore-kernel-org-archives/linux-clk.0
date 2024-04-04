Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34E72574F
	for <linux-clk@vger.kernel.org>; Thu,  4 Apr 2024 06:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712212610; cv=none; b=lUo6L0afbxYj9HtOhxXCr1oanNM2wSnaKSWN78gJ5ffOVL7aaN1KXDBIaTlkVgFBxUH8tVvbPn9M7GQ+eJ11oBgLLuYy29q49Nu5dhUKnJbwKZG1HXuaQU2jDbXJc62Txhaswc1ZCHgclD7gzuBXanaUTx/LT9avXSt6bySsDWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712212610; c=relaxed/simple;
	bh=fXnxRFmk8goKBrgIHEkdPt7J1ihXSLbvXazoGJv9RCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fyw1pTMIaTXbeM+/sAYPo7EnYpY8SxMxstW8L3GO63Iz//BxbkEEEMVhI7Xgc14CjGhOqCBHbYFJaZFAJg9u98yoOdkUzPLaKk54uHe0KG2Gv6hWNdXpEtZ1JyQN0Oyxw+Da9F10ediRdchrtz33+CwtRYHobziuMNJcW0dt+cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W4Bv9He5; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W4Bv9He5"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-516c1bbe314so942189e87.1
        for <linux-clk@vger.kernel.org>; Wed, 03 Apr 2024 23:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712212606; x=1712817406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2zKAxFOY7Srl3ScO6WnUAH2vVBLJhCxKCIkxZt7ZVco=;
        b=W4Bv9He5l+i/t/Ts7ZY5SXkRGGDgHd1Qcf3b5Ba+GA1J6oMsaiW3zyQKWkl67PYAv4
         0k3CZ7Uf0QUaih8aYlr+SjrjVSo9y+YHuW/wzkCs3KyiyH4IkK+ZgJuPraC2sAikxZcH
         QeHBdqmOWT58TT5AvlG5onImX/sRJ7tTnhGw3BjFGe2HCQHS0JahOo8La4Vs4ZNct5Kk
         TfBtA1nLECOtnWjsZC49788OQPk/r+4SGrudsK95A+HHWL1glecaClE7pJKGAKqPputf
         4x7Wj05lpjCiTCzKAhvGbVk8W1DeNEvKnjbWMyUQxpAvn3PCvCBEgNCf73xAm3Wx83Ox
         3jmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712212606; x=1712817406;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zKAxFOY7Srl3ScO6WnUAH2vVBLJhCxKCIkxZt7ZVco=;
        b=ih9lWu9UYBg0fCikB8LB0A228OugzYXTlw9/Lp8rxo5SwkJRP77P/DBHuVFpks0sDN
         1oZiW+YqLFR8Gyg025S071er61VpCo/UiIqt4d+yxLUMBfdKsTjfDi/D6pHa2Bg+PeLc
         c2FbR0xT/ljLFA902+dP9MexAm/7a01HGhkxQNeDkVs+ZZ1VC94hFaYC34pWY65izum7
         2xpYTDLaskchk8gze9GgpfgQ6Ac8P1+5xz2pKsf6WT+QaG2+zLnBH6S4Rm/6JX7EYu9Z
         qEBKW6Xpeg+c0D+OKnfhkrtyKxv+gxeQXt7dIkTv+AFy6rq5JTg+nRESZcKKtYDHakem
         tLoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV1TAjTEjZLuR6yRJ5h/53Sc2wAorEPIxZ/8bxE1X2McWOoP3+nMe7hDMpm9HDyxqUmagxjfDmQ/pgrPzdEbwgi5Nd9Wd0x9N+
X-Gm-Message-State: AOJu0Yy4zI/Z22M+tgAM02rNecWwdM7jkSckBfG/Orv/vUBb6baBk7tL
	spbjprWEHVxhQ/bgQvNM1X6I7zOffGZ9tujb8swvTI0argTlqIilHCPICPeBOP0=
X-Google-Smtp-Source: AGHT+IGAojjYjuQHbsZ23M5TUMeoOaZmWr8G+SCEhCS4dvxhe6ieyt4tVHaLgJej+gwKtAG8GNIHKg==
X-Received: by 2002:a05:6512:3b99:b0:516:bea2:5931 with SMTP id g25-20020a0565123b9900b00516bea25931mr1433669lfv.23.1712212606016;
        Wed, 03 Apr 2024 23:36:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id p6-20020a170906a00600b00a46d04b6117sm8668766ejy.64.2024.04.03.23.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 23:36:45 -0700 (PDT)
Message-ID: <95d194ed-86fe-45df-88f1-ae460eb36eaf@linaro.org>
Date: Thu, 4 Apr 2024 08:36:43 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: en7523: add EN7581 support
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, nbd@nbd.name,
 john@phrozen.org, devicetree@vger.kernel.org, dd@embedd.com,
 catalin.marinas@arm.com, will@kernel.org, upstream@airoha.com,
 lorenzo.bianconi83@gmail.com, angelogioacchino.delregno@collabora.com
References: <cover.1712160869.git.lorenzo@kernel.org>
 <3aaf638b846ecfdbfc1c903206b7d519d56c9130.1712160869.git.lorenzo@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <3aaf638b846ecfdbfc1c903206b7d519d56c9130.1712160869.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/04/2024 18:20, Lorenzo Bianconi wrote:
> Introduce EN7581 clock support to clk-en7523 driver.
> 
> Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>


> +	return 0;
> +}
> +
>  static int en7523_clk_probe(struct platform_device *pdev)
>  {
>  	struct device_node *node = pdev->dev.of_node;
> @@ -306,6 +413,12 @@ static int en7523_clk_probe(struct platform_device *pdev)
>  	if (IS_ERR(np_base))
>  		return PTR_ERR(np_base);
>  
> +	if (of_device_is_compatible(node, "airoha,en7581-scu")) {

Having matching and compatible comparisons inside various code is
discouraged. Does not scale. Use driver/match data to store some sort of
flags and check for the flag or some other parameter. The best if
compatible appears once and only once: in of_device_id.

> +		r = en7581_clk_hw_init(pdev, base, np_base);
> +		if (r)
> +			return r;
> +	}
> +
>  	clk_data = devm_kzalloc(&pdev->dev,
>  				struct_size(clk_data, hws, EN7523_NUM_CLOCKS),
>  				GFP_KERNEL);
> @@ -329,8 +442,15 @@ static const struct clk_ops en7523_pcie_ops = {
>  	.unprepare = en7523_pci_unprepare,
>  };
>  
> +static const struct clk_ops en7581_pcie_ops = {
> +	.is_enabled = en7581_pci_is_enabled,
> +	.prepare = en7581_pci_prepare,
> +	.unprepare = en7581_pci_unprepare,
> +};
> +
>  static const struct of_device_id of_match_clk_en7523[] = {
>  	{ .compatible = "airoha,en7523-scu", .data = &en7523_pcie_ops },
> +	{ .compatible = "airoha,en7581-scu", .data = &en7581_pcie_ops },
>  	{ /* sentinel */ }
>  };
>  

Best regards,
Krzysztof

