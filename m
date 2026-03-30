Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759E63C6A2A
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 10:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865702; cv=none; b=pXAt6UCgdCL+f/7HrjeUCFmsTRBMHx1orsAKkR+7H86tK3CxkO28aZeiKfNGq7l34J09l/4dNGWNeJpb8ymBz2ZIrKz+EEC0Ch378cm6JjAs2v+S/lkODctbOmBF5GF2NlLBXdQx9W82jy67UmvzrwjzLZD6GxxXmjzKoinfiEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865702; c=relaxed/simple;
	bh=jbxDqNZvBi2gj9IFvEI90pxmvLwKV+j3EaaxzyzaJTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kbKEUEUeAOCq2n2GeucTCDmNvOemu1OMxEX0CpO7EDIFr0hUzye4flSoU2wCqrFlmjnwRrGVco5PE/ArquO02YSaY5g0N8njhRdXpm+TeGDTU8ZnzGYML93+Qs/fdQIgeUwaWCDZS4FE+0u37J8lpmpiQr3/CrxihlRn/vR1dFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7PzCdQK; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7PzCdQK"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82ae379000fso1484154b3a.1
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 03:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774865701; x=1775470501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3tZXb9ZuOyelSj6Z0lI4WVX4+hZpWr55+BMQK3m+PI=;
        b=d7PzCdQKI2FjXAFhI7feJnqgEwLAb0PkUqOEuLRa44GWKkPO2uVQL/JeYHwcpdSrO4
         uhcz8YMjGejFfGF6eQh9AAWK6HABlXgR7RtYRZwhm3WhUCRpC6gVuRu1cyzrN3OjZ7ml
         VelI8XqZICAe+alJ8AlxexsyEmBkulELss4947d/ozuO9IdUAUj0lskQBTliNyX61Ydt
         Z+242OE4q5L/nl/7HAY+H8L6KzbSLW0PlzG5jR5XdHnRa+cbyprzDGWBMHkUwY2C0+tt
         xGmzxMfQbSFTP0XpCAa2yVYAv7PW1alkVSX5CQyEY3RZ8NiS5kB+PWaYxgnID5aJ18Fn
         khSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865701; x=1775470501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c3tZXb9ZuOyelSj6Z0lI4WVX4+hZpWr55+BMQK3m+PI=;
        b=BpyF80meYpFSJACMfeLqhZC+8JTmsoVT+LvG2HzPQ9rohXL3BUm5yDnWFRj75OJy3V
         PsAcpl51TzpnhZpw4P4rue4pRvEJ/FcElDMNac27UqigC0uzpUR74596XciD9CeSSKml
         YJY02h1+sDWg8Km36iiCMURgVXX7l0vxwmNDXfhd0cSWahcjY8Q+8zhFnSl4eg8MHLJ8
         jyuRqu6XJcI1nowqM16/H8SLefDe7xVkz8lh8foCWcr6q9muMygsrOS/wf4c2fKJF5c7
         sYc8J8eDDBTFFFpAU2ooV+HlUOOFBi7w/Hbjkb3Q8irrDVrWs/nc1pqOkjaiwpCu93tz
         /FbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtZ7k8+nwUaIDVqB730RlErEqSOm8YZ6Px/bjqFNcVlIiiJgxfyNzBwMAgWIq9L6CAwabgQeSFW8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlBEa5E2+IjQhV2hiJtDcsANZGb5RoLvWtKdtFHcYcFszwm3o1
	QsxblU2yp0DVIFVIqj3eu+kms2Ts0dGa8aQl1GNnmzX6Qt5M9ykh9XZw
X-Gm-Gg: ATEYQzya0M7zuD8qf4PSrE7P1I7rJh9wQdh0SASA2PDnVP5eGa76W05NkLGeDmw8tfM
	ujh+2W0j/ra8bQnyYRosHz3joUgphkVMS2h3Kx1bWcrkUhmrxZc+ah1YJEwFYR3Rjbb0uhsCN3x
	kcb5gAOQJxEihpraNggvFhDtaSxWTz7xZInbk7Ht/3LIWNJeUDsJqzSOObXQoVdtcMrkOMZYu6J
	f03kaxjq59o3bGhzLi4c2Xj/P50/A8IcoJf13Fk5xQFLPV5HmE0RebqgVYBA6x5GOHf2kCNGuYQ
	6NWEBTzJRNZhoE+8AbN3orFPo6ZEdaM2TJX+xa/RUowWP2XmJ67Bjz7YxSEO1cL4B4bjlkD5dzM
	7l2lnBlzkVLaX/trmmYFBRAlHieKT0YcpO7Lep17fZun3AO+DcpF/OPpRMU9OkurA8fpnSUGyeu
	AF+tXEbiqPyF5xIpboozq2pC1qfOCY
X-Received: by 2002:a05:6a00:1c81:b0:824:b304:2d1e with SMTP id d2e1a72fcca58-82c968762eamr9218652b3a.8.1774865700537;
        Mon, 30 Mar 2026 03:15:00 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca843d8e5sm8286080b3a.5.2026.03.30.03.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:15:00 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Mon, 30 Mar 2026 10:13:53 +0000
Subject: [PATCH v3 6/7] dt-bindings: leds: irled: ir-spi-led: Add new
 duty-cycle value
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ginkgo-add-usb-ir-vib-v3-6-c4b778b0d7f8@gmail.com>
References: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
In-Reply-To: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
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
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774865654; l=963;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=jbxDqNZvBi2gj9IFvEI90pxmvLwKV+j3EaaxzyzaJTA=;
 b=vESfFUjfFGKmOK/hDu/HFDuHjmi5fusU4ve1ZmPLbaemgxTmnuwyCQLnQCnN3/xFqngqK3IT8
 SDrNOUspY92DbEZYsp20mHxibSWyg1pOrifHZHZrcDoCeEbBzoQ4HKT
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

