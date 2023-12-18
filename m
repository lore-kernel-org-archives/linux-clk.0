Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5A44F8B1
	for <linux-clk@vger.kernel.org>; Mon, 18 Dec 2023 12:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TORj6iqH"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d3d0faf262so909585ad.3
        for <linux-clk@vger.kernel.org>; Mon, 18 Dec 2023 04:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702901305; x=1703506105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2DCBxer6HmgtNkGKJ5qBuor3JmQBFkVeksd4AY7uXs=;
        b=TORj6iqHjowvWTbMxOXQqm23F5FFOK/u6GV7FIPtvfvGmBt31kMVLw618P3euYNBXg
         icfRLs/rFUd7T3cg6Bezkc++0EvWHy6xG1Ci+NTRr4RX3itL+c7vRUnoUVvt/ZC+LZrI
         bgPu9dYYtmGnsKfxOcN8/WY7LNUzCb4hKOEXlg45m445YwCZ+D8NLvFEuMv1zidh1FuP
         D1pnnNfnbus7g6e/pud82/kJA65/T5UJT6XgbGGn0g21NumQiUvtoIn0xzz7l2nM3j2G
         +WsOwOLyrlfFbOhdegJnByfjAqRmeysFcXEuXIJlvxO8+0KxI1xCc30vjPb//gJ8XhLy
         vMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702901305; x=1703506105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2DCBxer6HmgtNkGKJ5qBuor3JmQBFkVeksd4AY7uXs=;
        b=N009ttyac8bmUkfAcrvKDpxa6FBspNwX8P6PIa6FUNdLzfa3We67Z/PThaS/mOG70N
         QUyjF420A7m8M73ilN+IRoSDr76b+w40y+Dfr0NH3eHS8REGgc8rf3M++O6PQaIMVIFb
         1u+28wM0nU+R2UormICRYo7lGNxOQbiiQHx9zvr1PIPg0VrWwza/p0FLUeOehWG8/6h+
         CnVRCiAH0HoXTzOrMgDgI+qIpGdkeoUMqWOTbC7REJ5GgUW8JVQv+1YcNba3aJafRW/e
         4oiatj4J8lFUJdgSNnl3t9Pa5iri4ay1unvIXAF/dOZp7qVdxEvyee6bdW+phdUfY8XP
         DO4w==
X-Gm-Message-State: AOJu0YzAlI9R8ZEiq4daT2JFIJRByqEWfzpY2BGqgzb6Z9+4MIsKmV1P
	YWVXeyngSUXgSKojR6nkxvws
X-Google-Smtp-Source: AGHT+IG/sSV0F3DjhxgA0eUfeqM6bud3z5a+Hp9pLUdJQxo2YI68XJottXg0G9ttIG4LWYgUbeE6cw==
X-Received: by 2002:a17:903:189:b0:1cf:d644:f3ad with SMTP id z9-20020a170903018900b001cfd644f3admr20702728plg.3.1702901305096;
        Mon, 18 Dec 2023 04:08:25 -0800 (PST)
Received: from localhost.localdomain ([117.207.27.21])
        by smtp.gmail.com with ESMTPSA id j18-20020a170902c3d200b001d368c778dasm1285709plj.235.2023.12.18.04.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 04:08:24 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	vkoul@kernel.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	quic_cang@quicinc.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 10/16] arm64: dts: qcom: sm6350: Fix UFS PHY clocks
Date: Mon, 18 Dec 2023 17:37:06 +0530
Message-Id: <20231218120712.16438-11-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231218120712.16438-1-manivannan.sadhasivam@linaro.org>
References: <20231218120712.16438-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

QMP PHY used in SM6350 requires 3 clocks:

* ref - 19.2MHz reference clock from RPMh
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from GCC

While at it, let's move 'clocks' property before 'clock-names' to match
the style used commonly.

Fixes: 5a814af5fc22 ("arm64: dts: qcom: sm6350: Add UFS nodes")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 8fd6f4d03490..ef793d48316d 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1192,10 +1192,12 @@ ufs_mem_phy: phy@1d87000 {
 			#size-cells = <2>;
 			ranges;
 
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&gcc GCC_UFS_MEM_CLKREF_CLK>;
 			clock-names = "ref",
-				      "ref_aux";
-			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
-				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+				      "ref_aux",
+				      "qref";
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-- 
2.25.1

