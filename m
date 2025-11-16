Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30641922FD
	for <linux-clk@vger.kernel.org>; Sun, 16 Nov 2025 01:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763255614; cv=none; b=EH0wuJfR9h+GXvYBwd2aBlDAuT4+LwWM/NQw3iB64b7mKi5yQbRuF219EIoMuZ2icE3ham+LTv/CzWAvAhwlNDMToI4Y+TQof2mXYqzB5rql7QQVEFS8jLgoADfknmCp8MrRlMKfFHhB0dGpneFJFjgzYo/PSKH0SVEHa8DQHiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763255614; c=relaxed/simple;
	bh=nGxW10UyfEQ4DreGljKjL7EGfj7eoO2RwkgSELWMwws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SGrpDnn2hFZCWzv3O7dsbJHSoYCUXNY41mzTsG70YYb49T8fgdp66/5Mp/Wc7nXUqDwKHSwUSSlJ2/6T+UCIu1PruiHNovyJzTkAIx9wF6LAvXaEjwmIm9WxnBjmDr/L8MbVvRZMhXsjFPNQrHolS45ssETuwB5y69XR697+tDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=n9coPHJ8; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="n9coPHJ8"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1763255608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OASaWzG/9FNfSviY1px1DKBa9NEDcyYNBxg2Dtdf/TI=;
	b=n9coPHJ8bY7oWh8VQ+3C4Bs71azVv4bg8AtAibsevuJ9C5ZTg9FJvq909AQ2zhto4nseIT
	dyKZ5O3V/DujBcE7OIed5C8RgtrZlynzzfufvyXwk618R3opc6VEY+4AVcT6jfPty+UEXG
	C3QkYR1NVDrkGUMLZZyJ8xkkZlRp27i9uqUO7RMPGCuqCUguOhpUvpyKD/6G2pwBhKHPfJ
	2bSrF34Vrm/YiM/tXQbDDMRQkaChiTL9/dt1LV8HS86WEWrae3CLykgqFoGf2gFQe5tD/P
	LKyVzFiYD+YQbOszT3lWU7wpMUC0yrxkPRvWyPRnEBFnk5rhZ8G/7wgkICm/cA==
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
Date: Sun, 16 Nov 2025 04:12:33 +0300
Subject: [PATCH v2 1/3] dt-bindings: clock: mmcc-sdm660: Add missing MDSS
 reset
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251116-sdm660-mdss-reset-v2-1-6219bec0a97f@postmarketos.org>
References: <20251116-sdm660-mdss-reset-v2-0-6219bec0a97f@postmarketos.org>
In-Reply-To: <20251116-sdm660-mdss-reset-v2-0-6219bec0a97f@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Alexey Minnekhanov <alexeymin@postmarketos.org>
X-Migadu-Flow: FLOW_OUT

Add definition for display subsystem reset control, so display
driver can reset display controller properly, clearing any
configuration left there by bootloader. Since 6.17 after
PM domains rework it became necessary for display to function.

Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
Cc: <stable@vger.kernel.org> # 6.17
Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
---
 include/dt-bindings/clock/qcom,mmcc-sdm660.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,mmcc-sdm660.h b/include/dt-bindings/clock/qcom,mmcc-sdm660.h
index f9dbc21cb5c7..ee2a89dae72d 100644
--- a/include/dt-bindings/clock/qcom,mmcc-sdm660.h
+++ b/include/dt-bindings/clock/qcom,mmcc-sdm660.h
@@ -157,6 +157,7 @@
 #define BIMC_SMMU_GDSC							7
 
 #define CAMSS_MICRO_BCR				 0
+#define MDSS_BCR				1
 
 #endif
 

-- 
2.51.0

