Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5F13F9F2
	for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 17:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706550435; cv=none; b=ookd9Rt9huP8wLVZR/7jmxFu9YIcp+fKUNFHvdyO5BwWu5Zxh0NxIUIW255DmWduWpdaizQTUufhmCJ6kS+8eOMZ0WQg5PI4nATTuhlMKtp16SCXd+HJwGfipobNe7KZ7qF370OIhWhcu5JuLNNgY+C6H2+AcyoBfnPkaH+0v7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706550435; c=relaxed/simple;
	bh=EYbrVsBx4CczVTo2it9ewxYkNd2HjzVb5k8/lZR7m9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UwrL8f4wyWWdi3p2cbQTEtHS1GvxXHEJ7uvDGnmXBmyQt8vERJ7UOOOt7/SvYzrhHyIr8YJFZcjl88ASk+a1I3TH3OOYzY87CRFGkZ9Qj8m1sRve1f9H93sJ4DnoAsk7obdRpdF6/IMbbWeYJgAY6/761yZQ18PhfFe8SAd52FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rxVIC+S6; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rxVIC+S6"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2cdeb954640so41867451fa.3
        for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 09:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706550430; x=1707155230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YN7Q9lvRKaAglbSzz4YTb/Gj6CnT1pQKtP0U/KtQa4g=;
        b=rxVIC+S68AT1fvl5V1ayIIMhvjMfa6mng+JRE/W0XYA5mgI08ayOxwa/KcieAEedIW
         dCUN5gHEe1NqZehVJS0o3sTrbqL0tMbm3iyIrE+9jWIDZppb2md7tMI4JT24VL1HPsSE
         cnnXsouipiE3DAO8dxsaxF7LqN+I2KXBS7DnZ3t5e7h7KIEnV8kKVmVY6gRynW31eCTu
         y00IKgeS2lkyX1BAUAJ3JdLy2mq99FzSVn2DY/nW6KmRib7dlc2whIS9mBMbC81vTROm
         aVTHnVfL055blSYpTt0n+o2VC0ZJfHysxY6ExtD2gTWyYewUcSAo4AlgdzwmIO8RNepw
         GFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706550430; x=1707155230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YN7Q9lvRKaAglbSzz4YTb/Gj6CnT1pQKtP0U/KtQa4g=;
        b=CiS//Dui2evkn8EmAFWVMGG5w8iaL1cT29ip8KCidlviTAT0j8EGdLRipKG67B6sUN
         w3uLlD63DaSfxfvP4WcOJ4QglCABCn95Wcc5/LqFiv8EkfbVT21U9tbLUgLJttbzu/HB
         gJIvcIz4Icxr8UuAP5vjbOpRf5AD84spBv/qR2jFzlHI19QhYsrigguoavjdFfKB5ZsT
         a+JDIx7BRw6VGUWuPfpCSzkCieSx3hmdODZKYD6n4xAQC0vi262DPFlk+753pEWih2bf
         fLmCscfDI/CjxrxdSOc2TzA9S15mGa5uGKuoHfPTqYhQF0AlMf6L5iZ1boiZNY4jDkxQ
         dtJw==
X-Gm-Message-State: AOJu0Yxo6yx5EDjiCs4Q+9/0ppWgJHxSdMbhSN8mgz7yZGgMXTlxHT70
	EEk2pD7Cj28P4ApttNUu/hdzufcOtjNeip5ScoqTIKeOFxHRf/8PZYP+pEGfZBU=
X-Google-Smtp-Source: AGHT+IGGX12jefZ3ORpqP3WpoKoqBC3NixlOwRo4Dex+hqaEW+6BruXCJDU6lnoik6V45yxURorkPw==
X-Received: by 2002:a05:651c:1a1e:b0:2d0:5283:84a8 with SMTP id by30-20020a05651c1a1e00b002d0528384a8mr1574080ljb.36.1706550430239;
        Mon, 29 Jan 2024 09:47:10 -0800 (PST)
Received: from puffmais.c.googlers.com.com (94.189.141.34.bc.googleusercontent.com. [34.141.189.94])
        by smtp.gmail.com with ESMTPSA id u10-20020a05640207ca00b0055f08fa9286sm1000999edy.23.2024.01.29.09.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 09:47:09 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 7/7] arm64: dts: exynos: gs101: enable i2c bus 12 on gs101-oriole
Date: Mon, 29 Jan 2024 17:46:06 +0000
Message-ID: <20240129174703.1175426-8-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240129174703.1175426-1-andre.draszik@linaro.org>
References: <20240129174703.1175426-1-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This bus has three USB-related devices attached to it:
    0x25: Maxim 77759 Type-C port controller
    0x35: Maxim 20339EWB Surge protection IC
    0x36: Maxim 77759 Fuel gauge
    0x57: NXP PCA9468 Battery charger
    0x66: Maxim 77759 PMIC
    0x69: Maxim 77759 Charger
where the Maxim 77759 has multiple i2c slave addresses.

These don't have (upstream) Linux drivers yet, but nevertheless we can
enable the bus so as to allow working on them (and to make i2cdetect /
i2cdump / etc. work).

Signed-off-by: André Draszik <andre.draszik@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

---
v2:
* add short summary of devices attached to this bus & add TODO
* collect Reviewed-by: tags
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index cb4d17339b6b..6ccade2c8cb4 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -72,6 +72,11 @@ eeprom: eeprom@50 {
 	};
 };
 
+&hsi2c_12 {
+	status = "okay";
+	/* TODO: add the devices once drivers exist */
+};
+
 &pinctrl_far_alive {
 	key_voldown: key-voldown-pins {
 		samsung,pins = "gpa7-3";
@@ -113,6 +118,11 @@ &usi8 {
 	status = "okay";
 };
 
+&usi12 {
+	samsung,mode = <USI_V2_I2C>;
+	status = "okay";
+};
+
 &watchdog_cl0 {
 	timeout-sec = <30>;
 	status = "okay";
-- 
2.43.0.429.g432eaa2c6b-goog

