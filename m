Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7552550A3
	for <linux-clk@vger.kernel.org>; Mon,  1 Sep 2025 07:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756710377; cv=none; b=XwTKlqsml1VG4W1azobtS/GLR6S+QUIYFQDRNPW7GBx5MMMne+Dy9jmjKz9D0JnbTtvKRk8UTjuDjZsKoog1lxgJSWmubTLk0GA8B3MTYKLRz3XU+1qSMUWvs4nnYKn9ECvvd+h2gxyhZPej5w1TKQuxHuc3k1nnSZOFtIHTVLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756710377; c=relaxed/simple;
	bh=ghUkVbbL6fSFFM+VnU2xLQumO120VvySAdwvS0T6ve0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u5JVG2QuGO+z9n7wFFWPrAAnCCiMuCR5Wh9Mgw4CQKbootCZg6uA0YjyIC7e1swFC9Lq9DP9NIaHrqmR+6qLE37UuTIV5XaIbnLVZwTQchp7jZV6CYi2bQqQeEWnMmkvdRxI385CTZkRnX5nefPAPeKk7GxicZt7J0y+Qu4S8aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L5V7s0Hc; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L5V7s0Hc"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45b873a2092so12359145e9.1
        for <linux-clk@vger.kernel.org>; Mon, 01 Sep 2025 00:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756710374; x=1757315174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5RiPjeOB66FDKJZfr/ttLTVqavYTkJ/P7VOQby544s4=;
        b=L5V7s0HcpxIN9ySwa+9k8bvQSXh6cl0hgNZll5XItb+IdlZ5Vu2bJDbABBorJxKxF0
         UzscACIGYpDu4Np3yOwYzXlypBbXq7lXYdPo/SNf/vWBrRBfkNm3V5Ow3BgEI+qEntL1
         Tr904zYYYwi/WIO7yQduQExd5GVJ1lhGjnyClNX4+cuYikU274e/6Ek4ZmQRjEZwTPlH
         cajgmtQiOwddI1CWRuSaJzNIAwSKBK6Y/69Q4Zr06iuFf7idqzFEtsm/ap1F3jX0Dc8S
         4gZMLk1w0TGZ0cxhmKra/aIVjvHz6HccPzM4IGvEJM9qVthIB7lOtmUpymMXydjEGtdG
         VqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756710374; x=1757315174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5RiPjeOB66FDKJZfr/ttLTVqavYTkJ/P7VOQby544s4=;
        b=Moc4IOVYZnGsAfSKgK2ymhTasRQngAD2pdWAUtmf3cAqYvtM08AVd24wTE5IrJ7BrX
         iyulNezZ1lomuL8k0RYCKgnbR+QFhPEyH8X3C9ST/CjM3yRezynWC/aFRNv71k1RzzT1
         WIZuy1a1E1r0ZKWyFc3C0ZSsZ14vzUyvQtSICRHX+Q2arJNEp8PV1nEbwGwov5NgXwRH
         fx3QOacC1/TpdSQwTAbNrroOKb93GQDjsN90kNBYV6+eWiApuKfgKLKK5J9yY+zsbYCY
         1kA3vm1KdQd91W2ThjgZv4Vm6xpyTTz4zyJngTXkHG04BkvxD3LtFmyxdKf+WD0+XGMU
         XFWA==
X-Forwarded-Encrypted: i=1; AJvYcCXNNeq0IUQS0ahLua1rhSyBxf9uPgnFai/2pxi8FpGLPzawXX04COxm8n0bPn4XABThouPhE0UCaGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxvlX+HCZVbYQtrr7kMEjA4B0t+oq6Kj4U1fxWdOyoUWEN0EAk
	ycTNPSrCuBYIYpN05gJmagtB7UsP3XgTDELhQWUKZr9nAjwPxZ5Ae+ugsb9GE8pkm9s=
X-Gm-Gg: ASbGnctIjIiGJnSwZiZusa7VHzRyh35N63oQiX29oxnCgJFp9U1xzi3FmS+PlUNaELT
	WKKQ3Ouql3qWz/H5Z884jASqDNv5hrRAjnkE6Ag0nQrIimsBWaSgftyg/R4Rh6TF4k++EcSen50
	hzXico0sHppGyoVSrHtC6FkMkInqlNeFRfQaoPaJmyANApqNu+g6veQ2F9vpUEJwo0EIbBJ6aWS
	PycIs7vk96J6N9qIrnxRFqJJhrqqHr+XArR0K7+F5mpTmt2YsgoUaY8uP2n14dsjXp/lBM3t9+t
	4aSr1yE2kmdSnC2aFNP84JY+QNsZDQ+rb4jeIT9B7gfCQ9TgMlAUiMkRoaioa5jlv1QEJw5+7qD
	W2AxtIi3OTk71hWZgv3U/Ii7VrInVmFu3uI54G3UR
X-Google-Smtp-Source: AGHT+IFnBbOE5ba7PQ9iK6x0QBC9gheBMd69i0QeCPDpf2UAKrxEuZOeM6Cz6ka7pF/Dx8JiLhhRIQ==
X-Received: by 2002:a05:600c:a44:b0:45b:7f72:340 with SMTP id 5b1f17b1804b1-45b8557c68cmr60349155e9.25.1756710374198;
        Mon, 01 Sep 2025 00:06:14 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d85f80d8casm541692f8f.54.2025.09.01.00.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 00:06:13 -0700 (PDT)
Message-ID: <73674a4e-2397-4470-8743-763e0fb7435d@linaro.org>
Date: Mon, 1 Sep 2025 08:06:11 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] exynos-acpm: add DVFS protocol and clock driver
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
 <28b5b033-76de-4fed-af6b-6d8342362c47@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <28b5b033-76de-4fed-af6b-6d8342362c47@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/31/25 11:42 AM, Krzysztof Kozlowski wrote:
> On 27/08/2025 14:42, Tudor Ambarus wrote:
>> The Alive CLock and Power Manager (ACPM) firmware exposes clocks that
>> are variable and index based. These clocks don't provide an entire range
>> of values between the limits but only discrete points within the range.
>> The firmware also manages the voltage scaling appropriately with the
>> clock scaling. Make the ACPM node a clock provider.
>>
>> Add support for the ACPM DVFS protocol. It translates clock frequency
>> requests to messages that can be interpreted by the ACPM firmware.
>> Add an ACPM clock driver to model the clocks exposed by the ACPM firmware.
>>
>> All patches can go through the samsung tree.
> 
> You really should have explained the dependencies instead of me trying
> to decipher how to handle this patch. It's really not trivial.

My apologies, I forgot. If I tested individual patches, I would have
remind about the dependency. Something to automate for the next time ...
> 
> You do understand that clock is completely different subsystem (Stephen
> Boyd)?
> 

Yes, I do, sorry.

Cheers,
ta
