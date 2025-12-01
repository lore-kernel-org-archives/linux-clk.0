Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBC328D8DF
	for <linux-clk@vger.kernel.org>; Mon,  1 Dec 2025 22:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764626832; cv=none; b=NYgWyW8TZ4GnieqFIFsUhoQwsS9k77RsuXaD44i9d1VI1EPRrmJjViKA1d7/kE6Zg/OjsDhhgjbQFNEGDQ+IjsvMVrOZO2Z/d2p4EXvozZLG2Az+Xznd0n5SlQtMnGibPFFDWly9oYDwD2jrTS297rf8iT3F0lp9iPKharVm3T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764626832; c=relaxed/simple;
	bh=CQHTOv+eCrW+oGwBMaMVab/1SdQtZEWNZtzY98QQQfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UVq5VewSpUapi7XrpkTKpPJJSWrGwkyRyk4YrDM4/kymc9HAn36UhIItfd3RT6wbqq4wl2HTSO9ZM3JS3scMoi1+Kw0t8+BOUTdlZDw0BGhVB9E6hq/aCYBs6vLtNpEo4KVAY7MvDj0+hLrkNMarCxlnPEJvBZvmEBf4EVlmA98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cS6Z+Njn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QOvCqHQd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cS6Z+Njn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QOvCqHQd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764626830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tX1Pz6tnC9qeJQ7PAcPV9GdqpPhtkCUJBQztiF2q/xw=;
	b=cS6Z+Njnb6uc1y+4cq7PBmDSGr9fdA/afsshByeqzrMhDZdW9SEszRb2soSw7GKABsc2fN
	Y/BScbgEGJBEUHbiRz9DkG+GuAxNScQ4cWrEPRcyVOekAvakgtRCS6YSDakcc7WTVTpHR3
	vE4NWytTwhdJLDRsrfnYE6J5hWDmIWQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-v5EFRTMsPk6JEXmksM9I1g-1; Mon, 01 Dec 2025 17:07:05 -0500
X-MC-Unique: v5EFRTMsPk6JEXmksM9I1g-1
X-Mimecast-MFC-AGG-ID: v5EFRTMsPk6JEXmksM9I1g_1764626825
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e2342803so929903085a.3
        for <linux-clk@vger.kernel.org>; Mon, 01 Dec 2025 14:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764626824; x=1765231624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tX1Pz6tnC9qeJQ7PAcPV9GdqpPhtkCUJBQztiF2q/xw=;
        b=QOvCqHQdQTtABtFDXUzpNHRHHpOmK8ln+q4mUBjpRaXMwtIIPhccpr3OeR3Gnuldwk
         ihpVtzRED/CYudpHV35vdBzDTIuGJPszuHcVAADSmKVwNkWqcLRAe2ZgkU56nhlrsjSb
         hc9O4s5hht2Zu+VGAupRFkg2S/WX9RfcjWGd3kHFUO/mJpZ8Et7o5v5xsk/sX+cHezrn
         As3w6SuDCi4b5I2dug9RAAjO7E6uG50Usbez2tLrRal6aPwvDhEJXoCsWnfn0NmLmwHG
         7WNlYlFXLdNTtIX2SCcjtiXAZRJsKOo1cGsQBVf2gSKlaXJ1YQ5KbQD+jy/K1pSGGB30
         2deQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764626824; x=1765231624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tX1Pz6tnC9qeJQ7PAcPV9GdqpPhtkCUJBQztiF2q/xw=;
        b=XjXnvY9lcuwo+jbgllvk1yZLomJPgh0ejJr92kcr3uGJuBuiqb/anQ0kGCl3cEBWSV
         13dRy7v8BCOKIXh4QCGgkyv/QvfhE2wDe4NcDzrs4WZW5zmWFjf+/rMu2rNcLDymv+yc
         anBqIJ0bjb1hlYEfIZoNIiKlW5vkOjMLEToIIl8WnM/pSMRRvgzAqcm9dcv9N+QlMOEN
         lQUetj9dw5PckF4Kp7uusBQrU2+9IhwwlS3B9V3ePqGWvZfyJYP0UDiuTpDsmFLUmG+x
         mQYwdP7jQkMRbBSEbmLHqZZsv+3orbCVg+qhZsE24Kogtw8sriBFp3AwCbpEctIVEtP1
         ZGEA==
X-Gm-Message-State: AOJu0YxpOiMF4kWS4M2OytKSeN0T7+os9NtC2qHL/MX+7YmkGwjalq8j
	6S27EfGDPvdmps4xjyNT72W6I26BizxUfMtpnTCi+hC9cdRhdR3GzrzaiB3xsVHkm+in/fGp8B1
	g8UWYugad+iJ2U4KPhDhpzvxUQNQ/xBLFi/gTF7ut6k1A/h2BX4VgjZEkAegujaiSsV0low==
X-Gm-Gg: ASbGncv4eTwBiWrcFCRf3pwFE87Ws588bT+ZF5+ccuG2BgUAe04pQmDmOHCdgG+abMX
	c5O86uFj2Ojwlxl6KgbglfcilusXzXhUM2X1s2lRS04cSbBlZqOPRb5K1jiIT17RUXQwgK+GJpj
	56LD94kIZLPyLEfnh9iaP/orqxIlv3xPXfGVTrv8wloyBWeJIsGfsBKMgPDSSbMI2XdeMJUD2j5
	9QjBABNNBrylcwI2vH0J3g0V/pXWYbTfzhysd3yJ+SD7Hk166TRCzj5MF3s2izVpB4EhkQDy8WC
	Rb52BraxJ2zZcaCrwFEuZJ31xI3jSB8YcG9WEJJaILALdtbghUcSSBqkFtVyazwU3ymdzxAIlIs
	4f6KrQL3oi0W//zld
X-Received: by 2002:a05:620a:4116:b0:8b2:d259:6138 with SMTP id af79cd13be357-8b4ebdb0681mr3440087085a.58.1764626824168;
        Mon, 01 Dec 2025 14:07:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPnFSHUzfr7kFJ6NlRDlUkAAKlg4I/STCl/LdaqbcGm/oQ+/fojOAjw4FCwwqQUSx+4rB06w==
X-Received: by 2002:a05:620a:4116:b0:8b2:d259:6138 with SMTP id af79cd13be357-8b4ebdb0681mr3440082285a.58.1764626823796;
        Mon, 01 Dec 2025 14:07:03 -0800 (PST)
Received: from [10.235.125.224] ([2600:382:850e:4ee7:c142:114b:2df7:89ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b529993978sm944541085a.5.2025.12.01.14.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 14:07:02 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 01 Dec 2025 17:06:39 -0500
Subject: [PATCH v2 3/3] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-clk-microchip-fixes-v2-3-9d5a0daadd98@redhat.com>
References: <20251201-clk-microchip-fixes-v2-0-9d5a0daadd98@redhat.com>
In-Reply-To: <20251201-clk-microchip-fixes-v2-0-9d5a0daadd98@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1582; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=CQHTOv+eCrW+oGwBMaMVab/1SdQtZEWNZtzY98QQQfQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDL1BOtjkpi2XhH75lKjyvbqW+6JNMOJzT8fXl74iW9+y
 eVt52fWdJSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjAR//+MDMcD5m/9m/ZP1Dc0
 /MTPv6qiP0/snVz459bqvE9/NwXd3TyD4X+QxDzuhl+z2WK5Z5+/qndx0ef5FmsTJ/NtNbDJiyw
 yOskMAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This driver currently only supports builds against a PIC32 target. To
avoid future breakage in the future, let's update the Kconfig and the
driver so that it can be built with CONFIG_COMPILE_TEST enabled.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/microchip/Kconfig    | 2 +-
 drivers/clk/microchip/clk-core.c | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
index 1b9e43eb54976b219a0277cc971f353fd6af226a..1e56a057319d97e20440fe4e107d26fa85c95ab1 100644
--- a/drivers/clk/microchip/Kconfig
+++ b/drivers/clk/microchip/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 config COMMON_CLK_PIC32
-	def_bool COMMON_CLK && MACH_PIC32
+	def_bool (COMMON_CLK && MACH_PIC32) || COMPILE_TEST
 
 config MCHP_CLK_MPFS
 	bool "Clk driver for PolarFire SoC"
diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
index 664663d9d7765ee0c61203ea11211da54b709377..49c7b8b487ed6bc0e43d7177cb7c4cee9008f544 100644
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-core.c
@@ -9,7 +9,15 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+
+#if !defined(CONFIG_MACH_PIC32) && defined(CONFIG_COMPILE_TEST)
+#define PIC32_CLR(_reg)		((_reg) + 0x04)
+#define PIC32_SET(_reg)		((_reg) + 0x08)
+#define PIC32_INV(_reg)		((_reg) + 0x0C)
+#define pic32_syskey_unlock()
+#else
 #include <asm/mach-pic32/pic32.h>
+#endif
 
 #include "clk-core.h"
 

-- 
2.51.1

