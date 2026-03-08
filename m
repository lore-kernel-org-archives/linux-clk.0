Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FC522256F;
	Sun,  8 Mar 2026 00:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772930455; cv=none; b=bZKXSAuZ0YfeCEyEzXqXLpZ4ZxEqx+N4z5jou18uj4ir92ftqSe3tNgOf7wOm1x+ij0KETCp16AQI9ro36C+jOz1+v5BaA0emllX/xwj56qKJ605MXL/gPLVB0YsnsernuJCbPeLPh+l6tanawQRCaOxvbkNzITdx1T3O2xvc/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772930455; c=relaxed/simple;
	bh=PV5HOSY8dG4JQ9a9Lf9pv7ApBS105+RPc2PVXbwO36w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dh+rsId9JATxWfpY6zG5PRMCGchVBAWifwuGnrwCJZ8Y4w413Aqwk+4WXNSJREaNuh2Rejdv8JZH2xLSXA9UCPwROwANKSQJW6kvJNpJdL8RV2sA+8gPHkbScSYz0btVH8/85UuiQiR+CEFFSbm9VufQf2Di38oIwSdEEz26ttM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=bFmFig6W; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Klfz1DKM; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="bFmFig6W";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Klfz1DKM"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772930384; bh=xbx6TU4jfnpq72IWABUQiEH
	UwT8jYRPG1/eGQS2LZok=; b=bFmFig6WMRVDqWtetvFXd7p1vYm5j4uRq3QZacX5sRqFGK53nb
	lxkZCZrLHEQQTVToVXN9T9QEoa822EQdcRBs5u4cniLJTwdAVXh5oTlVvmUUHwuWAnD/U5lV/vj
	mASDc9A2/VuArI3bL+AAawdWWP6iK1+jy8/MQi8di0qzL/Z/gdMoJfdiIgdH1WnA8UtJERJo7mX
	nCN2Hgm29lXRtWXc8fbdL1QcbA6UFcawQJHOPpRRiTQ/Um95/F/dwZDm7DRibIzZnbns0VZkocj
	Z0Kta0zoBhByhr3l51Mm0XTkfpLzegdL0YyWuntV9iBeM6O55drOdNPeZUPV50VwVgQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772930384; bh=xbx6TU4jfnpq72IWABUQiEH
	UwT8jYRPG1/eGQS2LZok=; b=Klfz1DKMInjWORQPQs5jy0ZwQ2BCWwaJloRq1yolraBmhNZ0ew
	IejfGtnk8Xj9aX51QWULQY1N/9M32Si6x/AA==;
From: Aelin Reidel <aelin@mainlining.org>
Date: Sun, 08 Mar 2026 01:39:28 +0100
Subject: [PATCH 2/4] dt-bindings: clock: qcom: Document the Fillmore RPMH
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-fillmore-clks-v1-2-976d9a6bebe7@mainlining.org>
References: <20260308-fillmore-clks-v1-0-976d9a6bebe7@mainlining.org>
In-Reply-To: <20260308-fillmore-clks-v1-0-976d9a6bebe7@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@mainlining.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Aelin Reidel <aelin@mainlining.org>
X-Mailer: b4 0.14.2

Add bindings documentation for the Fillmore (e.g. SM7450) RPMH Clock
Controller.

Signed-off-by: Aelin Reidel <aelin@mainlining.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 3f5f1336262ee60bb29c2fcea4a9212ccf7920f4..9e5d64865fc17cf5a13c242d992af70587bf2688 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,fillmore-rpmh-clk
       - qcom,glymur-rpmh-clk
       - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk

-- 
2.53.0

