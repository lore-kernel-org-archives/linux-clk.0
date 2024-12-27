Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539411F8F07
	for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 16:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318663; cv=none; b=UCWuB0oEmPma0/8a6YVE90pu0QiXVzYwlkyg/2qq+IaFbyTsZ5YWIrBiPWjv7uXLma7XagdbYRHDoo3KD3Fx5AGKTw4NFJ5SAFaCuC+BxOEUQwGxPLUfQDD4ajCR6+1r/pQj9USirGfXu9JxziVLHLPzlfoSGbS0BpaYwet4+gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318663; c=relaxed/simple;
	bh=naoomUt0k88+wEV17B2ZOe7lNdxVn1y0MUvtBQNmPnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZlMT4p/2oLqz71mX+0wZ1MxDc6jP4wT4I/Ahc50AzblB4VUhyi2Zn0XGDjuAQC8dIFi8GgSq2z/zAGC3Tlk/V992083jvEYo+oP2TVIW6KrDqfftRZRB4oA7L8Fxm0GPgtiTHQvvc/BhblKXzzvaqClvlv1OBvBpNNlz1BuUsp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=gtsa9nY4; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="gtsa9nY4"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa68b513abcso1419983066b.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 08:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318660; x=1735923460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXkTXrVS+/nRJltLKdRuy9fqF8vJTsINCmAjWzhQ/Xw=;
        b=gtsa9nY4cxAyM7tJKBaT2Ai55BR4MCEDVA1/XAneh4oJInJXYwp6DwO1YTU/puo5Y+
         ySwbBSmrr0CBI4DwGskwK9JUR1zg2bBeFi6NhzYSou0e7DI1tM7Omhp9mO+JqU3kSi0c
         nVEoke9n/lljBckMARBmds5dFNWbND3B9Q0cY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318660; x=1735923460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXkTXrVS+/nRJltLKdRuy9fqF8vJTsINCmAjWzhQ/Xw=;
        b=McTAKn2BztAnGezmXF2dIJZuFd2Dx1ge7e3RsufQLcdpqe4wJoEYUCgXGUNOttUMme
         1H03Cd8dxKCV6JWPvOvN25MDSHAETj3X2gz0gjs1SDIb5YYZHatWSQBymFkJhdHeKB7h
         PmNn0wPYRHQcreVY44hJs6n7Bc73hNIoKQrYttF44vhMpAuUW0mpJiafMSHC+5Xog5ZP
         kEHm85MV+uwoXAkBM18qcmcoqcCc9e4LaUOx8ZF3aabU6uS0kKlUfoHSkL59FvGdZaAe
         9XzttKy88q6wL9LIs5rB0Jm3Ia26ZrrBSbwzlJps187wcJFwPyouOVymHd+PxnyYJaet
         8xGw==
X-Forwarded-Encrypted: i=1; AJvYcCUyJYFbNzZCpxrjsBNq78akWPXguGd3ai1ZLd/vaWu1EqQ6EO2jtSHXll1vZcG5ID2bIUEERXy2Kcw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzscG9i8riG9vWR85QD7F+0DdKEp5aWnWC/nyTRfS8cGDofZVCJ
	5IhpqkkF8QIUmewY2Yk5O1XZyMsGdcMgk7F2FycGd3fxoIxbt2klQbQsXA2BR2o=
X-Gm-Gg: ASbGncuYKkAZhKjjV8qXrzawrC3d7mmlzgqqOktqYmaJZ+1MiGL7EG/Ka9CXiNa9JOl
	YPEaWxXLhxZi+fwE7MMtUkRIpxno7CFEnCsW28WMWhluCAAzkTVIffKsAn1FI6ZT5wRxcZDXXxF
	LKTb9CgeoQlcST6Fqg8FTikoYYngDErWeCWmVwLs1Sxnf/ZukQFQ4e/vuPTsTyhPOB4JgP7OT9f
	gDr87GF2HO/5qtOTiEtfhlIP4GOc5t05HOU1Z+Cw5fIcJQ2rRiD7JYU8SCE3qbtQAgHDdltRNhV
	You2Y9oGZUUVwCdOyMUsYw==
X-Google-Smtp-Source: AGHT+IGCaJDO5HxA1JrQ3trYq1mZgAVJbVh/QmApzDwyIdyVJeYbHjoW+NICkcizlG/u5obfXBOTOg==
X-Received: by 2002:a17:907:3d86:b0:aa6:9eac:4b7e with SMTP id a640c23a62f3a-aac2d455458mr2795714566b.30.1735318659824;
        Fri, 27 Dec 2024 08:57:39 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:39 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v7 10/23] dt-bindings: clock: imx8m-clock: add phandle to the anatop
Date: Fri, 27 Dec 2024 17:56:13 +0100
Message-ID: <20241227165719.3902388-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding the phandle to the anatop node will break the ABI but will allow
for a better description of the clock generation hardware, making the
dependency of CCM on anatop explicit. Indeed, the CCM receives the PLLs
generated by anatop as inputs, which, together with the oscillators,
are used to generate the clocks for the on-chip peripherals.

By doing this, it will also be possible to generalize the CCM driver
code, which will no longer require the platform's compatible string to
retrieve the anatop device node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v7:
- New

 .../devicetree/bindings/clock/imx8m-clock.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index c643d4a81478..b23e639e6389 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -43,12 +43,20 @@ properties:
       ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
       for the full list of i.MX8M clock IDs.
 
+  fsl,anatop:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle to the anatop module that outputs the PLLs, which,
+      along with the oscillators, are used to generate the clocks for
+      the on-chip peripherals.
+
 required:
   - compatible
   - reg
   - clocks
   - clock-names
   - '#clock-cells'
+  - fsl,anatop
 
 allOf:
   - if:
@@ -109,6 +117,7 @@ examples:
                  <&clk_ext3>, <&clk_ext4>;
         clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
                       "clk_ext3", "clk_ext4";
+        fsl,anatop = <&anatop>;
     };
 
   - |
@@ -120,6 +129,7 @@ examples:
                  <&clk_ext2>, <&clk_ext3>, <&clk_ext4>;
         clock-names = "ckil", "osc_25m", "osc_27m", "clk_ext1",
                       "clk_ext2", "clk_ext3", "clk_ext4";
+        fsl,anatop = <&anatop>;
     };
 
 ...
-- 
2.43.0

