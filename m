Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EA834A779;
	Tue, 20 Jan 2026 11:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907992; cv=none; b=H7Am8HdrlF42DcDdSe2sYhv0R5JDJRGJBYKdof7mEtxWBjkBxKdMcvx2aFn9YJHmP3uQ1LzdOwU7FGa6jgxsUZWBZHy8juJIE9W8zVhfrd0+fNA1RVdVTEUx3R3EIbFlBRa6zuSVhkYHq2WjYtRQ3c1wGBSaywK+nr85EqKaaGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907992; c=relaxed/simple;
	bh=AWF1I4/2mnXqG5VXvaQF0vNKnvlUDNLbPYa6QfQQu7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W+C5GDIc3ZZH/sxiFwhJbLweZDeeHwSxUShKUQQOB8k3qRbWsxCe2GyqrHdUeGW00YBLTkNC6Ev/h6FoumtuseVnrHX9p79P3fPilxrDEsSNQFQyuNUFoNEpf80iY+Y3cY/fdFRMXPN85UXzKsT1/8D0xZ/O/M4VoobSpt5i20U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s67FqRWK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s67FqRWK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61EA9C19421;
	Tue, 20 Jan 2026 11:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768907992;
	bh=AWF1I4/2mnXqG5VXvaQF0vNKnvlUDNLbPYa6QfQQu7U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=s67FqRWKHPhVqgA/RDQWEP5DN5ejPAXPMpZ6il/EqoapjR5Myb8jQVVfmsUT3/vif
	 OlTBaxNRynJULUEkwifr4wpl5VfpjRxn6AJwnpKl7RyJYNR85RzHHdjaieoNnWVElv
	 +vAWkowBUWlCqeXIJeTgcda3ZrKajRSsv7u8nrBNnYIlJd8ypIWaB9kp5EvDC2lDow
	 7Pbp3tMV/wFXleY5p23KsDh6GbkXAvsbjw0RdRvP6EcSFRgkN4fJ24hBGllT/voGkE
	 ftsTmxncYMy7nFrUQoboej0qVD+g9kw1wAhuXOOG5QK57ESLlCceRk7FCbqMeabbwq
	 oJdhnhDj7ry2Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 20 Jan 2026 12:19:25 +0100
Subject: [PATCH 1/3] dt-bindings: clock: qcom,dispcc-sc7180: Define MDSS
 resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-topic-7180_dispcc_bcr-v1-1-0b1b442156c3@oss.qualcomm.com>
References: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
In-Reply-To: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Kalyan Thota <quic_kalyant@quicinc.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Harigovindan P <harigovi@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768907983; l=1098;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=dXI3dItKonHkC7E3ASyfGG/IfR5PMoX/TLWS/5xG4JM=;
 b=xxHmqfKeY6/exGirICMt+f6z+PjvqnmpdkT2Fw8LAj3eB7ftLUleibngK9GhxGDuu1CbDBAyR
 hOdj5gr/gHQAJckaK4NqXZss6OF3lB4vtEX22i+NnvlUrynMf2TfrOo
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The MDSS resets have so far been left undescribed. Fix that.

Fixes: 75616da71291 ("dt-bindings: clock: Introduce QCOM sc7180 display clock bindings")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,dispcc-sc7180.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/qcom,dispcc-sc7180.h b/include/dt-bindings/clock/qcom,dispcc-sc7180.h
index b9b51617a335..070510306074 100644
--- a/include/dt-bindings/clock/qcom,dispcc-sc7180.h
+++ b/include/dt-bindings/clock/qcom,dispcc-sc7180.h
@@ -6,6 +6,7 @@
 #ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_SC7180_H
 #define _DT_BINDINGS_CLK_QCOM_DISP_CC_SC7180_H
 
+/* Clocks */
 #define DISP_CC_PLL0				0
 #define DISP_CC_PLL0_OUT_EVEN			1
 #define DISP_CC_MDSS_AHB_CLK			2
@@ -40,7 +41,11 @@
 #define DISP_CC_MDSS_VSYNC_CLK_SRC		31
 #define DISP_CC_XO_CLK				32
 
-/* DISP_CC GDSCR */
+/* Resets */
+#define DISP_CC_MDSS_CORE_BCR			0
+#define DISP_CC_MDSS_RSCC_BCR			1
+
+/* GDSCs */
 #define MDSS_GDSC				0
 
 #endif

-- 
2.52.0

