Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FD328DBD
	for <linux-clk@vger.kernel.org>; Mon, 19 Feb 2024 10:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708339892; cv=none; b=UNQbBbz6AOVw9TZUt8iCkzrc5VNUj5u+UIeKB02M8VW8gHEvwEqlT0fMVvCincmSa7XaSXyglStGdW5ueAjPOIwNfo/ykoQqYwDSmItBG7KwDiAKOs+YD5K1Oj6UuNRDTVa85vpJ9QyFx1EQFM8LsEUsVJBm4IWacoveAEb/fKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708339892; c=relaxed/simple;
	bh=1kduv3wsXHoy8j19LVAOeFeOJlRIBbn+iYy1T77WYB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wfk7xg915tPf+wltU04+kx3RpiHwaRMAr2e6+a0E2hK5vlvOBBiCWwnkbzFUiqe4OoJAQE6aAtJRtr5nffn5mfXjFnC2ty75/QwSxpW27RCHb+gO+9Pyzx+e8o2LHa0ZHqCTn0TTRRtjgbQzQ9JDr7Lo4Wu3qm9pPg37psPeFlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fh4i/OOb; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fh4i/OOb"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d94323d547so26676545ad.3
        for <linux-clk@vger.kernel.org>; Mon, 19 Feb 2024 02:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708339890; x=1708944690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/L4TPn2Q4JShJP0yVub7epn9w+mmtxiJMbsQbqv5v8k=;
        b=fh4i/OObzKrK/OvixOGSE51X+QCpwbU1oahhhNbyoJPv1MIkozzK42Wy1PSJQAHCj+
         nBVc47rab7VAR3mribu6m7o2LE6ZvdNyBw9Ik0ES2lTi16Rbr9qoOMUxDd1p31yyLvBx
         FZ4D+whiQsPWvGdp3M50qQ1GOTvuYam7sasOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708339890; x=1708944690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/L4TPn2Q4JShJP0yVub7epn9w+mmtxiJMbsQbqv5v8k=;
        b=LqgIIxAoL8nGdAr5Xt596ylss3YTlcn4vnanKiSdPvafAZ4LvSShHxMvhJXAGbU+/6
         PKfODcAQF73hoYRvuuPrCW6pLDV1sACWbTIrcXiMkHdlXqsNECfbIS0JlqscSFJ+f0aC
         /GCbmZkX5ytkFdMEI5Oovph9OLMsfZDGPE3U8o9SuNTBq8JFpynJy+YVjk77vNqfMjjo
         VA0AXm6DYr4l6MzIcA0uh24tLqNzSOxzzRbK/nJ69AxmUH+qBBa9E76oqgkvLPr3YOgt
         1wLcxFO0FemMObrJA1bsXpm/QdFr7qPPK0x4/XDjwD/Jm1NFXeiDgHN/aNyj7TRUltHT
         gBcg==
X-Forwarded-Encrypted: i=1; AJvYcCX4SJujySyx9J+mKSNtVcmY1G1HZPqOtxaNU5XYlA9WEvEEm8Dcvv/DEhlDqYz7FRdyKEaaFE5A84x9jLxAuXLxe+H9eNKNRazt
X-Gm-Message-State: AOJu0YzIFZtMIw4ER5cO+ZGI/XXAgsfqCi4/FUEZ8fa104Wum8LM+GNp
	eEHe3P2kOpuaMvC6PHlE4UKBfwQKyEFbb5rffEnZcDxLUsWOVhgknfWljLDNIQ==
X-Google-Smtp-Source: AGHT+IHPxsNk8CcRBmex8+7iHAv2rbVy7LnqzC7zcg3vEHr8P63/RN+y2pbr/3u9rT1dt5y2Af/XIg==
X-Received: by 2002:a17:902:f542:b0:1d5:dac4:5015 with SMTP id h2-20020a170902f54200b001d5dac45015mr13208265plf.11.1708339890465;
        Mon, 19 Feb 2024 02:51:30 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:36aa:521a:5948:9614])
        by smtp.gmail.com with ESMTPSA id jh19-20020a170903329300b001d8edfec673sm4112281plb.214.2024.02.19.02.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 02:51:30 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt8183: Correct parent of CLK_INFRA_SSPM_32K_SELF
Date: Mon, 19 Feb 2024 18:51:24 +0800
Message-ID: <20240219105125.956278-1-wenst@chromium.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CLK_INFRA_SSPM_32K_SELF has the "f_f26m_ck" clock assigned as its parent.
This is inconsistent as the clock is part of a group that are all gates
without dividers, and this makes the kernel think it runs at 26 MHz.

After clarification from MediaTek engineers, the correct parent is
actually the system 32 KHz clock.

Fixes: 1eb8d61ac5c9 ("clk: mediatek: mt8183: Add back SSPM related clocks")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8183.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
index 6e23461a0455..934d5a15acfc 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -790,7 +790,7 @@ static const struct mtk_gate infra_clks[] = {
 	/* infra_sspm_26m_self is main clock in co-processor, should not be closed in Linux. */
 	GATE_INFRA3_FLAGS(CLK_INFRA_SSPM_26M_SELF, "infra_sspm_26m_self", "f_f26m_ck", 3, CLK_IS_CRITICAL),
 	/* infra_sspm_32k_self is main clock in co-processor, should not be closed in Linux. */
-	GATE_INFRA3_FLAGS(CLK_INFRA_SSPM_32K_SELF, "infra_sspm_32k_self", "f_f26m_ck", 4, CLK_IS_CRITICAL),
+	GATE_INFRA3_FLAGS(CLK_INFRA_SSPM_32K_SELF, "infra_sspm_32k_self", "clk32k", 4, CLK_IS_CRITICAL),
 	GATE_INFRA3(CLK_INFRA_UFS_AXI, "infra_ufs_axi", "axi_sel", 5),
 	GATE_INFRA3(CLK_INFRA_I2C6, "infra_i2c6", "i2c_sel", 6),
 	GATE_INFRA3(CLK_INFRA_AP_MSDC0, "infra_ap_msdc0", "msdc50_hclk_sel", 7),
-- 
2.44.0.rc0.258.g7320e95886-goog

