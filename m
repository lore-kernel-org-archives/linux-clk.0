Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000831;
	b=AxKb2/0FqfdAvj4NCmQxwJGGKsK1I1dTLhNSb59hUE64O61EJdzx7BZdvoduE7+4Ac/K
	 VMRLLhjNSfMJ4vdYk1A2epk9RZAKQOdpJ+WxJumkOws+VYI5JC3nkM9ULliQ4hrWx3bpS
	 IwWVzmXkhPISSymeWc5vu2HgV1FAFSwCym2N2MgBLnW9PF188LUZCzQSMKTnbX1IDiOEQ
	 uH+5FuLjHKS2lH+qCLpEtRs9w7qFjZcMIwpPMc+/umwkvGnQYvBi5YM+iGPdkpGtShtd+
	 2JPdGEVbn6UHehcEWJneoPoMZVEJCNwFJujS4f9KyxYqM5y6+CYdeMrzZB0rAYwUuWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y/fMNupjmUFDA4Fs7jz5eM8c/pdIIe9SGMOk6RgTsFc=;
	b=suVBa7fthv7uMbd8nH/3YtiQiHa4t0BLz+xOXB1+mktyOUeLi12bdsuf/TX6URLN+Ysz
	 JBxJi7cCVILD6RMnEoHvyxo0t2OMba/IvPYLv6cXALqXtedyrDQEb0ntnns1JhjajMPD0
	 1UbOPas2PavDeCUbEoFBpp6HGLrUCdQfmE9lZcx9vWKrTZo69ifQoqkp63dGaAsT5cIJQ
	 hiMlZP08X1xxQiVgdogTnrQG+KPuV3bVAU6grF7zI3EeoszFPrniy2EXio/0t6xY+Havl
	 p9puAKAmhT4+w0naIEYraHLScR7YliaEW/kXRRJqDoJ6auIVLAY8d+P9CI/TIYibzDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ChnSGDu5;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DF360A2614
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 07:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76DF360A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ChnSGDu5
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1422766f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 00:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793000824; x=1793605624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/fMNupjmUFDA4Fs7jz5eM8c/pdIIe9SGMOk6RgTsFc=;
        b=ChnSGDu5hUuDpuWIH9opEBsyTk71WKjPlowVCbcYkco7zRAYFTYFWR355PNsm3a4sa
         2Hn+3ixvsq89ZYW9QBpqodArWQ9uw9Zh/QpIcMpDbsY/25Y8ndmRr8VW803t2vSoTx0w
         uKcrxv14SSBF5FhIgdvDejvWrtBod57QV2bFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793000824; x=1793605624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y/fMNupjmUFDA4Fs7jz5eM8c/pdIIe9SGMOk6RgTsFc=;
        b=V6UeJFMl/IGwSG9+I/Z2ssa1wcll84Up7r6NCfkWqAcKUA6OiIazmJWxSZ2m93yuDj
         CKh3btRCqdDkcGNVoIPQIHgrTYt+TIR4foL9N9CEWO5VhNihO0r9OhT/9oegv7n18r8p
         Pgmqpo0EtY6t47LRGLhJrrZdptN/FGV8KhLeIaoawBrVjs7u7Gm1gMvM0s2BUp3hp2dQ
         AczH9jPnAZGKxXyMyg2iIJSts5xGEsIoXI5h2Ut6H7qSIXk3psyuY6YZ5VEm6dKGXOxM
         rLl5t4P5aCkxAJ35Z3YF/4dSudddPPtLjZ2d0FbpXbtQoPCH8Z8iO48pXXPN0Li5pqaZ
         fNMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCvuyRGBEqPAfJw4gepjsFaNCMaRhOSDIZtaKI8oJuI+YoVfuzhjxymjuqZaEdOj5DMMY3rVKwJ/4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKELi/5k6mSZB7f8FBhs13mh4x1Xy0+/DzXQAC8b4QZAON0Lyac
	fIw8PnS8Zzr/pt23vKULBOhO22auT74o6bO1bj0dnnyGDW79caZT77dAwVBL+Book8QgX8EL9Xq
	WXWya
X-Gm-Gg: AYBFou09qgDQBKq2PLkNsJ/JxRhfAKYMuAxe1i+RDRi3+fnQy8vWEoNMdC4PqluubbF
	IG9tqnWJiNIQhE2GcdgCeT8q4WcJERa/QRS40CzvmPMDgP9gWEwgN4F2lobWMheXlEsdGleAdTW
	WMo9os7fHCmiMex/035yyoTit9mX6vQkA5Q89lWMF3KsybwxTBFqdG4/ryUjqzL+Mi3r41xzR01
	q07zbuxfIeXLXEddG21jlhQjtQCOrZF5ySemim/CsRwzHnAE87A6/7WoBD/WiZ5so9VSb7GpgGk
	47F0V3Jz8aD55RodC5rKdfgvXwkKpNteVVGlK6fMv3DwhnXC2zsChLi/z2VYHzLRsMjK123YY52
	mgluYyQh/PEnTyMDx4LtMIOA8y4V4znOMw31NCWWXkpmRrDC6r3JFoW8DOZMgYb/+3RtvRbA3F1
	/EA3umCi1tQvM+SaAt9GnZk4jByl7g2sdUB4AAcdTkzcoBi+GXuHLW4GJRmADozt5ya9RVEfWVH
	iaAfxAaWmXrG/kyDTntaVio35HzoXu/mTe3ohMCj9tvo5+yHrgIJTkiD8NBBDnr0DP7hOu8Cseq
	0V+mcx7rjSfY4QQlAybmv1QKCOiid8kxBmmbJc0Fsdmg0YPrUhRheCQ5Su/96+HWWDLzqYKr4Yb
	kctXYafN+GsB4wteO+XuMrAT/7gZ1rBmkUzszqQe1KJuaQm/nvvd7qw==
X-Received: by 2002:a05:6000:1185:b0:487:106f:ee31 with SMTP id ffacd0b85a97d-48e3eb8bd5cmr7348794f8f.27.1793000823908;
        Mon, 26 Oct 2026 00:47:03 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm13731353f8f.7.2026.10.26.00.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 00:47:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v2 3/3] clk: ti: dpll: apply the spread spectrum configuration right away
Date: Mon, 26 Oct 2026 08:46:29 +0100
Message-ID: <20261026074654.3997494-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026074654.3997494-1-dario.binacchi@amarulasolutions.com>
References: <20261026074654.3997494-1-dario.binacchi@amarulasolutions.com>
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

The spread spectrum clocking (SSC) registers are only programmed by
set_rate(), which the clock core skips when the requested rate is
already the current one, e.g. when the bootloader has set it up.
As a result, the SSC configuration is not applied, as it was with the
vendor specific properties.

Apply it from set_spread_spectrum() instead, reprogramming the DPLL
at its current rate.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Check the DPLL lock state instead of its parent, as the reference
  and bypass clocks can be the same clock

 drivers/clk/ti/dpll3xxx.c | 46 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/ti/dpll3xxx.c b/drivers/clk/ti/dpll3xxx.c
index 634fe0a1f9fd..16da86fbb25d 100644
--- a/drivers/clk/ti/dpll3xxx.c
+++ b/drivers/clk/ti/dpll3xxx.c
@@ -690,17 +690,22 @@ int omap3_noncore_dpll_set_rate(struct clk_hw *hw, unsigned long rate,
  * @hw: pointer to the clock to set the spread spectrum configuration for
  * @ss_conf: spread spectrum configuration
  *
- * Stores the spread spectrum clocking (SSC) configuration of the DPLL. The
- * configuration is programmed along with the DPLL multiplier and divider
- * at the next rate change. The hardware supports center-spread and
- * down-spread only. Returns 0 on success, or a negative error value on
- * failure.
+ * Stores the spread spectrum clocking (SSC) configuration of the DPLL and,
+ * if the DPLL is locked, reprograms it at its current rate to apply it.
+ * Otherwise the configuration is applied at the next rate change. The
+ * hardware supports center-spread and down-spread only. Returns 0 on
+ * success, negative error value otherwise.
  */
 int omap3_noncore_dpll_set_spread_spectrum(struct clk_hw *hw,
 					   const struct clk_spread_spectrum *ss_conf)
 {
 	struct clk_hw_omap *clk = to_clk_hw_omap(hw);
 	struct dpll_data *dd = clk->dpll_data;
+	struct clk_spread_spectrum old_conf;
+	struct clk_rate_request req;
+	unsigned long rate;
+	int ret;
+	u32 ctrl;
 
 	if (!dd || !dd->ssc_enable_mask)
 		return -EOPNOTSUPP;
@@ -718,9 +723,38 @@ int omap3_noncore_dpll_set_spread_spectrum(struct clk_hw *hw,
 		return -EINVAL;
 	}
 
+	if (!memcmp(ss_conf, &dd->ssc_conf, sizeof(*ss_conf)))
+		return 0;
+
+	old_conf = dd->ssc_conf;
 	dd->ssc_conf = *ss_conf;
 
-	return 0;
+	/* Disabling SSC does not need to reprogram the DPLL */
+	if (ss_conf->method == CLK_SPREAD_NO) {
+		omap3_noncore_dpll_ssc_program(clk);
+		return 0;
+	}
+
+	/* Not locked: SSC is programmed along with the next rate change */
+	ctrl = ti_clk_ll_ops->clk_readl(&dd->control_reg);
+	if (((ctrl & dd->enable_mask) >> __ffs(dd->enable_mask)) != DPLL_LOCKED)
+		return 0;
+
+	rate = clk_hw_get_rate(hw);
+	clk_hw_init_rate_request(hw, &req, rate);
+	ret = omap2_dpll_determine_rate(hw, &req);
+	if (!ret && req.rate != rate)
+		ret = -EINVAL;
+	if (!ret)
+		ret = omap3_noncore_dpll_set_rate(hw, rate,
+						  clk_hw_get_rate(dd->clk_ref));
+	if (ret) {
+		pr_warn("clock: %s: rate %lu can't be kept with SSC enabled\n",
+			clk_hw_get_name(hw), rate);
+		dd->ssc_conf = old_conf;
+	}
+
+	return ret;
 }
 
 /**
-- 
2.43.0

