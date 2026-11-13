Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595134;
	b=yvrD7MqPWQ7iXutUUxSxELVeGDMlPPieieGPg3w9SeoqNeOhlKm+HUo2V94d//EvD2KO
	 +xGUg/1xiN0/erdVEKw0CPqB3B1Rjw1lYF/FD5L5YHItylHpjNI++cgmmotYwzK2Kr1tY
	 MIeONY+Kvlc3O6SmE+K0306NzX16axjhviChR7L5Unk8Z/M+6ECT6ZodpD73zbsC+y6SA
	 LUWAOaJ23fztpuPpEcHjI//XIkK4ePjSHqSNgjHt0F7y2Ov7AjZ3jSXEii0hcjljiw5Uj
	 0IABA2D0qjuCsF0FMkMSElHwgG7tsDWdzj1pteQmTUWRsbNAJoagP80vrjWI70p1Dfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=EYIDNpVzER8Z0Xx9q7GZ/NAesPklqBLcGef+EFqtLPU=;
	b=Mz+PNz7xhgZy0xN86ifhwqvE7R4QOGMjkKYMFF6sEPRclKHAKwEHnEgOwQ/qaFbw3slq
	 qP/9SaMmsqTh6pii29lUJMM7RRoTHabykP9YOOxY+CthsScmnU57ZyMJSDxYBkmh3chLu
	 GG/SQnjwZKbetQvTZj2RJTHQJHa7nhqg8+9k1VrmWIldLABMaVabPZR0M1V6ms6WvoIkr
	 yhXWijWaE7MhDp+nus3JMCOgxn9WUoA88gfWIe4DKIwktzJIoMQa/jdDXTt95xtCXj8JG
	 euEKkQYfINdBbg0y7R8xpiR24b3/UOeLLM49BSMxIVhu2vGdqX0aJzarjzRq4wroHTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FAhF5vyo;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C37960A262E
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 18:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C37960A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FAhF5vyo
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1081875f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 10:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595131; x=1795199931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYIDNpVzER8Z0Xx9q7GZ/NAesPklqBLcGef+EFqtLPU=;
        b=FAhF5vyoV6XKr4XzB6+bdr17F3jZQyI0k0N9QaUuIIlHA8m1DBBRFefsqeg6p9d+uL
         3uMaoiI7VIBAbxLKBGupKO4io5DgTlqFr6sVraV+SI3jBiivSb4kLOQd3kQzQtMnQSmb
         hZcEEDX8/yTwzBOeOHRc/iMG3RxOLWhdVzxEu/AqMtVJAl+Wh2hYzKjRNc2O0+vwYclJ
         LPcrjKpen5wyLXNLPUH9FP2sTkrMnDLWNNvBNKiBN0IaYujyn33bqVMxXMT1CVHWvZP8
         RvzkiR34U+c05QvIi5Ckay4+30vUI0KgQD2fM2T7Wp/BXqTxnuIK/okenFuR5Ntq7sdk
         rnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595131; x=1795199931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EYIDNpVzER8Z0Xx9q7GZ/NAesPklqBLcGef+EFqtLPU=;
        b=TBwd9vVyxZBCZs7M88qhGYxYxPCeHMxBXob6g6b++8jOGj0JU2ff5x3zz9CTwhOUPX
         E2wm7KoozknOl5xBZeAE8219R7vZEnIVRJpyWn0C1UwiqEOpOs950Qv7W35QwbfR5RUd
         rR465pwltPVnDKpu5M4DBEF2k6/0PjvVr0TUdoTUwnCDJCuZQSmDiXrcD7BOjSf1BkW2
         N+snWGioBpBmSzSN7v1gtiotsz+Re6mH9dQv+bQH7VJImJcs0KnoMp8sCaZdUzCAtT5B
         0EHCAqVhDkoOcJdfLbzUVPK1I4l8XtL9Nk0EgvFk5CJYU2916PruU75jPOoG5EDRPhko
         TM7g==
X-Forwarded-Encrypted: i=1; AL+hErFEEwm28p5ZyWzYcvx089aG/Xm/LtNFUM8nAQ4IbGD/zCpv/2PiWxaJo2ZU/6j2nV8ZK1chLtRCHD8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qDdFbWw7qGY/tqTCWAT3srbirD0DmL5fMVpBEA2KkL7VMv3yf
	YfL+N5Xo76TgMLjur1H4M8gNpSHRI6CMSHAzPRFIcE7cT/1PEqsWSduCbjQUJhEK5D4=
X-Gm-Gg: AYBFou3zlpw3zSx5tXFYJVvMAa8vO9zgsanqMFRCUdNJrxVi9EapvOypUNQILfj2lTk
	5j6oBL3KaP3RUp/Lnj3+sVTt6Af7vUXE4e4H93ERAP6mhnLDjO6kSvgbyvm5MbyOiEWKRpaqWWO
	Uclm87dTUPiHl2/USo6a1DiF5skgEhlujLbgTeDu+L0SIeA9aTR83yCX6475BYuHmItMdG7nNiQ
	7E1RIGFn+WTOj+HtKNOAktQR9JeIZRsS1nvOuHMzQzPeaIn+jgi8f7xtbcfdUZJyjsF1NnMT20D
	Jqu2yt/D2iRW6XHy13uGIYa+ypyBN59AgICbhChbXAZszUug4koj9DrCX18pr6Nh56K/oYJAzlA
	uNgg4kt2HXtmmdv8ILb4h3/DlMMcJIOaoQnzwbLJCb+4T3FpJkklGBFJezo95RWfxGGEg6wTQqm
	BAxkAzOb+5q5Dv/tpjr2V7ExP23SHlM9QXbkyimW6dnw3Cu0+OlqeavfBbsRP8jZOgjbSoWPfUi
	SgseTNy688jssLXq9HAx9/faxP2I4ppdGZdTraehAFct2FTB3QOQ2cn5uKGOwDQkJn3bAoXKrIA
	lQI9jkNrkppmQGRwblDxQZ8DBytNR7Bbc1ly1OxbGvY=
X-Received: by 2002:a05:6000:220e:b0:48a:fbcf:6f43 with SMTP id ffacd0b85a97d-49c71f334b0mr8528536f8f.54.1794595131343;
        Fri, 13 Nov 2026 10:38:51 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:50 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:27 +0100
Subject: [PATCH RFC 13/23] ASoC: qcom: lpass: support mapping I2S ports to
 multiple LPAIFs
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-topic-sm8650-el2-v1-13-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
In-Reply-To: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7993;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=9KnJtzJ/SJwJ+6EhothCBqJQpy4w3/kO7YhjVuAQIi8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kkTmKN3zdd/INW2MIHee//qDFh3rWxLb1FNskX
 spctTX2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZJAAKCRB33NvayMhJ0TMtD/
 0ecaTX5XJK6W6LiKRxaOeEEQ3+PBTin7TeMHMeEamLy3jlD3ePyxgnG8CPkwsegJSFkGDvUuFXuivQ
 XGEZVgcFeHn8zj6p+8k/sBxlJ2bah9+fe06pQ55lc10NSJRjY217H6o65G92R6vKf6JbJNQzuWBcNN
 BDEcAQ8ZWzYl0oo6t0vYnd2BM8jsnMP8NqOJrwRd43jhTNBcd0cVDt/RK8Y3RzTxHniUgPOaEDbeIR
 wl17bggN5Mgx35m2/gsPyM2NmTge6A664wIM89W3XruVW3AC2rvKk/fNajZT9w2UIIs3oPKYCLeu3x
 pgkY1vAVfxocYqm09GN5PX7m+aVaWfBK8K4YXfYlIZXBYSfVzr+AXScfuybzSfNx2XZHN2GidH4BNx
 1/jg+ppAE6yfeSVi5Kjaxwg9sf8Q8PTS1pHpFz2/qTVakkIzBocI1NYPx6XOmkKMsk34ScdebauL3O
 U+h/cAxTHT3TncWW11eVnunN4Wo56IfeRI3H7pWFeKQDpiVz8i3PJmj5mxecaJpisjXXvKuBiRVshC
 C7inSlmh3NMTUbqayPrmjoOid7A5qgYhcyzz1W8rOf22XGE8laB9KLS0bzDWW7//SfIQ/VLP/iS4YS
 fRW7+1z/idUhUzdK5ean5idwXwcWkW02dohPbdkDIH5COnbK/SHPTY3wAHOQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Now we have all the plumbing to support multiple MI2S ports
on multiple LPAIFs, add the optional descriptor and parse it
to probe the associated LPAIF when defined in the DT node.

When the descriptor is not provided, the behaviour is kept
as before and the 8 MI2S ports are mapped to the core
LPAIF.

Since an LPAIF address space can only be mapped by the MI2S
handling or the VA/RXTX/WSA handlers, if somehow the DT
declared some invalid setup (I2S port on WSA and WSA codec),
the probe would fail.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c      | 73 +++++++++++++++++++++++++++++++++++++----
 sound/soc/qcom/lpass-platform.c | 27 ++++++++++++---
 sound/soc/qcom/lpass.h          | 23 ++++++++++++-
 3 files changed, 110 insertions(+), 13 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index f8b9b2ec9055..411eecd9cbb9 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1079,6 +1079,8 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
 			data->mi2s_capture_sd_mode[port_id] =
 				of_lpass_cpu_parse_sd_lines(dev, node,
 						    "qcom,capture-sd-lines");
+
+			set_bit(port_id, &data->lpaif_port_enable);
 		} else {
 			dev_err(dev, "invalid dai id: %d\n", id);
 			continue;
@@ -1121,12 +1123,33 @@ static int lpass_cpu_init_lpaif(struct platform_device *pdev, int idx,
 	struct regmap_config cfg = lpass_cpu_regmap_config;
 	struct device *dev = &pdev->dev;
 	void __iomem *base;
-	int ret;
+	int ret, i;
+
+	/* Only probe an LPAIF if one of the port is described in DT */
+	if (v->mi2s_desc) {
+		const struct lpaif_mi2s_desc *desc = &v->mi2s_desc[idx];
+		bool enabled = false;
+
+		for (i = 0; i < desc->port_desc_count; ++i) {
+			unsigned int port_id = mi2s_port_id(desc->port_desc[i].id);
+
+			if (test_bit(port_id, &drvdata->lpaif_port_enable)) {
+				enabled = true;
+				break;
+			}
+		}
+
+		if (!enabled)
+			return 0;
+	}
 
 	base = devm_platform_ioremap_resource_byname(pdev, reg_name);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	/* Keep the legacy regmap name for the core LPAIF */
+	if (idx)
+		cfg.name = reg_name;
 	cfg.max_register = LPAIF_WRDMAPER_REG(v, v->wrdma_channels +
 					      v->wrdma_channel_start);
 
@@ -1247,11 +1270,25 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		drvdata->va_cdc_dma_lpm_buf = res->start;
 	}
 
-	drvdata->num_lpaif = 1;
+	if (variant->mi2s_desc) {
+		if (variant->num_mi2s_desc > LPASS_MAX_LPAIF)
+			return -EINVAL;
 
-	ret = lpass_cpu_init_lpaif(pdev, 0, "lpass-lpaif");
-	if (ret)
-		return ret;
+		drvdata->num_lpaif = variant->num_mi2s_desc;
+
+		for (i = 0; i < variant->num_mi2s_desc; i++) {
+			ret = lpass_cpu_init_lpaif(pdev, i,
+						   variant->mi2s_desc[i].reg_name);
+			if (ret)
+				return ret;
+		}
+	} else {
+		drvdata->num_lpaif = 1;
+
+		ret = lpass_cpu_init_lpaif(pdev, 0, "lpass-lpaif");
+		if (ret)
+			return ret;
+	}
 
 	if (drvdata->hdmi_port_enable) {
 		drvdata->hdmiif = devm_platform_ioremap_resource_byname(pdev, "lpass-hdmiif");
@@ -1283,8 +1320,30 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 
 		port_id = mi2s_port_id(variant->dai_driver[i].id);
 
-		drvdata->mi2s_lpaif[port_id] = &drvdata->lpaif[0];
-		drvdata->mi2s_intf[port_id] = port_id;
+		if (variant->mi2s_desc) {
+			unsigned int lpaif_idx, lpaif_port;
+			const struct lpaif_mi2s_desc *desc;
+
+			for (lpaif_idx = 0; lpaif_idx < variant->num_mi2s_desc; ++lpaif_idx) {
+				desc = &variant->mi2s_desc[lpaif_idx];
+
+				for (lpaif_port = 0;
+				     lpaif_port < desc->port_desc_count;
+				     ++lpaif_port) {
+					if (desc->port_desc[lpaif_port].id !=
+							variant->dai_driver[i].id)
+						continue;
+
+					drvdata->mi2s_lpaif[port_id] =
+						&drvdata->lpaif[lpaif_idx];
+					drvdata->mi2s_intf[port_id] =
+						desc->port_desc[lpaif_port].intf;
+				}
+			}
+		} else {
+			drvdata->mi2s_lpaif[port_id] = &drvdata->lpaif[0];
+			drvdata->mi2s_intf[port_id] = port_id;
+		}
 
 		drvdata->mi2s_osr_clk[port_id] = devm_clk_get_optional(dev,
 					     variant->dai_osr_clk_names[i]);
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 2400a6d16bb8..a953db262aa0 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -1375,6 +1375,8 @@ static int lpass_platform_pcmops_suspend(struct snd_soc_component *component)
 	}
 
 	for (i = 0; i < drvdata->num_lpaif; i++) {
+		if (!drvdata->lpaif[i].drvdata)
+			continue;
 		map = drvdata->lpaif[i].map;
 		regcache_cache_only(map, true);
 		regcache_mark_dirty(map);
@@ -1398,6 +1400,8 @@ static int lpass_platform_pcmops_resume(struct snd_soc_component *component)
 	}
 
 	for (i = 0; i < drvdata->num_lpaif; i++) {
+		if (!drvdata->lpaif[i].drvdata)
+			continue;
 		map = drvdata->lpaif[i].map;
 		regcache_cache_only(map, false);
 		ret = regcache_sync(map);
@@ -1468,6 +1472,10 @@ static int lpass_platform_init_lpaif(struct platform_device *pdev, int idx,
 	const struct lpass_variant *v = drvdata->variant;
 	int ret;
 
+	/* Only continue if already initialized by lpass-cpu */
+	if (!lpaif->drvdata)
+		return 0;
+
 	lpaif->irq = platform_get_irq_byname(pdev, irq_name);
 	if (lpaif->irq < 0)
 		return -ENODEV;
@@ -1499,12 +1507,21 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
 {
 	struct lpass_data *drvdata = platform_get_drvdata(pdev);
 	const struct lpass_variant *v = drvdata->variant;
-	int ret;
+	int i, ret;
 
-	ret = lpass_platform_init_lpaif(pdev, 0, "lpass-irq-lpaif",
-			IRQF_TRIGGER_RISING);
-	if (ret)
-		return ret;
+	if (v->mi2s_desc) {
+		for (i = 0; i < v->num_mi2s_desc; i++) {
+			ret = lpass_platform_init_lpaif(pdev, i,
+							v->mi2s_desc[i].irq_name, 0);
+			if (ret)
+				return ret;
+		}
+	} else {
+		ret = lpass_platform_init_lpaif(pdev, 0, "lpass-irq-lpaif",
+						IRQF_TRIGGER_RISING);
+		if (ret)
+			return ret;
+	}
 
 	if (drvdata->codec_dma_enable) {
 		ret = regmap_write(drvdata->rxtx_lpaif_map,
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 4407996fb145..70d64bf3f073 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -20,7 +20,7 @@
 #define LPASS_AHBIX_CLOCK_FREQUENCY		131072000
 #define LPASS_MAX_PORTS			(LPASS_MAX_PORT)
 #define LPASS_MAX_MI2S_PORTS			(8)
-#define LPASS_MAX_LPAIF				(1)
+#define LPASS_MAX_LPAIF				(7)
 #define LPASS_MAX_DMA_CHANNELS			(8)
 #define LPASS_MAX_HDMI_DMA_CHANNELS		(4)
 #define LPASS_MAX_CDC_DMA_CHANNELS		(8)
@@ -148,6 +148,19 @@ struct lpass_lpaif {
 	struct snd_pcm_substream *substream[LPASS_MAX_DMA_CHANNELS];
 };
 
+struct mi2s_port_desc {
+	unsigned int intf;	/* LPAIF Interface */
+	unsigned int id;	/* DAI ID */
+};
+
+/* Extended LPAIF MI2S layout */
+struct lpaif_mi2s_desc {
+	const char *reg_name;
+	const char *irq_name;
+	struct mi2s_port_desc *port_desc;
+	unsigned int port_desc_count;
+};
+
 /* Both the CPU DAI and platform drivers will access this data */
 struct lpass_data {
 
@@ -184,6 +197,7 @@ struct lpass_data {
 	/* LPAIF instance and interface index of each MI2S port */
 	struct lpass_lpaif *mi2s_lpaif[LPASS_MAX_MI2S_PORTS];
 	unsigned int mi2s_intf[LPASS_MAX_MI2S_PORTS];
+	unsigned long lpaif_port_enable;
 
 	/* low-power audio interface (LPAIF) registers */
 	void __iomem *hdmiif;
@@ -498,6 +512,13 @@ struct lpass_variant {
 	const char * const *dai_osr_clk_names;
 	const char * const *dai_bit_clk_names;
 
+	/*
+	 * Optional LPAIF MI2S instances layout when all the MI2S
+	 * ports are not available on the core LPAIF.
+	 */
+	const struct lpaif_mi2s_desc *mi2s_desc;
+	int num_mi2s_desc;
+
 	/* SOC specific clocks configuration */
 	const char **clk_name;
 	int num_clks;

-- 
2.34.1

