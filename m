Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A4E3803CD
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 10:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301975; cv=none; b=bLxx8LfFc3kpFwGRYITHxxo11fbDRMk9OfGBlm/JqHSlEmMCOaR6tSXanxNJPw95aDGVG5fDhac4UqaqCC664Nc6WkbJovKRmzwiLaH7dNfQFDDpyQtm1jOoSQZFSEkv9vTMOt9PY9WXgx1NIIM+WoyMxBIpn0PVDIFoFPb3tgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301975; c=relaxed/simple;
	bh=S+ZAPlt7l7qSiwZZJgJDTP5SkN/10VGq32rITKiKJcw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C6a7ytIkAIRhcwtWAE/52UhoVKqi93YEXyD/am2EcVxzP7UR35xPzHzBjg7VEiMRai7LZWthLg5uxHvRTm1Zhse0k/laLszA9xf4rFf31GBSSNVwLgVcqI/+OvyUTbwTUyXCckMODTv4y2xXYDXDNkKgz2+jjaZYrLngLcFuvQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dyuvW0NN; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dyuvW0NN"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43284ed32a0so3761776f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 02:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768301971; x=1768906771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBpbiT1UH/OA8X+hOXxnnO4w4MCR9v/fz6fRCvgTXsI=;
        b=dyuvW0NNlWeseETbH3z61x6fBubB8IxrWNvNSTFgSgZLhBhmMGFraO5/dOo+weJhWM
         YKmRu6n2dVxm0NEHoEw23eFp3snyClE3gbUANCTZWNw2N6FySq8oDvzpevGUtwBq9YXl
         EDe8wi5fPEkkXofwNkS8GwWmFGxlD7zskWTjKR+BXcQhgnuF08/5iITWBlM64ig/2p5V
         X69ryR2VvAnUZkwpqG8GT0o/fLTGgMByQ94PFwqqV9q+JwzofpYGOE99rHro9OGGWu2v
         tFA99Y/Qa3wSHi2iOf3/YVZGjYibMo4Xgad2zsEdVzyMKA+IdNctsQ28FnG1uP7BZqYx
         jXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301971; x=1768906771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eBpbiT1UH/OA8X+hOXxnnO4w4MCR9v/fz6fRCvgTXsI=;
        b=q/dMKqxzdgfsJsfjRgh+s1jjHCfjp78hTx24roYzC3eTS67QuXpFRLWPFYLO195u5D
         9j8g6JhXCeVYEQDvbEyxJeioId5ekSwsV5GqyWElGjh41PrHjLo8/D/Hd53YX0BCLF4v
         seHx2fr3M/BlPyRXjSWUUERBL8c5SCrJeXh6226nx9X/Aoi6rdSk8T8yq4H3JJ+SWtLJ
         5Iy9w59uI0AhY+9ddD+0vnv1o4TQmbOgZN7VKb98Weamc8qY3VAXa3R7bZWFeiWjSTrQ
         2GYHWc3Gf+b+5ZUOGAv8Iza1zYNiqvQj3xG8NedeO0yxBt/M/Ux80DIqV6EBUmTugOMw
         YQPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9qAm+6XBX0knM2JD/peHy8rNEFBkKAuQmBLwSjalpCkcyMlDpMLzKpSDV+C0rL/FKTrcAO/wpiR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPTYA7e5eAjRVpPTBZbdXS4aHBegMtgH30TzDRIrJ/xcmMfCgY
	wAYtIgTvpWwaRPJc8ni8DpXvLoPA80MZayHLzAixI1xqUMaVm+dGwXoSMV1iY8EMXLU=
X-Gm-Gg: AY/fxX7uFGcERs1buoqpYyCbMKcuQ01hjqqY4JVuQokBD/yZeVCli4BZ90UcRDvNSWI
	qYEIFDmSHq2dZdxVeC+fvBBKEygXDWgejOiVjfDSvKXGcFfZeEuBBPBZfNtf8+MhJLPJy8TADo6
	tAbdtkRwsxUHhBADjMhcbQlcDorkQx0JXyS8cRK6b/6S4pKLOEOzT4A30z1jWElec8Runhm9C/A
	+Qza5/KtkyqFzm5okb4qaUO4criWNJCnS1LObTbq7RTkIz3Fy5t5QF0gni9cT/fzW0e4F6P54Ru
	tR4lqciGcDT2fU0twlF5X1BufdfI3pTnt3Q7wd1u1SW0X6svaz/HaVZeMwrvCMk/aBNkWE20OXZ
	az8/c6tGYUkI7ng04DiNwxtC4W3yg1Emx8kq2K4v8L3xAGhnlWtTh7aiR5BhzsSMPwj3zSN5iK2
	vWVJnOIXuRpMpCMI8MaVh0x731X1piPa73gRch6ywOaAE=
X-Google-Smtp-Source: AGHT+IHSgDVUH9/dhiZYJxnIUorYOCelZMoqtmXYQkautt0XBMKPQj25UwiE3+iF4Z6lVVM+z/bN1g==
X-Received: by 2002:a05:6000:400c:b0:430:f6bc:2f82 with SMTP id ffacd0b85a97d-432c374f180mr24842546f8f.30.1768301970623;
        Tue, 13 Jan 2026 02:59:30 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3122:c601:3454:384:9eef:8e29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm43729881f8f.31.2026.01.13.02.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:59:29 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 13 Jan 2026 10:58:58 +0000
Subject: [PATCH v3 1/5] dt-bindings: clock: google,gs101-clock: fix
 alphanumeric ordering
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260113-dpu-clocks-v3-1-cb85424f2c72@linaro.org>
References: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
In-Reply-To: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=S+ZAPlt7l7qSiwZZJgJDTP5SkN/10VGq32rITKiKJcw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpZiWNAam9qhTSzrSHSokiaMfkdqj20X6eKe1Mi
 PmqAX1HWVWJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaWYljQAKCRDO6LjWAjRy
 ujKLD/9z6NjG0NY1i7Yp0KdIYiIkkBLtIA97IGmloAyQ4SVzpinID21BoZZuLQ/fD+mvCkoyKM+
 idFWAL/vbyBcU3uJYVAWte8JmCtfCgwACJjnbU9alawn/BQ6BGBzSfSdcbYJe+yX8XD0cse9xIN
 UzWwVp8QS8hz1Hdl2H+9fRGNKklKeSfcEdd/osHQ3mN1pKfjnw16nVfRg+Z3lvFAY/ntDBihQIs
 RAcavLvBSz82pZ/VZ0cjOZ5hitRoJPldq8fKtjnk3v1hIJhIQ1rV1D7g7VqV6yz7O2Nekq/gqkq
 iJorEXEuSvsoVWZxFXjN7EKToBEkH5mrVG3q0k7PgKvQhqJMGlxB9FWR689muzvRyHXUXlnqj0a
 Cljrw2z7YGY35zpsEDjCeEdlJPFr1nV+Qv7Wnrm0PuWkeppIrJ2JinPeeJ4KPLMJZYacyyPwZQT
 Wy8FbArW4d9ZIYa0xM0XT55UhIj+5x+M3wKCM3nmRzRQrx8b50EVwsffJx1cfXKuyOcGFKGEf/y
 jIajZcNgfdS3uOveMknn02Mnnj2EoUFpmQOF7+2sxg5jr/9xPuLzkFtgiMAg0YZrx1qlluXaKR8
 glzbQP4MvEhATjxQ/BWi3uIF0XGl8nFIiwe2Y6wtuWPVlYIC86AxS0ITG6eTQ37Z3AnP8Gk6GX1
 8RlhcnHtRlwA3Mw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Ensure children of cmu_top have alphanumeric ordering. Top is special as it
feeds all the other children CMUs. This ordering then matches the
clk-gs101.c file.

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v3:
 - keep 'top' first and alphanumeric for cmu_top children (André)
---
 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index 09e679c1a9def03d53b8b493929911ea902a1763..c41043c7d25200fe947a2ca5b2780e4dd50ad433 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -29,9 +29,9 @@ properties:
     enum:
       - google,gs101-cmu-top
       - google,gs101-cmu-apm
-      - google,gs101-cmu-misc
       - google,gs101-cmu-hsi0
       - google,gs101-cmu-hsi2
+      - google,gs101-cmu-misc
       - google,gs101-cmu-peric0
       - google,gs101-cmu-peric1
 

-- 
2.52.0.457.g6b5491de43-goog

