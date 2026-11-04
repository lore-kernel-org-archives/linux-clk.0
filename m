Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788593;
	b=rQTQ0LtmL/yZsjsgMM628tre1xiMF7SbPA/D8dN9dRH1OzBd+txt8NCt0I8D0DBkGTTq
	 oQOle7LVt9QsSDmWVsqYi9rDNuRBaV4Akn6kELo3luKXjm5U6LRQONr/vP5f7gACNl/yn
	 NAumNDS9CgJmuxSBZNOoWo691i5MSRBfnuq6skHw64Zv90sIDuKApGzB8u6ZqhWdyKynj
	 Z2XuGjiWj5vde/n5RtfZbHWpl/F8yJs9K7L+S9Q8GJCwE/7Sm460ACIioGkIjYSEpZUil
	 Jsf8m1rOunWZzgnU1K6sfAHHjMwaOsvJlBkau+tyyUVQPtwpiHzLl4jtJuAua3aD0vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QmhceGpLe8h0omEeb2M399Xlx6YguZcLcPtiMm/jwQM=;
	b=OfazfxEqQYUD0q+ArMmZbyavjWGay1nd1FR/a26QoqM1c/T5KMOLzSiVRqNuefzBOpwA
	 bbEN//+BC+T/gXmmN3fv6nKFTFKAyHHlffY7OfLDQS1bGj38EI4w9M8dHCHLUXlFTYUJV
	 /GBJQZq4zj7MlWT1/9lhywEbcf4Jf3p76Xf/5cIs1v+317OVOURKVwQyy5DZRcCEevF4F
	 jxT1nzJihEaYfkePhRsmeXTRBiZobz71MaCBA1vwRNYWrMNgHgvKM2gC3/B7KbZXMC+Nc
	 +cvQcL6G+iMGXZtMOKDKP32hENpEOUc5s6oBI2UxntD+qTMAUrhij8u+pKK9wCaWSVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Fb1FHWIE;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A8D606A33A
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 10:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45A8D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Fb1FHWIE
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so4644365e9.3
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 02:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793788589; x=1794393389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmhceGpLe8h0omEeb2M399Xlx6YguZcLcPtiMm/jwQM=;
        b=Fb1FHWIEPGmdRfstsM41MRX85tJgzb272tTsRN56+pqPfcdSuAWC4SF9jh60IVy54J
         7AMapJNI68GJcNva1bmBNw0rnhlqNqG40BhqTGitFwbEnUDxZh9LIfPveJpSySgpu9ek
         McKeDg7kkJAuN2g25gtOrxHwMsiZSNzu2ah2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788589; x=1794393389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QmhceGpLe8h0omEeb2M399Xlx6YguZcLcPtiMm/jwQM=;
        b=KbzpuvsWywMzq3UTNTm0TonLCchCQDgiU/qeD9X7clG6rQ06GdQX/m9cU+zyKKIC55
         3g7HDepiC/OdnPtY+1XDGQUCEsadiYkGai9KAzZlxYSkfpzJe3Q5AS7kBLq4aRv77jq1
         29wbD2rnup903J8vXN7zjbygbOhMB+FDpub92vzmypnPJ3uDz53snmDHIX2x61x5qk0g
         maRetcHv6s9hIkqwaiIu7gevMgB7wV2TK23yaSJrdFZ56e9PuJMmTja+CXXy78JIkbCw
         fwgHT2IrpFaGugWsva/EXAKne+f4jKQRegOG802KdTqaDJEKv8lpV7AD/xO9ISQlS/tY
         SoKQ==
X-Forwarded-Encrypted: i=1; AKwUvByzZ5PjqzQrBf0btoCO9LNbNOLK2Qdc/hlkj6hB9k79CQ17j8P37weG27Qod8ArzmTpX/ok0aCKe30=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PJaMJglu0r6FxNLAowAghYQU34pMm5GxXT1XRjrwDi/kmO+/w
	JM6j8iEplJ/ILRVVXKb0cbF+P+t4ZbqlhhmdS8LKSvxRiK3PfnDXJB5q/8nfQzabkdE=
X-Gm-Gg: AYBFou2aINS8HlQ/n1irTiu+twhoAWNmv/L37B3p/E5W67iyVNI8M+VryvQ6xSqTVcq
	luLILk23F+UIhOdTlAcRDEvsc7795TptICzsXrKbNTJDFGRNIg8dt39jTJZ3jhYI+wuNpQAa/y+
	LTZ+0JxYJ2AZ3JtRcRTCNBco+JuAEU54ISCAUk7nRmWLrw8oQ4b0pHkn+0nKLwOIjgCMetKzVEF
	OJ6sUtQjT0awVCHpFPyUgZoaQSxKal38mJxnBbHLUCTSiHYYLO3j8fIIjRsvgQNVDmvH7UKxcCv
	+kXHl31h5p9zEHHQmn5AEB0O3byXlgVzfLD5AehOSP/VGtlzPDki24e4qwHkh/B8AVUdNU83NUa
	4AA08snyJKOIMycMDzFD3nNRi2GAuVXwR6bD7gVfbdZjO3ICAx6rbmG5eGHZ3T5asjzu+cdU2iy
	ik7vKGomOT0ZZO1+O82XW+75uXLkOVdxF/mGhiDVwfVpQGYcNB9D9MMyG3LLcg8spdPq0YF0LL+
	EQ01W/ntyBwhBG224GjDqRGcfOVEiQ4LyXhF6pnHsw/I5kIUrO4IgY6VbMa9AyxlLpjwq6ebJqR
	G3V17ao4NYfuJFYod4osFpPifZ0x3y+TZLGFGA6kw0M3/yqkWdVfI15uatYtbP0azmObKN8IRnU
	Gv2fhdg4iTQ7Y2UCeKu1389aYgdipRJRpvIvn/Z2kRuAX2/RxcRw=
X-Received: by 2002:a05:600c:1387:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4ac17d16afbmr361119835e9.8.1793788588668;
        Wed, 04 Nov 2026 02:36:28 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([217.201.213.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm141685155e9.4.2026.11.04.02.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:36:28 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>,
	linux-amarula@amarulasolutions.com,
	arm-scmi@vger.kernel.org,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v15 2/2] clk: scmi: reject SSC configuration out of the OEM field range
Date: Wed,  4 Nov 2026 11:36:03 +0100
Message-ID: <20261104103620.4054694-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104103620.4054694-1-dario.binacchi@amarulasolutions.com>
References: <20261104103620.4054694-1-dario.binacchi@amarulasolutions.com>
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

The i.MX SCMI OEM extension stores the spread in an 8-bit field, in
tenths of a percent, and the modulation frequency in a 16-bit field.

FIELD_PREP() silently truncates values that do not fit in the target
field. Moreover, the conversion from permyriad to tenths of a percent
turns values below 10 permyriad into zero, which is then passed to the
firmware as no spread at all.

Reject these cases with a warning instead of silently programming a
configuration different from the requested one.

A request with no spread method disables SSC, so send a zeroed
configuration to the firmware in that case, without checking the
spread and the modulation frequency, which are meaningless then.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v14)

Changes in v14:
 - Send a zeroed configuration when no spread method is requested,
   instead of rejecting it, so that SSC can still be disabled.

Changes in v13:
 - New patch

 drivers/clk/clk-scmi-oem.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
index c1ebbdc6bbc5..29acd2923fd6 100644
--- a/drivers/clk/clk-scmi-oem.c
+++ b/drivers/clk/clk-scmi-oem.c
@@ -35,19 +35,38 @@ scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
 				 const struct clk_spread_spectrum *ss_conf)
 {
 	struct scmi_clk *clk = to_scmi_clk(hw);
+	u32 spread_pm = ss_conf->spread_bp / 10;
 	int ret;
 	u32 val;
 
+	if (ss_conf->method == CLK_SPREAD_NO) {
+		val = 0;
+		goto oem_set;
+	}
+
 	/*
 	 * extConfigValue[7:0]   - spread percentage in tenths of a percent
 	 * extConfigValue[23:8]  - Modulation Frequency
 	 * extConfigValue[24]    - Enable/Disable
 	 * extConfigValue[31:25] - Reserved
 	 */
-	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10);
+	if (!spread_pm || spread_pm > FIELD_MAX(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK)) {
+		dev_warn(clk->dev, "%s: spread (%u permyriad) out of range\n",
+			 clk_hw_get_name(hw), ss_conf->spread_bp);
+		return -EINVAL;
+	}
+
+	if (ss_conf->modfreq_hz > FIELD_MAX(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK)) {
+		dev_warn(clk->dev, "%s: modulation frequency (%u Hz) out of range\n",
+			 clk_hw_get_name(hw), ss_conf->modfreq_hz);
+		return -EINVAL;
+	}
+
+	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, spread_pm);
 	val |= FIELD_PREP(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK, ss_conf->modfreq_hz);
-	if (ss_conf->method != CLK_SPREAD_NO)
-		val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
+	val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
+
+oem_set:
 	ret = scmi_proto_clk_ops->config_oem_set(clk->ph, clk->id,
 						 SCMI_CLOCK_CFG_IMX_SSC,
 						 val, false);
-- 
2.43.0

