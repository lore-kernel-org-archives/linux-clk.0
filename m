Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CE63AB5B2
	for <linux-clk@vger.kernel.org>; Sat, 29 Aug 2026 09:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787996887; cv=none; b=MEuAAKxyO3Gfwhnhvd/BCvHdfJDD8icDCN6I45hB+81AP865SNf+1VKugejrY+wyMi+G9gR0xpBYie028x9pFvg1F5MSWqYUQwl8TW3QYQa2zeTZV0877UPJgPv4YGvZNc1IazHZVsSlt0InclUdRZ2kzCD29uC7vs+9g+19k0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787996887; c=relaxed/simple;
	bh=uRkFH0DF+K2gkCSbCc3So4UXlflNMUCL+wxSJBWvLro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BsdL5EJ12RmCeqf7fUCLG8BN4NRNlPl09kc+zNJuKMr9Ip6Fd2xPppbwRhPyQcQWhn7AjiDzm1VPlAXKfAkFmeCbbvUPBORjDSgf0w+Mm37AOX3Bv6CwCQcJK7mLVTrhTcEBQ5y3Vdbq5zhNDuc3kt5vFN/OPa+JWFBIgYR4ZI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so12968675e9.1
        for <linux-clk@vger.kernel.org>; Sat, 29 Aug 2026 02:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787996883; x=1788601683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w58IcK8ZE/FUFrG95ZGCGEBUQTz0E4TGMIPiEQMb1Vg=;
        b=omdUYkWlhZINmwW4mk9bdbYDVWdrLcfXTRVYlBKExlbsqKkCmKE4Xbgn0hy9ltBPkH
         GO1KrDcOjtV0Fg/toOwwzVwRvW6qlMoZ8kKq9m7a8nzqm1DScJa+JUNYgFIc88zdtnXo
         BOQHtYibTzzLwAVHCzF55VdoTAcPxM0Yt6cPUPQNQKj+Uvh+8zk0f6J+LXtqpGopjcDP
         /Car+kHrKrbDDvprFXw7UpLYfHQRoT7aK0FcIyWrdgJIRu32vV5qiKIWdk5slLYOCrfl
         jmRXxt0Ez2oPnpXy5ZSeZkTb3RDGBsWY+ZxNWpH7XzozxHUFo2f+/KJ3tV35rdnPg1Gn
         3c3g==
X-Forwarded-Encrypted: i=1; AHgh+RqJTXEljOE71+zPz7bUO2bp43ihjwGrbazAo9C7OIQLu+s/4tmrI5Vsvjr0f5HSeSAS0y/6JQxqMZs=@vger.kernel.org
X-Gm-Message-State: AFuF++mjwcyG5EgPweJrrTVxAfPQNckgbr5MekcsvIBKgqvrEMHtAJ22
	Ne8iHIpBCFYvzQNM42thzzx7HBJaApx8o3Y1z8K4Y6GnH1C2NTe/3ESK
X-Gm-Gg: AR+sD12tsNichzazec4CS4mVjWdQnFhz5OHm4fQhTJ5w7HNDx2cSIjYJ8al4PBEl1X6
	rCJKlgvpwubrn/GqArwkPEkYQGbi6DnRYwBiUyTkGyexEm2DGRhpDDb+K3T3S3tF6yZpzo+Etwy
	2jj46zG06L4eWJXk1bdlJDBn9oGZVS3gpqA3Ot1tbW45p9TckIwJ4920QKDBuo+nMgaNw6jjZB1
	cOef2wzrMLPxWZyP5jSVoJNWwDqMR2PPInDOH42oHjk0ua2AYnhY7VMPul/nW1jVDyURBZZWROb
	hNfw+oJlLIve8Pk9Z81D5Ha/MeXDMpCzTJDfPItT+M6LsYRJouC8DJNnkD2+j/wPzhqwCv+Z5z3
	VpQ57elF48UUvo1tZmNJyMtOiJ6SsNNROG2rj/kocd+qkGrYPooi5wd63hGGz1J9KqzT5vf3TNm
	YDXZVqKRSki2IoHseXhfbKH64j20oNLPxeOp3g9rSRFMu1eMzPbMkzgMC/2373q2KjOoWO0Al6E
	U6TgNzW8aD/JiztrMSEshVBpMdCaocZv7SCJw==
X-Received: by 2002:a05:600c:8587:b0:499:dbae:43d3 with SMTP id 5b1f17b1804b1-49b91c489bbmr177775515e9.9.1787996883483;
        Sat, 29 Aug 2026 02:48:03 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20784sm9661562f8f.18.2026.08.29.02.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:48:02 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Brian Masney <bmasney@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM
Date: Sat, 29 Aug 2026 10:47:58 +0100
Message-ID: <20260829094758.23248-5-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829094758.23248-1-tanure@linux.com>
References: <20260829094758.23248-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vsync PWM output can appear on either of two pins, but the
description named a single group that does not exist, so anything using
it would refuse to start.

Name the real groups instead, one entry per pin. No board describes this
output yet, so nothing changes today.

Fixes: 2a2a7b9701a7 ("arm64: dts: amlogic: t7: Add PWM pinctrl nodes")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 8c4bd683cce0..719e111bc3dd 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -546,9 +546,17 @@ mux {
 					};
 				};
 
-				pwm_vs_pins: pwm-vs {
+				pwm_vs_y_pins: pwm-vs-y {
 					mux {
-						groups = "pwm_vs";
+						groups = "pwm_vs_y";
+						function = "pwm_vs";
+						bias-disable;
+					};
+				};
+
+				pwm_vs_h_pins: pwm-vs-h {
+					mux {
+						groups = "pwm_vs_h";
 						function = "pwm_vs";
 						bias-disable;
 					};
-- 
2.55.0

