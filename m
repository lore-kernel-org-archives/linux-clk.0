Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0852475E3
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 12:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071571; cv=none; b=kCRczZzIHTUKOhVFyCv5X/THJVsSijQw4hxy2i1Y/moKlqYCZ67MYftYKxgTRsApJJERbZF32SKb1q6pM/7eNRkWPhc9RRC3fQGRfLSQFJPby3uIvXb70f+D0xb7kBBdyFOqSDq5vWJcwqgPVpwaQBBeGqxnikPDRGVMorrQJPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071571; c=relaxed/simple;
	bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fm31oKpImetcIxy26A6EhGMnd6ZY/vwfrs1+4Ew8wWxpyajsXxdV9nhnjm3C5r4kXPVCxXLRg+hmljZ/y6GivbQe3en7w4q6oJumSXcEB77/Dv7EqtNJplgKsy5ra9SzcbQa7HxVW9jFhi6y4H831V1t5we6Sj2JM9SsEhuCYiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fZ9huJ1p; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fZ9huJ1p"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48d102471a4so31422275e9.2
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 05:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778071563; x=1778676363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=fZ9huJ1p8OsWdOfl7FPFy8pcoQsquQPvPJOce+OFQS88Se+sss2lcGgF9eU1TMDzeo
         b0hyDWgTKFWSjTHAXB+QvDJFWymO5bJqHdeeLdsyirwKfWX0kKKGzjLeqYjm7/3Pv5xX
         KPKIYjL+I6EvEOo5xBst/mdqHLJdk8S9Z7kc8cboGGvfry3I9jXRf4iAKUc16gBYzWfq
         Yvt/77EAxcgrlBG7ydV7j6M32Csc+A4g64+ra1J/8kFSDDO4POix29yftigej2K0fhmf
         2v0dfxt6FT6k9cIP7Tqzn92rV/SUGeM5xJZwWzD7qOX1EyFSchLqPCnSSUacY5se/Uqt
         727A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778071563; x=1778676363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=jr68rgnGKEAckXMdUGo/PYMEpleXFMvaQ8CMNFjyrH/Dyj79pQsuUKnYNmY77VcCgE
         Big9/L5b5Khk5Ail0KUhUrT6vPAhWwAODhII5hLzZDUz1ilc8xrWEWpETLRfWfPx9S1W
         j2nGk8aNvrDPrqNzeetK2rBxzzqLbXrpZtOT+UEMEn6TJv1agSWQTQnRkLgf4eEcMUlO
         65QWjDDLLSpZc+hn24TJwkMh01XWbktuP2xSh4Sdc1x7vkbYhr0NEEi3w4QIE8vfznlJ
         ugh/Cs+fDTFKh5InlJV0C9zdB/M8PXazKHyC7Zlf7UZHA1Av9e7GwK/F9h6qGhTN8FXi
         OTKQ==
X-Forwarded-Encrypted: i=1; AFNElJ8OUNeMQ7iPobWiMUvXWFmeUlaA5RKSvFAZlbSovDf7sZh0cSwL23TKS1DQmVUYnWmadtGHJgqTD5g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ZC60xJ2JcHVIqLYchbWF079xRSwAIraHxygKBwLEQQ0SsvfU
	YdqsvM3GQ2dDCI/KpeP6DG2FaFheCymiVxfg+XmAi9BQOCMaIzjaIp6nthGXq2l3UuY=
X-Gm-Gg: AeBDievyHjaQ2iS/QwuLtBtajrfUIc7M32GC8aK2uVmI90rl9MTeu3tVklUG4PT0qzX
	1FC/1QR62bN/i7nsgudF2UC67OVUtK/3QN/7pNnV10KyBu21WGx8LY2rkhac97/oSXdQMakHNmI
	RYMSPJiPp5VNujggx45rZgbYMHLof/1/vfWNMNIvCYDsUGWHjo629EL50lns/UWFiZNNkMxTbWL
	oQvN9ydZ5SUkSTxgBVGM6F2891gJy06LJuYLztoqC1FlNLDPggdC3Fv56zmks5g3VZyvggK/bmA
	zAEUZFVPefCn9CVqXlpfLnFXtKPUyXkA7iBpbeEg/HNrfgdgAd49BTs3Onh5JuU94y/sHkGRf/f
	vXatrYR/ZIEi/tCRXbnH6y14IWxRANRWxvYPFWhV9uNVnEefTShpvZ0KYv1GFsoauuP766Rxt0L
	VBMrHRPbgzJvnspryPFM+qLR8TbWhAkw/f12vNidarlVA=
X-Received: by 2002:a05:600c:8218:b0:48a:6798:52e9 with SMTP id 5b1f17b1804b1-48e51dd386fmr64833155e9.0.1778071563011;
        Wed, 06 May 2026 05:46:03 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5382a327sm84332045e9.0.2026.05.06.05.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 05:46:02 -0700 (PDT)
Message-ID: <473925ee-ba57-44f4-8993-d953d29caa18@linaro.org>
Date: Wed, 6 May 2026 15:45:59 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: samsung: exynos850: mark APM I3C clocks as critical
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Juan Yescas <jyescas@google.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
References: <20260430-exynos850-i3c-criticalclocks-v1-1-6e1fd8dfa21b@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260430-exynos850-i3c-criticalclocks-v1-1-6e1fd8dfa21b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
