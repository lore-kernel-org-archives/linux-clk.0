Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA08F2E7623
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 01:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784769881; cv=none; b=EGHHMDZR9DRvmdVQbrKWhufJy/ZEtMRFZztV/Vo/gyKDNldrBRb+n9U4mEHnNqi3zX+Ucq60te1N1eT0tlehg/7S7C0m6kgCBH9IOzZ0QuC5ub9nD2s0tcGJN8FWWPnjg8/5jpl2jmNB9RqP8rqhBmLkttb2+GSVWopeKSrSbqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784769881; c=relaxed/simple;
	bh=wgB4PIrpr1YYgW5ec9JpjdnWXn1cEPDlUN91lmzw3xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RbqjhhqCZQq1xdISGdPE+kb0vsNNoqRqhtofM/AwZ+ySXFeY2+kDpRaGwC0N1xhrrptiowAV3xnBKK4pr+QJAd9KmBr79IXFJV4OUa4eW8fxg60gDQYUAWnH3t7eaXT0cR1l77Fndz866IzMEZxoy/jgLIdByeGIY1Xjrc7jyJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmIRASzk; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmIRASzk"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-668296d0ff3so68924d50.0
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 18:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784769879; x=1785374679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+JKcIPJqaMAyH6OdXJ30k6mM2iyhDEyD4OzquhdMaNo=;
        b=hmIRASzkNPYlJUbqS6JqLggx3nquS3waVWA1wnAdFZgXPPTki9fvT5hGPA4lTT+mng
         4aOwoTGmOwgfHWeVgSW70kbJs9kNUyZx8RHoCLvq64c48eh/qIsPAe20gLxkNldy3gvF
         3YV/J6dDP+MSCYhvPnRt4qpl1np8N/wJ/uQ59bVZqN+ZO6V+TNLR3Kw5fXILXsdOJT/d
         44pXX89JobjhfQclKKQdGdy6CEpoTx5TjL8mmXKFcKBUG+/58a89P8CAoZf9SXzayZPJ
         +aWBigEQM6kEzGM5W7tR2R0n16DhjBG4PFB0SOuNFist6Ish9ioQd1NcxmSkvsnmJnxI
         S6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784769879; x=1785374679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+JKcIPJqaMAyH6OdXJ30k6mM2iyhDEyD4OzquhdMaNo=;
        b=qjh8Aa3PccbHmLq6J0lK2lYV0+M6ZnvOZskwHD0S30112JYt0+20jB1gVSCA7i5V98
         vc7ndJ8W9xIbKEOpWgfL6lkMhTXLOkSAZmBwv6g+1EkftoAf4W7NAczT/TkGzv6JXzwM
         sQXkjt7SMjQMY615i5zhnXUVIhDvU3wqKq/UObl5M0S2A1H9FO19mpeAm4dBntrGGGMF
         SdGk2HI2Jx0OXwzVdWTaTegclJ3Q9AMcAFNiOE2ie9BHWkCpwJi51ASc0okW9/UMaLNh
         GklZ07mH3RxFMGLOc7IlYP997doEqZwvBAZXucoc46qpNq56m54XQX1shYjDte/u8yCv
         s4XQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvnuBdRPmdRMRgzCZdboUOjTflrkBbnfeInlPTlEzIehvRaaOdfoaLRni1JLV96WkZ3KVp481ttZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqYlP17ZwERpIsvjMijSLDTFfsqEvkYzbmapctS/qPpF8OWGw+
	WWIPCfDkg6ZfsM7kTCG0lSEdmk3c5qQoA7eXqrMTcraYX+qrF9l594zv
X-Gm-Gg: AR+sD11vET9Ve3m3KW0MMap368Hs8oIs31Z6oWir+1NMozQJSj4ukVt+guOSZ+yhpKr
	uTopvoQF85KhpVkrG6I0YEDKUmrF8KU1EkSMm0ofuluRwBzgCB2cxQNSsHGxVPhj5pz1ghWeb/k
	PcY8iSDIUQjLT1oBGuLcqjjYCJ5LfOYpPPWaNjl91pYOBxpc2XgcqbmI+YtbZe6TyrYnA/k3tWZ
	xoNfpc4Jpiif5/Ec03erpZFt7fyiH2NC+qQT8y0uHN+OdR7p5RXKtBsO4YX3C04SnSFac05xgPK
	YjacSrUaq+0idnAdmxvplQmdKWt5tGOD5RhfQ9KTjuO1ROIik6Hq+SWoxArvIT7nzOWmSBy5vz5
	9aVAmftsn936ZV9078wZxBWBbI/03Ax2XVBGVoQbZVslxaNM/aRcSkQAPiqbTojpm+hTpjynD98
	DWyl5IN7PwepZkalpFoczf5mKEK7DC
X-Received: by 2002:a53:df51:0:b0:667:c93a:82e6 with SMTP id 956f58d0204a3-668a4cacafcmr225650d50.44.1784769878921;
        Wed, 22 Jul 2026 18:24:38 -0700 (PDT)
Received: from karli.attlocal.net ([2600:1700:7270:4eb0::19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66890521188sm2310775d50.1.2026.07.22.18.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:24:38 -0700 (PDT)
From: Aneesh Pradhan <aneeshpradhan2004@gmail.com>
X-Google-Original-From: Aneesh Pradhan <aneeshpradhan@acm.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Catherine Frederick <serenity@floorchan.org>,
	linux-clk@vger.kernel.org,
	Aneesh Pradhan <aneeshpradhan@acm.org>
Subject: [PATCH 2/3] arm64: dts: qcom: add initial MSM8920 device tree
Date: Wed, 22 Jul 2026 18:24:30 -0700
Message-ID: <20260723012431.48499-3-aneeshpradhan@acm.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723012431.48499-1-aneeshpradhan@acm.org>
References: <20260723012415.48288-1-aneeshpradhan@acm.org>
 <20260723012431.48499-1-aneeshpradhan@acm.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Catherine Frederick (coolguy)" <serenity@floorchan.org>

MSM8920 is MSM8917 with a different RPM clock compatible (IPA clocks
present in rpmcc-msm8920). Start with the minimal SoC dtsi: include
msm8917.dtsi and override &rpmcc. IPA and other 8920-only peripherals
are deferred until their drivers/bindings are upstream.

Depends on the qcom,rpmcc-msm8920 binding/driver series.

Signed-off-by: Catherine Frederick (coolguy) <serenity@floorchan.org>
[aneesh: strip IPA node for initial upstream; rpmcc override only]
Signed-off-by: Aneesh Pradhan <aneeshpradhan@acm.org>
---
 arch/arm64/boot/dts/qcom/msm8920.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8920.dtsi

diff --git a/arch/arm64/boot/dts/qcom/msm8920.dtsi b/arch/arm64/boot/dts/qcom/msm8920.dtsi
new file mode 100644
index 000000000000..f2747e5133f5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8920.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023, Dang Huynh <danct12@riseup.net>
+ * Copyright (c) 2026, Aneesh Pradhan <aneeshpradhan@acm.org>
+ */
+
+#include "msm8917.dtsi"
+
+/* MSM8920 uses the MSM8917 RPM clock set plus IPA clocks (see rpmcc-msm8920). */
+&rpmcc {
+	compatible = "qcom,rpmcc-msm8920", "qcom,rpmcc";
+};
-- 
2.53.0

