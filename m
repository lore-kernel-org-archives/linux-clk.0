Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF083285050
	for <linux-clk@vger.kernel.org>; Sun, 29 Mar 2026 04:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759739; cv=none; b=TgiPOgoYah5ibMaRV8Ir0GmRxiIh+bu1dRHb5CSkn7ylVQM4sTTfa8dIHg24WkhUW12fVwmzE9X+LIVvbK++ib3wXczkZKXEkIYzFpCCLa0cH8Ezpu09qbsmedJN3R9Ivnmg1XAeCOvcAA10ULmpq0nQiHLTMXR0eO91g8lxESM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759739; c=relaxed/simple;
	bh=pGKPix7XiEt441lKBW8Y9b0Y9EmW4lxtf6JcRfDKsWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=itoU3rxTz1WBje4H7wzeZ/eLfwvfiBY/8LW96iQ8SGzHx1fv7b3cE6emvGN8v+EKQalixKJR9+1BwVePwZp6fYeBxuYoFI19GycRXlZsNR+NJ0QqyN2sBQNmmUPb75h5i9H/p9d4RxwvbVtqJvvUJbWopym3vW6ARB227sQvB4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pETnFdge; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pETnFdge"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3591cc98871so1475084a91.3
        for <linux-clk@vger.kernel.org>; Sat, 28 Mar 2026 21:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774759737; x=1775364537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sH1ZtNzw7ASBY+TGObLJ+aQIZVnb+gkilqaMw0lmvhQ=;
        b=pETnFdgeZDjhWJx7qdfn+Q3+x4F2R0sIk8fjtKm5gRbkSs9Z24WqpPBn9ub0yFhl0I
         DC6bIs8bmZWtmKmaB1F+lyqfJUApA5rZ4h5YiaWKtLcVeDdFm+bPxbM1W4nrAJo2+5EU
         w+ahwNwgmNWJ27WfRY+/o5xwrezmb69/virhHfjMG3mtbjGoSh3rJtqBxWTzsCKvbsng
         BLiHbk7V/odSxcUpiIyomaegBVI0X0pJSfoMOzPLTTczme0wagdbWCgznrIU4HEa+Lkq
         DPKWlzxNb5mF6f9Bx72TjgvWuU6lZ99CVqzYFgwqYipVqe+JlHp0Q3gEhgCCAFXhNmUK
         hh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759737; x=1775364537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sH1ZtNzw7ASBY+TGObLJ+aQIZVnb+gkilqaMw0lmvhQ=;
        b=TUnCejy4HUO4pu5c5LOjkssW5oXawL3E6wfjLfayv8vSIScluONDXtbfXsTiU+C6/e
         Q0ZweoxIPQtqi7EdydU7gZq1cn7KuDB8EUOPQlYOPmnPiAdCXMDfJ5PMhoXELGjZ7aTn
         B2s/vIpNh3pVgha1b1o1btBoqUd3orbGifY2wWH0YMBP4it/80jgCePiHeQxnxXefrKA
         2vAOSlYUQKQd5bROZdCmB4NYAQocVWwgscWZzL//JzQZmznRqXsA6ZB9nz1+1K/0RHoB
         hZPWorMeGrCiMisHnTT8/0TV0f+uTcj2ScSiLamYw1PzxqvFWkguTeMXYsb+q1BasYPa
         ROtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVGu+BEoJbyuGkzpa8y5Ae8D4Yp7i6c8zIm7bBtNQKb8v7PBmePdDwkqthcRT+8GeJJOZsZtqfiwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZZSJI7P1ibaOce0pKiqCJg7/WonuzyozAWKN6BBCe9UXmGFgv
	QGYA0FyPkdnCl+J5Dq7k9L+FLIOswpdIV9xXJ2kz0yUMBV8R/afWzWuZ
X-Gm-Gg: ATEYQzyC2cmpFLcd8mlyowKUpVudyNth0Klnd1BCSX3kJwHA1sURse94wfRuwKrgMoj
	IauI1cyUqR+5vTHEBXTuo4wCyr3u7dPE7N7SIF5EGPESAIerBxX6Y++ZrzjMOLJworb+5adCP8M
	WFkIbkk0jeW6+ylN/nBf/eHqMFmeJA2kodiPeHJCjT9a/3oPFXrk0xTC+eNLeLzCXnmbrEM/P23
	L359PLLM21OGTIaZJp630XSFmfH/hYCCXbNiFdTWJO4ppV5Pc8pS9TSiXgJyNv0ZPNS43ssynMr
	sBBoljt7VP3NZWzXKjkTdShajYee/uVeFfj065nQfFw/9I0mnQ+a/L93GbbiLDmz0ByG5c/Ipe1
	u0nBC+vdqZQ8UwN8H7LyJEKjc31WI9tgFF/9HMzE7o1M1ZBmYiDSJPwT6pvTEdhv5TN4JWgAp1o
	3TZ2skpIJHYBNOkYch3JPn16txwMIa
X-Received: by 2002:a05:6a20:938e:b0:398:a128:d463 with SMTP id adf61e73a8af0-39c87a3c214mr8660465637.35.1774759736982;
        Sat, 28 Mar 2026 21:48:56 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c769179e31asm2899739a12.17.2026.03.28.21.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:48:56 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Sun, 29 Mar 2026 04:48:02 +0000
Subject: [PATCH v2 7/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR
 transmitter
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ginkgo-add-usb-ir-vib-v2-7-870e0745e55e@gmail.com>
References: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, stable@vger.kernel.org, 
 Biswapriyo Nath <nathbappai@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774759680; l=1301;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=pGKPix7XiEt441lKBW8Y9b0Y9EmW4lxtf6JcRfDKsWo=;
 b=AjUWH+AdSOG/5ukRpNAwaXcythhtMm7E9TAuzpnElRgLKa+TAvWs+43AuNxf5Ryx8NJQ1jxE0
 4oBI9xuIcl0AadPRbyVh5WjXVeiB3FcSq+LKxcHqBqYrYdg9M7tkFIx
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

The IR transmitting LED is connected to SPI8 controller.

Reviewed-by: Sean Young <sean@mess.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi   | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index f66ff5f7693b..7d8481173171 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -99,6 +99,10 @@ key-volume-up {
 	};
 };
 
+&gpi_dma1 {
+	status = "okay";
+};
+
 &pm6125_gpios {
 	vol_up_n: vol-up-n-state {
 		pins = "gpio5";
@@ -160,6 +164,10 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators-0 {
 		compatible = "qcom,rpm-pm6125-regulators";
@@ -332,6 +340,18 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&spi8 {
+	status = "okay";
+
+	irled@1 {
+		compatible = "ir-spi-led";
+		reg = <1>;
+
+		duty-cycle = /bits/ 8 <30>;
+		spi-max-frequency = <1000000>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <30 4>;
 };

-- 
2.53.0

