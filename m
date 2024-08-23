Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E897813CA93
	for <linux-clk@vger.kernel.org>; Fri, 23 Aug 2024 07:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724398973; cv=none; b=SVzQW1Jrrn11DufRJmErlrKo2/tqjomdZqP0rXa25X33DynQxqkHaXWUw/2SwjcKsMfozeog7JBRjBwLHsn3kaRIL7E+7iF49JfO7zSvVNWpM63/IAhbgk3f1XiwPQwawF6NoL4ZeLk7jcz1HJcXYKGUkjkIpOC0q+8BcEw0JjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724398973; c=relaxed/simple;
	bh=YGXtqEXLuxTj4L3nv5xoL1tlsMlz54zSjodhYy2ZDYU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uVAbYngKu8/6v0FT3rvPIKkwrU8UiS30Cmc5/ok2GpQsQvrSDauFvK32sT+kPiaNbJ5w9MS93aZbit2DA6UcFST4iqRR2Vrg/8XDbsSOlgAm+nd/lgY3Qn44QEIGEdgDQb1ou9amynXQdrfY/soS5/H9sAMPz3o1aFDChr2DNTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B8wNaoWa; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B8wNaoWa"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-36830a54b34so88916f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 23 Aug 2024 00:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724398970; x=1725003770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWGduNs2rm5qHwk5ddptW98pyWVss8YO6iqSSyBnt4g=;
        b=B8wNaoWaChJZqjZs6iIfk0GfkKdl4ey+3gV5rzJmztnF2NPSMqnHXcGNs+qUYFCz6b
         /RClRLwQ96MJqklUXpX7SfLEsxAvFARJ2XN/wulzVOjHT4ryyL/7lmXPKtYbe4vHQpdo
         JMXwqglPt/oO6d0mkDKZiIRoem0kkjvdT/7q9r5EcjMV30ASK+6QQjjAPVPU+EdK4CcE
         AnRl1s3QGs2VphwDNT1mNvhcaCtE0WmmOqFOr8FgbWN8728HGBmXtsJDbRMu/loY7Z8m
         UzZCcW9MdfJdubSVmkA0BCyJ5ZYN4IURggTtqqKcDdRw18voUf5iI8FYNLxUwATydPEP
         LsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724398970; x=1725003770;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWGduNs2rm5qHwk5ddptW98pyWVss8YO6iqSSyBnt4g=;
        b=CDdn+aUOeGW1yn0oGvIR3H4/5Ap+IqaqcfeXRGSo+isZ7zpTO9ujKOe7qcU2jkQUFs
         ACQIS6sAogP1A/VTVpst2aYRXUyVzAob/xkqR+fw5U9XdjuKL1pFNaYMEKjbf8RA4k5V
         djK3cl8i/ea9a5EfSyrGd6AMvPCjuxqLLKGQa6v1/Vb//5QNX2hk+wUhfUpK/ZGrSYbV
         SlucYUMHu4sgvMouBUiPhIwamzE0PU09Xg3lEDItwsZIONei4uTygyH87ZJ87GEV6hn4
         lo8w3pHQBOylP+KGMhLERmsZsUkhbRPTtTspebBjT9pVs8y0PM9B9YM5CmqOTBjO86S6
         F75g==
X-Forwarded-Encrypted: i=1; AJvYcCW0giumJ3/zkxeSY229YaFwMg7DfdoL0nTFrkXMo5ZB8SSK03g6iyvtlrTXX0yj/2i7gV/W/ENL7cc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyIt8MznRrdnAmcOe+T2uExTr++hgMUNG/NHapH18qmZCyugO/
	8GqXmIXjAz3JDIW8TIjsvfkR5aRC5zFUBTD/EZjcHMZd92bciOztvMuDCIerg4s=
X-Google-Smtp-Source: AGHT+IEJ93sKDaOo1SXjMAhBtHW9HFDHMZTFcxKf9M1sLtwwW1Yaqmgrgefwkq+7vfKzhnmdv6BhWw==
X-Received: by 2002:a5d:6daf:0:b0:362:4aac:8697 with SMTP id ffacd0b85a97d-373117c3298mr510253f8f.0.1724398970151;
        Fri, 23 Aug 2024 00:42:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-373081ff63esm3485541f8f.87.2024.08.23.00.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 00:42:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240821232652.1077701-2-sunyeal.hong@samsung.com>
References: <20240821232652.1077701-1-sunyeal.hong@samsung.com>
 <CGME20240821232656epcas2p3c59f98d2bd185b8258096bf1597d75eb@epcas2p3.samsung.com>
 <20240821232652.1077701-2-sunyeal.hong@samsung.com>
Subject: Re: (subset) [PATCH v9 1/4] dt-bindings: clock: add ExynosAuto
 v920 SoC CMU bindings
Message-Id: <172439896878.16898.16710163487615295552.b4-ty@linaro.org>
Date: Fri, 23 Aug 2024 09:42:48 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Thu, 22 Aug 2024 08:26:49 +0900, Sunyeal Hong wrote:
> Add dt-schema for ExynosAuto v920 SoC clock controller.
> Add device tree clock binding definitions for below CMU blocks.
> 
> - CMU_TOP
> - CMU_PERIC0/1
> - CMU_MISC
> - CMU_HSI0/1
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: clock: add ExynosAuto v920 SoC CMU bindings
      https://git.kernel.org/krzk/linux/c/997daa8de64ccbb4dc68d250510893597d485de4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

