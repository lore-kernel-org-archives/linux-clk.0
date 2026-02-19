Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1642EE268
	for <linux-clk@vger.kernel.org>; Thu, 19 Feb 2026 18:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771526441; cv=none; b=LP52UQThEKOLPUX6sG0EG7aa+pLdqL4+dE3S57J+pHfZcYju4VqJ7KAo8nik2N0wSlE3OL8iRS1hGgMZwAdm30BmRxFZsBoUSDIHaRnV1LRGx+UITFzTEulqhfl+gfN7HTargaAgIigFT5VnvvkERG3T/Rc3PvGmtIODdFqTJiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771526441; c=relaxed/simple;
	bh=fU3lA7VpwFCxes0Dr9aFEjsRGOPizP4mVR4Z4GdX+xQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XmEZpa3V9fBqU1/JiAnNRKY7VK9DXLLvozOdCLFy8Xf+TkgfAVAu9OdUGdxoJ+VjTEUq51MPz4yXUGr81zMq7yPx9hJL25KKfmrXn983krjXsPpyPpnZutfP81HKiCLlU1e/EKJgq2Wd0c2rFEt/K2Zv3sMFwoytTIzM0P14Erc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1Lv24s5w; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1Lv24s5w"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4042fe53946so514390fac.3
        for <linux-clk@vger.kernel.org>; Thu, 19 Feb 2026 10:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771526436; x=1772131236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9IWO5m5WHHqRoC8lS5ugD/MQKoBV1QdUD735Fcl1Kkk=;
        b=1Lv24s5whiUBlRS9jgCs/OjRSA/nC2s6UI48x4AQjiU0IYdsYgEHQ+6wCN6FRZiojR
         SM9JGUvPbH0YHuGtuzzH2I//6t9n8Vc0StttnhNEyhf0c0mSBjU9GT8iqX+aSEHCWq7H
         P7K8VMtw414/a2qoJ4SDmCxOewzU3t/WEIwReuxifW8KLUcUH84sfwAl4PBuDgMQX0Wn
         06q8Ooxn2sPW6i+okso04nfH29TxpDV24U46QYhhMaPL/xFBTqe09jv8XcANyI7tzMfG
         p+UJeMlfTT0LFHEgNrkU2fFIq5rZYuCKxPTI+MwUAHdCl8G1FLm17UbEIPXKtLxTNg6s
         FjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771526436; x=1772131236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9IWO5m5WHHqRoC8lS5ugD/MQKoBV1QdUD735Fcl1Kkk=;
        b=c0ZBDSla6ptUlZF4nagBG+ZHhK5oETdWdSupYISMAfY9LlKTVOHRFcaJGx5HKxop9r
         sIZ8WK0PyJvXPWLIKlNblG02/zM/XpFQILrPBHM/ceQ7HUtDU00ZpAWr6RvVd1z4VmjD
         UxZdWcqpAhOg7cMNMeq5EBZlhSp9+4pZQmIwfNW2FmWIbLCMcxhxuwbxLueslWebG/HT
         o2DXK3gJoKiAyYlWDpOuosNNZ2nw0rLdiqbLgj/N00Ou5/fZa77LbpxtuvRyUhAlXoJ5
         0xJ00o1M7imrjE7+x1UkEJbmuRtMAPoozg3sfQcSRs4DJ/UVLur95WJEXsRP6HxgiLvH
         8j3A==
X-Gm-Message-State: AOJu0YxHYXfamwGcc4lMlDSZ9U2ZyWxSqxxI7iBxY+6cW2W3i11AkSwB
	YOeGexrQp4XUjY/Hx+q6+k19HXIUqET671Fh8rElENAe2R6yWCRRdcIlZXR2IT30evo=
X-Gm-Gg: AZuq6aIJ0tayqIjDCm7a7e+jhH1RTMH99e/uWnBGH5hSqT210QRW8wWnzsGkyWB9u+y
	mKIfsznHcFw7S0Gri1HQDvljhCkHWeaP3chfd0vMo9DdWAh8U8hxJPiiAK7HFiYPJHXt7O7doGO
	mjJFTTwbzlZmhiskJ5Zi1XnsPYLo7gBEjOWDXexKlFQWJPDZy8ZNwYe3aY2QkIrLd60CjKoks+M
	p+K5HthfEk4+kgYPmQDX/pNYTSy1RezaNJBsouVvrhzXpTiL0l1L8U5wcyndlSaB3NrDhmE4ZGo
	Tv4LrOi9CAvbUV36hHdtzzc0SbEgb4ES6TJ3nj+B3zO9JC6tRHxty5QRParGoADhsBE6bDT5ipf
	b+uslpywp4XV3GWvDSBOQdCWI+5flbN5W6oy/Bu5huoUoC6O/lYHnxfJg5N57uVCmRtJsRjQsfq
	0h03hwMJdVYIK7vIAvHRHbUq+vdZbh24RxagrCaTw657If3PhFwQAvs+DycGPlprE6dIXIgQwEq
	Qpa/YgK
X-Received: by 2002:a05:6870:1587:b0:409:a121:19d9 with SMTP id 586e51a60fabf-40f0d9b194dmr9062080fac.47.1771526436041;
        Thu, 19 Feb 2026 10:40:36 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:d4c1:bce:26a1:c903? ([2600:8803:e7e4:500:d4c1:bce:26a1:c903])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40ee62b6f61sm21460634fac.10.2026.02.19.10.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 10:40:34 -0800 (PST)
Message-ID: <751d82d2-0d03-48ed-a917-dbb0cc8a3418@baylibre.com>
Date: Thu, 19 Feb 2026 12:40:33 -0600
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/18] clk: mediatek: Add MT8189 vlpcfg clock support
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com,
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
References: <20260202062840.342707-1-irving-ch.lin@mediatek.com>
 <20260202062840.342707-7-irving-ch.lin@mediatek.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260202062840.342707-7-irving-ch.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/2/26 12:28 AM, irving.ch.lin wrote:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> 
> Add support for the MT8189 vlpcfg clock controller,
> which provides clock gate control for vlp domain IPs.
> 
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> ---

...

> +static const struct of_device_id of_match_clk_mt8189_vlpcfg[] = {
> +	{ .compatible = "mediatek,mt8189-vlp-ao", .data = &vlpcfg_ao_reg_mcd },
> +	{ .compatible = "mediatek,mt8189-vlpcfg-ao", .data = &vlpcfg_reg_mcd },

These names are a bit confusing to me. I would expect vlpcfg_ao_reg_mcd
to match "mediatek,mt8189-vlpcfg-ao" since they both contain "vlpcfg" and
"ao" in the name.

In other words, this is the naming I would expect to avoid confusion:

	{ .compatible = "mediatek,mt8189-vlp-ao", .data = &vlp_ao_reg_mcd },
	{ .compatible = "mediatek,mt8189-vlpcfg-ao", .data = &vlpcfg_ao_reg_mcd },

I suspect that the same improvement could be made in the other patches in
this series as well.

> +	{ /* sentinel */ }
> +};
> +
