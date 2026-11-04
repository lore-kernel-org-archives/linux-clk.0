Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788589;
	b=fxK4HmuHmQcwVdzOgt/Q/ztJZLy+Ucp9ddFDUEN+jP4a0MNeQLNzuM3zQ1IxAgN5YHin
	 bzLky9hS0nvPrdCg9HgCjviUMcOlkAsnvuqp99FRS5fZy1JFcZsxwaDME8pyDgNAk62Hf
	 fS4sAUboVqvTozc44wmXLvNksfHx//c3AOBFpJATh2X9vf53U1t8NodRukBVfEinLihj+
	 7DrRyn/jNSPh2ZqVQzu2WY2GuRORUotvhzTB7Hzd6vWA9jb84RvtJrnNIQE20jfTAYRrn
	 mO6QN/ZnJyHCTJIBpgGnlniXBudqMuUusPEz2AuKbMhUGCMImdtO34r1mq+HUlGpP2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g8GDWpuJEEwiEELyHxABV+752CFxaNvpiplpVAXeeOs=;
	b=wiRl/UMlTu/W6NLMkMI9UBiP2M9DYRKcBqZ37YRLYI71XOPqKHiphpFQ2f4RpnptHrMS
	 I88ekHgKBVmi3vyYkRdrhVeusHPb9pJkTWIuPwS3ilRzp7yfK/9B+6XuwLZNHKhk24U/G
	 JQ6jER7tvvxnCz1oPxsA56l8WNwigwnUerz7Cn82MJkQnlV4Dl1qjzSpBq8McROu5gjK5
	 d5QXPmAs6FBYjxZ0s8Syw41JejxBt1yt1IuU4E+qqu3ozE8pb2OxG4h3he3ekPNnaKT5J
	 kmKpy0O6oGo7epJ+AOc6pSowaDz9OADq7E3Nknu+KI+ak9DpQ4ccYguQzX5WlLJY6GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ZoewCmxe;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5C3606A326
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 10:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E5C3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ZoewCmxe
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so330880f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 02:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793788587; x=1794393387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8GDWpuJEEwiEELyHxABV+752CFxaNvpiplpVAXeeOs=;
        b=ZoewCmxewUIzN6aiIcngtU40jl+60XtSwir+Tt5YZrbVwlPRzVt9zqOQyL/2XkaI/W
         6eAD+yC8vtvtBhAzkm7VnlG/6CYdjB2db6CMh2Yqpz0Ej3/nkaIWTvaSb7KtqKH8ndqA
         r322RBM1X+mbl/85NKWpX5q/wDRW9pTJ2HHx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788587; x=1794393387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8GDWpuJEEwiEELyHxABV+752CFxaNvpiplpVAXeeOs=;
        b=McYU9ZXFEECkEEpjWKB80CghJGiZz2sP8FEwnDObM0dRrBEqE1GxMuvIVJ3arjyLpm
         KDLQJ3EFzIYk4bASPrQoZ02RSzDeLng5czql07OKw3me4JDUhALmVOOh7pzkj1NcswJ+
         sQareHaO2FBaBQRVspW6cIbrk4kssCGd/0nQNw0WtimCUbovXu59DSiwufjjKq63ciJD
         YH3vKjSc54uD+oYABMTUqE/MOQhLenExhiyi1c29bZ6lqZnCpKhk0AsZccwKjOw6Vt1Z
         6CWdKQXUjPoFgyI0YsBQXiBtPgUm4FcrnfV1YJcFIA3ZRreedcX0WNnuEfKh/CsH32GZ
         6qGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaieqZ2TojH1kny33se2CpwywPLxrvXWyzd4tUeEgdjFPM4rllLYNuVumbmX3M3WhROFi089w/ymI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XibTHfwczgSO4dhi1NGAN8klgv0HO+Ox70DsuP0duXF+f/RJU
	salzAYIMPXbEnDzydSfdkXy1ckcl7cr2wN/qiedOBhJ+SZItp1sDXc7z0t+wg/sd63U=
X-Gm-Gg: AYBFou3qapSf0QldBIIanv5KP1QZP6bFFjMkjGRHhfMZT5yvsy1NDQSZjnj7ICVooQk
	orkRuzwLCM5Pu62iOTRkKtuRRUObRsvcJupUQjb1W43SN36dDRNo3QKQCO/sFyV9uRLMsfeW3r4
	ObYePcV+vPU7nkfWMNI+N3oLjB5VhSSkmli1t1bck01Xfh7MgN8ajrnrf+8ZcohLISJs69EE/wM
	X/VfJD/xyXziw5ZncV5kDUScpZQcbp+dM3P/LTstZXrSF/qqcs/o689AjVsuWQUVt/nBe9Kl4lE
	RLLuAaHh9H6EiJyiIhT78hxY5v3/le8UpSonQrGfF6i9w1I7NNaaWV7gPoY0ZIVUUB3DSw3yfcr
	lcRQN3CqN7wKP6fkABoRD6Ajd5h0ob/S5nMcajB9xomInrUAwWbSo4cXTDincNjoHykkauhBeGH
	umUOnmVXQZbI0BEn5ncIppyM31a/7OsSUy4qRa18OSL/Xsyu9zO/j5fBCIdQAKHA5vLJLaFm+DI
	ocryG7kFOULxUFpjSv4z6Lr8n9hhWjR6pLvT84VldXKQaaYMMFUwHw+RHtDFiEK7NfpBG6Ph/04
	LRdcRlC3ZmgGEbinlXrdm+Eym8gD/tI6eaETJE7oK1h4OiztJX/WQIv0XhcXa3GdHcCeBaN+GfH
	4H0Ghf4ycMU+mV2oOJUfUykgX9n4bg3odxzMB0yPUSfiL15y4zUY=
X-Received: by 2002:a05:600c:6087:b0:49f:f099:6fb1 with SMTP id 5b1f17b1804b1-4ac17753befmr352610105e9.15.1793788586637;
        Wed, 04 Nov 2026 02:36:26 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([217.201.213.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm141685155e9.4.2026.11.04.02.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:36:26 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>,
	linux-amarula@amarulasolutions.com,
	arm-scmi@vger.kernel.org,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	stable@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v15 1/2] clk: scmi: fix SSC spread conversion
Date: Wed,  4 Nov 2026 11:36:02 +0100
Message-ID: <20261104103620.4054694-2-dario.binacchi@amarulasolutions.com>
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

The spread_bp field of struct clk_spread_spectrum holds the modulation
depth in permyriad (1/100 of a percent), as documented in
clk-provider.h and in the assigned-clock-sscs binding, while the i.MX
SCMI OEM extension expects a value in tenths of a percent, as pointed
out by Peng Fan.

The conversion divides spread_bp by 10000 instead of 10, as reported by
Sashiko, so any valid configuration is truncated to 0 and the hardware
is silently programmed with no spread at all.

Divide by 10 and fix the comment accordingly.

Fixes: 77369b1e6a37 ("clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260901155657.6A5981F00A3A@smtp.kernel.org
Reported-by: Peng Fan <peng.fan@nxp.com>
Closes: https://lore.kernel.org/r/ZR6PR04MB375776A27E98F140534E8F7FE488B62@ZR6PR04MB375776.eurprd04.prod.outlook.com
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v15:
 - Add Cc to stable.

Changes in v14:
 - Add Reviewed-by of Peng Fan

Changes in v13:
 - Divide spread_bp by 10 instead of 100 as requested by Peng Fan.
 - Rename the patch title and reword the description accordingly.
 - Add the Reported-by/Closes tags for Sashiko and Peng Fan.

 drivers/clk/clk-scmi-oem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
index be11d359b4ec..c1ebbdc6bbc5 100644
--- a/drivers/clk/clk-scmi-oem.c
+++ b/drivers/clk/clk-scmi-oem.c
@@ -39,12 +39,12 @@ scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
 	u32 val;
 
 	/*
-	 * extConfigValue[7:0]   - spread percentage (%)
+	 * extConfigValue[7:0]   - spread percentage in tenths of a percent
 	 * extConfigValue[23:8]  - Modulation Frequency
 	 * extConfigValue[24]    - Enable/Disable
 	 * extConfigValue[31:25] - Reserved
 	 */
-	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10000);
+	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10);
 	val |= FIELD_PREP(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK, ss_conf->modfreq_hz);
 	if (ss_conf->method != CLK_SPREAD_NO)
 		val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
-- 
2.43.0

