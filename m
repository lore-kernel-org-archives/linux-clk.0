Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90735351FDD
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 19:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761074835; cv=none; b=sg9uHl0CT4lGVTtU/ks+3iTx6Ki7rcA5oINROIHIqUXi5mFqIBafPoN2q+0XplwZCDXswjvHKdxsvZs4VDR67GmvmHLA3gnUpOO2cxaWpxKnVwcRBYsT0CbYh6jBlZ1VthmEfO9zIhjKjA+ifTmszN3GnuoDD5421u6Tx00XGB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761074835; c=relaxed/simple;
	bh=sCX36mBUUD7UPbPD7/zGy00Jms3sN0alcNuZJLzWb5o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TPWQ8QxxjTiahLLj6WPMRPhuQpqAmFCKXQBqvzhpTTtUrNMoV+TWgNpYwmid64nwamoYenuk0ykEaA5F5N1dfcVzjFMHVldiduIjf2U6ZAoDUfo4k+z/aXMS5QHK2u2RjUq6K4yMyFmmNHWob/9BCpI65DaDdeHObPtImvfM59o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hIdZdCSZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hIdZdCSZ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-470ff9b5820so9662445e9.3
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 12:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761074832; x=1761679632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2AwA2f/f6W+wFYqRdKOL2857kAZtGdLXYTnjc91Eh8=;
        b=hIdZdCSZodnhQJVNtzb8i5NWpR1bSKkvGlmAngh/xj09Pa8YvTs5FYf69of06kTgg1
         Ul1tb6keo2pwz/SMat5cztvuH3bn4q3jss1qg04pgXAkBwHsFmAATyCoIeo/LT0Pflic
         hHi1RIt1fvhzVTSNcW/EZRjOvO63yFNMd2q1aVV0ZjKMxTGTtDJpFJZ17jNZQdKBdWbY
         GdSzvj/vavI9j8jcMu7G5EdMHtaa51hEOyPNZ+gvMV0W9XorX0RZRWBhmN5/lNnppL/U
         S1NVvG0h4mvp4WE2GNdT2f5aDsCGgJSBF7Bgl3CvrtUsu1V3m/Q761fFv0RXOwvVnj0W
         av2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761074832; x=1761679632;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2AwA2f/f6W+wFYqRdKOL2857kAZtGdLXYTnjc91Eh8=;
        b=oqacs/OSkVasQ4tw4XXEZWu32jKc8/oKjMKfYfvzZiqGCPW6FzVxynFrU/errcJ8lA
         lkJUXBOawzURoosa66/3tGbGfzDjbpO/A7W+woNq4K4elv+5++NL+4Kn1Zpr07dIgNQV
         Rzk/4UjhJv2QQPenDYwYTVjaetYag8kV/O4cNfyzgqsL5pmN8bayiVMwHXadH85LTU+s
         fMte+7uqzUQniurITAfpR7PJQWgPL1CpjA5us1V7dFanG0m14Sx8uS3qmOMjduyYiGQY
         kI01AeBu66ZHSwOoQy7fRiC7gHAEqNmtUi9tfvWiDwkvMsiMO5XoAo8Cs2rBZpc9po1W
         n4qg==
X-Forwarded-Encrypted: i=1; AJvYcCViqXALUQXUD76bZPRbn/fRdDiC3H0hAaWeDzT2zmxDpOmsSU/CRuADTjR2/JXNb1ImhiIsfZtih28=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbryvksJGzWUUzfrH8PfCFTot4b9rz83cwwAukUehfhDyQkkbU
	cC96GbV3a852Q+AV5rylPiHjl1nMgabmbhCPZHlXE2mO2FxTMPwhCP5U9CpPe/goWSA=
X-Gm-Gg: ASbGncsKEh7tH2C5N54QcAGceqTKrV9D1gxlW+iv1l8+8SvYEpQoJRZQh8v2ZLwvZxV
	t6kD6/GOEsDGxrB8ErxW+Hi1l8BwgbjoSIp6gYKvyA1MHdCbShWyruWdBHAX95ceUyoosR+0Vr7
	l2ps5TvsoIu5GBbwaqsKasfTwCUWDGa0OXi8T5PgEJgAcaHz7O2igxEbk3OUh7rXUfpGtIyUgvW
	siQQjC7bJ2zJCv1QEaT7pLpbGd2hUUTpGFiS7hkAd3vQUQMUO24y3C1UinuUv2JrlQCan6mF5Wc
	Ag/LY0FquGhaLlWKAFwciOhq/N2OlmN3ddRNC/FbPu/t1Juq9wFRFJxk/7/jI+q77RfHTCXEEwN
	C2rpA5seRtJctINfvRDDsCC/MsCWl2RVX2dgPGDzfcSndkFdO43rWrvCCnOpUeVD24jlm50RfRV
	//NkgQzdAn6rQOil+/
X-Google-Smtp-Source: AGHT+IEAsN4GLGZOi/gLAJB0fdHh2RkmlNERThaNChpJGeL/SOfJubwUVSTNSVXsVki9aW7gKT0ayw==
X-Received: by 2002:a05:600c:3b04:b0:471:12be:744 with SMTP id 5b1f17b1804b1-47117932dd5mr72625585e9.8.1761074831798;
        Tue, 21 Oct 2025 12:27:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c42b48c9sm7839115e9.15.2025.10.21.12.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 12:27:11 -0700 (PDT)
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
In-Reply-To: <20251013-automatic-clocks-v1-5-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
 <20251013-automatic-clocks-v1-5-72851ee00300@linaro.org>
Subject: Re: (subset) [PATCH 5/9] arm64: dts: exynos: gs101: fix sysreg_apm
 reg property
Message-Id: <176107483030.33931.17680247324177119299.b4-ty@linaro.org>
Date: Tue, 21 Oct 2025 21:27:10 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 13 Oct 2025 21:51:34 +0100, Peter Griffin wrote:
> Both the start address and size are incorrect for the apm_sysreg DT
> node. Update to match the TRM (rather than how it was defined downstream).
> 
> 

Applied, thanks!

[5/9] arm64: dts: exynos: gs101: fix sysreg_apm reg property
      https://git.kernel.org/krzk/linux/c/4348c22a4f15dbef1314f1a353d7f053b24e9ace

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

