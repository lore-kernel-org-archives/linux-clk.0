Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6401F8666
	for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 16:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318649; cv=none; b=Drjhif8Bq9ANxN8giLoM39aEtwCcpfTajllsVA2zR+SF10NYiEvnXcOsUjRzXky1dHxUdIWZUsr2Ru8jVmrZgLSv619myiTSFJOI93Fc9FFiFT9V29ai2r2mMXg4o92r/PU8M3CVhP3me2EQQxllqlFjfXjbmup5/hsbQjG1R+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318649; c=relaxed/simple;
	bh=+1wDCnUf6V6waC2u4F0CjceMoJUJQ3m5duPgNX1wMjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ftA5kTy6BRIx4iFv40cya43P/ZE0Y3zWeEzy71CLpmOMVQDaSuTCuXFrZy1lUXV8gZHFl+YHmjOeqM7bKpIiTaqEulL/n6RNKTYFW+UY8FXAi77HgcsofzMRirsmQdk9h+W8Jf/8NQuEujFz888dnx9H2m9XO3z2Th4lNcNoKBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=eyl4VRCD; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="eyl4VRCD"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaeef97ff02so519557766b.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 08:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318645; x=1735923445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=eyl4VRCD9EM5XtwEMUi5XHUsqiip8hcsZ51LRkRgn/Jz0xwYGP0B/HnrGBg1W2Q9UF
         qzyLp71TtJzCva95Poamaypoff775fYCFQJ2YFYxbj2zCWvXWLVbjBRirtjv+Tw0deAF
         NlJw0DFYcCJWp6nJLwrSUNyo1zlIBoGtqXb24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318645; x=1735923445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=wy2WvqXsfI3Enk0Zy8FnAv506o+K8kRfLLNc5LgL9xg410xhr5TxiXl6YX6AGguxuE
         LR1bOJco7N/JA8tXOxR833RWl/IkYtzHMYte9woFq/DR8vzMOdGrqvQDKgoeUmoMiVyN
         l5jkQOjb+Vl5uHA9t9rnhZ68MfCkm+riQ3ZqoGibrBgiCRHmX18iDh/0kudli8BNmjum
         8sX2AEt6O0zysAP130cJ1xGdraw20u2BnfGGKHyImLfs+HVe2NPrII4nqBktWqfObpiU
         Bc+yl+QOhXiaK/aRo7zUPh+7QTXFDBfzWnyO0xXQgKIZl/vXottjgjVQ7NK3EOsbLI3Q
         90DA==
X-Forwarded-Encrypted: i=1; AJvYcCWAStRvjtu48Z8mVnA2KXn14ZvAA8uvalRHaAeM3yvjUmgxMD6TCydlJV4VIHuUNSwRZ8+q6bbdQA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyspLds4ug726Bk+PlB2YYFL6q7UIxfe7LosYkeRhinNXrzzWdS
	167ZnfQhkDTlQ53FnmfbUcccZbil8J4I0v2MZojW+JGiTQmY34Ec4qRGvo+gm6E=
X-Gm-Gg: ASbGncttbmUNlqQ52ZPIJhKWa438x54VMuQiJUMipEyIstbL4KldPMUKEvCFcr6FMor
	l6GwX0cX++Qv/zS+wzLnn1ABvJGHpHOOIgjzZQLTSXq9/+y/upcMtMsAqBVtzEN1WGR1mjEoR33
	AXeuHe1jvvW5QDvk/0Sam31kpJFl427dhv338LJEPrpwoTqTmKbBGMCsM9inSp5QTSi5DyVVkxs
	0NE4LCWnzF2uJ1aGZct5UAe6Xf6iWorufJXZmjceNseTVlO/43t3U7mQLAInQJVm58bESBKfsPn
	/De1dLsaNdDBno+Sq4y3Ww==
X-Google-Smtp-Source: AGHT+IF2wAZiZXOhSk5ioYTNrzhfdCszg+K/Yp9x5T8NwwqXN7bzl3LV9Ed9BE9UWV7Fx+sow9CFjQ==
X-Received: by 2002:a17:906:c106:b0:aa6:7cae:db98 with SMTP id a640c23a62f3a-aac2d447333mr2312573666b.10.1735318645446;
        Fri, 27 Dec 2024 08:57:25 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:24 -0800 (PST)
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
Subject: [PATCH v7 01/23] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
Date: Fri, 27 Dec 2024 17:56:04 +0100
Message-ID: <20241227165719.3902388-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
name used in the RM is video_pll. So, let's add the IMX8MM_VIDEO_PLL[_*]
definitions to be consistent with the RM and avoid misunderstandings.

The IMX8MM_VIDEO_PLL1* constants have not been removed to ensure
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

 include/dt-bindings/clock/imx8mm-clock.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/dt-bindings/clock/imx8mm-clock.h b/include/dt-bindings/clock/imx8mm-clock.h
index 1f768b2eeb1a..102d8a6cdb55 100644
--- a/include/dt-bindings/clock/imx8mm-clock.h
+++ b/include/dt-bindings/clock/imx8mm-clock.h
@@ -16,7 +16,8 @@
 #define IMX8MM_CLK_EXT4				7
 #define IMX8MM_AUDIO_PLL1_REF_SEL		8
 #define IMX8MM_AUDIO_PLL2_REF_SEL		9
-#define IMX8MM_VIDEO_PLL1_REF_SEL		10
+#define IMX8MM_VIDEO_PLL_REF_SEL		10
+#define IMX8MM_VIDEO_PLL1_REF_SEL		IMX8MM_VIDEO_PLL_REF_SEL
 #define IMX8MM_DRAM_PLL_REF_SEL			11
 #define IMX8MM_GPU_PLL_REF_SEL			12
 #define IMX8MM_VPU_PLL_REF_SEL			13
@@ -26,7 +27,8 @@
 #define IMX8MM_SYS_PLL3_REF_SEL			17
 #define IMX8MM_AUDIO_PLL1			18
 #define IMX8MM_AUDIO_PLL2			19
-#define IMX8MM_VIDEO_PLL1			20
+#define IMX8MM_VIDEO_PLL			20
+#define IMX8MM_VIDEO_PLL1			IMX8MM_VIDEO_PLL
 #define IMX8MM_DRAM_PLL				21
 #define IMX8MM_GPU_PLL				22
 #define IMX8MM_VPU_PLL				23
@@ -36,7 +38,8 @@
 #define IMX8MM_SYS_PLL3				27
 #define IMX8MM_AUDIO_PLL1_BYPASS		28
 #define IMX8MM_AUDIO_PLL2_BYPASS		29
-#define IMX8MM_VIDEO_PLL1_BYPASS		30
+#define IMX8MM_VIDEO_PLL_BYPASS			30
+#define IMX8MM_VIDEO_PLL1_BYPASS		IMX8MM_VIDEO_PLL_BYPASS
 #define IMX8MM_DRAM_PLL_BYPASS			31
 #define IMX8MM_GPU_PLL_BYPASS			32
 #define IMX8MM_VPU_PLL_BYPASS			33
@@ -46,7 +49,8 @@
 #define IMX8MM_SYS_PLL3_BYPASS			37
 #define IMX8MM_AUDIO_PLL1_OUT			38
 #define IMX8MM_AUDIO_PLL2_OUT			39
-#define IMX8MM_VIDEO_PLL1_OUT			40
+#define IMX8MM_VIDEO_PLL_OUT			40
+#define IMX8MM_VIDEO_PLL1_OUT			IMX8MM_VIDEO_PLL_OUT
 #define IMX8MM_DRAM_PLL_OUT			41
 #define IMX8MM_GPU_PLL_OUT			42
 #define IMX8MM_VPU_PLL_OUT			43
-- 
2.43.0

