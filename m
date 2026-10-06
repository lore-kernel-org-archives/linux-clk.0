Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B9138238D
	for <linux-clk@vger.kernel.org>; Tue,  6 Oct 2026 06:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791268986; cv=none; b=q1C5sCFiogzzJy1ZOFqTFYRVFzZt5g/+M/juY0cL1pqH/DZAHMb6CIuGZ2rjNcydq87lWIMUnOOhjauMT1oeOzLUWdbW5dCR952XoN4aVe+9pU6CAQYhK2Fs27MfEQgcihdPXr9fKbJ6fjUBiwyY1nV+GRspzg6EBmBoAvAgeWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791268986; c=relaxed/simple;
	bh=LPA4AM/vfcSgBS/S0JOUdZBplbpkl3iyy1X111JdKXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OezEwCpNDxgdEqkdF2xsrKo6ozENpzX2NcG7wrahP63krvE7KQMtVqHGXnbzkQgiJzy6mYfoh0P1ve3UFWP79pvGpwxrxm745t9G5Fqqy/WemSTWVCI4mRDzhvIDhwIfTAVziqUpj8WJQQv23ZAQCdDWXj8HzBEsHU/Mx7DpV30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DcU7Shu3; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DcU7Shu3"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33fb4680717so7201200eec.1
        for <linux-clk@vger.kernel.org>; Mon, 05 Oct 2026 23:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791268983; x=1791873783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HcianPOZJYcBmieDb1o4dWGCk/aX34XvMBlFCiEYCc4=;
        b=DcU7Shu3YMzQvz60HJZoeh0S3B7cQZDcYRR6NhQKWaux3nmQ7SfQ20Ilz920CJvgDt
         Zz5ESqDIUklR6U3B0HN6ArWK29x/wNLKWbPOeEcQsRohrOQ+B/rOTkxqyCQvQM9KQyfL
         cScUg+hKd/QWsCmXBcbfcbh400AsgFxjD/7aQIVhi41/6hnN0CcYBR3oydMqF7J/GgCy
         lmlljRVsV0DmLDgqLbiokYVsAD9Z6chFFjeoXdZe2zXRsck53uAiEveuCfh80HqYMcRL
         W9bJVvCyutAQUCU45q3wQzRxb20i2SPQHvMwencQqun84u5lS07Ig3o2LKSrEzVPNmP0
         5hzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791268983; x=1791873783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HcianPOZJYcBmieDb1o4dWGCk/aX34XvMBlFCiEYCc4=;
        b=qj0a2lXZmBpOXDNSQFspSLdt805b2SfNhBHDQ1aD5qzpoBPYnX99znDC2HMFTro4l2
         SC729Hr/hBBvuUMoSYnBBf2zNTGNYo8fAXyK41MI55yeltwitA+SBZIWjClZNzJoIWLL
         qrNJAOE5fcEFVRBVzw9S/8EC0LIaSZAGUc/5RblinMC8VmDx3bs/KjaHtskrnafsypAk
         eIjplji7plN3Gv3H8R9yacEYc/6oQ8G/emg8KwxKF42CpjkLfbf2IKRIKi5jKA9/BX2l
         /8tg34dr+yLeMGgA64eEkr/QD9B7ASByITuYrKZr4QIWi1rDx7vGgVQwN6KftzCmg7xf
         WGSQ==
X-Gm-Message-State: AFq9FYKC/n6ExkfJougy4qtXmZGMB2avN+Oy0qstLQo7UEENCVrkCbLy
	qfCRwaQnPpm5SD/hkoW6NuBD/8jgCxpjTRJeBa7JdsdZetLocM4UJtBP
X-Gm-Gg: AYBFou1M+ILq9RQCisYBn0xdWy4XeZyZBDT0ZBIe6oS3KOfrbYYS6N8g7HE5ZpFUXWj
	78nLlgiiRSE4RpMTYJlvM+a9UQUVYRtnSrhRjDv40ke31jNr2zQeHZyiJ/4FDsYE/2rg7cstmyx
	DsVCiXaCsNfbnQAF2pgMWlWsvOLeRbvnhiMXv+mknxIREITjmJMtZsq7VZuvr3APxNH7pE/dFYF
	u/PlmrhUwZ505b4UWqvHettdLqOMOK1i/CxYcGxKMLjK9ieLGm7q6ytrOQ/Uz0lO9nlofx8j2P/
	HaO9iOBL08kJ96xPIbxDJSFRRqAVLO0SUPB3YoAFA4Z9Dd5XJUTRsZaU0Sp873DcWBLBgQLmVa/
	AwuQv7xEaDmWf/7+nqUb3Em1/g93rUhw/GlBbAfyes26BzBnOlWVOrIRYhcWDSgDazUH/SWeEvA
	wQg03ABrxhc6wDpfaAWn9Nm6yfgHUNjPS1krF9WrdufBiqdBqhm5LjcdDNMT4SK/iM25YEEOmHP
	4RCStsL
X-Received: by 2002:a05:7301:18a3:b0:34e:67d0:bbb9 with SMTP id 5a478bee46e88-351116caa62mr11416936eec.29.1791268983110;
        Mon, 05 Oct 2026 23:43:03 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:55f5:25c3::3c3:b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a2c991sm4617347eec.14.2026.10.05.23.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:43:02 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Tue, 06 Oct 2026 14:42:24 +0800
Subject: [PATCH 2/2] clk: mediatek: mt7629: add RTC clock selection
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-mt7629-rtc-v1-2-e556386df816@gmail.com>
References: <20261006-b4-mt7629-rtc-v1-0-e556386df816@gmail.com>
In-Reply-To: <20261006-b4-mt7629-rtc-v1-0-e556386df816@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

CLK_MODE bits 3:2 select the RTC clock source. Selector 0 uses the
40 MHz crystal divided by 1024, while selector 3 divides it by 1221
to provide approximately 32.76 kHz. The integrated Wi-Fi needs this
/1221 source.

Add the /1221 fixed-factor clock and the RTC mux so device trees can
select this source through assigned-clock-parents. Keep CLK_TOP_RTC
for the existing /1024 source.

Selector 1 is reserved. Selector 2 is documented as an approximately
25 kHz PMU bandgap clock, but its source and control are not sufficiently
described to model it here. Leave these entries unmodelled while
preserving the hardware selector values.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/clk/mediatek/clk-mt7629.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index e154771b1b8b..6336f8c4167b 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -285,6 +285,10 @@ static const char * const infra_mux1_parents[] = {
 	"armpll"
 };
 
+static const char * const rtc_parents[] = {
+	"rtc", "clk_null", "clk_null", "rtc_32k"
+};
+
 static const struct mtk_gate_regs apmixed_cg_regs = {
 	.set_ofs = 0x8,
 	.clr_ofs = 0x8,
@@ -367,6 +371,7 @@ static const struct mtk_fixed_factor top_divs[] = {
 	FACTOR(CLK_TOP_ETH_500M, "eth_500m", "eth1pll", 1, 1),
 	FACTOR(CLK_TOP_TXCLK_SRC_PRE, "txclk_src_pre", "sgmiipll_d2", 1, 1),
 	FACTOR(CLK_TOP_RTC, "rtc", "clkxtal", 1, 1024),
+	FACTOR(CLK_TOP_RTC_32K, "rtc_32k", "clkxtal", 1, 1221),
 	FACTOR(CLK_TOP_PWM_QTR_26M, "pwm_qtr_26m", "clkxtal", 1, 1),
 	FACTOR(CLK_TOP_CPUM_TCK_IN, "cpum_tck_in", "cpum_tck", 1, 1),
 	FACTOR(CLK_TOP_TO_USB3_DA_TOP, "to_usb3_da_top", "clkxtal", 1, 1),
@@ -458,6 +463,8 @@ static struct mtk_composite infra_muxes[] = {
 };
 
 static struct mtk_composite top_muxes[] = {
+	/* CLK_MODE */
+	MUX(CLK_TOP_RTC_SEL, "rtc_sel", rtc_parents, 0x000, 2, 2),
 	/* CLK_CFG_0 */
 	MUX_GATE(CLK_TOP_AXI_SEL, "axi_sel", axi_parents,
 		 0x040, 0, 3, 7),

-- 
2.55.0

