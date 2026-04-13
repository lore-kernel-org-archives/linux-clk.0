Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62358390C8B;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776106822; cv=none; b=E4ZJ2iMYtMCRpppb/jbu4/E2RWz47jj95i55k2vYkknv9QBTJ3CZjfmSaHrfto5ZgSIMbqMtmhwfEV8frGLfuBw/M+Q8paZehc1BnzndvDf0rLpUyC9vK8xDB/MZ2RxXSSvag9tOv3EyNZR8EdWb7yD71V3y5w8vt2jNWoewGGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776106822; c=relaxed/simple;
	bh=hwGFRjkjIVh+vw2wDg9M/94dpLvDuKgHoeS0o9X0fE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HKkC4c0ZBbp3juwfief9b3DidyVJh7jKngJG+SLdlKGKFpLo2CaV64jcathxuySo6nCjABa0VSvJAP3WLFk64DEt1BUFTIIgD3zDqGfgUT6r4A+9StcbOn4RLwAIE2ryUJ+PCAMqBnt8Hmf8fTJAOBZcW5M4X3VoAI4DM7sTVgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pAMLGmFk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pAMLGmFk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27794C2BCB7;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776106822;
	bh=hwGFRjkjIVh+vw2wDg9M/94dpLvDuKgHoeS0o9X0fE0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pAMLGmFkZSwctk5zpuJsdKwZdvM8GHlTuzNV/PiHcrRlduH74stO3xTjlRz5dj58B
	 gYhNnmgY8d4Xb/tzEpjK0JiEg4wkDpINFn2d0ZY6r4TGWeKwWAx1G2ygwgFMqbZtcU
	 n+huLut1OTkrSVSePAsSDPKQAcK+JnbTcoyFVbQxyVotVKDNGcAcrtwpvgIHiRpd29
	 OGIWcTgyQstREwMXkYWCjnNHRNHuC7jXBUssdIkUBC34Vso1JcvKYwyG/qfGdSU5rH
	 PUbkyTcf0rZkXFU0puxOwuBhuNBgPsS6WiTIbrWf2vEehPGoKNa6zDYsfRFlKVaZok
	 kJtx9/sKsDimg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C41F531C4;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Tue, 14 Apr 2026 01:55:29 +0700
Subject: [PATCH 02/10] dt-bindings: mfd: syscon: add qcom,msm8960-sps-sic
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-msm8960-wifi-v1-2-007fda9d6134@smankusors.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
In-Reply-To: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
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
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776106820; l=1120;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=mIW20FISbOXB32b/vpmGZrFFpfMx94QhJtXj8cpMSMk=;
 b=cho2hesCQxrEf90foy0lm70DCmysnadQ43iMkAv0rZ9uTlR2YnFLPsee81lFbN9svpgq4zi0k
 EjkMg+VGD4kDQO09PCs9MDLbUSK4M2EqQ9hPkOTKqm6EgiFUSsqcTXS
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com

From: Antony Kurniawan Soemardi <linux@smankusors.com>

Add compat for Smart Peripheral System (SPS) Interrupt Controller (SIC)
present on Qualcomm MSM8960 SoC.

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


