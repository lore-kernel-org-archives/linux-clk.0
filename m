Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEF642188B
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 18:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462071; cv=none; b=lI0gxq/owUUYYoQiH0HrG/tNseRFtsWsLaGKxKMs85ACGGlVl4fCys7A2FRgJ38JIyd6AcU6ntpqq3PI9/DGKCHWqhrY81FCyVolkmh1zLOcs3N9mTOSytsFEvvN2BVESYMtDVzPBcpMxurJAYxIx9aWpULEj/sqpqsW4yue5kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462071; c=relaxed/simple;
	bh=SAlCTNhoYBl7jxXpQV6GKIoXoc+5g1uH+ayRwKvoDH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ejq0GsBF6rTNrzJMTqqzhPIiXyU8L9EGoZLOY1d8SIvapobu9NRxZ9N+hgeWeduEezltv0jTatnMQLRBCX7JWaStExYKMJYurXyfKzaOpItIMXnzRlkAsm67FK6CztPS+E5I/Lboa6sD96dzvCAtRj39tSFzZzwZPhJknRm37HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOMagz4o; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOMagz4o"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so92568a12.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 11:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462068; x=1775066868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5py/0HOJBBmCXHr1qpaeBygvrnYQyzbcn8bu1Z3hzw=;
        b=rOMagz4oBevcgtyRlh2BLQU9nLyBqB+b3FYpJCtu/OxZA5eoP5o83IOR7Hi6P4I/KY
         974wvTViL4Rg97e+cfoULQzjTXzwIW8K2/aAMVmP5OUkEDHiTV9s0TPzeeirtq4rFK/k
         RjWufBFI4sFctN4Uc4eeK40hZyzugKVciikaOsphOxCdbe9N9GesopKUSixzG7NnGclZ
         yhDjHdRgYhUoK6gxXyhyY4MIBkDmEPfo+zdr48yTj8n2uOViCxn4SZ5FozChnzfOnfrT
         st9pa6wmdAXAdgwexkQAHjY2Op8+98M5pLz19UtT1oLroySUpX30DiZvkK7Lq1Hwnszj
         u/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462068; x=1775066868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b5py/0HOJBBmCXHr1qpaeBygvrnYQyzbcn8bu1Z3hzw=;
        b=Pay8URzf0SerpT7YHHN4ANGQuZnqEpeMke9D9MawDSmyGA2enNCpHy8zWjbU9EAd0W
         vKpmFWz3LDw8iieB5C6kYZDKtVyBzHYt3AQNNAC9IrUfWjlLmYDgN72iHjsVymw4o7az
         WHZ5SiCyPWnpip1MmXLy+nkmmQVG9n7gH6tLQokwPctHNg5OmOX7ZcXDAm3lqUB7lSy1
         cukwu5cCfBlpkbIfEdaOJQ1sC3jyT1fFMEGpOchuAdq8cyY527CBmtaAi/lFawDTvgfh
         LMvsEz1Ch3YrzWybrLEY6VLTCDtbpWvcuRKreETbOjn7Uh7poe9oJboSl3d5y11+3dPt
         R54A==
X-Forwarded-Encrypted: i=1; AJvYcCU48J5tIcEwFf/8sD/Bf6bQa2OU0Pb00fU3GrRSQOtIgwEey5B2zZUEx0Mnf+uZZKsH/HKrnv5sx78=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU3b0T0u+u5jtyr4cPt2x1tPKnXgWSWpvd7O8sPYNdWXtggLUg
	QeNwDdNdaytKJSOHRxHVFKP3h4vD7tLDvcSS1T04g/UJyvBwSPfyGlLx
X-Gm-Gg: ATEYQzxXFLAIK2SXBomA9ZbqG1/C82QZ22IZjrdKwGCKv3p4OVRX0N28nn/S65qN/G7
	IEk/e0TFeSvQVCovd61k3uOY1Fgi0/efRHZF8wF0fEKoJ0u13sLFoqyb/znWxqV20GFb2AS498g
	I8ZodBg/SbjgkhLM2VgWri9/imNCdtW7XyZDlRd25NVQYid4znGX9BVDgPoKpaMTTKBBpgORmX7
	jOPx3GJ6+ZzozcMdwjAh9jjj8SvMUaRBZvovYY5Z1N3Uh+Ax3waCb9mMQe24lMNmoMCy46JfG2S
	UfBzzcoQNTc54fXckDe8erFQ6TXXnEpQBAOHpOFJAhK0cnv6+GVtnmGqWxkAB9+/hns/OS+FFkY
	yW6EqXxkoSdaIWLOBvjNCRmQ6KbeHvKeUp8yqodVifCVSUbR5aJKDkqsJMIXpNgyOd9+DJu6lI4
	I2Cw4Bx73MoPPAlZ5qEI1oJDvItawB
X-Received: by 2002:a17:902:e784:b0:2b0:4eeb:f80a with SMTP id d9443c01a7336-2b0b0ab3a21mr50563235ad.29.1774462067634;
        Wed, 25 Mar 2026 11:07:47 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:07:47 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 25 Mar 2026 18:07:25 +0000
Subject: [PATCH 2/7] arm64: dts: qcom: sm6125: Enable USB-C port handling
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
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
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=919;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=SAlCTNhoYBl7jxXpQV6GKIoXoc+5g1uH+ayRwKvoDH8=;
 b=voXfhb5tQm3cVPDqWZP3DiFroa+n9Pp3IhcNpBymaT+ppwL0cOEgPXmQqxc7neKiDp8CqQHRt
 92SQS4v/upQCCItffWGtN3Vw5UcrLztgcL44oBIFh2osoEjUhpL22gp
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

Plug in USB-C related bits and pieces to enable USB role switching.
Also, remove dr_mode to enable OTG capability.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index c84911a98fc..259a24fe24a 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -1238,7 +1238,20 @@ usb3_dwc3: usb@4e00000 {
 				snps,dis-u1-entry-quirk;
 				snps,dis-u2-entry-quirk;
 				maximum-speed = "high-speed";
-				dr_mode = "peripheral";
+
+				usb-role-switch;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_dwc3_hs: endpoint {
+						};
+					};
+				};
 			};
 		};
 

-- 
2.53.0

