Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8DC1DE3AB
	for <linux-clk@vger.kernel.org>; Mon,  6 Jan 2025 13:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736171084; cv=none; b=YT98HmPY3mNPUbDJNss/zh0NA0Cl4YANKXq/mPCwzQJ3NOczaUGIj4C7DI2XrUSIoQxQsIF1STb3/ahkLdXxjm/2NKUmiS1GW1ivnlQ01FAAeHAEWGAEYX8ghj/9vAU96OLmaYkXYvsq5QCCwQQzj/I2Nv1i53Do3ZFLpXV36m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736171084; c=relaxed/simple;
	bh=IzLjyqiZQYj0HolvNDwEGq9bzWMpH1csfdZOubbN4CY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SYwByEyD/fpY8yWzAtxvW1pAFRYjHURwN/knAWjcJmMmdEq8DmV7TSD3vc+GEgRkcqkPARL4zMR38IqomrQQomaWz5BAHzOild7iF9yR/gCY9zaWihiCKKYkq3VVdfwNtRjN+473/XUytM7Lkwb94Vk/LVS97oV2UDtbciSnryY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nLEsiTv0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nLEsiTv0"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361f09be37so22444395e9.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jan 2025 05:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736171081; x=1736775881; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EMnwIoklKmOQ9k3BBN3w1reDAPPc+Np1bkPck8HODv8=;
        b=nLEsiTv0iLxLdXZwuRW/PRC2sIJ0D8DCgYgsAMD+C8bRVf94qhP9Z8iMduflxdGO5r
         fP+jJYSmkhNgexV5pR4yQcYsYPdNmTcv9O8HIuRCmOzyp5LtBFunUR3ii+7Stusgzbi0
         YMfluSbz1wYKtOh+GW/jbw/O11ZJwD4/oxtkya9jIQe+83YCkTCJNxdnifzoIXQAZVLd
         S2XiDAvD0o7R+GbosTbNhNx3CG6TLQ9txIfI5AgYr0O7fQmwP9dVWa2/3ulmaE2oMGrq
         GAwhk25nQjnfpThPV+8I8IhplYALs+G1hC3qrg46uam0f7y4C4CVJOVhtViHtXjRsSTC
         gIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736171081; x=1736775881;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EMnwIoklKmOQ9k3BBN3w1reDAPPc+Np1bkPck8HODv8=;
        b=K5p3vSMe3/DAhWL0Cye9qLepmrLVfzy+c+EVWj47rza/NNfu5RKJpSX0d6ZVPoFgig
         V5vBUmaSET0k0nHTgkGsMDXfQVHAD3AiXja2T/GibV9Ubw1cxaL1e6i+plIe/j2ozOjF
         cSjpFU005VPqlsEQygs+6jieMlQI5zKk1CMCbBkLXUYjP0qvFEEwJrtfpiN+EvuUspLQ
         DtdnP2XfqXsCVeer6IqK07DX2Jhm3ax1BLSzJmeq+l43m/hMOT891IZUdm27B+FuhSWZ
         Co0fYdwT7z3//LZasf8iGHbJT3/2SG/8dAOTUTn+NaY3Lc2EEGus9gircCUrrcHCW3GS
         cF6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkeRoF9uob2wJo8bMgsHJGkPaTlRa916FwxCTQ2KOExsMh6R2whap5whDF0xrjhT5tn+Zgki/PukM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYhF9bicWmMO4E5Mv4/p7ZfEQ/nkSqMivetRwEYw3V448cnRB0
	Bm9Y18cBUYEUrLpCDmOeJfNL0DZj2gA071MY6eiBbBPRJ800bqk2c61o6GYYYzc=
X-Gm-Gg: ASbGncvR2HODR0xt9rjGpDkdtAgk9SDBr9HTceEIoXAa5d90XwGFMrO1ytTTd5j379n
	4vdzSmm6Xsc2dw7fIdODSV0MEWzKoQSaoNwZ1Uar9pjQZwHySi4ErdpEZeTFVGzdDqdRA6uFpya
	xWxMoUV5P7pSseaMgxy0CY6iZCwIO8w5awqmsaz5Y34iCpF6S7CzmCyhvjrdOoskKoK25rRXLW4
	rQehFwFb7ZkqUXU68UfKR/tkZtpqMamtv8+70Fvm89rtvFShhvPLpdZYo8HYph9V/HaVRsP
X-Google-Smtp-Source: AGHT+IEXQzyXvJh87C4qYu7Ax5vz3+jmqOb6lMmmEshKHmHAav4FLPK3omE//aDu+k4UsNcOasv61g==
X-Received: by 2002:adf:9b83:0:b0:38a:4184:1239 with SMTP id ffacd0b85a97d-38a418412d5mr11223749f8f.10.1736171081048;
        Mon, 06 Jan 2025 05:44:41 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acc02sm47383151f8f.104.2025.01.06.05.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 05:44:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/3] clk: qcom: sm8750: Add sm8750-dispcc clock
 controller
Date: Mon, 06 Jan 2025 14:44:28 +0100
Message-Id: <20250106-sm8750-dispcc-v2-0-6f42beda6317@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADzee2cC/13MzQoCIRSG4VsZzjrjKJpDq+4jZmH+zBwoHTSkG
 Lz3bKBNy/eD79mg+Ey+wHnYIPtKhVLsIQ4D2MXE2TNyvUGgkJwLxcpj1AqZo7JaywIGo28nGYx
 10D9r9oFeu3edei9Unim/d77y7/qTxj+pcoaMC9SojESu7OVO0eR0THmGqbX2ARN568KrAAAA
X-Change-ID: 20241125-sm8750-dispcc-f0fa7b64facd
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IzLjyqiZQYj0HolvNDwEGq9bzWMpH1csfdZOubbN4CY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBne95BbwhkZoUPTZwRDH6P8tjnEWzo4z7vS6O7r
 +AIEX/2BTiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3veQQAKCRDBN2bmhouD
 1xd8D/98vuMER27s5/cr0rdd39XTxPqh2YSlg9Ybvb8cXrFN+jeQV/TvgF4ve0t52SKauCaT5Sc
 51gjdcMyNtcT5XPnfY9krIgClBvPl3BAXJuHwM2txKngbPe6L3Kz0A7s3ETUNwUIGvPlMbXUDnQ
 jnyYwRuxEUz6GAQ+aubhgWmJRotodmPzoGdGd9PPyc65CyPWdYpDkBv4e8RAMbM82rdiz0YfIR5
 tuudFNp//IgliJUaNSdm1e1CJEbXSyeVHH9rfRdnyK7p3sK+QPSAU/k1v7aMmypZqOlMhDjM6Es
 FdEh0p98uLW5GUZmNxITGloM6DAbY4GnIUrTM0Nj5rGhx2cGdJwUvJkDjkWEuAme83Qd+q0fV+q
 yZPXvDjMJ/cDvkALAF13UJRxWtGUB5qKYGPHyzCnQGXxt8jEj2eQ16L4w0VYwcEFN7HXaKAtDwa
 QHn2K6i2SORte35KSBhTfctNd8kU7jYgQqBh3LN1xOC/+Kch6UUFVoxA2Cm1pQJZzfT2QPknKnI
 HHcqSi4QQWopKNdJQetO+iySKhSBoD48FIXqz0RPQtAZdn8Bb9zqHTog8+jpt37twzXtgjwC673
 r3VSrA8McuCy9DkM3bBVc5NxBaTQx3DEF6cHlI+WnyAy3J1hIs+HU2VW/MSyOm5I8Kjmu9e3Zpy
 sMDhtoLYFZjo/fQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add Display clock controller for SM8750.

Changes in v2:
- Implement feedback from Stephen - see individual patches changelog.
- Few cleanups found during testing/review - see individual patches changelog.
- Use clk_rcg2_shared_ops, where applicable.
- Link to v1: https://lore.kernel.org/r/20241128-sm8750-dispcc-v1-0-120705a4015c@linaro.org

Dependency:
1. Taycan PLL and rest of clocks: "clks: qcom: Introduce clks for
   SM8750"
   https://lore.kernel.org/r/20241112002807.2804021-4-quic_molvera@quicinc.com

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      dt-bindings: clock: qcom,sm8550-dispcc: Add SM8750 DISPCC
      clk: qcom: clk-alpha-pll: Add Pongo PLL
      clk: qcom: dispcc-sm8750: Add SM8750 Display clock controller

 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    4 +-
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  165 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |    6 +
 drivers/clk/qcom/dispcc-sm8750.c                   | 1963 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm8750-dispcc.h     |  112 ++
 7 files changed, 2260 insertions(+), 2 deletions(-)
---
base-commit: 3dc591aad724ed3578548c211cc3c368f6dc5947
change-id: 20241125-sm8750-dispcc-f0fa7b64facd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

