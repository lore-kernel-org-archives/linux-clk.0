Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D37F16EB67
	for <linux-clk@vger.kernel.org>; Thu, 11 Jul 2024 16:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720716998; cv=none; b=K0FFzj3e73ai7Wd6BFafcfoKGR0bcXS9EHxkWxqQXnU1JwbOa+bgZUSK5DhSJKcJS2gfgymWC88N+I8QExvi8QNQtdUvPjvfl+f7EnZi5xRYtKsmTkuFnoHzEOKWQhqZy+pjkCB0hWHEUORmvyYWW7hYCbzY5dnTi6+oIOk+omI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720716998; c=relaxed/simple;
	bh=1YUFcjPStRQXnRCkm7LFCYqYtH2keuIc2Ndi6ymcweU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ftIfLux7g1cVlgU4ZaE4+JjR8YoFTnHnevv/yOseqfo6TucoW6IciCFbLoqSmXq/wRbCAGJVv9Tr27qmYY5VPpFBvulMvISZ7lD3bDM2W4i3EOp+Y8OsWySgdm9FagLYXhzEbxSnLMClYjAe/RzBvbl8BfzSlN/4kSQmrruW7OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=QLu8Yi8W; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="QLu8Yi8W"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70b09cb7776so979079b3a.1
        for <linux-clk@vger.kernel.org>; Thu, 11 Jul 2024 09:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1720716997; x=1721321797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RnFMVS1MfqfzWdRfEx5FfQB3Afj3yo7GkFlPsBGziDs=;
        b=QLu8Yi8W9jXhBwmTH8L5/MsKKkFI/yMruLTuhGBDK7XuCDsTbEC7BxNsjrwW+IxBuf
         me1C51CHACd5fGWZoUjetloR5FVyfmjCzcxnz0rucexDJm02R2cTz8lFMvhHlGe7JvzF
         yNn5YD8W0X+MFwJso43xJzq0JWmnK4HsWLSWwo/xztHaaf5IbvET385haQ4xULjFWFWm
         tpbr98yvtrQDaoyAgZGCMZp8PUI/cumQMP3I9L1eWU0tQrBRSUv0sipqEnxIz/76g0e8
         b6VT4l5/86PbHYHTbI8OVhrc2mk+2PQh1p+PZk3mxmG7AB1JN34SbWp1Lq7qw4fbIUW4
         F05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720716997; x=1721321797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RnFMVS1MfqfzWdRfEx5FfQB3Afj3yo7GkFlPsBGziDs=;
        b=bcxoggpKZZIGi+Q/TwnCI52TiOOxW042Kq4b3gdiNAjDjInJjQjt4vvOvknmj7eVE7
         wzig3zq4ZhdEx/Do28yxuTCHey9CngpV/J/8dxowF2Uk0TfxG7Tj4II63oMOdeDFnItn
         nWeBGzPIZN3ilKgsy7aYv1FK1rW2T1X3E2LX6JVkJoz8AglNNtBtsVuUy6XrepssyJsh
         TbE9DvzAM1uQ1XtRrtQCdeFH2zKjeae940VhQgbqeqpAsbgrt6qw2FKN7MZKKGLVYoJl
         dSzW+/Lj95NCuUJ86QiWPixL/tjBwVYSwGtyFGAgJl5Zu3o7O41SHyP+N/35PjT0N7xF
         m0Ow==
X-Forwarded-Encrypted: i=1; AJvYcCWAXxdOe9bTLmFSem8oPYvLDWBzqZi9CuyqbyYwBaNf6meMKuteejamKf8pANWTwWWfp8kk1Ek0plCLz2CppcBq3EuCb515kO6e
X-Gm-Message-State: AOJu0YyZcsJ9DmvnW1UBdaLaI7dIrGUBe4gPyWlpzX2x+NuPh/wuKvY1
	enR0d/eNkckqB2dsNUn4kugi7V8jMNVC7GairkVN78qvMS00VNc3FZ4wdkvBm+Q=
X-Google-Smtp-Source: AGHT+IGS+uYFXfGJ90lMZHo8zEZEN9G4YU5Eh+g8USyZFzpQSYTOEhmT81CJZkVjdrCsmZvpPP5WZQ==
X-Received: by 2002:a05:6a00:982:b0:70a:97d9:5b9e with SMTP id d2e1a72fcca58-70b435422ccmr9355831b3a.10.1720716996791;
        Thu, 11 Jul 2024 09:56:36 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:5ee9:fea0:d9de:cee8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-787089bc5f6sm1360038a12.92.2024.07.11.09.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 09:56:36 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Thu, 11 Jul 2024 09:56:25 -0700
Subject: [PATCH v3 7/7] riscv: dts: thead: add clock to TH1520 gpio nodes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240711-th1520-clk-v3-7-6ff17bb318fb@tenstorrent.com>
References: <20240711-th1520-clk-v3-0-6ff17bb318fb@tenstorrent.com>
In-Reply-To: <20240711-th1520-clk-v3-0-6ff17bb318fb@tenstorrent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720716985; l=1705;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=1YUFcjPStRQXnRCkm7LFCYqYtH2keuIc2Ndi6ymcweU=;
 b=xWMNMMf5ekN/VYMwCX4FKmLzMFMloIZ7DBupsg48lPSc0R8C8P8pGDv0fotGiJvk2zgTldVTs
 naf1OfccBxoDU7TIFEin5viNRAEti7jbOgJfpdSDyNt29e7mjJpUsBG
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

