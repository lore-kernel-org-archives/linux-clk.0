Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203561F4737
	for <linux-clk@vger.kernel.org>; Thu,  5 Dec 2024 11:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397591; cv=none; b=pO2PgWu7KkH6cuO5qMMxwmfRNzntu8xQiRwKV+nu1C5Qz1oILTBaYhEn3WFJ1tuev6caRdQNaTckAzd+KdbJKECpIrPk5/4drDUGHSjsEZhQuhzST7w0bfCtxEwQeOPrtyQXsDFH3dEyeiy6Xb7132p9tGYqo2qIIuk9uLKB1Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397591; c=relaxed/simple;
	bh=maUm8Wtz4uhoJlDQ4e0Kldd0ifg3+fK7gvr5q8t40fQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bau6pL+s5bW4E/uzzlKBhOWUEX6ea4J1tOz4C4Dvyo0Vb7uB8AClM+dEvaBnX+cyj2c7Tfc6nkbkVJKLjY/2P3Sx9XLDqfc6noLuYAy3fWMenEd76xA6vcADXO9VatMqrPXu8jF9eYLhwzj98FdrqqVDSpfDrepNck3wJFe+v1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=GTXaWvie; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="GTXaWvie"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9e8522445dso140909266b.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Dec 2024 03:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397586; x=1734002386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfJsRcPD/8EPzi0YLbSU3Cc8teD2P8WEd5mYwYdJZ8c=;
        b=GTXaWvieZ8UbgJVEpPmfYcq7loC7RmWanExxebWTIxe/OGmmGq1kRT7t6pQsmg4qp5
         +lU0BGz5t5gcwZQO13Q/tpi+iM4M+H4BzUFn8ZEZwU69OmcxDnxe/pqiJlOqT2tT4nmm
         AvVNT6v9BdnWwbO29eCQj0tQx7G7KwpCraO9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397586; x=1734002386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfJsRcPD/8EPzi0YLbSU3Cc8teD2P8WEd5mYwYdJZ8c=;
        b=AuT8Gkpt3+QZJXHPsQVKKFRlhaxbHZ1e26UVLRKPbZpSS7pZlFysjhSsWZZ6SeYwq6
         ByIQpT/Zogce5yQlyaQjChffC0XYtUhDeBBPlXAFAfiGQ60MS/g3ihPE2bUQ9WraxsRD
         e3emNCyVDNHTmNwIJeuovA5hMPm7ZYuypOcUGyS0uOEoZYFR9TSUbqxjFv/t3dQWML5a
         aoIqVXIwEcviD/EGVczdornz3OmgPjeCnUpXuDHzaMyW1cPoOuXW5ntKjnPHSMpp27JF
         A6xdgCf2hi/aMF+xO2hau98Up+Ul9MkCjiyYChaGp/N2Mxf6hONG36VEigdJxBBatysx
         aNPw==
X-Forwarded-Encrypted: i=1; AJvYcCU1pqwwNSPVbl2xntW4pRkhAM4ER9QNXAJoQ7xvlHj/38zNqH6D3MgGgyrVWmdqIoscLN2ZJRWeVH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVTDlgKmgin2yfrouQTpEW6g7likZMLKE+cvMHL30OpbLmEEUY
	EHhXiIF2QMAvV+l6AghAf8l4YQMozY/EijW3imKfzSqtWIgPnlovfru06UIscBM=
X-Gm-Gg: ASbGnctHEJGEnfevIYup+gF02fOxgt3bH2G5V7SCjt+GCi7BpXbdUPEqv2JguRvmwHy
	fkXcM8m8ToBvluXuxGUq4vZyAODCvCducotgj4czYxYxrlgH2delU5160xwg4ZiAlp8jYpDGxSR
	mzsJV0qDygyVA9sGuQgdBCg1K+b+c8/TdBk1GtIpqkezZynmsZqz9rYKhBzfhMeQSD69gCyd++k
	xRhFTQtfR+LhWhx1otpAHA/YucrqTCloyNp374ApThkjgPdPWoiFJTUVWpA6afnK9jaTPaKbqgF
	UBGmJ8XQdP4qQXB4/+/c2ruuqlSprgHxsE8a+bsjBNXB+w==
X-Google-Smtp-Source: AGHT+IEvMCFVKhXQs/BEo9XGkjUrPVab4oCHkJg6oXUg3V30XKOK2YMJHs4Q4VAghsMiMHhIuTdfyg==
X-Received: by 2002:a17:906:1da1:b0:a99:3c32:b538 with SMTP id a640c23a62f3a-aa5f7ecdd96mr850956766b.42.1733397586585;
        Thu, 05 Dec 2024 03:19:46 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v5 03/20] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
Date: Thu,  5 Dec 2024 12:17:38 +0100
Message-ID: <20241205111939.1796244-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
name used in the RM is video_pll. So, let's add the IMX8MP_VIDEO_PLL[_*]
definitions to be consistent with the RM and avoid misunderstandings.

The IMX8MP_VIDEO_PLL1* constants have not been removed to ensure
backward compatibility of the patch.

No functional changes intended.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v5:
- New

 include/dt-bindings/clock/imx8mp-clock.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
index 7da4243984b2..3235d7de3b62 100644
--- a/include/dt-bindings/clock/imx8mp-clock.h
+++ b/include/dt-bindings/clock/imx8mp-clock.h
@@ -16,7 +16,8 @@
 #define IMX8MP_CLK_EXT4				7
 #define IMX8MP_AUDIO_PLL1_REF_SEL		8
 #define IMX8MP_AUDIO_PLL2_REF_SEL		9
-#define IMX8MP_VIDEO_PLL1_REF_SEL		10
+#define IMX8MP_VIDEO_PLL_REF_SEL		10
+#define IMX8MP_VIDEO_PLL1_REF_SEL		IMX8MP_VIDEO_PLL_REF_SEL
 #define IMX8MP_DRAM_PLL_REF_SEL			11
 #define IMX8MP_GPU_PLL_REF_SEL			12
 #define IMX8MP_VPU_PLL_REF_SEL			13
@@ -26,7 +27,8 @@
 #define IMX8MP_SYS_PLL3_REF_SEL			17
 #define IMX8MP_AUDIO_PLL1			18
 #define IMX8MP_AUDIO_PLL2			19
-#define IMX8MP_VIDEO_PLL1			20
+#define IMX8MP_VIDEO_PLL			20
+#define IMX8MP_VIDEO_PLL1			IMX8MP_VIDEO_PLL
 #define IMX8MP_DRAM_PLL				21
 #define IMX8MP_GPU_PLL				22
 #define IMX8MP_VPU_PLL				23
@@ -36,7 +38,8 @@
 #define IMX8MP_SYS_PLL3				27
 #define IMX8MP_AUDIO_PLL1_BYPASS		28
 #define IMX8MP_AUDIO_PLL2_BYPASS		29
-#define IMX8MP_VIDEO_PLL1_BYPASS		30
+#define IMX8MP_VIDEO_PLL_BYPASS			30
+#define IMX8MP_VIDEO_PLL1_BYPASS		IMX8MP_VIDEO_PLL_BYPASS
 #define IMX8MP_DRAM_PLL_BYPASS			31
 #define IMX8MP_GPU_PLL_BYPASS			32
 #define IMX8MP_VPU_PLL_BYPASS			33
@@ -46,7 +49,8 @@
 #define IMX8MP_SYS_PLL3_BYPASS			37
 #define IMX8MP_AUDIO_PLL1_OUT			38
 #define IMX8MP_AUDIO_PLL2_OUT			39
-#define IMX8MP_VIDEO_PLL1_OUT			40
+#define IMX8MP_VIDEO_PLL_OUT			40
+#define IMX8MP_VIDEO_PLL1_OUT			IMX8MP_VIDEO_PLL_OUT
 #define IMX8MP_DRAM_PLL_OUT			41
 #define IMX8MP_GPU_PLL_OUT			42
 #define IMX8MP_VPU_PLL_OUT			43
-- 
2.43.0

