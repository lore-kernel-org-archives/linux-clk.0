Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E4A5F85A
	for <linux-clk@vger.kernel.org>; Tue, 23 Jan 2024 12:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706014499; cv=none; b=tY7HE2J1Boeh7DUUxolzkWgdTz0vHSb7w08gANmLhzxNj+1r+I2Z+HwAblNWh3SAn7ifQuTY19DsCVIkbiZzfzZiTqL81VfoJw6w68mwtRwPB4E7fgMgwBslsAHGA/7b29BTbp4fR4Jth+QJjIBeKIl+Gpnh2cmvhN9iZ593/7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706014499; c=relaxed/simple;
	bh=O0FJHSfKYfe9PmreWTwOZnuzqGNOcsslT8fd0nZ0oaQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=L/All4felYZL+JDed/lqMZbbdL/vuOuyxPze6n+ksQ1oI1o8gWyLH75BFSGolXg1+Y4CL/jVVzhBjokd1UxzpQGzpnxCZcrb1UtWbOccSb4XVcIC0DVZI8/gPnGdcIkzxJxfgG56NPRlIJZoMkZcWmxiQpxvYsLbvU6dPpBmGOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dwEiL28r; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dwEiL28r"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-339231c062bso2935595f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Jan 2024 04:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706014495; x=1706619295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXv6GcvHxSamJACw/Vu/xjD9IvTTgaCvE04/PYg7Tv8=;
        b=dwEiL28rbaDH/pkTSxinpiG6vo9U5srydYbZT604k7kJa2JxucuoZEQnkDab/kuh9M
         Gll2qETcy6CPHg5w7h4DM/3Xc3CQrpYVZqX6Gmttz3QNIxFlK8x996EZcSvAI0cm+LSi
         K+Nmfqd4Lx2aZcYoUzdoy9qHB08L3OtxYTyRTNuI8iwu5UbnH5xv2XXZgAlTfCUgLm3x
         odsbQ+s3/Dmg7FHC8j+vo8bD/GbcnTUvxH7L7saiL2ufXrcGp2eGkaSBV+2uISJWKkzP
         HnRnjf56YHAYv1MYuYWWLUCpUSCHf1xyAj/hnx2eMS+etB0hpCdxb44FtZ7nytuBbD2Y
         Oi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706014495; x=1706619295;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXv6GcvHxSamJACw/Vu/xjD9IvTTgaCvE04/PYg7Tv8=;
        b=HnMDNTgFsPIS/gGFD0L2tu2DgHgUgYyrt9oqbk2vG7Tyd7YtSNOqeZoRNONSMXVYL7
         Osqbb0c6oQciixcepALAMHKoYfUWSYq7f+aXyGAnTEDOVIDeYDOWbY0Ff404SdSWKy4j
         wPNOru3FbJzpu9zmmZTPyNo9u317aGypI7CKV5N5a63/0CtRsl7HsLYybbZzPp9hoOwe
         iLBg8d+6cu7ZpLajR8M5+dW9pc0PGaNEIQFDc6PJcyGt5mAIxzHkSKy7WtPmw61/SH+7
         8whtUfePNB+xsu2J/7PXmb+pieKpcmwJixoyJM9ZOdcSEQD7Hm4i06rLPst3roIVMYjp
         Z/mg==
X-Gm-Message-State: AOJu0YwXz6HisJ2BG0sQX4JZMJxpcSsvFjf8BDfWnkiV5V0KidJM3p15
	v5Ftcw/JkuoYKNenIfygJRTS3pmfrlzO0g2yuQyza5JVyh+M7cbjbUtHYXeZAJc=
X-Google-Smtp-Source: AGHT+IGCm88E7Mb6BMnwj+m60uxypS5GrB63KptppN7rx+rdWWmrbOjaOWjtIGTHjQOon7qjnATKbw==
X-Received: by 2002:adf:f20e:0:b0:337:bf9e:c0c7 with SMTP id p14-20020adff20e000000b00337bf9ec0c7mr3756643wro.27.1706014495093;
        Tue, 23 Jan 2024 04:54:55 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id d6-20020adff846000000b0033725783839sm16173587wrq.110.2024.01.23.04.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 04:54:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
 linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
In-Reply-To: <20240120012948.8836-2-semen.protsenko@linaro.org>
References: <20240120012948.8836-1-semen.protsenko@linaro.org>
 <20240120012948.8836-2-semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH 1/7] dt-bindings: clock: exynos850: Add PDMA
 clocks
Message-Id: <170601449352.48954.11601245809418910717.b4-ty@linaro.org>
Date: Tue, 23 Jan 2024 13:54:53 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Fri, 19 Jan 2024 19:29:42 -0600, Sam Protsenko wrote:
> Add constants for Peripheral DMA (PDMA) clocks in CMU_CORE controller:
>   - PDMA_ACLK: clock for PDMA0 (regular DMA)
>   - SPDMA_ACLK: clock for PDMA1 (secure DMA)
> 
> 

Applied, thanks!

[1/7] dt-bindings: clock: exynos850: Add PDMA clocks
      https://git.kernel.org/krzk/linux/c/bc8cc7fb55b8da8c6b947603b1bad585e866b90c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

