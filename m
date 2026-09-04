Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68C8455637
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 10:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516778; cv=none; b=p44ehfrBGj+EY8YR5X2aDrhl2U9wSD65RYZ/H2mbq+ZCiqoHCoL1PmZbo3lb9UiT1ic3lDLe1DbB5rtYXc4/BNM3/gtEBdJiVkrK/o4BatlOAWOkkuWmUKCAOxlHgGUqTLxM5jvQEHsqWIGpHuialgVV/8L1w7FoLNNZA96ociA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516778; c=relaxed/simple;
	bh=NiMVJbmVsoK8R121qi2cF+5KCHnnjg8UxRitDRHK/AI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MC3pAZqS2NS+zAOH0T4OPFpp+hZQDuyhfENDizNnR59hdNUlNgZY4hS/XvmRzTUntsjCvnhuhi5Z+92QzODe4Twpbu3C0kYYnSYnyYcTvpwLmijOnqCbpKYJq/PAdPCuhFaYldQNZOEmp0b/BIma3f1UbvtCYXGIhOfyu0OeinE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=jkv57C+4; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="jkv57C+4"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-482e257a23aso575156f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 03:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788516775; x=1789121575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fjBHI89nbApApOn8aT/Os8kMb1n8Jfct1CD1+zTK8UU=;
        b=jkv57C+48mN347W1j2kWJcKnKw9Mvsl73qJPHmMXY2Gcoa3RMwpxHduWxkalOt+IUm
         F0dzGMy26cOjWffdB8fGy+fp489u73jQ9rV4l+Lro7u5NxNXIleNx0w+iRG/L/YH6dzx
         Wb7eR1+vP3fiVcYx8GvxSj3edvn2X2X93SfMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788516775; x=1789121575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fjBHI89nbApApOn8aT/Os8kMb1n8Jfct1CD1+zTK8UU=;
        b=EHnp+5T6f40AcQW3tjWw8ejOKMfxf3ERu+bkCZ1fL/6SNuNPtvXAnjuih2hPTNCMcv
         6Gt5/hILw9+wybn5IO/EU2mfbAKfOrRMuhIPPCtcc+/QTOkF473Kk8LHMqKBxM4ug4fO
         ncJB8vL0jGFIhcb1cDVNN11WEfHA7gbndNnD6zQ1M+6cIx1TsXgACXnuLatSdf1ImplH
         uotilYjKaxgu06RxzJRItnwFmNgny+pG00W7wpqW4ZWg3bUqdEnqU3hGPZaA5HADKWAD
         +kc1Hsd6XoCUyek6ej6U7nG304uePHFJCy/8qMkuiwl86kMoSUiowrwwpnS8XMBuGU+D
         mDxg==
X-Forwarded-Encrypted: i=1; AKwUvBwzRg7a5C0UYyVZLhlw1Pv5FTIkez24R7eSMUn8MU5RcNBdICoLwB4GWCL67IPHWId3NC2H7oQf2zo=@vger.kernel.org
X-Gm-Message-State: AFuF++lmgdov2DYOl7nDau4bbrnTQdGhBu5DlCa+UwLGehZKpaA6LNMB
	0dXfUGVX5lAC0ppMQafxlUW1ykOFaKNJzODgLyTN9MqH5wiOPwRaxLNDO/YPlG8XU68=
X-Gm-Gg: AYBFou3IugGuWfSvDl7AH/F6wpWhTpzGB4655aSAUrSApMNxsEj7s0tBPRKbei043px
	UXhIU/Xdia2r+hWoKQzdIDGqnLF2EWlN8sU6/Rth65zRgHVV7UPG6lk0tzS+UBEce7Hyd/FJ7fI
	xLuhYcRd5ufWmkGZXns1Jr8bmBYwkUQqy9tNfkS3izjMW8Tmc2sThJfvdIJic3XFfXdn5THVV1g
	brkRV0Ypu9kfcckh6lTND0TRVkIl7ngNcQlc+e7AqekjnWD8y6w29FWD7UMDFwpSkMB3+UEi+xi
	mrEBgJPHxn4BiXhmOd4mnAVs9cj+Cp0Itj2+a1CKFlN2buCdhAN/IpI5dGtbsMvyHBygi+Xkzjg
	2T57ub5RieHqKv912dv8L1cCIckrB0YkkbODfqlM/jWX2Wvfq+UOmpBGNzBiROeBwPKbJnIeCd4
	S75shWPPGG0eVBBTlyteriQ4G1Wej5QV6LZeWkV95VkpKJPk3nw810y+tOwt252jpHlQOR4AKnU
	N9S7gsuMgeMFYXsIpk56RpXS6OtwJBu+Exx2TTDCLgJEHeQZqQFuMZlomCffXK0QsHucLJEkgir
	v+ot6YNIusJ6PPoCZARlQ6FscRzqACgQ/TYSJpzSUcxUOO1RQ81qkSE=
X-Received: by 2002:a05:6000:26d3:b0:482:f5f6:d253 with SMTP id ffacd0b85a97d-4858728a2ddmr6662967f8f.12.1788516774774;
        Fri, 04 Sep 2026 03:12:54 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-95-245-93-90.retail.telecomitalia.it. [95.245.93.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588390e30sm5317990f8f.7.2026.09.04.03.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:12:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH v14 3/4] clk: scmi: reject SSC configuration out of the OEM field range
Date: Fri,  4 Sep 2026 12:06:32 +0200
Message-ID: <20260904101243.412006-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
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

