Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942969;
	b=Xa3tmBZv9tW8+uR5WwYStJN7zxvrKLdq507WZ04BXfABVObMAulQ2XXyQcsW9sie8XAv
	 I/KGVIDeoPXuN3HhmzXRqyRyjQ5qvTcn0I01M617hvqamntQavgT2MZ9rBiUgrw98tjWB
	 0AGFLXYhuYFM6AlaJ4bStEB6YhXzOH4AsWUzSl90ZVAfPb82L9WV5MSi965tDD0CFoXe9
	 00f9l5Xipq81bbzSH6spKBelXunxbJqEDbsT/Em8x71ju7tXdxhS/DWUunYW7jpHDM97o
	 hqovipRRekZQeyY2h07ivTH4KqOkj9VTORUFuavTZxJ61megjIp2Yj/ryu3mmUvVL0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4skSwwjgJ+QuhFrRzKzpNL0Sq3twAwTkr7WjFcD+3dw=;
	b=JeUvFmNcu9nsbfhaxuVslv4wv5PYcprJxg25Nw8rfS/T3Ex5lgoZzSXrO8f5sWeAIwNI
	 KJDqndWFpItJN9QNYqaDTE2i4foJlKTWefACENPsDgHdM9bWPZcKj1797dXOnIs9gLPbZ
	 z1XQfyPcl3iy1yCO35uHx1ZDTgPSrZgNhuiFCTbbhFFMd4kfVOvk1XfItr8zJnfC6xi2C
	 ucrX+cA61v4PaMmX8oLMlJgrheBzZExZbJ5BVMSV11nX9m5rYzzeoJmYUKmbDHAS4s3iJ
	 i7zWwatOWkkE887H/0ZySHspkgcqD3xjoUC/MhT8+tySt9UJvO3lZqgHbMtjsTas9qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=X5H2WDaB;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AD2606A33D
	for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 19:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94AD2606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=X5H2WDaB
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so64786f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 11:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794942968; x=1795547768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4skSwwjgJ+QuhFrRzKzpNL0Sq3twAwTkr7WjFcD+3dw=;
        b=X5H2WDaBLf1/hp+ykf52OANmdNHeqPeAyMLtayjxq5QX1nmrphBnes4VKPPkFCrHI9
         1SDoss7Zk0PLk9qnjfh/2nVVRBz9FBcDmRshmggPBYUhWKmp9kvN+3NiZ/Ofnhf++Lg/
         F1AqQDRw5bfotsGccqFDKFGMlJFZmxTpsjCUaBL0ZUagR1Tk+lrhweaKQjA0eDRpvXVt
         k1OxXcEKFPVc+PBypetO56RMTXq6lpYmhHCBOkqtN7NXq6hNBD2KdqPiWnBR5jT7JtV1
         u6w8cDUa5jaDxMlv1/Hb27d4petCoWRdTn1EkYZeEmk39dZXAWVhlSdvKe4zuaXdHhtf
         XRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942968; x=1795547768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4skSwwjgJ+QuhFrRzKzpNL0Sq3twAwTkr7WjFcD+3dw=;
        b=vAOANuZslzabhePfBjw929nrc+TOwYPPgkuGoWHH7CNgW1jvgxXTmaIy6IRrAOrqpM
         Cd7K+wYaYjD/AzAwIkXhj0Yuy9tuqL18+o9wHVbGbfqc+wSozl5gsbGPSZmh3nRb92pG
         aVkZ2JR5w4YdU316WGl6LDpebeXksMCGuOdrR4BEH4iiHcBzvPH+rH4n6qUBGy0WUIzI
         gVTN3E0Sult+XxhzzuIjRGgWfGAnSoMb2svSEFI0yqfyNjUWkZfWPHuF732TIgCjiYqk
         Du48hu0j2BepUKjKUV9W0Ixk1+C9tguPjT5XcgVdOs2tCEThPleElDcSwrRqC2fsX4xJ
         9taw==
X-Forwarded-Encrypted: i=1; AL+hErGPz4+zoNbSC5i4We5XIvlGRzXmQbLe/1oHKRXSGF/BwHhutfvPMBpFR/k9RSUUpf6KnZsocg5Y/9w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c2JdpTmAUohv3sYnvXeNpwWtnmP7dYoJiPo4W6IjqjgbehCtQ
	FEDdD+q07abbkYemmcAOWLj/MN7ahIfinIpWEFDp1czovqQLLVhzdZKPh+ROYkBbNz8=
X-Gm-Gg: AYBFou0vNhLR8ZrnvoUevPzpBRfqOkXRLkQKZ4usAQlOcFci+zlxWAgQ7KOmMhG3OGj
	l2k88+MuCflWxPQGtNRmOLi7n1z/8CZ/xd0b6yihG9RHbsqf0+11k3xjyTfXlKgHfV9t2v9bLD1
	0DFDuZyZtLAMmVgpIOCDmupYfOGC/Je3eVY6uda9TWN2q+QGGBQvxSYYL77q9XDyWKwiGKnW1aF
	6qFHZ3hzDTMr4vwsceCx6IedRQIbKlT9/TdJzwOXj3ul8GgTN+6WSrI6tATAL+mpnVwXXid/5JX
	KuLGJJQAsJj3sEnPZuablyhWEV5idUiyN5Y3A2ykcT3RPpR24g61ClZcY900wo2dZkYx+5V0MiH
	m1eBrpb269ddEAzOq2iUg4huOQWXEGSjMWO8Af30upGmy4lwC4s4Y1KzQeDn46uTZwHMctAQ5dm
	kGa98e/Zj+ZLtVw2/mn7RyptpFAbaZFicCQMyf1RWPzE60QrSAJZ/ZIdr8j91J/XCL/2y0UjzGZ
	T2H1upIg/aJdNTzhJuH9wEuIJGvMkEcZ0GXaw8zLHyHianN5KiqxFYYfdeEt5T7waiBLSP7h+1h
	P+XimFuDFPQAmi7apXG3/2iRZJmYycbjXqVZr7f0ng+eeF8M/FoOtEX87mRWVvxDo/et7s22wiD
	9ZA==
X-Received: by 2002:a05:600c:3509:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4bb7d5d66efmr3616445e9.4.1794942968020;
        Tue, 17 Nov 2026 11:16:08 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b8032sm5658625e9.10.2026.11.17.11.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:16:07 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 17 Nov 2026 19:16:02 +0000
Subject: [PATCH 1/3] dt-bindings: clock: mediatek: Add MT8196 PWM muxes
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-mt8196-pwm-clk-v1-1-d8725bcea9f4@baylibre.com>
References: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
In-Reply-To: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Laura Nao <laura.nao@collabora.com>
Cc: Chris Chen <chris-qj.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0

From: Chris Chen <chris-qj.chen@mediatek.com>

Add clock IDs for the MT8196 PWM source selectors, so that the peri_ao
clock driver can register them and devicetrees can select a PWM clock
source with assigned-clock-parents.

Signed-off-by: Chris Chen <chris-qj.chen@mediatek.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 include/dt-bindings/clock/mediatek,mt8196-clock.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/mediatek,mt8196-clock.h b/include/dt-bindings/clock/mediatek,mt8196-clock.h
index ae0946ab7621..a8008fbf1713 100644
--- a/include/dt-bindings/clock/mediatek,mt8196-clock.h
+++ b/include/dt-bindings/clock/mediatek,mt8196-clock.h
@@ -290,6 +290,11 @@
 #define CLK_PERI_AO_FLASHIF_DRAM			31
 #define CLK_PERI_AO_FLASHIF_AXI				32
 #define CLK_PERI_AO_FLASHIF_BCLK			33
+#define CLK_PERI_AO_PWM_X16W_BCLK_SEL			34
+#define CLK_PERI_AO_PWM_PWM_BCLK0_SEL			35
+#define CLK_PERI_AO_PWM_PWM_BCLK1_SEL			36
+#define CLK_PERI_AO_PWM_PWM_BCLK2_SEL			37
+#define CLK_PERI_AO_PWM_PWM_BCLK3_SEL			38
 
 /* UFSCFG_AO */
 #define CLK_UFSAO_UNIPRO_TX_SYM				0

-- 
2.43.0

