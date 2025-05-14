Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423492253E9
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 09:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213469; cv=none; b=jlKY0Pmu9p+gR2ffa3EI+Ul4owDRJZUlC9gMx1w7n/NsdxZBEjjxMKFHFV9ogVepmDAY6u3DcCQR4gqkCEiQ13N+RG3T77V5I9DqcHZEUSnUduHUrILnrOJXg2l65RsVXW+VJRcE6V/n4V/zqO8RiOCWg3jecpZV4/4+3435ozY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213469; c=relaxed/simple;
	bh=z+fJpQEL5tFLNSD56mZ7hzkqnnnTts2E8ZIBSo41csY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C7ecC6b+DdBnu6Dc+jg9C/ohDL3PnTlDtH4UIrmhUhnpcUB9X/hR+skYAABQR36PoMgmFrZBz4ImdmJXGZNWoKrGFUGEk0BBwQSBbm65ltYq590/q3v7w1+cfv0qO/hFb5BiVbWg+PoiEwyTpcccbD5Borpf19xur2IVlvfqojk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Iz2+4r4E; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Iz2+4r4E"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a0ac853894so5729010f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 02:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747213465; x=1747818265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0z4P+OmufwJtvHe7VRG9Qw6SM4vHtxH+ac7R9RSX0Wc=;
        b=Iz2+4r4Eu5V/lFqPnHj4frmkf/324unyRDZJJaUygSEgSf2AOhtmGF0WsEkriLFWqk
         kJMDOMO1beyR4oZOMhDHdH30r6GRzJcdnXlvfy5pGSsXOMPXM172ThBUg6wnNlw78EgC
         7UqvrCoJ+aTwAgkh65S0xVH2pSH8DftaiCnJmKeu41pSd1y970jDd6bTh34hHmB/sHoa
         2EKTzeA57MfSqFwH9rk2UOkFPlAhBadcGYk2vBSyuT9c6LJ+us1VjybBI2oPa89EfMhh
         3kbN9CRQPvMrLuMjG/+D+VVnIfMMe7r4hR9D4AvmbGYyBXjzNqf9oVJ9rrcr7AFyBVE8
         9uFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747213465; x=1747818265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0z4P+OmufwJtvHe7VRG9Qw6SM4vHtxH+ac7R9RSX0Wc=;
        b=uWxzgob9QNdN/m0N0ZGvj+EUsXoyvr0xFzEqsYS3F4Ep5lMr9+SUK5u/pz7rmrBMbN
         YiErir2lYpBB0OxQ3aWvBmFna/RaAWBwZttgkPEL3BarBupHh5EFCNmEaHfsdDuhAZXt
         WvQG9+oPRzPSBPqSDzXUUuHpv5n38LOqHUPscDeyY7XZJdjwsn/qPOuL82P5rScTIGoa
         Mz04xmbpwCqQ+FOB1Jq5TVGl1h7xZCLcvHPPhUkNvH2dTVK1PHZctp0MGciMvux9Yayk
         kzP/TPYKu/qifedQ6A/0xTUCA8alivXfYYkKzVLyk6j77ybHN0RatrI6dUinSXEhNDad
         8q6g==
X-Forwarded-Encrypted: i=1; AJvYcCX4Ulot5U7yB+6HO6/NzjKHk7+TY5qTEqXrnBEYMA9c6e8vw6bBjUJnHusWIFMYXvGyPxEOBCR+/sM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc7P7U7hXX7qFuN7Rr1K3UonkWG0elV7Fk4QHnpphIkrrUfmvg
	78dmavwj8XvphCea6gStv6RezxkFLtTymb7TxxUkd8SMo86lEnB+V5ka0H8wu/k=
X-Gm-Gg: ASbGnctm/eRR+IdlRKdBvcuS4gOW5gsF7Q1XGvZ/a+rO/EgpJny7+TH4F/zajyy3YdD
	4pbkEXoDSrltJL/Zj/RXYiiE1J7+Z7SeomaQFU5JZyZExA4/4/AWQB2gSSRAjBERtqbcxhRcsid
	wDLVo3VDwWZy0d1vcP3lD9zC3Ger+JJIjzczuQVyNa7/K9khYaoLPNARu51cp8yXKKihw8na0lw
	Y/AmVXhibQnKA1M8DU5/edz/tcqnvQP3b50gMxDRnq18GZh8lxll2928/HYI6vTmRxC7KG2H0GI
	J+RO38KHfaq56frxn6kyzQulwrzlRd3rPokLC89r2K6MtyghbhAmxVavVFdBmRWItHHXod2HirY
	x8lKg
X-Google-Smtp-Source: AGHT+IH/xnJf8OhD2UyddPs9fn8NZYZRYKnhkQGnPGNMx5KbE3arsLz1J4F7/4sXv5p5DqIDl26u5w==
X-Received: by 2002:a05:6000:381:b0:3a2:229:2a4d with SMTP id ffacd0b85a97d-3a3496a49fdmr1851225f8f.22.1747213464674;
        Wed, 14 May 2025 02:04:24 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfbesm19286561f8f.10.2025.05.14.02.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 02:04:24 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 2/8] clk: renesas: rzg2l-cpg: Move pointers after hw member
Date: Wed, 14 May 2025 12:04:09 +0300
Message-ID: <20250514090415.4098534-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reorder the pointer members in struct mstp_clock so they appear immediately
after the hw member. This helps avoid potential padding and eliminates the
need for any calculations in the to_mod_clock() macro. As struct clk_hw
currently contains only pointers, placing it first also avoids padding.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- moved pointers after hw member
- updated the patch title and description to reflect the new approach
- collected tags

 drivers/clk/renesas/rzg2l-cpg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index c87ad5a972b7..767da288b0f7 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1185,19 +1185,19 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
  * struct mstp_clock - MSTP gating clock
  *
  * @hw: handle between common and hardware-specific interfaces
+ * @priv: CPG/MSTP private data
+ * @sibling: pointer to the other coupled clock
  * @off: register offset
  * @bit: ON/MON bit
  * @enabled: soft state of the clock, if it is coupled with another clock
- * @priv: CPG/MSTP private data
- * @sibling: pointer to the other coupled clock
  */
 struct mstp_clock {
 	struct clk_hw hw;
+	struct rzg2l_cpg_priv *priv;
+	struct mstp_clock *sibling;
 	u16 off;
 	u8 bit;
 	bool enabled;
-	struct rzg2l_cpg_priv *priv;
-	struct mstp_clock *sibling;
 };
 
 #define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
-- 
2.43.0

