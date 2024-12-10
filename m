Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4250D23F9E1
	for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 17:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850650; cv=none; b=dVIpbn7ghmAX1t/4spNohIVzNGp8DLCQH+goVb6WUtM819JaLN+UmKcGmWL/MyjF/O718XcM43V75OIwzb0p507q0AGx7WBVQHzQQ1GHKJjR4Ct+s5gm7pmpoSEKvIjKA3R2QOXGEsOtQdzwmkGTHhY9YPMRFWDn58rfXfmqOhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850650; c=relaxed/simple;
	bh=NtVph11BLd+x3z/1Zok/7JAFGIkvZxSriGpx0rha4FE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oF3dIyUciFsA7Jp0rUpydPYXN9etGv5Pwin+VsrulHC72yoSsDZiVgH6g/ZcI+QLzIe9ltu2Nyfxy5pOiijRi8iRShx66XAoSUDyeY/YKw5t1gG5PRUZAKyrfYojk34xQOspbURsaHSDbnuWRPRHrG82y9AGASYJdNZ99sqCzr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Oum+znJo; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Oum+znJo"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5cfa1ec3b94so7696701a12.2
        for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 09:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850646; x=1734455446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pzloo09Dgg4guioxkvLZOvAnsn9Efhp0SVwyR1byrx8=;
        b=Oum+znJotR81/GL+s9X3RPKW5dG7Pck33ayCgAliJEErevbuKFkHniF15QcQxdR1Lu
         vF3o8AhuF6Ny7cyQFsEuNwdPc6trLk/EWN7ujzUcFmQaHysDSPF6A1ZhxolQstOajJiZ
         ZnKbRxOk3roMK3Rz+yycNhSsGq6SJ3gksF1ieic7eNUH5/N3IdtUd70i8hCLfbbCAcfJ
         k80F0Quf6lF3FZxetKrqqw0wS0zJMxdVFKF3jdUSgL1yV+xE9tpT43R43DsKI95fJPvs
         EC4e4vq9x+nXRpvQaTgPqeslzokVL1S2fr6vO7ngkTGvpUSiVxsz5w+aWIRSQeFrjF6q
         SB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850646; x=1734455446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pzloo09Dgg4guioxkvLZOvAnsn9Efhp0SVwyR1byrx8=;
        b=FQbZAhn3zyq1hqE3lcIIM0t+a4WsTTOitn+Va6gxeg+4pB/93dshfWaIuj4OjBaDUo
         R9PNCUUpT2uTKwLKu4Y3tRlCqfIanennV7EfH5XeMTS9EtXmdnMd9a5rQx+yu79oDay4
         58SeMgmiF8A+LE/9/6MeOo0uq0Xtq/MY/jtT/oW1IzsPO6QQG+O4GSOY6z3vttOCvosR
         7vpEJGrTCKbOymJH1GnxsBLghfdDdL0seTLUo+03uIa6R649WbEVFBDuoZPxSPF/IbO+
         zGutOkRpQudng+S/8SPTqzwBCyzmxmkeySrJ70mh4G8vzklcSHekA9q90kmdE0AN5A2I
         kbyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8cuCZ4TE9OceAO7KOPi/iekv+1H6sl08nhD7somMHjcCoN/DGIkX86Jrh/655+3srhAA+dhpX6JY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzfQjy02VDjeBgxXZHE5Y3/in7Suy9LubM0ciTZdbvU2s8nZWf
	u+foXbl2mS5tikcUnQEHG79QEHW1NXoc/eaQg0hplEkVMlB6NottJMpayJlrkic=
X-Gm-Gg: ASbGncta/UaVd83WCjE03xKN8CgP1gU5s1+Zc4bmscSeVkf7rARmjL6lF45kRa/JW4x
	NVfAIh31SRMD2B2SHaTUZ1XfMAFYKip+nWxbYFRcVo8aCM0T98YDe5UsahO7W+IbeqYzk88y2oI
	9SYYKpkw2/SP6uqoECoDwEe7tMvVRklvWIYPoavzc4qiz3tJTct+X9Tk6D9Y05vwXTsjSUM8VXy
	b/dS6+MSuJ7x57WugtHTmfTaZoLNkG63Ysk5Sr04Xe098DlVl/wn9+ZJ/t/X6xsNNPefp2jzv47
	+ad+eCLrd2w=
X-Google-Smtp-Source: AGHT+IHu+/x+M8u5QIMjQ6egtfsihnsclgAo9NZ4IQV+C7GzhzYxCnvnX8xs1AndpKM2ie6VGxgEag==
X-Received: by 2002:a05:6402:3591:b0:5d3:e45d:ba91 with SMTP id 4fb4d7f45d1cf-5d3e45dbbfbmr13230055a12.32.1733850646516;
        Tue, 10 Dec 2024 09:10:46 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:46 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v4 18/24] ASoC: dt-bindings: renesas,rz-ssi: Remove DMA description
Date: Tue, 10 Dec 2024 19:09:47 +0200
Message-Id: <20241210170953.2936724-19-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Remove the DMA description, as it duplicates content from
../dma/renesas,rz-dma.yaml. Additionally, remove the MID/RID examples
mentioned in the dropped description (this information is already
documented in the hardware manual).

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none; this patch is new

 .../bindings/sound/renesas,rz-ssi.yaml         | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
index f4610eaed1e1..5b42eec864f8 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
@@ -57,24 +57,6 @@ properties:
   dmas:
     minItems: 1
     maxItems: 2
-    description:
-      The first cell represents a phandle to dmac.
-      The second cell specifies the encoded MID/RID values of the SSI port
-      connected to the DMA client and the slave channel configuration
-      parameters.
-      bits[0:9]   - Specifies MID/RID value of a SSI channel as below
-                    MID/RID value of SSI rx0 = 0x256
-                    MID/RID value of SSI tx0 = 0x255
-                    MID/RID value of SSI rx1 = 0x25a
-                    MID/RID value of SSI tx1 = 0x259
-                    MID/RID value of SSI rt2 = 0x25f
-                    MID/RID value of SSI rx3 = 0x262
-                    MID/RID value of SSI tx3 = 0x261
-      bit[10]     - HIEN = 1, Detects a request in response to the rising edge
-                    of the signal
-      bit[11]     - LVL = 0, Detects based on the edge
-      bits[12:14] - AM = 2, Bus cycle mode
-      bit[15]     - TM = 0, Single transfer mode
 
   dma-names:
     oneOf:
-- 
2.39.2

