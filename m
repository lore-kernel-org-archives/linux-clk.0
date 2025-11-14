Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDDE3218B8
	for <linux-clk@vger.kernel.org>; Fri, 14 Nov 2025 14:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763129825; cv=none; b=gs8QrZaup4Ly1N+RO+xkIbW7BLkT0RxIEYUGU2HMx/xp9RKlbI2P/ltHDLU+Nli2VUMwan4Td8YR0c2htYjbsv2yp3W191abW6qCJsQaLyVzFHZ2TXDd8MGlyWCwYSL0axjTtPiMppDlGLmWddKzpa/LSRLtdX6ptzTEQQBi5z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763129825; c=relaxed/simple;
	bh=6sKEmCOQ2W5VcemaPNloFrkmil66ilCQ7HCGLcFo2/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EolT8GwvlEdFg9jynK2DoPfatB+vNNyMK2KimKAiram8+dKfn5eAGOf88DoALFwnLDrUQDW0c2nBMbAgHbhDR2Ch0ZCQreiVROhY5CsvBnMX1G66iH9k+26TZjcVxcbX3RZWOJzzqZRj+eq9ffak2qTfug9umeo7OHcPKVZHlXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v9O0Z889; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v9O0Z889"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-429c8632fcbso1456550f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 14 Nov 2025 06:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763129822; x=1763734622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4oAM1SJwe5be5jeswFgKKg+ScqRvx3vPVGMPIZFDZGA=;
        b=v9O0Z889gVLPahMw1/IbXT7pUx5iN3A4OSdGJtiMGflzKiou2eQScf+7mtvr4Xradu
         Byjer04al+qXBKbO6vb1Uil2QjlArK0VsTJgSvAnVtkatb4vKlzWNEPn+EuPCJxpkx7Q
         +LsTzNOBoIbpypxpP6GxPKb+yP/+528yrvCoaV15N3wptkuIYc9tk5895vTaNKkcnj1/
         kX4OOZ69H0eNrKp+fG7hIStA0WXvwsBdCxQf3lDyl0EWzndtz711sJyQNhpmrerKmsd5
         00fFS2hPQsXh3ekTA7xghy9PfU1SV0s59xWQQM3d8K+YCgJzKb/q4dMxUuu38HPjYyD9
         ZMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763129822; x=1763734622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4oAM1SJwe5be5jeswFgKKg+ScqRvx3vPVGMPIZFDZGA=;
        b=OAFNadUVwGGi7DAT81ISvyaS0ibyNPbi+Rxr0eU6ML+IkvlWdHTscLcvZyr6hdbHfN
         uIE/ZgerUsK3g0VacmhJ7BuF3JBc+Xa3Omy5MG4/FYYeXDyx4ZY/egQwYns3GJLJVB0X
         X2AEoimWDrssoHh87wPGqpbvo2jTntFizwHOAcdsUC9IokbjQOHAtlqB5Eyz5VGsQ4Aw
         M9zR/hqtbQDMTHh75AfRYrn97zhnkgvXJsicAaD8X0KLi1r4Ej0LrEEXpBy4j/IU9lJs
         4Ho6Vt2jp7OILntnuaPfFUdvx/m7YbzZz6rT0Mw/5Gf/s9wun+MROcMua2GA9xw0EvR+
         wRCA==
X-Forwarded-Encrypted: i=1; AJvYcCXM0+L5k2YTSptu3r4heCZrtWMn/bvonmTCFYuTBKlcbFyjSi0y8gdj8xIOKlvLxt6bWbp7I7sGiHw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGv3gSQJ1RniOfFc86uiyJGx5k35A7tjZ1QZVEhZUbQV3N8xsw
	oO8y+dS+vGu6JeTcvYQZJ5WJ7etrquHNcRv1ko2ye4K37QmQhiHKKcTiF91mPNtU87Y=
X-Gm-Gg: ASbGncssyEqZgwIYbiWxcr3uDE1k7KSN7RD5kg9dGDhk0Ocm6pLoLp9xdxcqYdfcLc/
	BZs5EsFuwqbeCBYQ6pW87acaQj6OmKQCK+NceC0YA1WePnf9j/tSJ7Agz5h8dNLf06oMIgc5LZp
	DxMdulXTSGDQ9QX55g/hDXn5mtFuuDpCnF8wYDNnFbps3jnXLTaQ5ypvLGm+Zs/BKYRSphaGQ2Y
	kCg3LjRi8MqHmNJe3XAzngxgvvvHw+AQELeBd7QxnwynR6zIlywLlatBsJZ8d45gxxNNbdbhFj3
	K2IkzBB4TliaA/XCtKwIxRmMJIw2U6MScZhordXDdPCCl+39gcA0bhCopNiPDu9eJpmyM2J9GUv
	6FdqsH5YovN1u3Kor1kawb2I6U7V1X67zepK2+vi6dS/9O2R+tZIW3euxOWimdHF+9PZXVsz28N
	W6NGRMGliL/Wfc4S5j1gDWNXWvxur9fQ==
X-Google-Smtp-Source: AGHT+IGqRwmbRj/CPbgz3UePg1W1Fi4Jf+p5TO4TwZlqbe762Q/tfUy4KsZ40D0BSKchWnm2kHW4JQ==
X-Received: by 2002:a05:6000:24c6:b0:42b:3131:542f with SMTP id ffacd0b85a97d-42b593395b6mr2819075f8f.24.1763129821651;
        Fri, 14 Nov 2025 06:17:01 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f21948sm10150958f8f.43.2025.11.14.06.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:17:00 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 14 Nov 2025 14:16:48 +0000
Subject: [PATCH v5 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-automatic-clocks-v5-1-efb9202ffcd7@linaro.org>
References: <20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org>
In-Reply-To: <20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2886;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=6sKEmCOQ2W5VcemaPNloFrkmil66ilCQ7HCGLcFo2/k=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpFznXNvLBNwl+BCqlq+ASU5nNnrkNHVGOcCAIA
 c6LVtvJOsSJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaRc51wAKCRDO6LjWAjRy
 uqU3EACgypkgEzt6O3RuGIUcTAvGF+i3BtDUdztrJqZeT5YnNtFtDpN3U1ocwD2/l92Z/7kIB7D
 A8IOXDPf7/Dac/8w65lPt5scyF6NJONoYcbVHwUy29QW+iwaHIrnalQexDIjp2SQ6JmKBCGJvPw
 Hp5cr7exmzHp0aWdLVnk5rriXqB2jZWcGEE43XyOfSLMRW3qhavXpaBVfNaz5NeqLRv+RRtCPbq
 EvixjewmBsZIyu26wShbPHO/nIG4H6HbC7tbS4v/dPnrawA99p/RvP3aQCHmA1KmtHcMdpnWdc5
 xmYIflwltaRET+sz3fxu9mQVA+NEcTFEjP19nw5/+A1L7+kE4g/IImeGVinTg7h5wwsRKQDR7kq
 3Vvp/8XzZZW6H2N/tZVOJJ9TNWUjvxuWOO/Q4J1ce4gkexA/POToJWgRAhiRYrl2ge0HB4hZJso
 zQAKWD4TVa1KtNgucU2jAwSX41m+POJ7ZqWFRlENCUOfgH0cqA6bNpGx0tfldpV8wi1iIGEdPJT
 LM5FzzLgO1rj7PECYoIHBsYtAmQzf1QdIdzJuzHXgiXgy1XCV9LLbik6t2IAkYp7mjxmk2VeSiP
 DoY7mQxBT+LwYIMhWvUmmEbWYIgLh7f6mAxhzphC30XKUmxR4a/gb2f65oGJnDe9i0zMiY4eUaK
 5GdBP9jOeYtZE4w==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
that contains the BUSCOMPONENT_DRCG_EN and optional MEMCLK registers.
The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
bus components and MEMCLK gates the sram clock.

Now the clock driver supports automatic clock mode, to fully enable dynamic
root clock gating it is required to configure these registers. Update the
bindings documentation so that all CMUs (with the exception of
gs101-cmu-top) have samsung,sysreg as a required property.

Note this is NOT an ABI break, as if the property isn't specified the
clock driver will fallback to the current behaviour of not initializing
the registers. The system still boots, but bus components won't benefit
from dynamic root clock gating and dynamic power will be higher (which has
been the case until now anyway).

Additionally update the DT example to included the correct CMU size as
registers in that region are used for automatic clock mode.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v5:
- Invert the test for google,gs101-cmu-top (Andre)

Changes in v4
- Update commit description with additional requested details (Krzysztof)

Changes in v3:
- Update commit description as to why the sysreg is required (Krzysztof)

Changes in v2:
- Update commit description regarding updated example (Andre)
---
 .../devicetree/bindings/clock/google,gs101-clock.yaml | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index 31e106ef913dead9a038b3b6d8b43b950587f6aa..09e679c1a9def03d53b8b493929911ea902a1763 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -52,6 +52,11 @@ properties:
   reg:
     maxItems: 1
 
+  samsung,sysreg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to system registers interface.
+
 required:
   - compatible
   - "#clock-cells"
@@ -166,6 +171,18 @@ allOf:
             - const: bus
             - const: ip
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-cmu-top
+    then:
+      properties:
+        samsung,sysreg: false
+    else:
+      required:
+        - samsung,sysreg
+
 additionalProperties: false
 
 examples:
@@ -175,7 +192,7 @@ examples:
 
     cmu_top: clock-controller@1e080000 {
         compatible = "google,gs101-cmu-top";
-        reg = <0x1e080000 0x8000>;
+        reg = <0x1e080000 0x10000>;
         #clock-cells = <1>;
         clocks = <&ext_24_5m>;
         clock-names = "oscclk";

-- 
2.52.0.rc1.455.g30608eb744-goog

