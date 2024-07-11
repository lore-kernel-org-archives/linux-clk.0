Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3947816D4F4
	for <linux-clk@vger.kernel.org>; Thu, 11 Jul 2024 16:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720716991; cv=none; b=YLADXJ7WYI7+zPel3DWtva9zggWqgVT5JENEq3mwcUKtt5TMcccHZwrXMRL2dllG19Nvxd72gMX6d/ZjP2p9HIhu5498nCd6rS6dWqTaYbdZNByXsVKzeDTN9RHN49acH7yqoX2f7z+nv9jr9xceof3ClKkq9mukk5rTBVhHnkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720716991; c=relaxed/simple;
	bh=sYDrZi/IT7Clln9yQAfkFJd8E3JI+vZ/XaYw2j6k+PM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vz4Fx4nqvCOqpCkqL1bIxwZBRSuWAos4cRK0aGSHJvgm2bVp6X6B8cm60k343QrJ9QitRWAIoPFsZog1Y32gFlb4XqgEdgaCUDDm+ZXPZ+7nUzojnRVQ3UD5HWBxI6v+I8EYK8rv0yhhRuHVhv5eOW54V9/ITQb8sWXETaz/aLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=JEyoZcDQ; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="JEyoZcDQ"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-70362cb061aso591832a34.1
        for <linux-clk@vger.kernel.org>; Thu, 11 Jul 2024 09:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1720716989; x=1721321789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3Qnbx+iUmsO5hmeumK/swjsC50+il8elHCmTBS0mBE=;
        b=JEyoZcDQtLh5U9gYBuLeLbNHWxmrmusYblr40DhqIW7KLL3ONfDVYJ23cbFwcku4j9
         yRHkkFGABgzTPxW0DMfY03SiiwcUEJn/NfJtVYQL3vRHNCtGGLb+Gd3IJ90rN7Z9Y2ZP
         Fh2eimGRT/j4ubZ5RzemiS13mdSRkRQdcDKTBh5MysWXRxBkdhaZepU/x/3/kw87IzIW
         D4XjJl9v0lu7FtSvw6m5K7sCY2UT3cPnpehsdMlwjhSZCCsxgSiEBMmyoK/p8Lws7tfc
         IWc6/9J44+bs0iGIF7THkhhlnBhh76Hz3VwyZKwUDaj9WZy9HfiaMn5C0qDP0K7dQ8a/
         zU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720716989; x=1721321789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3Qnbx+iUmsO5hmeumK/swjsC50+il8elHCmTBS0mBE=;
        b=EeMlnJsr8rCcv18W59IwzvOCQxp2lx2+j0wbwuo565EjSXKBM1Fqf+GUNxW3IJtTKt
         2gziksQwIuqQGsrn3dO6VlpbTy0953Mo/6tjeTo+kw6v3sTfphoHaX3rvOyl81Z/08So
         S3tcrRWG+YvJWhK08NteZFOPic6l5ygy2y2JT6Vj8ShNqUv5AF5xvdyAYQeKL6TdDtzE
         D5lehKOgOmGZtxJhIhaHbP+BlEUEXfHRHblCie9x/EJvvqdEcdV1W9f2A0AIlE1/HpAm
         jjag/resiuDAK83YmMAQt5T+qeF1pdk5B+CAbIWM8BwCwV66oGB25o/JoiHA47+r5vit
         Xwiw==
X-Forwarded-Encrypted: i=1; AJvYcCU7P3/zawrBeugwfFt6DPYJ56PSWwqqJzGwsE0TdlvxBmaEoPl4iFlPwpVoGUaBeuhZ5gt6Zv8DsUFj0LoTy/1Oc7WrIHCeN32P
X-Gm-Message-State: AOJu0YwlZ9Wd38f6fFDuY7jRitAcxZENfDkd1+mfKxe/LB18RgjR+sQC
	l3hUSZFAnxvq0mxB7wbADfzve93Ukea1I7VW0+eZoYrqPtaa12PjaQmNFFzHGZM=
X-Google-Smtp-Source: AGHT+IFT11cDKx1ITw8GMjOL9UGcw5whIW+QoK906Roo3HeBs1RdbW9Be5+V9SHoXTtfetGFJkarfA==
X-Received: by 2002:a05:6830:10cc:b0:704:4b6f:ac87 with SMTP id 46e09a7af769-7044b6fad6amr5865662a34.17.1720716989421;
        Thu, 11 Jul 2024 09:56:29 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:5ee9:fea0:d9de:cee8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-787089bc5f6sm1360038a12.92.2024.07.11.09.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 09:56:29 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Thu, 11 Jul 2024 09:56:21 -0700
Subject: [PATCH v3 3/7] riscv: dts: thead: Add TH1520 AP_SUBSYS clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240711-th1520-clk-v3-3-6ff17bb318fb@tenstorrent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720716985; l=1213;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=sYDrZi/IT7Clln9yQAfkFJd8E3JI+vZ/XaYw2j6k+PM=;
 b=wUrrFs5q2J1pzVgeXUmh4OazEalf5YR5o4KRGJccYDi2MKdzK9ga2hXoA5XTCRa+cFkuSufnJ
 8urCX2niya3A1uefhZS985sJ9D73ukNMDwmyPRrI5M1Eacls5UR+wTd
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=

Add node for the AP_SUBSYS clock controller on the T-Head TH1520 SoC.

Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
Link: https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index d2fa25839012..10a38ed55658 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/thead,th1520-clk-ap.h>
 
 / {
 	compatible = "thead,th1520";
@@ -161,6 +162,13 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		clk: clock-controller@ffef010000 {
+			compatible = "thead,th1520-clk-ap";
+			reg = <0xff 0xef010000 0x0 0x1000>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+
 		plic: interrupt-controller@ffd8000000 {
 			compatible = "thead,th1520-plic", "thead,c900-plic";
 			reg = <0xff 0xd8000000 0x0 0x01000000>;

-- 
2.34.1

