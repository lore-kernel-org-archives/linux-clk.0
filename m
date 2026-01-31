Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D42923B615
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 14:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769868810; cv=none; b=C1zSPwEBFlekhzWoINbsrAWftxAXPt4levhn3MCUh9tIfZvkogad6yEwBl2hVIZCbgYEcMbrhEY96XHxa51ZavgniNzr2cXgk6H3JaQgOkrgnnTezOgR08cWFjq2WcEent6Xa39HBOcI+jxs9qXiGdiI162olm2hvVy6ke6tIqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769868810; c=relaxed/simple;
	bh=sW5vcDGlHvsGrTl0xwMRj5+79SiUhbmeBkNatDo+IQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qhZwVGmTIhcYSL2VFF7LwIialkjPX9ucpZx/2xbAgTNamkAWCUQrLVY/E2RI4SBTk/A3EFrHA6dF864VnlIC9ejzwmg6UPpmBkQJ3vPpQ+VBAk9VwZetZ31mxBKY+9cecmjRzv5jqwOn71tPPHvy9Y8l4+SDkHPwlwo5f6G33ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LgN7eYIm; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LgN7eYIm"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4806bf39419so24811525e9.1
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 06:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769868807; x=1770473607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6n6TAUBEzQrZ+trAO1OU9pk4/vV6fHBtYoVuEvZOQu4=;
        b=LgN7eYImU6tZL60uABisy1pv7HHeGOxs6/bNI1MfRTZKOTwKY1GIeBSTjJDX4KJEhj
         PHE0RdOfnf9ESuBY17v8ElcI5olCmcFJGrF1loBPhr6hTkC8RNFerr1bCLe6gupx/3MB
         R1CdQ27EVMy4xAYyDTuGRZ8mW8Sd9qFl0+Jztdx8UMcJl1hmTZAsN+yfm3sRnKdz6DrT
         M8hdeUVWSONHhl5psnNZloAOX9CzB5cs4C7BYKr7F7S0wPoyhBr3VS5T9UxnUCYVn/Fh
         89HZFWVh9/dSv4bcA926qXaXCYkxoz+oOkLGlKqoziqnzZnSBgBnUSm5MOaujx2iAHT7
         0Y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769868807; x=1770473607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6n6TAUBEzQrZ+trAO1OU9pk4/vV6fHBtYoVuEvZOQu4=;
        b=e4a46wJekJwbIyqCXcxM9sTrMt7PytD1PY1BLI66RCYvxZ4ufVLqQm0bbDiw+VNimJ
         68MZoZ/pkar0bcAf3PcWqjt77ZRmf0xZL2JNch8MDOtFy/bop20U8QCw4gKAQ50Qqz2Q
         kpTBNhN1ZYKo2UCHeQW3qNCLRZ683mt/j71L87DtUkVtySspwHlXvSdpQUvQiONYuTwz
         qRHpyNNcIGeRaYMYY+OtuFxFoGuBsLc3XVsj+IOZJaaVsHgiKmDM246kE4tXNhXHJU4m
         fFJFZGVE1DydjgGHEeT3f4BZ1lK7Lr4Z2cio2m56S2q6MRlyUYIC9ErXwh8Y/b5Hf8gL
         JaTA==
X-Forwarded-Encrypted: i=1; AJvYcCURO3x8o8DPsUWeQ99LvsXUFk50a27IJ4uCNYbKSBcgzUBR/Kv6T1BoF6kqGVj1Qp+FBSi5rr+Yt+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgMhp93Wf6RotA3NNcGN+hWK3RTuGBDOo3jlRr60/ShYgLVNCK
	6AhfW8Sbdv4o8uPA+t5qs78Z9vSTUCqBs2PSCjDdDMBGXq1/A81NEy1qYfqCf4FMr2c=
X-Gm-Gg: AZuq6aJCskoibyTdUjh46jBCkRHVAutpLrd6IwGK53LHLEXu859vpZPdBsL8o3l+Etb
	0hJ4JOONt1W4OfYORyBXn8oqI9roYYR9sLQjvIFD5mjqcjWmx1srVZuyoZbD8A6oUrkE/+/223v
	GNStgFHUZMnw8xlzUpVSFGq2KPVplqNw3BXlQ5jaVPzYz26gzUoEpFJVNHWQG3yxoGKSh8ahmnH
	cKmxpwONEBhdFz2mMQG1jQXAKGKZWp4WSDfjyVVMVr1/wvGmHozS58az937sGD2JGDt/TA52EQ/
	sagz6AIMpwBFaXZroHn1W1wy+1YOBwqC240UDmA7Ncv/T1qn1TDruptZsduk07blM0KTRSJTBy0
	k2dItqOqg9966g3mMgJscrnV9za7yguJ/S537YvyXy86LFsxtt8HuLlUmvOkQf66TrH5HLM+/69
	Tm3lzopM8ECwirMOamsw==
X-Received: by 2002:a05:600c:348e:b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-482db49ebcdmr81439595e9.17.1769868806551;
        Sat, 31 Jan 2026 06:13:26 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dbd0f043sm51622995e9.7.2026.01.31.06.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 06:13:25 -0800 (PST)
Message-ID: <daddf1b7-ef48-4dcb-8c69-301b883b5729@tuxon.dev>
Date: Sat, 31 Jan 2026 16:13:24 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 27/31] clk: at91: at91rm9200: switch to parent_hw and
 parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <806fd8452ad32be1d129fd541b5cbd1be7fbb9f1.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <806fd8452ad32be1d129fd541b5cbd1be7fbb9f1.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

The driver is using now only parent_data. This is valid for all the SoC specific 
driver patches in this series, no? So, better drop the parent_hw from the title 
and description. Valid for all the patches in the series with this symptom. E.g. 
have it like "clk: at91: at91rm9200: switch to parent_data"

On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Switch AT91RM9200 clocks to use parent_hw and parent_data where possible.
> Having parent_hw instead of parent names improves to clock registration
> speed and re-parenting. Update clock registration functions to use
> clk_hw struct.

Same here as in case of patch 24/31.

Also, for all the soc specific patches

> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

With all the above addressed:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
