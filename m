Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699970;
	b=WE+KGK9C2dXdXrRKFt2Pyu0GGGlIrI//2pr19bvNOXqh00c2QhX6gYcb0hngAytPqRba
	 t2qcuDp14GCz3y+pZpb4pXIx5MWbfK93sKmKhhwYQz6WjcuDDrw1laXdEUvVF7dDgZfJC
	 KhbI2beJDCGVUJMxti0aktYTuGDho2bBOKqMKc087ac+a9UCEOXeZr7HLDBwRnz/VWAcT
	 AeXbBXGGdlD+mgkzayzFnaxQARTEBG3I+aUK5JtIubq2h5WYfoY2m/gsD0KIzW/z3U4co
	 V8bkJzzGHJd9jXXAMn5RHI6dJDznFHKjbpw6l5x//eViZnqGA5Ey2S0p3yvHUpRKhqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Iq3tU2hJqbtFbeXtd3ktVw3J1WdeojLrkQfua2mm+s4=;
	b=W5lTQiDehyl1INq8uaLezXBPBhju4xbvdOWlXqMu5hEBypmTlptLDzFIaTOWBKwt7j0U
	 8AB54os9q/m9kdBD9FPAFFfebrNotbOjkUJ4+ojr7g70Cp5stWTSXtmUeSaB2eGqwrxyu
	 /cSVEsb+p6xDdeSH4zSG/CoyUs5BifWaNvpsinTFsrbkNPc0BMm3a0aw2bv+VR35b+25Z
	 2/jGgY0kIZazkpnck2uIiHqddN6UAMRGdftK+XPAwSMpRR3+TJKR/6To94DuVj0Rw1YwM
	 vkQRt9oukv2pgz9UFJMN88Kjw/qceSawARA3k9JQDHy0dW7RUli+TxWTheGAnWuHBkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GuIr7Nrt;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC23D606A31A
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 20:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC23D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GuIr7Nrt
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e0d1da913so92537f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 13:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792699968; x=1793304768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iq3tU2hJqbtFbeXtd3ktVw3J1WdeojLrkQfua2mm+s4=;
        b=GuIr7Nrtmb4TQhSPs8Y79c3A7KbhRmGf5+yBH1zb47lNhphBtwoo+1L3B70dYmpJcE
         GWA5BSfCRJaGQN+lvKVhiNkOvqHesw7/HX2KjBdJokoe11qD5E/ggr+Yo5BvyEnxQryy
         +XuOnbuBilqPIMT4hdJvimPGRoH8JYqv3S4UZAvMNOu+LIeWeA/MCvi9leyQ7aH1u6vs
         MFtF5gZGeKdoahIlqKX0IUJDiv4jaUq935JvzNGsAXgSJAq0bnriXznjAUkfPGLDNBBe
         UDtDrXMvU1wUS5PPN9XIa5+e36jHyhZu7Avu63gQtCy8R6plKPbK2oRY7u85ueHOKvn7
         cgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699968; x=1793304768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iq3tU2hJqbtFbeXtd3ktVw3J1WdeojLrkQfua2mm+s4=;
        b=rZEFYUrZvVW+oHQatITxs1g4IrGJjot3nD2iaJlPHahQna+tr2PSmpIEbW18EvWaf7
         mLOPqkatRzPhFFY+MX/4F4x+pXyUcWGPMoF1MO3TX0+1vpZLqo+fuueoNC7wFO0RHDd4
         V7Du/RXUGzg8eZGJbpP1ht8mqYjhsaiyi2+Bndg57b/s3wpOlgoDFYg0evssxpti8vXn
         noSpBpoEO1vizKVarwSJHCkoroI2Rttssswn/z3PJAI8tr0RPiSQvJ0Ood1/u8Z2xsj/
         l46Hooc2B8hyzMjLaBbH8hBH7Ri3AqeGGmqr8/Q42ez5RB8tEOCbKbEVsTLHPMB2754c
         eRvw==
X-Forwarded-Encrypted: i=1; AKwUvBxnqsYwyvgyofRB3H1DefB9Nnac94u0DYsSn21+x4YYr2cNAzalWBnukboolDii2XfT4hfBa/THI8c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHPQx1YqmLDhRfRtVO1HIEFDTZFGtTCprxaeJ+mqYtteIHR/dt
	PfhCtGF/GuqFC5aPVaZFyat4jZCe7JfWiffkfIM3exW465SZkEc4OLDBJXD1hbATvQpZRa5PPdR
	EdnBM
X-Gm-Gg: AYBFou1t5ijqjBFNVt+/HnuUwY6BjwQgXeX+3bkMLLz325Mstv6szHzV02XqoZas+vl
	jirh4h5T93O3M55FqZwLPvZlTrTQQ8XwIn2at/Ge7U6AJCuhqpnK3swi3yTvmINP6y3eYphq5LY
	hCyMyuD/V+TO8vOklBGMyR4a/bKPnhjYeWPWr5IbCgpa+kpGYXiqSJqK4P7pQD4OUVdCZYgkwfR
	hZ9j7jVQP4JxCZBqns+Hi/XLl7Mk9KhSb5GN7rTGRfvplkw1l7dB1cFr0oKHP7CaIpO99+is0dL
	ZS/63jWeCElddSW9k96IEbBgQNOnKeREH9SOpS0npJkc4B20PAMAnnoWWOlle1IxwAKTHMi38KI
	9neaIfPLFiPB+XzwZ14iLgJ/GoHaCcGfriZHc10dAEmA4tk5eF8tnBOuZw3PWqBySazkxt71qNv
	MMPciAlTHk7QYnVbX3F9SRINM+nfSgl+m53W7ppSFPsRrrXC19hcqk3bRD5x1P6d0sh0JQZSvEz
	dHblbM0/J0bfN5TSPxYdAz0HFxlD6XNzd8dii87fzFRsuJpXJZFBBYFF/gikL9PJ9C9+Mwf43cB
	vjiPZ3Uo4w/fKrk5puQWzjr1tP6UcTpxPyEw/1InUw==
X-Received: by 2002:a05:6000:4206:b0:48d:faa4:af9a with SMTP id ffacd0b85a97d-48e2d102ea3mr7429893f8f.9.1792699968427;
        Thu, 22 Oct 2026 13:12:48 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380575d9sm224286f8f.44.2026.10.22.13.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:12:48 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 22:10:33 +0200
Subject: [PATCH 2/3] clk: meson: g12a: fix ENCP clock selection
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
Message-Id: <20261022-upstream-clk-encp-sel-shift-v1-2-f1b1e10a3d84@baylibre.com>
References: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
In-Reply-To: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
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

