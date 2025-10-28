Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56E828642B
	for <linux-clk@vger.kernel.org>; Tue, 28 Oct 2025 16:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670328; cv=none; b=cAstlAhxIf4JBsOPV/E0QEPE3Otz1izkjjgn7ojNxERjdOpczhgq5cnhOVSymNNb63GQVtucTcfVE0HIMdjc3j54YJ4Tmdpq8g1hgD44TlWB2UkXowxA4XTW1M+sxBeYqB+uFNy45OaHEjFRhX1b9agvhTCJKrSpQFFKLaZP3X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670328; c=relaxed/simple;
	bh=uAi2FHcWsJ3GX+mStHxzc2rrz7IQpZYtqIP74XffftE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i48BQKBXeXm5hev29J9syGUeGYxLqaAeXo2GHgrWMBOgVq7IxTmHByx3VeAF2aOuMWmlwPmhEIH6JMiq7bhOvvIl6oZNkM4QFuTqQ4TDEGjyB81NyvNn8l2aQvNxn1aQMd+CzwwNe/t/RLC9MWY9AuM/U75OlpwVxm4sKDIppA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBDswHIi; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBDswHIi"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7a226a0798cso5168854b3a.2
        for <linux-clk@vger.kernel.org>; Tue, 28 Oct 2025 09:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761670325; x=1762275125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozhuagEONZfNxkbetsUDydMVsoqSUlAvk99bJ1oqkyE=;
        b=VBDswHIikAYS2q0DgNT6jElJeM8Tn4FQ7TG5FDNH5dlPJSmbWYSFpH+8UzamC+Grwa
         7zECYJ6zkBJ5LL7jKlSo5sSMtHNuZ9YBWMa+IycOp9PX/ye9nig7879/XMRyii81g2e8
         Z+ujwtzreE3lvFkPAyeTdgpELJ1RmsG0O9quDHapWU44hV8/rYLKmtEOT2W8c7DxE1W2
         MiD7VqliDv+qqrkTQCYQP8oGjJHElrxEqAqMwJ7a1UMBLnhUMYY1KDDAYLygJhU6Tark
         j5tLzCQhMReRF3B7Ic5WWJ5+dzYX+XUMyONO8bw/OJ2iwHknj4fz2RxBg+0co99nzPRR
         Z99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670325; x=1762275125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ozhuagEONZfNxkbetsUDydMVsoqSUlAvk99bJ1oqkyE=;
        b=gIODJEzKi3SqAboSkDO+O1nekqqKG2D9GIN6Bxnr94nuS7bFJdkDnFsOxJtU5lqD2G
         CcqzaVVTSNYfG2VVP6mKMri8povLthfnUIGgtxMklPlBXX5G8WCLiF0IJsnZoB7b3G/+
         plvVfdx/zsfbR9sl9aBdLVFsYYAo3Zp48/vr8rgf7KLf8uvvvmiwVYTMAHDxSyfye9yk
         LrRFNw795c/teGDaC31NHEgJ9RaTfCtUl+LfiEQJDOwKIThB7N+Bx4HCIvIj9e2QgAkT
         XvwibdYEKg1ssTaOacr/3zMCUai5gHCGY9AyFoN/f5Ya9Bh+NncIyteomme3YPu+U66/
         2edg==
X-Forwarded-Encrypted: i=1; AJvYcCV0oorkchdADdFQufMz5fr8oOe22KMJYBsWyw9YWhxgTvJsIAZTVMWm1rYKZrw3WS81nOZikCC5gPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyWguTkfxGmhdvDGXZE/sjgowQW9Z4aG+xn1FfSY2apGLVPYbE
	jjGYwEdBCMyIH/Qxpgn4uVlqIMZH0/BwHbkArPdu+k7lnRo1opjyCi6F
X-Gm-Gg: ASbGncs5AqK1cdYwG+5WQNAZiJrLWk6D7NnkuWFte7KcrAXB5yoR/rTfxHpoh9X3BI0
	fkcj7tXOyO2Q1UBMOpwdHTGQ1uY5KxjCpM6XXMyUujLjOWfUBS95b7zuM6/VPwT5TdsAafDn8Nh
	jnY3/zJGBMUyo7A3hi87JhbBJ7EZ061vSri4XLasHU+6XTYURUXFkb9xka90Vp7n1/mv+8QquWR
	nPTbZtYGH5+bq+XlNoejUnlcjNaiiZG+u8FUkvrALJNQCQcAIt6qVhiMwMzAMV2rd/QKYDuaQyk
	wDR+mQxsI4lcit3+6dpsZpqHQ0p5zPnU6AzVsbeI5mBZKORoLAoDGFSeoEeR/Hhl3zlPNSbg8Sh
	nuETstRRCG4zkvrvwKOCgrmyVddplQpUnDJi3REustMrKLAeErL9tusWfFBs9ir+7klVpVyHTt4
	3yPBB1cBjgoPj5b1gCSEQxNA==
X-Google-Smtp-Source: AGHT+IH8qFlYrrL24sCRWgUP6EN5lsSkXhcAlMQevGU1F8wGdL4QnVY/o2LpJYNhO1zLzXrVH+kFBQ==
X-Received: by 2002:a17:902:d2c1:b0:292:dca8:c140 with SMTP id d9443c01a7336-294cb6739b3mr50494845ad.44.1761670324753;
        Tue, 28 Oct 2025 09:52:04 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:77f0:168f:479e:bf92:ce93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498f0be0esm122123665ad.96.2025.10.28.09.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 09:52:04 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/5] clk: renesas: r9a09g077: Use devm_ helpers for divider clock registration
Date: Tue, 28 Oct 2025 16:51:25 +0000
Message-ID: <20251028165127.991351-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Convert the divider clock registration in the R9A09G077 CPG driver to use
device-managed (devm_) helper functions.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1-v2:
- New patch
---
 drivers/clk/renesas/r9a09g077-cpg.c | 30 +++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 666fc16b9a81..b46167d42084 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -220,21 +220,23 @@ r9a09g077_cpg_div_clk_register(struct device *dev,
 	parent_name = __clk_get_name(parent);
 
 	if (core->dtable)
-		clk_hw = clk_hw_register_divider_table(dev, core->name,
-						       parent_name, CLK_SET_RATE_PARENT,
-						       addr,
-						       GET_SHIFT(core->conf),
-						       GET_WIDTH(core->conf),
-						       core->flag,
-						       core->dtable,
-						       &pub->rmw_lock);
+		clk_hw = devm_clk_hw_register_divider_table(dev, core->name,
+							    parent_name,
+							    CLK_SET_RATE_PARENT,
+							    addr,
+							    GET_SHIFT(core->conf),
+							    GET_WIDTH(core->conf),
+							    core->flag,
+							    core->dtable,
+							    &pub->rmw_lock);
 	else
-		clk_hw = clk_hw_register_divider(dev, core->name,
-						 parent_name, CLK_SET_RATE_PARENT,
-						 addr,
-						 GET_SHIFT(core->conf),
-						 GET_WIDTH(core->conf),
-						 core->flag, &pub->rmw_lock);
+		clk_hw = devm_clk_hw_register_divider(dev, core->name,
+						      parent_name,
+						      CLK_SET_RATE_PARENT,
+						      addr,
+						      GET_SHIFT(core->conf),
+						      GET_WIDTH(core->conf),
+						      core->flag, &pub->rmw_lock);
 
 	if (IS_ERR(clk_hw))
 		return ERR_CAST(clk_hw);
-- 
2.43.0

