Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441F2CA6F
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 19:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761074833; cv=none; b=ZkFvhUNFR1RCFVb6ZJG7fEG3ANPa1/vceS8eKEh+5zlnzAkp4vyk98wJpdhCJDp+YqvMdaDlamw5AReN2eXw3NrkJ36wLANSjB7q5fj9UhcD+/iYYdbskYnis0JcF0X6dv8RqKxl4/whwu1oNSoWo1hW/35vtQd3UnZ7xvRC3nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761074833; c=relaxed/simple;
	bh=DeJqDi9szQA8p7WmTtRsNFt70PHzVsGKe9eHiJ9l310=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nN8dnCNDjjkfFp9fJE2O+G9fYvaRR4WaXSyXxdATJpoVeOVDnVZ2bMlnQrFCzlMxBCZpgmYHiIzClgrA1QXNr5wTAmMRyG28uXEmPXx4JfOdnTZG5D7NHJYiNAjzcHRSPXtQcc8cAxs7M4mX97cto7xFmtc6SHwHDJVsUOPbfd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d+4Z/sSv; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d+4Z/sSv"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-471d83da4d1so1752205e9.3
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 12:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761074828; x=1761679628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SCUkszQLT3jhOeJ8xWYrP1u+Oz6oVJ2BJ9Vl0R1XPo=;
        b=d+4Z/sSv4UIy80HAt4Mvgmb6afc92SvGkb6sUSlw75O1hOa7k2EmLGgiZTLFgU2C5j
         r0cb6sbWMY3N/HEJAwioAoOQimpSmvnej61OXXBLm81+epzjdSY5HBSmAplS6xoZDW2f
         1siwtTKbdKyLURAJNkZqR0lBGiapvFhVx3gl9xCV6S1v7uN9sQaj1nfg77ytqq/jDspu
         eP44b+xaU0wIRSTq/sbkC4SEO8XAJBOqaKC/0fuRtNlAgqWohUz7ya3a+slp01JIeR5P
         cC7OvgRIPtB3Ni60lou8A9ohsvQoC4AqgVWFJ5cv1hAhUUtJX2p50Xq5bJci8/it02Ui
         a4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761074828; x=1761679628;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+SCUkszQLT3jhOeJ8xWYrP1u+Oz6oVJ2BJ9Vl0R1XPo=;
        b=RdhEAQq7tgRWjwUlTuGrVMUPHZQOi9iiJSVndkm1hlojLNkUMs6YBEDiQP0SCqBh9s
         Vz0+1hvZBYSKbEJL8LPjZZFGh1naKLdOCemqpeU23gxQXTb04Ua9QUT05iJkA8qip33d
         BTC0Y0FnGdIr2dYDkRYnpAiCWWgT2kkR8NxK2nkxSjHwdrZ8RP7HZW2FSjCYjatv+3Q2
         kOciKt7aJMRU2JuVzzwLIwzlo9z65Go/r/mbMS3HQBm6R4dMPSG++Bm7ZcTTOtHR2rIH
         +iw232SOOjoUZqdwab48lwUVci5479f2XKTuizrS7k7LoRf4Cxb+GtgetFTJYazhWiJo
         eFzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4DXDveEneHjeBmqwNu291glyUwJLSD7XVHe6eGID9cQvJbp2iI+0QtUgPwoWKs0jNEKBA6CAcRXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTfT/wk+dyupxeQfpTJMo+yepuXvHkhifv7dPAJi6yC07wjC6H
	KPTQdQ07ciM23bydBkBlV87AyoIJzsBxbjaYuWLjIGT2hiavH//tsDXHju8Ls73jlho=
X-Gm-Gg: ASbGncu6Xg32IXmuoCAKMMVqefnk0eCCh6wFZazyRI8aW+Nfe/FFitF0LTtTZBZkKbY
	gjinHYJhwC/+0qX4WMnYfa/ABVAz1UCjEhyFbpxhysFe35NYqwOg3MZtRF2UlrhEMss2LI1F89I
	iHwD2Uh+SHFXlN+g41QqFyfXQGmA0pjaeD+/APt6vSj99JL3pGoipvKKQujhBLgAaPebhoV7eYH
	tW+Tw8icCel3IL/hW0nMC7+XQlc9w9YifU7SGvWDY+cW/I+9bEVvUmx6LlqDNfZiZqtYS/aNW+z
	PYp4K2rT3YyMPmLKc4nZi/aS1bQ7YAISdo+dTjeuZA8xqE4KcbWuwSAK7cEQq8AczSn4KXVhsCZ
	jgr2KeDbTmiuOKozbX9O0UJnGai926mjGbAvyQ0pst2vHy03F1xXcooKBERZgPTK8IredakHTP1
	clJ2//5RPPD+V1vmpQy1syMgxJam8GiCaKVDYElg==
X-Google-Smtp-Source: AGHT+IEyLv1lnWbFD6puUzU9WbOWyzqsLRxtSYF5/o3s87IaGKKi+zQdweoF9FjJ4w5n57/TykzA0Q==
X-Received: by 2002:a05:600c:458a:b0:471:1d8e:3c7c with SMTP id 5b1f17b1804b1-4749435b2b6mr19420285e9.4.1761074828560;
        Tue, 21 Oct 2025 12:27:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c42b48c9sm7839115e9.15.2025.10.21.12.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 12:27:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com
In-Reply-To: <20251013-automatic-clocks-v1-3-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
 <20251013-automatic-clocks-v1-3-72851ee00300@linaro.org>
Subject: Re: (subset) [PATCH 3/9] arm64: dts: exynos: gs101: add
 sysreg_misc and sysreg_hsi0 nodes
Message-Id: <176107482703.33931.10968219434076858681.b4-ty@linaro.org>
Date: Tue, 21 Oct 2025 21:27:07 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 13 Oct 2025 21:51:32 +0100, Peter Griffin wrote:
> Add syscon DT node for the hsi0 and misc sysreg controllers. These will be
> referenced by their respective CMU nodes in future patchs.
> 
> 

Applied, thanks!

[3/9] arm64: dts: exynos: gs101: add sysreg_misc and sysreg_hsi0 nodes
      https://git.kernel.org/krzk/linux/c/08d9d0d9ae6f9f83bc1802a3f8ab2a4801ccd3e6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

