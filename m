Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7E940910F
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 16:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542631; cv=none; b=Uoi2XPYw3nmdFxbPh2jyVocmHBfK3G79xrr+CAHDWAqt4yqN5uwk66oPSmdyaJ/ClJ1sq2odPERb+Ppw7PXXJIucBcHiYYHFyb54mu5AKtvwTyzh3E6bXn0VJBSKwBN2p2W64K9qQ4nhOC64fkGzSBTx6DbDwZu7GeM8Mx1Z7pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542631; c=relaxed/simple;
	bh=ZNpbc/ndGhGFIsZ8mYVotPtP6aCZUUCwcGqJQ6E6I1U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UVr+EMLvHyAeastcUapt1Dti+LDw38S+ZE74+08E8HaP0S9V/sESWvNxaKV3a5FZrVuBzQDcGQ/XHNOdGPBRokpWNdspwpA7KgpJgJinZxi2ofH+epP9M6wVzI5GBz/Q5mGBe/ISwMUxLxWP/QdGto+lvapLnC9YpIHOZiv3DOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Go4HbGxR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Go4HbGxR"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490a76757e5so25951575e9.2
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 09:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542628; x=1782147428; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SSClQZ140XmgUn13nb7ZzIvNnjIo0fluj23pWBj9PG0=;
        b=Go4HbGxRkk/hGrRcDzDYBbLTvAe9nCGHZIBd41fIjCkzQLAm4HhfXU93DHPwjMfYMw
         c2uUtiCQke2cJMQaSxcyaaHDrvcIB79ilAY4udAgbQ1N7mft6w46fBmBmV+LUEOnqiqd
         jtVzn5xn79icnzdhNcrMmYm4UUiRZBgGNAHnB07pMya3KUazkbFvOpTdaK9IYzcUJIMO
         f49X42rOJJ48awaHf7/+16x0zw4MxSbwyW9DaS2T2yvvz1vAx36GX3FKnWPc0YukosQ/
         D6Cl372pUClOwKCwSaBdgXh2SLCZl3F3vdmYc9LZc/a6whLuO/dihPidaiCDW7JoRumk
         LuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542628; x=1782147428;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSClQZ140XmgUn13nb7ZzIvNnjIo0fluj23pWBj9PG0=;
        b=FAhNs7G/syr1iahK9HViaWF2Dhtf1T6k3gk0LkdPLEXQSkFVVbcFts3W6g3ToXVCFa
         i1SBNWvNrX8E7XjXrQjWKFzI6nFWX0fr1Qu652AFdS1Z3KgaUwn2LZ9Ce6s9JXVCoZ9k
         d/5DtCnZiTuZ8N5xKhFgFDfOd3Gv5IaXwnDXXacfIgmJhK6tRIG+lHqbyeRl4jUKYadE
         Bp7DuTGXNWhc5hLy+mtrpWL9/SaU77JJQ7BmtncNIdwB6pBjiLPQ3WB6Ud8Poe6PycDJ
         qYKQNWr+4RX6kt/grTZy3NIcQcCOC9PMGKQoxK7O5SVBbGQJn8tPUjm9AAbeT/roCabQ
         aCVA==
X-Forwarded-Encrypted: i=1; AFNElJ9da/laMq5vUGx8kLgtPlUhIZcsAJ5HsxU+b7f5AJLPTJ6kNowkTVUhdmUZ2upIpgiK2fYTNUSZDAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZlkhWqpPrE2+dUSnyaAbtG1ps/mmUNJJyqJK5EqR+Cefr2S81
	Oq/n3aXljo7+Ab0hD4EaTzvo0cj0DcDsYwzMirzzn0wYDUQq15iS4HteVbbVJDp4vTE=
X-Gm-Gg: Acq92OFEN71yN3YZ0g4kg00Fno1EsvzObrrVV/xSpNWcY3T2Jk8CW+QC6quDbTAkZPL
	1e4gKfWmx1Bc8AvkiFSWYwY8avLPfBcUycnhPYimkr9xQi7aR8KQakNO0dqTpzqz1KCWKso6T6B
	OjmKue5rtEGd3uXhlIRRIgdkoUy849YivQbM57GX0r55JMEB7dbEOSXqkT/ca4I+SNGKdvYb8yt
	ECshCH2doP+8HPFBPAxZfUMNALvS/JH2hcsOUO2hWAj62/N9QjpqTIQodNGP8n1DMVVYh03aisI
	j5867VuPtvH2XsnhDGLK3gMCK8fkkx2NiylD1rQl7+RU7Ct6PWdQr6zbhZLnqks062l3Cpe6ugm
	XG6Ia7XocenvADRqQD27PqYT9OI7PYmJfm9eRafaV9Uyixy120wNjzjkis0fMLdbewJo+YVs+rG
	EIncq8nEesQuP7A0oV3EmWK/IluBo5WQn5bVpApeC42gRA
X-Received: by 2002:a05:600c:6542:b0:48a:93f8:dd02 with SMTP id 5b1f17b1804b1-4922006283cmr103978665e9.14.1781542628464;
        Mon, 15 Jun 2026 09:57:08 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c35sm37202471f8f.22.2026.06.15.09.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:57:08 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/6] arm64: dts: qcom: sm8[456]50: Add missing CX power
 domain to GCC
Date: Mon, 15 Jun 2026 18:57:01 +0200
Message-Id: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN0uMGoC/42NTQ6CMBBGr0Jm7ZhS+ZOV9zAs2jLAGKWkrQRDu
 LsFL+Dyffny3gqeHJOHOlnB0cye7RhBnhIwgxp7Qm4jgxSyEJnMMNiJDfpXteQCAxP2xsQRzYJ
 U5oXqVCm1riAKJkcdL4f83vzYv/WDTNiN+2NgH6z7HPU53X9/heYUBWa6IHFt84s0dHvyqJw9W
 9dDs23bF1Iea7TXAAAA
X-Change-ID: 20260424-topic-sm8x50-tie-gcc-to-cx-e756afa72bb8
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1597;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ZNpbc/ndGhGFIsZ8mYVotPtP6aCZUUCwcGqJQ6E6I1U=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMC7f2Equ/+QnyEvAg2mLhD04xTg3Fe4xNZLU0vAq
 vyGhbnaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAu3wAKCRB33NvayMhJ0f6nD/
 9TTJbhHPWsh2VheUlTHslJBatl4nLI3T1QE8KADY0rOLTEhFFGhXm66oUp3c85WiQ+u1DhGYX4Apgv
 EDDeFngyCfISQaZWe4eP8FbPOXusdfj79A+658uw/gyuehlkeu8mUCvPrulSPf5tGS/bdbOamifAfd
 Q1O582YOn9KVYgDLvV8bDvI42y3TXMIsqVy5D2G+9S6BJFFYWhytrpu8FDlSOR3wRxg/Fl8CaW7Q4W
 dfCyjE4bSPTw1TZD1vsZDOrsiYxlUrJW4FwO0DfFou60xFl2CFs/oCQFx98RaEji3MsR/pS9r3oLiI
 8oDFBNBnD8fZpFlcVPmCv9hFX5axRzS3Af5+4fsbRdYzJPET6+iNpWgaQ6g6nL4aBN4ifRA8T++pnP
 7S7/C6Rx+moKgLCbBska0P3it33+uU0n9F9kcjpo+wuJIktB476SkWbNV6Q2kK2leG/CP1YCU4PQN5
 f1Ahk1391SYqHSWGG1iU4BibOch//CEyWYjUxhv2NlV6hauN2U7FEr/H1dM4HGGKmNf6Fj1v+hmHfX
 4hMJfHdhIRDctJvpE7bvdDxYuUSr46q8Gb6hdCGPe2dvR9iNtxCbLO3VrBypcRsqGnc6SDiSNuOSub
 X0kD1e5q2Qmfu6P93qrJulCfJTd4npT/eFLBkc+ANU/YoiYGQdpNl+zyBhrQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Recently, on Eliza & Milos, the CX has been tied up to the GCC,
but this is valid for most platforms including sm8[456]50.
So tie the CX power domain to the GCC as well, for the
same exact reasons as on Eliza & Milos.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Add missing power domains in example
- Pick review tags
- Link to v1: https://patch.msgid.link/20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org

---
Neil Armstrong (6):
      dt-bindings: clock: qcom: gcc-sm8450: Add missing power-domains property
      dt-bindings: clock: qcom: sm8550-gcc: Add missing power-domains property
      dt-bindings: clock: qcom: sm8650-gcc: Add missing power-domains property
      arm64: dts: qcom: sm8450: Add missing CX power domain to GCC
      arm64: dts: qcom: sm8550: Add missing CX power domain to GCC
      arm64: dts: qcom: sm8650: Add missing CX power domain to GCC

 Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml | 6 ++++++
 Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml | 6 ++++++
 Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml | 6 ++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi                         | 2 ++
 6 files changed, 22 insertions(+)
---
base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
change-id: 20260424-topic-sm8x50-tie-gcc-to-cx-e756afa72bb8

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

