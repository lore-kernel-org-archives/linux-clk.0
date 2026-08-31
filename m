Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9E03B0AE2
	for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 08:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166262; cv=none; b=oqvI0g8d002KVc1imXwbgomMj/r4fLGcqWf61gbkp7UbXzgUMCt/PsAjgc0UXBIEzCQmGbfRUSIuyzEI+3SsVKAy3TSlS0pPxd2EQMwTyBBDLdi/emQ3hawvbAiM4DfLV8b4H9dKg+SGdNUsMdnbh5ZrVij2pf8FLBatCJV6WNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166262; c=relaxed/simple;
	bh=ae99JVlXv8KhBJcW3GLb3yVSwMLBNmASVYdzcho21RY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FhmopsqWsmJmhi2TOZFCyMdvGJ3ylMOkR4D2EcXVvPVQoth0fgRGoZkdprBpLPPAlO9o5cA3W69M8g175H5HGBhBkZALVSrgwgfzw5tMYKZuxUTJbqiXGJQriRWw0Sb9wcLfzG5yFjzV4JPG71i2QPUUVFvj5ZuqlQEmIFUt88A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lvKF+Zzp; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lvKF+Zzp"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b5ef26b92dso2671190e87.2
        for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 01:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788166259; x=1788771059; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w6f5zaTCHzRQgmPEKk5TD/UO+zjNwknfFQgnjXHiDpE=;
        b=lvKF+Zzp5mthVG5jA5pr/U8mwndGEtjOqIWlZvVooatzqnmUnhZdWD4D/I24j13GF4
         4SUnzfoqaizwGSqbk7PewlypBUmOGzqGsiFqgtt539Z5Hp2MRKAlo2edmKWaJLqYKD9I
         1wfVVz8XFvK4q3YRd/4OuK2eJURiwEOX0HEHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788166259; x=1788771059;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=w6f5zaTCHzRQgmPEKk5TD/UO+zjNwknfFQgnjXHiDpE=;
        b=r9tvGUxv9tVvhkzHvaVWEQ+wTBsdpGfS7oQISxOPhdB/TRsus6yHyyDS/cZ79Q0tCE
         an4V41IhxSafFXRGLvQpRnbDQXlFT+IExYjWwI0BKnDj9JUcuOzjWidQfd5X3jdkBDJJ
         9+PyUQbAGm8cLbSn9Cy9huoL4QsBBhJwwEEg7LTJN/ZnFiUniINGfmfsyczg12ilMaGz
         ulGHgIb+OgihXaoLj+pq0Fo5gl5hxND3/dGMZJf1TkkswIvf6xknfHJUeClvZ1PEpl0V
         wbNn2UA1mZ0utg3f/eJxnK7/mQwPaUGm4k97B+eZDyvD3g2fD8py9GKI+ZhTI1h2aVdx
         AszQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkaYnsa7YOvoypE/Es6PtJEFo25ItKJVIdqlmWrHZ/ppyPA+YMmSJX/8RQPE/KgV3FGNsflFlPhr8=@vger.kernel.org
X-Gm-Message-State: AFuF++lYdMwGdOq3cYugtUP7sysCCbR7FdBO3/F8+0nxR+JhbAnQ6T4W
	/TSkIiw5FX5cb1TyIJahDoJgjdYBzS+pXR0tjU8sQr+KnCobZvIgjZbrSnUE8JkEXQ==
X-Gm-Gg: AYBFou2iRL2F5QnUOPbZa4yzQlbRSX6vGnJugaVBBZLyx5qTWTyeRi+93ijwg3oxkPN
	PT3GB0FhUqrtlmPIaJEvH55ViSeZP8mTHae56Y8GdQR1BZRUYFoHy877KrUrjivrzVTEFdWkv14
	3FrT7CObeEBwYcQIVY6g9+3X9+vxh7LxB2/0BM8WuNYwDhyulko/uwq/mTS90iXj74k0NyPsW7n
	ZmI5fciPTqo8K7vm5zAYtriT5AgK4kOe8YxsXQgTpIEQhncocw18gj4z6g1P9KCD/cTVCAvQV2r
	3+is2VYtZlvrXppvZDG1vcjLYfohuhoSAqBa3u50YW2irX5exxxvsgXTo0JCLznVEUi+b3WCNb+
	nUwf3WovHGnKb5woyByMNfPhN4ilIh67p85oDXYIfdWy3mn7YfUG57s+BlJex11isVEV3KsHkzo
	qsvVmYbVUkQrdB9M6heyrmTCfiVn4JxTLFzNMIG35VYSJotVxTIMh92u4F8CHMermAS5hGuSCUb
	Q2fZ3X6BHa440I+K3FtGoYYpr5dUw94mexfjPc=
X-Received: by 2002:a05:6512:31d0:b0:5b5:e092:c3ee with SMTP id 2adb3069b0e04-5b5fa595f40mr922875e87.1.1788166258698;
        Mon, 31 Aug 2026 01:50:58 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a1cb7dsm1992003e87.78.2026.08.31.01.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:50:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 31 Aug 2026 08:50:56 +0000
Subject: [PATCH] clk: mediatek: Add missing depend for COMMON_CLK_MT8173
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-common_clk_mt8173-v1-1-2d7241f70379@chromium.org>
X-B4-Tracking: v=1; b=H4sIAG9AlWoC/x3MQQqAIBBA0avErBPUsKSrRETZWEOpoRFBdPek5
 Vv8/0DCSJigLR6IeFGi4DNEWYBZR78gozkbJJc115VgJjgX/GD2bXCnFk3FuEKprJFqUgJyd0S
 0dP/Prn/fD+cuZUBjAAAA
X-Change-ID: 20260831-common_clk_mt8173-05e25fc25b51
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, stable@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

PM_GENERIC_DOMAINS_OF depends on OF, by adding a select to it without
adding a depend on OF, the following warning is triggered:

WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
  Depends on [n]: PM_GENERIC_DOMAINS [=y] && OF [=n]
  Selected by [y]:
  - COMMON_CLK_MT8173_MFGTOP [=y] && COMMON_CLK [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK_MT8173 [=y] && PM [=y]

This patch explicitly adds a dependency on OF to solve this issue.

Cc: stable@vger.kernel.org
Fixes: ebd0b73d2137 ("clk: mediatek: Add mt8173-mfgtop driver")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/clk/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index b059d44577f1..ba1ca9c90dbf 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -541,6 +541,7 @@ config COMMON_CLK_MT8173_MFGTOP
 	tristate "Clock and power driver for MediaTek MT8173 mfgtop"
 	depends on COMMON_CLK_MT8173
 	depends on PM
+	depends on OF
 	default COMMON_CLK_MT8173
 	select PM_GENERIC_DOMAINS
 	select PM_GENERIC_DOMAINS_OF

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260831-common_clk_mt8173-05e25fc25b51

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

