Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09204195962
	for <linux-clk@vger.kernel.org>; Sun, 29 Dec 2024 14:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735483839; cv=none; b=CWi0XMOisxyUXzoZft2u+glRYCrCQnaFY3dShgystcdHgez3fmzOcZS1jdBs+HYQDbHUUdt9ZiuF24VW51YMbvi23fU6KKXH1Oiaa+WeaHZxs/oIlQpgvn/vlifIcXQ/VfbKIg2Bl9YClBuhAjtk8VpKCYOKSiKW42VpnBhgpBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735483839; c=relaxed/simple;
	bh=xUBRrkr1aLPPwLeMGNd5Xto6SUkG0PhtvIzCxxAX118=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sB9Pl2PCMRNjqAXTLmkMqN9tuxWe2yxZGoIcemIGt7SwxWVn82Pp3lg0fyg1gKBVvc/kq4qWFC/AyQl2wfhAP99EssQK8kPUGNo5RlEQ0sVM+RBS3uPE1NP1I3L7cBqKNvR2euwbqOkQVTwNSpGKgEDL5DHjAJzxlmu2bluAxts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=AVrmEmSO; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="AVrmEmSO"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaeef97ff02so714197466b.1
        for <linux-clk@vger.kernel.org>; Sun, 29 Dec 2024 06:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483836; x=1736088636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=AVrmEmSOEOGihK/K3eNASyprPdP2kVAtTHF7GcJp53eiZEkQLrjRIKcwHGHqR8Cu9C
         a8HpqBlPDT0UAiNlCxNfgA12eBNhW95PfvH8TqL4E2Faa8AwMUs9u7WJ4bcdYjs65+90
         1yjq2o0hApmb0VMTXMkPSJAmMds1ud53e8lGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483836; x=1736088636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=kmLON22G/isfOz2bV6oGBWBxeGCoqheB5pCdH4UnmLRzTmLG/93sODh6Wl7a+bnDAP
         Wcpm0sTsmSSal1S7qc1OOAC/On0nSdosWONErl/Th+4d9kU8BxBdI2XxPZ1yegwBB74U
         ssbObdD6RyAsTlCw1t17PWrhS5U/Ckk8ONWjQKXC5CUOvEOAlFn2Xof76QRpOX9VHrld
         l9UUYC9Ee55rIV38bNsmEfjrf/5jK0mwD2SgjD4h6wZCBWlPctEnfDK7jJmGM1pjpDOI
         u8fZZiv517qYPY5gIlW/aTEjvGDwAniXda3zfNEbu1uQ2KailqnCCuvpFQosbYMtxfdS
         fLgA==
X-Forwarded-Encrypted: i=1; AJvYcCXEWrWx2Iu8Sp3O6rfAZuRBnrDQlcC890KC3QgJjMp+w4c2lzh5yEPDgeYbY5CkW547yvBkMgK6AJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YytVP01/wrklzvmAd0sMuCeUXmRqgqWOB9uXy4iUCf52xPXA4oM
	Rs8u83UBQZdK0uGl+1VhyGgyoOwcewPViJ8aFHZxybm1ceJi63eHHljTU6HUW5s=
X-Gm-Gg: ASbGncsoCo8oNtBwfGFWvaaBpuGWLh1fx7A3GYV2gGcKoh5e1xEego2M/TXxxsTrpkp
	kQsrnXVoqVJpwdtcY9XAvTw6EuDsspyVIHPJaPslralYOPnLPEJt6O+TUnLtrbP1qMjPZj/qx2N
	Kvh1jBgreb4aNziUZgFJBJPBRhL70ro8nfBoj6yXIxSEmqs7QfwOpafykctyuxg6UBgnLEuMk5P
	WfI8pQ+1vBc2NWq0Es6r7+/KLfArX1NZOSHS3YNa5Eih+KRyWwarueTvw4lZPuKJnYIQsI3rtnS
	jPLW/n/jqYg27UKS8xIJeA==
X-Google-Smtp-Source: AGHT+IFnuv6eSrJEFnSGoJ55pW6N8ZEy/aXetue0XOxKvCv2upMLBhB089HmsyjDVf6iCwLAHcCppg==
X-Received: by 2002:a17:907:3f89:b0:aa6:9624:78fd with SMTP id a640c23a62f3a-aac3444eb22mr3253470566b.48.1735483836473;
        Sun, 29 Dec 2024 06:50:36 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:50:36 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
Subject: [PATCH v8 03/18] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
Date: Sun, 29 Dec 2024 15:49:27 +0100
Message-ID: <20241229145027.3984542-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v6)

Changes in v6:
- Add 'Acked-by' tag of Krzysztof Kozlowski

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

