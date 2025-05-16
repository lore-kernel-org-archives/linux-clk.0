Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188CA22DA1C
	for <linux-clk@vger.kernel.org>; Fri, 16 May 2025 08:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747383387; cv=none; b=RQse1kO5RJZgVZ1/CgxLmThfTaXS+P4AjbbyWg70G8WUVvwfvFgu/n/ybRDOKokHbRnBy/1guWPGK4abdTKrGCoohgvoDOtOg7F5r/Qi7yDXzuRrxZXz3lF7G758FXzFKEZqOb40vgtVL3ICbTBp5Duv6o8YEuH3OLUwT8Pewfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747383387; c=relaxed/simple;
	bh=ne4PfWXtPTDke/5/uFZ5cI1NkNx1QheiiJRSL2tSd1o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M+z9zUDQOZn1NL14tAm/B+OELDx0OsxLdyfGThw2vCRx4e0SdmDqGTuZB8dlbebsB08nWlg1KcwhRjCKJYZ37bqRjehqOieou36Kfx3BQk10pdi6lYe89RiZfwFKUCZu7ncu+PPKK44U2sLknpcMdUVDJ7eQO+YMjyUXCI7aATc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ajQIsT/J; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ajQIsT/J"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22fac0694aaso13944725ad.1
        for <linux-clk@vger.kernel.org>; Fri, 16 May 2025 01:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747383385; x=1747988185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/V2daD2rTNcNp3coCr/ToEF+NAYlBMkaOYzNetHBK5g=;
        b=ajQIsT/JNGABAJnRdU4L0P233li6jU3+9UAWxfrTa0rzIpVAIxlhcxAXvYQv7prP2r
         l2CZA/HUdhquexq/VK1cum58wmLFcueq7kCdh6zMlVWg8SSAvEJbnTLfC2X3bjVj/LSg
         Wg0ddOsfnQSkjQkl/K93UA5VPBBF1ly7iCpM44d31KvaHuGwJ5lX3NImgIG2t97nxVSQ
         cCgte/vEfuUICw/VG0M2yc3zY1FKRjIQTk0s+q7Re0xHDVf6vZAlISqwjqup4SmcoOKV
         GE3Gc1a890brdf7lvyKd70Pus7cS5n8DN2wrNv5H0phPVXWc2Ft6YZwbepYw76QkIME/
         bY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747383385; x=1747988185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/V2daD2rTNcNp3coCr/ToEF+NAYlBMkaOYzNetHBK5g=;
        b=k9fEnnbYM+R0XqbUrsBgfJ00EgihwLoI+XYjNR6wRfaWluTa4iF/vwE8xGuM5/1huM
         1/DEgImvB2wXs3BrzS+ByiRXKJjdVg/xN8EiJjB2SQSSJtLlCOfkoziT2VQqzdy4AC8I
         IbWm1GgjyNOgEFsbDP5fCy1ABCIsQEuNKaH92JvZwPaSC+0g0Fo2UTD2GgUllNYKMK8J
         7xSHYeQWlLQ7gshibX52k0f8fXG+cmgxpJwC4gs3Db2pE81g/spDzaT2IEHg8bMHfNOQ
         xHkj98gWxXqlmQDZID7Cfie3uZJFJE8943Otn8z3qPGJXaN9s9+/U/rynKLSFVzyxcw2
         LYMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6rMuWQB4GiZ4pvzWSOld/ObBbWndfeYeTVHvo332V0zC1nMQK5oNWSady1OpMlrHFrE0TNEXfwrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDHhO9UzfcoL5PNxson65uBzaX/Tjxjy7UOdol6JWB5hleKorZ
	vdKZ6PUgCwUjPUeTZWrC9dA9MeeP9QET36fhRLsD4u6kNeKpWqiamFpJfnp3z5y4QkE=
X-Gm-Gg: ASbGnctO3fcEaB/F9dxiB+tCkaLV/Y+2bLM88RoLYgCVfi/MEOeR1gL3Wy1Hn2tlTEp
	beFv9vC3fIobhpsXMyDQxgCnLdfk2B8ICPvtqQ57hnjwJiE7Xc9DT3Ujux1kM0WUezjX1GFzZV5
	gh540EHJzFYUywfYpsLTQ18am85DtxLme7StZtyyjv/fP2IdQn+sFPRJhoNvOck0jtINbY71Rxf
	4wajl5IEE88Gmo+ujrD0BTwd07ctFvMpIOcRORetHls6i9fAfG6qsE3u3jUcimY9vtS4nqwyCBj
	rT59GX8fqdynbs+WfoOYlxm5EbNPG0sXd9/zpqPKZQj6hmYqFdYQaL0gQh332ZdlKMsEJcDbEhx
	oN3t9p+uFwMt2FA==
X-Google-Smtp-Source: AGHT+IGNwOPd4/78bjds7wJXN85y4exK0t1zW51cDsS9UCcuz87FTXGSkJI8YZ6TyRB1xxjOHnrMRQ==
X-Received: by 2002:a17:902:ea0a:b0:22f:b040:9751 with SMTP id d9443c01a7336-231de3b9709mr18773765ad.45.1747383385431;
        Fri, 16 May 2025 01:16:25 -0700 (PDT)
Received: from dev-linux.. (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97801sm9397695ad.133.2025.05.16.01.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 01:16:24 -0700 (PDT)
From: Sukrut Bellary <sbellary@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Sukrut Bellary <sbellary@baylibre.com>,
	Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] dt-bindings: clock: ti: add ti,autoidle.yaml reference
Date: Fri, 16 May 2025 01:16:12 -0700
Message-Id: <20250516081612.767559-4-sbellary@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516081612.767559-1-sbellary@baylibre.com>
References: <20250516081612.767559-1-sbellary@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ti,divider-clock uses properties from ti,autoidle.
As we are converting autoidle binding to ti,autoidle.yaml, fix the reference
here.

Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
---
 .../bindings/clock/ti/ti,divider-clock.yaml   | 22 ++++---------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
index 3fbe236eb565..6729fcb839d2 100644
--- a/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
@@ -55,9 +55,10 @@ description: |
   is missing it is the same as supplying a zero shift.
 
   This binding can also optionally provide support to the hardware autoidle
-  feature, see [1].
+  feature.
 
-  [1] Documentation/devicetree/bindings/clock/ti/autoidle.txt
+allOf:
+  - $ref: ti,autoidle.yaml#
 
 properties:
   compatible:
@@ -97,7 +98,6 @@ properties:
     minimum: 1
     default: 1
 
-
   ti,max-div:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
@@ -116,20 +116,6 @@ properties:
       valid divisor programming must be a power of two,
       only valid if ti,dividers is not defined.
 
-  ti,autoidle-shift:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    description:
-      bit shift of the autoidle enable bit for the clock,
-      see [1].
-    maximum: 31
-    default: 0
-
-  ti,invert-autoidle-bit:
-    type: boolean
-    description:
-      autoidle is enabled by setting the bit to 0,
-      see [1]
-
   ti,set-rate-parent:
     type: boolean
     description:
@@ -156,7 +142,7 @@ required:
   - clocks
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

