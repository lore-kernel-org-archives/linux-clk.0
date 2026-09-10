Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCE848A2A1
	for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 14:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049823; cv=none; b=PjY3kRTiVzFTWbsR1VkPZsBDjDdcV6WpwE5dHq7330XAwI1OxSfRAphFRh0p4t9fQvRAgEbZ5lBvaTsKKgOfIP0t9OUHilNQKdiCnWTzqKexpB4zA5Ps41IDOdT2aMCT0CHysNDNjTFAsBc902pGslOgQcMw91YQF/R3/xX5A28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049823; c=relaxed/simple;
	bh=CjNNNaVv9KXfLBZwpOPF/OJsIKss3hZhjwJRSj/WrbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mYb7arwBxFeOFkxw+rnyXiEFJqrmehh0/oqCsMnj3JDnDa/AsNsOk4/V+qX9WUQrCB8gi82QiTTYAK0STjkV+FqBr6ZVSEpOqw91wmA3wJI4wiHBi046VtZunptGJt+05FmvD+fXM+3+VsUtJ8916bgXdcMW/M+dtbmjQ0LVuRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzxWmu/b; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzxWmu/b"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd6185db7so20683345e9.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 07:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789049818; x=1789654618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZNv1IJHXjclUxxs9te9sqmzRhOxAa9ASWy+fWccWYN4=;
        b=gzxWmu/bwG7kMmhfPbwGcJVHzzupA/7iTAJIfVa2xLu11niHy2pEnDrCxxUeN9JOMB
         vYDd2jMfzCYv1sTvsle4+D4rRRq4DnOv6PrM2iO25Yh4amp6ZsRxxt4Jz5PSoKcisqmp
         jBsYnMuO0NFa/MNaIsRZhMR1V46RdIv2/i2Pl6yd6rtpWZ+iCnS3Mr2UrNtNJF32wYkr
         VtWGfsDVEuGurmtzKyVebwJ6YF+obp89tJ8KBcaDBX4Gp1ixkZBtNN4BphUlN6jhOG2L
         P8qasAhxCIsJsHNLFdZunbFaduagVFH9OWB26QggwmjtsyTCOJzuP/hCbknXgyyPjbm5
         QfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789049818; x=1789654618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZNv1IJHXjclUxxs9te9sqmzRhOxAa9ASWy+fWccWYN4=;
        b=tTlUGs3HuJceczxZNElt1gNoCs9dAEkEYMZJ6Pa3mr6NE02MIIwbICfkcl0xT1Ga93
         yeOuqAKnqI05CgGtv6cJy/r+eMXRsHrwHFqy/mdevrZEoGLidydVWAVLypFJuAsujJS3
         aXNIOeuBrNNWHqihIxQEa6oAaQud6tSfX51+X7MO5C9QvkFLiaJeC9ObaUNRdZ7dhkz9
         dD0Jo2QLZgmmhIRhdvqj7rXeqPoFPikQDR1R8PIXxkipB45cec2VmU+lojDwp/dFJCI+
         39h9e0ctBu8PKOBTBOMZBvietDe+wS66I1uIwkbNevUBkIRaBt+QjBfTm4gw56RNhiT3
         okww==
X-Forwarded-Encrypted: i=1; AKwUvBySQARCSo70Uf3tgvyI1s9AL7hv32+TZl7/q/fkkr93QuHC2fu0tsRn/wKnMfFLH7fx6r0r3o1M56k=@vger.kernel.org
X-Gm-Message-State: AFuF++ltogdN0nfi7P9qVoCM8XsyoMnWSiH9lD+r5Juc0X8lR5UvP+Um
	p9H6H8bN6vtovO2vD4WnWhAhYnWt4YlUbVMsvL7zTL+dVUw121cEewUiiVnL8hoq
X-Gm-Gg: AYBFou1kvd9c/XPlr1IIg2U4jR9uFC3ivQwIKlCVewbKfpah1JFymn5QFPtdL+AC9wS
	y64/LXfMtxyW/n/7nUZk5p+GkgnO28nRN4uX4JIXmS4PEiKVb7pDFfgp3mi4HdnfBPmbZXZkdhN
	h+trKfUELcSJgrcb0wwPKTVSJYZb9nGI1txLEKOZNDEsUb3KNfmgRkKzOyrYRPiR9nXbH3qwLYS
	1Y3a/4hrzBHX7hgWqxicxd3IdFT6+jSAGcSq90+WEULKK+NJxCCQDMEaMokbIJ9jAsNcB+PAkmN
	LIWDK7MTYXJRSqk0brbX5S0NZ9MJWAoyeyiiIzfmdRdfTDYxOY3pA/JxPwmj70zgCpBLpkt/uGF
	D2winc6QkQxO04CTSRg3Z3dW8DJbrop1Dp73ND8y5qhuMOSC6gCCMEFYsogVQY3mT6ZWY1DaFIe
	rMC9xGr7THb0rVWM/a7qQSFEraBHVBAeqtJNThaT/ih+UM0hJruX7WZu0jS0n9tiUefePLEfFKB
	OLxzvaWchQR4YatJIHoSPvnJpoCpdWWKSoDCK9T1RyuyHPWnqWBlCDNUlTqL7KG5iXZUBaSqQ==
X-Received: by 2002:a05:600c:4712:b0:49d:2705:7030 with SMTP id 5b1f17b1804b1-49d270571ecmr49038005e9.7.1789049818180;
        Thu, 10 Sep 2026 07:16:58 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm293895575e9.4.2026.09.10.07.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:16:57 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 16:16:48 +0200
Subject: [PATCH v2 7/7] of: unittest: Test fw_devlink with clock nexus maps
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-fw-devlink-nexus-ready-v2-7-17ac82dbe226@toradex.com>
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

Extend the fw_devlink OF unit tests with clock references routed through
a nexus map. Verify that the mapped consumer has exactly one link to the
final clock provider rather than to the nexus.

Also cover a direct clock reference to ensure that it continues to
resolve to the original provider when no map is present.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 drivers/of/unittest-data/tests-phandle.dtsi | 14 ++++++++++++++
 drivers/of/unittest.c                       |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/of/unittest-data/tests-phandle.dtsi b/drivers/of/unittest-data/tests-phandle.dtsi
index eef966615b22..aaf0b871c01d 100644
--- a/drivers/of/unittest-data/tests-phandle.dtsi
+++ b/drivers/of/unittest-data/tests-phandle.dtsi
@@ -81,6 +81,10 @@ consumer-b {
 			};
 
 			fw-devlink-tests {
+				clock_provider: clock-controller {
+					#clock-cells = <1>;
+				};
+
 				gpio_provider: gpio-controller {
 					#gpio-cells = <2>;
 				};
@@ -90,8 +94,10 @@ pwm_provider: pwm-controller {
 				};
 
 				fwdevlink_nexus: nexus {
+					#clock-cells = <1>;
 					#gpio-cells = <2>;
 					#pwm-cells = <2>;
+					clock-map = <0 &clock_provider 1>;
 					gpio-map = <0 0 &gpio_provider 1 0>;
 					gpio-map-mask = <0xffffffff 0>;
 					gpio-map-pass-thru = <0 0xffffffff>;
@@ -100,6 +106,14 @@ fwdevlink_nexus: nexus {
 					pwm-map-pass-thru = <0 0xffffffff>;
 				};
 
+				clock-consumer {
+					clocks = <&fwdevlink_nexus 0>;
+				};
+
+				clock-direct-consumer {
+					clocks = <&clock_provider 1>;
+				};
+
 				gpio-compat-consumer {
 					gpios = <&fwdevlink_nexus 0 0>;
 				};
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index b739a69997a9..2859a44c3fe5 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -765,6 +765,8 @@ static void __init of_unittest_fw_devlink(void)
 		const char *consumer;
 		const char *supplier;
 	} cases[] = {
+		{ "clock-consumer", "clock-controller" },
+		{ "clock-direct-consumer", "clock-controller" },
 		{ "gpio-compat-consumer", "gpio-controller" },
 		{ "gpio-compat-singular-consumer", "gpio-controller" },
 		{ "gpio-consumer", "gpio-controller" },

-- 
2.43.0

