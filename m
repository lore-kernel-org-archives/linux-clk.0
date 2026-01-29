Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C9933D6C9
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 10:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769681819; cv=none; b=BZ/pVFD3eUXsmqbj5uvmggccn/ckaPZR8F21abpF/+6NbEfb2mVqsy+HAWeM6Fhooeoh6iyFH+yhKwz01ov+atYl7mgPV+AH/fbaFM70K3KdOfCQJvxK0qRNYJ+Z55aCLc3F3Z714XDJ4kanJeLV0fMUUYSCrXLA9zxXrCi0KK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769681819; c=relaxed/simple;
	bh=9736Q1c5UPkbPCgTxA+3Cri6nfDIyGp2aLifbmZ9cpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bGKrM5013LFExnNr9ifyit4ndv5cUDoJxBEyyNsjkWMD49OeYmsaKiklGs83eTC/bDrImLqi9G+VGLQ3SlBuNChhJr5M0Ay4eWARQ3gieXyrEVhGM1SHRpHclLY9mGjwqyYxlIaIfm2UGihyRwkofKX+0t6B6I+NKdx4I1U5aJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZLyk8DX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZLyk8DX"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso5783885e9.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 02:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769681814; x=1770286614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNHC7BZwLEWIAkvOqNMf9oTfVeweCY3nyHbRwQRrLe0=;
        b=SZLyk8DX9IO/nGI0mmse6ZDGG46hiT9WDd9A4mbXEfxu3sjBUdRmstuWQj1WR+csgn
         g+HsMXoYpMNdMTVLxMJk/A5nsBUv5hwu+Prsghzr25Y7sKz5TAyASnPL0y+4mmifM6QY
         GIEkhSJbwoKfly55uIB14E9cKu7XnDtjCgwUYFZDHmmQxRPVB4KI+qOwGUVzqJ5u5907
         6iuvlA0/NtjJHFDyEo1K4hePachJBuo5q3a+yefPi1htJMTPoiw4i1QVsdZWvHXjHgPU
         MtD9ri4KdMWujWYsygoBulT5Rail6W/eA62M9nNFr0L+z+1TMGpnP4Q/oBqBBsaITpBF
         Y6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681814; x=1770286614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pNHC7BZwLEWIAkvOqNMf9oTfVeweCY3nyHbRwQRrLe0=;
        b=VR87sARG11u1bzuHrtalT3hFE2VzmrzTcHsiC6e9oKmPIGAzfyMMFIVfeDTISDHYVZ
         CZzEEPCohQwosPUU1COEXOe/Ow+NkWavFL/Qart4WMg1nKtyYPWktgfTv21cugC6Ng25
         yqn0KVGBbyt5wO3E+tKTTwguesZWlErzePaiGaqIYG+x4k3x3VNORbP2QFS3zZrZKmjb
         ox1WDazgboDVaO+U7S3Jnq3tdZxhASjMEsoVQJmwRgth2ht/Ye3XxMri6RHwPMx/i5dF
         HLUmKWvNt2W38Yf+7SioAOzLwvvj1dMMh0EKGMOtQt4LmgP2IqkTlav4dqfV5nICNiJE
         3DbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIq16uzEmwqDLYRAkaycU2dfG0QzVIjm7eyoa8qMRMXmJoXOXClRA8eDY5npT30/jCUG0natzzG5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU8CIwZs6qX/5osfLvLb/JFKG0GRlDjI5gnqlsvz0LpotCWWlM
	PkoGVepsKmeZb1EGXgoaoBA0SG7umsmyD+/YEtU1cecO2doUkLZCaTtz
X-Gm-Gg: AZuq6aKGRfkA0uDDT+XHogX6RoBy/f31TVQajHFfEKAzPVeqaonSwjFFwO1ifwJCmRm
	Ofvei9Y34Uv7BLpGWImMWiokfXBFKs4E+jF3fBkbXIhFbHnRiJ1Zbich0hteZT1MCPBAItUMSO2
	dJZoRs+C5qWZn93+HejjfetLUf61QxY3o+id00Mc3+S6bBY9JcQ9r5J9RuUAAdAfdJre5MX5duX
	w2N5iILzLnWpo5vfDmXid67UFMhxHl2SQe2qyqYmkdst/wNj0qUuvKFc68TIVNjJnT36v9vVW5x
	py4SCn7aHmNecF8QyDYaA+okNNZ80jLp5vf4kHdQkp+aCK5mS6ZBBVb3/y9uhZnka9I68rSJ9vg
	qtteb0N0DgJ9FX2eVDUR7fArY8fQ67b3YM2zxsFZz8ISKBB36oiq8XawgbbUBu2xlPLrBj/h6EY
	+gKprCw8t/j0hDbPgl
X-Received: by 2002:a05:600c:c0dc:b0:480:4ae2:def1 with SMTP id 5b1f17b1804b1-4806c00c0e0mr86656865e9.13.1769681813615;
        Thu, 29 Jan 2026 02:16:53 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm178642065e9.2.2026.01.29.02.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:16:53 -0800 (PST)
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
Subject: [PATCH RESEND 5/9] pinctrl: renesas: rzg2l: Add OEN support for RZ/G3L
Date: Thu, 29 Jan 2026 10:16:40 +0000
Message-ID: <03791e2cdc6b2da9a791b4a66b46b13d7c252bad.1769681553.git.biju.das.jz@bp.renesas.com>
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

Add support for configuring the ETH_MODE register on the RZ/G3L SoC to
enable output-enable control for specific pins. On this SoC, certain
pins such as P{B,E}1_ISO need to support switching between input and
output modes depending on the PHY interface mode (e.g., RMII vs RGMII).
This functionality maps to the 'output-enable' property in the device
tree and requires explicit control via the ETH_MODE register.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index cf7f9c2e37f8..5e3e56e32cea 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1198,6 +1198,23 @@ static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oe
 	return 0;
 }
 
+static int rzg3l_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
+{
+	u64 *pin_data = pctrl->desc.pins[_pin].drv_data;
+	u8 port, pin;
+
+	if (*pin_data & RZG2L_SINGLE_PIN)
+		return -EINVAL;
+
+	pin = RZG2L_PIN_ID_TO_PIN(_pin);
+	if (pin != pctrl->data->hwcfg->oen_max_pin)
+		return -EINVAL;
+
+	port = RZG2L_PIN_ID_TO_PORT(_pin);
+
+	return (port == pctrl->data->hwcfg->oen_max_port) ? 1 : 0;
+}
+
 static int rzg3s_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 {
 	u64 *pin_data = pctrl->desc.pins[_pin].drv_data;
-- 
2.43.0

