Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7DE3644AF;
	Mon,  1 Jun 2026 08:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780304029; cv=none; b=edOIWxfTPryoKSO7fhX6s5vz5mzLtRjPrYxQacsmmWlZqq4CG4RfsGQXRp765HDm4TyAX70JRx3y8iDqJhhkuZ0U1PraX8iNeKRYC+dIskKa2MqxDvWryzKY9uh2jItm+/dHRh/9OGhfqe/Y+SA9e/ls6kDY+QHIkJDpU615kXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780304029; c=relaxed/simple;
	bh=lnU/ETWVaTLqo4OljQ3OPBQa3qRvEVA67HVfBOt4oo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FhWdbHQmljN6MkmR5PV1yeZZP93rbNc/SuQLU448wnQF7ToWmQTkZ+bSr7U4gCipuW++RoOhD+EFoANzgyfvN38fJH+FcZSOWB6O55GJ0xEEwJHvJyiStDdYAVUqG7rBCYGGDH8d+goDLI9dAQ+4cKL49Qtr7CWZRHntZrHb1ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=crbhhmkU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="crbhhmkU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43533C2BCC7;
	Mon,  1 Jun 2026 08:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780304029;
	bh=lnU/ETWVaTLqo4OljQ3OPBQa3qRvEVA67HVfBOt4oo0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=crbhhmkU2ruaShxKFOeqpRRR9NHeGJlUXvAFUdadnMWFiNJ5DXMlec36RXLVfZKhM
	 ZnC3RlUHaXpK065vkN2ugY6pUwgdxZXZHzKSn3q0WV/fepLVXpyCjWT1BYQAu5iKlA
	 0+jF4Bpvwvvt7m+nksb3gs26Uxp+lLaV9lsj38kl8JxZsxBQST4vGQF+LPb7pq0slq
	 6R7XsgidP8wj17hHjO5IjAxmqV1adMhm1jS4vDk37xB9EJZV6jmVvteETKMOXWr4Lo
	 d/h9+PFd1YDDckYJkhkb2IXLfiwk04HRvvq+JfZp8SsTRFZaROrH79mnakrjwR5j2S
	 RzMRI7ckXKmaA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38261CD6E60;
	Mon,  1 Jun 2026 08:53:49 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Mon, 01 Jun 2026 15:51:15 +0700
Subject: [PATCH v3 02/10] dt-bindings: mfd: syscon: add
 qcom,msm8960-sps-sic
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-msm8960-wifi-v3-2-fec6ac8dba02@smankusors.com>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
In-Reply-To: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780304027; l=1190;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=3x4Sjl/Z93v5wyWFXzyT8HeKEXnoUXo1SQv4Qmdyns8=;
 b=i5k/lpqnkCnxZvQlX21Yab33DtDEn7qllymOMC/ZHP735xg/7eicdkYp6GAUvz8yTkSM2ak8N
 Zxq1Vh0TPRRClt/RFn3R5KsPjT+M1YIbBppH8wpPTLTYN4bFs6ZFnXJ
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com

From: Antony Kurniawan Soemardi <linux@smankusors.com>

Add compat for Smart Peripheral System (SPS) Interrupt Controller (SIC)
present on Qualcomm MSM8960 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index e57add2bacd3..39a24c3ff9cf 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -106,6 +106,7 @@ select:
           - nxp,s32g3-gpr
           - qcom,apq8064-mmss-sfpb
           - qcom,apq8064-sps-sic
+          - qcom,msm8960-sps-sic
           - rockchip,px30-qos
           - rockchip,rk3036-qos
           - rockchip,rk3066-qos
@@ -219,6 +220,7 @@ properties:
               - nxp,s32g3-gpr
               - qcom,apq8064-mmss-sfpb
               - qcom,apq8064-sps-sic
+              - qcom,msm8960-sps-sic
               - rockchip,px30-qos
               - rockchip,rk3036-qos
               - rockchip,rk3066-qos

-- 
2.34.1


