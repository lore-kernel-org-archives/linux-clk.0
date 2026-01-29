Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA31E3382F4
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 10:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769681816; cv=none; b=b4L9uFqHpQDB2ltALCM0AFOzatWJCEVaN7EQwuhbvWnUpDyMYx2rG3UcTclrlUTKuFo1dtlXKGP5pTmIVol3VG8m+tWmnTZgnorG7hKDOCZNmnMEkNudRvg8MoMP7Laib/MuLUFxFrwg/WOzqiFZe1TloJjEL4dh53d/H9hNThw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769681816; c=relaxed/simple;
	bh=5HXaWSiI3vXmlt7Hf8eg5mNctMjnuBFiMLGRDTMd4ZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+ttxLGvlG2dmO0zo/jqehV7yFF+rfgZOiLSuo+fvz/kQp0Ud4hvk+lPEndkpex+Gn71Kh0ytXSWMCsiEwX/Jp/tZT4iZlPwZ9e/sxn3Ob6cB5/5rAFdPM5keWWFe9uAxMta7/ZHq0ZBE+SJmV9+oL86bEqnjYjTzfj39mSn3l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gb4vb6Fn; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gb4vb6Fn"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so7394005e9.3
        for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 02:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769681812; x=1770286612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHcoX9dbLBVOvdJKUTZ5uf7S6EXVjOaeeDaRiom2PWQ=;
        b=gb4vb6FnoVGBDcVVQowirz1CAzZuZ0Bi1n/PHQMcbYdDFkPGavm7MX7k/GG/lRnzSU
         xLZZZNFJrlKUoqiztoloet/s8kSQLC5dE9Kev0SXq+bU18n83dSOFQwm5Fqk8exTguH2
         wxEI+GCgA3rjTo0Cvm2I08Y98bgDKS0AJ/AWGhFi+0QoL6FqL0vL+E1wgyR8zkESvzpV
         6OAWrbvKxrlLBFB8qg20qOMW2B/FLCVVGjeWhLTq2jre4toGF6yVQ7NIzOVGQsxRsJsl
         QidAe7yJ5dBkvU3Isb/Xtu+/YiFxE7iCAwFhszYh63Lxs0wISHJDI2/JIShdOmjcAVyo
         gAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681812; x=1770286612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AHcoX9dbLBVOvdJKUTZ5uf7S6EXVjOaeeDaRiom2PWQ=;
        b=X2yAl5sQcUZl1oqSOa80SS3bphxri33rAL8WrEwyDkS2S4jjFcUM9PHCniNpMMKGSc
         4mPCOQe8g1QUJ1xfIPrsPPLQ9w7I+MOoQdya6Y9v0h1pmJ98MQrznxbNLqFfGjEMoeXk
         MSX08Q+549ATiwCNrs1LpUigLjYfCY4Hq6587IDwVr75Hpz9bFC9UN105qzYdW0j6JCQ
         Pd6tIJx38b0T0aLhe5queiorHlwMiTxvhVqsTxf3O9RlWU/Erjx0qadSHpuDPjLKmge7
         GA3mt3+o6nkvpeWkPyZtVSGuSH2k6CaUD1z7zYFl4qWq3tttpofUv5clfB/9ZwzFPqaA
         sOOg==
X-Forwarded-Encrypted: i=1; AJvYcCVA+N5ND+zi457fEVxypsMVTjI7Dxg1o2wIAUrXnzHCwYEpq8XOD4/PcbVOrDoJ1r6QZLVHX6Sv7RQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKRNaeRHp83NjqkaFK2jCChKkhUj2CZ0TNCnNlm72H4RVfPm+m
	KZIiwtt5DpAC6i/h8EUtP/47Kr7ZX26vpU9sHc42k7tOjFTjG+nY1SbP
X-Gm-Gg: AZuq6aJjw3z3CvgTDAk9mRbMFddYNEW+AC0AvjMOH43VjF+Ald4XEob/MCTgaobagXL
	I5Tba6teG81Q8UVSE2e50mrDZEydb72VP/EEnk8MunYA6oaqtgIfrUqJPPE3uOBGDK6TUk11liW
	f98PAVnu3oBTne6TOt6URyU1NkGrQebRgCDMcbvnQ8KGbdZZjOKdq6p1v1KOZjIznePPPeII7H3
	BRjlg2sgjEXI6iy33Mcu3jmlIXIKvSxW8dUw9NU0vW1a5zeI6i9Y4Gsd20gqcCJ5wXc2F3DzeZf
	5/pgS1cwt2kphYJLnFn7RKo96EglUjjrbqm7bRztCbRXPl3AM9lovQayCqG0QxZg25I5ROwOkNN
	mel8o9XAxcMKVUJja2tByOSJDrSMlnFPTl08uRpBSwjSa9G2bSw5hQKIKj22rRsizN2MnFo4iAx
	W0w9s059d2Lwxvu8Ln
X-Received: by 2002:a05:600c:8211:b0:480:4c45:aff5 with SMTP id 5b1f17b1804b1-48069c755e6mr91235405e9.34.1769681811780;
        Thu, 29 Jan 2026 02:16:51 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm178642065e9.2.2026.01.29.02.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:16:51 -0800 (PST)
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
Subject: [PATCH RESEND 2/9] dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
Date: Thu, 29 Jan 2026 10:16:37 +0000
Message-ID: <a040f07000220605875775161b51f34bebed8a67.1769681553.git.biju.das.jz@bp.renesas.com>
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

Add documentation for the pin controller found on the Renesas RZ/G3L
(R9A08G046) SoC. The RZ/G3L PFC is similar to the RZ/G3S SoC but has
more pins.

Also add header file similar to RZ/G3E and RZ/V2H as it has alpha
numeric ports.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  1 +
 .../pinctrl/renesas,r9a08g046-pinctrl.h       | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index fbbba53cde9b..dc7f92c35eae 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -26,6 +26,7 @@ properties:
               - renesas,r9a07g043-pinctrl # RZ/G2UL{Type-1,Type-2} and RZ/Five
               - renesas,r9a07g044-pinctrl # RZ/G2{L,LC}
               - renesas,r9a08g045-pinctrl # RZ/G3S
+              - renesas,r9a08g046-pinctrl # RZ/G3L
               - renesas,r9a09g047-pinctrl # RZ/G3E
               - renesas,r9a09g056-pinctrl # RZ/V2N
               - renesas,r9a09g057-pinctrl # RZ/V2H(P)
diff --git a/include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h b/include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h
new file mode 100644
index 000000000000..660c26477d42
--- /dev/null
+++ b/include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides constants for Renesas RZ/G3L family pinctrl bindings.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ *
+ */
+
+#ifndef __DT_BINDINGS_PINCTRL_RENESAS_R9A08G046_PINCTRL_H__
+#define __DT_BINDINGS_PINCTRL_RENESAS_R9A08G046_PINCTRL_H__
+
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+/* RZG3L_Px = Offset address of PFC_P_mn  - 0x22 */
+#define RZG3L_P2	2
+#define RZG3L_P3	3
+#define RZG3L_P4	4
+#define RZG3L_P5	5
+#define RZG3L_P6	6
+#define RZG3L_P7	7
+#define RZG3L_P8	8
+#define RZG3L_PA	10
+#define RZG3L_PB	11
+#define RZG3L_PC	12
+#define RZG3L_PD	13
+#define RZG3L_PE	14
+#define RZG3L_PF	15
+#define RZG3L_PG	16
+#define RZG3L_PH	17
+#define RZG3L_PJ	19
+#define RZG3L_PK	20
+#define RZG3L_PL	21
+#define RZG3L_PM	22
+#define RZG3L_PS	28
+
+#define RZG3L_PORT_PINMUX(b, p, f)	RZG2L_PORT_PINMUX(RZG3L_P##b, p, f)
+#define RZG3L_GPIO(port, pin)		RZG2L_GPIO(RZG3L_P##port, pin)
+
+#endif /* __DT_BINDINGS_PINCTRL_RENESAS_R9A08G046_PINCTRL_H__ */
-- 
2.43.0

