Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CED25A2B0
	for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 13:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018085; cv=none; b=n56gKWsNccSK59lMbIJTY6qfFvC9TcU7Z+qfpx87wLCft5mfg86xbpuLDSdkL0svS7f5ep69RLiCXQjsX/rxDjdZIv/NTE6h+3W9j/MdLxXdEQD/LaxzYT4Mft7/zW7EnXpuZ2a1gkE34wtaEew7g8AyVYySFLlTFp0xwF5L91Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018085; c=relaxed/simple;
	bh=nfV/7RmHoNigN+etRFO22PUSZ15tfZ13Ey5db/FH8m8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SyxpuNh4/n7VtHyqnuT1vgvrihbqIwQdck1MAczZ66V8a8Dgf9gW3ws/n7Cdob+UEUw06LocoNtdbt9W4OXwj0z95qt4JNH+5q56uF5qAjgWS7/itT593hi3r8ghJFwckbLXs922Ay+mGCjwuBNJCOlpEJZtR9RgZCtZSaxgNj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YgSGZk1g; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YgSGZk1g"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43e9ccaa1ebso8301375e9.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 06:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018081; x=1746622881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hIYbRlauLJ+HBkfmmmxeYe7riwQD6vu+qiBT5eLd3s4=;
        b=YgSGZk1gvlrYvkjEXqUOEwIf4eOICM3AZT+3AZB8T4Wbq4aCfoOcBImDiBeOBerswk
         hJUJ4sd1LkKTJE8AVZfF1iuEISgDtikb7K3cJJbw5ZZovfc0XGs6fuya1cUHXrFPDOM7
         2mcdPJ7d+KgUdfxidub1Vy0XSkoj9p2FMo8x1yE4mABFL0sQYLTr7ZfjSd/eq5iOxeL2
         FvjgQ9FPebaYPuGgsSCbBmGc/5l00MPevNx0fCyBLi3dtAMlq8yQqZySdUB1kj+fLEH1
         501BQgBviTg4O/CSUgQcPZJPfcpDxs/2l4OVGK39g4OrgTL7BVpYb8v9ls2pbV5jw7UQ
         0Paw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018081; x=1746622881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIYbRlauLJ+HBkfmmmxeYe7riwQD6vu+qiBT5eLd3s4=;
        b=hZG4aVRW3nXHeB0jQL774nYl+hVC1vpffcExZS1OysZqh+yCn7pgBQ5BZX9LRpefgq
         ZkhWsb+VHaSkGffMdFw6+3Dz55QMQmI1TLzWV0l7aYDo5HU/0xpPlyO+8f//caC+bLdZ
         PkoNSpJFoH4xvYsjjQyWz+qMft8x4RCTqbfALl9V7HGhsQH4YVmB7P7DG/vgG91RF8ap
         d3mLFQMdr2eAColIYvTHXp2HUrZuHIABNU5yOSW3NzqIZQlLncSFkVdn3AqADv6p9N4L
         vX+C2SIXNR9z3nVvj2fGEc5E/f1VYqzLnvkKsg0NHETVrrM5KfJTXTZ7Cu7gnH2VkzQj
         JSIg==
X-Forwarded-Encrypted: i=1; AJvYcCWpvR7RwsOtQHqKZQY/O+c8MFYeYyTJL6zdOBf6kKV9uVs03wA/k4fEgiJpUffB4V/T5/DwZYRWm1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsyL9zr4YFT9VJzgePRBRqBgq8ywmRQvA9UdccTgM89+KdELGs
	vDaAXH5DLVOsmbsKuBCFPuixs5jkG/eVqaLkqZjBN9NT7RWatMpSYVtw7ia/USQ=
X-Gm-Gg: ASbGncv7u4zR4cDJoLFu1NIDyZHCM/uzDkjLhLxUXdKXfjfpcMCIADWZTOc6l2hv1ap
	b4R5qM1XDqG0NZuVVoBh5gozhwiJ4cQhfVrpxv1AKolPEbD1tz6frjuPUZgtRx7uoGHE8wbWLTm
	bJ7/2auQFkPyEhx0pWiC0GIpU0DZHpLUB2Qp/HtMaACDJEfZ5pZ9qEoI1uvmgmS4dxhx6b9RW2+
	bYComihEuBy3RfvYX50BhLrsFUOlDJvEqG35tW8ypnCfiTLUbjqgHILJ+wvcfnBF5OxkB65D9rH
	ANv2Rek7Kz4MgwyKF3/0vOtpEAo/9xE4S58rFnjt/cLvkm6yMVb/DwBbnPA=
X-Google-Smtp-Source: AGHT+IGy0iGND4CwDZaIUFykzdWsI+BN8WeV0wSy847evjGpU0JOHr+Ib1tzikoVHW3i7zcwk/UBUw==
X-Received: by 2002:a5d:64ee:0:b0:39f:6ca:9250 with SMTP id ffacd0b85a97d-3a09007e507mr674529f8f.12.1746018080066;
        Wed, 30 Apr 2025 06:01:20 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:36 +0200
Subject: [PATCH v5 06/24] clk: qcom: dispcc-sm8750: Fix setting rate byte
 and pixel clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-6-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1649;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nfV/7RmHoNigN+etRFO22PUSZ15tfZ13Ey5db/FH8m8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh75XYczpa1XRjEYY76w1vQNfkUN4i5qCoYTp
 HwwGkhur1iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe+QAKCRDBN2bmhouD
 17sxD/kBPOjHuljMicN8MnivmvbeOMOG6jLOk89d/9dap4GTebCFuxFDorsrNL91hdES4O7aiby
 rT/Qxv6qCxnvvkM0FVnggnSTY5gNWYcxiVD1e1wn0y+3Z03Ng9saCC1GUhyhAKTAYVZf/fjBrnU
 XHanIHAgdXPXvVbxXFipCdZHtywQr+QEpoqdBTADtnFSlTogSRmq6yOG8o15VVm9LjR2zHiS9OF
 x/lWqKJFtvGyW3ZGP8Sf9dN8RUlMD27cTAk+7dJwIlWPOUGLElzppd05ShKS9MYOzpBOWPc16q4
 t6u1+Il04mXUL2US421holVpBfFTXQU+ESXesex90exg6lMsdULKxaEJ+FuV1bFuz929ELzXykz
 y1Ssqlvl6WFuSVrkZuMisxRlELabMiGxrxs2P7Q7tJZdYqr5wxtMOaXIksAyFlleZ4oRcLGooZx
 lSBTijG+fe8L5DJxiASGKKKoxa9OwyKDSnJbU//ucnKKOauzQ6mDw+B5DoAeIHHVYYYkvqqWTL7
 p0hmMDcQYYA5RzuXWjCLUomf+HiTzN6dpdNJ7h4cYiFlCTV8DGosQ1JXRnxNTN+DiWZVIvZyx0E
 Jh0QkVO+1KaEFiJels4h0qJKL7Lyn5k7zLp/t2JJTTlDsDiVOY7cJr52yZUrPlXKwwMhrargwS5
 tbbp/QQ3V8KjjkQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

On SM8750 the setting rate of pixel and byte clocks, while the parent
DSI PHY PLL, fails with:

  disp_cc_mdss_byte0_clk_src: rcg didn't update its configuration.

DSI PHY PLL has to be unprepared and its "PLL Power Down" bits in
CMN_CTRL_0 asserted.

Mark these clocks with CLK_OPS_PARENT_ENABLE to ensure the parent is
enabled during rate changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Patch is independent and can go via separate tree. Including here for
complete picture of clock debugging issues.

Changes in v5:
1. New patch
---
 drivers/clk/qcom/dispcc-sm8750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
index 877b40d50e6ff5501df16edcffb6cf3322c65977..d86f3def6dd06b6f6f7a25018a856dcc86fc48eb 100644
--- a/drivers/clk/qcom/dispcc-sm8750.c
+++ b/drivers/clk/qcom/dispcc-sm8750.c
@@ -393,7 +393,7 @@ static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
 		.name = "disp_cc_mdss_byte0_clk_src",
 		.parent_data = disp_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_byte2_ops,
 	},
 };
@@ -712,7 +712,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
 		.name = "disp_cc_mdss_pclk0_clk_src",
 		.parent_data = disp_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_pixel_ops,
 	},
 };

-- 
2.45.2

