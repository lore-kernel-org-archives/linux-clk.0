Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE0713A247
	for <linux-clk@vger.kernel.org>; Tue, 16 Apr 2024 15:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713282821; cv=none; b=qHLRlhc0el6aug1bdT2aRnyh9N1ugFvMtxVLRdGddrs8c/i+E15TVNJpOxw82dRgA99E8MnnAiOACktqA8kCk/tIRYpXn8vU17KyOZ0CMK6dL4piq14AoZ/vXRXEO4WiLVj51odl5nqN/PYorHcKwZJO+LyX29UcuXFx9xiCvF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713282821; c=relaxed/simple;
	bh=f9Dg3+1sA9zIqMbmOSkIqYRfnGnKgRgwjxFViDKWg4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AYp1AkvAUHZbd2FuAp5QjY+iC1Hd2ZMoewaNKlVoORzpIL745MffdIPoiCo5wh+9XR32p/Ew+SHqGbfV2yNboICj5MnSTT+9N0JwXJ3J+6jUD2Kn1oYCUTY3aah9qOAtUi+NNUk0mXW+tBxKIcL9fKUlEvA8NRHy2/iPKzXOomU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=N7hsaFxW; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="N7hsaFxW"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a53ed18f34fso237108266b.0
        for <linux-clk@vger.kernel.org>; Tue, 16 Apr 2024 08:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282818; x=1713887618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMzjdnJXuF3c5mxPh4yfDUlaYNvWD0FrUY1FJvWIAwc=;
        b=N7hsaFxWmNBxxA0OyxCT18oZaHku6KCyMzh7udMqADYo74Y6M5Kkf4CkV8EtDneMWL
         7e6m3E4NQiL3E0DcW7EPVMSYnmLhFiEayzbPSvSmIQ9RZ/vas7HjjTeV4ZMeaXlngKpj
         ffrTCgWgm58tMXEiQLSSDb2+Vo6A4kbSc8kWqBbyAEMmZv2hHGTibkR3ot4JOGtbpx43
         KRFYdL/pOftl7HkQUdKkV4yDg4jFLxeBd1TPk5HZk66sPHkhZBDAWLYR1f9AOVrzsu8q
         ZDlKxI+uaNHw0l6Fuuz/ZKoaYGYnqcgOVan2jHpt9tvTqOsrKPoyVy0JQIwCjg1c00za
         LOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713282818; x=1713887618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMzjdnJXuF3c5mxPh4yfDUlaYNvWD0FrUY1FJvWIAwc=;
        b=BuLizojA3M/7HWdojJ/4P/Sz3DD1rgg2bE0eWO9xYMsa+YSTAOBVoy8WsCQ2anA4q+
         Jrze7uJMH2VjQJ8t+D92pZntPId2R0owM9i6A3D0EUaZctF1KleXIkFt/5eSICWpuQ7O
         ZRQyFuS4k3DFiCy5dJ2R2xkh6Y+QvvLigEthKdLvhusfz1IOT4KE0G/ac/GyyzNQrY6E
         mvQT0BpHcOIDecsq+M3slpn12W/TBpB70b3pbpB2sR8WUakzphMKBJ6LBXYbfp57QWj/
         hBAoV+o+2EhT9rWT06LPUdg9n9xFJOBLfQTfl1tKheh/kaJ4WW3PqnpGqPcOPw9PzI0Q
         sTsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMhMimwRDeTRpmSkUZ3dy13CEhtn8prgnXESf6yxxiYPqDmmOjEhu4BWx3ncPBFuEh+Vkz/4Y50oET0GE5bvebtT89cE7AYFgE
X-Gm-Message-State: AOJu0Yz6XwwnJWWChlpycz3ucUoS2W5krBP0zWoIw6rHaqzrfY6WfBVm
	vd6aA69Guty7LA4HsrQFsyYLI5AyAz5nH1s9E1jYBj3sqxLH0sfiTTJdRySgQek=
X-Google-Smtp-Source: AGHT+IFk1yoWGLqoBymQWKpJEhd6iWeTqSjELga+zlWWHUviknE2SG8H+UAr/d3dYsubXWOrLr++WQ==
X-Received: by 2002:a17:906:48ce:b0:a55:339d:bd20 with SMTP id d14-20020a17090648ce00b00a55339dbd20mr3437290ejt.51.1713282817957;
        Tue, 16 Apr 2024 08:53:37 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 08:53:37 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:13 +0200
Subject: [PATCH v2 12/18] dt-bindings: pwm: mediatek,pwm-disp: add
 compatible for mt8365 SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231023-display-support-v2-12-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=f9Dg3+1sA9zIqMbmOSkIqYRfnGnKgRgwjxFViDKWg4s=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7qCtkudbE2FgoQGnKNS8vlj9WP5d+Q1enfhm+3
 WS7W4ryJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURauREA
 C8elBHPUwyryiqhU/JftMEstWEhAI7HacOE+GjDLuT91DQoGocSdM/By6VXYsbFsuP3J2Exczi6frz
 ba2GCWSVUwiLb92u1hQpINL7ls0qmmh0r7yGgl5HnwjxAX+Zg4C8yBRoPI8RVLyfU9S/r3fPMRYni6
 Wpr0HozZOKrEQ5d0E7N2R0yj8mjdbLL7woEJYhC0OB6iOVGvyfeJqrSAD1z2BjdwlAlogg6zn4eWwC
 /asr3730Ub39vA+1gIunga8bVsoqsBzHP2xH2WIsGpLHvnHuWyGehFvyUFRY/VhKwNk/myhcyGWAdV
 Y7R57eYwNSHunhPoPnXrH+s5tGAIXqTHmctxoTL1WEd1ASFeCDB4fTxebJYFkaYyULZiWXDuE9Dt0o
 9eLZX9QjD3wcbt6howeDIggSZ3VAY2T+cS0ibSSqBOLMtALjTGE4VHqb1dD/xA2X8dTwyNeNL6eLsK
 MlNvds64Wab3wKigMbpCRWW41CI+jbomgQENOsjcrkA63E7UwXX9i3CWKbIFNn7yYXRnQtF9/ou9oB
 0/4QjL4id4kIukWNLEgjLCA0Wmwdp+jELa8HzLKgqyT13FBTs4FIX/w4if4EN86mMTaKGGznQSt+cY
 sIxk3H1lFvV+liAj3rGgvXTfPVUrOH+OqtB1mIROI0BYACxwnQsLCcUCN7cQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Add a compatible string for MediaTek Genio 350 MT8365's display PWM
block: this is the same as MT8183.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
index f8988af05287..180dd8366935 100644
--- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
+++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
@@ -31,6 +31,7 @@ properties:
               - mediatek,mt8188-disp-pwm
               - mediatek,mt8192-disp-pwm
               - mediatek,mt8195-disp-pwm
+              - mediatek,mt8365-disp-pwm
           - const: mediatek,mt8183-disp-pwm
 
   reg:

-- 
2.25.1

