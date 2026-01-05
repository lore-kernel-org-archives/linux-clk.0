Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD34D26AAAB
	for <linux-clk@vger.kernel.org>; Mon,  5 Jan 2026 14:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767621992; cv=none; b=K0m3xWqUb/BJ9WHjTvtOiQssaMrCb5dJAgR6WNpTO9Li3JvBEXPv+nJEQff6c5ook9/w6m2tbTw6CoW3+eI8e5T7nEfcPlhfyMktS+xvUsRDt875jPjZZijOz+CkEus+3Yn+oVGmo6uNNTY3xJDmHXbaq2pVcU94vgseft72TQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767621992; c=relaxed/simple;
	bh=YDm68YWhw+GEjf0gozJmWl/ojKKZcva9ZQA+L2+6sjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=myZEI8HEu1o6VHyGd0CBL796v0E6pPIFMVHsJoYRCezu67QhZcAYk3t+WIaw920FiP3hkFY0OXeFNyrstNWpA+YShSlJ8m55gaGKSy1e6TyqPTMjJ+OfQJhIenLexYYBvSHHprW5KBxDBtHaofMyHl6Uer1MrAx48jFVjFfIDVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfY0BrIT; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfY0BrIT"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4327790c4e9so3101709f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 05 Jan 2026 06:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767621989; x=1768226789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hOJglpam6Y6tV/ZKx1vMYagmOMEwuqgdfcTZ8FECwao=;
        b=bfY0BrITyJmlzAuK4dl2gKORFURQMa5qUWtsIk1z7hdhyxnaSoukrin8kyedcEBDog
         DwjWDOeXM8bTDQGKrCfKT6PLUidxANICUHqOiOnaCXgUBaPmh/Kqh5BZ2xdsmFB3MvFi
         DFR3MQwICb4rdWiCEbwODtRrocGF7TN9uNhsIliRaWDftwzg4bQFq10RHI2kRgJVcsYg
         2x2IATe/ERh9rTpMULI01HwuMhm/NEE6gKQbjMvDvgrbrJ2sj50d/Ie5Zkfmrsc4qo2m
         G7cbyoc/RtlHehdp+G8Kg9Xq8GFdCI1Br6sB5gUCfXgaPcsVW0OU4q4s4v7YLVMTgiuC
         jelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767621989; x=1768226789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOJglpam6Y6tV/ZKx1vMYagmOMEwuqgdfcTZ8FECwao=;
        b=ee4TffwQZpq2tF/C4bfswQ55wYlOMrv8YRQyFMp9rs6vTGEumBGtwhMdCZOlzXz9MV
         r1CWYcTUbSKa5vGrDidHUF4vhr1larBb+qkUJ6suFy1arJKpf10ibypX+qOpUP8d0al/
         h8yVI9cy6oPUqlKAC06FA8WhbSsu5CxDcDU7I4q5t974jNQ045ChmAICUW/YPa0FijeQ
         GCOc/KDPPFjRYTuoSUEr7zrU9EhcRrfYlmiiR8+W08gn8EX1TZZH0onvVg4SFqHLMxuD
         PVAIuXcTXD4rD6B5lSGkF1JieXt8dhwtsjwe0IvJyy4l7Xsm6C5YumG284b4K4Nxqe5I
         QMIg==
X-Forwarded-Encrypted: i=1; AJvYcCWYQnDGzb6utwOO/GtTSpFRnFrGPjY4xrdDyVAkCkTr8fUUgElxN6kmHOi5QuWBIXFojHSa1ZE36XA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv47gFTr4ZP5jBrp5QEhyk2e7cgUnjr9FLsjIMSh1NRrmlb0jv
	3eEDaNkxqAWwrr2EmOvqo5FpWRKfjPXWuhd8EGgDYJyMooUhgG5iqTsI
X-Gm-Gg: AY/fxX6wy22Jo1ydxjrjR2QoO8HMTX9qHWBM/bo3klOAEtQBkVNJTudlRLebXR/Z/SK
	xnjsj/cS9JCrKD9vwejjJyTihtppLFhi0euFbzZPMMQ0JBvmK3FEbtH4I+FGXuoxEwsHeRHV8TI
	fcyvjMnqsqJ5v41MLm+3czpF8q0LSuajK1/jG1gXQsQbeq/aOmbFHuFtw7G1R1gTIRkAN694b0j
	A24ELjbenQn9taiZvGEV5qCMEhiSXBCMfUNCtS7mwa7ELaMPEeBuZ54N39dyUe+lvOV+6QFBE0Y
	dwNvl/bL52L9qncWp9LHXbF+i9UMfA34wWSbagZBixqEfDboqnWsTIyWKroQQ0r4cTju7rd09xl
	/7CP72nYT4S3enB9tKp+pcQDC2VPCBmiPyTwqWianK0IzynyicuBSgnFquxXu2ttKOqaDfK2KNC
	ftYjA21AHanqnJaeFzIdMMVYpZN4CVUth8Ljn2uyrWRLpuDaz7BuOv4TGOnJji1vqe4eoW0Ww3t
	sfsQdFT3nezwbDrib7AZaR/gp3O3b/IwDZFpfaA01fk
X-Google-Smtp-Source: AGHT+IHYjz/XhcS6cgCdmHSfRfjnK952JHLNhqtvsHW++gGz2atIPw5gFfbGYXmxHJxJ2yyaYDBXJA==
X-Received: by 2002:adf:f18c:0:b0:432:8036:4a0e with SMTP id ffacd0b85a97d-43280364b6dmr31538076f8f.35.1767621988981;
        Mon, 05 Jan 2026 06:06:28 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:b8c0:9e58:2df0:631f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aee5sm102452753f8f.4.2026.01.05.06.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:06:28 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Pavel Machek <pavel@nabladev.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: renesas: cpg-mssr: Unlock before reset verification
Date: Mon,  5 Jan 2026 14:06:25 +0000
Message-ID: <20260105140625.2590685-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Move spin_unlock_irqrestore() before verifying the reset result and
printing errors. The verification condition only uses local variables
and does not require locking.

Reported-by: Pavel Machek <pavel@nabladev.com>
Closes: https://lore.kernel.org/all/aVujAQJSDn6WyORK@duo.ucw.cz/
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 35cb49763014..a6df0d2538c7 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -806,14 +806,12 @@ static int cpg_mrcr_set_reset_state(struct reset_controller_dev *rcdev,
 
 	/* Verify the operation */
 	val = readl(reg_addr);
+	spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
 	if (set == !(bitmask & val)) {
 		dev_err(priv->dev, "Reset register %u%02u operation failed\n", reg, bit);
-		spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
 		return -EIO;
 	}
 
-	spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
-
 	return 0;
 }
 
-- 
2.52.0

