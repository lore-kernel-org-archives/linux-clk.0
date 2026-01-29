Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4199340277
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 10:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769681820; cv=none; b=T4Mebh5ceOKslRQi90eB0t3qo0PvRoGA4xB/8+suIjjG99PhhRYKnLcXPardWknXrDSqSYILmivnvrb44pZGTA6OpQU3Ig2qeWftTaEJ61tvM97ReY0Rh5smLm3JODygvtGJkqUH7dWp4cqSHPGId6JyOqmGrysgEDHH1kiyInA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769681820; c=relaxed/simple;
	bh=l53JAl1A5TRe2s7pqTepmBMNLndaNxM1i2f8fJ+CJTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rOw1TwQ192di0CsoY9EbjWrG32hfTmT77I90sd09nz/PXHVGAtyPY1JxjN7jO9cPhinX3G6dgf88ts/oMDFphGmq4gMuYUXSmcuo+sjSqtYzd5pBMBrKNwf5SOTAs3AijnnHvQGxiUnmQu+Tz1RZ3AQ+WxUo6DRor4c1wVp5bH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5ytokqH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5ytokqH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-480706554beso8149305e9.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 02:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769681816; x=1770286616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kt7uEiXTlV6e7nA3ca7sq5Y8eWxdpRVOenYUuxl1aik=;
        b=B5ytokqHOXE6HNDPinSMT5WL3E00A3POWmFiXns1tIzGFYxou8yfE9ypera1dWGU3b
         2JrbvoN8mlm7LJWiJnOurKJA3zIkNv3KxpbiWZ4hJRFsszkyLG2o3M6G88b6oj5QGFPJ
         PruwM0jJF/mM9vHnN9+L2WccsWnqpxzKDtFKCnqsIFzlW7VIYdx6Jc2A2hvHt9JkBQMC
         D8GEn352w4QfOrADzU2Y99uCSlhapdz+2OTxKt8A5JnNVxPZrLYC6sXWnMTMO13n/MNp
         Z8DBx5aSC4FYjiKj4cJESGfpkii1fhiw8bTbfb9lTScPGLhQVNsPs34g1v+iQRa34UAZ
         MDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681816; x=1770286616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kt7uEiXTlV6e7nA3ca7sq5Y8eWxdpRVOenYUuxl1aik=;
        b=ceuFRhqvDc7/DLTG4dIIKq5Vrx44UrBUBNvZqG/HFAYbg6U0MtZpTkJf9PiO6uIEOX
         u4HMY4vB5vZqqkhEzrQc0CT2O1IrCAubIj2A+YdQlalL9wYgpLQWv8zrRL8xURvvuN4b
         5jbfugBUh84h96rChteX1ja/XCaNZ9dfVe1OZFSoS9T/9YukMtKoxUy7A0AriSLEhVro
         CC6tzvQNW9+C71cjJ4fi28rJIpBqzKHX9A7ItoGNBz/X4ypaVcoKIu4/l+DIyXfRjsJc
         aF2dfo7UrduEUCbo31AnYhZm85VxuQaKhaMqpopUgTO5xpsU+bbyCbT5yo2qMgB6OXXL
         XkeA==
X-Forwarded-Encrypted: i=1; AJvYcCW2PgGA2/XJdjB+qIto+qnxXCi5Zmn+tZrJVB92Hj897F2nJs2vhJYp8Yw5b0MTEUIOhi4HxaZmXJU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSGm+XXaWsHyrbB2jLZTT7h175YIOtWkFJh0Ptx+hiq5/MWmOn
	OnaN/kLZ2veeyD1IZYtYvqIEN/WwuxA5fu+LyUAhw5rNRdQx7prMYQTf
X-Gm-Gg: AZuq6aLXSzeLHenhn3JBwDshOkCzb2ZUYgnVRCoakfPgXl4QL8XKPc81J4JWcMS3NMn
	rRXlhG8IqlOljWCY4hhw64vXrkrnlooYZ/YIlDkEcuiziGmucXEvg9HStyyCboEXDBKk5EMRldp
	2lsLdBh6HNpdX7OOqghc9l3iPy5uq7/IaAvVM8QMnGf2rJ0fdugiunqDErqflWaXb8OwcDk9ovo
	gWlUFjq8N6pDm2ksrgDuQFFPD0vDBs7S+AIbJ3yvIDCq3vNVaDRssdubP3lGKlDnwatujCQysmN
	YsJETY8AXQnR6EV0J7KSs+2QBfODVfZzM8AjxV0n4DzRCWG3UwsCaFToxjJECTu0kHs+B/Ujh4o
	KcyxTCunzIAXYJk/DOHdfrH6+d64hpDL8W6AagM9cXs1QkKL6YnpDo8UzPj+sYWliXtEKRFKN7A
	gXUbAlaIdDKoANS6zO
X-Received: by 2002:a05:600c:8b24:b0:47e:e807:a042 with SMTP id 5b1f17b1804b1-48069c1c009mr101678685e9.15.1769681815992;
        Thu, 29 Jan 2026 02:16:55 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm178642065e9.2.2026.01.29.02.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:16:55 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: biju.das.au@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH RESEND 8/9] arm64: dts: renesas: r9a08g046l48-smarc: Add SCIF0 pincontrol
Date: Thu, 29 Jan 2026 10:16:43 +0000
Message-ID: <faaddb4d8bce3aacda6cdf032c677d8380f71b66.1769681553.git.biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
References: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device node for SCIF0 pincontrol.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 86db86335d5e..2f918830b8f1 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -35,3 +35,15 @@ &keys {
 	/delete-node/ key-2;
 	/delete-node/ key-3;
 };
+
+&pinctrl {
+	scif0_pins: scif0 {
+		pins = "SCIF_TXD", "SCIF_RXD";
+		power-source = <1800>;
+	};
+};
+
+&scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
+};
-- 
2.43.0

