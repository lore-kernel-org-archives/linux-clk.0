Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200F81EF09F
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 13:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731074341; cv=none; b=KFvOLwquQIN2uMJMFhN88EMBfgRMoPni0EcfRh1evWOpCFSx6qCs8MKpW7R2ay5+0eNxMGDkXRfZ2phGbDAbIhcoik7jj7v4NJQi0dFrJIUAtj6w3LQX+opvcoFt8O6mcD5EAzBNPjQdGWqtZDfy9+UBI7AP+dPEQsyWmyoUdhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731074341; c=relaxed/simple;
	bh=VJCrnUUdGei/ZnbWKo/IVdIKLNCrBMpKE8oFEy+MEtw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NoTn5qg0K2aQYbNxGCdFGCuyDEDm4b8YvbxkERK9k6cbFdhmvCLMB/LFAHLF1/udTE7CPkoIHoGTAH5DzV82I/ODh5kQl3gsKVG9xWjOwmaSTqTFtpK20OvRWBy6wGxCfjOFdbKvQPvM0zLkBDSK+JEXB07D8UnPyqneWFXWg1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=aokS2xF1; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="aokS2xF1"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so18977485e9.0
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 05:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1731074338; x=1731679138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=19nNoiZMI2JgXeIpnibERXoHDynmYT61X0LDoD+6J9c=;
        b=aokS2xF1F/Mi5SLlcydh7o8RUauswrA9c52O8DFGYKy7+g+Iow8tk4b5eVMWD+Ne6K
         tVk9aXOsXEm3WV+P1hmFDgHv55o6vihvNfhJHIDGo704McJL9Uh2U35A2OYBf/ii9kAA
         GTllmrCgc2sg1Y0Iq7Q0BNypXNe1XfCWMGEDGQWM3gLgr7/EzBExuMnluUYSw+/6YgYA
         fI+VMnJU19ZWlSZ8ftsLX04ig8BPK/uUrQQ3NEEE9aihwah9X2JyE4qkCwxO5psYy5Er
         /8fSSjGlIrggx+QF80+Xk1SnynWjnTYYlfZXYUx48P54PDbgsGiF3WAdDTTNqsf9TXf7
         sjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731074338; x=1731679138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19nNoiZMI2JgXeIpnibERXoHDynmYT61X0LDoD+6J9c=;
        b=aiQSPtZMGgEGvTcyK9ps7QGumG4PlXCgBtQ4mnTfbEUtDN/fzjAoH6321uI3HVsMYt
         4m57w6EjgtWkC33xX3/WLizja8m/+B0BUxRTqHyAPJn48BfHG7E1kMCfrMUkyZo8Abj8
         +qc4qjddQ5geG1tdZTLMrjWYh49ym4XFFmyaAJ5UDLki00E33BhB1rl+SYa2ka2cdkho
         kY3h5Ikr+YzcjM2l640F7ActxLU+gamJlEI7pZy2TAJ9YA+KIR4lzMh94T0JnjPvTFWV
         l4yiDUt3akUWups7XGFMfvWFRfwVSCXFROBO8RsXYnR76f+QMJIb7xD0pFOuOknG43/a
         /T+A==
X-Forwarded-Encrypted: i=1; AJvYcCXDewlFqwqlUCNIgw4NVRVEirNVVfjVRHtmMUD+gZkuNjJZTpiYjPbvDWa9zhBzBCht/vw5kwa+yoo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuvM8YJ/lAJXcdDlu965KeQ6QWMRO21KC462KiMKAFWMZQJFHq
	edHr6EU5R+tTsHbGVFLMBHDx3K+VVY85nOHfFBYlQeskOAcsmXzYUj7eNFMG7UY=
X-Google-Smtp-Source: AGHT+IHddZyZHnBvXvpwpiOFOpBw0pB+ps3Rxlk3QlAmQ6sdQYs/NNEYqY/D3vFEUDZaWTay7pUGFA==
X-Received: by 2002:a05:6000:401f:b0:381:b68f:d14b with SMTP id ffacd0b85a97d-381f182fc02mr2476225f8f.45.1731074338350;
        Fri, 08 Nov 2024 05:58:58 -0800 (PST)
Received: from fedora.. (cpe-188-129-46-99.dynamic.amis.hr. [188.129.46.99])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381ed97cd97sm4924431f8f.27.2024.11.08.05.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 05:58:57 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lee@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 1/4] arm64: lan969x: Add support for Microchip LAN969x SoC
Date: Fri,  8 Nov 2024 14:57:31 +0100
Message-ID: <20241108135855.129116-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the Microchip LAN969x ARMv8-based SoC switch family.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Add forgotten LAN969x architecture support itself

 arch/arm64/Kconfig.platforms | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 6c6d11536b42..4650ad3674aa 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -128,6 +128,20 @@ config ARCH_SPARX5
 	  security through TCAM-based frame processing using versatile
 	  content aware processor (VCAP).
 
+config ARCH_LAN969X
+	bool "Microchip LAN969X SoC family"
+	select PINCTRL
+	select DW_APB_TIMER_OF
+	help
+	  This enables support for the Microchip LAN969X ARMv8-based
+	  SoC family of TSN-capable gigabit switches.
+
+	  The LAN969X Ethernet switch family provides a rich set of
+	  switching features such as advanced TCAM-based VLAN and QoS
+	  processing enabling delivery of differentiated services, and
+	  security through TCAM-based frame processing using versatile
+	  content aware processor (VCAP).
+
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
 	select PM_GENERIC_DOMAINS if PM
-- 
2.47.0

