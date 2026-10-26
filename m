Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051131;
	b=uvlaR/FVSWAGVbadnyLxmCWMqBnE+C6mJXrrayYqk98DjMkYlhZpsSAcm65mOBA/YmD5
	 5TZPvLUH44906KM2mZ5+HmwBAevJhwRaKcr7TO87YsB/lnwhpPAZyfj8qFgxocG2nM5fg
	 oF3cP3WzyPKRgWXD0ZuTQ/mfzpg39OQV/u4zB9UXRIBlqUDCD+kAuEiJpllmX/4FUd9n4
	 CWvBVB1JX4UPHS7+KEOxLuyMqv7hilhHgx9Nw5rWpmjyD1Bq6/iopwuGHT+pYeTjHJJv5
	 G3JMuI2y3ghqhwZDrKT7vJ3FwxIFsk0M+y0Xx2hduNTW/g+yWDrR6oqjmi+ts1rY51A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RxRxbLBQ5S84nbJ2Z24j8qYmciKanlUFlKBok3xXqSM=;
	b=3EQ9djpDEF5AP+gXe+TMcFTnMSWKOebRzZ7pXZK/lx4ro+/AXA+YJ5d64AgxErRm9LZq
	 u5QUS8YNcMjoARlLFj8CSnlxV/OZE2qo+1Ov1bJwHPZDR561kteQXY1eDd0VbZJp+t3hf
	 mHqQxgb50/wIoUjnY4O8KJ//CyZUNMZMMBOHzGtRyU6Pa9H2PGsDD2vwvE+RqGupXMI/P
	 RivoMifWCUVV70WWa9XFfWiiaUJFnKorN5EV/q+PKa7oYW6a1/I4IY/Q2HoeiAaAioNY/
	 eX7ti7cq0MOzy5m9uaVOUaSr0wv3d9ghLBYXDdh5on5mHWkYn8gG+sgjeeIRBsZ3rhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M3BEGRGA;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFF860A2609
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 21:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FFF860A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M3BEGRGA
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-369f33df08eso3921598eec.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 14:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793051130; x=1793655930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RxRxbLBQ5S84nbJ2Z24j8qYmciKanlUFlKBok3xXqSM=;
        b=M3BEGRGAH/Vn2SxAJ2DzND9XWJaEthgW/2MXtbTOVBhxXeA9DgmqzFakwsDvTIr4Nm
         7cB3fF0bUrpubPo+WWG22t5+1qoyUQRWDdijeDyKfjB/xcFfTQSWEy42gLuAnCIwTIE0
         PBlq477/agmjQqRSYYXMAKswTErSit3gwmpSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793051130; x=1793655930;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RxRxbLBQ5S84nbJ2Z24j8qYmciKanlUFlKBok3xXqSM=;
        b=bxUs15JVaL0DW3Kd3XWJE1P3xyfr/MjFqudvdtrLlIReZUTDZX1OHX7s9DwtS9rr2n
         ouu9Mlnq03dxdR4v7iei49xmOEV84Tw3LAG1TMJKzDpx7Nb6rLAltSLl4qLPNxpLunFi
         W/EWZpCxrAweqc4MPukpkTUUv1sL/fq3MvGpsf9iU6qi3lRGcxaRM3pWPHuGCMim9bne
         rzbEwpobobql9u62S+Dku544LLhzz/U+c4z6RGQVf9kJBtMGdNy9JUxVIQehfrfA7yvX
         ouwdseARnHynHzb29LEBCGM+7ft7iIMN9DMxuNUWeC0/zPrkFBZJrfuRvCddUzuR47SX
         yQCw==
X-Forwarded-Encrypted: i=1; AKwUvBxJosSZtIxrMYVoHRcdpE3RYfS+qq/Tkz2pS3SfBPAV1B8rTVTvXBILDeaOm6711OhUF3YkYDJ7s5I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKE47o7spEHes0LYi76l9KCk/hMF+PGBekqux/LcTKaVK6kgVQz
	PzpF1AyhTIc7QTjJQijHegpAJW8sl8QbzgCu4te+dE0V5G+00Hyyy6PkFM5snrX4oA==
X-Gm-Gg: AYBFou0JMKumEoY0NgZWnMg7NZZC80RJ2hciqddvQbn7ZPC302EVGJCTzFu7rGky0xS
	7iLKty1UDfbUGyWAsU4DkEKy1+rDKoecfaewVIw2Hx+K8Ajw+7eCIX4P8wH1AgqxqAmjDFQjWFl
	alqYCF/SM7DM4Ey8VJxEJEtUWxkZg/e4kwgWQq1+fkFg98kZuyx8Ct2wCHoK76jSZ3igjtaarjE
	EfsqTife+ca6hk4p5EC8Qmm+WOuaaaJcKfUfI2CLGGbbyD043X/06dG72JbRbTIZLfziuFTN1/h
	/6/2Rfmwuqjc9FNs6hNB0kD4Fq+wrPmm23z+1zIcG2YLZ1Zy7VbIgYG7wKHQJ2gdfLIqMDcYM9v
	sD2oLUKg7QFRS+3zTKshwB5rOpFu22/AfVJQyZTc5djXywzTOJI04N6NXYqjSBlqof8UeeLit8u
	ZfWcXI6aMEazkSzwmN2MIlO8ekvehfEprBlhrHC+2UObsZnfk4jPYjuab1YfGTTD4hQPicBo/72
	6slFsPvyqTCzSS1+j8R+FrEadUUFA0OIV96DPLTC9/Q8CFcuMsOW0zLTXyQhoGqVF+MHEd/OgVQ
	c/VICkLcjgYLPIqrc9Q=
X-Received: by 2002:a05:7022:eb57:10b0:165:55e2:2d69 with SMTP id a92af1059eb24-199377d8c73mr12569336c88.46.1793051129456;
        Mon, 26 Oct 2026 14:45:29 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:79c5:9cd3:db14:7468])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-198a0f81ea9sm32064575c88.11.2026.10.26.14.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:45:28 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 9/9] MAINTAINERS: Add entries for CPM drivers used on Tensor SoCs
Date: Mon, 26 Oct 2026 14:43:47 -0700
Message-ID: <20261026144346.9.Ibb4a0adecf127291198c372da631ff62b483a795@changeid>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261026214359.3122870-1-briannorris@chromium.org>
References: <20261026214359.3122870-1-briannorris@chromium.org>
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

 MAINTAINERS | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20bd4e03bb54..c997d23e377d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11424,18 +11424,28 @@ C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
-F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
+F:	Documentation/devicetree/bindings/soc/google/
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
+F:	include/dt-bindings/interrupt-controller/irq-cpm-google.h
+F:	include/dt-bindings/power/google,*
+F:	include/dt-bindings/reset/google,*
+F:	include/dt-bindings/soc/google,*
 F:	include/linux/mailbox/goog-mba-message.h
+F:	include/soc/google/
 K:	[gG]oogle.?[tT]ensor
 
 GPD FAN DRIVER
-- 
2.56.0.307.g5fe7bd680c-goog

