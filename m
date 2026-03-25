Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B527841C311
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 18:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462083; cv=none; b=YRH96F8t1QcSSkbLa9eA6/uKDAPGR7rzA+alYUy/PGjBvBGUnZLuZ1Q09eulZzxxEQvzqVBDBRdt03ZD8RIFPzo3D4YG5ISh1BQifFwuQ0zA7G4gXd/IrqLUDiwErEDoiwCXYx8Df6m4LzF20A4cq1tL9Hq4SdNGVRXkDIzsnxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462083; c=relaxed/simple;
	bh=idSfP5HyQiNIGHknsAW93yLVNiPUDIYoFLjjk8abFqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kRYi02zbMq0X5oC9f9xuuDHEWVyMNKqz++VUkqvmxvcNNE5IInDe6M+zhRXocTyLwclJBgbKBODhaLjlJn9yZoOworyzdC1jrzLLpCs/+KMCZ0FQA1KqxXcIGq9SDqeVp8pTnkuN7xG6UpzeIz++E+QVcEQTmkaQTk/fBfw8Z2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pq1ZarGF; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pq1ZarGF"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ab46931cf1so9867605ad.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 11:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462080; x=1775066880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6RW8W7t9a2T2GNiqIF1Tp6pK/FWIbbUcezYtUjj9vmI=;
        b=Pq1ZarGF9TL0vKJmvaevq1b13it8hPBAYEV8Snb+4rZKq0/HLKMcy4165GSIHgY8Et
         06vb6HpVn0WO4z/ZKgYUJwaLOYQrBTW7YSXWAKPT+U2H2D/PRaG5VZQL7tgpgVaYiWCp
         oeo4XnjVQu4R6EINyfy8Xv21vb/vU6oZl7hbIgxYPzzGgrY4KU3yBfvog+8sTc9+a5fz
         VQ5jkB5hnkxjmuggtWH7ki9esxh+lPrf9z3slLwbzopfHvsZhTGN52gllnSUXdHUp5jq
         xf9yHdFTsYUZEUo2nD8wHPCsgTzqcYt7e+NX+E5MKNKMS9ClS1tNjT1m8KSztt735BBh
         QAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462080; x=1775066880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6RW8W7t9a2T2GNiqIF1Tp6pK/FWIbbUcezYtUjj9vmI=;
        b=KebGfy/Cod4EKdFr0yW6BqVqm6geLigFPav65Inf0/FFv3lXmCyBDc7ZV8IRJYiVmO
         yvkIE5sUOW5G7jBfVuua0IR70IZoUE5iaSzAYfHpVKlDXNHwIG0v1QultlGarmbUxesb
         64d2mPYYA425Ztgd3E7RASo5QcSsKw3CkWPNgmm7Po4piWwRhPPzcqMwHsh+WHrpI1yk
         rqXkccHoi6rrlLdWvtEEUnHVJ8fOF+dr7Rfw5VjvbDWRswcZMqUMjEZO62/udHje/fCq
         mZtifIMDjI7TBwJ1Dr2HRE5lynbCM45Ll8WE3aafOfLWGBJoWQoKa+Vz9EP6JYHaLpQR
         tfXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl/NM8KNL9mvkjNSu2ztBzHElUKQU81TX9BdIwsHBG6AQN3KLUmXZjB2B3K4Sa+XZ1X9a88xbVYZI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5d6Hz/eWRswxJfqrVcJiGGwyK3z2hbLKgySlz/x4x9Rev0aUa
	15s++5HwmR3Lr2XJ+TQBrNlN2tyTFtWtBykBP7oS3cVELBo75mb/ttWemg/aowcs
X-Gm-Gg: ATEYQzxTwzof4sAn9ktvuxvrlyuul64v5sqKgq9GJT99MkgNcaHzA/POMeL7XMBe7Ps
	kM9fxTmH6N4/xcrsouKVLk3GrNs356lNjL+Int71dc9Yn4pS0GCXrvXFB0Uf3tutd9ildokc1wm
	l2BAO/glc46J4lxftoQlZTSTP43FLZKbuC8iFh1WsHDhehNNhsJ4oj1ZHwkJ9Vy1Rpm9CYGY/cI
	Ahjnvhd+OIwP+EcS1l/VdfvN7SXEA7rraaB+pOxzCPnI29KCneOlLR1CJIkBbz1t5X6NhqOvfQ+
	5wNqecncpOYgCiQhtR9IVdZW47p5CbWUkLrX7W9vUCO4bsV1MBApdjiv4tZSwBXGAJ3iuvw3AL5
	FGDGSYibIEbAgGeaX6ahYYJF3j1TYCH1pP0nKcT7I4fbVeDGpYCBQ8KSkSbWXU2E0oLdxsXzlcK
	+CsChPkS11nkQ0vyTAXsdCPIOKfPWN
X-Received: by 2002:a17:903:8c7:b0:2ae:4aa8:cab8 with SMTP id d9443c01a7336-2b0b0695a47mr41847625ad.4.1774462080126;
        Wed, 25 Mar 2026 11:08:00 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:07:59 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 25 Mar 2026 18:07:27 +0000
Subject: [PATCH 4/7] dt-bindings: leds: irled: ir-spi-led: Add new
 duty-cycle value
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-4-446c6e865ad6@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=850;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=idSfP5HyQiNIGHknsAW93yLVNiPUDIYoFLjjk8abFqc=;
 b=f2ywcUw6qhQWvHyTyNv4T149ViOhu8Y4DN0CMzzvFS+yL2U+g3sDFvUmgPmgqRQun2OmgiGWK
 iGQLZq9lALSDBlMVUEXSVv7UjdbHBHOv8L9hpbNCB5IlKhRe3SeE4+q
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

30 duty cycle for IR transmitter is used in Xiaomi Redmi Note 8 (ginkgo).

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml b/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
index 72cadebf6e3..0297bfbb275 100644
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

