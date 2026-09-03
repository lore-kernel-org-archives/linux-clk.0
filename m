Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E7F4E80D3
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 15:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449939; cv=none; b=CZZFH9Qlo96U97gL4JUYBJjygTmHcGHNN5IPDwKp/z10Nwh9OBUaV2B3oYWeyX7gAHd7s0FGY1vxBtIsHwGliNDHzZcbPOla5qY1nuxjMi871N7vkkhkzaGYxhXjg3dveJ1PWfdAbz0Ae46SLLcz+wqgCa0GsXaHZ9Q0sKrfVG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449939; c=relaxed/simple;
	bh=ZU89zNZTonpu3UTAUBirVROwnLH5x3/C32l17m76c3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pkYmOWK2T/fsr53LZ/2wJICw520HUeq+pTl4/OWIoaL6hq0slVh2UZfWTTznYmS4u5p6K4w0PnShQWrnjNcvC4V8Y8xROueR2C1HYag83slxwsfmoD7PQKGb4c1H4y3iQuyfG4vDoFT9PvGouaDsH225LaL+1LpmkM20ixr02uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=MP9FYoSN; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="MP9FYoSN"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482dd6ee390so63f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 08:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788449936; x=1789054736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1yqnW0S/sSBoLbGGpdBGirLwApxYqu22jjVHzyaFhI=;
        b=MP9FYoSN+5IA4d3AmgmkLfgU63xttOdhXK3rbf3ew7qo5/pLCRsMk0MQSgMlsbdjxc
         P7Tn50R7V0sJsu7oWSH5jD+QuD68MCxCkdg1I3460+6zTLsy3+XsdO53jLU87bHdTjtU
         6FvHVAE8nwjrfANIYnrI4OzR5XepzEp1bvlEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449936; x=1789054736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f1yqnW0S/sSBoLbGGpdBGirLwApxYqu22jjVHzyaFhI=;
        b=LuEszXPKo9wJRwUuRdUOTOPXHRdOaRps6N64vJEtyv/IHegLWoOodq4TvsipQ8ukSi
         fP/8OE3uGEh+2ASFrVbRJXG5Ea8eaReRVW/iBR/pyBtPde7Uia+iQ0p4wMkYWZJcoQtu
         gzhbIdvSC13UQmBQdloWLJST4NQT8P76ChMjLos7PBOuWcsivsPb3937xiKSEl9gJE77
         68yy5UfxBVa486dgKm4ocrON3sHkZHSSuOxktKUNUewQquAeLzAwHkYXoGFxoNG6r6XZ
         yNG7o8qI5ksJ9Cv6rqrSmPrTp0UpJibFWwfMO2g6j3WrxrcoWRWpWGtfJbkbBUeNvMGS
         Mrmg==
X-Forwarded-Encrypted: i=1; AKwUvBzSDiR1ZelkVHipbufAUiTGf+hPLKtqMckjrtNOqsqyY2b4z+NyJFctCIrHtE6Vju3Pd6BMUX7UE+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lWJy/vMdjTFmTmKGBVPzWTUcCxhd9HRm81+kv4JhAN0B4Y26iX
	RPhGgC8KP77JCm8OOIeSI3QOptvHyccO35tU6zRpqj2Q71qu4TeMUOxY/PJc10yqe7E=
X-Gm-Gg: AYBFou0/y+MtMp3Ab0EwvVZ5LYi+VK8iTRnh4EyME6BQt/utcw6kJ5a99FInIg/4/Iv
	D9WCHVGtc4tQB9DW7oKrVKdQyvz56a+eL7KpPoGH99Ch0lRkfFQ1N8ZmyNvhPS48jkM3EVQrnGG
	U48enApR4HpuPFRzbH/PdjTuvpyA0JadFD6FMdioO53FBMxiMOeFd1FFMJuZCtgjD+theZy2GAS
	w7aub+XcHwCd2E3eIU/fiVOQYpR+GtO0klf79T9AGQZDhwJmn6Wd3hDrDDIPRxd/dg1VnLcrDKK
	Wfq4Z7Aoo+QrV1otvEn1TUVtytgpf0OplKVvdBDp/Ww+GlGKkMLqA1pEUlWjuMNB2c3Urr7/Ro/
	xgV+dQK6vM/DxE/6jnqWIpiPMShS5AA68x0gKO7f2XQLhBpjPABp1al2a23LGWsLAv+nwawv/kt
	OWHh0XcxVdRuSR9N6Mz7lVRp19yJBvhf7WJ5Vt48Hfob8BPMSh/LkIPFARMZPCj2nUZNfFfE50E
	KQj234CEn7q+09lj1TyuUwMnh28JAjAQcc6fwy32/zRESofiLYOb057AONiuxGHHdv6MysPjRIs
	Vq7i8z79mvTYjHIr4AE6Je3Q0vYZtcFJGA5fAWUX28y7XldMRHUmV1s=
X-Received: by 2002:adf:e3c1:0:b0:485:847f:fd82 with SMTP id ffacd0b85a97d-48586034408mr1988754f8f.8.1788449935865;
        Thu, 03 Sep 2026 08:38:55 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-95-245-93-90.retail.telecomitalia.it. [95.245.93.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72df2sm15366301f8f.1.2026.09.03.08.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:38:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH v13 2/4] clk: scmi: reject SSC configuration out of the OEM field range
Date: Thu,  3 Sep 2026 17:32:14 +0200
Message-ID: <20260903153836.373267-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903153836.373267-1-dario.binacchi@amarulasolutions.com>
References: <20260903153836.373267-1-dario.binacchi@amarulasolutions.com>
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v13:
 - New patch

 drivers/clk/clk-scmi-oem.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
index c1ebbdc6bbc5..4dac608edd4c 100644
--- a/drivers/clk/clk-scmi-oem.c
+++ b/drivers/clk/clk-scmi-oem.c
@@ -35,6 +35,7 @@ scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
 				 const struct clk_spread_spectrum *ss_conf)
 {
 	struct scmi_clk *clk = to_scmi_clk(hw);
+	u32 spread_pm = ss_conf->spread_bp / 10;
 	int ret;
 	u32 val;
 
@@ -44,7 +45,19 @@ scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
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
 	if (ss_conf->method != CLK_SPREAD_NO)
 		val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
-- 
2.43.0

