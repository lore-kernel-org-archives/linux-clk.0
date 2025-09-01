Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFD222422F
	for <linux-clk@vger.kernel.org>; Mon,  1 Sep 2025 06:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756707909; cv=none; b=IEnX/876YceJwcugtj/MXN7YKG+SrhwUw8EoW0JxofwU7MxS2WG4LXnuY8ZUxI3Rozn8mPpyMIJzyduprEO1W3WXcubynol3K6or1pJFZpQMLYPi7WXFdoRT9FM1TTfaJfld2/jav888Gc0Y2Q5yaZM+UnBLNQ9b4DD+hJ9hzVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756707909; c=relaxed/simple;
	bh=5tEFRvyGeKDN+x2Ei9Cj+rHE7MmPIKyHBlDmb1SmtGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CIxn1qIU5ILK33xS7G14/zXvu0ieB50xiK9f4oSgbNb1pNYqOxl8caju3mMBQeUp21h3eiJbzTkSvZlVjzuftNaElQQu946N9qvlbmGy+WNokRPIrNIeAbKwjNIvM9NmYZdIuKs30OiR8NDrjh5+GISNXstHDCQRcpNzXSpk5TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JDKvjeYO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JDKvjeYO"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b873a2092so12061135e9.1
        for <linux-clk@vger.kernel.org>; Sun, 31 Aug 2025 23:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756707906; x=1757312706; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2YeKuNtpPLqtxqq8gC2tE+cTRtA0VGDqCWttaxdOw1c=;
        b=JDKvjeYOO/6HDrP0X+HHkWGd75rKWnbeZl/5VBOLYpQoPKXtFqX5dbwIKAm8QysPGT
         5NpMTn9JKuXTSluQyPoG/yGxLVvODNUlVtXus+Kfd7ZVGScS+WPnURCutJ0IaVALK1wK
         Vf9DzIZI+Eol67nnigq6GhdsFYfI/frYX2huZmoMPN0P8PM2mvtKGUI2O1bkSerWURug
         0F9+k3ANaVx++ezFQm9KylhlTxs3gXztLa/oFi0ABlD1u7o4fJ3BJMUSA/LTywiTo7+D
         zrqwfcMSevmVKE0qRzeZrV61g12N3gPKC+/eznUYvIcWbohVkQGzFByDt3BWq95YfMjo
         4nbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756707906; x=1757312706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2YeKuNtpPLqtxqq8gC2tE+cTRtA0VGDqCWttaxdOw1c=;
        b=ihA/UJ7UCpHmnB7OlV3fMRjUfWzRoEYlUrbs67dfICsoTsGKh0AvZ6BhMZmbQFov3L
         QsWZFU2JlFOhkuDQUb88ygkO3lvbDAkUXTThp7vWusPf/DGOptXaJbx4VWlx+GKSZJxv
         NBV87Add+xiEZ0Gojo3ram9IiU2LM+/HrcBuQMHfSYafXz1quLDwRFKGMkRjMfFm4Swi
         Wot198pCLcI+V1I6bxiyTsM8kHQtSvzrYwXUP0vpZcV0SXnGfbtW684NYoTPxam4v3S4
         AnfGXfSg//JL58XsoscaCQK54fwhu9u9WDhzrlIDK0GTmN7cYy/xfjsqPpcWBO8f3Lpb
         fF/g==
X-Forwarded-Encrypted: i=1; AJvYcCUs9skOgn75qQTGeyqkQWK4qMNfiDkgEQlqRPnG1hmnlhh97hcGE5eBaLLX2OapFxQy6hI9b5ahJfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEmgZW6oDuVzTv9FhnUn2dvFnl4yHfQypvsn5yEYxUaY7tJDF6
	A5SJjovnMrSSFvfaIwuYYsGO6il9XV3b4xW/VliUhb6FYQ2rFhuTxgWDR1cDOrcmzow=
X-Gm-Gg: ASbGncs9cVtCMbECJGZCruDrTCKx0VfzEY8utFebNc/w+xzK8FzW73cWD1uPRni13N4
	9KZjxdSZyNDk5kb4TDdmUMGWZcx7juK6NO/kBEkv3tWVqvFEta8VmmbqpWuAbOjqbZAj+4i3Q8d
	h/icIJB31iJlkq3h9MLaZhuzBa2AzkT87FQ+OE8OuSgXj/CMf1OMkO51VlNfVP8qHEhgHTKvIm8
	3iYzTljVvvweF/k3lEGsS4nCTn8TdCgJAZrzisSXK+fTBNvwl4i9+k8sC8QgCNJFQqkK9yTygNb
	whpNZneC0cGtYukKswUyU2x+55GGVVRNM43VoY3tcs6qNHiEIu1vkwINAVIYo/5yJ8H4sLOsdzo
	GuhGPlwkCqpHAzIKPIZAgZzuESUlewIfoU8/wbW5v
X-Google-Smtp-Source: AGHT+IHnke2GT0NOJivpigEQtNHBZdI155ZzMIvdBsIqtx3ducDptv4HE++iJXeOAgJzi8Q9MoWEvg==
X-Received: by 2002:a05:600c:3b9a:b0:45b:8866:50fd with SMTP id 5b1f17b1804b1-45b88665357mr41091535e9.32.1756707905579;
        Sun, 31 Aug 2025 23:25:05 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d3a7492001sm7507997f8f.42.2025.08.31.23.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Aug 2025 23:25:05 -0700 (PDT)
Message-ID: <788c3aba-568d-4297-bc8e-f47921859d57@linaro.org>
Date: Mon, 1 Sep 2025 07:25:03 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: firmware: google,gs101-acpm-ipc: add
 #clock-cells
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
 <20250827-acpm-clk-v2-1-de5c86b49b64@linaro.org>
 <b5d0e355-2681-4eaa-8a67-82a364312ec5@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <b5d0e355-2681-4eaa-8a67-82a364312ec5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/31/25 11:40 AM, Krzysztof Kozlowski wrote:
> On 27/08/2025 14:42, Tudor Ambarus wrote:
>> diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindings/clock/google,gs101.h
>> index 442f9e9037dc33198a1cee20af62fc70bbd96605..f1d0df412fdd49b300db4ba88bc0b1674cf0cdf8 100644
>> --- a/include/dt-bindings/clock/google,gs101.h
>> +++ b/include/dt-bindings/clock/google,gs101.h
>> @@ -634,4 +634,19 @@
>>  #define CLK_GOUT_PERIC1_CLK_PERIC1_USI9_USI_CLK		45
>>  #define CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK		46
> 
> I missed it last time - this is a header for SoC clock controller
> bindings. ACPM firmware is completely different device, so should go to
> its own binding header.

right. Will do, thanks!
