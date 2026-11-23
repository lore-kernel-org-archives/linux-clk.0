Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419504;
	b=ajEQJrjj45Ia4j+02m/wjMbb3xxglCEvHE+YU4dHUz3SgiamkkroZJlFOudHz11zzDrz
	 LGFiOVAVeACUwRBEQJvq6K3AIFvqlR/0ZzNtW0INyi+IaG5E1Iy6ee9sf0YbJzoDZNSMA
	 lwEEK2nrNZ+TpRGUB4fLEcJ3hdV4kFLqhdGv3mZenoVCPqaAYrthkDCb1t4ZU4l81Mxmd
	 tF1FpGrbzJcagGUdK4HX1kD9W1Vamt6dLcQruUqGqP+5IO4rEFhXBTTCUJlLoWN1K7Pd3
	 AMLV/6s8Wr1zPj838vmzVDsE734krWvPjE+CXIhZcTl/A9OCK3miGcX+lIu13YU3RWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419504;
	h=Received:From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=kb2wW82BiRX9urEdf6flbl/a9JTwxBzi7QUNfVAnYnw=;
	b=b+uXfntyVC51RNlrg1yPMwXeWG133vRhJ4AWwqyfC3gztIV+mE8ezPT3SJ6AxYweyv57
	 pWnWFmJCnu4rW8IiixCGL1lLtgK+/LsH10y/aCaWRGegma/gOkJsavbaOdcrY92MIxcIc
	 Senyssomne3WdoOGST5/sK+SSRePbSRC2ijp05kFM0L4HM32HiDV33HeIzHv7Ny1Mfty0
	 5rumQha+MHkLoZoSVsSAO3b+43oCVlu+8OBTQ861a6JwenSGYJakp0OE5Xa0RFI+7yT1z
	 1trvqGjUCuy9DDVNPOwA3f3uQgH6xN2nvEA274uc+qHIJEQ3FT/ckUl/QMWgwPamxHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094B4606A31A;
	Mon, 23 Nov 2026 07:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83091F000C4;
	Mon, 23 Nov 2026 07:38:22 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/4] clk: qcom: Unify KConfig choices between clk,
 pinctrl and interconnect
Date: Mon, 23 Nov 2026 08:38:10 +0100
Message-Id: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0K6toSOAYIr72FYlDqVUWmlA0RCu
 LsF487NJC95898iGAMhi1OyiIATMXkXAQ6JMK12N5R0jSwgg0IpULI3vpMP452lmxwd2VniETH
 PmwrKCkR8fAW09N5HL/WXeWzuaIZtaTNa4sGHea9OavN+AfgXmJTMZKEbrUurrTLV2TOn/aif0
 e3SeES9rusHVtO8kc0AAAA=
X-Change-ID: 20261121-qcom-kconfig-unify-e3ee55b92792
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1182;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=nYAE3w1TIK1tiltYdjoXbt0b5Tavvu7hlXRj69zzhpQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrA+1kYhHUEzy9QRDd6aHCAfEGbrgbSPOIvDjHm
 qchGXzvf0eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawPtZAAKCRDBN2bmhouD
 1960D/oDkn8kbxJdE6X2678GYy4aljuA1yxk9j/p6SbuCs0R+/G5s2t1MvQt+WECwD8Ju0BmJb+
 VvHWedBcerJw1cfAXfLAg2Ddqo7HZoqTP8Ww3rZJKG8IW8M8Jva3euMDESHTqUg1tl8qEx0XlBK
 GlPnaIRBMy05ASktrcVsB3AkKIPm94s0kp2wO8lR1ZIUSrv6991mA4/WYbaIXmY3RssFm9lj3tf
 2oYnQAIWF2pPEHlHKO64HmOw0jmNa1os0/p4EJvMXBmO7nEsbgguGqxmagHaOm2Rzwv1GTJP1Fy
 waSZmKo9yD/um8WNTsVAC1G+xNvxvROeJgRQCajSzhIdtaW6Ll68qFOJsEteT/bhJl/sO6hqGed
 0x9m/3PgtdagDBKUmLFgEtww/TvsG4JuIsa3QFIRLGZQWRCpSTRL0PViCYkl0coYlaKuz4GtSct
 uwysL2I9tDVotPm9rbcVnOlYnvl2TjCPjcXI9osO5AEq9vyPWp1fOGSPUxMrQI6rCJIUH5lvSLq
 zLkuAUfTACnyYIYKa/dC7Tuly0j/JVsBNQgwXRh6regHgL1/Q4BqWWSReiWVz6MsN3QaYvZERry
 LtkQkQiGgD6mLD29xoSrUG1e8+WWxe0Gs4PuRDLeksn9Ar7vqswS3AV08L5k2PtCjQ5L3G84BaF
 btPLNnpLjU88Zyg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v2:
- Patch #4: Restrict msm8996 to arm64 only, a few more drivers for both
  msm8996 and sar2130p
- Link to v1: https://patch.msgid.link/20261122-qcom-kconfig-unify-v1-0-6abaa7faf1c9@oss.qualcomm.com

Recent commits adding defaults to clock, pinctrl and interconnect
drivers left a options inconsistent between them, e.g. SDX65 clock
driver not enabled by default but its pin controller enabled. This
should be a consistent choice - we want by default all critical drivers
enabled.

There will be separate patches for pinctrl and interconnect.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      clk: qcom: Enable MSM8917 GCC by default
      clk: qcom: Consistently enable MSM8939, MDM9615, SAR2130P and SDX65
      clk: qcom: Drop redundant ARM and ARM64 dependency on IPQ_GCC_5018
      clk: qcom: Consistently handle MSM8996 and SAR2130P

 drivers/clk/qcom/Kconfig | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)
---
base-commit: ddeca928793056a8ffc0e3e107722c25e1836eac
change-id: 20261121-qcom-kconfig-unify-e3ee55b92792

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

