Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B94A156984
	for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 16:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706546374; cv=none; b=lePMhtkTCtfq9owwWIJCo+E1p9GmgY2edTK2II7Yloca0ECRw+WwXdBwrAnkuRUEv2XNmy7QUvaQHACzo1mGsIN+343TaueupVKrx4vSzgpoB0gahSnRu2Meh049b0hpMYJhewQO+7WocaOLiX37VLFEE9kPUeJ2OOUVQ0nJO+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706546374; c=relaxed/simple;
	bh=FHWcQrg6EPFEvmqH0eQBPKt2FvYxr1H8cD66r4DY7e8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LY+oolAujzoxowGKC7biH2lEifutR5eLQYlaUIu0jBCmysdI2F2QE0b56+pWSUp78QrZuAXGjUOFAOWtiy2tK4ALdZmoVsFW/had6VmRpoSrf/g4zr4q3nQBbloyCJnSgNTPEul/Z7JfwHJhXqIgaImm4z48xezALxbmaVw+AGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F1K5H5Ua; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F1K5H5Ua"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-55817a12ad8so2834240a12.2
        for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 08:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706546370; x=1707151170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FHWcQrg6EPFEvmqH0eQBPKt2FvYxr1H8cD66r4DY7e8=;
        b=F1K5H5UapKoSNF5GUgOX+j38iOj2vhhZz10491sXdIKaKohFfnIM5rUDr1QH/XOX0p
         m+qF5X/ZuqAahZa+cvjnP7/twJVj4jirpv0iaspI8PFszai28fFR0Tek5d5x1mBYyhEq
         uZuff2MloW6GExb/MAaR+TQR0AZUYCAC0A5LEWPpkv9O2Q+vSFVkJ/XnnmvXywlBmQco
         o+J9e2Gi9mInp7Rb8ePqYvbvmIY3DoMJ0cBxBvFN+KkxvuvHfwYnkRhjsLX9MdsIfLJo
         vGhyYl+2OoPe1AeQoxmTTWd/2Zh1t+UfQT2RPWHcKipfwAa/A97nSSL4AOoKmnYcyr/m
         dOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706546370; x=1707151170;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FHWcQrg6EPFEvmqH0eQBPKt2FvYxr1H8cD66r4DY7e8=;
        b=TZM+x6GdD7YHzgCId5sB2+jRg1vHMd6Me2MR43cHlK0iVF7llRpfhdzkv48nQydkqw
         MmZn5msdWwt0i9MHdGuLmsJndkGYwBumu4ymRykKPbjntd9zXLnWUTaKpHs8kBvM7kRY
         yZ1kyW6dNUz7a6/dAR/5eVwuDSiwLyojdKbc3qe91HRJZkqaeM/8rKk4laiU/KGZ3BPv
         JmyZ0OGEdfCRwwHvH1MTi0IFKqK9punF9hsZSkk4wUmRab97q3AnRUKWl0FgYP3lXFgk
         0jPswVx6jpDDjEPcSKHzJ3hWO8HNDUstCeQ/rctp+N1bjHGCCkTrbtovScY6PoMgH+Pb
         vewQ==
X-Gm-Message-State: AOJu0Yycg3aMjGIswMyY+x/pcG9H/NROnxEH4sKOWO9+cbkqXZO4GhCR
	u97XXRoZfC7z1/UenP+ULtUsepwNkBGuIAMM/UIHVr5QzGI7pUwLrpqhTHdbA54=
X-Google-Smtp-Source: AGHT+IHveaykAe2Gia9VkRGdUa1J0oM6GKhDfkmqjb4vj/R4B7VKKzRhqxrMC0YQ1JIZV/AEwS61uw==
X-Received: by 2002:aa7:c311:0:b0:55e:d846:ab4b with SMTP id l17-20020aa7c311000000b0055ed846ab4bmr2834528edq.20.1706546370544;
        Mon, 29 Jan 2024 08:39:30 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id n17-20020aa7c791000000b0055f283314e1sm328438eds.43.2024.01.29.08.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 08:39:29 -0800 (PST)
Message-ID: <0de3af8f-8f12-4246-81ea-3a3a2982983f@linaro.org>
Date: Mon, 29 Jan 2024 16:39:28 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: exynos: gs101: use correct clocks for
 usi_uart
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 peter.griffin@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com,
 willmcvicker@google.com, semen.protsenko@linaro.org,
 alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com,
 cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20240127003607.501086-1-andre.draszik@linaro.org>
 <20240127003607.501086-5-andre.draszik@linaro.org>
 <6ccf359a-faeb-485b-8047-fa61bb1a3fc8@linaro.org>
In-Reply-To: <6ccf359a-faeb-485b-8047-fa61bb1a3fc8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/27/24 04:03, Tudor Ambarus wrote:
> We'll
> come back on this matter on Monday.

I tested (correctly this time) and the patch is good:

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Tested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
