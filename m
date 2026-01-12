Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8338D304976
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 22:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768258169; cv=none; b=tI0kxuxB/SUXNRqGf18xUfUWLLiWQ9zUKFUyy5Vrze/ud/QkTMCkUA58bwAX/oVc+lhD67pQFnqSoVr61Qnjq/nMhT3cFtLquEOENSmQ9PMnXqnVNPNfQMdU0/joAUdVZi3KTZGxmP7JKfK2qI3U8MmLAqr5Edcfue0wpcAtorQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768258169; c=relaxed/simple;
	bh=y5Wna2uuT+TyZLNT2wjyR7itI0mAOICA1O/5yDz9N8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SxyMXLsTnCufTHZvnBZdEQIx7mpeLtOnkF6hXKTH3qGP9xdlI0IHHRVHe3BVarvLYlNb0bpXk00A+w06Y9Sn5OB8XCxhV5VqeWkMueFJ6JnJuLPRCgrlmlQjqd5AGlzgHdKWz8Ixo6pt7Em7dHl60s4osQYmvVLTHrBx/CeDYpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gHYW99BB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TV3iiGQz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gHYW99BB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TV3iiGQz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768258154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7A0SVSsJLLrH3UzeGVYQj7XUlswlx8l5i5D50nZwrq0=;
	b=gHYW99BBeq3L+xCp4MmxvmAljREpWowDqSynjx2I0Yw3YWOKgLbjf4RjKzTC+3rdcaMqRR
	oEhZs4yvMiPjeD3kndtCCM8ounzWpbG97llBo57ACxqQhSvNkJtaZxZbYSjz+ssfY5Vdwp
	is8dahRDY2FmUu5WJwPDv9su7Y3c0S4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-rRfYWKvTOPSHZSHsyKzjnA-1; Mon, 12 Jan 2026 17:49:13 -0500
X-MC-Unique: rRfYWKvTOPSHZSHsyKzjnA-1
X-Mimecast-MFC-AGG-ID: rRfYWKvTOPSHZSHsyKzjnA_1768258153
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bbe16e0a34so1712811885a.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 14:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768258153; x=1768862953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7A0SVSsJLLrH3UzeGVYQj7XUlswlx8l5i5D50nZwrq0=;
        b=TV3iiGQz0R7JgZd89j+9FyaG9xABwtFuZry6vhvCuLxYEtg87MZzCIbYkM6aHixe6P
         KkM3vX+riBAI71lZlmGUfcaxXAG6TNRjO+eMhWeQ8T2Rhj6Jg+HqXnk/FzfchTAHQFcT
         wrIqYQu6ZT2EuosvDyblkHw8OtfOTSl9gmxjiiRQmyJrjI+cvXwpsEmk21+kkwYqMOax
         +n69EUVDDyNHkAZx0jlNmNdJ8rO4dRBGEPc7XvANeuH9rbnaYe2RRk39eghcBlc4aV1p
         9Rm4FVS+17Qc4eM+mpBV8+NA24TkKdWc9OTF5IFX3Il9vO3DZW9/qe70ndy4woOnl141
         v+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768258153; x=1768862953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7A0SVSsJLLrH3UzeGVYQj7XUlswlx8l5i5D50nZwrq0=;
        b=KWCakr8/n4Nozi4Ho56SuBY9hvawteq55taW/1snPNLEr0YNt8hHHkeFf+5e9Z8hv1
         ILjcxrQix8/9TtrkcZ13bY0SGgJjqbVJaGF3xZH57Kfm5KqFlExN09XDiusrMSVsttV3
         PaUclM5/ApMm6UhtUJMfttox9T6JLjNT0eW7ygIagmPfM7IFyM7lhkLQhxYpK2f1kvDO
         NWosaAklLLcbKO7aQWQSe75wnxsLIu6PPSUaVQacZ92b2jJgxI2cBd7f6xqV4koNEUkC
         y+8Moew5sWAGZSkPUmUq4koEV4+q8Uay1cruhJ2GRO6JuFEm2s+0pdt6W8/yNIIIUWIb
         0GTA==
X-Forwarded-Encrypted: i=1; AJvYcCX5GrCJ51hq4bTVkNuvUyqhJ0oa6Ye+SGihhGR+soMx8qQxUB4YVXm94fBoVoZ+WSMMlHZAAY3uip4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9ehVgaqBrrsFbFLjicg6bXCM3t/OwwQZHpXBnG2KmYXjBJkEL
	13knjx/mCAlAMG71ru71D1b2uJo6kvbQyMPn9a/yvhR7CFSIsmAPYOQOAEmp0dpKWPqsjuBXTby
	hjVCb+oWPKU016ZJUSGbr/+zh9C2cZoWbWirasxWjE4y7CLAjWISLT69l+Rq8uw==
X-Gm-Gg: AY/fxX6dDYSRPJi7SIj/C+Spm/4IkU+q+VXzO7gQvg58RTEON3c52WBsnT6/RvdCpXY
	cVBiDADsivcf+roifw7D0xcfHkQvu/W1x0ZBEPdDcAPIp0aXlCcynWVf/XsVXphGlRajqJBu+dw
	RpEysQ0Yhx08iEoF1k/zloEooUe65XfeDvAYYLs7azNMxPdnLhUj+oAf/6dZdiatZP+nsKfMKLX
	SMlju5fovh4d002Ov89GiuT38M66w4uzuT+Wun6HkHmctcVUpkSlPPmhIKh1ldOgCtpZXP3i9K4
	zNNds8tXa6rzYQoCDU9qytu4ssnTixdYEqndzpyVlJHJz05Pcpw/2S4Ri25X5fA1wudzFilKpxu
	0KGNbttgr5ATsInGRJgsH/OxBc/YjVP3ZyKsME0yiTw7KyG0gqw==
X-Received: by 2002:a05:620a:1aa5:b0:8b2:eb66:c5a with SMTP id af79cd13be357-8c520853b0fmr169185485a.14.1768258152831;
        Mon, 12 Jan 2026 14:49:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsvdQxsJHG2m65/05EJas3YECRu5U/ohT03pVCcHZAYUWvkJzij70G8F+gUsd10k7nKvHn0w==
X-Received: by 2002:a05:620a:1aa5:b0:8b2:eb66:c5a with SMTP id af79cd13be357-8c520853b0fmr169183385a.14.1768258152479;
        Mon, 12 Jan 2026 14:49:12 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6145sm1580930385a.5.2026.01.12.14.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:49:11 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 12 Jan 2026 17:48:10 -0500
Subject: [PATCH v2 16/16] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-mips-pic32-header-move-v2-16-927d516b1ff9@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
In-Reply-To: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=y5Wna2uuT+TyZLNT2wjyR7itI0mAOICA1O/5yDz9N8g=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJTq3w+aoiaxxYk/RI6FBPPdl5i5Yqyy2JZNYL7NznJm
 cn+mKDXUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwERiuxkZLrQu/HPO+Ija7pkb
 7nEkO1d1zhdYHHHFOPypg7y0T2GENSPDqjq55tapiuklgjtd3BaWhxeJhW6tDn2QFVhi7fxH2J0
 XAA==
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
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/microchip/Kconfig    | 2 +-
 drivers/clk/microchip/clk-core.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

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
index 891bec5fe1bedea826ff9c3bd4099c90e2528ff9..ce3a24e061d145934c84843008efadc3b0e2cffa 100644
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-core.c
@@ -75,6 +75,7 @@
 /* SoC specific clock needed during SPLL clock rate switch */
 static struct clk_hw *pic32_sclk_hw;
 
+#ifdef CONFIG_MATCH_PIC32
 /* add instruction pipeline delay while CPU clock is in-transition. */
 #define cpu_nop5()			\
 do {					\
@@ -84,6 +85,9 @@ do {					\
 	__asm__ __volatile__("nop");	\
 	__asm__ __volatile__("nop");	\
 } while (0)
+#else
+#define cpu_nop5()
+#endif
 
 /* Perpheral bus clocks */
 struct pic32_periph_clk {

-- 
2.52.0

