Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180288;
	b=ipoLakTe8x3+dnsURow13zt2Eab6lWnTyFF8KJSq++BIzyoDeK1b4pQPbABi7H+ptrrP
	 yVFlc966WytYEouR2srE+7RDai/DwTAn3cheZ+UEPoWBuRwrrhcq5Y8//8+88Azxhqc9c
	 qi9Kg7CCwb0qJAMUegMfksg4OJVp91jm/e/Kfd0RVol74QkuP7A5JsVGmkhcWVGV8K1nr
	 aNPnuqKjZQVggYb8yBa5fisJrzh7wsvKmznwIfO4osaI0zLaJ3d+n2fme2zhJnsIlmDcP
	 I2BzYL+LaBpv8N+V/jCWd5a04JvJAqPIHyPH5E7VlUBkR5mkDn6i7dY3QkDeP8OvxpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AiiquoDpQ0fORfLwcpAgt6hsMks+0p+aM+8XYir1U8M=;
	b=FlqM6PxnBi1EpAnpJfm+AZVZGryztQ2U2vfh4AYtk1e+Rv/v8uBfb1OQIfZTGmpdNfyu
	 pn+dEj5zBdvlG2rmvgOHHYnHVzMMSTvAyWSo7hQu80jxN/XhY60GOaOm0dU3x8HT9f6Aj
	 JgXkGmehWVV3c7fiwmS5XBvF/hpbO83BehzpudEnVXf7MMl+3MjuKzgUVRO/E4zhNdaKJ
	 49byVwVyUW9MPhlGI0Ailntfw1LEDlea+l3kCi2aB/Yc99zDrLgIKKFrsQNVoqdEBivQk
	 g5W3BVIL7OahZSO4Jlkjbyw5wL/2a/kOMgSvqZAQZj7GkshCYS5jbYgLK0aiJK19GGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MIgTDFax;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4359F60A263F
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 13:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4359F60A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MIgTDFax
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb606491faso4494175e9.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 05:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795180285; x=1795785085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AiiquoDpQ0fORfLwcpAgt6hsMks+0p+aM+8XYir1U8M=;
        b=MIgTDFax8L0t8OEFuMXANHsKbyLTrwwr28Q/8BF7I8cEMnl73dGy9UDa23idhyLdUp
         72YLC8GIvjguA0HwinyxvTEGb9/Sq/5XuL8RDVm1tNbhFZDm4oK84bzN2gY83heeyf/W
         4QJJn1wAHfGUb1se4BBxf/Mtyo8T1JBw8//beVQhlZLQXF84bb9Ksi2MMJZQDAsH4UNl
         0GvfqRD+nMfdm1+Yx9BqIwYuuYHe6XXkFq2SIVf7+48RmULGw7ch+gE4xZSeaikmkTSa
         HdLq2kwj1NbSi6cKWvnBhLDN8bNI6VwuAXZRuwJIZFOr54r99Vl9CB3fkLBIhjcczGGC
         8YoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180285; x=1795785085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AiiquoDpQ0fORfLwcpAgt6hsMks+0p+aM+8XYir1U8M=;
        b=Weuw4ASWiOoFXmD4pz1/y0T+uBbrJaIWYhb28Fz9fvz+oZoi5dTHoP8U+mbudUfH3J
         /+dZVPPYxnYRI/oxP8JByzzPr3CfcNCtuI/6hJ+DzDO2uQWnOouNfzchh1vmrw7ahms9
         KUHVoqJ1Wds9C70Il2hmG3t7BO9rubXNux5R4k47siibAIVPEheae3Utq8YhBCuwUbp+
         NHfIB2ivyykEXrwTwvQbXVmc4CPEd/yQvUAiwsFOyAjSfs24Xz/r+lRnZoYhoQQMMV8h
         FoeQLD4j/yuP2Oe3sWspMU85Zy5uH3eR1EIfuhHLW/jw5/ZicN5q/os/57TxlmJdfif0
         RNCg==
X-Forwarded-Encrypted: i=1; AL+hErEKJO918PTYuGEXhfe/3KfEFkvpMLnoqzAwAKoxpD0I/s/dNsvWbo012/kgjJi/T4tQFV24cReu/yg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aQ6fWSjrWwdi2TDc0im3y+CiQHwaahanO5unO5JLoNTP5a3hC
	RZp3OX4quXXuKAKa5+4j/4OX04x//urHtYizcEbYYUy3fl/SV3h/P5IeiOK9/dEAoe4=
X-Gm-Gg: AYBFou25z7oFi+P+AbRJ8aXo7K+b57KNLLNIUhWlXJstCt1sVKLIL9wcqn+fcuIpHk/
	PCrJl1bmhnbhbwo6rMLlSi8MvtmBdwtC+S4sP8jRizPu8MAawnjjb0fKb1PQSUfrdwFtu71K91t
	YGego5wF1/ktefMDrkzKaSh6pKg8OA7lzq79vb2UYKkDyanFR6VefjOgmPm12Tv4lU8gH274/oK
	QjOrJLGISF4ctiUvBsdOkwnVwK7m0x4l+k90tkHNSiOdn3Lx6Mrn9UEoihB2gbmc4cIefzDX/ah
	ZUga+42zOwm7QKNMPiPznkkpnxSutPPx4w7+iOOiTXzGLkokU0CSGaP94UFNuHEPQMUXMyef9ZH
	UW7y9X65QjTK3YqoSb7lD8JwAJUP6dc9rx71DGdzBCQUG6Iw4c1BJZPBnwe5l0LwmCZcMpet9Ig
	lZk/JzqEwU84YK4NiYs2UAqgIS1MpSbCUd/17f2xi4L7ABqL8VNbJWLuKEmso3DXL9oTQZk386W
	8bb462iWEU1RaPEPMJ+0xZ2u46hQMHcmHbahFcyBcptkwraNsW0xpIzD/ND3GpJL3t4G4q1mOgm
	LjBMChiadkcuDGtzbUdbj1AmAAKx5IM3xSwgsj+zbApPrGWYZuQJ3Ni+oAqxDcf2xruQD72vh9T
	dDCK9AtjaUkfBsr/S1pvyd/xMcpSXI32KTAb9GzGPWaHnykUmnG9MuUl7xY4N6ED6Zwz5
X-Received: by 2002:a05:600c:4e0d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4bb88922a67mr67265015e9.31.1795180285567;
        Fri, 20 Nov 2026 05:11:25 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960110fsm43497995e9.0.2026.11.20.05.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:11:25 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 20 Nov 2026 14:11:04 +0100
Subject: [PATCH v2 1/6] clk: meson: pll: Support PLLs without a pre-divider
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
Message-Id: <20261120-upstream-s7-clk-v2-1-856cece3b9f2@baylibre.com>
References: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
In-Reply-To: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0

The common PLL code assumes that every PLL has a pre-divider. This
does not hold for the S7 HDMI PLL, and the S7 GP0 and HIFI PLLs are
meant to run with theirs set to 1.

Make the pre-divider optional so these PLLs can use the common
implementation.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/clk-pll.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 1ea6579a760f..44b33051405f 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -76,7 +76,9 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 	unsigned int m, n, frac;
 
-	n = meson_parm_read(clk->map, &pll->n);
+	n = MESON_PARM_APPLICABLE(&pll->n) ?
+		meson_parm_read(clk->map, &pll->n) :
+		1;
 
 	/*
 	 * On some HW, N is set to zero on init. This value is invalid as
@@ -174,7 +176,7 @@ static int meson_clk_get_pll_range_index(unsigned long rate,
 	*n = index + 1;
 
 	/* Check the predivider range */
-	if (*n >= (1 << pll->n.width))
+	if (*n >= (MESON_PARM_APPLICABLE(&pll->n) ? 1 << pll->n.width : 2))
 		return -EINVAL;
 
 	if (*n == 1) {
@@ -437,7 +439,8 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (enabled)
 		meson_clk_pll_disable(hw);
 
-	meson_parm_write(clk->map, &pll->n, n);
+	if (MESON_PARM_APPLICABLE(&pll->n))
+		meson_parm_write(clk->map, &pll->n, n);
 	meson_parm_write(clk->map, &pll->m, m);
 
 	if (MESON_PARM_APPLICABLE(&pll->frac)) {

-- 
2.56.1

