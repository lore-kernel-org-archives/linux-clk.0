Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6978A22A1E5
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 09:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213479; cv=none; b=S7Jp15TDh0m0SGlImGByLWmJPOfwEksdeBtRI6MGsHZQpe/n3h/dRxjSAfzCx54TJbipNHgoqm1xUtg1xsjPbyfDQ/at+uViK/wWxZK2LO8YfYcHMEGqm48l4hZDaBVooH1FiiJ++2YIdAyk+PCkVmSXA3xKky0WbTEiJwng5R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213479; c=relaxed/simple;
	bh=4qxzgRYj3R0YSr5c7wuqfhdIlrtZfod1FQ+TL6UyLXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FYT7riifPGI6nYu9Iha2bKUrL15i8j6XAJwZLlONPpQpz+r/cu+58B/ch2BmWSqKG7IRVicplqjtVt0nd4ToIf2G3PaS8LW2UuZX9RJYOW78ttJRviaWGuXrBF7IvERbHjfJfToJOQo/kEgXmSTmcoK9mc9V86GftMQADzXalGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=hoc7v/A1; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="hoc7v/A1"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a1b8e8b2b2so3553342f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 02:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747213476; x=1747818276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlrLdd5J+/M2OISiprAv0x4oZKgNtFnWiJLXGIklBOE=;
        b=hoc7v/A1yzO8Gv8DLZUATdV7x9gpTuSgqMrYFj9n8A0nVu1qubAijxormEOpnLpGka
         TdfKSLlcmo/l+giozAANxSQwhoejjL8454YEEAruOmzVIkQkCshCsJwg+S+tcIjkjTAu
         7T08bf1GeFm/Kxm1Bf4T9BrZqJ93F3/Ougc4CiwoSv7zogZYvFkrn63tV2GQ6rQ/8y/q
         +qqF0+soqWm2OAOVS/Jrmfso60bViI0tm3K5BGui/cxLvKwXYI2V63d5zxA22pDkiWHP
         hZUBIFjPsyIkcAZ+6s57v92XzqP3cvlygtL2rBltAOuHo4V5WgYizstZzVihU6h17Ouq
         z5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747213476; x=1747818276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlrLdd5J+/M2OISiprAv0x4oZKgNtFnWiJLXGIklBOE=;
        b=wSgaySVF4AqIa3Ko8tMM1OUG0StMMPUT+kl8RQJ7vX2Le9TsKivgROaT0iH+/B62B2
         WUuA1j+bwEsnzC+oBmCv1TQcvxikjWJoTI5I9wnoNe4gNn/kWUAVlrmfDoguv7Yw005L
         GB/9/HU2raO0V4V6xvBxVXDwi6Ns4UpT66cLv3Dss9i5lyCC0BWtdzcMERPUhtw6aAsT
         m6wLYrOXhMcKTGTgq3zP583N/OmB+YicisxGCWdevXQobcaNNmRGadt7Dh4uE7W4vtpy
         X/3BLPummg1wpfFz8kDXJIZBgneFbOWFSj+kKZRf6SFhrZXo64E/+d+k9dZCP6v9L0l1
         rrgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAcoFqbRz7oLMXljTpB8T6GU1s9mLQBgg3k/Hs4KAax8pW3MwwJzjojNYqeuhpHGlTivGehcCthX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwURFtpnCgiS04Bv2pR6X4rm1bXrUK6apUlarH+tVom0ApFFGH
	SfqegA5k9BbSMoZRDbw1TfnC6R7kb2JvX+hDvmue97Vn5NoOxgjEr6evcrl1bHw=
X-Gm-Gg: ASbGncucl1JIatcjUwlxCa+IXzprmtDckxpzGsNwoW09nGN3W4nGuqETqMEBZg5Mt4h
	mbiwIP9fi0LkC09koFHNUkIsR9PXkINl9x9CLhjQ/USzn0NBCkm+9nAuWzPUNny0vGFBg7U1kZs
	3tFxy20ulHfrqd+6YEmpyfDAibDcOgXirWFUEkpyMNpbJvsCGTB8zOU+jv3qd0gIBpUxt2KY2hI
	ZDPzJzZ8Q4Oor6aUW3YoXa7R+xQkjLOFt+9IMynvA6aNn474gA08I+g6OTFL0YnI+OpmUeb4t8M
	y+DMihTK61r0a/Y3TKXSRJWOGC+22mQ6vBv1N33lWTy4No5SqJbUkrbKHQVlgwu8dPjpKN//VSK
	XEcC5
X-Google-Smtp-Source: AGHT+IEKWrUAq9SfIgehioeqh/K72TgwuXn7Fpock53ym5/tWn404/btuDmLUE0Kr4GNSRDHbVTVpQ==
X-Received: by 2002:a05:6000:430b:b0:39e:cbc7:ad38 with SMTP id ffacd0b85a97d-3a3496c28cemr1869568f8f.32.1747213475727;
        Wed, 14 May 2025 02:04:35 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfbesm19286561f8f.10.2025.05.14.02.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 02:04:35 -0700 (PDT)
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
Subject: [PATCH v2 8/8] Revert "dt-bindings: clock: renesas,rzg2l-cpg: Update #power-domain-cells = <1> for RZ/G3S"
Date: Wed, 14 May 2025 12:04:15 +0300
Message-ID: <20250514090415.4098534-9-claudiu.beznea.uj@bp.renesas.com>
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

This reverts commit f33dca9ed6f41c8acf2c17c402738deddb7d7c28.
Since the configuration order between the individual MSTOP and CLKON bits
cannot be preserved with the power domain abstraction, drop the
Currently, there are no device tree users for #power-domain-cell = <1>.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 .../bindings/clock/renesas,rzg2l-cpg.yaml      | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
index 0440f23da059..8c18616e5c4d 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
@@ -57,8 +57,7 @@ properties:
       can be power-managed through Module Standby should refer to the CPG device
       node in their "power-domains" property, as documented by the generic PM
       Domain bindings in Documentation/devicetree/bindings/power/power-domain.yaml.
-      The power domain specifiers defined in <dt-bindings/clock/r9a0*-cpg.h> could
-      be used to reference individual CPG power domains.
+    const: 0
 
   '#reset-cells':
     description:
@@ -77,21 +76,6 @@ required:
 
 additionalProperties: false
 
-allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            const: renesas,r9a08g045-cpg
-    then:
-      properties:
-        '#power-domain-cells':
-          const: 1
-    else:
-      properties:
-        '#power-domain-cells':
-          const: 0
-
 examples:
   - |
     cpg: clock-controller@11010000 {
-- 
2.43.0

