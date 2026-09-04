Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593913C109F
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 21:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788558421; cv=none; b=gJ2o7vG7UXyFo7Zq1in2ksunq99rZoOikhdiSf5rKKEuYR2P8Z/U5N3eg36ndpCcT48G9FU4PNTPOz4JojYJDKZPnoIM8S7YUkaaMZX/Wttx2/nhe105z5q1iKPBljo7H+7WBFkeYDmtN6Jy2Mhu8UysEP3WmA4tZruovl+7UDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788558421; c=relaxed/simple;
	bh=JGFNsQr3mEJyoq70BdQq21Ladsg1Ar1zWZxOGwSVtqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RVGQf9iPoBiLkb8nzwyP8dv0Xr5zETvsDqIdeaiBvccYX1+HPNDFyngQBnOTvloN7sYU3ljhZybCqy97qgke/ZHJsUMTZxPMnUl+rIzEfGr4rN3EJAADxdAXMF4rOp7Bl0t658D+X2LMoZ0/coOIChooBd5I+LnkmnpTd/u2HZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1GqeN9h; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1GqeN9h"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1560649a12.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 14:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788558420; x=1789163220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TWKswIufh0VkLHspcYqks3RfUehr7h7HBH00FHiXVBM=;
        b=d1GqeN9hfj3sHhmvXHgANuZXHS38TX86BPivmhm244R0LSTlOv7N5fyjtVaKIYmSyC
         IqCQ6xifKxc0aRbWWF1bKtiTLJKbAVGC9BkUNgAGhofELq+REosksI/UE1fnFdMjuAWE
         ioHqPDXRk8V+2M+ybrBsSnhkWM0FJ9MZbRWnWGFxdjh20HIz7uinz6a940KN3fwDdFZV
         eV5AsdqslePk9AWFmpUfOZRfY58lCJMgJaEHGareAUtz3sIlCw+Iax0f7WJn5yDlpP3J
         Whijg5oR586ST0WK5a0wk9EdBZvOSIa8rlZLyKQqtK4KbWigWXWqLkEmsJJ64hpTtqVe
         3FDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788558420; x=1789163220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TWKswIufh0VkLHspcYqks3RfUehr7h7HBH00FHiXVBM=;
        b=sP6GxjyAyGbDG5gTxmpNU67/zVUTNbs57Zmcb+OJB4VCVKGprZPUGgXrHDZC87lrBK
         B6FeGXWlQl00TWTz0f6irAOeWJzRwH2zDQSsuxozTALPiTzyEboQVIBgJw2S7VhnwD46
         1nuNp6Sxs+Q+xmeebvyW1bKX7uKKNFw0NyGyuw2Kw9XjekEnUTHELK6nJaA6vPg02FiP
         qiF5N6aW/1g84yQt5CITD5aSimuiW58F7Be+dwVlPi2qfrwmn3Ja3RNGLVLvnbxDL27K
         Ht+BaMHXXrP7W84IVu/yTvUnssrx6EAyckBwsShAWvZTMr/P/igPf2BeWIMwRBmnk8sx
         I2ow==
X-Gm-Message-State: AFuF++nvkxjOgAcKkUnWHHXk7eYacyqXfl7A0MIlof8WiKtx9p012O3f
	aFxtOq75HlhpOWFUVd5pTlJ4NpYjppQysm5QQttEjdNQEEAM6YDPGZtrnE6vmg==
X-Gm-Gg: AYBFou1kZWoJLIlFyn6vgZrIvTyg/ydQIPffoFjvxEaCsvnomYPyjVnfHznu1MgaB/Y
	gj1XPx2FzcBuNaMCKfFprNgTTIiiV7j9okBVNBzT71k1GfeR4URw63ZBMkuShsVqvn7SMIBrxDv
	z+it9xenCf253ofDZdpqloCa5/019d2pHpJQmkMkxnjmmVtBUDLSAPhKgJ9jfuPn45LsQGsBEra
	9pr0jBm3pihsHABPqolNy1caJsz+qnKSRFrCftNOrZXbY1h1tdRlw+jaRpYBsFE8uUY+v/Um18x
	lAlOLqtKy1VeNQ8hAk09ZFNWxrPdxhAqXq/kCse2kkPhcdQ/Hs8ErFMJyVApXzPmUjTztGkn9Zd
	V/ZSETvp09e44bss1itnyoJ0eHsKq32qtVmsc5UZeftYNxWDN0LVJaJ9PIVXTu8QQuAtZJqIXry
	N6RsRMLsxS3fWcwXn6yRCR4m4LK5i4t5YvaZ75msbkVUgWyOCjAng8L9WppozVOqRrSAGRGFy3q
	HuDkjxMW1zK2Uyf4f9/HdOe8Rl68ZQQSBHwwEPjq8a/7ryrVbFtQBMZqhwGOy06XxrC5UxY5kTu
	7YTv4XtA1qBFbO0pSf6Z+qI2dzybj699EIenTA==
X-Received: by 2002:a05:6a20:e613:b0:3b4:6af4:bdd5 with SMTP id adf61e73a8af0-3da215a9214mr14327580637.15.1788558419590;
        Fri, 04 Sep 2026 14:46:59 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc45542dbbesm1328301a12.13.2026.09.04.14.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:46:58 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH RESEND] clk: nuvoton: build with any architecture
Date: Fri,  4 Sep 2026 14:46:57 -0700
Message-ID: <20260904214657.97370-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The directory's Kconfig already has COMPILE_TEST. This allows it to
work.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 RESEND: seems the proper people were not CCd
 drivers/clk/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 69a09b7d0097..dd94163d8de0 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -148,7 +148,7 @@ endif
 obj-y					+= mstar/
 obj-y					+= mvebu/
 obj-$(CONFIG_ARCH_MXS)			+= mxs/
-obj-$(CONFIG_ARCH_MA35)			+= nuvoton/
+obj-y					+= nuvoton/
 obj-$(CONFIG_COMMON_CLK_NXP)		+= nxp/
 obj-$(CONFIG_COMMON_CLK_PISTACHIO)	+= pistachio/
 obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
-- 
2.55.0

