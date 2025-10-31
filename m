Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76524221DB9;
	Fri, 31 Oct 2025 02:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761877715; cv=none; b=AErv8qTziHlH54QwYtm5iDCGONpafMdhN7fz4HJj6EZ5NYrBcVL1wATh2p8dllzb+LNb4wcgkYDU+5ClP6iQQogYLDoRqVK02cXjXeEQlyvYx1V6EO8E8BeU1qvVmxTQJNc9/P2SFGWOEmijZzN6zUP5CAKwTP3oUUbljyq/Ats=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761877715; c=relaxed/simple;
	bh=saSevqQqF0NKsGN4g+J82OxGRpjZfSGnHrYhDSzT1Yk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pAJChHYW/B85BUPbg+dtSlUhg7Vi+WE4JihAtb1EHmawmbVl5lVzQe0NJd/f+mcU95J0Ruv+deOmwRmwldsYp7WBowjdDuDjbGnT3p5VpJOicvBnk8xqw4oCFNcbGxBj5CIZ/+ZIJVPMlYsr/mAbT0rvokSvYZ6aViZG6uXh9M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=permerror (bad message/signature format); arc=none smtp.client-ip=95.215.58.188
Authentication-Results:smtp.subspace.kernel.org; dkim=permerror (bad message/signature format)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alexey Minnekhanov
Date: Fri, 31 Oct 2025 05:27:43 +0300
Subject: [PATCH 1/3] dt-bindings: clock: mmcc-sdm660: Add missing MDSS
 reset
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-sdm660-mdss-reset-v1-1-14cb4e6836f2@postmarketos.org>
References: <20251031-sdm660-mdss-reset-v1-0-14cb4e6836f2@postmarketos.org>
In-Reply-To: <20251031-sdm660-mdss-reset-v1-0-14cb4e6836f2@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Alexey Minnekhanov <alexeymin@postmarketos.org>
X-Migadu-Flow: FLOW_OUT

From: Alexey Minnekhanov <alexeymin@postmarketos.org>

Add definition for display subsystem reset control.

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

