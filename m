Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299074;
	b=ebWjPkRHCLBvlrmWSHuHatjsFXMPayoi27N5UMdKDJ/l+G5DBOJil2i0Tw++UU9K/+Lj
	 i8qycU4M9vdzOQxF8rmLgrFLMCeacWgiHcfmWm+NIbNSLJlLYLxTVwPBvurhWPSOJWkRI
	 sqKeqctLQoGmQtv8mbf/yug9YFQVvtquUTXw4j1fcx3KW/5x+6ZLUZQOtgH+/cp0Uc/lq
	 MCVjiyQkGyjU0LMxplmKI4plMe93pQ4VHS0VfOY784sq8/MsdN2P8COhQIEdHf8u3B9d+
	 WE/S02LazkWb3WbldbPJP1pvEP7p+6FrGvU9o1IwVnTOTw0iNM3Yt7iueNPsRo7foeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=V0JzWuHSZxiNILu81vxHkBC1eR8z4avkRtzlz0Wpj+s=;
	b=0LLXqcb4PCdn3UxDw7Qyaczo4Pjx8+kWftJQniRCBW64biCuEkeifVOvOLS0/HhjLGbn
	 YXX6AmuASUkHEZUA+fqrwYXJkOJo6kVjndV+0wCUw4dHvEHrMoSiO8b3YaBSB9Mo6UA/A
	 t8J7ENM/oWSuYi4ShZeX93EFPMorPrO4EqCRyJh+reBFGO7pMWiJp98PyLmuC6H7fk+Li
	 R5nhIYOWviyBsknTKh9ndYTRUfcd+J/+tFipxW9vj8UUjDSuXoxyAn2yybfRNKVExyOjN
	 ClrpFdaLtlULvbPkNN6Df0adv+Xxq+G5ppQVf2dxRXkstgtfS4ZaZkuvN2GsEvgukkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NTlodnS2;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831FD606A31C
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 18:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 831FD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NTlodnS2
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso23081005e9.3
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 11:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793299072; x=1793903872; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0JzWuHSZxiNILu81vxHkBC1eR8z4avkRtzlz0Wpj+s=;
        b=NTlodnS2oSU84Puy/IEsLdT0knsN+ztnjItgmuXAXnalsMCxRDqLB/9SR8+Fz/XKI8
         xhTLVr+xna8cV9nn9rYSVtquckbXdF5IxUvoasu+73NNFOGg3desvqkr0ux9jrLfR1in
         0t9n5ZJBqTd/5SzPHBDyZJP3WzCAmsPT81fftHkPUcUViftKq5USUBEyIEu+EPBRUUMg
         u1Y88YxYawevGYAKN2rvVw0LZFaU/kxuVUrIPLJ0ensuRrLTGTD++DqRrVcA5/pKT/iY
         UmIUDXbzlJSm8NvOiWyWMNmAiHsIko3C1CxQlIxZaOC+1/90N7vEJCsaPRwd+wunmC8k
         Tj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299072; x=1793903872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0JzWuHSZxiNILu81vxHkBC1eR8z4avkRtzlz0Wpj+s=;
        b=a4qtWc2BsMjF8ZtMdHrQXKZvzWCFkRjCe3+2pvdPgmg94iKucT/j+t29IzySefCmhE
         N0LQBdRIdqHU4UelfryYPCIlbuVHBXhM1BU5DkO1ffX5Rc0FarNQprIIPI1pIdntGLa4
         ydWpcEqPVOIplVub3+sdSfvBHb/lmidBNcUufJ0SkOGzKVJtQ63oJpmqPsYUrMjgPL5k
         L0AfJmQxoCvBaq4lVuYzjT/aDLoDrNNzsg8Y/HsuP2wzT90RUyqP9/wq0calaIP8CC7Z
         HpUOSqDP0JjggHrS6yd6YphbDixxa1IdJKyYfYFCxE30PZANrJIBEiNe8BWig0fgwrt2
         CvAg==
X-Forwarded-Encrypted: i=1; AKwUvBzXTG1UyO/16b4nrTVPt1ctwQmnVX9jnJ2DNWpvSlwSZ3p3kNszVz5S1tpMNE6096UgTNIzPPsDFik=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZUazb7KFY6xQngojSjYMHBss2sLiCHyLDvYZxsqiWB6z2gHMN
	+dbJsDUsFjrxpSRZ6e5OCdQvFevhHR1pZeNjR+PXFiyKZ2wJ52g+6VzZdbMcFseTwsQ=
X-Gm-Gg: AYBFou3dhyTb66KjUtkLm6hX2PiVZqHLSCoFgT/ssfvPDDv4EgOrxx8n3WblNKTXB0b
	jq1Yp1FnAxqlwa8cTgtKq9dHS4cFs8+9Kt9Et2sGb0EJ1X8rqfMzruhplRqVJkANuL/MzgLMBBc
	XTDYOyLdwLzADxTDbz2q/GVUNcN87f3zD/gU8QH3Ktc8S1rt6urFSuxOkPQCPb5MKliXOW0ory0
	uyRh7o8IOKr+5gQ2zfQqx/f3xV73nWoEP8n/H09vhtHZ3Y1Fp8Azl+SuG4uHUtZDffzoJRjaita
	89rClHy6gWilCmu3gZWdb/g6RRyJJX9xYI3fsN3IU4Kp463H3rNqQmUZSMTk7ngeFwQz7HNJMQz
	Df3GimscHgZSiq9lz6Osj7sxBftX8qYE+LkCeRMvXR37NHaNvomXvyKXLQAEzT7Uai+Oi/GSCh9
	xWJLuFldYfIZr60lQNSuOzw8Vc1b0scT3g7NM06j59+4ALGeDHQz7rHvwlvC+ogiPnLaIFLBg/f
	n6RUXvGAEiIlBieAFyugwNitzeMYrDiKHK098lYRftNhypJdp3kRlVQ6xUZlsAzlUOxdB8NYYji
	eiojz5/kR8sVolzuc3nrNKNjLAjsQxrxoE1AisZAKCcg9sHywIP11zE7s3Qc3g13n/a8Uv15uZS
	KnK5qnWJxfAxfAo0xxw==
X-Received: by 2002:a05:600c:4705:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4a966587157mr144058185e9.16.1793299072008;
        Thu, 29 Oct 2026 11:37:52 -0700 (PDT)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa820492cesm90118305e9.13.2026.10.29.11.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:37:51 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 29 Oct 2026 19:37:34 +0100
Subject: [PATCH v2 1/3] clk: meson: gxbb: fix ENCP clock selection
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
Message-Id: <20261029-upstream-clk-encp-sel-shift-v2-1-31ffbb6b82af@baylibre.com>
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

See the S905X datasheet revision 0.2, page 70.

Fixes: a8080f247bcd ("clk: meson-gxbb: Add video clocks")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 7a7b104182ff..b483164955b9 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -2370,7 +2370,7 @@ static struct clk_regmap gxbb_cts_encp_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_VID_CLK_DIV,
 		.mask = 0xf,
-		.shift = 20,
+		.shift = 24,
 		.table = gxbb_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){

-- 
2.56.0

