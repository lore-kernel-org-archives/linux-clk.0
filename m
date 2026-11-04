Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787466;
	b=G90VpuJDfYm2x/joC30aER7ZGfPjvueFYzSK9P9oRdTh/Rf9mXMaj4hrQTZqFVCqX4q0
	 ZAKFlgeANyx925cmefUrv/V9UAG5lWdFLDzf1qWbjTwrd4q7deNgBtG20x93TZQmEyp4N
	 bq0T2l2ewkAVwE0lVsc2QfZ9skBdFB6NNWeDQmelqQIezkH6wuFrz2yMVOrpReppmsia8
	 c64/9IOJ4zDcab/0sYMJtvnW6IcJaCUGEI1LNwyOCR5TGgXkVZGN8Ud5ZipIGztwUAy3x
	 YC9APjpCCur52iDuTOIqrKQ0MYwBt3hRHRcTqGj0L02ZXArWhj0R6+p+EYR+NqjzYTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nafaEA1OVG7CjcE+9vFCf00bZY6KpgzCNwfvKtVMnW4=;
	b=Lcz+4atk2/mM4MYHz/n9sTjO2yzPMsutS28JcDwvxQkwItMvMbdOvQmjDSr7/Xf1g/kq
	 lkEt/QRXhWNThs68UlTwFRJQp23ts7T120aRh55s+sf/V1fiEZ0bmUWJb0K9rx8sgdRUE
	 E5kWB2TXyDr5mUjpm/P7/QkxqyYLk9XLIuj6RY2XBqgBAA2HFqZBnSQR4BBBMRgNL66AR
	 ikWBu0bd43k4uCB8RTnEWGdOFOYfeTn603pTIYuGvrTCB2B2b1zteW9g5bymbIuI3yAjt
	 eh4XGxBWxWE51l3YyOj6OrEfRQGtRzuaFjC7YBWmDfau2dyym0dGmzZzVSpKbtvXY7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=eHnPGaGy;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F897606A32D
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 10:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F897606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=eHnPGaGy
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e00eee27dso269467f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 02:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793787465; x=1794392265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nafaEA1OVG7CjcE+9vFCf00bZY6KpgzCNwfvKtVMnW4=;
        b=eHnPGaGy9vjCz3endU7ujp9oiZUhTPhQRDiNW3N/hOwyLbS95T+qAJ0YpwEurjgD4h
         W8PW5edMps4nIXks6isfmzvTgbMPYOe61Q+xtyVIiNv/kxY8yAPP38hl4xgFROOY2FL9
         pvRFjtaaOel13Fqy/pwiop+UvoLlnaknkrkcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793787465; x=1794392265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nafaEA1OVG7CjcE+9vFCf00bZY6KpgzCNwfvKtVMnW4=;
        b=l53UPMPsgm/klw77PKjc7APWQvB/Tiz7x106IZPQrVSKUYDDFsRHqKzdUYYZsyEZHx
         mQzhFYlL1HqhGfO83Q1sM6hBk7EqHmDdKUyu4kVWm/TMPcbBqxDmRyEA0MK7MNtdCLb6
         M3I9Hzvzsen7BiVElmSe7t7TgwzbKuTnm6HeEJyDYcYMMPWdqkKndIN0L+q31Vb+fT8J
         q3fxSl9ihJ7Tu++HgNded98Jd5cED0zJ/xk5iNhqgDCDmwvtrcHiesS41XskjF2katxC
         6kXRvQF+MFxudJUDVhEOHM/9o04QhVcm25fa9g5KSuqqnVB3DasFanURXYN0jlI2dneh
         eK/Q==
X-Forwarded-Encrypted: i=1; AKwUvByuDw7C3eMzKZnodggkW0tgvBQotWAJMvqzwpaaKUjMDFDTKZpZIip+++ovEgcY2rn7aBEzreAITfM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/P/W7jFNql13g0gIm6izXl+TLTYSltePAkr8yHiYLKHet9hi3a
	biTTXvSMsZxjW95qC0eJ0oWpckrZwwWetbyYOHyo3N63qs+bX8nmtyj1R5BtRcMOtsk=
X-Gm-Gg: AYBFou1WBLEicUaNgYhUF+JOiu1/hZ6ftERUOHfJ18wDWuyGaB/sRwNgjvnddW5NTzh
	s0QugAn9ykY1FRIi4MWGs4LLZlv5s/ULO2wx2ybGFONyYghgLBrmVRsy9wtkQu57zdAJkuiHcPm
	r7mdwwGVu5Gobh+5Vywk3HMVaUlAw5DAHoya/AzItZPLDAukKXN6U24PYIg9hTqzpIg8XYrMAjo
	vaqOTnnGgeRAH0lT07Lsv1LWui0x13ngpd31IkWHS0oXQAkt9Yag+OZ29TjsaHgBpTgaUCkPSP4
	mvVR+NG97QfqaS6vNSTZxObXSw/vj25C5EgkcH3fhiHmXy3wunUdVBytUKmiw0ROQh2djtWz8T5
	SnXNkoPePpHq9NYm9ww5S1zAcs1pgukPCpRJSligG2MsI3RFuVW+jfxOI+se272Xr/Ju109MX33
	2nXkaVIMOCEpnb5k7b7mSFS30m3GhZ4lSNw+iLCEsXG0S8lhUrQJUNawnQ3b6XQ+6tzsFbmNjMa
	oop1U0lb/PgSEj24/MkiaYU4IFYWqDBM7qvNA8TGatFgvsltrPfDWTZRRwdgcXEORrw46KIEwJ7
	4hftjsh/gEA8IwDbNP+HJe0OuvtUM90SsjT8tIJaLRwlH0/mmw5ynVHvgMECBQd2zfkX9zM2Vd2
	kN/KkkJPCldaXhPK6CPgRcC+7N0WSOECH4zc2FWQzebymJMo1MQxF
X-Received: by 2002:a5d:5d06:0:b0:48d:ef7a:e59f with SMTP id ffacd0b85a97d-48e6e2fa482mr34138879f8f.17.1793787464715;
        Wed, 04 Nov 2026 02:17:44 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([217.201.213.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feeb51a9csm3035105f8f.59.2026.11.04.02.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:17:44 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: clock: ti: dpll: deprecate the ti,ssc-* properties
Date: Wed,  4 Nov 2026 11:16:55 +0100
Message-ID: <20261104101732.4043372-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104101732.4043372-1-dario.binacchi@amarulasolutions.com>
References: <20261104101732.4043372-1-dario.binacchi@amarulasolutions.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The common clock binding provides assigned-clock-sscs to configure
spread spectrum clocking (SSC), supported by the clock core since commit
a7f16660af39 ("clk: conf: Support assigned-clock-sscs"). Deprecate the
vendor specific ti,ssc-deltam, ti,ssc-modfreq-hz and ti,ssc-downspread
properties in favor of it, so that new DTs use a single way to describe
the same thing.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v4:
- Add Reviewed-by tag of Krzysztof Kozlowski

Changes in v3:
- Deprecate the properties instead of dropping them

 Documentation/devicetree/bindings/clock/ti/dpll.txt | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/dpll.txt b/Documentation/devicetree/bindings/clock/ti/dpll.txt
index 14a1b72c2e71..8759c328e841 100644
--- a/Documentation/devicetree/bindings/clock/ti/dpll.txt
+++ b/Documentation/devicetree/bindings/clock/ti/dpll.txt
@@ -57,11 +57,14 @@ Optional properties:
 	- ti,min-div : the minimum divisor to start from to round the DPLL
 		       target rate
 	- ti,ssc-deltam : DPLL supports spread spectrum clocking, frequency
-			  spreading in permille (10th of a percent)
+			  spreading in permille (10th of a percent).
+			  Deprecated, use assigned-clock-sscs instead.
 	- ti,ssc-modfreq-hz : DPLL supports spread spectrum clocking, spread
-			      spectrum modulation frequency
+			      spectrum modulation frequency.
+			      Deprecated, use assigned-clock-sscs instead.
 	- ti,ssc-downspread : DPLL supports spread spectrum clocking, boolean
-			      to enable the downspread feature
+			      to enable the downspread feature.
+			      Deprecated, use assigned-clock-sscs instead.
 
 Examples:
 	dpll_core_ck: dpll_core_ck@44e00490 {
-- 
2.43.0

