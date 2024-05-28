Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDE317921D
	for <linux-clk@vger.kernel.org>; Tue, 28 May 2024 20:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716929019; cv=none; b=URVjhYK79+cfLbp9LxBnwQbWJCnc6m7RTtFToVSRtCOYjUKWtU4Fl9EP/tySGK0kxGM6xhQ65Raj/whPPhqLjWqMe/ZfVoKDalwCtZy7mPDcqxDM0mErTDlIEeoumxho9r+VddEGIaTcU1l+c/rQKTQrLoQYT3f2znibnuC1v88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716929019; c=relaxed/simple;
	bh=KdOLoaqqPKKq6B+kbVp/zzlHPVbPXlpj0ygf6uQcA/g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SFVVy5Pa2HKEQlFcL3v8f4SPHF9EaDAoWY9vDcozl4cM+cITPAFFt0MoXWkfZ5283sQAz4nrY3K6lK7VwsowRtkrvhiH0BBT8onWjkdr+DrR1GnPSzcrw9oxDyIsL8XZZdN4xGkU+sTZav9zlDkUnPkv0iYmF4PIENhn9vKpZBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EbhlOrNy; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EbhlOrNy"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e78fe9fc2bso17614241fa.3
        for <linux-clk@vger.kernel.org>; Tue, 28 May 2024 13:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716929015; x=1717533815; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s+CsOJCVlsOTrjqdtpqHMF6zfHlzSSq4GbM8W7t/KeU=;
        b=EbhlOrNyNzLAm7kebFSFGtpuJvpeL+8sSM0oOKrWgclqHyjovsnRm0BmVmjcvVZyb1
         xpM4EHenoQ7F7QzzsLPI2PH2wV8YNA5mvq2U2Q/lUpRzCMGy7X/oZ7DfunQqQ2U0t+ro
         C6nPa5Id76sA4gtlANmQ9qqxeKrQigE1TEPAiXOOam7hBNS7IVBVPhTxMe1yimpsE98m
         laUiDRr9q0aRuBghtl/ZeNSU6g9hBbszyM3AkLBptEHm5tF9LL22IqfId4b2a3+uJHXb
         QKxfzyM46YVhyMGvFHKz5tcWPUbTWEaPWZZKNLBE2rHVCvYYI1sP5rR7ZjnpJx+6ZhCr
         QEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716929015; x=1717533815;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+CsOJCVlsOTrjqdtpqHMF6zfHlzSSq4GbM8W7t/KeU=;
        b=GM2dXT3RHaA+SVghmgEopzNT/q2X+4v5B3Sb7cRFXaDRHJF5TJO5eH/RXrtHoQuKaW
         LllW3UO8KmqWR2smMMY/oKMiqXzsBcdnE9bAubQm8ugiKpUiazeS8r8CcDTinoZ6Gm3l
         gEp/Gmz+NW2u6X4WoFlHwpkJMI1snSwLT3lJPGI+reYooiXh+07JKD+8NG+FPdQoBH0Q
         wnh2oBbfKOQs7fxN+uws5+qqfkc2o2UEjxRf+eCACx3lzWUCkz/DDekeWeTGHI9UFZ9B
         h+j3r2gQSDb9CP4LJK1mGAqWlxLDHweZpQU0W1oIWARj/ErY8hLq6gagBnSB9VSIIErh
         r6zQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1nXO9PpdPpXWtOVcORUS8pf7NEojW/LgNHl8g3oEUfiQI0ktSzJY6yV9MTL3juUw3z2YlnUJauIWAA2bYiw7FL0u3B7S1SQ20
X-Gm-Message-State: AOJu0YxUy1PfDCIzGmGoKyu8aRfvuFVGTFa/x/qGpyIExF+6W1YR9hRc
	HoJRe8m0PotKj9zcDG6kIS1s+Oh12GYGJn8NZcU5y5C9Up+W03PYHmfiIzo9l8g=
X-Google-Smtp-Source: AGHT+IEELxtRw01V0LSl1K8Y2/DYMfj51mt2ELV8DbnZI9JfaFo5hQZT9kn1UGbExnF8QONYnaKDaQ==
X-Received: by 2002:ac2:52b4:0:b0:51f:601f:cbae with SMTP id 2adb3069b0e04-52966e9a44dmr8266092e87.56.1716929015036;
        Tue, 28 May 2024 13:43:35 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066b885sm1095493e87.127.2024.05.28.13.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 13:43:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 00/10] dt-bindings: clock: qcom,gcc: handle the controllers
 without power domains
Date: Tue, 28 May 2024 23:43:18 +0300
Message-Id: <20240528-qcom-gdscs-v1-0-03cf1b102a4f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOZBVmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUyML3cLk/Fzd9JTi5GLdJNNUs+TEtJTEJMsUJaCGgqLUtMwKsGHRsbW
 1APWqsyNcAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2208;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KdOLoaqqPKKq6B+kbVp/zzlHPVbPXlpj0ygf6uQcA/g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVkH0W8HCtV9FkP0Fi5jHzl6dxsTXhxkBImCsS
 aBIyGEyz42JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlZB9AAKCRCLPIo+Aiko
 1Yk0B/4wRvE52sN2pOvvOSYjNFMz4MlTqAh8kJsoYWyP+Wn0qe6qheHvtmhVV4qilV5a16iAE/d
 Onu9bkxcdaOROBgOgZ3VyagFbGEE+8zHXHTSBNaXcaeGOjsk2/6mSVy+m4ZRvLq6er1p0zEax2Z
 fTJ7vP01NGZZNKqWK5KhwSifUtKEs0Y5fljV1t4eWJFlTdxKyJwhDzahSc8G+bzQQU8HPA9DeIn
 dkLySM/gEkcNKwKSRuyxNcWHL8h7RPJxr8+yNoZNyOOiXz4rz0EyJ04kCYdegzOSrxjf2NDDos0
 hwlQ23DBMqV8Sn9eIPSJg3DRa2IcdYx1p4nsTUfKPe1T1t9X
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On some of the Qualcomm platforms the Global Clock Controller doesn't
provide power domains to the platform. However the existing
qcom,gcc.yaml common schema requires the '#power-domain-cells' property.
This results either in a platforms having incorrect property or in DT
validation errors. Fix this by splitting the qcom,gcc-nopd.yaml schema,
which doesn't define the offensive property and use it for such
platforms.

Also, while we are at it, fix GCC node name for two platforms and
enforce node name in the DT schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (10):
      dt-bindings: clock: qcom: split the non-PD schema for GCC
      dt-bindings: clock: qcom,gcc-apq8064: use non-power-domain version of GCC schema
      dt-bindings: clock: qcom,gcc-msm8660: use non-power-domain version of GCC schema
      dt-bindings: clock: qcom,gcc-ipq6018: use non-power-domain version of GCC schema
      dt-bindings: clock: qcom,gcc-nopd.yaml: force node name
      ARM: dts: qcom: apq8064: drop #power-domain-cells property of GCC
      ARM: dts: qcom: msm8660: drop #power-domain-cells property of GCC
      ARM: dts: qcom: msm8960: drop #power-domain-cells property of GCC
      arm64: dts: qcom: ipq6018: fix GCC node name
      arm64: dts: qcom: ipq8074: fix GCC node name

 .../bindings/clock/qcom,gcc-apq8064.yaml           |  2 +-
 .../bindings/clock/qcom,gcc-ipq6018.yaml           |  2 +-
 .../bindings/clock/qcom,gcc-msm8660.yaml           |  2 +-
 .../devicetree/bindings/clock/qcom,gcc-nopd.yaml   | 43 ++++++++++++++++++++++
 .../devicetree/bindings/clock/qcom,gcc.yaml        | 19 ++--------
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |  1 -
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi           |  1 -
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |  1 -
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  2 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |  2 +-
 10 files changed, 51 insertions(+), 24 deletions(-)
---
base-commit: ee3122766a21b81f4014bf7888dee5b9c5af15fa
change-id: 20240528-qcom-gdscs-b5e6cafdab9d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

