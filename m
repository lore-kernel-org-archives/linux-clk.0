Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A924242048
	for <linux-clk@vger.kernel.org>; Fri, 22 Aug 2025 06:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755844143; cv=none; b=M3AU/qfa/DJUQowhAR/HAtP47gL9L0dAJq54/1N70JpXoujnVGyEfGCBNMoP8Q9hphqEMsPePauzeqh6v3yAoleZtBQAvciP+hXm/p1qVTbBiXzP3fFm5fTua0TuPI74aFB3xf0SK+vJb6cw/e08TALhwwp3VkfP8EoyBQ7OaBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755844143; c=relaxed/simple;
	bh=CDQnJj3KcI7gr1gzNZoQr1S3uzUp3/HF6QMZuuEmugI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dZdNqUGThlbyM3BHJ8wpr2ogpP+VBGE/Lb30XHX56UDTCH1GZYyofbAxQfNN5uI1BfHSJ264TCGHg3UlfmcqhowCwZ/MXjiIMnKAXJugriEeOelX9O7V4kwLfX3FEsu1EUlY8MnLaifpVQdvfbG9P0l3v7WLglEcrdRMxnaFRDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=djFdonhQ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="djFdonhQ"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-32372c05c5dso1500365a91.0
        for <linux-clk@vger.kernel.org>; Thu, 21 Aug 2025 23:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755844141; x=1756448941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AxFZWCSKR4desKiHPJ6haTS2ebGrBTXqENWB7tlhWOw=;
        b=djFdonhQsnHb9clygPy86+SpKvswI87LLWaknjEoB9ByYKHdR4H0eAJnXoB/e0oBXL
         Nur2hv4xaA1ZWOxsJB9Mvrdp+SKsd9sOKVjcHp/X0IrABXXrYN5ToYEgj988r7SGjHJf
         RaY4bSv2rqHrvlaPR+HRd7CnHGZdgrXAQ4Iuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755844141; x=1756448941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxFZWCSKR4desKiHPJ6haTS2ebGrBTXqENWB7tlhWOw=;
        b=JzSJXYMZMQPCSW4M0fCYJyXTo1weSgXXHCp0YmXutKqmt9MIRqqKCfjx4aliAXBpnX
         RIZhv7xihstyTz3OcIqM+ecC0YLxc0XsrBwbuF9TYc5DW504mJzu43/rbZyLF5M2Fkab
         qbSIpoeQp/hr7/4ywn5J61pv62DT4xPbLBt6ffhL7LYB0AAg4eMfCo0mS6D+YoeveO1O
         KXkusaH7iDdIL14/cUz+PCn8dv8jbLzXMSo9kcvtLHeJ9O5ro3WQi+aKD20Y17AAPl7e
         ulFv8PygqoAgJFbApntAw11td9ZDhmHuNyjjN2OL1lh+iJTJBY39EGcHdnz8cH2HK13Z
         glxA==
X-Forwarded-Encrypted: i=1; AJvYcCVkHmZnaTs3koIyetPrU63vQ7c35EuG2ejN0ZAZq7wa9Igfuoegm9x9U1RfcPKrm4bEQ0+qsSiUhZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqieOdL8+SoPu2tZIf5OfCKHlZlmDpDiaYMz2qaHrPfzQO5U9c
	FE/Ia4iC9W8NWG9YjROvSFX+0Ekc9WtWWdfWo2vUipMMjg0txZ7NF+JX5BaMG84nPw==
X-Gm-Gg: ASbGncu8SPUkxVidMQ2f+KFQpSeeeX/rFuWRG3/emJzRul/2upGLo4f79UktqiCFcXp
	zEduVrKvCtZLkwaYce/XCuo8Ljm2i2PV2sVChYSy6hpATpHlT+IAnUyRWZL6wc+ew1cFet6nHaM
	iGIvREeZxqzPpld0K0xiFxXPHyGu3Gaq1Gozh5tWpE9k/9WOxui1sVnIW1JxbomrIjFmEvumCHf
	9ur+VFZphKFTn1FVXST+xkPZDptdnEK449xTWA92l9nKTuj1WMFgKQNiyW7mZjH85JGXZuNyRKq
	VtlbjGKnRmw/uSyPEovtYEs8y9kVfIHcSYzGRS09bQmXVZcjgagvaLk1HA8ujBq3aL8R1HWOfmr
	FWC4csshTxbq7gJzzg+pVQECL3KRSE7NE0g+TAjTU
X-Google-Smtp-Source: AGHT+IEmIoRbqzsMhT4RaCduv/mgQBiZTCW0YMv/crR9hLxBxCwCtU4VSoj9WK1ncCfxE24zov8CFw==
X-Received: by 2002:a17:90b:2e0e:b0:313:f6fa:5bca with SMTP id 98e67ed59e1d1-3251744cbfamr2642987a91.22.1755844140925;
        Thu, 21 Aug 2025 23:29:00 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8278:5411:367e:2f11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-325143959e1sm1530661a91.23.2025.08.21.23.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 23:29:00 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: clk-mux: Do not pass flags to clk_mux_determine_rate_flags()
Date: Fri, 22 Aug 2025 14:28:52 +0800
Message-ID: <20250822062854.2633133-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `flags` in |struct mtk_mux| are core clk flags, not mux clk flags.
Passing one to the other is wrong.

Since there aren't any actual users adding CLK_MUX_* flags, just drop it
for now.

Fixes: b05ea3314390 ("clk: mediatek: clk-mux: Add .determine_rate() callback")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 60990296450b..cb015dcf8d30 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -148,7 +148,7 @@ static int mtk_clk_mux_determine_rate(struct clk_hw *hw,
 {
 	struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
 
-	return clk_mux_determine_rate_flags(hw, req, mux->data->flags);
+	return clk_mux_determine_rate_flags(hw, req, 0);
 }
 
 const struct clk_ops mtk_mux_clr_set_upd_ops = {
-- 
2.51.0.261.g7ce5a0a67e-goog

