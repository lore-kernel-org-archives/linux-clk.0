Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A8C43F0BE
	for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 21:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784498103; cv=none; b=evQxovY+RWoqxPt/hBdatZAAKQacpKAwn9iIApwE2fSg+q/+o6nCPPdKSgJ4TK1iAE8msSNiRIhpBOTumB5G9cUJDCwgUWf79ncUo9hrdFps57IRPBORJFW7+VOMw+tuiU3lyGmzRlW1Wek/xmtw+9/CZZFOpGde0IoePmffSho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784498103; c=relaxed/simple;
	bh=61vvSIKYM+LWKM6oFYcX3eT/sAmIhKSkc4d74ycVjuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FRP1IM79dlKF/xO+JLIHxIz6xkc2CFmEaqpYbf/zHxO6j3LR3suGf+wRTJB1uF5h9JQw78fd6BXPmpO+p232KpIDUk9lkGJJpoS2bRZEsCcwbntxspIAw2U2UlcfWIyAAHURDH6HY+FnjjW2wbydnhYLp22A/4OeKqMd37TQ3CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KytVvYSg; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KytVvYSg"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e7109321dso416572a91.3
        for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 14:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784498102; x=1785102902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jqplnvUpyuLn1RyaGhBCqEh9+v5GI4sy/8jnr2JsNU8=;
        b=KytVvYSglh9lHLbJhrPx1hdV/V4v781u4KGyB04GCKyzKF/DfU5B0P1gd7zJEyC3Cz
         9NqK+rAqscQdFlvYIjRhUkv9wSctCf+FpcTNz0EHBidsNTQrNo9fY5sJ7gJ/jKzbCRn8
         yL4/lyWu1v24UJgnxnCkcyDOVTO3k0r6aFGJyclg5Y1Hn9++U/iLW2IPDHWBp37Mbl5K
         hle+J+mYh5Xh0aqJtcnYuFMss3DnbMyNMVzm1bTNKsfr91VWdpU568oUZwC+4dyutztw
         gLKu5TgIXg4eR+6Vrfo65k9TcEQQZtO5J/ZZ9hO0Hf+V2cWN3Mg3HVRHQjEl8hruLRzS
         VxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784498102; x=1785102902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqplnvUpyuLn1RyaGhBCqEh9+v5GI4sy/8jnr2JsNU8=;
        b=Z9gvVBL8rDCQ4CDkwDxUiRbJgHwPAv7h2/7omjqy4QbuPdsMgUNGZvqPNxoqtIorR3
         J9Jq4nvlKm3cs5Ysp53hVMwG0NScDjXry2AYlU5wbQ8HPPI2YtEaCSYY+P5tQSlZQjqj
         YG/oxxgcPM/2j464k9ulpDX27lkTxe6Y3PNpvrxtvY08Z0f3lqQyTXGBKHRk2vZhTd9E
         gnGQ5yliMx6D3RQSeUG0WTGMvEaFE66LKF1PhEOBg+35h3mkYIsEtvW63iosiWXTgpkS
         wX0a4I/WgOigo3xZ+1b0w+HQj0yJDgE+rUYAkQJKamA5z7EEWH+CYp+Qi6/Kg4UpY1PQ
         YFYQ==
X-Gm-Message-State: AOJu0YypzdorwtDjGmNVDtyYheF+TORKTDnbcsyNX7CicNoMt2YdU8v4
	s+RQxjCFgCJS4L79sCivNB+mcG3gzIGD17uV2y+5H1AVKTmvxo526G6eccVQwA==
X-Gm-Gg: AfdE7clxWau5N+jAf2ikw570ije10f8buPxjdDpE3IXffOxfzMo2NtrAB/H6ep9u1Oh
	pIh0evmnENCedoBVZ1nHho3C9WAdsfLee4BBdfwkyA70mNai6ZS8R3ur6TyTyh92YY5ltd5ST3V
	doVN8H64ly+QoY9ZLbvKGOHJzIM+VVEjlYJwGpVjvbUOKtjed32exLmEhin3GKcZgkPyS+K07jV
	LLOfeXWYYnyXP2N/7e5OEKpe9KlydF65fGc9J1Y4OkZEnFakx+ijHs8+rInMAKWxb+9A0K87bHc
	Ar5/nES0uYNMlA90CPNncfxI0k0UCZxqdEFiiG0N428IQV1833kalcGcepe0yHeV0lAZ7b4wufe
	lNkOmhaLanVhCG+XSK5gV9HsiwE2tEcq/eOdFN9wgb5FhF6Fzc30VZNXWsuECKsfsplr+jdJy8P
	C/y1+0LSKTNZWTtFK3fBbunJH7Zumm6G2WjwYjJi6uK1dSaNoZY9kxSaUXSMr5hIFZ6dpPoGvY0
	+pP9X33VKOXpacyQVGbYnhIxA3QfpReCl59t1w+Dh8CZuoQBsDRW8k=
X-Received: by 2002:a17:90b:2dc1:b0:375:2a38:1d40 with SMTP id 98e67ed59e1d1-38e4b5166b7mr11097602a91.20.1784498102013;
        Sun, 19 Jul 2026 14:55:02 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afd2dd6sm4574677a91.4.2026.07.19.14.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:54:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] clk: hisilicon: hi3660-stub: use devm_platform_ioremap_resource
Date: Sun, 19 Jul 2026 14:54:56 -0700
Message-ID: <20260719215456.787188-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded platform_get_resource() plus devm_ioremap()
sequence with devm_platform_ioremap_resource(), which fetches the
resource, requests the region and maps it in one call. Switch the error
check to IS_ERR()/PTR_ERR() and drop the now-unused struct resource
pointer.

The only in-tree user (stub_clock@e896b500 in hi3660.dtsi) has a single
0x100-byte reg region, so the region reservation added by
devm_ioremap_resource() is exclusive and does not introduce overlap
failures.

Built for ARM (drivers/clk/hisilicon/clk-hi3660-stub.o) with LLVM=1.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/hisilicon/clk-hi3660-stub.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi3660-stub.c b/drivers/clk/hisilicon/clk-hi3660-stub.c
index 7c8b00ee6019..1b81f26670ed 100644
--- a/drivers/clk/hisilicon/clk-hi3660-stub.c
+++ b/drivers/clk/hisilicon/clk-hi3660-stub.c
@@ -124,7 +124,6 @@ static struct clk_hw *hi3660_stub_clk_hw_get(struct of_phandle_args *clkspec,
 static int hi3660_stub_clk_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	unsigned int i;
 	int ret;
 
@@ -139,12 +138,9 @@ static int hi3660_stub_clk_probe(struct platform_device *pdev)
 	if (IS_ERR(stub_clk_chan.mbox))
 		return PTR_ERR(stub_clk_chan.mbox);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -EINVAL;
-	freq_reg = devm_ioremap(dev, res->start, resource_size(res));
-	if (!freq_reg)
-		return -ENOMEM;
+	freq_reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(freq_reg))
+		return PTR_ERR(freq_reg);
 
 	freq_reg += HI3660_STUB_CLOCK_DATA;
 
-- 
2.55.0

