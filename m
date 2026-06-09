Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D76C3FC5A8
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 10:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002776; cv=none; b=ULI0Zt/V3ekDg37NZwus8KwhsHgdRtiSYOTLMuJqoxW5E7Nq2Da7PmUJHQGjsKbOWu6NNd/vR0ttkeCyOIc/lcnCt8nnjG3cx/bnGhes4t+9lXV/YthRC4bjRGAKX+LaXqN5quehw1Qpf2sPqso05GyYaM+ckHS6tEoP6KG+Hp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002776; c=relaxed/simple;
	bh=ZvmNBM0dEycs0ZSV4pUzv9neHna2gcQfukCmjf+ujfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=US9Ij/hVmv2f9TLsyEN5H3Kax69CQRr4A2v7fFK9q0kWqkJuz5l7Av7MCfKG1/AEPIsamfZtTIk7jG4x2wCj3xcgjgVVrAhMEBAZq2hu6RjbhftNDxRZmByB0DpwrpoacUlSAsjATWOT9NPMI10TsnQDW0z/fN0n8Oj/N9K9ImE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDlkAepP; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDlkAepP"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso44553245e9.1
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 03:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781002774; x=1781607574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlQ7E/EZea6BzD4lH08QBVmk0H9Rm37lQbjREjZTGMs=;
        b=JDlkAepPL6igXebSuZNnSCed6C97w9eP9LvgJm4sRlpSaLy8A8Cult3HhCTSc8lpAM
         NO6zZHYtz58v0YuwKqYHUI5TuGZ5sRNw7wrZNyreeva/rAAbibeUq+SFSal5wPvW5980
         +t9uUgsj/vhQ/vq5EIcGtKTME7eB8Vq+R18pLiUlBe74wGRGfEz0L4YjwM2GtBIsNQAf
         OaxzdfIvYC+148CdKlycwDDRiYwzR8S/kwhgEFI7oT4mMyi2qQw4zpeTWQpod0Opmcr4
         lFiU5LuFTxWjIO/jz6+AMhXXErCKvQLlFNhjM8S1AWqvET/I0sQBH6M2GFtk2YN1nNJg
         AnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002774; x=1781607574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZlQ7E/EZea6BzD4lH08QBVmk0H9Rm37lQbjREjZTGMs=;
        b=oYIwPZ7c2b4a/3dTlCQnHFSlXI631VsTZ8qV7ZogZ+jRLPFBLS9nhL84o7Bbe6ZhcP
         8ACRJ5TVk24+DAXOaYTQcZtsD+Ij4OrbbEu1XbF3CXMAgAi4HTZCIXkrS5LBTf2RWX3Y
         A7aFNU+J3ocLk/pESF7ThwcnVyw+GeBZtRfJVMcFBTr326zuvXFxCPSlPDC3max003Vy
         SiZI/f3Ug5l+x6iPtLUK4u7I7GdzCt4ztr+URjiRwZiEXpeW+ZWgovktHcL265MPp78F
         xVaoC/nCgZWnKkFBS1n9p2O5x8aHOSiMqxjdTgpDxmfRYhajBioXcRp8Wgt1Ow83x+Gu
         XGpQ==
X-Forwarded-Encrypted: i=1; AFNElJ+zr7B600ihda8MgliMVtHHzt1cJQyvn1kVPbtIVnrgeRuqBDY5BUKfVHeZsbEstZPdRZtXodfouvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI7PICLjeE/w7kvkZfnAMiakrr3sgDBoFR0VsBYyBixzrZXTzz
	UsbOGxhfioPlwTXKYDEqfGHTmTY97gPtzadImnF/NOA2U1seo7mUWK8SRSdAbmF0
X-Gm-Gg: Acq92OHfqDa1z/8Tk92lgEz/3SRqi7SWvDFeS4MEYqMCXGteJ7iaR4VD3equalZUaU7
	Co3M63qfZCtMIYNKukyHsf5Dxxcv7gENihQkm4nuozSGBFof6/3v4kJril07HWUIZZ8UenpAgjv
	2DGKRXJuaJl94K+DFLpgh97b/ExitRMti27enFOBCDBst3vEYrw1QRSWXzvMtcB+EIwJTUE38Dp
	Xkcy8Jrx9lehRo0jQ4EhK7q9w/YEF9Re0yekeHOXzpsNxA8TzVEqJ+Qth8VL9ZzdqfZ4A4A4iU0
	MSabTH0qVuUulT6f624D6FQAsD95Zi7869X9sL2d+z24G8AO1hHn0g6NpKu3+WrdBlGshqKegD9
	p5rpfMCC7V96frDFyzVMiSglaGfl0r5Vk/kzdJhQ8SrHqj5vt5Zi9QicpvSawXW+VaXDhrUVmHx
	nl7GerHoHloVJYp9vcmPeqbB//u9Gcfa4d7CgrTabxANIqgUaQuLn9DukdoEejPpl7ZhOvi76aw
	HN6p8PY85hwVpzhxsmOnSE/qcgUsa9HVc3UxHZE8TcKECI39mVcL3wnkQ==
X-Received: by 2002:a05:600c:4e4b:b0:490:bfda:7d7e with SMTP id 5b1f17b1804b1-490c258999amr335438365e9.3.1781002773647;
        Tue, 09 Jun 2026 03:59:33 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:2b2d:6009:3bbe:fb84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d663csm524250635e9.11.2026.06.09.03.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:59:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 3/5] dt-bindings: clock: renesas,r9a09g077/87: Add LCDC_CLKD clock ID
Date: Tue,  9 Jun 2026 11:59:22 +0100
Message-ID: <20260609105924.962573-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609105924.962573-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260609105924.962573-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the LCDC clockd (LCDC_CLKD) definition for the Renesas RZ/T2H
(R9A09G077) and RZ/N2H (R9A09G087) SoCs. LCDC_CLKD is used as the
operating clock for LCDC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
- Added Acked-by and Reviewed-by tags.
---
 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 1 +
 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
index c4863e444458..f6cb8d649a46 100644
--- a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -34,5 +34,6 @@
 #define R9A09G077_XSPI_CLK0		22
 #define R9A09G077_XSPI_CLK1		23
 #define R9A09G077_PCLKCAN		24
+#define R9A09G077_LCDC_CLKD		25
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
diff --git a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
index 0d53f1e65077..312e563b322e 100644
--- a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
@@ -34,5 +34,6 @@
 #define R9A09G087_XSPI_CLK0		22
 #define R9A09G087_XSPI_CLK1		23
 #define R9A09G087_PCLKCAN		24
+#define R9A09G087_LCDC_CLKD		25
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__ */
-- 
2.54.0

