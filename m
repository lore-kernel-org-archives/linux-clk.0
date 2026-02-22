Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C553612C3
	for <linux-clk@vger.kernel.org>; Sun, 22 Feb 2026 23:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771804290; cv=none; b=ClrUhr5A7iKAOi6eGPag5pM9VzsQzfieoMdferGNlKy/aK1+7Mw7JtQNpRtIysZ17ZV6W9iIqGK7Fb2xl5CurDq2PuM4/0nq4W+0UbNpDQw9YPib7RNhr+cr9YlPHauLw5lP0+MMaeEob9vZoqyVyIWtutdhk3SaDlarxQe0qDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771804290; c=relaxed/simple;
	bh=CcOilrt5K4K/T1jJzE29QaA49JBm79z4ATT14FiguCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O1znej9TPCAQEZYSsaDdTPJSTy2tmkzxKAjKKOKG+99HxyQhdok336WG+5jv2FSWtuo/bKddH40hC4Qk+KQxF9uRYpl7TPvjDmSFtqWrLhVoAiRFLasdgqywG6vImOqooOFKcG2L9XqQjaMjlxqtRd0Pqb2WZHYCrroS5nw2E28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JCFaqAJt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mGz+nwhL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JCFaqAJt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mGz+nwhL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771804288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SP/zy4pHeHh6oU011bprJUoBpIb3oQUn1FgaJ/yqaQ4=;
	b=JCFaqAJthLqFI27MUyOfNc9NfixLJludni1z6erbvhuwZb/cy3hcRBokfUPhsQUSVRsESn
	+X3dm/GStSmFHgItFBuBmP/Tp67Ke4kPnnekQIJHfdkDYY/imebZNBfGt/ErNWbdUylAE3
	jAb3trVzahMKg5OdQUgjioZqRvIUELo=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-H4XgXyL-NPmIxQ3mWk1q8A-1; Sun, 22 Feb 2026 18:51:26 -0500
X-MC-Unique: H4XgXyL-NPmIxQ3mWk1q8A-1
X-Mimecast-MFC-AGG-ID: H4XgXyL-NPmIxQ3mWk1q8A_1771804286
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-506a936d7afso470694701cf.3
        for <linux-clk@vger.kernel.org>; Sun, 22 Feb 2026 15:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771804286; x=1772409086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SP/zy4pHeHh6oU011bprJUoBpIb3oQUn1FgaJ/yqaQ4=;
        b=mGz+nwhL7hjw9mHSPOeynrh8SPZg+Cl3bNi0sUUGzQ9j/hb2A/cw1cml4duspZqdAb
         WWyFjHv2oxG41RuY/FXkwb7RNqjPRXws7VrnXt3/TJcDa21pvfxRdZ+B/xAinJSM9lGX
         WVg8TBhRo1EkkkPziEujyVFjW7GESdFZMkv4/0QAZI+0AqN2eHQxw36nqwy91sln1hjd
         uXagqg0QSWBNuYYlprw+jm58TlqwQRzkwV8vpEUllcRMa/oozfGbbEJVVT3+dnFrLOI1
         PMhvE26g6ZfNyWIt+PRwYkSrVWpVNN8P9QO7mcQo59g3B+oB12r8QkbwlkB/PAvNsJka
         XQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771804286; x=1772409086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SP/zy4pHeHh6oU011bprJUoBpIb3oQUn1FgaJ/yqaQ4=;
        b=Eg1Ee1EimsiWNZeN6W3gTUEhw3hNrZGHgYmRZx5Hc+bCOJOPlat/B2VZJCNCRPujgw
         9+/tHTx3aTfqjyMGuGTcDiT+u27VWUjBXQTMlvJ8tPS+2IDsYRGUY2Q/Jaf/6EC4JWTw
         bwf/TCYu1fGm2tH1VkFE4oj25ZzzrTq3b5qz24ElAIhkDmTsxaWF6IZwGCkUQxuPdqVc
         v0DXim+0AB1ZZkLlE7D1JtuFpnqtaB8qYMZ71UY7XE1Hh6tNFNXlY098Erd5yw41fIYQ
         EF/2j15LSVTmbpo45zUyDavekI7MNwvmgnCB5tj2IEXdNmct2WckrI/08fFdFysz9kWk
         zEeA==
X-Gm-Message-State: AOJu0Yw40JaNu5rj4RxAo+X7rNQLSC1UW2v/HZ6VRBPmABT3KHF0gMA0
	i0D8H5I+x6bykL7UEvfKme5jB3uYjmMfui4wNAPstFUXHlito2IHHRbY/4sVLMj3Bwhi0jEpxFR
	qZVLQuqmPf+kAirOmhQyAT2ntRFQF3Vdq3sjKmDViKeWiPvgEEn6LFD9kAXXlXg==
X-Gm-Gg: AZuq6aIz/vCWIFal4Ge1fAKHFUBVTKHgO5jlKKpmUTvLnNYWXmE2gYH1uVNXW0Cw/iM
	4JVkq9aUH6q3j7mvXpopeBuj4S9ju/Z22LNDQyzg3YVev8E7TXy4QOHLzCRAwLUYxNshGmOR92h
	pte0O/2klMaKwNMhMfePhWjr9ZorDomjvXoa2Llc5/AyidE4HxjFaJ+2OY3YAcwcK9AuCl35XOf
	uen/bhIvorbVk84fyPVg87E+lEyLoWX3S9NpW1xwTOVPRbMPIeG1gY/u275vEYYqQq07LO4V/lA
	y/PfyjDBuN2DWO0kLVGPgbyyuk74QcqtOwogMi64tHYyiuHhYY8/fxK/ggVezBJH5odPoDzIX/7
	KegFofWgmJAFHsxTBc2OueQi3EInj+peBugxeHxmJz6LIoUIEzBS5tXyXmIJ2qw==
X-Received: by 2002:ac8:5d86:0:b0:506:8738:651d with SMTP id d75a77b69052e-5070bd02eecmr103575731cf.62.1771804285977;
        Sun, 22 Feb 2026 15:51:25 -0800 (PST)
X-Received: by 2002:ac8:5d86:0:b0:506:8738:651d with SMTP id d75a77b69052e-5070bd02eecmr103575551cf.62.1771804285639;
        Sun, 22 Feb 2026 15:51:25 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997c8a771fsm53701036d6.17.2026.02.22.15.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 15:51:25 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 22 Feb 2026 18:51:05 -0500
Subject: [PATCH 2/3] clk: microchip: core: change asm nop calls to nop()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260222-clk-microchip-pic32-v1-2-ceacbcd515d1@redhat.com>
References: <20260222-clk-microchip-pic32-v1-0-ceacbcd515d1@redhat.com>
In-Reply-To: <20260222-clk-microchip-pic32-v1-0-ceacbcd515d1@redhat.com>
To: Conor Dooley <conor.dooley@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=CcOilrt5K4K/T1jJzE29QaA49JBm79z4ATT14FiguCo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJnTyvzawjMU+o+I8Iy142d4d0yvmc/8/XdouZNfK7xc
 8nxnVeOdpSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRsjkMf4X5eTctsp1WO2lt
 lsJiN7XOHYnHDl4oWTLzhN7mxO1ZSTMY/rtkL71533qS0xexIkuVP4cn/RTbdCfZNbdUrEfqYuD
 Rc6wA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

In preparation for allowing this driver to be compiled on all
architectures, convert the direct asm nop calls to use the
nop() function that's available.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/microchip/clk-core.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
index 2e86ad846a66cd5487f5412c09ab0ad25ebe3f79..4e90988f47d5d3a370bd1a8e74c5778e4f071038 100644
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-core.c
@@ -3,6 +3,7 @@
  * Purna Chandra Mandal,<purna.mandal@microchip.com>
  * Copyright (C) 2015 Microchip Technology Inc.  All rights reserved.
  */
+#include <asm/barrier.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -77,11 +78,11 @@ static struct clk_hw *pic32_sclk_hw;
 /* add instruction pipeline delay while CPU clock is in-transition. */
 #define cpu_nop5()			\
 do {					\
-	__asm__ __volatile__("nop");	\
-	__asm__ __volatile__("nop");	\
-	__asm__ __volatile__("nop");	\
-	__asm__ __volatile__("nop");	\
-	__asm__ __volatile__("nop");	\
+	nop();				\
+	nop();				\
+	nop();				\
+	nop();				\
+	nop();				\
 } while (0)
 
 /* Perpheral bus clocks */

-- 
2.53.0

