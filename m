Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0736207A33
	for <linux-clk@vger.kernel.org>; Tue,  4 Feb 2025 08:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738659062; cv=none; b=JthIEec/5Syh9fNs7a9XyUK+tT80UFhy8ANr4dkvHjoCMFb5Mc9YmAVR1tVRdVPszhGSylQn6pyurky90+RP458KF6OF6vVg2Ye43kMkx/HaCDyMUU3TC+Ce/rJE0C/cOyRmrnvdaseLsCaCG+1Ww+uYKBTVa+ewgUSj+oKY900=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738659062; c=relaxed/simple;
	bh=YPt7gKipaMwkPE8abX4wqOxhxvYT2FdS5FceQVgzPek=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KgmYNcdnelHUz7aQGbwZ7pGNpmkpbf1pTs+MP4/wdJEGNDznFPJQHI3iX+Int+KSGMhTAGqGuX72VKssEirFLavNvBN44c2XI8FANt/4F1K2+zl+ubMd8Dk4JDOoJ6vq5ZC1tJITDgGjlw9SeHiXwAX3vIoR8meh6xJ0JXELD7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FIFosrYo; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FIFosrYo"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385e44a1a2dso312339f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 04 Feb 2025 00:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738659058; x=1739263858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHI4ANQ0svBkpULL9bY+LYyIFtREYaSz2osAbuLLKME=;
        b=FIFosrYoqaZw9A8jE3nW7g1JYOdhLSC6NHKF0mksHZ1h1PWUuI9pIhCMJ8pb/WEtZR
         DakFB1M/QOPcpwhVfCi2ukcqrBHUNDHlbMLR1s0/4bkToPFgqTmVkJj1Doz7DndoiKC+
         hskeiS3dgLm1vh+FRPwoLyZ9XRW+dXYgjB//Rbuw7d4zrNgYkc8iDXCJEJ3F8ssJbUhu
         W5sbSbI7C5+qC+xvgWgs3/f1Z//EbOikA51rqjtm1MYZacBKDbQaVK/lIL0gpNfjv7r5
         81f0+4AXmkYzkkzbvgIj1gvE+G/oU/3fWTjcJQhiXIbUcxpO9Y+ozSGj4NnT9wj7kdAl
         LqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738659058; x=1739263858;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHI4ANQ0svBkpULL9bY+LYyIFtREYaSz2osAbuLLKME=;
        b=OB+rTjzUYnBy4NV72+U/QedkS1vdUUmjHLWy1K76zJbT44V417rsOffPRZtNnQoaF4
         SsSwpUxwl9QoWWUBYO4xgsEQVzPAC8pvRa+2P1FVdpB5wzkdKVBQo0Vr+5KyBBYPK8yg
         f3deUUslBr3RUelEMYP0aZo1VQDsAJOoxVquLC3nApJ5PAYRPhRb3BPzC5XJi8TIGa4x
         RlWs4hs/7kHgFMF5PwX63bXefCdPI/BdnzZlT6Nb+zmO435g2r/Hy+YeBupG9wwT7uWL
         rOKFk7pnm7rlgPVDZsXldUzBWoejMn8KxVaKHBdISlYif2OUCeTZRSzG3GbQwL9DUys1
         0EJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUEWaOghJ+xubrSsxi5wAghzzgK16sEuTPMdnS69zR+qZIi3N18Z4IrdY8MvLHYg3bwW3mTFyiRpw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1cMWYjAiKRzEOt92G5e0+WzOe67EjFabrVRGyMubR4/p6johD
	Mw+2geLfdl7kw1ZX4MqWe3T45AbLIRgdbs59nYLjqY8NidrE3ShqHVZgng3wVj4=
X-Gm-Gg: ASbGncvcUv0PLtAH6n71VYFuNTcDfKxHPrGEUkRs1/kT+9Va/WW+SoNlkxrHX6tm14U
	PanQFF0cXyo/LWIi5NJOBczueE2oINYPOBTqZJ1dXGxM1m5yHzAF0SdxVwwfXlA+yyMVZidOEzV
	/mwS1ItFnGw72kIk1dXPQMQ1d6SmjcEHa89popOhAaaJUrgbFXrCgLCXIZ0q5VymCvDabOnZ3pT
	yAbWsMZ4OhukYcVccVMIiqzxjCJISftKRbBhashMq3LmSMQALhjwMICVF4plNCGpyfeZEYR9jGH
	0BUnoTPj5+fdBin7xq8e1dFBmPne65M=
X-Google-Smtp-Source: AGHT+IGO43N3gDtliqfjaHSeEORXODUkak0lfjeeQYTFjCKfZJOWJrPYG7CBCu9P6KNQnJ4ls7UBSw==
X-Received: by 2002:a05:6000:1f88:b0:385:e374:bee with SMTP id ffacd0b85a97d-38da4e0276emr723050f8f.4.1738659057514;
        Tue, 04 Feb 2025 00:50:57 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38daf27bbf5sm503066f8f.48.2025.02.04.00.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 00:50:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250202220425.199146-1-colin.i.king@gmail.com>
References: <20250202220425.199146-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] clk: samsung: Fix spelling mistake
 "stablization" -> "stabilization"
Message-Id: <173865905644.26600.17565544065003058616.b4-ty@linaro.org>
Date: Tue, 04 Feb 2025 09:50:56 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sun, 02 Feb 2025 22:04:25 +0000, Colin Ian King wrote:
> There is a spelling mistake in a pr_err message. Fix it.
> 
> 

Applied, thanks!

[1/1] clk: samsung: Fix spelling mistake "stablization" -> "stabilization"
      https://git.kernel.org/krzk/linux/c/480b1825d3806d744c589064df4af2bdbe2c7c2a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

