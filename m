Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299076;
	b=f24Bcm+pRZ5kHFd07ohglDnlDZenYDzoDyFvM+68wexNW6UOQD1jSlEa3Tz3SKy5WPox
	 Hy0S1O0opqw707T5ji7UH0sNGINqOEK71dyYTjEGEWZRKiNx79/gTgBRta2N3wLT9TFJH
	 YQcEaX7PxE+y+1k6I3vFtbpSJErj9hA2PYiQGrc3lc8M1iVUTgss20h319Y8ef5b/xTLa
	 tt52RSB0VKzfTWgMs5bYTITKAkpczBQMkK/Yj4ZMQavJTDYAvAZytC4CVg6jT1+4sjhmN
	 ttknuL78OzyMJU7dp4AvtMhr/RLkg0KCp2NjrTePbODOpR2dUNrKIN2ScF11Vvtw/8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Iq3tU2hJqbtFbeXtd3ktVw3J1WdeojLrkQfua2mm+s4=;
	b=ps3lfNI5vQ8op6KMzJjBKn4MYBoPSl0tKU3fdD6BuApGEO2Sgg4hGJbEeqBXgA2KO/Al
	 4o24veZVGUkg1c6tlWeIR3QfB/atqXtQ+1ZPUCSCZtejN16g8oEIlZgOCKJIHmika4Y2R
	 a6ypStOoTzduKrJHgT4waWJGZZeg4npkJo/zXbaV5N4qozB00X5LrSpITAqnNgX65Q9rf
	 mjl5Mj6dmw9dcB6huW/v7iHqslhM90JA7/RpNNgqjn1jo6frfNehFcx85XieAWDjqisLo
	 CZj5XYuav+wZU/a1KdbqcyPWlb2A9tWlrnA9NICmU+kB1TLO4m+a1wR0AlxowBJC4Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=idDCvlZw;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3F1606A32C
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 18:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B3F1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=idDCvlZw
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so15521165e9.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 11:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793299074; x=1793903874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iq3tU2hJqbtFbeXtd3ktVw3J1WdeojLrkQfua2mm+s4=;
        b=idDCvlZwrzH1AQ6Td0GOxF3Jb5TUSS7FOB513TUv9EjRdA2DxJcbGJnW7qKTxi1GQU
         tCsKkdfG3Z48ISliOrQEBTZQSYMnoG2H67Na3sNocMvnohQvZg0ljV5DMQrpYqq+eMqo
         qN+AMiH+WuaOsTxuxHnCkagjX4NNDLswzloxnuLXEUFJVAQWxUiz8ijqdZN6MmxV2CTb
         h26zOWOJNH6RCESgJyedRpEei4jtN7DBBS89fjzN5wyJ8Ou9zsVgJGTlTbGnQXL0+T//
         +/fNYvyR23H0coOi4yVYegYqFLF7QtzRUahZLe+aC/cObuMHaWYGXitp4wT0KB/OozSl
         IqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299074; x=1793903874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iq3tU2hJqbtFbeXtd3ktVw3J1WdeojLrkQfua2mm+s4=;
        b=N8hy9Nsjjo/fmEhKPrtUcBnKjX+zgo+TEzVdVN/6XaqAi4W8QbDxjkv9pg+MQhXle8
         owCqR550/0hv972rwtE1HQY+cW0AHxfVCA/9+FaKXvAJepj38sKGRf84nvLk6YjntAD0
         QQwhTHerNt5+3/5OVdzaeGGjcBaas/ijraxcheNrXyKYd3rqJR3ei/+82TzQTBwW7pdv
         XIejHfB9lZTNyWrobBaH2xVp6k2pCX486amy5wDW9lJOLLHyfZ+SwaOvwHObScXSAbBt
         A6shfl16wDAO0GqLGFhMfTkNI3l9EbWj7s3P+as8E0U1A72yOIuXu9JhXkt5YK3crGsQ
         WOtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGOnRB8URZkOxllYU5EJhft7ZnFt9t3yRwz3pzFSEC5A+4+iHn+QoRUJZBQX5CnJ8SUOZ26B6pIlY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRShMidNjyFDdyvQTVKUJM2sf2Tl2bRC8YmCcTzoqhehrTrDyx
	tYDmm2/EzHsBZi5o0fsW0t94NBuEmKmMvZfMBiIE2OtHrVOhBa8Sm9FcXJ+hphFfwZWPKA6JuAx
	S8bTo
X-Gm-Gg: AYBFou1OcEulh5vTR+uXxP+KqknDdCYguYFYCd0bGbfD4V0R9DCIy7UeqUX4CWfxe7W
	N9KREOpd/InL3Nqs3Ryv/pld0w4b6v4v2HoVxSSBAKbi1e7x0kjVE0q9rjg/0c8mvERWqDkKDvV
	UNbH8JZXSIAQRzyAeu6uAj1m8znBkn3OgsDY6IIYkmz+sRUtrNncnkkLvY1HXTkvGXBqJ42GD3M
	lagr31NE4ADu7Eyiw3xEvI4bEw0zrXLVXBwztY1Xc2bhMGKnFR1ADcmAkNJ3F0k1tmQ6Wk9VDGx
	dgnsG3HxB4xxED9w0B0nHBBn6WUn/upL/0pFtvpd1uIVUEhZBQ4ptCq8odZwHDxjFwp1cCNdFjV
	Rd29JKBE1tOj2z1Uzsd/bwVqGVUF9uGjK7KyVZZ5+VYTGTsRQNSIMsMSlinSSHobC6Ue6I7vAyK
	M/oMb3h8qaYnlcMgAUb+8pRHz3t93yqm9M6Rxe5V9UQ8yEoklsgIqacCwl7O7JSjZ/s07KGjDj+
	MfHVK3sgv9XzQsaR0N/mjD5pcUp2mlAbN2xKqMqd3BgwFq5YzOYohhoA9ia6KNpg+zAUFfQG5HI
	JnvvH+tPF9fTD7263tMwj243BpOtRyHbfdsjPLoPmgxqp8MuQYBaBleawI9dS+s4Ymu1O28l7El
	Hxa3M0LJgrgdO/ZlI9w==
X-Received: by 2002:a05:600c:3144:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4aa8823df43mr85280425e9.16.1793299073743;
        Thu, 29 Oct 2026 11:37:53 -0700 (PDT)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa820492cesm90118305e9.13.2026.10.29.11.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:37:52 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 29 Oct 2026 19:37:35 +0100
Subject: [PATCH v2 2/3] clk: meson: g12a: fix ENCP clock selection
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
Message-Id: <20261029-upstream-clk-encp-sel-shift-v2-2-31ffbb6b82af@baylibre.com>
References: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
In-Reply-To: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

The ENCP clock uses ENCT's settings by mistake. Change the selector
from bits [23:20] to [27:24].

See the S905D3 datasheet 0.2, Table 6-109.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index d0d4c7b6dc82..fdf41572be84 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -3666,7 +3666,7 @@ static struct clk_regmap g12a_cts_encp_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_VID_CLK_DIV,
 		.mask = 0xf,
-		.shift = 20,
+		.shift = 24,
 		.table = g12a_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){

-- 
2.56.0

