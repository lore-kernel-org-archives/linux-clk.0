Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DF741232
	for <linux-clk@vger.kernel.org>; Mon, 22 Jan 2024 11:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705922119; cv=none; b=IkCUVXoXVYPcYNOeQMVK8NKiYWWW+oDxpYFS+OR6L6XvD3j+q7xW6Qr1+ytFi9mzYk3xfmFlCt++JOkqtltPQsA5JEnPpClQhuieHVoER/LkzaGh3tZr5v6e3jjEtrQBR5nl73Uclkid+67wAWSFJ8LdxacmI1ItbhXmvZAgJSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705922119; c=relaxed/simple;
	bh=sBhXk0iAvmnXKdKuq3EM3icTN0+ZEsMN1H17Lp5WitQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=auEZ+gLhG8yR5s1W+p5FUgHdz4FV2dNzq7Hp/p5+fyEL4T7CbtzmhChphUbIpsZ9zguxkoDP5UvM7+nbQVphF89bjFqvUOdISfQQ813BNqzXq/UEQzRYCBfP7hV85FWTC6X7pW6R+LG9+Pjk+Wup8UuH3cDnLZc4/W2iztgWaiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UZhLTcjv; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UZhLTcjv"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55a9008c185so2757698a12.1
        for <linux-clk@vger.kernel.org>; Mon, 22 Jan 2024 03:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705922115; x=1706526915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYvtByBMmibUCUZcFilpUEWd0hC7XPo/IrPVWnAuEF8=;
        b=UZhLTcjvE0ZAg/jfoS95HWO04R80AF2ndbV/z4y9WRbDLkD7Gl7YXWzPcjqWX+ETP6
         OscKhDb3C4BI5RyYtsZeupENOm91YG6rGp6KJNRdPUDRNapn6lXP9echW9P+TrI5JIix
         +CkzSdLHHm5Q4xnzIzX1bMB0qz0afSGVWr/GKCqS5DNKKnNMJ8qgaCL/+yU84j6V7Jj4
         CDucigVg3JTmy+w/JUJz9YGRcbAd0Yba0guEumTsVsL78Ptb+IADQys/J8Zc+wYKm6eZ
         JVJUQ+VIaTs5cRavYcXHYSaYo7BV1VS9DCaJNroaWvA+ARszYDhzlnmbFX8vubSzsh5f
         xU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705922115; x=1706526915;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYvtByBMmibUCUZcFilpUEWd0hC7XPo/IrPVWnAuEF8=;
        b=Geqd5iXRYrnzq15xOvYfQba4xu9IZlb5I3AtiQ6GoM4RTGf2B7Pc+3Ox9vaGgwMGIM
         XNq9cOo0QDsSTSvTFfo+eWxudWHiRLVqQSnvvHx5FxTaEijhOT/GovPBsT8HxlfNy84i
         czPJp31odCzYn/Ln+hjHU4umScN+EXk24cQI3mLiVP+H+LMdQbUX0arpXOgwP7oc3xCP
         0PqXDRMVxIJOhn4QEiCGyY4i5Beu6KPLWgob3wpjFweTxWVStjrHqGJ66KwDDlYeOBNT
         RY/xvuUdvrKwfXFvJG4tMHvwX3UO/6t8CLQUhQ9b/wxK8xmFV0SmlfpoU1HjD1zmFraZ
         CJvQ==
X-Gm-Message-State: AOJu0YxDtfGInJhQUEx09G0veQ2uXXlS7vt3N4XHgvD+FSuxQalToC3z
	drz/c+cweKsa3YpSvmYfYX5sA9yLqDAqynEPyRHu5yLG/eXUeX2PHKn/DCRLZ0g=
X-Google-Smtp-Source: AGHT+IEZONRRWwPg55Bl6j+qg9gT2tMH2N7hRshFExy3U+WwV/uEC+1jiGK+QgUlbmP5FuFEZwo/rg==
X-Received: by 2002:aa7:d750:0:b0:559:b1b0:4437 with SMTP id a16-20020aa7d750000000b00559b1b04437mr5881853eds.5.1705922115799;
        Mon, 22 Jan 2024 03:15:15 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id h27-20020a056402095b00b0055c643f4f8asm179422edz.32.2024.01.22.03.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:15:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 daniel.lezcano@linaro.org, tglx@linutronix.de, conor+dt@kernel.org, 
 alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
 cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
 semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com
In-Reply-To: <20231222165355.1462740-3-peter.griffin@linaro.org>
References: <20231222165355.1462740-1-peter.griffin@linaro.org>
 <20231222165355.1462740-3-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH 2/3] clk: samsung: gs101: register cmu_misc
 clocks early
Message-Id: <170592211404.45273.11848415644684146235.b4-ty@linaro.org>
Date: Mon, 22 Jan 2024 12:15:14 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Fri, 22 Dec 2023 16:53:54 +0000, Peter Griffin wrote:
> Update cmu_misc so it is registered early, as it contains
> the gate which clocks the Multi Core Timer (MCT). This clock
> is required early in boot, otherwise exynos_mct will fail
> obtaining the clock.
> 
> Note this wasn't previously an issue as exynos_mct wasn't
> enabled.
> 
> [...]

Applied, thanks!

[2/3] clk: samsung: gs101: register cmu_misc clocks early
      https://git.kernel.org/krzk/linux/c/163cd42fc49081964e0fc6f0b1e94b6b50eb85f5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

