Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731C421D5B0
	for <linux-clk@vger.kernel.org>; Sun,  7 Sep 2025 09:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757236448; cv=none; b=t/XJkHOsVk7qKPktyT0M4kczu8EXuE3MEdPk7qpjPPyW3mzUmsjg1udnwrNnQKpp/b2UUkiSizu9iDCahNlzPsdYVZSiDj9o76rM53qEbwWsOtWE9dkPzhwr0n2Og6zqXnGMcefW1B1d/i0v+UMenqcEPQpxKo1I+k5DSXHL6cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757236448; c=relaxed/simple;
	bh=sU7+/OKR3H0AJm7QtOcIJdDLNqhe68RVRMMpjau/P+4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pn2VpoE3FqQVFRyUiOFbYuG6Fm3SkLZOQBeNnzDX0Qu78cYb09DIiITDwMS16lqwxVP0WcoKxsyvJvkIbRwNAP4HLkK1x8pqI+fAf+8jvEeXjmR7aeRm8YqDHF9u91iGW+AiBCkqwGg3sGSic8y014wO7hbLRnvj1zqAkHX5Jho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DDTv/Lne; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DDTv/Lne"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45b9bc2df29so4991095e9.0
        for <linux-clk@vger.kernel.org>; Sun, 07 Sep 2025 02:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757236445; x=1757841245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h09TDfJ0VCIYwMjqv+nUCRRx8qKcN59ZJYX5ff84mD8=;
        b=DDTv/LnerbbkADMhaf0ViJTmnp0va3tlnP3KfUkxQW08vIRYDEbbg90JTkoeWBxHx1
         aC8fVjv74oV00AMw+fg0q6La1qcsKlsJ/lnEkccvbJg/kzDDh+2jAlbmjDuQn/08jAnF
         q1TwFkT4VMiBU1zWeCcrcfoykhIytvS0tKB/1m441AwAp7N4NcGuril7uPmZAyODtmj7
         OdMYif0Bo6wEnjSRYnJtyQHkFR2u0PNEq4AAPrvdM0L8m7r8xhnCwKHzwCpwzOBAneq6
         Fo9rlW1LY3wiA67CVBR1ndTbdxlKcjzRdPw3lhUUW1+tHFJkcnQJ6AAkgswaspx1vv6X
         H0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757236445; x=1757841245;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h09TDfJ0VCIYwMjqv+nUCRRx8qKcN59ZJYX5ff84mD8=;
        b=Byct1ZwIbBQnHVvDQbYQUDemFXHWAolGZg2CNY/nT9choqhQ1RNCfm8kX0g/rN4fVZ
         1XqoWs5IXsFIJxIzohZGA+uqIjJLbWhmCak/T347HncV3y4aiJ2m47Hz9vYmZiUZ5PrI
         I+ddFE/c7cZS4v+k01A4upXj5tJOtoqdElmpPUP7JdWmxFxYMJT0y3s9flpVOk6IEOOK
         eBIe5Kw5F/HSplw0fHVQ3VogRKjZDF5IlXJE7u3XyqoWx9v7u6+6JcosRIJBPLKlMVva
         iljZzhO5Qum8CF+IGpt1v6SLnMkMEpmlhTyRhlUZWhzFGm3U1POwZb1TBwnce1pu6PYk
         xceA==
X-Forwarded-Encrypted: i=1; AJvYcCVojgGYecAqojagDDMYQ8LSWoz+cpcWCdpCFDmeBHmJ/iIUunQWHtWCSvfdl84QoiKHpC4wCttIMpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQJEQ6TPcjQyS9N/O4Rh9T2wFL4N7kIN4wHn2pzY0A7CaRJY/6
	c0oEkMHDOWLVllWYXPTBcv8u9pa8RcgwuOuXAAtTzPXKlYopV3Lia7FEVEcl5vU8WgM=
X-Gm-Gg: ASbGncvRLOAkEnSmaNlidj0lcERF/MMCbK4oLd7HN9VS7Dc7fGqHmmyCzrG0GIKsTgA
	Mad++xlnOAIilb49DHcr8RddF6hfdkpjnF6kny3NT04hkrn3P5XG5e7LPBax5ba8mSM3aeXBySX
	gGlBgMj9rTSYqS2cu+c3N3bop8fIoHexmtuNTCuHe3aWxOs/TMq3tYL2/5daOhQRf6VKyhHJDUW
	x2xFPcXY3exuafdFkPLp/72Hingk+D8gtxLZHBTVNX/UniLJ8/pfOiCHPkpHQx4Pb/2Cl90+tir
	WvYAii7a82jYt4noTH71yppIRkoLh/2qGP/qQe+a5HOtKB+jehGkW4wUCkBEqEgkx4vDDTHCnQK
	//pbMMVZVIDALarSzSICbjMQF/Non0E06XcKxoDM=
X-Google-Smtp-Source: AGHT+IEs+zHj+nZWtDLKO7AMy5vUsh2MOF4u8kwkXxf2nwQ+E1nf9C+MVn+vLhdElVbV4Wh2U+33Gw==
X-Received: by 2002:a05:6000:4107:b0:3e6:e931:b428 with SMTP id ffacd0b85a97d-3e6e931f97dmr1115038f8f.10.1757236444776;
        Sun, 07 Sep 2025 02:14:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e21e4c0e6fsm10918962f8f.17.2025.09.07.02.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 02:14:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
In-Reply-To: <20250904-perics-usi-v3-1-3ea109705cb6@gmail.com>
References: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
 <20250904-perics-usi-v3-1-3ea109705cb6@gmail.com>
Subject: Re: (subset) [PATCH v3 1/4] dt-bindings: clock: exynos990: Add
 PERIC0 and PERIC1 clock units
Message-Id: <175723644300.30719.16385900171586342437.b4-ty@linaro.org>
Date: Sun, 07 Sep 2025 11:14:03 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 04 Sep 2025 14:07:11 +0000, Denzeel Oliva wrote:
> Add clock management unit bindings for PERIC0 and PERIC1 blocks
> which provide clocks for USI, I2C and UART peripherals.
> 
> 

Applied, thanks!

[1/4] dt-bindings: clock: exynos990: Add PERIC0 and PERIC1 clock units
      https://git.kernel.org/krzk/linux/c/43bd82eb33b2ac33232724a8ddb9e07cde492328

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

