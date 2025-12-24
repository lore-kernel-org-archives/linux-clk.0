Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9832A2F6920
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 16:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766595064; cv=none; b=Gu5WqU0n/q++8TR32Y4GrZKtyBLpoZH2P9Fn3sZhU6ru2rF9j1fKQ5pB87DFeIKvmLS8wzTOjInln07GsJ8hMpNFDZgP/F2DnWVK9ikwlu/gIfDUMg9YVqgHHwZACCseXtUk+Ir5zf/OFIaX9BMFzDZwBJMQh1iym1GIWUiQY24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766595064; c=relaxed/simple;
	bh=ZrXxCTjXWGjjOG+8aqV+Y+mwv9ykkEgiYPHQ1T3uTpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F2WAJRp4njTDaiIr9tgxJu4soM78wkRhe4HF8oXHNwBnl4LGKB7oLrzAplYAaAmKoMMgeLd4ifBCp15ccoVnQm6MvCvaWxxiJIaAC7bjbumUtB/hiiHrIVVAA5GraE95ueXfpk8OGKnaPMwqFaNmRbHbLeH8q17AAcbQTUO6vMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGXgyYw/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGXgyYw/"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso34150535e9.1
        for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 08:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766595060; x=1767199860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTmPuQNTTXZsqXP+8u86ygN51TXOteMoSzOM42GP7ag=;
        b=eGXgyYw/QssfvvTYTyeEw8SSzsiv4VbWJGZxfvAxGhXIsnB67zAuGKX6KbR8sOP3KV
         5pZxP5BDlDAeaEZ/8n2ECM0p3lUxUy7PpirB+ZEy+CfKOLLojyD/2Efcn7TFOpaUOIKb
         lCacb7WrPdut2si9tICrmooV8V+l06DKFQPOyPIlwlFaeEDgGZ4FpyzF4nPx6pL9qwyN
         cuX9tlUeCWEqow+jfNywrBTCvWwr1HiDUStLrR0jMgQ/lyNbggA9RDMHIVur3NpsEKq8
         EdDP9QqRRV+5xHx7Gj8Bt3YevpdmJxgyz/IwiWWYDTvF5EX45oUqaidJ0p9FWiGJZT2D
         pq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766595060; x=1767199860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KTmPuQNTTXZsqXP+8u86ygN51TXOteMoSzOM42GP7ag=;
        b=j2ZeCHGDBcetfNG6N8ry9Gi3FMbpoMd5yy+y45dpyVybNwpHlGGppogKnvxjANDbz7
         H/jwN0i5tiCp5hYnJLaELR+VZcPhSTkrWvHp4azcEOpuxtUhucK3R+ixpXWlf9N+u/ML
         kOgLFdrXrwMIRQZ47NeWiYlig//s2BLCTXWkwMa8qjK7tID31FiiwAoJqrffdd+Bonn9
         zDQhDQVLhIk1ZbX/BTvOaba7lvCW+pdCdPjqvxzRk7/JiQt7jRpioQpYmaiwu9wDO+so
         nlC+FoGk/JgDQRxDVN+CcH8ntipiHqts6XtCfXWo6yDsJ86JAhbEJGNTSGzFe6EqbxYR
         qCVg==
X-Forwarded-Encrypted: i=1; AJvYcCVys9GmbFBbM6RGaYQvbRGe5F41x31n4MygauwnvQbAYaWY5KdDKi4RQcXAe5Zu62YWZupwbNZqqig=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu1p8+BLvmp3poHu8DJLltaxwSuAP1PPlzmgNS2vKjxp8FNVYD
	fIJaO2c1U94R9DFiZqD993e97RK9udGuCnQ37Rv5JM7WZJpXJqZbnntQ
X-Gm-Gg: AY/fxX5Kuw1C2vrCsZGRPSiO0XHIrcsIimkveaoFiN+i1BE9P0ejWysw79VIg0awdj2
	EIC3oaji1XE/5C4GtnuK9gClSYRBORZvRv/Xcq51OVDyg2MBWq56dbHRzPs56hmmaeBmg/LM7OF
	xHbloyTwQh0uDeKSRpTd4AONYDYcLf+if8fS+7uwgOF6FEBVgnvY8GNjBaeSIsUJxzFmq8LQU7w
	WKfH39fYVTew+jJCe5ydt5p/Ds6I2G+rmVdswu3QXD6bxze0Fy0gpYaqBZshpjHouIFEjUq3rOw
	I3PZZ+xoFks6yqjswgF/Qj00YprT4pumyU6+KCeRJ5snS/y+ZQ+1UkhzXuCcg2cSV1tprfcTbqJ
	XENMPRF9aqmNt1ddKcsg565L8vydGhtR0Va8Fcnvg0nlIrRTIkGLdtrFS+nRNNkbE2q0OymyEwS
	U4ioWscgvi/QdUyGjue2ddTtBQuaqOaUKrWK/btM4B6suPrh8rZxxIP/2GX0myuNhynL+FyL8bY
	S7O2IyzkyepYupzGGN6gPY1
X-Google-Smtp-Source: AGHT+IEHoaqx50xdluKo6iOyYLijbIpNgJk6AMJ4ejz02SDIzXXq58fP4NiJQLWVqEs20tcyZW/NVw==
X-Received: by 2002:a05:600c:c093:b0:471:5c0:94fc with SMTP id 5b1f17b1804b1-47d1cecac53mr149793425e9.6.1766595059883;
        Wed, 24 Dec 2025 08:50:59 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:3371:7b65:aaf4:d2e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3ac5409sm136482305e9.15.2025.12.24.08.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 08:50:59 -0800 (PST)
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
Subject: [PATCH 1/4] dt-bindings: clock: renesas,r9a09g077/87: Add PCLKCAN ID
Date: Wed, 24 Dec 2025 16:50:46 +0000
Message-ID: <20251224165049.3384870-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224165049.3384870-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251224165049.3384870-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add PCLKCAN ID for CANFD to both R9A09G077 and R9A09G087 SoCs. This
definition is required for describing CANFD device in DT.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 1 +
 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
index 9eaedca6a616..c4863e444458 100644
--- a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -33,5 +33,6 @@
 #define R9A09G077_ETCLKE		21
 #define R9A09G077_XSPI_CLK0		22
 #define R9A09G077_XSPI_CLK1		23
+#define R9A09G077_PCLKCAN		24
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
diff --git a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
index 606468ac49a4..0d53f1e65077 100644
--- a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
@@ -33,5 +33,6 @@
 #define R9A09G087_ETCLKE		21
 #define R9A09G087_XSPI_CLK0		22
 #define R9A09G087_XSPI_CLK1		23
+#define R9A09G087_PCLKCAN		24
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__ */
-- 
2.52.0

