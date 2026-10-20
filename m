Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501233;
	b=cJsrMabzSGblAUFgB4pj5zI9jKH/vZUazvlY58CJpNSP7Qx3YyBHCFEeOAhaT6YCc6iZ
	 LFcHwyo0oRI9HrhBKb3kE60pDqZIthblniom+8dZ2Y/QW1bic4NJxOE2BvN9BsTK729FH
	 OZYwz1vyFZVkyXIbrgKsPK9sJJJZlB98hG0gpjdWTNHMKjsbXe4uaMQ6EV1Ksn0UGIAss
	 hF59hSWTx31oiqEohqjFAV+i6POqw8ZeF25Rdc6B8F7c3MZkxgkokGsiP2iyRJBMCE2tb
	 5WmklWqglOHVTL+FLpcbLjZtCUXOCuWAXBm0KjEu38+in6fviECeRseVFRIEnuOn8RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=V5mXplAJ6XQpaLaAHpeez9TEYogaPUChaxNtZ24iXK0=;
	b=mD1EH4R32g4IHuKbpMXP+qljjd3YFz0pOnUlvIJRqzh7UnCzotN5ocYd0MFqD001qQvK
	 D/zjvUXwS8jA1mn9/LPUSXbvYbgsr4LViavdkU5Siq3+cf63/acQcpc8CgNZE9UYTNgIu
	 uZ0/fXICPcVQ5SANhGP7z+xdywtEDZ+oMdUnZW8UmxD0E18FtCMSWcV14kcpEpCDtZ7EV
	 tDGhYXOlOpFzZcrNjH75FYe6UoRnzlTmM8TRBqAdNHtaCio0en0W2em5sBspHzlYbNwpz
	 c/9w2/K3Mnj9jV1UxjwwwEHFtHGzHtpW3NgCOjt1n++oZiPARPShr4D0/rAAOluL2PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ecLSa4Oa;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27BD60A4AFA
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 13:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C27BD60A4AFA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ecLSa4Oa
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1606606f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501231; x=1793106031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V5mXplAJ6XQpaLaAHpeez9TEYogaPUChaxNtZ24iXK0=;
        b=ecLSa4OamAr1JXHnOVbC+LVGLjRHmAV5oQgnEndvWjkaIQemPKJRMOAcS1Dc/d3hIg
         beCl8Py+xnZ0AWDS/juvgzrRfx1cjCwOJrXwBpBUT6mnaGczVS9kPxNiayrdrswmRdCi
         IzdM7KTvmGYuFt7ylRcgODLLIFWn6YqVTxAPYE8r+BFkSYrMM9TBoqh8FIjzvigp5dng
         GS0L4w2pBBLKs3GZmHRz7vygWdyA4pG9O80y3YZIDmnb0ISvIiiAR7dAw7v+BKQWXldt
         W9WaeUxCQGjkEytozN1+6Ow4TGzPrbi51FyVqSmfWWy/UEgNdKulJZFowC3hzmn99Jtg
         YTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501231; x=1793106031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5mXplAJ6XQpaLaAHpeez9TEYogaPUChaxNtZ24iXK0=;
        b=1XdtuY8FWxcrA4Xe+Nb8Q6TPtvumQiLvKtqtLKs7eOxKBM1iX+kSzREX197F05rsUw
         aetn36EqqZJJ/uqSXxL1iG0Yhk2/INF+njIoDlztWD23CW6srkoju3whWEPQGitgBwqD
         A/ekoB3EYKSInYg2T2rihZ32iGKgzgs47PlwAaoSOdVJhVQQOUkoMTeMWb5RrcF9TRDt
         WcXl/brx/1WjfiU1QgxK87wTu4pTkhgtcLnQKZsZPm/csgvQ4/7RQ98IgutsnN4vabG6
         PwjkutPn3uOFSBqx1F26eUGvpDfJC1NjuYQviq6IeGjBWy2IC9Q4VsmiAFulF8zrMKZi
         VBIw==
X-Forwarded-Encrypted: i=1; AKwUvBwLssoBezgWVtEmJzFU7YfQykw81GbzVa4vZJwPqoCReiOsyP2sKYGhNpsFdYLI6MSQSy67abwYqR8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfwinHnEu0kuJAnc551XnSGUvAaF+JFXiAiwUBimUng0jW75hg
	PmNpmj3Wy/eABlTGyK7LSsV0mqyhCkoif3lRFs/7qYXnrKPEJYfXdgOd
X-Gm-Gg: AYBFou3cvQmzZ2iRZRc1PcwYjv2MDagL2drSBPDf9J564pmHAJ3XogNxNoHnOGt2JpU
	7BrelWXjUsrVjOum0YhNKvTSxOCEpv3HN0uBK2k9UFiTxTSGXykhYVOUb2Btb5E9V+rOkjN2uLs
	VEUYGdtL7nFQveYqGNBkOkZTAM5+6k88C62eBVufwA1i+aI1BmnC1AWiaWiulRo4nBh4jrXyhFj
	Pb/ohrBIyUE2O5geXo9mTSzjRt5b6/+O0qQWG2OjyYwn739TPVLGc6bKbsXjgY6zI+vFywR5mLA
	PA0FU3aDvopILa87/PL9lrwR+Cd7Z8/unqw4KIfmuypWTZoKDr8q7pHfj48ClxQov54VjkygHnS
	wXw0AfwsbfPPwsR7TCWXvg4jJvAfR37g6sQ7X07AzSdjWEGb1XSMeUi8VDzHzw4SvyAXcc2eVMi
	VPKHjLp2AOYa8j4fgips5wpBmA5c7UaQNVvxFn+KH3ZNDTfsSVILQ95aSkGcOvb2JgLaaQcl3yN
	RSqm4WlV5MzfYnqap31G02VVTw9ieRc5FLvonPog6oFBgtYKbxv7kCOqzLns80i1F5YjlzniA==
X-Received: by 2002:a05:6000:1050:b0:48d:ecba:3cf8 with SMTP id ffacd0b85a97d-48e07fa82f3mr15476118f8f.43.1792501230056;
        Tue, 20 Oct 2026 06:00:30 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm6114754f8f.54.2026.10.20.06.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:29 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 20 Oct 2026 15:00:19 +0200
Subject: [PATCH v3 8/8] of: unittest: Test fw_devlink with clock nexus maps
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-fw-devlink-nexus-ready-v3-8-fd6f1c17e16d@toradex.com>
References: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
In-Reply-To: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
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
 Leonardo Costa <leonardo.costa@toradex.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org, 
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
v3: Route clock-map entries to two providers, use a middle entry (Herve)
    No clock-map-mask: only clock-map applies to clocks (aacc54c67869)
v2: https://lore.kernel.org/r/20260910-fw-devlink-nexus-ready-v2-7-17ac82dbe226@toradex.com
---
 drivers/of/unittest-data/tests-phandle.dtsi | 20 ++++++++++++++++++++
 drivers/of/unittest.c                       |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/drivers/of/unittest-data/tests-phandle.dtsi b/drivers/of/unittest-data/tests-phandle.dtsi
index 1fd465bb8f79..8f86fcee4093 100644
--- a/drivers/of/unittest-data/tests-phandle.dtsi
+++ b/drivers/of/unittest-data/tests-phandle.dtsi
@@ -81,6 +81,14 @@ consumer-b {
 			};
 
 			fw-devlink-tests {
+				clock_provider_a: clock-controller-a {
+					#clock-cells = <1>;
+				};
+
+				clock_provider_b: clock-controller-b {
+					#clock-cells = <1>;
+				};
+
 				gpio_provider_a: gpio-controller-a {
 					#gpio-cells = <2>;
 				};
@@ -98,8 +106,12 @@ pwm_provider_b: pwm-controller-b {
 				};
 
 				fwdevlink_nexus: nexus {
+					#clock-cells = <1>;
 					#gpio-cells = <2>;
 					#pwm-cells = <2>;
+					clock-map = <1 &clock_provider_a 3>,
+						    <2 &clock_provider_b 5>,
+						    <3 &clock_provider_a 7>;
 					gpio-map = <1 0 &gpio_provider_a 3 0>,
 						   <2 0 &gpio_provider_b 5 0>,
 						   <3 0 &gpio_provider_a 7 0>;
@@ -112,6 +124,14 @@ fwdevlink_nexus: nexus {
 					pwm-map-pass-thru = <0 0xffffffff>;
 				};
 
+				clock-consumer {
+					clocks = <&fwdevlink_nexus 2>;
+				};
+
+				clock-direct-consumer {
+					clocks = <&clock_provider_a 1>;
+				};
+
 				gpio-compat-consumer {
 					gpios = <&fwdevlink_nexus 2 1>;
 				};
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 320a992c4310..40d010c55b8f 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -765,6 +765,8 @@ static void __init of_unittest_fw_devlink(void)
 		const char *consumer;
 		const char *supplier;
 	} cases[] = {
+		{ "clock-consumer", "clock-controller-b" },
+		{ "clock-direct-consumer", "clock-controller-a" },
 		{ "gpio-compat-consumer", "gpio-controller-b" },
 		{ "gpio-compat-singular-consumer", "gpio-controller-b" },
 		{ "gpio-consumer", "gpio-controller-b" },

-- 
2.43.0

