Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6CA202F93
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 06:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752821108; cv=none; b=s0OiF3DmZ+Nl7eu9N4CXUORQyuBJkpoKLcue1VwE1mTElisJunw8Kuro949RXJ8EhFKJfaxSvOwjKrjfW7o/CCPYtLDcogFj/K6qANsm7m0FeQTUjet5QR3nqWVZKMxnXETzO8Njkjx8qVv2HdVskKiIjcKBFD3PDxZuTpi0y3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752821108; c=relaxed/simple;
	bh=kkKL1VIQ7AWWYCZaWSpkudCpDzgwoDkadDURjd3l7z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lR93bGRT3KfFSYtY/pD/9N1aN834+fGaghYrBUDQbIDzOctGIsgbNZgJC8fi8w0Rwd2mQgl4CG37QwBipFhczYAlP16invR1iQPT8bYNWvDkHdblmzDhKUnhRiaiUM7WRL65p/D7oe7Yh7haGd1y7zLkHrlEuVQK5O/Hztq8XgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=p+46mRF8; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="p+46mRF8"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so2758989a12.1
        for <linux-clk@vger.kernel.org>; Thu, 17 Jul 2025 23:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1752821104; x=1753425904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VVar5g8zOX9FTPpiuRdJzd042YFwcWfhs7Wgs601zJE=;
        b=p+46mRF8dXSuoJXK8J471qfovjTuI/pR+M5XqBZm71A7mooeHNcPZsd5V7jtqSpvMa
         S80Rii1nUu5sFLwEqjJpVlqM6RnQSCcwcVyaQcX6FSXhs9/5ysdRtb0WrTvuBCXOJYhu
         sgN8vJCysHz1VjfJxuK56AI90AdT2bQirh+y7pZHwChq3HD0oisFoWDEmAZMZvPeIvtO
         W9SL9F/GVG0UdTp8OXV6DY1UUTC5R3Efs+u0+16r8w0Go+O+ws0hDqqWRq69OtyghvMv
         /wNAerkEomvM8+loFRetKVxIemCnuOdr3LC4jfoW7rGuwLkQScRnVD3PJ4Ubj+HTITrV
         fkwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752821104; x=1753425904;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VVar5g8zOX9FTPpiuRdJzd042YFwcWfhs7Wgs601zJE=;
        b=UvLpzdZko7SULXzCD7IFFHDD2+5ANCPJQheMbvnJupPNB14EHGVnUPoUUMEUKC2YFd
         HcYM1k3E6eES3I6M0ESyju7hMVhyX+ldhfC0ABLpbFQ5MscxvPlyLM2/vnjuO81bMXDQ
         kD5hE7UBPkLHL0eNwtS3voRLVdbPxPYYUzIUdPHyvxxTWybCKOv4nMqJRKA7VwTv2+2x
         rU4921E89VhUkMIm7e3WHfn9VB4Cy5l2oIIsO5MeBe8X6sSbM8zm//w+9wmFzS2jCJge
         pW4VRXHGlL4UWcHXTQQLG6UbEyzZrsU0MpIt93tw+3UvZFEUsuCOcgF/KmGBwcfxK0Yp
         LKTA==
X-Forwarded-Encrypted: i=1; AJvYcCXKX3o/hOfLBJv+1wBoChntmCuS9hc/BQwZ1Ny6iSyRPEJ+LXV8D6cGMFbTbCGuvQHl6TCoA/OO000=@vger.kernel.org
X-Gm-Message-State: AOJu0YyefqkyeSl4ahbd1rjCe7GgBE2BJIff7mj/bxkwjiZ/WT4sCQXh
	pzgybKM1LPKCyXNbwuO568geKSEz0p0nMb3FLTXa+Imclx7TFpBvvBaBFxRlImNSL0s=
X-Gm-Gg: ASbGncvPXfZNJf28RLhSw7hXPpTE/Y2ZbYLU8sUbwqnjsa0wpd1t9XXe21i80WGqTXi
	UhrxzpBP7bmpudqDwVRL6p8WXDrxmmydm2VnQH1OGVgxsV1XOCbv+OMhJe1ys+4H5RNiT4BP6Gj
	GpH1cpYPBclbtQUqWogDq5+c8s+RFiLiBKU+z8pm3sln8BwXBpNNHHhf9SEdcOcyKMAOheaTrjy
	EjM7DuX72Onv0SEWEdiKfiSH/RUMrCACBQ0h5oJ3uLbC6MLaE6UGLAoRGxeTG/2/qHC+9VW9osE
	NNzxwZ5QKEBe+bQae0yUtXroVjQUzZgTvmkpjjTWBExIcZPPu9Z87tkPRfKuo8lZw/wsV8GDi/z
	sqzKyyJc3QbRX0a6YzCq6sGlU3mUvRA==
X-Google-Smtp-Source: AGHT+IHxkNxiwjD0/BPXsctCLjJokMhGtGvK5gTIY+yWmoyQySHcBMCNgSHU8nTNi4mvXEKWD1jTxQ==
X-Received: by 2002:a17:907:1747:b0:ade:316e:bfc with SMTP id a640c23a62f3a-ae9cde242camr688547966b.21.1752821104166;
        Thu, 17 Jul 2025 23:45:04 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6caf80e5sm63293766b.163.2025.07.17.23.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 23:45:03 -0700 (PDT)
Message-ID: <39b57899-4e8d-445f-a3b5-3b7f9ba3c3cb@tuxon.dev>
Date: Fri, 18 Jul 2025 09:45:02 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: at91: sam9x7: update pll clk ranges
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Patrice Vilchez <Patrice.Vilchez@microchip.com>
References: <20250714093512.29944-1-varshini.rajendran@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250714093512.29944-1-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14.07.2025 12:35, Varshini Rajendran wrote:
> Update the min, max ranges of the PLL clocks according to the latest
> datasheet to be coherent in the driver. This patch solves the issues in
> configuring the clocks related to peripherals with the desired frequency
> within the range.
> 
> Fixes: 33013b43e271 ("clk: at91: sam9x7: add sam9x7 pmc driver")
> Suggested-by: Patrice Vilchez <Patrice.Vilchez@microchip.com>
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>

Applied to clk-microchip, thanks!
