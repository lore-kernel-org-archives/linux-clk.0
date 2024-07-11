Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E705515E5CD
	for <linux-clk@vger.kernel.org>; Thu, 11 Jul 2024 12:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720701257; cv=none; b=MCqZo4DGFfiJjeeRUtLjUufbFBoZc76fLwBn0DiJ4b61hn9aabhcV7mOGejQ+XjOIjT+JVkDAFIj0GRoS2wKU33iC+zobRE9uc89HEQOkw/IPW22gg0xWf92HUm8oCh2DqAMNfZWCVzhHxFn6rrTf4Fo5lrapO8uMV/VarNLIsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720701257; c=relaxed/simple;
	bh=anyTZDR8z5WRrk92lV1AqqFVw3vzwnayWuwr06UEE/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FzKvC37HDTCMAUP7Wys8lj0ghvVtOuXmLstaqgsc4jHUZI4Jv3pVGPZ0K92CTHjr5HjpN7uonp1iU3Y32x6K4j/GwAIcjq0OroE9kNMyE0EJArRNKMN+5dcQpswb8pLBRS4zqx7Ez1/08MbwHNGgltdKet5PvuAVmbCYOPwxBw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=N9Z/wi9f; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="N9Z/wi9f"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ee77db6f97so13742491fa.2
        for <linux-clk@vger.kernel.org>; Thu, 11 Jul 2024 05:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720701253; x=1721306053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRm9MV2QsUuuDK1Fw5/6bS0CUgxR45/yetEFUEnJL8w=;
        b=N9Z/wi9frPDUvPTG9PsRi7UpNbA0022OOJcO2YzVzsVoSusRbd8DJDve2m0ZEsPjYs
         g9bN2qKrau6F07j4BJg4bgrREQ7LCrIiQta2Z1gS6kI81VrUx3W4Nb6Bnd9ldg+oBLQP
         PB/UV77EUIkbGuHdwpRREHPnZ4EuWQeL0FS/0gafEZnYgb73M1dvqGSfDw9lKMoyRDxm
         /y2QS97cXa3cY4dr2rjplJ1sxV7DIgjD/g01gs6NUE+KJA9i2VbOe3W/SSumvByuTlV+
         c5yzEHJDPWwQ5fVkwi+pMY2zJIbWfVN/ryx4ihJdoDY8bCiJeB8OH2Fp9m2r/5dC/tSR
         eflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720701253; x=1721306053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRm9MV2QsUuuDK1Fw5/6bS0CUgxR45/yetEFUEnJL8w=;
        b=nV6hniNhXg2+ho2zwmiCqcykv1uvQCwUCkzpHLYkU29L9J72k8JZuHW/CjvNb3iqO7
         3doxQAGgzdu8ae+DLpW2ZaAwSdV73f6YRlcIeMs7VljgQt3qQilgczPcmM+caTH1OcHI
         0Sqi0ZYQXONXh0owKSdnDYV12x1ZaZFEAL055OisKZ6BOh9fJPSMPIlajMGes/cOnSEo
         1FvJFwOFmVp4CQ+dsCBOt2pASlAoX/BocHviNNEkL/3jw2C2Gte1NvSqgiMjlW8up6hr
         e4osOQWs7f/2LndrY+Yj8abpTt/ScTsR35hpQGBgOcYqZ/A/obgjuBD6pUm1IWQV8QZD
         SXNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9dqtnzk9OH8o+L4cZSGDWw9SiiyoB+l1VMQUSRBgjlxu4z5KwwDYo98Ajr3pOkn74p5Wsm+YGHn/+1W7CIzhgIOOxkOcHJgU2
X-Gm-Message-State: AOJu0YwF4/7FHzgepWd5xoZyyYUgo9d3XMQ5MOeAK8WGMCURyc+T7FsN
	eLDxGBVzIWwI6U4uQrCLLA6l57vugwopfseWAD05hUzO0Tk7cBPEK55T0URpuwUfxIFe0u1wttw
	Z
X-Google-Smtp-Source: AGHT+IHlStw8pkUI0m/gKpxbqlO3SjmTUiBXCsceti/P1YsQWpbFVQ75dwQXkOgOjQaJi/XIXvVCsw==
X-Received: by 2002:a2e:9695:0:b0:2ee:8817:422d with SMTP id 38308e7fff4ca-2eeb30bae90mr68233611fa.5.1720701252954;
        Thu, 11 Jul 2024 05:34:12 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f741fa6sm118583955e9.45.2024.07.11.05.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 05:34:12 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	biju.das.jz@bp.renesas.com
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 2/3] dt-bindings: dma: rz-dmac: Document RZ/G3S SoC
Date: Thu, 11 Jul 2024 15:34:04 +0300
Message-Id: <20240711123405.2966302-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711123405.2966302-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240711123405.2966302-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document the Renesas RZ/G3S DMAC block. This is identical to the one found
on the RZ/G2L SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml b/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
index a42b6a26a6d3..ca24cf48769f 100644
--- a/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
@@ -19,6 +19,7 @@ properties:
           - renesas,r9a07g043-dmac # RZ/G2UL and RZ/Five
           - renesas,r9a07g044-dmac # RZ/G2{L,LC}
           - renesas,r9a07g054-dmac # RZ/V2L
+          - renesas,r9a08g045-dmac # RZ/G3S
       - const: renesas,rz-dmac
 
   reg:
-- 
2.39.2

