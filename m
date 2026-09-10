Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7030249BD94
	for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 14:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049822; cv=none; b=ic20gS3v6Aa5VYqYw5RCqtW8+CcVLX9hy/S56a3FJ9uR2zO6u0JoHJNYfJBTzHRsyYNPi6Ch0YUU/TNZ188WVIYqjsD6DDCMT44B3+OIVaXpBOUn2VIThHt4zWjDAEvz0z4uKBQS4pZBlK3twfOOSLPwVnM2Z+F6pwyCo/wgrBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049822; c=relaxed/simple;
	bh=xA45Y61XTBAgpBy6OAEVUm+aoRID/iBFxEHp4Q6aM/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KNpsV/5Zu2E9Bezq1BB4+fo4dImYODgZq8Rx2mzI0tj02o6zZ8pC71xBH7nlnDUsmeQECn2yojqNBpGJV/S2KjOYerQm9Mz/urhD2LplZGAan8WrWKBBp7z7XuCGqNV/zABQBr+8sQ/lkMrESxerAM2rQbxiPhtjKrMD4Gk6rIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQ9clEgS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQ9clEgS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso103364835e9.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 07:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789049816; x=1789654616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5WKuPMePtnop5uPfXFl1ahyGCh0WOUAD5jTxVfDVb9I=;
        b=lQ9clEgS3Tw6dpdrUNTsv5JC6Pv6Mvk1nNq1+006g7fVDdjBRc9cF6cNuJpQYuJoLl
         rsSoRZbq8pwaV9OLBVFVWFcpKIIlHlhUeabZaTRxbyBpw7bEx0wVcdFk7Xbb/g/1FT3N
         tt3VK4Pps6RhuxY+6CfCO1mKKkMhQ1YwDRJ+/MbYaa0sM+jzi3rhP85Ksy8IlsE+Fq5f
         CI4e/dE8B0UkoC8hrq3QiCc/nQTsgjn7Y7bKH+yphaUuRPRTHtXZhKfl0oitdsGRrECb
         /5b3fFheIcitWvRzGSxrP421yH48vIuNZAHXTdyoTNti0MlyJpbMuxw1RUqBpPgpUdkq
         y4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789049816; x=1789654616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5WKuPMePtnop5uPfXFl1ahyGCh0WOUAD5jTxVfDVb9I=;
        b=FsX2crNPZz/1XjFqaaprbLNDE0vEcMyiHo704Q0yPaRW1V51BmDvLbt2Tt643SMdOd
         qf+rGNvrJnqsKp2RQkDdESA6H3YQvdAzbPuSVRkC2a+V7yCa9GGYlhJmgaxrQCF8F3hD
         JRyqgSdx/sTtnPxZu4+tlC1H2uNs96LhXBEjE7Rq3IgvbNfr5ah8Y7QMzZH1xQHtCFsv
         MV+l5cZAHo/m4N4q1HwBIWq7KhqZVFouVaNz1WN484vTnkLEyZq0akySBE9IWhASTONl
         P5ItlovkEq9GOG4d0YSlADKdw5xUmLMRLrjOp2fAiY1Gl7ysklnAGdiza7lxLwdkPJVI
         EEBw==
X-Forwarded-Encrypted: i=1; AKwUvBxwTr9ZaXF1xvdE+LEfddvRlV+ICTkmziRIuWlPZSBJjEa9JDk63XkgvWcuprVBWZdv5ALS+nEYa3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lpZGOwD3V549eAOnW8JMrIfBrMMLhRuHKFGJitqtcZXOai1hwy
	dTdEDTBkkTk8CBn+ohz7dP8+pJTdfPEmvdYfdNKI/svyAYoctcjXsQC+
X-Gm-Gg: AYBFou2e5zG1H6bOBAtg1YkqNHd2G6U0g77IezWhhan0ydr0i3bEbgt2sfxxXmt8SVf
	Abaf0MyToccsY524qTUVHNocYydPaeg2xcF9aJhYYJQYrp0i+bpz8xdRqHqIXrdBlEEUIjyk8zh
	+K/QkoN2db/mTuQHlTXMkTq9C+PrFdV0ndtomB3uv5vc2TEuqruOkWgggjFLDHKCo9jr0n7iMRV
	W2eLgfBTjrdVelSfBCrVCYJKNF7JURdduGYAP+kmg07U+9y1R14oL7NfCzVLEnF0pR5SzSzwoXH
	eib26i5JFnMT1JZMzT9KpPKSCcuEwEgZNXcm4yjv9rBGfAWcFRyDyraBh6lzFmsS2MHCr8w7LDT
	du/Ruh3ThCc6vKrQlHOoke/C2Wb3M0dAL5+ZDJiMMjTISYk18yDbfYaN13f/suHNPi4rkUUyygG
	3DNX7cLSvmTjBMnthOJ5GAsaogg/0sc5dx9PzjjtMlD5LnEkAdighp9Kprg1FlsVPeL7/K6IE3o
	qKHjgu9wykUAGG3aWbi310wG1Efmdz6CHln08LlTENcOpiPNxychz62lFveMv9WZHywBAqVWA==
X-Received: by 2002:a05:600c:c168:b0:49c:edfa:15a with SMTP id 5b1f17b1804b1-49cf826c5f5mr415258855e9.13.1789049816022;
        Thu, 10 Sep 2026 07:16:56 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm293895575e9.4.2026.09.10.07.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:16:55 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 16:16:46 +0200
Subject: [PATCH v2 5/7] of: unittest: Test fw_devlink with PWM nexus maps
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-fw-devlink-nexus-ready-v2-5-17ac82dbe226@toradex.com>
References: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
In-Reply-To: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Frank Li <Frank.li@oss.nxp.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Leonardo Costa <leonardo.costa@toradex.com>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Extend the fw_devlink OF unit tests with PWM references routed through a
nexus map. Verify that the mapped consumer has exactly one link to the
final PWM provider rather than to the nexus.

Also cover a direct PWM reference to ensure that it continues to resolve
to the original provider when no map is present.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 drivers/of/unittest-data/tests-phandle.dtsi | 16 ++++++++++++++++
 drivers/of/unittest.c                       |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/of/unittest-data/tests-phandle.dtsi b/drivers/of/unittest-data/tests-phandle.dtsi
index c3727ed15bde..eef966615b22 100644
--- a/drivers/of/unittest-data/tests-phandle.dtsi
+++ b/drivers/of/unittest-data/tests-phandle.dtsi
@@ -85,11 +85,19 @@ gpio_provider: gpio-controller {
 					#gpio-cells = <2>;
 				};
 
+				pwm_provider: pwm-controller {
+					#pwm-cells = <2>;
+				};
+
 				fwdevlink_nexus: nexus {
 					#gpio-cells = <2>;
+					#pwm-cells = <2>;
 					gpio-map = <0 0 &gpio_provider 1 0>;
 					gpio-map-mask = <0xffffffff 0>;
 					gpio-map-pass-thru = <0 0xffffffff>;
+					pwm-map = <0 0 &pwm_provider 1 0>;
+					pwm-map-mask = <0xffffffff 0>;
+					pwm-map-pass-thru = <0 0xffffffff>;
 				};
 
 				gpio-compat-consumer {
@@ -111,6 +119,14 @@ gpio-direct-consumer {
 				gpio-singular-consumer {
 					test-gpio = <&fwdevlink_nexus 0 0>;
 				};
+
+				pwm-consumer {
+					pwms = <&fwdevlink_nexus 0 0>;
+				};
+
+				pwm-direct-consumer {
+					pwms = <&pwm_provider 1 0>;
+				};
 			};
 		};
 	};
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index dfa3c885d142..b739a69997a9 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -770,6 +770,8 @@ static void __init of_unittest_fw_devlink(void)
 		{ "gpio-consumer", "gpio-controller" },
 		{ "gpio-direct-consumer", "gpio-controller" },
 		{ "gpio-singular-consumer", "gpio-controller" },
+		{ "pwm-consumer", "pwm-controller" },
+		{ "pwm-direct-consumer", "pwm-controller" },
 	};
 	struct device_node *tests;
 	int i;

-- 
2.43.0

