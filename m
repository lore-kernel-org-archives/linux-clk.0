Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41793019C1
	for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 11:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757677031; cv=none; b=BgiYVpuLD+1Ixy0QbSwLjfOIChTuirpf4UOJxwtr6BFoiu8TpyqbXTlVj/9XBN5WQOhlPmemaU5omwNPhn0WmkNucgsZ6artzekOp8L/RVZnUEMYU8vsMkcgBNDH0m98nmayKN+KkrHx08yuHTHSLyE4fpLU/+eBWA4GrH1n6lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757677031; c=relaxed/simple;
	bh=RPBQwPNuYyYtQUtZ2JZFYIKb6yx1lRSpbGv4ihtUNa0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t1YvxzxhLIWEiW0ghTX+wO7kdlysRZZyBsGUdtjbzGeEruVAwvmLSCfBob42c+N/mblWXv3R0JErjy0jvogAhi+dPSvi4OYW5zYTsfMLEdjA1AagOLR6iv4tXWb6W1Dkq6Sw0wU+gQbeaOjz06f2Dv904bGg1a5XW2Wf7icFfDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNZc0lIl; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNZc0lIl"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45cb5492350so13618695e9.1
        for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 04:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757677028; x=1758281828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uMQMHx+8Y9PVtHu5Fhv1ceibqlTqO0/BLpLsbyBHbrQ=;
        b=dNZc0lIllrgzrl/koJZ3gnUYm4WNFWsApiuxLYYfV2NDLCdbK4DsMepr8hGsiTwCBn
         oAaGHw6qUg0gG/KI85tu9BoyAd/ZstP7uD8zmbhbRdDk3fVNoOxmFTy+CYWTglRPzJnp
         YDLzGnUy11Om5BNMyhQEYshNfQRkvRvFlEexg7C+mUKFxtItgiZjNQKHLZMlMv6eLXup
         wmbAlHrFIz02MmTzTnqDKVJkh8BleAuf8zc26NWGn7wPBRjfzySsY+AyJMVqciaKgjQ+
         /amRt8ZupW8p5/W+zRmF8oBcLKRF1+MhBxUOHc37rnJ8esqERnhST70d8/6v8r+s+VYp
         OcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757677028; x=1758281828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMQMHx+8Y9PVtHu5Fhv1ceibqlTqO0/BLpLsbyBHbrQ=;
        b=ZO2k7DkA+VvciiwXz8gimusarjeLzp9QUAeOyZT5YUwlSuSOm6dEP63AJZ4teM5O8Q
         +seX4pdMHE1hueqBfN+JvvF8LwK69v9OyeCmy1nP9L2jZsSyAhiWqKJ+tQJfblG/MrGA
         YCg+n5JdTQ+oSX8vATZLt5Peugm2QPjeJS/w2lFKm3WPo/bdYySzIV6E4T+Xm+xB4sjD
         4nJcFAQRKcm/hTuLNu9DI+VgzfmLne6AhvdMx/J4Ffr9UGLJaml30Pwq931TaUrFGTOV
         AUg+F/3uIZ/DXL/l3gMrUUMYAYuQnBraZJDyP+PUzjwNtEyD/wWCzRTRPFpH+TJqnLI8
         nHjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2u3pDg0jZpC710DQKwxAplXjYs0imYcfOhfG6tF+YNGbGKBt6h4U3o9OD6qrumurHDjDyOGh05/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQOkhXroaMVE8gNADGgjBTHtA2Ov/K/v8uFRHmoCQ/uaHtSZKu
	Y9vuoH5OWZzDs8paziCbfSBAHBXTkE1Hvg7jak9BBhlcPuNgfF/6ZIWC
X-Gm-Gg: ASbGncuWWCOwQX0aVmS3++diq473y/M2wHK8GA/Kc/E5vLNjz75nfIKO7ssqEJnBmt/
	FYHOt9K51JGu0K6c1U7SHluAJ3wsf6kAllkcx55kByQw2i2Er87YR+/oPVAguaEbUdf3PY+A4bD
	UfgFEY8zKnpZRqoi4DkaXKQF1SbFQS8JOMY+aJtr4iqhPI/iu5RnaMvRiS/uT3d9jo1tHAKv3wT
	FLvYh6QzjLS13FPoJ1oSEORnyBJ1GqdxgTZ2rSvUa0v3tm0oailVIyZAXyXs0gn7YeuVU/8pNNz
	HGWAK8JC8ExYPykSKEld5tEn1IoahY4+hpik7HwfzsoIttrstdiRUgmGEVc7wBhiOInpGo+fEkq
	0RnJIduHGrUsbaH/6tWTEASc=
X-Google-Smtp-Source: AGHT+IGejfUQRDplMR239pOYC0dAntQXwDDPfhYxh2LOkKsXpFqY6rB9nrWYDd+W28ipozk9KPoPJw==
X-Received: by 2002:a05:600c:4e4b:b0:459:db7b:988e with SMTP id 5b1f17b1804b1-45f211d5753mr25454785e9.13.1757677027899;
        Fri, 12 Sep 2025 04:37:07 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e037c3ce5sm59287545e9.16.2025.09.12.04.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 04:37:07 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Fri, 12 Sep 2025 13:36:12 +0200
Subject: [PATCH v2 5/5] dt-bindings: clock: st: flexgen: remove deprecated
 compatibles
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-master-v2-5-2c0b1b891c20@gmail.com>
References: <20250912-master-v2-0-2c0b1b891c20@gmail.com>
In-Reply-To: <20250912-master-v2-0-2c0b1b891c20@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1176; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=RPBQwPNuYyYtQUtZ2JZFYIKb6yx1lRSpbGv4ihtUNa0=;
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBoxAXb6s+ndbTRQTQkT6UJVWKMYLPxxzYY/K27j
 OhxLLATMzKJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaMQF2wAKCRDnIYpo1BLC
 tTAbEACsW8Im2GJnyd/A9nW2OVWa8v21L3beKtkkrcLZsvVewjBorACl5+Q1BKgUbkdPtOmAZX0
 +vaB0XO1cTHWSXY/qBF0B/Ld1sJhebFPhX5RweGvcmpuW/vStC9N/KRFejRzHwU10Cfaj7AXcrR
 F2sdu1Lv1e3VC6Zxp1sct77rAsQQKhGJyUUn+n8D2auTQoy05RB2Kv8qC2FnsI98XzI9V7a8cgX
 UfHpmJ4U0czwQnaASE86LGQKYYEb5Ue38wlq9gUXFwn24q6UbSfFUq7Xm3E/AUtMD4xHtkMcjt0
 uJbMojvibnzFYpmAz7ZB25Giqkp06Js1WW9AP0RNEH1lKvNBrCUymMEihmPEKYOJGfIHc2KxCNN
 2rZ5bUcG80xGYLIUuWZUotY/ocEbPGjH/bDI1h73K1QF9JxnW5oDGCNo4NSuUdP4lgoTYpXjzLo
 SpDh88lX76avVtTC4w9iMnlN+XcDWFqQGjYc+gh7HxkKTJAA+AkHtJd7wVKX42e5KeyUo0auQCt
 VuxwNEdOyP7Ggui6l/QLl27SaiLEx/Qb+O10OAXfdEz7tQ3Tdx7fqL2umGBF6q315EnePvPfFw2
 m7YD2UwpCbvcbtuLx4qA4nrCVTFqSJnVtYZ1tt8jRkICBgyusKv71wesSyVF+cfkxZOH3gTek5I
 GvveP8+RJR+TfIg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

st/stih407-clock.dtsi file has been removed in commit 65322c1daf51
("clk: st: flexgen: remove unused compatible").  This file has three
compatibles which are now dangling.  Remove them from documentation.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 Documentation/devicetree/bindings/clock/st/st,flexgen.txt | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/st/st,flexgen.txt b/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
index c918075405babb99a8f930f4a4430f57269417af..a9d1c19f30a3366c2ec86b6fe84e412b4b41ea56 100644
--- a/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
+++ b/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
@@ -64,12 +64,9 @@ Required properties:
   audio use case)
   "st,flexgen-video", "st,flexgen" (enable clock propagation on parent
 					and activate synchronous mode)
-  "st,flexgen-stih407-a0"
   "st,flexgen-stih410-a0"
-  "st,flexgen-stih407-c0"
   "st,flexgen-stih410-c0"
   "st,flexgen-stih418-c0"
-  "st,flexgen-stih407-d0"
   "st,flexgen-stih410-d0"
   "st,flexgen-stih407-d2"
   "st,flexgen-stih418-d2"

-- 
2.51.0

