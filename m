Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC55423C503
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 00:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778028642; cv=none; b=pGV2pon0kKrM2C/F2SSPvXN1y/6ilVLzbXYU1ZUVU+f1TfP7BaU+Pus+WCtI0g8HCVIXusk+LdkDSVQkMffB7NqBp19zhueZZvzrqYYu0USqArxiSggap6FYcSK7RPoObDprOSoPNr6S8M+2+Kf0OxKyuV10veH8MVNaYyE7OGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778028642; c=relaxed/simple;
	bh=c/0o32UHHPR53Ko/1QO7CYkQ8/mLPJcwy6nuModIVJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E53LJFgjVPJX33bSxziWWsRbejX9vwx3nx+lGS9pA8CUSPRQ1HSNeEEYob1CfjZj7cd2zwHagkjV6plugSl3LTC0BKXTVTbqyVhWZheV4vUqETlmZOR+BCzwH9SmLHyrGxGHsvIe2Vb4ILVjvqy2BMFl21mOxZhxeLGv0RuHP0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VeJqmnQA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DR5uL4cj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VeJqmnQA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DR5uL4cj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M/24W4AwvWyRwYbo6ULJEPyQOBfb+Ll9imS0OxoxU8g=;
	b=VeJqmnQAos35D+mjQtRk0YvaskA0YFaKmyA/JJohVWd58VitSHl5R0f1stwEHG30bW2XLO
	2XOTtY8tTpgBMGNfUEVM3L/PK71uXZLT7H09YMHxYbcEJuJcIAH6NpxSpXzdkyGXRGEWqk
	xI/Bq0pS3w44jVEvfwkeFfSgdyFqruM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-PhIDtbmnM3G8iOvin8LdGQ-1; Tue, 05 May 2026 20:50:35 -0400
X-MC-Unique: PhIDtbmnM3G8iOvin8LdGQ-1
X-Mimecast-MFC-AGG-ID: PhIDtbmnM3G8iOvin8LdGQ_1778028635
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ed2c173d3bso1189481385a.2
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 17:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778028635; x=1778633435; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/24W4AwvWyRwYbo6ULJEPyQOBfb+Ll9imS0OxoxU8g=;
        b=DR5uL4cjYOCVerDPHhP477QZi7BX5WDX3E+YOZfyeR/hf8h4x+xlYv5b5qwWKX6jiS
         FbzMr3bvQbpWdGKUeUem5gDOxu7ICOFyTVyoJlmSyeSPIpgcgD9+RUkfLghQ3rIXRJRp
         1D1NgmiGrsOfsU8inl60Wh1htR5apS2JkstLS4V5PnGnO1N0pGj0AU4+VxmqJoY68hkj
         +DkYTdzhCGXGYSnAhIWzQNN96uPg3jKlgHecMe22MbryvEBTnq9dG4jhr34c/waLQEIc
         3Av01T3pQu9bDFM6/gWIpQuYGx6tg6alkyklma6b0XgBwiotzHdUhHQUeea93qJkMv2L
         HdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028635; x=1778633435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M/24W4AwvWyRwYbo6ULJEPyQOBfb+Ll9imS0OxoxU8g=;
        b=cr5p9b0dqCpr12iAM0iGvQYEEmAom+rcXkAtDzK5wVH+GEAJmaYskyP4k4i80buOfF
         1RZBU5JgxLn4zbJ1e05vAnHSzQgE+sF3Lem7sfcRo33NYZ3wroAACKs8sdvABp1CPnVw
         9O1RnFlrtJduAftjAWQ6sAWinxYesgtBoSDBCilVSKIR125GzSB8q+yyCla3pKRjfBJ7
         SUCNC/Smq2K/SJRxBNF8CdjAMVSXMpyQRUqgv7u/7I0XBKEbw5wUhXoE8THP/ieQhbhb
         s3Cp0HlZJTB8gK5JTYU0oHS9LPxYr1Pb1BOArGLBdnukGbpfPhdKRevvQ/qmvj3Ymxvq
         dBzw==
X-Gm-Message-State: AOJu0YyeHVp2FuI4aYeyHeebnjBOYwR2my0nArR3lpcIJbxNdHqmcUaX
	fErIrgQGS5/4OkYJJKiiRVNXVj2LQiHAv5MR8NWU2/6xEnsoRaoMRTSPdpx0Ic5sjJsmQvFOM9Q
	d9M4xKeUPFmSD12fnqSQRAHUrFxuin8wtteHF2PgwFvbn3oYGQWQASP44Q3Zk7w==
X-Gm-Gg: AeBDies60gJuIwT9ZPxwtgpM47ocwsNaBLii+pSx+H2K5VRBXlwEW0w79j7RnS2tKEe
	Y0UI9aZqDbY9tH6m66qljdHdN9OY8VCY0zktc77tazY+hlLfWFTwuwZxyymiyPSDcNG8JQGtEkh
	P4ih5JUoTIO4/9cdSWdgK+C+ckY0ShIbBa+EFwDLPEAKONw9SqnCqDzlpY5iso1GAIztU/R5LJH
	skuO/tNHuT39TKLs217WXJiHXII/40JIS3Svu4SShVJfdam06jGZYs2OHMLHnbxja/Q6z2TSUsn
	JXC+6fS9N2LCrH+271BsrwEtF1R8PS+5fAzrIBc8wrpzh/kq6YmXHymkssZlPAnMjNwAgDqGUyc
	IRvmjxo9l7bVkZ8M78OrlT9hDGq+u6nmxXLgE+3CP0Zs753ZeLKKuE9hBKcjDmF8enn+GMyAW
X-Received: by 2002:a05:620a:2697:b0:8ee:7878:af33 with SMTP id af79cd13be357-904d3fa461fmr222467785a.4.1778028635191;
        Tue, 05 May 2026 17:50:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2697:b0:8ee:7878:af33 with SMTP id af79cd13be357-904d3fa461fmr222464185a.4.1778028634644;
        Tue, 05 May 2026 17:50:34 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:34 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:48:58 -0400
Subject: [PATCH v3 02/15] clk: add clk_determine_rate_noop()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-clk-determine-rate-noop-v3-2-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Anson Huang <anson.huang@nxp.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ulf Hansson <ulfh@kernel.org>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 arm-scmi@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-pm@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4050; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=c/0o32UHHPR53Ko/1QO7CYkQ8/mLPJcwy6nuModIVJM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TXD3X1X5dNIk97U9eepfJ2/Ueey2OvvzxVCDB6e+7
 NjO5lu4rKOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJPItnZLi38Kv1kt/xKhcE
 lrD8PFhVqHlf+UzKp+/rPlyZ9Cvi0mxdRoa/X14/do/lFA8NtajlrzbRUt7fFtq1Z1vWXy0d6bZ
 H2pwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Add a new helper clk_determine_rate_noop() that's for clocks where the
rate rounding is handled by the firmware/hardware, or the clock is
capable of any rate. The requested rate is passed through unchanged,
and the actual rate will be learned via recalc_rate() after the rate
is set.

This shared helper will be used to get rid of the driver-specific empty
determine rate implementations that are present in the tree.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>
To: Peng Fan <peng.fan@nxp.com>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Anson Huang <anson.huang@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Andrea della Porta <andrea.porta@suse.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: Chanwoo Choi <cw00.choi@samsung.com>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
To: Orson Zhai <orsonzhai@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
To: Chunyan Zhang <zhang.lyra@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: arm-scmi@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-phy@lists.infradead.org
Cc: linux-pm@vger.kernel.org
---
 drivers/clk/clk.c            | 18 ++++++++++++++++++
 include/linux/clk-provider.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 048adfa86a5d..956e147f4d4e 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -882,6 +882,24 @@ int clk_hw_determine_rate_no_reparent(struct clk_hw *hw,
 }
 EXPORT_SYMBOL_GPL(clk_hw_determine_rate_no_reparent);
 
+/**
+ * clk_determine_rate_noop - clk_ops::determine_rate noop implementation
+ * @hw: clk to determine rate on
+ * @req: rate request
+ *
+ * Noop determine rate for clocks where the rate rounding is handled by the
+ * firmware/hardware, or the clock is capable of any rate. The requested rate is
+ * passed through unchanged, and the actual rate will be learned via
+ * recalc_rate() after the rate is set.
+ *
+ * Returns: 0 always
+ */
+int clk_determine_rate_noop(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	return 0;
+}
+EXPORT_SYMBOL_GPL(clk_determine_rate_noop);
+
 /***        clk api        ***/
 
 static void clk_core_rate_unprotect(struct clk_core *core)
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index b01a38fef8cf..334b9211a157 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1431,6 +1431,7 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 				 unsigned long flags);
 int clk_hw_determine_rate_no_reparent(struct clk_hw *hw,
 				      struct clk_rate_request *req);
+int clk_determine_rate_noop(struct clk_hw *hw, struct clk_rate_request *req);
 void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent);
 void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
 			   unsigned long *max_rate);

-- 
2.54.0

