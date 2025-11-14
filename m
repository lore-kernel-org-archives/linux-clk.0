Received: from mo-csw-fb.securemx.jp (mo-csw-fb1801.securemx.jp [210.130.202.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750E429CE1;
	Fri, 14 Nov 2025 08:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763109097; cv=none; b=LetR3ur/o+4yrBCv0l49cczn8M9C7a8f9xc3UpHSNoMDJLVlrke/YiC9tf7saHor4+nSTB5c09clZkiGBQP9brCad3CRETwrpxER7h94JdCRtvci8HTZAjF0I9xkPkEU/UU0xlaq8i/1NNDts0vpq7ZrQgtS9x4cPh6CpiLEnHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763109097; c=relaxed/simple;
	bh=YaJyIx3BTM6PJFfw7uMgpOvCW7UERP6aBJv3zzwB6Uw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OyQo9FxPC4kdM9JCyypKT2jAWMnOtgJwKUhpIC9O78L88dha/MogGyHjjMM8yj9Cfr6hUKFnJ85eKPHJVDZWRUxvL92VAt2OlIRkDX/Y+3aaFKC28ucFd+QogkK7Xyj8kVhRKB2SMsrfyjgSwD1GpSM/1R3JBb8zZRAaU1XLJbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=eJ9iISBN; arc=none smtp.client-ip=210.130.202.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="eJ9iISBN"
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1801) id 5AE6xk8s1219614; Fri, 14 Nov 2025 15:59:47 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding;i=yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=
	1763103550;x=1764313150;bh=YaJyIx3BTM6PJFfw7uMgpOvCW7UERP6aBJv3zzwB6Uw=;b=eJ9
	iISBNfHn9waddM58TVg7uBYBAmVKb/OVA5E7Z16f34ZaOFSHAoAupaCmqRsv4zgaMNme6RyBnv7rK
	/D1HrbYK3us6n0Ipy57F4yaIzXEPyE+VngyM/w3jyBFROdEOC3XH0QbX46Vsf5LloxgV0ZNRwqZ7j
	QAzmjdEl7qtdBtGGLGHQDERk/fTAu6ATtMXScx/vCZUQLc6UtZT6SDaS7MHien4r1RSS0M6gePRuL
	eicOgfkgxr7ymYspke5V5v7WannW4C3SdER1JSUgtEOvVc1Pw6NpVgWeGYa1nQ0euHTwNqReLXHms
	u8ONiwDE8wPUaV+CodET6gGBeX7BUDg==;
Received: by mo-csw.securemx.jp (mx-mo-csw1802) id 5AE6x9N12206956; Fri, 14 Nov 2025 15:59:09 +0900
X-Iguazu-Qid: 2yAakGMojjjxMf6t5U
X-Iguazu-QSIG: v=2; s=0; t=1763103548; q=2yAakGMojjjxMf6t5U; m=G8E2yk525ojmYKyw2eN9CDf8Cr/CmjUVM/YdQ20WOvk=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4d77KR4My0zyPZ; Fri, 14 Nov 2025 15:59:07 +0900 (JST)
X-SA-MID: 54822484
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Subject: [PATCH 1/2] clk: visconti: Do not define number of clocks in bindings
Date: Fri, 14 Nov 2025 15:53:57 +0900
X-TSB-HOP2: ON
Message-Id: <20251114065358.854817-2-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114065358.854817-1-yuji2.ishikawa@toshiba.co.jp>
References: <20251114065358.854817-1-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove use of TMPV770X_NR_CLK.
Instead, define number of clocks inside the driver directory.

The same for TMPV770X_NR_RESET and TMPV770X_NR_PLL.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
---
 drivers/clk/visconti/clkc-tmpv770x.c | 8 ++++++--
 drivers/clk/visconti/pll-tmpv770x.c  | 5 ++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/visconti/clkc-tmpv770x.c b/drivers/clk/visconti/clkc-tmpv770x.c
index 6c753b2cb..94a736da6 100644
--- a/drivers/clk/visconti/clkc-tmpv770x.c
+++ b/drivers/clk/visconti/clkc-tmpv770x.c
@@ -17,6 +17,10 @@
 #include "clkc.h"
 #include "reset.h"
 
+/* Must be equal to the last clock/reset ID increased by one */
+#define CLKS_NR	(TMPV770X_CLK_BUSLCK + 1)
+#define RESETS_NR	(TMPV770X_RESET_SBUSCLK + 1)
+
 static DEFINE_SPINLOCK(tmpv770x_clk_lock);
 static DEFINE_SPINLOCK(tmpv770x_rst_lock);
 
@@ -234,12 +238,12 @@ static int visconti_clk_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	ctx = visconti_init_clk(dev, regmap, TMPV770X_NR_CLK);
+	ctx = visconti_init_clk(dev, regmap, CLKS_NR);
 	if (IS_ERR(ctx))
 		return PTR_ERR(ctx);
 
 	ret = visconti_register_reset_controller(dev, regmap, clk_reset_data,
-						 TMPV770X_NR_RESET,
+						 RESETS_NR,
 						 &visconti_reset_ops,
 						 &tmpv770x_rst_lock);
 	if (ret) {
diff --git a/drivers/clk/visconti/pll-tmpv770x.c b/drivers/clk/visconti/pll-tmpv770x.c
index 8360ccf88..a2208c5fc 100644
--- a/drivers/clk/visconti/pll-tmpv770x.c
+++ b/drivers/clk/visconti/pll-tmpv770x.c
@@ -16,6 +16,9 @@
 
 #include "pll.h"
 
+/* Must be equal to the last pll ID increased by one */
+#define PLLS_NR	(TMPV770X_PLL_PIIMGERPLL + 1)
+
 static DEFINE_SPINLOCK(tmpv770x_pll_lock);
 
 static const struct visconti_pll_rate_table pipll0_rates[] __initconst = {
@@ -66,7 +69,7 @@ static void __init tmpv770x_setup_plls(struct device_node *np)
 	if (!reg_base)
 		return;
 
-	ctx = visconti_init_pll(np, reg_base, TMPV770X_NR_PLL);
+	ctx = visconti_init_pll(np, reg_base, PLLS_NR);
 	if (IS_ERR(ctx)) {
 		iounmap(reg_base);
 		return;
-- 
2.34.1


