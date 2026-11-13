Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595136;
	b=HIL5TmROe3GVbieSYQWcuNrJpPrQcrubksVlZqSurtlEdoBnWP/oX8nkSDYzFn+HeBqD
	 zQ88gz5IJFuOZEKLq37t90yMmQR5fLddCmJEYa/Xa5XwZSRHoQoNTkvwJNf91S6sj6W2o
	 7yODnupN9XkUctPv5RsxdK/SJoNqRQymIECXWqTBlFmcvW927ar3YVQ0BigYL9kpNHcHG
	 IPH00Pvns4TuRcTy9GuQHDC5cRckaUJUhyM6s6tRtGs830G/mS8Izki2ENxanh9CJo9wv
	 PPxUJ7D0zLdmZamnnOf3/MctCbYfZaBTsnYLAgfBMuytMXGNcaLtty3ixXXE6jJAJ/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Sw3VY4venJF1atVhTvwXrtNj2D+3nkqTBFYZ/2XS42A=;
	b=GGjWR1a11cOvl2OO7xjf62yaGlM8+nSWBCs+/wKa1nTApiTMyvNp3Z+JwQbtE5/3T7Nw
	 5D7dHL+st9IWo904eAPI1EKh12CPOiyPV3IU6hzDBYmMgBCqHrdUv2hoB7TUvj7DAbVR/
	 GwLUIG1up+/X+edssyMzIoFUiaI/hhFcfErfYznVFc/T6Et9hotLRxbyDy6X30aPEDjP4
	 eCDUXaVX0JB31ZDBJR45L5IiWfbkEGy7VM7JpmR6o5eHZaYt8necZ0bk+uXs8ZVf0doYg
	 daZGcNgNOklFJZeNfbCWODWsPslklncoytJp1r8WlGVw9rVUIPE/9yFgN9ezq1dfBxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Vst6mE5C;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780E460A6F44
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 18:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 780E460A6F44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Vst6mE5C
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48fd2e38825so910914f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 10:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595133; x=1795199933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sw3VY4venJF1atVhTvwXrtNj2D+3nkqTBFYZ/2XS42A=;
        b=Vst6mE5CjGatO1s/tIDQnK+/RmECvL3pLINuwWu7fejldmM1RN2fbX3bDKYbEKSb1N
         4HIYHlR3/59twf3HofB9WP5ewsvIMbLT1d5Qe1MiiwsLxz3Gd2qBmocuBq9Th6y9+yNh
         yHzOBMz5fhk+ArEEhCuft/eO1MD3fG74SlrxWFThxFyBaHF6X89WkOWVLZQPtTncED1f
         2P8GJgZ1S9YIbultkrMUQOXE1wzMW/pSJF8PKahffnIbfhKPZQ+Om768stynWX1tM2MQ
         jxJ4XuW7T5xLUnbOrGKOE5Omaon37WoDVyXkzxDUpPbsHBxpAwcRW3usjwnAvPLlobcF
         fVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595133; x=1795199933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sw3VY4venJF1atVhTvwXrtNj2D+3nkqTBFYZ/2XS42A=;
        b=ryOY0Bh+eHE32LSlU8tqhTlC7ZUQGgt8jIhQFxP7Q1a32pkYLjKxp0mbWJ1Gi9jWUu
         jYyKudS6fCe2CboFsU5W5/m9mVYqGRQ/qpVQplcnBIoyeGrBUea8KjHtPDqHYZzzY3cK
         zM9ej2frEYBsJL78QGUfIcbQ+nRgCmXamrofXgNVtXSdo4SIYFNogo9am6LUC8o5hXDw
         iKPDhwTzFWNHYsZQ02gI0wIp4IMeVH5HkhCyb7uCKP9LBwwiy1Qj2AH7BfMhXnY0smJE
         iqTMfLT1IuAzhuV8iBmz2HfExcTmtRvEJdfvXu5KJtp9l9Icw0wntd5mLIZIh+UsH/bi
         vFQw==
X-Forwarded-Encrypted: i=1; AL+hErEKK2Aul2UEhL6aw2PWvq/F2UJ+cTWjlCs/E32c5KOofA5FH/sL4TJGQG6SZdK82E9yt08sPFpLPjQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sVU0wCE2MmUb/WNJvAuAKl4VghD8a1SgCSf0uXTikAjBOUe/j
	Si9AjL8iDCcoeCPBtrkQHVC3dvqb4Ln/DHubV574o4xO+Tu1Dgyv6xAwfg82CnjsXO0=
X-Gm-Gg: AYBFou2/ZMryQ+fjL9fhMXgzEEMwc23Pnai2AawugmfiYS11Yd6VCMeY7MFg+9gFN7x
	zu0oSm9fQ89+f+NJBcD134kG/FxfXgTXa1+0+kAznIn8SWK5esBCrZrxfulRLruMRiskFMNBPSW
	cA+LAFkXQeLn1mciivW/Thhmz94NiaOLGw+AP4foYpSmocuuAZMBAs2ylus9QiTDPqu88frbC7J
	L41rFGyKbCV2Np7F3uaGlgCzFndlRGCCa844MrfF0mxgMzMB5ncF+xVao7qNimQD9Rn6Sruh7ci
	WZNqPc9qlGPRrlC09O/KsfKfMgiVVJMmVd8p7EbpdyXF7e3UbTFPTAG4C1TI6BkuH3e40uE+cFA
	RfY/exjJrdV/RBs2p1IoVMdUqto0Oi4orRpSuTaOgJXSPvBxkBpOkjrdDrpw4ClHRWUIAcbLciM
	DSSufoSACak77jlM4BdDKIktXJFOyqmT3zWGfaqh4PvHUzOsm8LK9jbO5cMoifrrwfI5roHk2p8
	dulLbNaG3p/g4gzHzgswKNDFX1naHgjMce5UauFdmvw+fyPV1fIFa9mbB09CaztQaB8jumE6L6G
	x0JiClUDuxqMQtS7vmngZLSv5xHXvDl3j3lw3Jm14PY=
X-Received: by 2002:a05:6000:4917:b0:48e:2114:8ab9 with SMTP id ffacd0b85a97d-49c71d47601mr7429673f8f.31.1794595132716;
        Fri, 13 Nov 2026 10:38:52 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:52 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:28 +0100
Subject: [PATCH RFC 14/23] ASoC: qcom: lpass: support LPM memory type for
 I2S LPAIFs
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
Message-Id: <20261113-topic-sm8650-el2-v1-14-5183f6aab9fc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2400;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Ljj85Dp8JvF1fw+pe+TLNZeTPrQAVHIWnxs2Ep+dAq4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kkA6T1QInfYxpV+J6J4XvHw8MCzkvvytuSsgeM
 e44ofF+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZJAAKCRB33NvayMhJ0Qh8D/
 9WMceRzL3eQ/W8wKH4CkoeeshIjXKdSlQzr03bF3qhKpiqfzXNwhS7HNpGGkBcT37Nr9FWJCd12oTs
 5mXCQMbqrLt5VbiYRSZGNRQyBjw5iG+1BIJEU+2D3lX+r8DlO4SWgb8i3YYVqQff+GEXDJ8dyGEV0m
 hzg5AX6+wqZaQ2h0+ZhiHWLLTJw2Mw+pF9CI6PpjVD+/gS53pzHmOd7/AxHJ7AGzmNfX/tkLiOVfQI
 JE6tqRZLugt9ygkO0i4eWFEcGQuCCvGfEEDPtbyRZzynrGTQN0gpUzQWp4JQzZn+cnHmpI6trIWEUX
 Jd9DzBExJdptqIifOcqoAVrTuhLjV+phPw49PxC0s825CqXui9IWTdxX6qrs2MxxoPVYW1nJ/hezkv
 7FFgVf8gEG/dfwqYgg0BMHX4tEf6Py3lIFNFkH0LnLLVdNiD+7XY0XzrzcyxXS29/ZPw177ig+H4st
 80frG8xG1ep+pLz9q3doJ3q8BN5DJa1C1xk6j0tHF+jctAPxgsHRn048IukPtCciRdvwDT2KJIEAQs
 ZxRssU+jIwKM4uYIAcguh1QkH38KmyH8C7HVfcuOey9rac3kpryCQ4EJbppVRbfIYF+yGwrnbyUqQm
 6kS7N4OEBQPmxu56Y6da6yXXL6DGYzdO0GjgAxwLlaXfnt4jyNlbiiP/z6eA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

When using MI2S on non-core LPAIFs, the hardware can only
fetch data from the LPM buffers and not from DDR memory,
like the RXTX/VA/WSA codec handlers, so add a way to describe
which LPM memory is used for each LPAIF in the MI2S
descriptor.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c |  1 +
 sound/soc/qcom/lpass.h     | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 411eecd9cbb9..9ebbc422c63c 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1338,6 +1338,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 						&drvdata->lpaif[lpaif_idx];
 					drvdata->mi2s_intf[port_id] =
 						desc->port_desc[lpaif_port].intf;
+					drvdata->mi2s_lpm[port_id] = desc->lpm_type;
 				}
 			}
 		} else {
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 70d64bf3f073..71f1274dfa89 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -153,10 +153,17 @@ struct mi2s_port_desc {
 	unsigned int id;	/* DAI ID */
 };
 
+enum lpass_lpm {
+	LPASS_LPM_NONE = 0,	/* DMA buffer in DDR */
+	LPASS_RXTX_CDC_LPM,	/* CODEC LPM */
+	LPASS_VA_CDC_LPM,	/* VA LPM */
+};
+
 /* Extended LPAIF MI2S layout */
 struct lpaif_mi2s_desc {
 	const char *reg_name;
 	const char *irq_name;
+	enum lpass_lpm lpm_type;
 	struct mi2s_port_desc *port_desc;
 	unsigned int port_desc_count;
 };
@@ -197,6 +204,7 @@ struct lpass_data {
 	/* LPAIF instance and interface index of each MI2S port */
 	struct lpass_lpaif *mi2s_lpaif[LPASS_MAX_MI2S_PORTS];
 	unsigned int mi2s_intf[LPASS_MAX_MI2S_PORTS];
+	enum lpass_lpm mi2s_lpm[LPASS_MAX_MI2S_PORTS];
 	unsigned long lpaif_port_enable;
 
 	/* low-power audio interface (LPAIF) registers */
@@ -261,6 +269,19 @@ struct lpass_data {
 	struct lpass_sstream_ctl *sstream_ctl;
 };
 
+static inline bool is_lpm_mi2s_port(struct lpass_data *drvdata, unsigned int dai_id)
+{
+	unsigned int port_id;
+
+	switch (dai_id) {
+	case MI2S_PRIMARY ... MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
+		port_id = mi2s_port_id(dai_id);
+		return drvdata->mi2s_lpm[port_id] != LPASS_LPM_NONE;
+	}
+	return false;
+}
+
 /* Vairant data per each SOC */
 struct lpass_variant {
 	u32	irq_reg_base;

-- 
2.34.1

