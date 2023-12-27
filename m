Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C1024B2A
	for <linux-clk@vger.kernel.org>; Wed, 27 Dec 2023 09:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eDIFHZLL"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6d9b51093a0so1702817b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 27 Dec 2023 01:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703667905; x=1704272705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqybA8kGXGwS0p6VfCaZS7VsH26LSz7rBgi0KXqcQ7I=;
        b=eDIFHZLL0FxF5QSvJLxK1ALZKQCI/hE75enT1/3GkrZ/L/8nII7yLLlHhm/sgoExEB
         08K8nohMfsKziIn/MCqY82WE+dGuMjhMPw+4IIS7I5Z4GfLX2alWhfgYGggSbPKDtIwm
         Kr5O3lh3AJQqpPr5H4/aKgrvGcST5NzJ4oFdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703667905; x=1704272705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqybA8kGXGwS0p6VfCaZS7VsH26LSz7rBgi0KXqcQ7I=;
        b=t5vioOmKvhtf1bTijJSqY61cgFqUAtT6QXJZQvuUug2LhDrrok+BvIVsDp81PBMUf5
         63200mTQmMl0XJOzNVjThOk3bv9gvxbGUgMPk8xI4iH4o+kAC0H3yhcYvD0kv8T3tC9Z
         GxzUjW/1gKRFZrtKodNMENI8HLyX04kjujgwNRHmzMsZ479R9L8ZSUgswWhvc8akKKXA
         6x+MlRkYKd2vOcszu4tLFIJ5I/BiiF2NreDKPjPFBNBU3Ymq8yYxO7mxo6kv+7MxOqhE
         rccbv0sWlaqvOmrKbLwoTsz/PIFBumn2UlDHYcfyXh469cYY3Q5WiPLRvzmcREeePepH
         YoWg==
X-Gm-Message-State: AOJu0YykmqIB83R+docefoj0LsfzBe/FNE2JAmzD6SAbgKtwbBwOcN4h
	+8LtnK3PRsjah/Kk9IRtuubcmcacBuTa
X-Google-Smtp-Source: AGHT+IHzLN+1pxxIuXsPLSje0l/zdsr5/VBgqdxz5v1VViJZw0E1DLI5tn6YlpQiPS6VAvJrCPbvFw==
X-Received: by 2002:a05:6a20:938d:b0:196:2c8b:9f21 with SMTP id x13-20020a056a20938d00b001962c8b9f21mr200388pzh.112.1703667905699;
        Wed, 27 Dec 2023 01:05:05 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:18d2:7869:e8b9:f4e4])
        by smtp.gmail.com with ESMTPSA id v22-20020a056a00149600b006d9b65d1a8esm5347701pfu.28.2023.12.27.01.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 01:05:05 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Pin-yen Lin <treapking@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-kernel@vger.kernel.org,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] clk: mediatek: mt8183: Enable need_runtime_pm on mt8183-mfgcfg
Date: Wed, 27 Dec 2023 17:04:43 +0800
Message-ID: <20231227090448.2216295-2-treapking@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231227090448.2216295-1-treapking@chromium.org>
References: <20231227090448.2216295-1-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mt8183-mfgcfg has a mutual dependency with genpd during the probing
stage, so enable need_runtim_pm to prevent a deadlock in the following
call stack:

CPU0:  genpd_lock --> clk_prepare_lock
genpd_power_off_work_fn()
 genpd_lock()
 generic_pm_domain::power_off()
    clk_unprepare()
      clk_prepare_lock()

CPU1: clk_prepare_lock --> genpd_lock
clk_register()
  __clk_core_init()
    clk_prepare_lock()
    clk_pm_runtime_get()
      genpd_lock()

Do a runtime PM get at the probe function to make sure clk_register()
won't acquire the genpd lock.

Fixes: acddfc2c261b ("clk: mediatek: Add MT8183 clock support")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 drivers/clk/mediatek/clk-mt8183-mfgcfg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
index ba504e19d420..62d876e150e1 100644
--- a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
+++ b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
@@ -29,6 +29,7 @@ static const struct mtk_gate mfg_clks[] = {
 static const struct mtk_clk_desc mfg_desc = {
 	.clks = mfg_clks,
 	.num_clks = ARRAY_SIZE(mfg_clks),
+	.need_runtime_pm = true,
 };
 
 static const struct of_device_id of_match_clk_mt8183_mfg[] = {
-- 
2.43.0.472.g3155946c3a-goog

