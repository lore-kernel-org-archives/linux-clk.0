Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7046283FF5
	for <linux-clk@vger.kernel.org>; Sun, 29 Mar 2026 04:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759733; cv=none; b=gmI/x1APbFG06dXWDychUkCMQ5XrnrYTvHNG5JoudU8y7niD3hTDKCiQacu80XCLxoSvR2J2hGyJS/Uh4GBLPsU7W6GLNw4TWmai4Vv8jSP/r5kLesPHcvFY/pmm4coar7cgGTLAcq++z6Z3OHhkMUQzDOo6Gk0DYSDmGELzIvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759733; c=relaxed/simple;
	bh=jbxDqNZvBi2gj9IFvEI90pxmvLwKV+j3EaaxzyzaJTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ts/UD/PRE9DTfCRZ1EHcSVylIlyi9YF9zsBqQvJA3OtoEfXAN9G3jlI9CkOihzdJK1vh+4WkKrEV3QfdCCPJMY9BvLLKb2QzazgmX+0DpTIZlpkIChla8gLlj2T1R7Toc8ub8xAQDbzna4cCg2jroQt7vS972VclT7IqCsclK4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdAInTUc; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdAInTUc"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35c1d101355so1448602a91.1
        for <linux-clk@vger.kernel.org>; Sat, 28 Mar 2026 21:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774759730; x=1775364530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3tZXb9ZuOyelSj6Z0lI4WVX4+hZpWr55+BMQK3m+PI=;
        b=AdAInTUcsFpyZtVCb7wwDIsvK9voELpIJJzB55MboIHKr6QHRj5qjl62KWMOs3m0mJ
         HZ5ASnBqulq4Xt/l3xuMgtuUa7gol+n71M5rtEAHtup4iKVNWQ8H9xC9qYC4d0J8TfaT
         u0FZa4KRMxGt/kjech/AamV78xelsERLrinp4ylbl9iCuuN2bqGrNlVtaN2uUH64ds9G
         SzaRuZHHbdwqyPS/YGC5k5dXf7YzZHkCuYk4WNG4R3cEN7o5TYe7uoGwm9g3vCElAPKE
         EgRaewXk/zu1iv/A1p6Ab81yVe5h6t0fzqyq6oITtESyRuvAYzasXaUo+y6YoX449CFu
         AwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759730; x=1775364530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c3tZXb9ZuOyelSj6Z0lI4WVX4+hZpWr55+BMQK3m+PI=;
        b=rA0WFGcEP/oz00EjaghO0YX6L9mdJOlJIIR0YgLLrmFAxy1h55raGn+qRo74emXvKf
         ma4b13wFOoTUdITX4VWGjuN/NCfNPC5DkZfD07Ng4FTq5nyPRL/10lPucxlILB7+WYU3
         vGbOt8GmLZJZPdi0rhEHLrhhnACe1uthh+ar4sT6bbMHsKUf2wnCCUH/MUWWZMLHi3dw
         zswg5xxHpLwSHRL6lMGfGRmN6K5g/S2VCFvq4jencZHeE5TL6uLOQNhoyhkaSiay69Bx
         HXo4Jk0LbcyGqVDCNHSLNdfe66iw+o5hD8D9ZJBI4MlvDTDmp+/qiXbEDr/miywanbIt
         sOsw==
X-Forwarded-Encrypted: i=1; AJvYcCWJJU4F+OX3QvgIzdDJvboFRtV1ma/rG55FcEjYJipsTXdERloGlyeJS2pkxdQgsXAeBWyyU4mm7pA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPUxiJ7Hc8Puj2xhLEE8jE4yzjpias42yh/ESlCv50yNaN0NFn
	c84tTmGNHvgHQOB7H+4KGVQtxDg1qWutWa4ng99n9w35wloCupqKDCTE
X-Gm-Gg: ATEYQzwx7ythvXXB2kwUd8YzhaJSjyju2fzkGZnN581QEAN6aenbt0lay0NPRua9oMr
	nUBWwQcl8y+2WRXKQIDKwWB24KdbQBvI3/6Oz77Dulv9loIFu/UK1iCjuJDD79F5musXDepjSKc
	81yZRWIi7ZlzIzvfqScu5MCFXMOjazYpmqcUnBXC/EzYydluozoQrJXFSu6gDdM3sl0ECS1N2yK
	y6fSZLd5uYf+46J9uIyOC27pJQEMpm8vyM2yhzp1bbWQysr7cFFFTk0xi16U70sTBgPTYA5r1aJ
	8pFaIPS0skwCAjkiAInzVaBBxvU9racah7fuAHEoxUOLZs+nq6Ql7RyQ6IvplxDQT81z8H4xmWJ
	/rMJJ/iSWuIflX3N9ixEVnPn3ic6APZqrDbYld/siSBvzOegu6nbciXpL5xPfFsqqn6Lo47qU/R
	zDIT9roctdX/y0UJ15ceyLpjMtVdGO2JxX8F8k9OA=
X-Received: by 2002:a05:6a20:94cb:b0:39b:f026:6f7c with SMTP id adf61e73a8af0-39c87ba1d3dmr9052151637.49.1774759730149;
        Sat, 28 Mar 2026 21:48:50 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c769179e31asm2899739a12.17.2026.03.28.21.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:48:49 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Sun, 29 Mar 2026 04:48:01 +0000
Subject: [PATCH v2 6/7] dt-bindings: leds: irled: ir-spi-led: Add new
 duty-cycle value
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ginkgo-add-usb-ir-vib-v2-6-870e0745e55e@gmail.com>
References: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, stable@vger.kernel.org, 
 Biswapriyo Nath <nathbappai@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774759680; l=963;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=jbxDqNZvBi2gj9IFvEI90pxmvLwKV+j3EaaxzyzaJTA=;
 b=81X8217C3DPp0B0P3hZM4aXOCm8lzOtEXnsLAMxdNbbkMgYAO3fE2YKhyEY97/IFdfQWBu+QK
 SnzdsTunBnRBxxt0Ihn4/T2XiSr+rqhd+1F/PnfcK3LZuxS90GFTwgJ
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

30 duty cycle for IR transmitter is used in Xiaomi Redmi Note 8 (ginkgo).

Reviewed-by: Sean Young <sean@mess.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml b/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
index 72cadebf6e3e..0297bfbb2750 100644
--- a/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
+++ b/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
@@ -25,7 +25,7 @@ properties:
 
   duty-cycle:
     $ref: /schemas/types.yaml#/definitions/uint8
-    enum: [50, 60, 70, 75, 80, 90]
+    enum: [30, 50, 60, 70, 75, 80, 90]
     description:
       Percentage of one period in which the signal is active.
 

-- 
2.53.0

