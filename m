Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792839690;
	b=DaIDywE0vcm7W+Dfk5203rc6+Cj0bNVIAsjGoQRajor1X+SNk7hcJEIy6EvEcs8Rw9yt
	 vR5cThb2nZ2NDodGpEP0VMlO+MLT6AoAK8inXdaZScZgLSNlSWu11rZ/DOpn8xSdziTnb
	 OycoO2CD3SMMO/ZbS2Bav3NREM83z1SbV/E71MndoE3UwOk3Ia/CVh2Zhn14osK2yICZq
	 4iaxaWMH65u37Wxa1VVakvl8yf5/I0OZdv/HNDACYo6wGzaSPMioYaH08v5krmGk4/0jF
	 L0+o6TkpiM719o6yl+irOP7NLtw7Hf69dwd13FvHrBC3hJxATB9a8mv9QTSptilZU/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792839690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z/AIP7tnKK/4+bwJtDzlzu0jwt67zrCvDiXb/N418ik=;
	b=wl49IqKEjN6TfFQzkMK8R7hbMqOqRJW+BNcZHsADkwmkTG9oWDld5+mcpMjgPj004PIj
	 LuNd+wt+GAlmg61q/V8XEKdcl/CssUNBnXtse/CsyxWjHWGf5HYv3faFZoUIGbl7fE9Bj
	 Xsu0M9uVoDobS3cZKrbn8O2daDze22W2RYVmi3clLljauALDmOaLwqgU98J9RaG5g18oA
	 sEuhZKxZRUri2mEi+cb8q95SKH1dIgl6Phnhtcyg5JBU+MsKyl03dAm+RZZ52SR/1CZut
	 d6r3GQTOCu14aqFJBbWenkAx2DPuKXIjETvmSqWr0qHk7Z+f0gqAiOCzUbbNvtl3SHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NhIpUUiz;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E594D606A31B
	for <linux-clk@vger.kernel.org>; Sat, 24 Oct 2026 11:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E594D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NhIpUUiz
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a218ffa23dso6977515e9.0
        for <linux-clk@vger.kernel.org>; Sat, 24 Oct 2026 04:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792839688; x=1793444488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z/AIP7tnKK/4+bwJtDzlzu0jwt67zrCvDiXb/N418ik=;
        b=NhIpUUizuCr4oq7rqnXBsUKCxO4JcZRB+dC3MpSSLVHuj8O8idnQNu/f16J8a+jjwo
         UzXon4kUVJP66AJolXBJCUjoyRuf6Rj6pqqctvBk560ulmj526cukzLJyuPMcV831B4d
         Y827ZiUQRLfzyTFqQJaUduRU35uW/wxOoKRtGqzMbiXBM8+0wxnM7nYsR0udyDgldFXe
         W209v1tT1cYWlnOj3UG1jS/p2WsL96rpoM40St0JnW9raVJmN4KVpySpajJWD8RiywMq
         Td2nrXHt/tll8fa1C/eudNNv73S1d7KHeEBA1ydE/QaLqw9C1qAqA509qkRxCBrR9jZN
         sfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792839688; x=1793444488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/AIP7tnKK/4+bwJtDzlzu0jwt67zrCvDiXb/N418ik=;
        b=ZMXdDBlM7Q3wC50/auXESX18ihUvDpAwl7Q247qP9+yF8bjlw2lBHXFY5uF0HN+kcH
         HPgrtTAVj9S5icBvFtnyxAdCoAekvApy2FFDMa0D3VP9affujEM3AIk8YOAVF35u00Lb
         iCldVD+5G8Fjanaf69ddNOE2/uB3EWgy5cQBn9q14kPir7F6ag12qoX0igdwmLttuGL3
         REGf1mIGCtR2rlPgWaLmUJ4HfOtX0DW0dMTFPOA94zyS08SoyA8aYeUoTHZ+TpphDSpF
         Z/CpX8nLs2TqmMouHCMjOzQPd1+8oaIT24ts8acwDEOlatUEQnO3n9qYpfvIQG+GgKF+
         NRgA==
X-Forwarded-Encrypted: i=1; AKwUvBxUXaI7I85z6QmRmxIomeQ2KQ6v5lHiI+8n12MIrRQBYPL/o5D8fnys+SfCM4rgQRQOnox7lv/p+2E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXzQAflLC8IAfsJTNPOZl0P3Ek0762sZzuKVM6Zlc+urEQZIHa
	/ZgCxGw94LWDt1Rr/Qtsh1TMSboh3wYUEdKYTICCAkjckylbq0HjPLjp
X-Gm-Gg: AYBFou0uLbJQUgyhbBJm26rHi4o6yYiX8PKywuPMniVFw7Cq4pWYqfdyd+Dz09E7gh+
	6OS0foZ+4pPIpJ3G6Ts2MvAEG4OzkQerQJTe4DJFywj2mFp8Ea31nSCO15LJXc4ZmjwpgYBs2OI
	TOIz3a2WS6PUxL/9NzW3NHPD9Ddf3mjA4I7bRyPR38x9i3G8xmYM6knvMeVP0FmCD8jXoGBNcik
	AM53DXHHZeNaDuS/JSEJdF5ocB/a/GKi6PT2C0VatmmqXBKSYy6ToUfjoOLEEV7xJqUUbMv5C8/
	+ypGKMlgNestsKFjDjw5vaX3DPeyLEeUYQ16t9myq2qMnLz4QEEsUO+y3yz3mK2G57wvBVluuJZ
	ieKmbRcoQucXsLKNvwQE3ZVd6MHs8tyvGLdRDCnDWqOgB6YhGFMYqj9OhJr5XrjyYyRj6wM27Bm
	MAQYSdw1NEk8xTZA/gVk/Ib/PHzVAryk4ZjHWvgozw6AghC9P0Pa1j9yRqzw09o/ZFmFYb7x4K0
	Z/1Di801fN96B3uZTULQLTLarHDZH0DnNPbCMCGkoa+1D98JbY0Yir6be9dEllKFo0WSnq4r+4+
	drhhv5v/vfg8LN/WpDwlKJDj20ZuvmVrcelXNOB2oIy1vgw1avEwoKwqHZEMmzNl7xjPbCFbEDt
	7Ia/6g8jH+YWQYwmyXZZP31KgyQlNmGklgQW0M5TnkrPIhyrs/hhe2Ey7W3Q=
X-Received: by 2002:a05:600c:5307:b0:4a1:d456:ddc8 with SMTP id 5b1f17b1804b1-4a35ac8bb56mr24174315e9.7.1792839688051;
        Sat, 24 Oct 2026 04:01:28 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9da9-5f01-d5f0-7ecf-afa4-4bc6.310.pool.telefonica.de. [2a02:3100:9da9:5f01:d5f0:7ecf:afa4:4bc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm56863845e9.1.2026.10.24.04.01.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 04:01:26 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: tegra: Fix Tegra210 IQC2 clock lookup
Date: Sat, 24 Oct 2026 13:01:13 +0200
Message-Id: <20261024110113.63341-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gate_clks[] uses tegra_clk_iqc1 for both iqc1 and iqc2. On Tegra210,
gate_clk_init() overwrites the TEGRA210_CLK_IQC1 provider entry with
iqc2 and leaves TEGRA210_CLK_IQC2 unpopulated, so looking up
TEGRA210_CLK_IQC2 fails with -EINVAL.

Use tegra_clk_iqc2 for the iqc2 gate.

Fixes: 88da44c5edb9 ("clk: tegra: Add missing Tegra210 clocks")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested on a Jetson Nano 4GB (Tegra210) with a small probe module that
calls of_clk_get_from_provider() on the Tegra210 CAR node. Unpatched,
TEGRA210_CLK_IQC2 (220) returns -EINVAL and TEGRA210_CLK_IQC1 (221)
resolves to iqc2. With this patch on 5b0764a53235, ID 220 resolves to
iqc2 and ID 221 resolves to iqc1.

 drivers/clk/tegra/clk-tegra-periph.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 4dcf7f7..47bb657 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -813,7 +813,7 @@ static struct tegra_periph_init_data gate_clks[] = {
 	GATE("apb2ape", "clk_m", 107, 0, tegra_clk_apb2ape, 0),
 	GATE("cec", "pclk", 136, 0, tegra_clk_cec, 0),
 	GATE("iqc1", "clk_m", 221, 0, tegra_clk_iqc1, 0),
-	GATE("iqc2", "clk_m", 220, 0, tegra_clk_iqc1, 0),
+	GATE("iqc2", "clk_m", 220, 0, tegra_clk_iqc2, 0),
 	GATE("pll_a_out_adsp", "pll_a", 188, 0, tegra_clk_pll_a_out_adsp, 0),
 	GATE("pll_a_out0_out_adsp", "pll_a", 188, 0, tegra_clk_pll_a_out0_out_adsp, 0),
 	GATE("adsp", "aclk", 199, 0, tegra_clk_adsp, 0),

base-commit: 5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
-- 
2.39.5 (Apple Git-154)

