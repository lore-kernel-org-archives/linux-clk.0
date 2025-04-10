Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A1828D833
	for <linux-clk@vger.kernel.org>; Thu, 10 Apr 2025 14:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294017; cv=none; b=AzjXvshjfCKXIIQwAfJElnEQdQXg+JoCrhhTLTFCg8XWhf8IZPjGqPkVbmxNNGx2bEhAGqcO3I4y5FEG87hVC03BvL/DjGWtFz9GIa023JoMX43OiVCXvyUXU8PVzgFvcFsO5gsoFhx4NFs4PUvYvj/LBNvAmHvDYCc1W3VjFO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294017; c=relaxed/simple;
	bh=kPIosshDR5H6osac6wbdQDDN6UXpRpsRAyxz5no1LTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dRYwx5aVgzZYvgoXKeMZnbmVGiURMa3KWPf5iagRCDdVDQgm62/aqp1qpMqMJj0eCg/ZuH7pV3wA3QG1pHqBFffo10TKAdipbHVaLtdUutx8cBZINUU4saQGVWNvsnXzIHfGRKahTG/ug0hRLbnSoC8qEA9AtiiNr8ynnzQdKnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OMb2Fdrz; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OMb2Fdrz"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1411645f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Apr 2025 07:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1744294009; x=1744898809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHL5IPj5wQTERMMMmzAKWea18ujPZ58wyWG0cWKNHYQ=;
        b=OMb2Fdrzsz7kC4peeIRq4jrA4SyhUqs4dnD/NqzwFaXLI3hmQpuoy1gtKyZbivYT6d
         bq7wnfPv2UdGUxGNOfYxhWNuRCqDoAY+BFoqo4bUPi9oNiiHWxfFSeSHYjuDipQx0JXy
         RNNni1oy+W7VCyBKY3AY+3eEJERnFPA6vB7PWeVVsuQ05PFPwE8R3XpgNY3GXpaiPUa1
         3NTTMJS5futcrkxs1gdrGnm0MVEUe6mOP0bse00cgNuMDZAt55secVLjfe0brOONBbrq
         K46Q+edukx2zwHk5/scqXjYEDW90NOJ+CDRH9w/0/dSvJ/zyYbEasw+pHeN0Aca6QA6a
         7F/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744294009; x=1744898809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHL5IPj5wQTERMMMmzAKWea18ujPZ58wyWG0cWKNHYQ=;
        b=jeLmW9c8UVCKs1wYvw81Ohcia69IzTnDATjQR/mTWbL4e+ue08VMRXN0mT7W8WLnmV
         uFhRLk2jBkaUfqkjAbmV9XmMsjz5JJqfeIwg+6rWMa6tPMBMOSUXRZm8ybNt9zuXvAgD
         GwkExeIsmMa0J4TLI+v66Yrm7pAHrab5m0p7x4gLEs8zH3rPgTwrtOJDnQQ0oFws+uqC
         pMYQIfNH32NtgCZZjhhHjyg/hIISpRSrfNtNN90CDm/oZaXXwyAJU8nXsqen23KYmy4C
         4wNRjSzPG/EUGrXH/xn+4dyCtJwt+y4JFMSNApWz65sJ+oXihc+WRX28dBejK02n0ebb
         5J/A==
X-Forwarded-Encrypted: i=1; AJvYcCVJXaXzC3bccYc5czkCpSmjshNCo/C+q2GYF4C0zifhGX4uOfU6Ja376oWoNwXdJyC0gIH5QmFoVpc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh5zEa2PgwrH709MZk6+0WIIEGvlQG1uFGF48s/PthUO4CB2vm
	+z+xYU0lBdWXx7qoqKL1NThyvD9qe0h5NrGZUQv0NQkeaA+Zh8m9V3K76HP7fD0=
X-Gm-Gg: ASbGncs/SGrQG7hN9/Z6+pSPxg+34iaRKbHIe1o78ogkftKrdUt8DzAxtJX2PHJraaL
	EPP/VY/pRCHTJgxGZMOJ2iALD6ibE///1Ij2U6aoZi170TBK8Ys1QA8Ta9Tuo4P1os0vdlF555b
	VP34BoBlT4nSklrp8CZyU09u97jjb99X6ssYCCjRc6Z3EBenCoi/2dnz2efkaHCACQd9vXAqK2L
	M4nAFk/3JH79ojpgiJylX94qatTJQMs8ZGsTSywkV3ojd92k695HlBJrsuhv6VMF8qfbzjaYPPd
	KbUQPfevqqX0OwRiLgN8cPISXuZr4ABsi/ERxYKHGCeHb6czRLqvp+fvGTfrpXH1K/iIRg==
X-Google-Smtp-Source: AGHT+IHOcPZ66SzEZvQYNSIfZ5gzgwZTGjRiYOAcMR0wqLzi2RpfoI/4+zomLnNdjGeNVHWvRUCJkg==
X-Received: by 2002:a5d:5f4c:0:b0:39d:8e61:b6eb with SMTP id ffacd0b85a97d-39d8f26771fmr2971729f8f.1.1744294008896;
        Thu, 10 Apr 2025 07:06:48 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8937f0d8sm4806913f8f.40.2025.04.10.07.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 07:06:48 -0700 (PDT)
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
Subject: [PATCH 7/7] Revert "dt-bindings: clock: renesas,rzg2l-cpg: Update #power-domain-cells = <1> for RZ/G3S"
Date: Thu, 10 Apr 2025 17:06:28 +0300
Message-ID: <20250410140628.4124896-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
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

