Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565206;
	b=S2VN5NX+1ysrt/cD7rn2qexscVv757kLQDjfTE7Hx9tOuR8cOsHVSbfpz7zeOS0R+wrR
	 6f+XzOb/QoeawAjpNpBDF7Ub/xb2VQUIMbPghJ68mh2oBVXTySCkz/gcqRSj/n9f7gluP
	 XI/ZySJN3MpTyqzXTFOm7oEdcjiPOQdmiom8b3/wePX8ei59BOPyQcc9WfhUKfwcEZKPc
	 ZrrRAn0rOb16rY1ozV9uYmasTxvKcauEffa8/I8moSY34ygfy6ecpcikzst94r3D12ze5
	 BYUFaBJbnff9FJpN+hBsuZWxIPsfKYEWDwu/MbAoCAmIcqj77zOrpg8bDPfuGeR1/fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Q+Bz0VKoiK6RD2cJswo+cvuH31ipsGl+WNFDwagvNvA=;
	b=xZgATYU185QsS7Fo8PIGup10qJcwM5a929Ez+M0CWQNdYN4xP32qf2yaCsFpxdqpUD02
	 1HzxeiWgAqtSNEZPPAif0gQOBYsWOjPGYKRODF2AcIkTniVkEKnuUGZqGqJw5dUUhieLE
	 7tcQ314KlVBbGwyJhLhf084WCXQTzerDBFuDO2f2bMetLkSyI6jP1of88NG2h+wiW/C9D
	 lV3jpHRe7dzCzpOfSGCQVXVVfH5Lt/jIIiOYIq6LbHdCOGL9FBLG9oKGSHUfxP8CcTzf2
	 zcS8iLyWHCueOub9WlSd+CExrVVwzOKChG22F0yz0TntR3sJr8l/jxjVn0MVVpCfPTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="TXyC/36H";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26385606A687
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 00:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26385606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TXyC/36H
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3866a784546so6816058eec.0
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 16:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795565205; x=1796170005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q+Bz0VKoiK6RD2cJswo+cvuH31ipsGl+WNFDwagvNvA=;
        b=TXyC/36HfrOvLWoyI8DqOI7OLOp3GQOBIz3kN6GF1wGrkIdv3iBBhqcHBRmcl6G4Ps
         LhZ+8mBlicdnwE820z2jq1yHE7ngXWdAY2YvDUo0+cV3l3MSa7TksytvkiDH5uLp+0ll
         nsWBisS3ZIeC8hqIRaAcFhhA8RMXWRdSuZ2Gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565205; x=1796170005;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+Bz0VKoiK6RD2cJswo+cvuH31ipsGl+WNFDwagvNvA=;
        b=jQnGviH94bDqladfbiKMfjqx4uMlAyKB+n/LY6l2JHDertDICWjw7xFXOY0IpHXH1N
         GGSnopA3rBUGqUl2m/DG8KPe+2FEtxYUu03lR9G4q/3cAA9pzYVvbYLDsQfZMbw1JoyH
         E4etrszbStflK/P8n7nJYfTIkL9i3hLikNk+G+v9ZhukWgD65VImo+/JMsLh0BK7zLas
         lav5F22odAa+H9xhkgv86ArEnBrcnLji7Mh7x8yKZlgcN02wZLZptweovkjHqkYlxJe8
         mXHFhmoSrqSzANxHS+llb55DHXvJ4bVjlz8TF5f5JB/pxDbRIcZVGzBJx0JDKTqaE4jW
         w4WQ==
X-Forwarded-Encrypted: i=1; AL+hErFAiFEwZUW+GaelwZCB7yRazxSgIeLCA+Uc+UnYRhL4DSnny5nmjxbsYRx0/UXczahuXJ7GjJMQKt0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KAZANxlbk+oAMO8GxEFbTEPQMqWCXO9KVuiEGGmWBSF7VUh1+
	jbYCOayCBbORMX/GZrMY9u+pTNJAIcUm8e3tme9F0tqfZhcrqxsUTV/Qzox3JnEBVA==
X-Gm-Gg: AZFdTZeeTwFo/ksi2mSYx1lmLVw4/BnM85iaeQWtI8/g0VQglDMo32g7rtuFyGcI6l7
	G82T3GgXdXf4kJTwyoVsY84DkjTwBG0X58aMmrZ1QMX/Xlox7keGa4LKLvyVtitZb3ulzwhEtZf
	fxQpW4zoCYtRGpLGCNb6IU6QxCcVBESohGV0TbbN/weZ3hdFRy7KZUtbDgi5KTJOrQLhr5fCGWl
	Yex/6jTA7GkkGUKTaROKQk4aVWRVH0xTHLZ5xf92+/vf8XU/FOoCU+5qNu5WmDLnYHwXT6z0AK+
	v4+U3G4j3pRQMkkflOJZt1C8keVwi7X39QQbBBQ9GTBWp68Va9arQBSUO9EDkV/hPnXPPE0Y5gt
	pKI8Xu/0cJzosM6zujy6xG2bGL6gHRG2YNg0kvHig2HQ3NqhgPZGHC5Cn0pcv/6H3vi8aczVMP6
	Xh/6370VKsnzA6xlBqgB4RsQXITzOcOgCXLn8DJfxZ4dieY062rtmw+Eu4w54QSyY9R7rgvVXsm
	zvvYBsQkxM4L82goQ7vLezUaJAFUc8YPdaBJMsGKOtMnFLvTR5Kj8A0O513M5uOuHzHHd+DHB1W
	1K5raRa03wStpbBqv0AxxxwtWJAiWjM2GrmAe5SQVCBrEa00jX/qTnd9wE7d9meGwg+8h5m9QrJ
	mTnyDq98fptA9rg==
X-Received: by 2002:a05:7301:4201:b0:385:b8f4:755d with SMTP id 5a478bee46e88-385b8f47ad3mr16518134eec.20.1795565205307;
        Tue, 24 Nov 2026 16:06:45 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-385665f21aesm59676267eec.4.2026.11.24.16.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:06:44 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	linux-clk@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Mariano Marciello <mmarciello@google.com>,
	google-soc@lists.linux.dev,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 9/9] MAINTAINERS: Add entries for CPM drivers used on Tensor SoCs
Date: Tue, 24 Nov 2026 16:03:43 -0800
Message-ID: <20261124160343.v2.9.Ibb4a0adecf127291198c372da631ff62b483a795@changeid>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261125000349.3385325-1-briannorris@chromium.org>
References: <20261125000349.3385325-1-briannorris@chromium.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Google Tensor SoC known as Laguna introduces a variety of new
drivers, with Google-designed IP. Add entries to the GOOGLE TENSOR SoC
SUPPORT entry to cover the new drivers that interface with the Central
Power Manager (CPM).

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

(no changes since v1)

 MAINTAINERS | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 84b47bbc0d74..ae2b8e8e004d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11509,18 +11509,26 @@ C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
+F:	Documentation/devicetree/bindings/power/google,*
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	arch/arm64/boot/dts/google/
+F:	drivers/clk/google/
 F:	drivers/clk/samsung/clk-gs101.c
+F:	drivers/irqchip/irq-google-*
 F:	drivers/mailbox/goog-mba*
 F:	drivers/phy/phy-google-usb.c
+F:	drivers/pmdomain/google/
+F:	drivers/reset/google/
+F:	drivers/soc/google/
 F:	drivers/soc/samsung/gs101-pmu.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c
 F:	drivers/usb/dwc3/dwc3-google.c
-F:	include/dt-bindings/clock/google,gs101*
+F:	include/dt-bindings/clock/google,*
+F:	include/dt-bindings/power/google,*
 F:	include/linux/mailbox/goog-mba-message.h
+F:	include/soc/google/
 K:	[gG]oogle.?[tT]ensor
 
 GPD FAN DRIVER
-- 
2.56.1.831.g720f3f5937-goog

