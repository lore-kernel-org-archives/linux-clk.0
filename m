Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291B81386B3
	for <linux-clk@vger.kernel.org>; Tue, 16 Apr 2024 15:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713282816; cv=none; b=jSiewvFD3ZCF52mQ/uXq1Fy/7hV3mERG0A/wqvJ9b5+qlvnsVG5e97E5Px7l8iZtCcOGuhlNWwX9RV5v+PqubUI6aPz1Nv5DnZbEUpsz103L4wi0RsW2KEkAil34jzio+ZSM7tnMS/roCN+tXLAHeHNVvOUS/OzdcH9lrkc+ZxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713282816; c=relaxed/simple;
	bh=+xyac2cFKfXL7SEy4I+ItDZmKjuQP6rtH9cJMga1OwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cTdHTbsOHo3EHEMZD6Jq4apqoEO0/SMadUpN/uQikc+96A+0EXIUzSwmnFhXKox8EQuy7e1QKHXOyP9+rnSvzHnQm5T0OR2fhpjOcp38lQSoS8UO9P0QRQ9M5sjMKN8yU7PeFvwds20g5COr3puTlCQ5KFjElei2ZOhGnhBgN2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=h4sfhO95; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="h4sfhO95"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a5544fd07easo117170466b.0
        for <linux-clk@vger.kernel.org>; Tue, 16 Apr 2024 08:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282812; x=1713887612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9UK/IswjdivlZnvlMzYH9SOhVxM/8lGMwpTnAVDf5g=;
        b=h4sfhO95PFSaz518nhptM7VlP2TdUsl42oAqg2HyM2Wa+bY087xZBBtjvSQNGZDqtg
         z1IAar/ykw0FoWXX0rgr1z4aiHsaxhWprIZW6aZLu/RMyfTshX/HJGtfzY7uO+nXRs+Q
         8U58ggtIMxZ5mQ3+Yp3JNNe4F7hR8rpPc9iI+jbNI8FKROSpZtEc2RquAAc34Js5arC3
         FFGsWqYkiiZ2ReqNzesTwZS1dnF+mliZMHlTbfqFSGYdpck1gglASBjYj7BRD+qOpSGX
         3HcJ87xpzSXEG12MXfgXs5G3sWUNCoa//XAGGY+sO2cl6rZS+tuKBLmXeGtkD/cYNQ5f
         gv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713282812; x=1713887612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w9UK/IswjdivlZnvlMzYH9SOhVxM/8lGMwpTnAVDf5g=;
        b=vfqPgRcY+u82bNM7MP51tPv21GwuKbPsW5pGuK3kaY0pF336QT22n8M0ivymBdvkeN
         PK/LoFrIb3AhuxbzglCzvrqgjL+K0/+GpSymJVoDQ22iuGdr3gb5KLUyMq1oQ1Com7hq
         dZM40QWSUcq+hzGh94vKX9oGywh2BoxKXLBjKgDlArimfvYBZExdiT81cvXXPLT7e97G
         PES2zH8c1B5KpyxNvIPyBvPNLz9XkIC9epBtwhwWb1FqFiT0rKalORg1NLVJZmQbEYuX
         9VlKh5d4Z5nawbqvGyZev2rq+OjhJWSM6AcLPOF5jmsS212QBLoOnbY0h8vfvuyYtyyx
         TmEw==
X-Forwarded-Encrypted: i=1; AJvYcCUqZfIaBFDscS9PchPj2klxAZ8s6KLU0AHM9/uJuKep7Z7MBgn3+UA7Ylxe5pIZ4RTYMKKvmkJvqT3ytGuW0+HflYcLBW/fYtUT
X-Gm-Message-State: AOJu0Yw2ySARqS5AwG1PjfqPS6WFSSgL7UEoAjyBw+EskCzTTknwVumK
	c+w5nTY7FLjakUWORz9xVxChTxIgZmQ3v3QyAnTPiXw6mA4iWmbTKRFjG0x9Rl4=
X-Google-Smtp-Source: AGHT+IFqfbM8k+GVv1bZnKX+bAKFMvQtDXmkeAj8oUzOTJ47JyZ+JLjUDqJoEtJaYnagjyBvM5NXLQ==
X-Received: by 2002:a17:907:9284:b0:a52:5a23:3c2e with SMTP id bw4-20020a170907928400b00a525a233c2emr5917386ejc.43.1713282812609;
        Tue, 16 Apr 2024 08:53:32 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 08:53:32 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:10 +0200
Subject: [PATCH v2 09/18] dt-bindings: display: mediatek: ovl: add
 compatible for MT8365 SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-9-33ce8864b227@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=838; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=+xyac2cFKfXL7SEy4I+ItDZmKjuQP6rtH9cJMga1OwE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7qK/cbddaKH/+p1Qdvx84jOYg2K1vzKIKSS1Sc
 x5jA1GSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURXsMD/
 45ehwMPBNwK+gMcsfnl3yGkL99YxRTk53D4gBwYrurtTfGf2jISxnqikQtv8LMasjLeJ2JlfjLqcjD
 6M9/gRGy5p/ulWRftZOocYZAbWH5YQPXj7PRy2syaxBdVRtP8O61fsrKK8ikvXoMxKpy8WO1Bsjq+j
 5a4MS54/0kcznLZwu4DeEsfvSHjRYdcFnxTQHYeEYfZN1FxgRloCTv7hSt5AWNfj1K427zimu8rut9
 LpawESAIs9cC9jAAJb6CzhzoM41a2VBav/bkCfKGH9tIb6wluhbluz9HuboIJBsp2YEI9YUF17HiF/
 iiX3j0ENc+L8GyCudQCoTfEHsIHCJmH4I3hBQ5ObScyO4gJIlv4j/3CFusPtN78NiKzzyHBZ0GEjCu
 pBvRBJKoitIGIpwsVxvA1vwWQ2S79mCzYXUrL0F+mMAEl2MZF20fwk+CiWWOkgNDEwrTMz4SCqRNaJ
 sts6N6qibOFRBAqGK+cgzlfKUBe1ppDKAQznI7E9nL6K5JxT/jgpQJZE/ciL6voSGy6IdzYPzVhs2y
 /F+i5IoK8IPqcXrXoEJd4JJeqs4hwOmwc8AmjfsSE9sZPjF0ZEmWMf39urMj6gU7tBlPgdWCtOiMKm
 BUFtMqc+dtHiEI15o4TKWJt0vr9hOJ2kYXhJA77T5fRw02DbDNFrEE5u6s6Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Document the display Overlay on MT8365, which is compatible
with that of the MT8192.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index c471a181d125..d55611c7ce5e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -44,6 +44,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-disp-ovl
+              - mediatek,mt8365-disp-ovl
           - const: mediatek,mt8192-disp-ovl
 
   reg:

-- 
2.25.1

