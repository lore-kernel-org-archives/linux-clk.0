Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E03361DCB
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 09:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021684; cv=none; b=L1rHhZwd8Rpl/CQLVeC2k0s2ezIMe0Co9fv6Ou8G/FxInZF7BqjDjmWpTDEjJrQHMNokhyOuY44ZijdU2vfnPVrU1zygAPY0qZakQu3ZZyOt43Alc8p4StrqxP2MgM6ITnLPZCAvjRt8n34jBOV7KZVSKCPPomIZXnry9wPfUVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021684; c=relaxed/simple;
	bh=mfL3zMqIzWVzm4FHhB2pqXPEVF4fw5d3cYOMIdlK9nI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c8arfy4po8RcVi2gN7uSKzGYQEr/28lLArvPlvEIsac11YlGMMysXuSCh+lQZWDX2yYU/9sSfJ1/eefu0v1fciDE34AtAIn4L4PVCljA2/1XivvNnWpAEPwLz5cR4vQbN83AwsUlOy1TvYQRqNkplLggR15YAA/i0arO1N58Jjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jbp35p3A; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jbp35p3A"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488d2079582so88495135e9.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 02:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777021681; x=1777626481; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sO/i9Gb8rKY9PHJ5AFHwqyiQ8HD7GPgRZTwMGfL3wOE=;
        b=Jbp35p3A7dljX8K8LmzSibIRmc8kW+NKClTGm9B/1nG1BCIdsJRspFWU2qcNPSlfap
         1JFurRfRZGYI9MOFXX7a3OJcN2YTdW21pJXcmZckALSobzCTqAFTSzxXt9kOz9Qkokwj
         bf3QAs241uu36I9ATRcSb2yEAZr9YPOPZEEnTORbqKgdtFmljdefewcOoIhnE3oR2FjP
         FxHrYs/cxkDW8oe9dls85Qb1U0RIYmbKkd4/N/glHHJUxcYfYiNk3cMeYOa83jUvQBzf
         Uugvft8smAE26iJdfq/KnM+X+/28JTlP6ZN/LehD62onUFEhprjsQJ1qrUtA2M+qerSJ
         sO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021681; x=1777626481;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sO/i9Gb8rKY9PHJ5AFHwqyiQ8HD7GPgRZTwMGfL3wOE=;
        b=ecuThWQQXBstqBMXfw0LMKRhD821FJJnUk/v53Q7/JfkuOYM/GIkwvz0F+TSXnAXYJ
         gywkIry9GuKAa4UQdT58HaigTnXpAyavlCgsgFUpG/1p5SPNVyYRy4Pb8Xtbh1/S0RvP
         WVWbMVePTOvli6JeYeOcgIwNX1K34tcRZNa14jkoe7WXnBjQv+yxNSP6L/PAumKJCSuH
         Py//Hr6v90bQ3KaTKP4VnXhUqspeQIEmfPYb1kADDs4NVyDrf7aG1HxAqFLj9yxnhNRo
         PZ8+XeLAEl8/L1cze79SVwqQinMKnLHAbdDSa3ENHwJcFtNADS/GYzp0Julx7yPDZJrZ
         khQQ==
X-Forwarded-Encrypted: i=1; AFNElJ9uhaiEN8Si2HRzLx1vbEIiJVFsC+i7HUEnWwypEQf6+7l4JnP77d+BQ0yG8xu7iJrpVcr+0+PT5n4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzOHGL0TiI5v+2kKX2Rgdx/SoifeBmuBfymjc3oSdWZjs6l8j9
	fycW6/CHFNIrpicNo61PAwmCjinh1Mdkx4DYsedGHvT4zgBZOLUhiBCLLU2+mSgpPPtFGb54J6t
	haHrXOdo=
X-Gm-Gg: AeBDietX7vfMtC7H4KjrbwMe1IAkJCykWhNmOIr4WDUL8Nj/rf1TwIwABpkOCcUJjrz
	9uI2e7mkAC5zKwjfNGRR1jGfv2KAmhjRyfjssacjfZoHmbDkZK++Oq/YYHXSME+o7bfdg89ZvYW
	LnSI6fL3zJrvogDhSW6xgvfv9Zh1IV2kSrrcompxxtq0/0t8V9xm5J2rdVJPEsaHKPgpXZTanxQ
	T/jObHLLCHjNGtW8Im6tuDS3Z0D+Y8BxkJMkL+ijiX8LF8pgeIjDl8pUOKDGHfy1je1kvkBt1vf
	fdInlS75r1iuoYF1zaBgJdo8jB62xfxMxHK0QCMmFM4CURQa0FPiErgTUN6fXadLukOH1LHrWgM
	lyaK1reFZbqsbYPjLa7PgKwLMTFSSyrBRvYjz1HXW7dyV446j6jqb624yk+NXae6cvr+RLJlzPT
	iN26RAwPy8d1klUXrAW4Y4yFDS0Zgi3IZGF+Jk+cxsgieJ4xuuY6O/SVw=
X-Received: by 2002:a05:600c:3515:b0:488:8b99:54a1 with SMTP id 5b1f17b1804b1-488fb78e7c5mr423957895e9.28.1777021680970;
        Fri, 24 Apr 2026 02:08:00 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c0354sm537222545e9.11.2026.04.24.02.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:08:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/6] arm64: dts: qcom: sm8[456]50: Add missing CX power
 domain to GCC
Date: Fri, 24 Apr 2026 11:07:54 +0200
Message-Id: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOoy62kC/yXMTQqDMBBA4avIrDsQg3/0KtJFMo52ClXJRAmId
 ze2y+8t3gHKQVjhWRwQeBeVZc4oHwXQ280TowzZYI1tTGUrjMsqhPrtUm0wCuNElCNSQm7rxo2
 utd53kAdr4FHSb96//tbNf5jifYTzvABKMkUpfgAAAA==
X-Change-ID: 20260424-topic-sm8x50-tie-gcc-to-cx-e756afa72bb8
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=mfL3zMqIzWVzm4FHhB2pqXPEVF4fw5d3cYOMIdlK9nI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp6zLt1qg2AIuqspYpg045muyTSFJw3AdOHIyrnQGq
 n+WVwZmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaesy7QAKCRB33NvayMhJ0Q3vD/
 4iJ8xefum6O9bAeFfJ1s0jhT128NFRnBTdSU1TBSmtjVOjxLrXNaDdg0ye7QHZcTgPiRFkT4UlwrdD
 Tkn89sarjjZNHz5A8dsNc40qwWVSa2O2TVtAZERZeJkRnkCC6u+h6gUyiQRGRq+4GTuYB4OpBeclwf
 1QHVIO9+MH2fQYOyKQW7LhjstQ1YHQYLqhjZoIdVTDmNtAmHkZBwf7BoKm9lWV6N/CD3LBntCMo6iN
 04kqMAL5yA5NiDp4mCKDyOsbgiRkRVAtJCBizFDm3LRCcrsq3ZNgl8avz8QtQ8RYlWzjUdLBZzBzWx
 BJJ0x+dNmF5GzVaZ1mGQEyVEy6/CrwSH8bFl2epj2VRAxYc2SYvtTzCXjfaMNGnu8na8m/w7jjNWzZ
 qMG/q0EQVPPtc4ZVk9csNqsggtkiUbDAIMaHTQWDkTPo2LAh5C2O0Vbc8IDTVVvHexGQtr0l7b8ydF
 cDMOQD7vACssj6vUhOfmWrTvWncYc9CSrjojtHvIsqPFC6rLMyiHEJ3wkEy+Cx8XZ8LSLHJIAZYX2B
 qT9QejsAHcclKZRapzb0U8L6/SbLJbIXX0WFlDFkPBQXeV3EdG2K3rwFr0BDmJ3FvX9sp0sucyfZun
 P1MN5ZYz3hj+3lPEkL9pkq3xUxcXMaRPhv9/0HPVwjXtA9ptqKSGiw1a+NJw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Recently, on Eliza & Milos, the CX has been tied up to the GCC,
but this is valid for most platforms including sm8[456]50.
So tie the CX power domain to the GCC as well, for the
same exact reasons as on Eliza & Milos.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (6):
      dt-bindings: clock: qcom: gcc-sm8450: Add missing power-domains property
      dt-bindings: clock: qcom: sm8550-gcc: Add missing power-domains property
      dt-bindings: clock: qcom: sm8650-gcc: Add missing power-domains property
      arm64: dts: qcom: sm8450: Add missing CX power domain to GCC
      arm64: dts: qcom: sm8550: Add missing CX power domain to GCC
      arm64: dts: qcom: sm8650: Add missing CX power domain to GCC

 Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml | 5 +++++
 Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml | 5 +++++
 Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml | 5 +++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi                         | 2 ++
 6 files changed, 19 insertions(+)
---
base-commit: 4c406406070d57dbefeaad149181785330c23f92
change-id: 20260424-topic-sm8x50-tie-gcc-to-cx-e756afa72bb8

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

