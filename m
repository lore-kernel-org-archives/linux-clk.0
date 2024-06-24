Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7D511187
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 02:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719195353; cv=none; b=XWeBQa73R0e3VNYYFKboSqsSzP+abXme474hJ54mUD/DW5vfUPmj5SIv7CD+QRaYwhvvn2RTU1yJ+XHMU51jDBxQzlg+hZOR/p25WL/4AlD8726CvBK2KNWG5Py8WCZoWxukY58ZMGpJmdsNIkSZhx4P3cqb4THLFpC9PXRDSME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719195353; c=relaxed/simple;
	bh=1YUFcjPStRQXnRCkm7LFCYqYtH2keuIc2Ndi6ymcweU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IyL04E9RqvPe7HJfynL0xbmpHlYtl0Tpr9oSwS2oNUBv0lgNxMN1WIPntTM45AugN8WpuKLZ8ngNqs8L0ucoRFfVmI4SafoxnpEDBk+v4ZgDN00jtNA6ob6SPiAYEfrKO4HJxJd9UdF6HCnWs2tGku3a2iJMvKcSYTNCUGr4thU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=fgnbBznD; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="fgnbBznD"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-707040e3017so2706987a12.3
        for <linux-clk@vger.kernel.org>; Sun, 23 Jun 2024 19:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1719195350; x=1719800150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RnFMVS1MfqfzWdRfEx5FfQB3Afj3yo7GkFlPsBGziDs=;
        b=fgnbBznDKBgHEp85hB3oytFzmBmU0N6ReztuGz6ItPkZuopcwGEhZw6IVR5lTzQPhM
         lOymGkxScIAMrdZXUwR2qAYY7mLrYw8heScKupL5AcAJSxIn/L+gCAwBrsVbygnQkrTu
         U0uFAxdn2mKY4U8V6S6jB0+UDU69sGWZa7zgkeiz4ze64fl/JLMxHE4mg1xdaf+Hl9bC
         c3Tdhx36otNJyCYrgNQPCKcxrTAOOw2BsD6ckGAl+pV1+c2wFHamozlFitP9GjMa9QsF
         LshoaD5002Xa2EhbRuHKXMCOCN2VSiTC7mHudMfjFwrPeWU+XpHO6mGzmGs5mtIHpZN8
         q1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719195350; x=1719800150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RnFMVS1MfqfzWdRfEx5FfQB3Afj3yo7GkFlPsBGziDs=;
        b=Tbjqa5rLaLwMVN3v7fa3mRZimxmcH4ylZdWkGa4NWtdf883XICreBYfwnOOb754jLa
         7IowFSs/rdaC6Ay1ZFuEyX74c1kKgmIH548VBVKIgoeb0YSETHAuWisr8SHKVmGOjehS
         ZFMghAHo/e/NUoIxGx0fTtgMb/YYUhb+77iIAVlygtZoLfdgogE40eIo356fxaxf0AIt
         WjP6UhVCLh4mlGyDdewMFKjMcrfg0b161gNvlvPpbb4M4gRb0+9pGR4sYixKj3+H5N5V
         yLtxmJ6XVY5IkEcKWwYxymmCVFaj0yZ2IJQFjvzhcjlpuLel3CTVKoqZ/5Ccqum7tlbf
         3jnw==
X-Forwarded-Encrypted: i=1; AJvYcCXBF6FJFtonNBhSl1JgEbJ8MKeWY4f+AJF1WS6N6UbfgwoZTiyyNLFu1Q/mTduAYys+o3zlcwrptL9cJZ1GtnByJqkpVTMYeeQV
X-Gm-Message-State: AOJu0Yw4j1t7Tf6BGoDWie+dTaJkJPlXxuIHlvFovk7cvIQJYiZ5rXaQ
	NSxdkbR+6Ob5Alh87zbsUKG9YMeQrk9adfxel8OBXz9id1o6fxVcPusOPp5FpqweAem0eS+cPG/
	T
X-Google-Smtp-Source: AGHT+IHW6HWUX6v/07vrhz8vJOF/5qYP0BvoXQ21bV6naDfQXKTOF3D8FapemtVEDDfuAXBOASPQqA==
X-Received: by 2002:a05:6a21:c98:b0:1b6:d9fa:8be with SMTP id adf61e73a8af0-1bcf7fd1210mr4394592637.40.1719195350539;
        Sun, 23 Jun 2024 19:15:50 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:1584:936e:5eb0:fab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-706511b137csm5071770b3a.86.2024.06.23.19.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 19:15:50 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sun, 23 Jun 2024 19:12:37 -0700
Subject: [PATCH v2 7/7] riscv: dts: thead: add clock to TH1520 gpio nodes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-th1520-clk-v2-7-ad8d6432d9fb@tenstorrent.com>
References: <20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com>
In-Reply-To: <20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719195343; l=1705;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=1YUFcjPStRQXnRCkm7LFCYqYtH2keuIc2Ndi6ymcweU=;
 b=rYBGKNJzXmCmLAga5clXqSFTTT6acEgLUJTAcP100RcfUjqlXe3oY4DKYzEONUhMhRslOqumq
 IBxq129anadAhKP9VsQmsnBjrF17brGOw1fgRg6bSOgGM2pr+vivXcb
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=

Add clock property to TH1520 gpio controller nodes. These clock gates
refer to corresponding enable bits in the peripheral clock gate control
register. Refer to register PERI_CLK_CFG in section 4.4.2.2.52 of the
TH1520 System User Manual.

Link: https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index d05002ad7c96..351e09beab70 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -237,6 +237,7 @@ gpio2: gpio@ffe7f34000 {
 			reg = <0xff 0xe7f34000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			clocks = <&clk CLK_GPIO2>;
 
 			portc: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -255,6 +256,7 @@ gpio3: gpio@ffe7f38000 {
 			reg = <0xff 0xe7f38000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			clocks = <&clk CLK_GPIO3>;
 
 			portd: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -273,6 +275,7 @@ gpio0: gpio@ffec005000 {
 			reg = <0xff 0xec005000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			clocks = <&clk CLK_GPIO0>;
 
 			porta: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -291,6 +294,7 @@ gpio1: gpio@ffec006000 {
 			reg = <0xff 0xec006000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			clocks = <&clk CLK_GPIO1>;
 
 			portb: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";

-- 
2.34.1

