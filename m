Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021397;
	b=rhYysVYPowH4BwO6gXn7vCH3Rr0aB03sXJGck9KR6vHNfS7zQ3v/AqVMwC6XKc7LjEG2
	 s3GV8elrvc6UaI8Ni2T/l6F9kR9dWdp6DyX2bxZ7pr3RiED0dbteVPryZO3NTTrkVgV7A
	 w+24dy3sqs6Ei2fHdOt2LCfSD0QPBV44I5Rdh1lq+ZS6Ft9XfCjX2nl800Y7qInnbiFry
	 wslDNeSA1E/v8cVBVfMITu9DX8YuUhCR9mJl9ulhSvNOnpxDH22XZs7TlsH2YuEtJ5gcL
	 Lenn1+iS5KfMiyhHkP6smDPz2OS0PlN46eoV+2E5sALjPvTF4dGrOdnyl4HASuKTCCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=iiDTsK3ygekIQj3ntqY+O/GObcC7NdXYPBilD7+mkLE=;
	b=1RSGDwXXSLGa0lHkbebVBaKsfMRFDe3QN2HKWBnCOIu1RfpHEs8bXYSLqj0YZ3ZtlFvI
	 qT+M4bUPg7Mp6AaFdvTP2Ok82GDda/l1r96AydLB2huwjfh9G0yUGNAo9IRpqElmrnVub
	 VbEPPIb33ebDJWr3TO5E+1HBjEXdwOjbf4mzwRWqiI/P/GFNURXJP78EEHSDb20cokjkn
	 6KlKZlrsao2cYo4C9eBpu91SuOkxy6RO0GVyqFaqAZQBuyCJWjXVbJUWEScstyCyaqwND
	 EZeHmNPDxE+Aq5tqfHnQVJbFH3qEaepCES39RaFE0jpunjUJRjtfbZZW4EyOVbG8b5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=O8oleLt9;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46AA606A31A
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 13:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D46AA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=O8oleLt9
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so10776075e9.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 06:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793021394; x=1793626194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iiDTsK3ygekIQj3ntqY+O/GObcC7NdXYPBilD7+mkLE=;
        b=O8oleLt9bYddyfHzaqD8q3C4tm0T6idIiOvvhW69nLX6Dj5gGAbMKR4kYq6sjnOD0v
         d49O3poowtAaOeL2V29eJXro1a/JwAJSXcaEp2YwJPijKE9fjwgeCdd1HHhbGKknyTRr
         WJI9G2xkB3BOa7UwEt09UTNNhEQqloPU3krtZr85T33X/DMq3zgt0zrAHJO+16n3qq/T
         fpeTkdvq6RvZ6BV4fxEk2Ic4hXuOjFnBuqsRES6avDaPUIXsMT7DS5yOtC7H2xXilZ5U
         NCRaXrW8/E6hWVV8laBJ6vp2swIqh3xeoZdWm2cHPkVK64w6d8dRjWavPIo0MRmlVAK2
         17Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021394; x=1793626194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iiDTsK3ygekIQj3ntqY+O/GObcC7NdXYPBilD7+mkLE=;
        b=QuAxpWCPyJPGUz2um/y7R2P81U11r6Kwaw1aV7Ns5gjfCAfo8s24/WuEv0r/YXQ0Rt
         1V/JYXfHNHIqtpaqsikAIayfeZvDhTuViKxQ8wYxEQbFfMmKnkIdTubGBu5QzOh7H+Y9
         qVqro7L5rRrPeJxaoFv7F6p8ZRhYSzvnWmDT95CslQGQmdzSx73pcecNw5ATkaZEqDGb
         koIo6SQAWEfP2i09In3/+b1SH2cprI4rwrB3DyaSfI+XOMh7nxvx4rZntVaynwRAk7Zp
         Rm9L1dOaFPmQWMaEmPIkLfeE2PmEc6WZ59lkunLJmaAjIJ4DzyiSRe6eI20q/oYaJLQf
         LLug==
X-Forwarded-Encrypted: i=1; AKwUvBwT507sBcIhzW1wd1PUGSfRB0u8k2X6LOzsIogqMHsCpQDjfKusmnxgk8nwkHY3G2gohdln5SyqDmc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTpcZK4AgenXHNr9dxPJqY1xlspPwQpNTIBqMIxTtSrO+zRwzL
	qy3PmzPSSD+Iuft6bXFFVND+/f/7T2+X4w72OuT8ZkBX0hOl8ctMZobdJ4afY3jauK0=
X-Gm-Gg: AYBFou033mto3qe0/IGLgYnp4JXX74l7ffLMOLuVbLKCa8f7jaSh1syXUQKP2RKrpmv
	C4dfVWDdUbnHQxWzsG8pKid5I/9fWtn25O4NgGAKgn37xEqbA7QnmxwhxhoJjAGSxPKU0ELQcaS
	M/+KvimZI26WedWum6+1sRIOjiBn26EJ9kD6BiyZgGF2XY9M+WlOvbnDiQEVs+nYZy3PtuEMBhh
	HVS/pIyYXd+rxkHLmq4MklfOFt5DNA8pr5FsJbQK6wdA0RTvBDLKkLCuv6BYYDrwkMS50FQfHFi
	qZG7QIK2wlkA1xwtvGndK8UG5LqnpU2GgG6G9L77Osu23RORSnusBB97YfzRFX753ZPTGxUiZ3o
	ol/Nv15slkssg48HeKz6ay/NEgImujWdMaFONZH7N4RgZ3ox8uv0XxRl4cOubRiZYamuStQTP0/
	QBzNJolwk8Ob8JAxzjhVweOrPHr67y4hZnRl0fH1fMI+bW4BhLGMnzeJtIIJaumwWtna1QkF3t+
	emg8LFKSxYCVbNFLlbX8DN8yMOANICGbVXL93/sl9qvXq0EF9GF3Hh+HoVLS6SZRO+pyu2JY6eL
	RDQ5SpDp4EEtnZ3SFgY7kJ793iS261v4t31hRxhkbtgOSn3rTZCeLmcXq6dt6eBjO0r3x5jv
X-Received: by 2002:a05:600c:5307:b0:4a1:d456:ddc8 with SMTP id 5b1f17b1804b1-4a35ac8bb56mr121212915e9.7.1793021394320;
        Mon, 26 Oct 2026 06:29:54 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fbb725sm194507095e9.0.2026.10.26.06.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:29:53 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 26 Oct 2026 14:29:44 +0100
Subject: [PATCH 1/2] clk: meson: add the missing HDMI divider /4 alias
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
Message-Id: <20261026-upstream-clk-regmap-ro-divider-v1-1-c8216b0fb93a@baylibre.com>
References: <20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com>
In-Reply-To: <20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

On GXL and G12A, HDMI PLL divider values 2 and 3 both select /4, but
only value 2 is listed in the tables. Reading value 3 therefore gives
an unknown divisor and an incorrect clock rate.

Add value 3 to both tables. This also avoids a division by zero when
the read-only rate-rounding helper uses the value read from hardware.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/g12a.c | 3 ++-
 drivers/clk/meson/gxbb.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

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
 
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 7a7b104182ff..8cb6404c0efd 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -350,12 +350,13 @@ static struct clk_regmap gxbb_hdmi_pll = {
 
 /*
  * GXL hdmi OD dividers are POWER_OF_TWO dividers but limited to /4.
- * A divider value of 3 should map to /8 but instead map /4 so ignore it.
+ * Divider values 2 and 3 both select /4.
  */
 static const struct clk_div_table gxl_hdmi_pll_od_div_table[] = {
 	{ .val = 0, .div = 1 },
 	{ .val = 1, .div = 2 },
 	{ .val = 2, .div = 4 },
+	{ .val = 3, .div = 4 },
 	{ /* sentinel */ }
 };
 

-- 
2.56.0

