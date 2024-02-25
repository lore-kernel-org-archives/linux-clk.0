Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A790C1864D
	for <linux-clk@vger.kernel.org>; Sun, 25 Feb 2024 16:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708877461; cv=none; b=iHqSnGFKU4SQ9jCacmEd3FSBtefk1O5ODNsH7df27Jm4azfwO8EW5o7AOTRw/cSU26h0hAtoLRE0cYYBCowcB66UvZy5uG5ZQ93uNQH5GA5JZxOEVYnUO/USJv/6ypUyagLnvzSx7mLNq1Vq8+34wCvutf31QDU2kA5ZFdxWIBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708877461; c=relaxed/simple;
	bh=xSH+YB7t+3pdc8pXNR8f/jgF75lBsNqAWWrei3EbdTc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SPXNiFCQUNXKyXvZMXN6HHPpgC/Ai4iFiqEK5y3J41ipCuvQYW74ge9jNWLRc6XKm7nQMpHG83jdJbgXu0pUlscpFLyz5aCN3nDxm0dAehXjsKDvaPF54kWKJ4xYQXZWFQrwBLVJVLfLcgUk/f0i0zRrI+qzw+lmu4/9PLiKNXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gsg9e3bc; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gsg9e3bc"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d23a22233fso21393301fa.2
        for <linux-clk@vger.kernel.org>; Sun, 25 Feb 2024 08:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708877457; x=1709482257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gwy9vyyCnZwGdt6lVtjOy3+PH4iIn9f2qsNf+7CIDLM=;
        b=gsg9e3bcBeM3GErg6f2g1mX4Lj5uGlZZGvoXEeiCsS5dzMIrJpw5LWXWgZudFqkoW2
         4HiNUUSMzoIqwp6K+azdbTCm7/ksLRJjPaH3SI07z5+0lS/AWaxblL6iff4q/id7bZ5u
         OcyQXVGq8+x+WH/SJtk5Qmtl4zL2qmYtpycQ0ZmZiFjKb8pe4tbqm3YUhM56pTBo0FFj
         JiRmmLV1yKeODPap1TdkTGaq3mhkfUZwqz+QoKQKxoQyfaTEnoGRcm3NTx/rEcAfrDYy
         zMcZWUSF9Z3262VRFAT/cHbZ7fEgP96aLWqLPBWvq2u3euS0QKAgpHM0iprLEl8amrjc
         L2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708877457; x=1709482257;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gwy9vyyCnZwGdt6lVtjOy3+PH4iIn9f2qsNf+7CIDLM=;
        b=RP3KTgHlMEbbhTtktK+px2WNJZf8ZAMeQKRETYJG+tI89Ny6kWJLvz5GnRXb3Dna1O
         hlHwxqghaC+txA8zffEFn9URwbZkm7xAdHvkOR7pNULRxzQhubPUhAvmv035Zqxm6dcH
         6My05CKFZE3YnQY2Zi+aU22quOoNQ+nMrr5HdUXwx0kj62nJ2oc+E+AnxaCq++1Hivjl
         1Ybcy0s1SrSdu6RnoLPBZYWFU+e3a8EIzj40BodYrOjcyTaM08Ka3QH+1C8/PzF/XzyR
         eVzTWxBPOrE+QVKEKq3uqYFJzPth9YsafXMpH8Zst2864BewpiLaj/BindYBLv+wfOI1
         aR9g==
X-Forwarded-Encrypted: i=1; AJvYcCW6LZ400ZOHF4G5Nz/PPrm1ZjsvE+nl0u/tEkbW1pCGAsKiR8HNuJ2AzxgsyD7KP2w1hqciWM/YmMP13Rw24ccOtSx1iGYRxSKb
X-Gm-Message-State: AOJu0YzuaR5Tro4mzHsAZ7Z/PIDWzUsMx8Pq0IgH1Ih6cNtkmTU3z4Hu
	90qLF+07cSQAEdpxvVQ7OdciLCfHmaM1qKilFqp5JPKM6pt8ka4JCtrkk6v+0zw=
X-Google-Smtp-Source: AGHT+IG8/ptAobua30//y2+R96EYFI741EQSKAHAi8ZfiArwF+v21fcfv5qDmbPTyXrvQSKw8DPEzw==
X-Received: by 2002:a2e:868e:0:b0:2d2:79c8:838e with SMTP id l14-20020a2e868e000000b002d279c8838emr2549906lji.40.1708877457033;
        Sun, 25 Feb 2024 08:10:57 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id n21-20020a2e7215000000b002d2697570fcsm579184ljc.93.2024.02.25.08.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 08:10:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240224202053.25313-5-semen.protsenko@linaro.org>
References: <20240224202053.25313-1-semen.protsenko@linaro.org>
 <20240224202053.25313-5-semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH v3 04/15] clk: samsung: Reduce params count in
 exynos_register_cpu_clock()
Message-Id: <170887745504.215710.7797838794747602399.b4-ty@linaro.org>
Date: Sun, 25 Feb 2024 17:10:55 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Sat, 24 Feb 2024 14:20:42 -0600, Sam Protsenko wrote:
> Pass CPU clock data structure to exynos_register_cpu_clock() instead of
> passing its fields separately there. That simplifies the signature of
> exynos_register_cpu_clock() and makes it easier to add more fields to
> struct samsung_cpu_clock later. This style follows the example of
> samsung_clk_register_pll().
> 
> No functional change.
> 
> [...]

Applied, thanks!

[04/15] clk: samsung: Reduce params count in exynos_register_cpu_clock()
        https://git.kernel.org/krzk/linux/c/84d42803e4f163b1b6cb4ae05d91af693a1985c2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

