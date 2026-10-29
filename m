Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793278471;
	b=Ta+ANyWwJpSOYQo+a/IgwlBp7YdgTzE/eOZnbWPIeaIhU6sGBiPmyjasdjtOAC1zUL3i
	 WKvvlD4jz5hEIE3BV4WAVYr1hQWZdXwrexKTyq8VXv4YF85EVR8Ke7cHedG8A66XB8RFk
	 VeNLkFLuU4V6IambdcTHU85UFAjnL8mRNwCEC0yJ9TpkFjwnTVi15sE3OdLXtFciXs7qd
	 ow170i540VepG42VyErD/ugnAZ6zRHnybnCfZZpArYDPEtBxiEnAGrQVnct1x7mJtTsex
	 aBTRHQ5mnsZMlxOU72oKs5EP3uYZvdqGetkE1u/cYrm2WaZsif23AMa68jPHEA4AfTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YCZa7OrCfiqCW2NQ+HdDQnKwWKIbdOgXD9yC1aIimaI=;
	b=IVwVQOTxV0V454H4msX/td+gsJ9t3nPWimm4kBSOg85ET/7+8eVCC1vr8RrlmQIwNK+t
	 3AO995oLp6U5nLXlWxSChe94D9Z/887C/QylV2Ic3vUJXtYFvRvNBbbB/6/qUJ3zT/ohM
	 beSQ++yGlo2oVO8rMZg4l71yYm6Z69Xj0G/Pp5wyoXyJg+QvBbuL5vpTly9g1Cw5mbdsS
	 8WvD35cHi9MzrMJdhQQ37XK8sbvpddVAWAyvi8Dg5C0M/UhZr6ea2hGyyPLGGDJGNRFRH
	 Q8IqzhTME59J6WR8xMkCy6b+SR6YRFjryyQPYTvZ757j7C5rftppNEAlG/xCUbl2TAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=T08D92Le;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5CE606A322
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 12:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B5CE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=T08D92Le
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1209131f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 05:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793278469; x=1793883269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCZa7OrCfiqCW2NQ+HdDQnKwWKIbdOgXD9yC1aIimaI=;
        b=T08D92LefxbTiOmdoszmOa3NJLcJKrIGUeL1nhfMGg4Oama2vESx4fC5TWvDtpYeNX
         RLrwtcYscDVpJaE2rWjjUUZVPpLKVzEtoFDrX1pzYlaRkaFMP4gxcor4f8yLTDdhZEjl
         GJJXPKGJ3OkH33PbK02Ugzxw9SUxJDteNgzyPPUq3V1/N2LBjQSyvqkfwRU8W/zeIDOq
         CiMQhJ1+QcrdWSVU6Nw1iwVeZGiCd8vit2aHM3/FC6d+lqWxp7jt3OvznfYEi+4D4Lhi
         0DABHB7s7X/9bMmeKF0WvKdrF54n3VaU7OvFzjLsLcxijtCmGfzzSijuIVTBrUZLFN1q
         WliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278469; x=1793883269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YCZa7OrCfiqCW2NQ+HdDQnKwWKIbdOgXD9yC1aIimaI=;
        b=zrrcAjmAqfZfksJgjROjSeLpBLwBhmdLG8LjKGsD4OYgOlizyccRjxnjKKTaDED6II
         ddl0QwR/vHkGnAVEmq2G2htsVuTUd3q6J9neGb+LvLhz57GrPOAtvDKm8AO216cVapz4
         f2JA9mxKf+M2UMKUCcacz+3rhyui/5LLqZJOXPZYOg7NkmNbmyqmsvfffQ9vQCmhVWcH
         MVqPey5ozfdOZ7FBAj6H42mHbds7tkNgVAAYDbHjF2NWaCq3339vODrXVcwPZB68O2Or
         YUgNrPo7Dtz+fTU+29V36vFjuqprVpxK3w1IkFmMR4RiP3deBJlxDimbfkHo82DykS+P
         7n/A==
X-Forwarded-Encrypted: i=1; AKwUvBw+426EHPaEVx3qZTLYddkGOBz2S25qoUfMqkWsr+8ujiXXLoVG++70v0LlTbZ9eg0xyvRzK4Znpjo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXNv4W9vFftxyjUH9MjlEc2B2p0lusIi2Z/HRMY0y/yitQUNr0
	0gZAF9Qs7UQcxu1/oxagWN5xh/J/kVopkM5cX47QNLyAJltZqMhfdA8pWbff63xfKvc=
X-Gm-Gg: AYBFou3wed6/SSv+RYm3UdkECkCMGXPKQZqMNGYW0CrHdapYqP3vmZuJLokbI5T35I5
	Zqcfx6juMhVtOkP7i3gMSXcdiQV+biaj9BctyEVKXRvEpxwI3ktg4L6RiDdjdsoo4hOa5AB7tt1
	Nw6w2xXe7ShxG1/mBsF3OXgt1LkwLsdUXG+J6MG64xstD3FNMTe/3QZxVS1ccy9iWuix2SBglOC
	DpoIRpYyJgLA3I3xuRlmLPJro2EYw4H7u/P3Jhi4t0RbIn8oWO8/FHmP9nP1+b5lrRhN9D19PTd
	4FZC1r1MalMKKrHWg/ju443h4X4+3EshvxpcfJhBcwO+7Nipvj/DNDv/Gs5XIa5V1bbTC6Cwu42
	rSu2MtJR4/hZaakhn1YizMbYZHEL2xeEBSto0PZE8LKL+lahieOoKTP3CyR4DXn+1fwyV8fo1mY
	ZQ2H0qQmNIu8Gwdko4CY5nNbuJyw5HlSwyxJe9KUrSw1QVlmuCIhSIIrN9N1bzb2iPMaWlZuznT
	DQMqiLYa5GdGZeOwrOnVSzYb228jLipbN2XZZVeSgHvzdROEipIA/z4LKiiRr9p9m192DOFgdKY
	QSbDWZyi8lgvB+XGbuyL7+orl1H5wMHxC7d7+VGSnSfW68iSE7ib51SNJJ7Z0eINbMr5jChsIfF
	grYHiJHsboQuKwHWjPptu/mc+ZGxDFSNdZuhe19xQqHchC4A=
X-Received: by 2002:a05:6000:607:b0:48d:f034:7fcd with SMTP id ffacd0b85a97d-48e5d5d1486mr12914361f8f.51.1793278468880;
        Thu, 29 Oct 2026 05:54:28 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39a8sm35034622f8f.11.2026.10.29.05.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:54:28 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 29 Oct 2026 13:54:20 +0100
Subject: [PATCH v2 2/3] clk: meson: g12a: add the missing HDMI divider /4
 alias
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
Message-Id: <20261029-upstream-clk-regmap-ro-divider-v2-2-7a375fd8f88e@baylibre.com>
References: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
In-Reply-To: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

On G12A, HDMI PLL divider values 2 and 3 both select /4, but only value 2
is listed in the table. Reading value 3 therefore gives an unknown
divisor and an incorrect clock rate.

Add value 3 to the table. This also avoids a division by zero when the
read-only rate-rounding helper uses the value read from hardware.

Fixes: 7aa6c24697ef ("clk: meson: g12a: Limit the HDMI PLL OD to /4")
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/g12a.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index d0d4c7b6dc82..b23b9514fa91 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -779,12 +779,13 @@ static struct clk_regmap g12a_hdmi_pll_dco = {
 
 /*
  * G12/SM1 hdmi OD dividers are POWER_OF_TWO dividers but limited to /4.
- * A divider value of 3 should map to /8 but instead map /4 so ignore it.
+ * Divider values 2 and 3 both select /4.
  */
 static const struct clk_div_table g12a_hdmi_pll_od_div_table[] = {
 	{ .val = 0, .div = 1 },
 	{ .val = 1, .div = 2 },
 	{ .val = 2, .div = 4 },
+	{ .val = 3, .div = 4 },
 	{ /* sentinel */ }
 };
 

-- 
2.56.0

