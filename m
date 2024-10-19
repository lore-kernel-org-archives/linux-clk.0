Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978811DF990
	for <linux-clk@vger.kernel.org>; Sat, 19 Oct 2024 08:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729327682; cv=none; b=oref1R0bV56A62MPGbxSH8XIvOuVsQg3wCZQuddhOZwF2Oc2U+rYJfAau6RnEOVYNW+IA2VFSVF7OpJvqM+4hnKKQeEvg+agqRzwiduDgH2W63Qv6ZECRr6MXL09B7cry6HZ9YD23VHqFMSWAmkWgdWRBMVfZBuOKvUemTtWf/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729327682; c=relaxed/simple;
	bh=XndoBq5icUuaC8n8ZicrSOnKmXky+TlQYLIR6YpqpX0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nd/szHy8WMHwiyBMOnFpxlSx2TeSDbzAxamzYeFHQFZaeZOuX25b/NlHvSpCyOhOP3B0rCY+mEQvBoFPjqOoQdItb892kHfMBiXu5xrXVL7yUsjhk9zvEAR/tx4ja6+J92P7LaHgJbBu3Y37O3EDHXflLnZ0BkLkNx7jTmVZMMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=iujPUGGU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="iujPUGGU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso1648795e9.3
        for <linux-clk@vger.kernel.org>; Sat, 19 Oct 2024 01:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1729327677; x=1729932477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTnY3HFe3FG1IX/LwF/xVA4nLpmRTEI1DSu1u/YXNZg=;
        b=iujPUGGUOLBWt9ggqyfVXkgp2hpFL5Dohgn750K39W/MRbLjl8luZtJlA2VH0282Xm
         LsVYovd/XxTkgCqhOKTrCRyI3TMRu3EAbs3RvW+UsTUMFQJiwTyO6cuyAUESDuiVHPmd
         lgex6D174+PXWGLWNfzV5T1ng+y0mWCIcTLlhnvJG0XECDjPFyYhNSDG4Ke8t3eJzFzR
         +X+NT/NCU6rimOMmlc8aS2ZrxI0ozMoBaX2FO3jt9GdG7f27ZitJ2sXPTxyiEpCT4dEU
         u1F81WYX3HBBJgNCGH7VyE+frn2O/wtaavOxS9PT+RT/42+W6HfEBSxTc98FIMnMSDS6
         HKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729327677; x=1729932477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTnY3HFe3FG1IX/LwF/xVA4nLpmRTEI1DSu1u/YXNZg=;
        b=TypsOVxMqRVovjtefYANue3bfKC5Cz154Aedyc1w9YxFkMsBpZDwpxN7055SiH019y
         wR9wwL9bQUd1HIhWZ1mJQ9jtQdO+nDJiiFyKh0fJzMIjiaLY86cFA+VZzYPqwdQ3nw/N
         6wzxHPdUMijJ08B1wIoRYWsxNICqNpEiVhxVaUMwWageRgyB5LdQUiadarSDra9rpo4T
         xNpK24OD+pE61oFfSH2dnkDgHbjFuFtk1QIRIsYkHgaGh0msqfURt7IvvEJIr6iViW5H
         JIEkLhI1KH87sJ+NUOxStOJW/glXBEkye1LhRJ5IUhV3UGBbkRf457ijW8xBsU3BYWpG
         LQQg==
X-Forwarded-Encrypted: i=1; AJvYcCU1rd747tIKSqanh1a3w5Ly4IVT1EsU3B9NQgSWFPiUnDzzM5HAF1EGJ1A+p3WSGL5l0Rggen4fzRo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPFKc95KPu2tZJX6zUT89n3TW4A319ATAnTksLhc/daJkFH3oB
	dxP2DDp17VtErOXTR03vA0QFLSzqUHnintE3nzAj8OLRhjmKkMfU9056c4a2aFk=
X-Google-Smtp-Source: AGHT+IGAvO1pmQAmOC6yOToJlDv9V+XBj+EVZgmE7PFNWYwWoyfUq798Pdrt/ucX3N/Ul+zEkzbslg==
X-Received: by 2002:a05:600c:3d9b:b0:431:6060:8b16 with SMTP id 5b1f17b1804b1-431616a37femr41678615e9.30.1729327676716;
        Sat, 19 Oct 2024 01:47:56 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0eccbasm3898731f8f.81.2024.10.19.01.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 01:47:55 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 04/12] clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
Date: Sat, 19 Oct 2024 11:47:30 +0300
Message-Id: <20241019084738.3370489-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add devm_clk_hw_register_gate_parent_hw() macro to allow registering
devres managed gate clocks providing struct clk_hw object as parent.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- none; this patch is new

 include/linux/clk-provider.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 4a537260f655..824b62059364 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -608,6 +608,24 @@ struct clk *clk_register_gate(struct device *dev, const char *name,
 	__devm_clk_hw_register_gate((dev), NULL, (name), (parent_name), NULL, \
 			       NULL, (flags), (reg), (bit_idx),		      \
 			       (clk_gate_flags), (lock))
+/**
+ * devm_clk_hw_register_gate_parent_hw - register a gate clock with the clock
+ * framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_hw: pointer to parent clk
+ * @flags: framework-specific flags for this clock
+ * @reg: register address to control gating of this clock
+ * @bit_idx: which bit in the register controls gating of this clock
+ * @clk_gate_flags: gate-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define devm_clk_hw_register_gate_parent_hw(dev, name, parent_hw, flags,      \
+					    reg, bit_idx, clk_gate_flags,     \
+					    lock)			      \
+	__devm_clk_hw_register_gate((dev), NULL, (name), NULL, (parent_hw),   \
+				    NULL, (flags), (reg), (bit_idx),	      \
+				    (clk_gate_flags), (lock))
 /**
  * devm_clk_hw_register_gate_parent_data - register a gate clock with the
  * clock framework
-- 
2.39.2

