Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B70342512
	for <linux-clk@vger.kernel.org>; Fri,  5 Dec 2025 19:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764964019; cv=none; b=Fx39X3Bv9dKHEymKqjdL8iKhv7f5YU8bJb3pl+CXupj8//PJBeZtJ9uW7LtcXEe9T/IleGCxYIY1f57VwxeMTQndjykO7379JvieF9o4Rg+kn77LGIAl7nGXCq9MqKMufxQc6uHNGF5sdhrKpJU1tmZRqIX/iN/aATcQlEASEPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764964019; c=relaxed/simple;
	bh=KPcvmdhFm9HlslOyuHv2lYXxtXtxadeQa7HuDvwARJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZI2Eym2BO96Y55TymWQ0w06S3CiLNmeD/moDnsqoqInHPTQDfSDWWUbj4Ff88slLhwOAYONOscvmicZcAnSnK4WOBmXDMRf9g2htT34fGw3N0OFvQqTflm1uNPqEJvYKFrnsyDl+daRrl5Ukt8YwTX0IcNtRjX79e7mC+Drxvc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gj+Wwv+r; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FGw1wNiQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gj+Wwv+r";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FGw1wNiQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764964016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=30iJyQRBNkHN7TEjN+qByvx9czbGoxa7fRfCHkoySmo=;
	b=gj+Wwv+r5Xwpfmj+NDI+dZktSBXn4WDqUxet8in3SiX8MwiwnTYq59ACscO+oM2af6Tpp5
	sPWnOGzmwhbIu3mup5xSPzetqoSCfugjhsL3Fu5ciW4/0y9c16KqZBX4kwKGzbNLoKWHFw
	hlW9+8+BG8b8F1DNfqCKr4c6baET9qA=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-Q-pF6u3GPJicOvbc6s3Jpw-1; Fri, 05 Dec 2025 14:46:55 -0500
X-MC-Unique: Q-pF6u3GPJicOvbc6s3Jpw-1
X-Mimecast-MFC-AGG-ID: Q-pF6u3GPJicOvbc6s3Jpw_1764964015
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6421389b8b7so3152447d50.2
        for <linux-clk@vger.kernel.org>; Fri, 05 Dec 2025 11:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764964015; x=1765568815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30iJyQRBNkHN7TEjN+qByvx9czbGoxa7fRfCHkoySmo=;
        b=FGw1wNiQeLod2sH+s1npjVPxH4sq70OBuxEMmnIFYl0ZH3EqjrbWEV0mfK2H5cS28g
         8nvORUfjY4Vi/Hun2mvlp+cA2aLMHGGD2uj4RKcHU0Q9yljMM/HQlCb6CHohoR/3NpTX
         s13rsSaC0T6PEqlULQ8VeOqdUTsmH0aLJew4RaYmCrRpcKFKFCXr1w16BsVUcISygNDr
         7kDXICWIz2obx87mdZyW+y0+FZCBxpDFi3y/By0DtHHFn1LN2L3CFtfJrs4FP8Qn3ULT
         OFqBwNmGj0agYMic4NpFyIR2Ev87OfwiP3WCANBUdfETkfA1ildj4SRr1CQHNNjvFqCC
         IGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764964015; x=1765568815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=30iJyQRBNkHN7TEjN+qByvx9czbGoxa7fRfCHkoySmo=;
        b=D8jZdbGzXolVxjLINTnYJnmT4UlpHd+0w2YyPDeFoxmnxdn42YxaoyacaVZbVxLwrs
         KHQiLaDob58PYV0Yp+z0J+juXzy/vCMzLgzLkE1oK9S123kJaloVW5T0aptlk3CH7tbH
         TB6AI31lWEcUaRN/mLSZjnFOlAgSfCQnmbs753LvZIVDiDPzkEc4Lb4u3e3O3Hf7Q0lY
         YnZUIcnRYxuHIFuaxdQKMF9MmZbwoxCUJUTivVn4BSf4RggP/MI078iF8eKONGJy2DuF
         XcT9x5Z1/nc6JT0n9gQ1HtobwPjLeA8+pKm1ApA9oRNpm+HEuQnsGruS4GwplSB+UE0U
         5NUg==
X-Gm-Message-State: AOJu0YwNicvSq2AmCyk+mQYMbBo98WNg7LZlNbqQcvWg7h5qZ8YuB6hY
	OuQbqXI0jXPWrjRcUd/AbSESloc76t2O1guLMyNDh2n8jJtlGPisCiaH+bqeVkUGezvfu6zfJzi
	JQ6zL1wpikoSTfW+1zozVpXu308hrlp34s9xW8P+r7+Iq9aXCA+bHGM4DVpMRog==
X-Gm-Gg: ASbGncsaFDA8W6oB8lAOXUzDWPv/Fs5ezhnen6790VDWbP++cPrLugXMXOyidXOEnOS
	mTX2pIHfZKI0ssjhL16rAv/fwcqaQdGWDsBZH3U/DmTOBQs6YuT2W8DNNfxuGEssgsDhHhYC6jK
	Ip2xR0giLL6axBPlmsUVw/B6r2uRLQJ3FTKRqcWgiv7xA/5V5axTMnB5aWGujhRbgA72QQ/yl7S
	JfXljOWcxT3x+yEH4Nxt7JEho8Fb2k27mRGsUkqja11fSALCYGv4n4ZBjg0MPyEQ8Hc6FBkhA4u
	H/ND2ZC7OJEi70vk+4Gu39MhE+XyAI0+GnY7I/8lukA8LHHZWnwHAPeXjrCvAXnbRe+fjDOB2o0
	MVo9MzGmFXijeqqsgFfp4KsGG5a3yKLiOiRFt3IvKLzh10y0e
X-Received: by 2002:a05:690e:1911:b0:640:e021:ff6c with SMTP id 956f58d0204a3-6444e7a7333mr101903d50.38.1764964015261;
        Fri, 05 Dec 2025 11:46:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCdcT2Dggo7CE8vnrB7QHeEj6BIJtQT/hMk5Hb2LD8xom0k7h+Vr1SgaTMh9MkR/K07FmBMg==
X-Received: by 2002:a05:690e:1911:b0:640:e021:ff6c with SMTP id 956f58d0204a3-6444e7a7333mr101872d50.38.1764964014740;
        Fri, 05 Dec 2025 11:46:54 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6443f2b80casm2151181d50.9.2025.12.05.11.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 11:46:54 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 05 Dec 2025 14:46:30 -0500
Subject: [PATCH v3 4/4] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-clk-microchip-fixes-v3-4-a02190705e47@redhat.com>
References: <20251205-clk-microchip-fixes-v3-0-a02190705e47@redhat.com>
In-Reply-To: <20251205-clk-microchip-fixes-v3-0-a02190705e47@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Conor Dooley <conor@kernel.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2718; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=KPcvmdhFm9HlslOyuHv2lYXxtXtxadeQa7HuDvwARJc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKNzZaE29yyi489dtTVc0XbdPOjIi93X/Jck5Xi5BoRm
 qFUK1reUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwETsShj+CuwuOK7ntu5AUuqm
 kFs/c3K5L1z/2f1DuSMgWNmOdeHyXwz/7OO9ElP/30p6KxG0MGD5oWt50/N9Xuz+vDecfWtmQbw
 qNwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This driver currently only supports builds against a PIC32 target. To
avoid future breakage in the future, let's update the Kconfig and the
driver so that it can be built with CONFIG_COMPILE_TEST enabled.

Note that with the existing asm calls is not how I'd want to do this
today if this was a new driver, however I don't have access to this
hardware. To avoid any breakage, let's keep the existing behavior.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/microchip/Kconfig    |  2 +-
 drivers/clk/microchip/clk-core.c | 32 +++++++++++++++++++++++---------
 2 files changed, 24 insertions(+), 10 deletions(-)

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
index f467d7bc28c87a50fb18dc527574f973c4b7e615..fad4b45d908310ffb59e4ed57c55ae4266253444 100644
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
 
@@ -74,15 +82,21 @@
 /* SoC specific clock needed during SPLL clock rate switch */
 static struct clk_hw *pic32_sclk_hw;
 
-/* add instruction pipeline delay while CPU clock is in-transition. */
-#define cpu_nop5()			\
-do {					\
-	__asm__ __volatile__("nop");	\
-	__asm__ __volatile__("nop");	\
-	__asm__ __volatile__("nop");	\
-	__asm__ __volatile__("nop");	\
-	__asm__ __volatile__("nop");	\
-} while (0)
+#if !defined(CONFIG_MACH_PIC32) && defined(CONFIG_COMPILE_TEST)
+#define cpu_nop5()
+#else
+{
+	/* add instruction pipeline delay while CPU clock is in-transition. */
+	#define cpu_nop5()			\
+	do {					\
+		__asm__ __volatile__("nop");	\
+		__asm__ __volatile__("nop");	\
+		__asm__ __volatile__("nop");	\
+		__asm__ __volatile__("nop");	\
+		__asm__ __volatile__("nop");	\
+	} while (0)
+}
+#endif
 
 /* Perpheral bus clocks */
 struct pic32_periph_clk {

-- 
2.52.0

