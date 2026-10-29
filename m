Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299077;
	b=WoyUDfEcyeU2ExjliWFhlt3n8a+JcPhRBY39gCfqbP2GTpZ5dfWldR1YehuLzrqww7TZ
	 30VCwjWiux8sfNiuinaJLrzBBvnUvI5LIZcTTBrDLQFvAgyn1ZMmqfgYmvO/M1nhaSuY4
	 DPwPSa3jInRkIvmzGDjVOSMU2P1uLi04oLK12ot0WS02LKSyuja6JkkQvfPqxCIep4jyi
	 aXRi+zn6rt1tLNoeqcc4ZaDxp2auY5ugRw41XAHtP7rMK/SMSojnJG3zSvKNGtwWI/omM
	 ghje3kqQTQSZf8JXOjtZJ270glfwZKDzQl1SVx1XnSb8Kb4t4QofUA/MGCmvPOpNCVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DCSLRnb0vtBw+c3BivhCF1ac7dx2yv+/JlPhFH01Ir0=;
	b=L9HgqgtEeIEyBGR1uxPcp60a4SuH6Mjn9Gas8ve4IIntA62YdcXyUVhsKwXAoec+6vHr
	 ptiSpk9zM3V8rbmmyQoeBfu7XogjesUAE5idxzI+9iMp5foyMgCaiyAdOJbT2xRuTmpVi
	 Zmv0Ra8Q16teygagoFeq0O5dPamps+EzPROK3YpM/Xl2xBewuUu0nedLDQ2vvluHEgEpY
	 iKfuFkfA6HBBBHO8T7nT9q43SIITO2YMddlN7pG7BmIJ9q5uKM09LIMwO6TWnYhks6Rc7
	 a4zjVzLpTfzPd93MZbxxdqtChmXuLkL3u01g/xdqPyjOaZtdrH94EWFDAX1yZtwuajQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PtRlp9Hi;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C25606A331
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 18:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91C25606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PtRlp9Hi
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so23041905e9.0
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 11:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793299075; x=1793903875; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DCSLRnb0vtBw+c3BivhCF1ac7dx2yv+/JlPhFH01Ir0=;
        b=PtRlp9HitDBZUFMr/Mb1qE3zNnxZYXubCstEyiWpdLTsCbtOuug/umH9VSHiw4vl6u
         8tWV4xexXjwsu2qbHGIOgvKvq+t6rcxXZ53HidIIqS/LiEkYvUoL6oV08ynAKkwHDF5v
         w0/XvAaW4Brh+Gt81HKfzuaU6R9tQ95fq4vJJOqztZqw5s21NAMHAckqIZGjYAzDoZEn
         EpDH425E2W7CDVfDzrNCXxFIiCMM8P9/Zny32mKXCNd31GlLmEHWsNm9h7uI/FXCwNi3
         9ty9Qtr42YXgqhuvHCpEQ9ncTpFhBSMRL3qaRbN8txhQvxQah35JAby+D+APMus9Nmep
         4B1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299075; x=1793903875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DCSLRnb0vtBw+c3BivhCF1ac7dx2yv+/JlPhFH01Ir0=;
        b=BcjZA+h0fcIRsllcElzR5EX+GWz2P6eUzoYEG/HuFw1sccTymySUzuXlmXj1NN6xU7
         huwBINOqy0buqhwrUns+usA2mrvl1m/zQRZTV2K52ybk+L4FpQhgnqvKmB3HQ2Dg4OId
         qK8+gjfjKmpudCd/v3Co3oJdMEeGTIptT2cjYIKiai1sXZsbgUuvHpT1cR7E8UiEbuSy
         zbbIImKHNp+xfRfZBJUCVdFqPnib+Fr53ThO3X0sIvimNGWqTC2uD59a75NUe2m3ujSB
         +pEy7kZ2GY8OcjRQh1iQcAsJnCSvZoyBck8bgC6socxwHxWPFVpvHFcv2HwzlvLauj6z
         cL4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzmVZxn+NWJiVq+owLDrbeNiKRm9zrBTIOLqIk8dPcnlibm26qi/281PmDMWDI+DDyP1VOLs+kKPMw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjsyF88ceEIM7dFtc53P8+bamuNgAPfI06u2JR/C83pF7lEVcL
	zpRjAgnxgSLiuCzgGBIOp6fizB+nOgf5LLV/jM0KnrulKg4AI/Ti8qZW+HfOo3C/6y4=
X-Gm-Gg: AYBFou0VbXbiX1O6hPbKtGY9RhyID0b/dSyzI8+lEaHyUcrojNLv4b8fasqd0dyB6W4
	TVpkX0u90mZNjCV2fkgGntQ0vWWtP5pTCOwQ+R0iG9o9QqaYORMqqC3ULQGAa1S65Pn1l7x4S1J
	TWlWyS2dAlAVymZStDyRKHUUGzzxvPgMNgrP4IvqSctEe+69fRkn7CjYyu5EgUO4UCzXYSTwekc
	vGZe7ZKUnwHtIiqM1+VPi4NglZ02yuIquBC6DE128DpO9hNJ2D6hAEvj+7D3QkfL6jJ54njPh7W
	KmSDtrEHP7Wtdb/m3yT1+4p5lg2foe5l+WdlpB0QZollRd/5hT98lWPwGX7F+maNfk544lfIVq/
	4rXoyZXI4MxhnfYOTiH8FlCXUnzIaf5/f990iZA72rXNbGCDNIB+VumXDVdcnrsUOL7OxUWX6ZB
	ZiI0kdypE14w93t4R9CLI4jQZQ6FsSBRf0oqhIg9JqJL8wEx0JOvSkAtcvlUcGzgK4vtGgn2I4P
	5JCVvniZqX9Hd+jpxkOvxniL95OzlKbX+AAszRt4kPEI42IQh1jy1f2y7FITZPcxWSeejLukBf1
	UKt+wWUOZI0vOraA+JzQIxrjSllXZKg+90HJAbbXxUJhx9kwoPhAE/0GCe7O8h246HU7QgkYBBK
	W63LuCzaNiPM14AiLMzk=
X-Received: by 2002:a05:600c:c8f:b0:4a6:42cc:bf6c with SMTP id 5b1f17b1804b1-4a9661ab555mr157927155e9.7.1793299074975;
        Thu, 29 Oct 2026 11:37:54 -0700 (PDT)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa820492cesm90118305e9.13.2026.10.29.11.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:37:54 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 29 Oct 2026 19:37:36 +0100
Subject: [PATCH v2 3/3] clk: meson: s4: fix ENCP clock selection
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
Message-Id: <20261029-upstream-clk-encp-sel-shift-v2-3-31ffbb6b82af@baylibre.com>
References: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
In-Reply-To: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>, Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.16.0

The ENCP clock uses the wrong selector bits. Change them from [23:20]
to [27:24].

See the S905Y4 datasheet v0.7, Table 7-58.

Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC peripheral clock controller")
Reviewed-by: Chuan Liu <chuan.liu@amlogic.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/s4-peripherals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index ba41fcd90588..33573eb85927 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -1114,7 +1114,7 @@ static struct clk_regmap s4_cts_encp_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_VID_CLK_DIV,
 		.mask = 0xf,
-		.shift = 20,
+		.shift = 24,
 		.table = s4_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){

-- 
2.56.0

