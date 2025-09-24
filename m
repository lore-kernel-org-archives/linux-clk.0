Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28CE2D9ED8
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 09:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758707096; cv=none; b=hYnRsp02RPwU8tfJpMU0al/0PJdFfg5e1jV8F7qtPLERXuD4o3hIHBWJZLXd0Q72lomU0FmrBdBoJJnstQQxqZSQYu2TatnmT0Egz9r6acowpjZ6lYN71lgUPJ0E4DqXyWIX6YflWpmGEr0EWESDtbu2dEQqPp1zGMHnz64Gfvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758707096; c=relaxed/simple;
	bh=w5eO9tXRAj53rucPnsS4UWOkqrDkGW0SbludZ3UzkzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HK0PP09JD4L2vim1eRUtH1+Bo9Jz9w++ho29sW9iReidREa3uAQUgu3LHG3AiSYIOsqGMuToozJamkTYfCxPwWP1F6dSd/2sFHC6sskCFTbFBA3siRnq2iEylR6l7xLRWAo9ca9cI8BE2AfCSgjAK3aI26fQsdPnsVgumkif+U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9pMeLkg; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9pMeLkg"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45cb5e5e71eso41203665e9.2
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 02:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758707092; x=1759311892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hH7fDiyFIwd5GKCGsoTM7UQ+n2/6xvaN9QjJ2WXUyBY=;
        b=J9pMeLkgOs5J6cFyolsAJ40ige3A2oejtHlRQyVeX8sUgDG3YlyIzLslNd5X5uYiUL
         ZXUMCTDN3yYRVwqKe7wBF3KizWUG2hQi9O/WuvMEfO53i5VLRfjXBl+X98M7qOVM0ZES
         DKilxb7HwGEUQn1CPNjJDAQvT3CuroFkDGRA7yZJSWZ7q8Vjrfn0HKzTAIWDyDfbcVuw
         V26yz/6R418gVtQTJHehVXRB6JVFaGQglGongrDcvWoZEwFxhozBm0gnqiWPr2dYD3r8
         OCz8EVx4DDLE3mbVHcMLtKz8EVDC9+KbiQ6Lb/qjH5RHlKRSunZp0xkPmu//RwnQ6H5X
         D+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758707092; x=1759311892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hH7fDiyFIwd5GKCGsoTM7UQ+n2/6xvaN9QjJ2WXUyBY=;
        b=eVuPAuXG/hAEnEq1kvRyYFeiLoIZvra0ZwK6l29VNwdLk4wNb+AVz1kd8jNECoxktv
         NX4BBINhHuD3A6J3wIeV1+ustnBsHqtCLiox/DFhoc13IUqPm/i6y36CSx8URuXhmiZ6
         CRZSEtmtEGIQbePLqqdxVHu/ckYsJCfYiYj9cXCEv9EMYVccjzUPgueCoSxkdaFjikAI
         6bHNVqXzU6gjWBWQQ4bi5w6SI7MohXdbWSvixYFygyMhQiCY2wagPBDHs11pI6XvuHuY
         vOf/MLWqwgFxXV0WjCJ45hL4HO+jqkHer4iM0f5LiJTP6UmkpD8PpFya4xGnL7hQaAGg
         wsag==
X-Gm-Message-State: AOJu0YyMXqy7KwBz20I0idsqCzppINL7RzOZJKLbolb2qekRUIYtv7d5
	unoBcGru2zYKbwl+AH8Dq2AYMeSe9lu1W/6nn8/DIOPKlqJYY4CamTkIr5mrJg==
X-Gm-Gg: ASbGncvB0pyD316hGecES9MmEJBFae8CHv2DBq19OBp3sSmpVv3fNT2MqciXUir860I
	AkM2VqiGB1lc4O8b+0rlvfpSzCYPTYC9ZzqG8QBlzSNOAMNla1LN2ZPh2aqxMYjXtqg7EwD46TC
	8IJ/RKokaz0rmqDqDzbOXvnQRSb0Ce9vFS4kwGbb46EKJV49Cp0Ldz9YQhM+xipnBdx91UCwatz
	CHgsM2nDPSvE3R1wlF5Mm7bvr2LZ1Bv+AKY1UWfcq2R8vq25//qvCM/QluzdP4rpWt+hj+qjtNR
	ahdAgAzpnkMElOW9JO95cJv+R1J4tJ6y4lyJgIbD+d4QPkGlZw78+KyS3ys2TYTquEW+R0Zv3Zr
	d0Lxz5+6HrP81lv3AEVU3NRkH36DcPWS7GONmMyeWpUFRPiL96glRIWu6jqfrBkxnbM8da9CNLB
	FONpBday9oSWppRsWNz0sDYELS
X-Google-Smtp-Source: AGHT+IEIpicMOfP08Ui6PtoUDCNZ6++RjL5ZW9INST6VLjpDrbiX7bE7tvizzZ3gSwxM8E2g4eP1TA==
X-Received: by 2002:a05:600c:1914:b0:45b:8adf:cf2b with SMTP id 5b1f17b1804b1-46e1dab512bmr50452905e9.21.1758707091986;
        Wed, 24 Sep 2025 02:44:51 -0700 (PDT)
Received: from localhost (2a02-8440-7503-805b-0076-f865-8f03-23d3.rev.sfr.net. [2a02:8440:7503:805b:76:f865:8f03:23d3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee07407cffsm27184233f8f.16.2025.09.24.02.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 02:44:51 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Wed, 24 Sep 2025 11:44:44 +0200
Subject: [PATCH v8 3/3] arm64: dts: st: set RCC as an access-controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250924-b4-rcc-upstream-v8-3-b32d46f71a38@gmail.com>
References: <20250924-b4-rcc-upstream-v8-0-b32d46f71a38@gmail.com>
In-Reply-To: <20250924-b4-rcc-upstream-v8-0-b32d46f71a38@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4

From: Clément Le Goffic <clement.legoffic@foss.st.com>

RCC now implements firewall access ops to check the access to
resources. Allow client nodes to query the RCC with one firewall ID.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 1 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 75697acd1345..8c0dea2796a4 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -776,6 +776,7 @@ rcc: clock-controller@44200000 {
 			reg = <0x44200000 0x10000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#access-controller-cells = <1>;
 			clocks = <&scmi_clk CK_SCMI_HSE>,
 				<&scmi_clk CK_SCMI_HSI>,
 				<&scmi_clk CK_SCMI_MSI>,
diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 303abf915b8e..fbedf23def52 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1677,6 +1677,7 @@ rcc: clock-controller@44200000 {
 			reg = <0x44200000 0x10000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#access-controller-cells = <1>;
 			clocks = <&scmi_clk CK_SCMI_HSE>,
 				<&scmi_clk CK_SCMI_HSI>,
 				<&scmi_clk CK_SCMI_MSI>,

-- 
2.43.0

