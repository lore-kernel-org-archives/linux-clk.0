Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2318B33ADBF
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 19:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764099631; cv=none; b=NcJiZ0/henAFPMFTXpKA4qqrI7gYP3dQ9+zGM3WDGvreNp8ehWC4gZvHodprkgFAK3a2RpBqTUzer6n+/HNzvs/UvHvRGsZat/zS+9wqWAE8L5ju4QtXPKLgvPaWLnUAc2bj0/ubg8WzXhZebSEZoD3SD5FoU71Rj6SxZ5+YG0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764099631; c=relaxed/simple;
	bh=6MWPKF20qDxwyXVd7xbLUxeMx5bHBc58ZYzCS1YxsLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AWuPgIP0aF7XglotYLN7PsXR7dRi7NaBpLB3dj4ASFdUPA9CVCXJPQjU19AjqS3g102RAzHHAqLeCCS3QTbQ1l1lG3QgH8B+E3EW4vB8Sof5158WXgriNvaSQ2xuW5gixnpQ1XpLXeJcEvL/M75nUJ2kuZXAHRFt9vIShYCs/Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BjAXI9yj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=q4wXRPYV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BjAXI9yj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="q4wXRPYV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764099629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j4eyFaFkVyG3HBIIH6u0RJdmElmnhJxreQlmGF/g374=;
	b=BjAXI9yj1y35iQ4uTLTwoGUpd7LaxQeQ6najIaYZ2qmFUMOJwLjInb7FylolMOB3201t+f
	PTbZz6IQHFRf4YpMXMyDhtWxmgA23KlnasglaXj42RxICTRSbVXIb6o6GRTPpvNxuJ9Z5z
	WxE1Oulr7mHFhZ6aBibmHJgS6jL0umk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-3WuRLLG3PEeZwrCIOR6hew-1; Tue, 25 Nov 2025 14:40:27 -0500
X-MC-Unique: 3WuRLLG3PEeZwrCIOR6hew-1
X-Mimecast-MFC-AGG-ID: 3WuRLLG3PEeZwrCIOR6hew_1764099627
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b19a112b75so1458793985a.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 11:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764099627; x=1764704427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4eyFaFkVyG3HBIIH6u0RJdmElmnhJxreQlmGF/g374=;
        b=q4wXRPYVX4WaWCfCPm+EFaXQXm+jIH964aJnaOPESZB069FhHuB73OQx5xzwbId4w8
         Ashxzf0eWYSk3SCk3gG8kkJZD5jINOG7Z1EFqS+9mgRDebz5fz3zJXMop1Phf0jBckWH
         NmURdiYDJmbSn5v1MqoviBR64gQfuGhllFIBKpqCC+/2XAfqXvG6vcU/gFqeKxgx9FbI
         5N1JHl+5JTMOe+45KgYwC9+kX3Eb3Sc3rnDJXp3L8ctwwHPBUY7ZDqYWQD9WBxLQFmQj
         eRA7TV+5wnSXLS+xtz2Z5mJQFfgZ3h1rZVvCzpl32JFGZnG9CeDbLIuM+XyIMNPTX+xL
         9D3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764099627; x=1764704427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j4eyFaFkVyG3HBIIH6u0RJdmElmnhJxreQlmGF/g374=;
        b=HF/tO9TO75fmPKUtewPVQVYTZNVpAqJOe91FBoebWE/mX8cXWDGq/HRybVuPj3G+3P
         EWDtMO/ieEV8wTIViNBCbB0PSrMrkTRRDNSI+WLF7HDOwY/BvopPEoRP0xxpdE90c53k
         8HfFakT4QXhe1xhXU5gy+x1PE/t5ffsVizWMmk2triFhZjNkT7nHMVCkXIM9PXe5DOS2
         6tcNN4JKs0ZarEBayc5vmiynETaT1ZZxv6qdxOj4qHlz0Cv33h1WOv1QMLZVV3OZxH8i
         jnintxPGIy35A8RIzwxB0vrsBwxIs7MrlaMwtcZ3HemLzw7Yz0tWUf9+nGUE29ZfKH/R
         Q36Q==
X-Gm-Message-State: AOJu0Ywb/aCgkXRwIbS0WIiWLCN37PJS0aCbg2VyQqv2vhKy8RJy3HfY
	t1VB5psG69tcPhaqd3UnEucjRtF7mBS0sxD1XRNBnJ9B+PFjorc5FGT6Cp4d3QIgpB+hG9gKUz2
	OnpX5yDFzra16/shfpBUbmqnBK7Wx548lm8DKtKmLuvHALHT64UZ5qDccw1jXpQ==
X-Gm-Gg: ASbGncurnxanvUqcE1cUuptRDtDGNwelPZbB7BeQhrBo0TVwtKR5VuB9UWMuswMyYm8
	U5XcQXdfAbubT9SHTtYX6hUNR+E7YwB52e1M3OrJwcZ3ebVapEcTrGBUib08e5nUewUUnjKTW6S
	anIkEBixJPs7OPFQeOzwpjG5PU56rd4ZORNBm/k/exHbJhoPv8CfOMHDHgYe3YNiDCPmeWf05yX
	Lb9vsdCD6D6kmaJYuF1xy8FHNfzJTKE6zcbZHsHdXV195DmYbgmhG1rCD7JQOxqhwD6m60GrvGP
	jwqi8ldoQyskgOthV6dZm/ZRJlkCoFe9DB4OS6uGo16ZjIFW48UOwG8yqicfh1XDbXEWC2vv5tS
	Z/pCe/KP96KVSEab+2kIQEx8eqRZZONe2r6sHZJGyuFKiXASW
X-Received: by 2002:a05:620a:3184:b0:8b2:f892:9136 with SMTP id af79cd13be357-8b33d469055mr2248745185a.42.1764099627144;
        Tue, 25 Nov 2025 11:40:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxevJvFb8h6mPClq1r35aCDNnXMz4El8nKV7pUnJdipZPYVXcpOyN5jMA6z5/XNH3o6zwLoQ==
X-Received: by 2002:a05:620a:3184:b0:8b2:f892:9136 with SMTP id af79cd13be357-8b33d469055mr2248741885a.42.1764099626673;
        Tue, 25 Nov 2025 11:40:26 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295eefb6sm1236272485a.50.2025.11.25.11.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 11:40:24 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 25 Nov 2025 14:39:55 -0500
Subject: [PATCH 2/2] clk: microchip: core: allow driver to be compiled with
 COMPILE_TEST
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-clk-microchip-fixes-v1-2-6c1f5573d1b9@redhat.com>
References: <20251125-clk-microchip-fixes-v1-0-6c1f5573d1b9@redhat.com>
In-Reply-To: <20251125-clk-microchip-fixes-v1-0-6c1f5573d1b9@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1675; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=6MWPKF20qDxwyXVd7xbLUxeMx5bHBc58ZYzCS1YxsLE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLV2FRvLhd9pHNQtHvpipp7D3fH/J73yt7//b7FB5441
 +7039nq31HKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBE7ukwMuzs3F7wdUmt3j6/
 tEuLbVXVL++ZeKcr494dN0MHtb+llq2MDIcy/2pIZvy9uMYz8uxNlcV6F6su6G3cus/ZTiP9e9B
 2JzYA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This driver currently only supports builds against a PIC32 target. To
avoid future breakage in the future, let's update the Kconfig and the
driver so that it can be built with CONFIG_COMPILE_TEST enabled.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/microchip/Kconfig    |  2 +-
 drivers/clk/microchip/clk-core.c | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

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
index a0163441dfe5c1dfc27dae48e64cf3cb3d6b764f..c58f4289525d5d2c8449b96119fc70a3829d9f7e 100644
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-core.c
@@ -9,9 +9,17 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
-#include <asm/mach-pic32/pic32.h>
 #include <asm/traps.h>
 
+#if !defined(CONFIG_MACH_PIC32) && defined(CONFIG_COMPILE_TEST)
+#define PIC32_CLR(_reg)		((_reg) + 0x04)
+#define PIC32_SET(_reg)		((_reg) + 0x08)
+#define PIC32_INV(_reg)		((_reg) + 0x0C)
+#define pic32_syskey_unlock()
+#else
+#include <asm/mach-pic32/pic32.h>
+#endif
+
 #include "clk-core.h"
 
 /* OSCCON Reg fields */

-- 
2.51.1

