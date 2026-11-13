Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794605481;
	b=OcWVOEvSosoVGF74orBvWdNIFDzK10NNL/+duLCT9ZhV0jV13ZNaDg+4v0+/hxZFqUSk
	 TAPj+1PoxrsLG3a4kP60KE6x9zqpqqG2sPqglh/yfPJrIRxTigd4vXWke7D2QOhll/FaF
	 mY41/BZNEc2Jwjo0X+ARnADL3v23TuBuG1N7TbGz1jQWeHO8KvYWLaOogArLhXCT9b0iw
	 dkqfioNJABjVxP/ZsFRWDqtAGjL8uCtwTDlLjwcGLqezjZYh38NoyLtaYreJKyQGJgJox
	 jZ3O7GMffWz/GauuQGdsG5T+20PHpJkLawxMQ8RS/zORYTqkyyYpNiqXvbp7I/GWRHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=lUw0nvKlEMgxXW/vhONj7EZkx2F585mM1fi84MvMFks=;
	b=FwhcLmtlGgo8leuZjWzIWeHn3dPzKulzgIV666fin1Ko5rya6FlFhaRMenXSzhXXhMhU
	 d78eVlwiR8CuyWyAnWvcfVFzAqpUfiBK+/zLexxn1N0RKbEFyq/l5//uRacwNUztZFQ9P
	 xWZURFCMIcUCxnRmbopv0B+lgIlnvr7Kcq9SXRK8UWdKx5N7o++eB0LOPKTM8/4xuMBSB
	 UUFKuesMgpRSAQ5UszLWMEfyNy24JOpY0uliGfjWugTXUnywZoGsUNJWWNuUGhKpvyzZM
	 2hhfrOpcDQspX/o1iGxRp9FuGFGUFJoo6N/2UcICpAD+zWuoq7D+ZUZXZVWsHv7aYSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Y4TkbF94;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4E2606A334
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 21:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F4E2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Y4TkbF94
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1856533f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 13:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794605477; x=1795210277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUw0nvKlEMgxXW/vhONj7EZkx2F585mM1fi84MvMFks=;
        b=Y4TkbF94zey82nSeBb3iN2vJMq9WyyExLKzmunK3mXchFxyh5RriHVdVSamoqJlrrI
         UDV+FDsikj5NDmzScT86VduAplDOj+aXJkffRZ8YIIwDWsA87kCuLnLdMpGGE6LPcITL
         JBXgf89A/KSrKK3RjNnpUgBm8PvrZXaVvOLaI+EULN5a3dj4+kdDQ1jBT8Fw6v6NKdje
         PzqXkrDbNjMsbFTeK32YiN6NrQ4xa4yIurO648sAy/9C1Xll3V2FMFdlVTvh8WeompJ5
         OYmIUnMG4Vb7XG81qUGBwp/K4NExZaoDQK5BPOy/cJPvZtIdzufhqM6+nushwGRlsoXr
         qAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605477; x=1795210277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lUw0nvKlEMgxXW/vhONj7EZkx2F585mM1fi84MvMFks=;
        b=inVqLR98xbz+M0Jk0CwKvLUDOlfF35v3ANypPGzVqxfTCD8PPlUUWRNEpK2nHVf2IP
         A3FHGHGSGz6mIz2fEZd5rCL9iuyyguXlV8YWAGikznfGTWffjDLtjIyJDf57WFbtMiiz
         AQEQ749ohcJa+8Tl3TOn8OzI9d6SShYcUYLyruzKAfxzI9r93ixNY/uZ3XxgHh8336Rj
         PzanA0WoUv/6hmIsL+IYfaFJ3slMEr5gqnlYeqjINtEMms/zB43kl21WS9Je1/7ry+fG
         poptjGPySKlAeSCZJjTq9JCKp7xn6tT+Wjfj9VyrE6VG1Ldzj8+3Gce7WhzpGZEYT3oe
         1krQ==
X-Forwarded-Encrypted: i=1; AL+hErG7A8DED7aj3djhHL2myKomlckD8DQ00AYhoM3HqHXMgzbGmFH9Vpc+L2gr7hwAm0b9+4SDm2RGP0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qioUwh4MklmPifmpxA12h24//tiozEJxteXCL38hjpYcPSlYG
	yyqfsMv4HIVuVZqmQ68Dfih8xT/kRjVg2rGE9ipDUrt4I2zrHEraB2Wmq9q5I39BsI8=
X-Gm-Gg: AYBFou0Y3sMjMroqYYreSyGMlM6KzhoPOJ8pi/fusnlRKmZcwxlr6d96+Aa5dXkFk76
	WXaZ/azBG/CkFhWY4JpsiBEcHeo6Ib0bFUZ5B278wu18Be7VY9SUpNoVBVH9+sHrVnkQeZpoJnD
	Q1oojP6gA4MQy1UnSbFiMT9ybHDHtZOH0s1Dqgp2cA7PLuRDV26XXvOGpk9ZG84kR5lxjVYfQfU
	ChP8Z01ca/dnV6aXrfFEgGwzgMAL8NpJyQA7NrAMgFLxWAxILFiun499GIoFr9ImsMLrpwXKhJ5
	XJ8hANKCCZJ7TWinrtOQ39GNNo1moQ/9gATaEdZv/MdWYQNHgZDCct7zXP7IWFRxMTV7jS0ucgj
	3fJMxYp9ngAHVvym9FSPA3pY+mE2TtFJCmGW7M1p52uiWtkQNuy2LfriH5s6grL1w5nUMxuf4cV
	mNfL5djJY60YKdePB8PbBQQy07HcPUZ9e7eirm3/tVQydHn07D/2eG5/4y9wA9F04IxAzYal/kK
	fxVH1RE/jK8/Z30lbFVZbkU6oKoFgM7D9nBBFbCH34LwLomzMdTjxdIBwrYaA/SG7GBh2pNq7t9
	ed0I7CHf/0BMY+4w/G/xQpTPdQiFPm1MPjIVLW7Tq/Zz7/hBr/24kOxW4eTvS3w/h6LJ6XogKV+
	+LxDoGcI2r3nxPoVyR426bDD6zA==
X-Received: by 2002:a05:6000:4808:b0:48c:4a62:9af7 with SMTP id ffacd0b85a97d-49c712ac577mr8479439f8f.28.1794605477439;
        Fri, 13 Nov 2026 13:31:17 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm7447727f8f.49.2026.11.13.13.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:31:17 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 13 Nov 2026 22:30:49 +0100
Subject: [PATCH v3 3/4] clk: ti: fapll: print clock name that fails to
 register
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
Message-Id: <20261113-patch-ektor5-dm8168-clk-v3-3-a42cd1edc5f3@linaro.org>
References: <20261113-patch-ektor5-dm8168-clk-v3-0-a42cd1edc5f3@linaro.org>
In-Reply-To: <20261113-patch-ektor5-dm8168-clk-v3-0-a42cd1edc5f3@linaro.org>
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794605472; l=826;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=B0LneKztqvoYqUGoopWi+2un+koOSmHaVdRmdLk82Hw=;
 b=CtNUW1hP6KMI8YN0W1Cp0N+O81Trkq8lga9jGVtb6c+zVucXupTCQIA9gWYojp9PDIrrA93Ah
 wbwN7HKaXLWCGAh9JuY8MP3xsWIfx7VnD+NuvqFIhl3iD9AO4sqXcTz
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Rouven Czerwinski <rouven.czerwinski@linaro.org>

Improve the error message when a clock fails to register by including
the clock's name and its parent's name for better debugging.

Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 drivers/clk/ti/fapll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
index bb9986508578..7d6a4dd4fc8c 100644
--- a/drivers/clk/ti/fapll.c
+++ b/drivers/clk/ti/fapll.c
@@ -524,7 +524,7 @@ static struct clk * __init ti_fapll_synth_setup(struct fapll_data *fd,
 
 	clk = clk_register(NULL, &synth->hw);
 	if (IS_ERR(clk)) {
-		pr_err("failed to register clock\n");
+		pr_err("failed to register clock '%s' for parent '%s'\n", name, parent);
 		goto free;
 	}
 

-- 
2.56.1

