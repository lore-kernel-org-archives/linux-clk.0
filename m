Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FAB3CBE9D
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 10:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865713; cv=none; b=s2LvYRVlhEBIUPUdAY8DksmuJR+hdKYtwPJFt0dZBmAvlLzjIirmI2jbZiQe1ew3TB8iWvkL4VZdyStrdR8ePVuORYVJtvDbUFRp2rUxuQNm83iQO+X60Zv4Fq5EcRJy0jsBzUJ/kNVNCxl5emxSYxFLh+rcUXcD8wSOP04sZ5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865713; c=relaxed/simple;
	bh=pGKPix7XiEt441lKBW8Y9b0Y9EmW4lxtf6JcRfDKsWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p0I4xfvRAeJGMaxvd8TjOfzVyBxlJnn1Rxhlik3g/FL15ONqqpSk9zzy21Ad/8CZqVOwBCqFHd7dq32t3yUiiyzEuY5+G/Dmwy3BBx6fpj8wrFu1NNoRUr5szJlwjeKCH3Hby1hyq5wvwRwRnQnSv6mdR5R/UmiRCttMO64nsks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sv0tyoy6; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sv0tyoy6"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-829781b2b01so2169473b3a.2
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 03:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774865707; x=1775470507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sH1ZtNzw7ASBY+TGObLJ+aQIZVnb+gkilqaMw0lmvhQ=;
        b=Sv0tyoy6y1m8vamSJhw4Y1e3YgyRjEkT6aEqjtIupF1eRncGJ1m4CAfs6wnFyn9Gww
         OtOmh+loTqGPp6Uf2BY3mAmt2v7yqyLub0xT6URbcQhv9szKZ6NwppSUMFpn1Q/gccHM
         36d2QdPbD0ljFLRAr8gQI/Nx68y8i9t7o4OrXNT0y4G7t3C35dW+ago9axHC9s61O5cg
         HhWqjl2uamszvzw1XKV/aTTsoPY95emUcJlXjBuZsAcJnOpw2A4bbVPAZ5whS429W5dl
         Z44tq/I6ELer9qPZDLqwAXH0siYqdx9aaNImzamOiweT++lvXGxwysmbf9VqQ7zKPaCc
         JlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865707; x=1775470507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sH1ZtNzw7ASBY+TGObLJ+aQIZVnb+gkilqaMw0lmvhQ=;
        b=p3yTzolf4JXxJq4jYllOa2BZ/mHVsNsjWcn7qQNHFUhc9f9j8/rjdELr/UJ54/TCrU
         WtrNF/Ve47sZXQL8nAVVqqtNMc/1xeLZ9Mrl/G904u5MHHNq4IuzSGokS9NVVat36Sp3
         IloEpFXjsOz9izhI7zzRQz0MdNXkepHgrI/udajJJOpQwKDf6Y5HJfZ2dMYUaRyGDxqC
         u1YCoTADkhiaPPkqB3qAsAkpcCJVOet8J2wbzj6GkGoRdPge7ljPiCWd8nd7aHj8/ao3
         OL2TdN0e9qgxhl2TTSgzswYAziUYW4xjLr7m1n/cPnEulSYNStdaOAiSJSjOP9GaNH+X
         wuOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFoJj7EgHI/vmv3lwqd0sIM5JvCMdhvd+icEMHgXE2aGsnuU4H6+w72iO23ylPADAWJCmHrftzTHE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3mN2aGEi8isU4xbf60/dEPnuyTDvCnOiayGAlNUCrdbFZO05W
	zezk20g+8XX3WTsQQEfxSzI8Q5xxUROiA6k75MUXW1fsDvoGhhhoVDda
X-Gm-Gg: ATEYQzxE8KJlymx1H3TPe83USJf9DU+6FJPXSEz9fSYpJtnYYLGPVqmX2BegaeQ0M/+
	T9vXM8XBaW7MmroIdxPRt4iVS0JBMZnPFfeCLFfq5upHXERdp5+bd7qyimioWmgeRpxlg8ZQefS
	Jvmiu4SADT9XjwGWXCTYNtx43kDFsRUEsfjwjOzXHeFueO1WpvkPgUYY+gaOuxrA893XHW3WnhW
	GNFnMWXii4apjXEarPi8puGEKB9PEJBc3op8dP9yomshRTRjpZlnGY1EaFcFWC+OREs5GU/X9Ll
	BX+78R7rBwBgly2DQfUCRF17OPyKEZwh3nDpER+KeVLWokb9BcqR6LgevBB9AljuMkEoU8DVnlH
	iDU0FJ3tix70RxA9EX9/hI7Ps09Tg6nvQfAagpZfwhLVPNvke6ojUvbS15eVK9SBLQdVZZFZtpN
	mETsoTMrBRtDm6LHlCI9leTS1OJ2Ox
X-Received: by 2002:a05:6a00:815:b0:82c:24d5:63e6 with SMTP id d2e1a72fcca58-82c95c23e4bmr11933168b3a.15.1774865707088;
        Mon, 30 Mar 2026 03:15:07 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca843d8e5sm8286080b3a.5.2026.03.30.03.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:15:06 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Mon, 30 Mar 2026 10:13:54 +0000
Subject: [PATCH v3 7/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR
 transmitter
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ginkgo-add-usb-ir-vib-v3-7-c4b778b0d7f8@gmail.com>
References: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
In-Reply-To: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
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
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774865654; l=1301;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=pGKPix7XiEt441lKBW8Y9b0Y9EmW4lxtf6JcRfDKsWo=;
 b=BedMsNwgLsE+aubdatQlTumTqlUwwOUjk7wfR9tZkRnU146OE2yO8K9gEHsRM59RMMzWQu8Bj
 xCT//XetsUpBloRKCMDWFBx1AzBe6tLOnxEoko2HAI/0xT5MzpYD7eZ
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

