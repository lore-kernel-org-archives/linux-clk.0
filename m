Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3702630AAA9
	for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 20:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758658378; cv=none; b=e801xzrGHr5p1F/ivzTwWHt5ghxD5ZDo09yXciNmmr8ed39M9M/p822z2xXU/cR6oZzsvjoXiR/nLFRNVc4+4H9tK80MR57lZtY6Xp5wpi4TXMR5oQPQbr2tz7zblJBvxj4AmEVGidndCBoVI2GvT4au5yFrCU+6VTbc6A+RQm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758658378; c=relaxed/simple;
	bh=pQQc50aYzZqifBZLt/GUeCSMwtVtlqq98lQJ7t3A0hk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cotP/n6QNJuSHLVL0tiwQLbSFw/cmptsyux3nrRDUyE1dBBRavUhihHFBhN2JpIv/Ut2/WV6sh0nVJ3H5u1jZtsJQjABmB5CfmVs7FY6baxpcy8q7lVLm0+asKBM64Bz60XZkeGAADoYFgPfiuomyQyOML8NnhKW1pw9qHvFCxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GdaLm28z; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdaLm28z"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46de78b595dso14344175e9.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 13:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758658373; x=1759263173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/aSYEPITl7MXFUBK4l9sWKvsSHUrdrtUDK4IHLwFVI=;
        b=GdaLm28zJdmARM/vjxZu6Cy1UUqOuylADCdBvQm7kf2zMRz2kiqhqlP/29XylFicbc
         88QSqo3TUiBydYebyvW6p/8/BUCTk5auL+9pzKFyEnMoEQqanJAiNDAeUJPkUj4TJy6T
         6fMGQeL52htGG8cfrfnO405If6BVbeZ0M++0YM0O97DKwe6QxCf9Qz+YhHkSolXKSHrS
         fcbWJ3p3KOuucvQxTA9CafhIHoB5Tbfvu6VEMG2zHPXOIIhtFhXFBhnmo9it6YsDfHfx
         N4tWA6tRJknC7CGrBrbBVELPBF6XKf0bckQLymGBHgRX/7Y12xuUwRNQHpxBQPLrf+Pt
         aIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758658373; x=1759263173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/aSYEPITl7MXFUBK4l9sWKvsSHUrdrtUDK4IHLwFVI=;
        b=M22NqpIVgyorPQRJ1UmpG3zfz/VxHwfsK7zCGyhNWhK+AILl9UkY7C/l2SC7dDE5YH
         98y8lIbRW2VByFUK2mDzsfI3NzaInKbw4jecqpo9zAwvMHHTnByTlAI59luKB1TxYGUY
         gKy1dL7CqstS0ocq04soXGQOFISR8YFPglbb72rCsBkwJqRFPA3tWlRZVBR4COUEg8AU
         AYZDbM88uZj7n76VGCTB7iVKaRNSteNgQFDNLmLZUgoMzslzo+pzmwrDsxnAPEl0gk6s
         i6sv5ggDyLQnG78dvUPPSE6ax2OO5Qqfc5ImE84eYkL8yPfamROMi5YevtNMo4lS/Hm1
         azlg==
X-Forwarded-Encrypted: i=1; AJvYcCUASVFmEd/3bNBw/nVuzFy8QfX5YbN+sJw+2OhVJD1X8aaJb7GRzBxun3l55johw/qUVTcb03AIWNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpa4VZtbwTs+oWEQszhgk9qQUvXgrCtEYvSPiZNDCawYrhzC4h
	skHtaOhPmP2cTzxWv0cHWwohIK/vwq3a9k07Jxk3m+wCjMztruDz/5vx
X-Gm-Gg: ASbGncs9YtYTwP7BtEhJa8at9x1sD7WKKYpWlRaFqF/NQo4+NzC7wm+k5M+2MziPVZ1
	tgwwuunjKxYrH5P4Gbv/zZ6kmXUX6gNCW3dmH4zQv3Tze8tphs8tfD8cob+yQt/y70LxMZk3ulT
	KQWDa0zvQ0ICPFRdjK65gyTZJ+fTs5AxLrxMyFOc0xGIAgDu6SQpVehannxmrkOwtb0adLmlGsB
	RtqBj1eFOTioVWADyVzgrqOq7lFlCBKfOC8IOzAPVbMX574FFEcGtEEJyvjghQ8K3TqsMU52tWy
	Suk4md/nPdv9AZ+WncXB8jD0IZ0e2wldnOlVt1xR5s57QRxDWau4vzTlEkO5lo60GrhgAOmL9ej
	V9SnFhTlGw+8HEwznmmstOz3NOPC2l/ZJfqQ0gZVZPVm8ecwA8W4LDYLXf75ML65gFpekzQc=
X-Google-Smtp-Source: AGHT+IEEsRLoHeCjXxyp+KHw/4kToNUaWd3xzTGb2VSF+HgIp8CNjCGOmpc4a03QsHuOffoop0UVIA==
X-Received: by 2002:a05:600c:4f44:b0:46d:996b:826d with SMTP id 5b1f17b1804b1-46e1daca1cemr38382195e9.34.1758658373435;
        Tue, 23 Sep 2025 13:12:53 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3ee141e9cf7sm24889690f8f.12.2025.09.23.13.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 13:12:53 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH v2 1/4] dt-bindings: clock: mediatek: Fix wrong compatible list for hifsys YAML
Date: Tue, 23 Sep 2025 22:12:29 +0200
Message-ID: <20250923201244.952-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923201244.952-1-ansuelsmth@gmail.com>
References: <20250923201244.952-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While converting the hifsys to YAML schema, the "syscon" compatible was
dropped for the mt7623 and the mt2701 compatible.

Add back the compatible to mute DTBs warning on "make dtbs_check" and
reflect real state of the .dtsi.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
index 9e7c725093aa..aa3345ea8283 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
@@ -16,13 +16,15 @@ maintainers:
 properties:
   compatible:
     oneOf:
-      - enum:
-          - mediatek,mt2701-hifsys
-          - mediatek,mt7622-hifsys
+      - items:
+          - const: mediatek,mt2701-hifsys
+          - const: syscon
+      - const: mediatek,mt7622-hifsys
       - items:
           - enum:
               - mediatek,mt7623-hifsys
           - const: mediatek,mt2701-hifsys
+          - const: syscon
 
   reg:
     maxItems: 1
-- 
2.51.0

