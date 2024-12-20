Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C411C07DA
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 10:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734690352; cv=none; b=BZG3pS4j8ZR/PgaZM5bBiaHb0v0intbD5RzzJnD1mVq2+m1jCmA1/EO02vv2lIxnNc8pDvyuTtUW8B9THcg38ruezSzdC91tgnKa5xDm+lTNHnORx08YtqwBdo3YHGAszdXPREazD6d2gwvzIIssx8o+ZEg5KD43uBZJjfCCChE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734690352; c=relaxed/simple;
	bh=pjbHjEyvAPQg8xcHFTDpuSFttT8eA1MfiRhiLNmBp+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QiaMXo6ctTLmvlWohnIkXnY0SJZUmSLCKqMlJ9o7app8XAUg2g3FyPfzScOF6eBU7rCSTsKUpdtbtdU4Zp67o/eanCKmsCh7urUWGMgpujsClrI4GIcxn8mPGUqush6Y+9c/XHwPX6ZmeIM9H7RshCJMaCbMrdg8wN1vU3mceiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ku1vOh+z; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ku1vOh+z"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385de59c1a0so1111673f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 02:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734690349; x=1735295149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tW+UtVxBTIei8COHkRsDNzEfLN3gFvFH+d/3sNPCK9c=;
        b=Ku1vOh+zyzIueJCcBP69e/QlwrdE0VjCyLfi/3eRr4g5HoO+HODgO6Hu2YSKH8kvte
         f0WvJNNkan+9sC28O9vGl+jjqLImT0IUIARd+vQPEqqano3b4UEI3LW7x0iYEP4a43g7
         hYtOz52+0FROzT6XiR2+hMeTJuUf1ZMQTBGoQhZMH1fZ0hgwheyQ6knMpOM0RTCIaHMl
         5AH6T/CUFxj9c/7kInU5YfIZ1WoBJxcKZsN7u2nip9DoR3QHmV+jcSn+NLt/YNbTd63n
         eVu/8FlkjWU8kZ0iAwgTQUwAWMj+Zv0LMFVHh3/Ju8rJjF9oDppscnXnKZywQBIQXwKU
         ckNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734690349; x=1735295149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tW+UtVxBTIei8COHkRsDNzEfLN3gFvFH+d/3sNPCK9c=;
        b=tLzb3wJffNV+vX8N/huHak7q5feGWBt7+KXmH9YApSsqIGnOc2YWu7MphzXcpb1Npn
         1gZlzh/QiDrHeaPAZirNpgeb67wzGPrdO0SYZQdh09pLexgaRl0bYwC2Xl7K/JGhnEQv
         bdzVCcVGDC/5xhE607zxJ4Vp+BOA6MWAP8yZRwEny8veKIEEEMWrYtig2EVoBZ23SJfc
         yl6Nen6ig6PktxMugfrab6lWnMk85hkESP+0hfGzWni5rZ+36CvALhvaJrgtrYVCIcT7
         taqict0PB7F5wvEgAqPEKPF/gNKpAFXV0M0dMtC3qBwy3ccP2rYwCxJfODgmTP5P45uy
         9sPg==
X-Forwarded-Encrypted: i=1; AJvYcCWXFJhfEiy8IMRkZbVRhcdK9ZVmnH6hoBNcsMWzWWqwMx7eX5domWR/HKKjdGQUaTuk6qXIaKnTrZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzwCT4i/jjBOZO9CTZEIFQO2R+Qpg8oi5+DVhtuKzRodrCzMCE
	MP+woD4hJ6yFTxLUd6XtS//1lRKYxHaDNQPNkJmNZSJbSBUWOvCTKs9oPAxqs9Q=
X-Gm-Gg: ASbGncvXcqiKvK8wqAHA/0qj2g8ZIO70USDd4MSOFCqOes7H44mjBdhRopCofBuwO8w
	gnEQRnbo3L75PgTrjwcUVP+rzKIkmbSQHCgGCdBecKzK1K+YxWtG/XEVYDN784FTOXYAJLQxift
	/DGY5QYYRtbVT66xO4v/ERdJsLSFaFHhpUGforLMUpqUX6nvjl+5+3wkNO2Fx96WcLyBk+lLfLJ
	GYHPTWoXmIMhjD7+mNDK1aCrd+8Td4q5VsCW6nXSF3uoE5lNeZhgvTMYMOYpFzEW/u2cyU=
X-Google-Smtp-Source: AGHT+IHNHc8Exy8WvIm7auYFTudT6vC7NcI8W+IOnuoZKBIcVv9XpVb+nroKXjYEhD1E+1wL9opJ5Q==
X-Received: by 2002:a5d:5e09:0:b0:385:e3c1:50d5 with SMTP id ffacd0b85a97d-38a223fc3d0mr2630378f8f.48.1734690348184;
        Fri, 20 Dec 2024 02:25:48 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c000:46df:1e3e:983f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2b0sm3752071f8f.82.2024.12.20.02.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 02:25:47 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 20 Dec 2024 11:25:37 +0100
Subject: [PATCH 2/2] clk: amlogic: gxbb: drop non existing 32k clock parent
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-amlogic-clk-gxbb-32k-fixes-v1-2-baca56ecf2db@baylibre.com>
References: <20241220-amlogic-clk-gxbb-32k-fixes-v1-0-baca56ecf2db@baylibre.com>
In-Reply-To: <20241220-amlogic-clk-gxbb-32k-fixes-v1-0-baca56ecf2db@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=pjbHjEyvAPQg8xcHFTDpuSFttT8eA1MfiRhiLNmBp+M=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnZUYoWqwNK0m6lGtma3zHCdJr4WdFQbjpstf6M
 NT7ktMFNKWJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ2VGKAAKCRDm/A8cN/La
 hUVUD/4isn20TrQjB+fmFaSq1xSlWcpPgFcHvJuxR95RlrgousUI48fqZvhvGIL+njYoZeObqbb
 SHLywnkm04pRxi4Y6Ay7mNTjQ0aTdyjJg6Tdpsg30z8O0r2ANI3lG3E5n4EU0+kwbu+3ySasFeS
 x2naisfqrFsb+X44XwyxFIdilsExWUgnDkwa0viM1GxuIGl7HBucFz/e2kAYnu0az5DR1jXv5hL
 Ljxi+HzcSctiJAovQ3jrrBw/p2jvbzqZGAP2lRDLrKrG3iPjYvtA0e8xAXNZnORmu3flR33KBUM
 aEdKXbCKEhfG7aQq5UJU+pfshiqKbwv770v113dN91SdJdjnUMLc13BPSzN/NZ4+E/6+7JDGQNl
 BbqFB1HspcnKRuAbIzv0HYkqU1CbqQu+WT3FMRGDsoCm9UDQQ27CAXnHPZY9xj3YpfAHlWZmS48
 e1SZC86Q5+dwGao5a4GYy0wOUxgTnxrsKrp8OC8YctSks534oWxskMdGKz1ydCCIXV4S1I+9l6/
 ej0gPrZ3TX+n5lUhg9FCmp/XObOqxAB4GTkwDWmwf/aJ+Jx7DcKneiGbcpYKUz7PGoJd7CTD1bI
 yFdTGbhMH7IDVtc4B8ietbyCfJi/5NLkaRHN1IxVnFevjHQeP3k7n/fv9cd/ZImVHGbHB7Y1DRJ
 kGHADgAUvWjNxoA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The 32k clock reference a parent 'cts_slow_oscin' with a fixme note saying
that this clock should be provided by AO controller.

The HW probably has this clock but it does not exist at the moment in
any controller implementation. Furthermore, referencing clock by the global
name should be avoided whenever possible.

There is no reason to keep this hack around, at least for now.

Fixes: 14c735c8e308 ("clk: meson-gxbb: Add EE 32K Clock for CEC")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 62494cf06e7d775bdb18b2242c3d45bf246bdd0e..66f299f6fef1442ead5e978c1d3750b55b800c2e 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1266,14 +1266,13 @@ static struct clk_regmap gxbb_cts_i958 = {
 	},
 };
 
+/*
+ * This table skips a clock named 'cts_slow_oscin' in the documentation
+ * This clock does not exist yet in this controller or the AO one
+ */
+static u32 gxbb_32k_clk_parents_val_table[] = { 0, 2, 3 };
 static const struct clk_parent_data gxbb_32k_clk_parent_data[] = {
 	{ .fw_name = "xtal", },
-	/*
-	 * FIXME: This clock is provided by the ao clock controller but the
-	 * clock is not yet part of the binding of this controller, so string
-	 * name must be use to set this parent.
-	 */
-	{ .name = "cts_slow_oscin", .index = -1 },
 	{ .hw = &gxbb_fclk_div3.hw },
 	{ .hw = &gxbb_fclk_div5.hw },
 };
@@ -1283,6 +1282,7 @@ static struct clk_regmap gxbb_32k_clk_sel = {
 		.offset = HHI_32K_CLK_CNTL,
 		.mask = 0x3,
 		.shift = 16,
+		.table = gxbb_32k_clk_parents_val_table,
 		},
 	.hw.init = &(struct clk_init_data){
 		.name = "32k_clk_sel",

-- 
2.45.2

