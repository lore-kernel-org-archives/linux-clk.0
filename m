Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D713314C8
	for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 23:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768520577; cv=none; b=bCBUukOFrteHY+8QyUv35AIE7ZyoLrsPikbT46nQUkMS3O3/96+CzACRDMxhaCyVsoAxTtMldvqlIr3LwumrjA1aUj6rbSBO+FpIVevfJzr5gvk0hRQY6ylH/0SRl+omQyKa9VWVyEd3NbIJL0ISig+gby41Z7STs6tPTe8RTiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768520577; c=relaxed/simple;
	bh=EEjRqQx/H6A5D0M2EPOuD3mdpqZCKoJ2C5PoaUS/a6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L+sYPv3RGdKL8y/pdQvvwT3yg4hMRjnNFKrqqh4AMKIXXGagXiWDkN69wbyeu3ClzYJOBgjulw79elDLH2fVexhI5aViER7muwlyA/T8E4SjxfSu/RxvrgVUuzEEp0osudJorLLUtQEidT5U1Zj6aUdL7nOE/YT1SVdagaLQVd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=LGJqUAEs; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="LGJqUAEs"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78fb9a67b06so14328547b3.1
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 15:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768520568; x=1769125368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgauUMDVjNkmmnUZThthivYhABO9DN7YXuMbhZ6n408=;
        b=LGJqUAEsUnEnN0ikvATmZswx8eb+G/Mya/WMhzivBIpUsdNVOszB3GIAtwPobmkXyD
         L56PM7wYScxVxcsSYijAawebASbGnFfZD2DBcInywb1CaNmcUVGbu+CTS8dzqXB1ujU6
         4rUb9AtHGDbtFldWnbquRcnsjlHJMyO4NcosKJCRtk5BJCCJvy1cbaEJu10RbFyLuALh
         RgQCZRFJ73JU6icvP4vi4CcH6CIBVOY89/rd2HFeGBHncRCBI818SXqCYd+BK9tJoPYo
         dphijL2J7h2M4j/q8GY2iaYicCcRHJg3GQZEGLH28X4Aj8fbfvsu7ZuYNBobhBJDool5
         zAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768520568; x=1769125368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZgauUMDVjNkmmnUZThthivYhABO9DN7YXuMbhZ6n408=;
        b=QWV70qDEnAPdIbdEXqZa4ECCaxcJ993QfDYb6fW2tRIxxmfiZ/yMUGxciTwI/Bd1l1
         3RN7RqTA7JVogtDQS2U9bdpaMNF3CF4nqzpnfXXpohDHf/p5F8VcJLeNYkG1ZiVgf7ZX
         lBPe6wyhz+XeE2yyy+/4WtEmBT9m1Ele/LM2fRPoXhUjKfsDXskcgfhnZttNIZK63BoZ
         tx9PViAb17qgdz08kmfOci1FC5sghtvgzaNpmGyiuZPot41BAR8dCGteJ4PyYwXSvvqY
         /kytOanO8ZoKNKWEYcT73/gN4OhmTHeTYRNdRvGk9DEMA/2mOggjz/mHSMicycHLlDy/
         afzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG1fit/6275Nlu+2zB2IzgU5+TvtURGmrNlqU0Xkk/PQY9sflVxCfI8o8/4w7PiluAowGrVfNsnuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlcXwBkBGF40NUDhoBaXq4MJdiwdW5vgZ49XENdov1zhvtEm22
	PBTlgmWtaKTIZoiuurCNJTLUdvo2bC54zX3yJnIfDBHuF39krOlqQiLl5AO4rBySc/k=
X-Gm-Gg: AY/fxX6n3Nkd/GNyvRjUVMyvZxFsZJIHurC14kzdWLL3e+LCzgyuO1T+mI9kYxZNatu
	eUM0HoJkXfXUWTRYtTe1T8kKnJST3iI70/CwB3BKbFqL1o5WP5yhawPliWFBkQO0paDMPMSNxvV
	JWLt/UkDNd6ZWx77+5kLbmAE4p30gHqV5D+C9YYXMmHyE5AT9LV4+ZiuVTVYRoeqiPP/vKuhcQl
	souYv5N7c5nH48LvPrD6wd+pncKCau7CVp6UZtMZ6dY7tTiVkI8foUqV2PffpgMVEmMoOSxdqKH
	kUolABWgv9SlzrhA/XeAl2qTA1KHIQFCipPnSv3fN/liw27phEZm9S9SIoI5Gxzes2DdHMCpd5U
	68hFszyoCKArtnxNxQHYLw/MxVs/b0Bis3LcSMO7J/6TFVX6+RVMpRB8+q+4/bODd7k5E1pMbUG
	6Wiuc4hNHONc7UfOwmBLazoXuHSilaSO/sULgqWHWX27V513J1hVO2ZT+pwmQC8jU9wlrEXMc=
X-Received: by 2002:a05:690c:6e0b:b0:793:bbd2:5675 with SMTP id 00721157ae682-793c67f7993mr7567597b3.44.1768520568667;
        Thu, 15 Jan 2026 15:42:48 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c66c72aesm3027117b3.11.2026.01.15.15.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:42:48 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 15 Jan 2026 17:42:03 -0600
Subject: [PATCH 4/8] dt-bindings: soc: tenstorrent: Add atlantis resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-atlantis-clocks-v1-4-7356e671f28b@oss.tenstorrent.com>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
In-Reply-To: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com
X-Mailer: b4 0.14.3

Document resets from RCPU syscon for atlantis.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 .../tenstorrent/tenstorrent,atlantis-syscon.yaml   |  5 ++++
 .../clock/tenstorrent,atlantis-syscon.h            | 34 ++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml b/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
index 3915d78dfeda..7e9c8d85ba9e 100644
--- a/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
@@ -31,11 +31,15 @@ properties:
     description:
       See <dt-bindings/clock/tenstorrent,atlantis-syscon.h> for valid indices.
 
+  "#reset-cells":
+    const: 1
+
 required:
   - compatible
   - reg
   - clocks
   - "#clock-cells"
+  - "#reset-cells"
 
 additionalProperties: false
 
@@ -55,4 +59,5 @@ examples:
       reg = <0x0 0xa8000000 0x0 0x10000>;
       clocks = <&osc_24m>;
       #clock-cells = <1>;
+      #reset-cells = <1>;
     };
diff --git a/include/dt-bindings/clock/tenstorrent,atlantis-syscon.h b/include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
index a8518319642a..ac6afc95b224 100644
--- a/include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
+++ b/include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
@@ -64,4 +64,38 @@
 #define CLK_CAN0_TIMER_CLK 52
 #define CLK_CAN1_TIMER_CLK 53
 
+/* RCPU domain reset */
+#define RST_SMNDMA0  0
+#define RST_SMNDMA1  1
+#define RST_WDT0     2
+#define RST_WDT1     3
+#define RST_TMR      4
+#define RST_PVTC     5
+#define RST_PMU      6
+#define RST_MAILBOX  7
+#define RST_SPACC    8
+#define RST_OTP      9
+#define RST_TRNG     10
+#define RST_CRC      11
+#define RST_QSPI     12
+#define RST_I2C0     13
+#define RST_I2C1     14
+#define RST_I2C2     15
+#define RST_I2C3     16
+#define RST_I2C4     17
+#define RST_UART0    18
+#define RST_UART1    19
+#define RST_UART2    20
+#define RST_UART3    21
+#define RST_UART4    22
+#define RST_SPI0     23
+#define RST_SPI1     24
+#define RST_SPI2     25
+#define RST_SPI3     26
+#define RST_GPIO     27
+#define RST_CAN0     28
+#define RST_CAN1     29
+#define RST_I2S0     30
+#define RST_I2S1     31
+
 #endif /* _DT_BINDINGS_ATLANTIS_SYSCON_H */

-- 
2.43.0

