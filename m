Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED1C386567
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 09:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021688; cv=none; b=mAJtNRO5UFqX0TKgfXfBA9J+pRX2sZlDA9bR1KIK9e1IEpdsSChSa8hi76QX5OyMZNonzzHL/NVQe1fXn6cJsgmN1PiPvDiwo1jU3VNJ2Ab6Dr72cKGZEURFUYpuLd12AU1HoWvrU3O0kS7NfyzY3Gek33isQnc65NsKgh/xYoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021688; c=relaxed/simple;
	bh=+12tfzqfW/Tk83MgWfc0iGAjrf/JciQj1xvyj8kbjjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Odu6NUPaa19iden7fHGFwuwwuo6ui+gHEkgEeRXvO4IwwHuJldcGQd41ye9bBAapJUKo3kBCtSv2Fj6VHQ63lXJFKRG7HtZK/hwF90Aq1+7CRWYsEKh30auRrtpGUp4z2trqXIIDf3hwBtf1OafX82KzJqK9qEZSjvG8zJGtT5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qBJ1tjTA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qBJ1tjTA"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so37743165e9.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 02:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777021685; x=1777626485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gnpe7VWv66BG7EMfRroY3FJSHMxHpQ7t0W9fMqyK3xI=;
        b=qBJ1tjTAG9rwsyYrYPFV8+537HMSAI7g2G81cNXlFPS0QpBFciZ53yIpkwMjbC+XOY
         G3SkqYQ4hYpfrgZmqf5B/KGaViZE+Tlo5++0kJP1yk2tjt0v3kKctqDCJYOF3KA8UEgW
         qqjoGd9E6aaH+2WcGt+k+BsY1mVhEQ9JBZZWJx6vP6XOIxBl/8ZqvOfpTiWIhfHapl+h
         z/I6rPV85yEWjuwpCiM/4Peu4L1aqucH2vZuwDAjiRxMCmmx3XFxaAK3GiAvVlk8Zacj
         X0K9w2I5XSuBj7+BKoeuVgH3qqemtEO/BT5nbQh/vomwvYR85F6+OouqSTDLZUJA0kMA
         Mf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021685; x=1777626485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gnpe7VWv66BG7EMfRroY3FJSHMxHpQ7t0W9fMqyK3xI=;
        b=SaFf2bvBvtd4GL7cDIn1MwQuG8WsHqcXRDzbss39z+1N6qvZFbNyALs3oWSYdF7R8w
         IckjvM50VzJ8/RgjHx9cdYjfsUKVf/VtJ3nWJ/eX318ojsRXeqwxs/9vul7+b2lTHAZX
         sTyEYOfaQseuRJddSVBbyz5/X846oUdbBnGWXIuCiEYeHwi6iiSAcqM5+eIh3fGeCo9V
         PoqzJ78X5pKt3Bz0RdDAzDyrLqN5I/OO6HbiSJ9OdCkf35oJoDofVvaEWwwDhNEPFoiK
         6VQKR1TgWb8JAQLdJXr5FLA5Ff/Ot3n7EGD9XGsvNehSNGNQkspPqGjXvQ/ll30xe9ro
         So7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+jzeII3C5Wj5Q0/Qs0iftUwjpaPiE+RxKFJTnB4EpSgh+7lcXVnpVfMMOb2ody6/Gp9mGRte4FAAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ6krwCooyXX7J2NqpMN77KQV6L9SwlnPnZUA2fnzOjwkn8+Jk
	1tTL9mU4zV+Pbx5s2pT/iX8Vj8w7RvBZmZkKQL720OekkOH/+eGIxyv7sb1hcERBdKNaioNlxXb
	mInMKoDw=
X-Gm-Gg: AeBDievBV0hYd8iFqkheSfcYQm8K1uC+8xwjSP1r1DgbiHGyYpU3KryTI4FSHgvR4lf
	6OTjuoa8vvnAzzB1bzDulg6CSeTjet3JFPrNEqHep2mP9asV/nPrHjm/u4+s4gJpAaGZuN1vtZX
	OAqS24543GdrxdRqYZE9mVD92QilVspOdbPvLndxBoMKkQGuwQGMuF1532JSdDn9xC8NYMVdkMf
	f+DXkAByAknVYxovK65oXM0rq3cDm2svZ7obZhOnDvglQLknDu9QiSnT1pTEfL3lgt2OFXMOr+k
	wApv0SGDm0bsENhN/DetlWSN9STv7lADInTEhNhe/pDWgwVy4n0vofX40CaehWk3mgqXvpRhn/j
	cr/xis1PJavoHTSfqCeiKK9BJdRZDhdsvrZGG7v4jFXaglwiXlEFHiLalIUJlVyuoUzoLsV/uvx
	zfiSViJgkBfbWAcX+6Wnl3FdvwwsoWAw/VcAcOxuEwtLSwBqGSK1XaTTg=
X-Received: by 2002:a05:600c:c112:b0:486:fe83:861c with SMTP id 5b1f17b1804b1-488fb896910mr353911685e9.7.1777021684083;
        Fri, 24 Apr 2026 02:08:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c0354sm537222545e9.11.2026.04.24.02.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:08:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Apr 2026 11:07:57 +0200
Subject: [PATCH 3/6] dt-bindings: clock: qcom: sm8650-gcc: Add missing
 power-domains property
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-3-4b6e09d532ce@linaro.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=+12tfzqfW/Tk83MgWfc0iGAjrf/JciQj1xvyj8kbjjk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp6zLuLZkMPJDr268l+m921m3jF91DlclPnR+Of8tZ
 4B0me9yJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaesy7gAKCRB33NvayMhJ0W1gEA
 CKwLPQQou8T+FSdimuDZHKVX8qOjgIgOFrWhQ1uuRhlAQMe0DVhTTKHMKJI4WV4b27Vv4a8XhYyopa
 djFOIUSDd79QCEhddBghp3kvWTNNAAv+aflwRWPx1sPpzmkDAcrU0n2t6f57GnJqq00Ytf14FLTDJw
 Tyg/6cX7qTbjVE6f2tV6+8HDhwDjicgwxOhTYfCFUvTM3dLDVeYTWW6qSHeDeweg3UPp/9luIjozd9
 mjJXT6uF1etp2ZBcu8L+eYOwFz5Ux6stvm65Thr4nFjAtwB5MitkH6uKBkLbngvJJ1F8ZvaoiETjOe
 DB0JsFN9+5XqKeacUVSl38Ajh7yiES2IPEeEC6u6gNG9wCNC+jrU7oUPx/jUwzI5uRNyLAuAJcQgm+
 sRpYsQd6lXWSxIFUGxcW+tECxDqhnEAScpRtky2GVB02pcdiOp/c3yBiA9aitBJHOphDTNuB2Lt+Gb
 fEq8kjBOBavIhkkeG9ANvuFHKy5OEtEBZAq5y4dAGd2onCWcwK6D7/SXDOqhQ/OAiU95kc1AwP7Wsl
 FXWggrQ9ufoOvqU/mceGPOqStMYMstuURvlK7Wy8EwlYGG6gBRjPAlNqutkl2/2lKTtnA8CVObDn1a
 XtLo7/B35/hopY76it3j06vvu2JA0BX2p8u5zy57cWwdUeDASfI0oKZK132g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order for the GCC votes on the GDSCs it provides to be propagated
to CX, CX needs to be declared as power domain of the GCC.

Document the missing power-domains property to that purpose.

Fixes: b69d932154dc ("dt-bindings: clock: qcom: document the SM8650 General Clock Controller")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
index c7143e2abc80..43b06e0abd1d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
@@ -32,9 +32,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:

-- 
2.34.1

