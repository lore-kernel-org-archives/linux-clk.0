Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794605478;
	b=rpmaBXdxvEe6lm2uVKsIVJeRCXOPfuF+jhPHa8YYkkBoXn82A5Jo7Sz4Dmcb+ZvdM46F
	 tTCovW9Llo7sEL7UVyOk0BdYRsSAZFK9DEQZ1208bceXlKwMa61kbpvKQnOkTk3Rd9uK+
	 /tzBp/RM4gTpDyLJv/TQzApmDlpA0oA9HVol3hkg1xE10I33j92J1ailZ+FgSvPOQfbR4
	 xHfeBQCj7p8vtWKSo/IqpzBYrrlXrfHpWeT6+QYBskcW5qmf/N6IPUIdCQ/dZScNr4w/B
	 O/gAVpTfcoARuPq+JdR9JJVd5K+l+kPBBJrHi6LQ1NRZcaUa2ut1RvI08O8rTUOH4Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yCUvXIZvqOm8ho7sU9D0qEAEFBADRjTaWHmUzHD39VM=;
	b=M0KUgD1rYkFYGzgOqbwP5tHp46BxZAjfJhEISdqj5K/R0/ZrRcJnD3V2tEXrgLZu5QgI
	 HvxLL+uYPsmLmCRe9E4EIzXJALMceakYG3kmbyfYXZsoCPMki7ROknwkF4ehUq8p4SYA1
	 iC4woLDlxyFUsTBkGBBTnKtGIh2/tZWOs2xQ8lql0QZMnK6N+JxSNUmyNHJXYLQyWRB9V
	 +6YNA3FH8ZCsRHdIY4+jUlbgY4pa6BO+ylD3w3rh0gvKYVIdUYmAXYU/gu16gz7TtcpqB
	 lmNzc4LHGuYalM/5XVSLCt6uonYEfc1+iq12ZO+AC5HFwPQfmHchXUgk6j1f7fkUNTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="X/x5Z0i3";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018BD606A895
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 21:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 018BD606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=X/x5Z0i3
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1856517f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 13:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794605476; x=1795210276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCUvXIZvqOm8ho7sU9D0qEAEFBADRjTaWHmUzHD39VM=;
        b=X/x5Z0i3mWJ4HQlPGT+1dulVZafouKGi9p+ya9B5VK6MbWSTMNUVSEnls6xAsmCwA+
         zkiqTM8vVw3hVD9wHvmvaLOif+Cr31wQA+6fVdEkJler8s4Ii+X0o7RXjGUJG74wTIHB
         rL/EtpkOyQnG9GNOs7R/97CurzOH5krl0jE1jO0+kLuiNHTFPe1VAWMnbXkExbzPjAkD
         IhQBUIr64Xm04jdi095l7QEHQJRHPKKcd3kJKy2dbs9UXzfXBeTxQ/TEs3CcLSSE424z
         dylASuG29qT0Zy2AySseh05vmAUm6X0aWu+AW4hkxGPgTv11/qJ+W2+xC6VTAgQMBf5v
         gqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605476; x=1795210276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yCUvXIZvqOm8ho7sU9D0qEAEFBADRjTaWHmUzHD39VM=;
        b=cmwLqpY+u5Kw3P/2gNM6/pOa1RefFlQ/Q1H7k9kLxyUDaxg4qbfgWSOGKyed5XxHcO
         Fl39wGeWRth6uSn236tcnRgw/l2ZMKX7Hlfccft2bz+YLLP40MEi5cwYqwNHpsguGQfj
         5EnuUB7RABSz8MYUUvNvnAorlam2CrJoj58NCZtlN+SHYE8eyniaydCbZQOs6c7NrNs3
         qjn6g4Unj6eCA1G0yTQi7bEZny8QQa+7Lh2uNLHNhHdtQNdzKPqqBkm6kxh2wDI0A8/f
         gAux2ORRGO9Q7gU1NdCMnK2ZsqkqnHHwYNjzvOO2JfRwlY0IUXPZvTqxiYFPMcP6WvN1
         nuBw==
X-Forwarded-Encrypted: i=1; AL+hErHzMXnLwD92Z47sQ1FO8tI5aN458BR5Tp8FGo6R5ACAj3iQHe7GtDtsEpqjXy8/FigfGf7XvNwYd8A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IOmR2EB80dZfa4/45HPO7mVl09sIBbNOv0RkUqVZJ/1XubSSk
	XfCaxzIg8ZAcaVxnm60iuYh41zI1isLOvNtm3DNNwpaNZykFszgLS7D/BFcvXZINjlM=
X-Gm-Gg: AYBFou0g9qmh7WjmfhhAX21BrXpBSapEhyTjuOie1s+LGbMjv+XPZ6NADXvnuFA0Rmf
	sD4juvZp4zCw45k2UgyQqJWSkBCtsq28GllR3rAUkjU+XaF7l8oTA2YZ579wDhCkSbS3R8Nz6S6
	KNKHBQCbqwwvCudA8dTNlJe8TyUIMXlGyL5ifHGzDL4Dr5ZEUuU883DdNmmwCbjTICOoCzXsEfp
	eBLb/Ajlb/A0VeJwJmb402BMUegznBEhxY8p0cgR8c/x978YFa47Bfmmsa53UFCiQ/8xfS6v9zI
	KPeGtL035cuE0s6jWpEJ4eq+D0wAnKkcHtKsaohRNbn1KnK6ZS0o8r4mjTj/LemCGqF9SSN17bm
	TtBZ3IoL2366cPynHGx8iNI0OrYTeSiNQVayH9xDnHcoMK/VcNTDnffAPVKEU2UnZNzix2ebtx/
	km3nA1EXVNC9tCrUsySTwA9ILBemmi1kdHwcvkz3nOTGH1NewoXRPhbAbAE1z8P00Wouz5UZH3/
	eDGDCqhUn/S30rqbwBym5jqJkcQhjAUvfuu+zQc/hH1TS9GAqGN2ADNokzJv1iseBXkD1yuQiua
	SBRl8IxsF00nLmjPAzSF5R2wVZPwM38/wxF0uSoUITWktmceB+yktc6pop65uBCkFAJ9C14iIw3
	sWInoSTIvFUf6ZL6PlpdiDfB55NmD9lBHEH1C3M7ZAwMKdtA=
X-Received: by 2002:a5d:5d86:0:b0:48e:43a:1d84 with SMTP id ffacd0b85a97d-49c712ac267mr8339076f8f.23.1794605476337;
        Fri, 13 Nov 2026 13:31:16 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm7447727f8f.49.2026.11.13.13.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:31:16 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 13 Nov 2026 22:30:48 +0100
Subject: [PATCH v3 2/4] clk: ti: fapll: Fix clock speed calculation
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
Message-Id: <20261113-patch-ektor5-dm8168-clk-v3-2-a42cd1edc5f3@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794605472; l=2057;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=bJxNSt/zFq6q9Q5K6PZzIH2KeHUpZXrPEV90BgzuB40=;
 b=ub/Fkko/9cdU1xB2SS84DwJW77+/KJo6ucHf9cDfX6Hu7I0tGYXyJkBRy7PAiK87L6mzAvsmP
 eiiq7z63229A76yfsrbOWWdpzecTrq3XfZ7QxxNMvWHOTF9rv11QNs2
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The fractional part of the divider was being treated as 1/10000000
whereas it is in fact 1/2^24 (1/16777216). This led to incorrect clock
speeds being reported when a fractional divider was in use. Correct it.
As well as fixing the clock speed calculation when read, also update the
calculation on set in a similar manner.

Fixes: 163152cbbe32 ("clk: ti: Add support for FAPLL on dm816x")
Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 drivers/clk/ti/fapll.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
index ae2f6fed10f6..bb9986508578 100644
--- a/drivers/clk/ti/fapll.c
+++ b/drivers/clk/ti/fapll.c
@@ -54,6 +54,9 @@
 #define SYNTH_MAX_INT_DIV	0xf
 #define SYNTH_MAX_DIV_M		0xff
 
+#define SYNTH_FRAC_DIV_BITS	24
+#define SYNTH_FRAC_DIV_SCALE	BIT(SYNTH_FRAC_DIV_BITS)
+
 struct fapll_data {
 	struct clk_hw hw;
 	void __iomem *base;
@@ -336,8 +339,9 @@ static unsigned long ti_fapll_synth_recalc_rate(struct clk_hw *hw,
 		v = readl_relaxed(synth->freq);
 		synth_int_div = (v >> 24) & 0xf;
 		synth_frac_div = v & 0xffffff;
-		synth_div_freq = (synth_int_div * 10000000) + synth_frac_div;
-		rate *= 10000000;
+		synth_div_freq = (synth_int_div * SYNTH_FRAC_DIV_SCALE)
+				  + synth_frac_div;
+		rate *= SYNTH_FRAC_DIV_SCALE;
 		do_div(rate, synth_div_freq);
 		rate *= SYNTH_PHASE_K;
 	}
@@ -378,10 +382,10 @@ static u32 ti_fapll_synth_set_frac_rate(struct fapll_synth *synth,
 	for (; post_div_m < SYNTH_MAX_DIV_M; post_div_m++) {
 		synth_int_div = DIV_ROUND_UP_ULL((u64)parent_rate *
 						 SYNTH_PHASE_K *
-						 10000000,
+						 SYNTH_FRAC_DIV_SCALE,
 						 rate * post_div_m);
-		synth_frac_div = synth_int_div % 10000000;
-		synth_int_div /= 10000000;
+		synth_frac_div = synth_int_div % SYNTH_FRAC_DIV_SCALE;
+		synth_int_div /= SYNTH_FRAC_DIV_SCALE;
 
 		if (synth_int_div <= SYNTH_MAX_INT_DIV)
 			break;

-- 
2.56.1

