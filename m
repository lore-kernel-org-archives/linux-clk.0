Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1CD15ADA4
	for <linux-clk@vger.kernel.org>; Sun, 18 Aug 2024 17:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724002227; cv=none; b=WlNpzxyt6HH8ZzBoOSpOlIBhTh5DBPFWphJWsjaZqFw7nty47TLvbxiNwJOu/672PuBnrdBdpxi+XAh7Ajh8Ktec4TzN/vZBezN4ESonP+PzrLnEQJfec/ubPnM2Dxo+x8bL0JK/+QjrXXI+/MSwBPXeibTOqzITNyLNmjwLCz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724002227; c=relaxed/simple;
	bh=U6S5tfFiL27fmhyJLQdFRdd1Wz5/I61DAlDxqq5TzA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cNC8Njmwuj/noSmSTGJKvzQiq/CC/E0WPR5+IHuSV/VUEnTMBIG8V05rT6gXbSMQKOe5Mj01vqfOPw/jUEfuvc/0QlEYX71l6fY9qii4OfMSMQN1Ch6BPacC9vQNOCm74DCQtC4iQMDvZIyzWShTDRHqGRJvvSN+LVlHywUiw+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sfNMScWj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sfNMScWj"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4281faefea9so27193185e9.2
        for <linux-clk@vger.kernel.org>; Sun, 18 Aug 2024 10:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724002224; x=1724607024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LJzGmSDXl8HNs+ZJgf58xM3uvdTJPYEdQtiLGgE/Vo=;
        b=sfNMScWjJlwkS+KjEYdsS1rrn9ZXLEhZYBnLaQGthZyQh8x6cZHa4Z4LYg9yDbLGb5
         xfZh3KzTc+c3bAthC23QnkUEd1ALJ9dyoQNNjVNc8+fyCX8kNPEqIjrrA/D538/rAA7v
         7ggFPJeVwGL3Aa6WHDaYFB2VNZdsRFPBJJhtcAPaFZRcGJI8O1wUAUKSFjzj558yIx0x
         /RwV6dCTQRXKrULKQ0AqFPwhithQkyA3q8503N0LMoynNGrx8sTv8c8ls6dTntE1LfdA
         AkkHRLYGpzIapNtmYI2mvYi6mRWYGxaRCCzuReE1BOLi3YotVEg9qwpiI/L4QoDheKh+
         k43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724002224; x=1724607024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LJzGmSDXl8HNs+ZJgf58xM3uvdTJPYEdQtiLGgE/Vo=;
        b=Fwp/S/qt5CY65+QkkZTXyxCKnUM/yC/6OzQfl07u0i3VpEFptzRAp4rhVd/KyeknEA
         L8GB9AjPUQshV/SUGIkr/OjxXbVuskFJzW2x4XZehumjtCZ5FGU47MIAN+qmlk3Wwvk9
         lwX3W+4MzEi7O+Lxd0HU043NGmOzRsyjXbA3IFFKPgJEIeJCyYUNfyAdzGx0cSmplVTP
         ova6RUnzjwomUvYYhtCgZ8A5Ztf+7PvuyecjPt7TwhZJb031yZUnTpJg6lHGo9n2gx58
         ZDMBJYs+UvO0lR397i2Hddmz781gwylIbe7h6zCCo7iGIqqFEorTdbMyFFP3jlGvti1G
         XaHw==
X-Forwarded-Encrypted: i=1; AJvYcCWmvLh2tz+zDo1nEZF4Vuok+BFpT4y6+mit4RGLDm3pGGmB7kLSgTHaJ/LVLfJeQQjN3hZgvxUoF9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzQVTr5NEzby62xWPYsWFqPHev2Z5rjQgncy9EQrh6D+12I52A
	erZyxxVl6oIp+4AZLIJ786mQZgyymiBa670Ci/npTM1Qr0iEHuxL4D2sDYxSVxc=
X-Google-Smtp-Source: AGHT+IGekL2+ttve0hynRqEEzbgRWcWynLHa1J/EMMNb3eGD6VlpT3jMglNMhKBlzMDg3B561e5RkQ==
X-Received: by 2002:a05:600c:5254:b0:429:d43e:dbb9 with SMTP id 5b1f17b1804b1-429ed7cc4d4mr55016825e9.23.1724002224225;
        Sun, 18 Aug 2024 10:30:24 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded7d5a9sm134999915e9.43.2024.08.18.10.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 10:30:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Serge Semin <fancer.lancer@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	patches@opensource.cirrus.com,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/5] dt-bindings: clock: rockchip,rk3588-cru: drop unneeded assigned-clocks
Date: Sun, 18 Aug 2024 19:30:13 +0200
Message-ID: <20240818173014.122073-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

assigned-clocks property is redundant, because core dtschema allows them
if clocks are provided.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/clock/rockchip,rk3588-cru.yaml        | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
index 74cd3f3f229a..4ff175c4992b 100644
--- a/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
+++ b/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
@@ -42,10 +42,6 @@ properties:
       - const: xin24m
       - const: xin32k
 
-  assigned-clocks: true
-
-  assigned-clock-rates: true
-
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: >
-- 
2.43.0

