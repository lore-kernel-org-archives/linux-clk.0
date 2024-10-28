Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A4F1DE2A7
	for <linux-clk@vger.kernel.org>; Mon, 28 Oct 2024 14:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730124457; cv=none; b=efpZ0r+ND1JWW+LmkorH+VbW2/hKIWVO5ATF0ECwVUTR9UQuuKesjsPClwcUtUqYuw7h0VjGMJUyq8/J4DhhIXXCwOerC1irWzxHsNrMRuDJDm+JXNxJOVnK9pDbDQZ1xcBGFKu4Niu59vspLekbmv0y7hEeo0tFYV1JiRY5C5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730124457; c=relaxed/simple;
	bh=rKJ6g2zPe+AmVP+2VuYqwsDW7Vw/1jwj4Zek+anRIcU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DmeVn8MWRhegHs7VGGFLKYcx7gncqbn/vUAnA9vHnh0AO6g7AwP7DBGU7OLgBYwR+4WGAfFDgTb94ZgZA4xg+seADW+oJAB9CEOv0Ul4zyqeTL+yJT+nwxIcvp43sHVIBvtSxcPBUufFsydaC3Z8YBajSaEQLlCJuA1LHGQb+Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K8FS8A5p; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K8FS8A5p"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5cbb6166c06so3739922a12.0
        for <linux-clk@vger.kernel.org>; Mon, 28 Oct 2024 07:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730124448; x=1730729248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExSdnw6SFXuTqFss0pRdd0b0/LidGX7ZLflADrh46f0=;
        b=K8FS8A5pzi2HL1uN/tNmS6bsPHpWmMmY3ix81otlH3SH0FMyrYmuR0M/5e4rwS4nsi
         BxOMelx4sWzG3IsM/Anz3uSIGX1DczEkCG0j9kd1clHRr76+6ei4ZsFv0coMInojadhT
         alBQua7+yax9fgncMlHN+QvJ1s17GLDJdHUE07sVdJdqPttZGcLCO2DSNTMnSStd7kRO
         mVuUwiOTqgiIvn4ijywa6XQvsHOK/AeULfKY3oQ0ejRQwUb4vZFbwz1RK25tTAkaaAFJ
         X+cfLitMl5FGX2viMmU4FRh3qnZI6I/Xcl/KlBoxmUJhb9non9TZZqNtIOcZgx2tTTtt
         KCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124448; x=1730729248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExSdnw6SFXuTqFss0pRdd0b0/LidGX7ZLflADrh46f0=;
        b=qe9b9qSsIgz0NAlDoqIo79FToPX3QrV9xEeT7By4msP/jYCUNYNMTzXGvZ9uU/gtIW
         OINJ/1f1iw6dZXemU0Jr5QjKi3OOSRNVS2yACEnUG8dngXED4KZl0OGJ4Gis2LCQQuZh
         d7q1PFKweKqOqEg2v9/LHMBv96AttMA4iLfH1YE+Ay4bfDvtsU1gF7f+7JNcnAx21o/j
         qJac/8vNoEovfY/xGwM6euyk/7rEUMcP/OR8d341KUpoNFJpAj8GkyadzcxBAe842Ruu
         S+YN9Dq3Z4nOToR+aq6zHZV+8e+4o7pK9ctZWZ1YOGFWrLN2Bo8dM2nxudrBVV31HwAl
         4xMg==
X-Forwarded-Encrypted: i=1; AJvYcCUbx7UJ+yzOsp6c1Za19+milL2SfZIjRdkkr7AjtjrgSlkxGiQ9RRUK6ZPOUvmZ7DmJ8VenRrkX4r0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNKKq0UykQqu45NTWIFqWNljNqBlm3qwKHrf6c2VSs7oM7OQUH
	zyk7x+s98VSgGU3V9fJIt+AE0WBo3nmcWpFiAddNT+uDRDUH+e3H2VoOve8d0nU=
X-Google-Smtp-Source: AGHT+IGfZma7X0ezVVYvvMm++bwyKvKeoZexLczbfZgPE9InzBp7Q/p9irVjhvXQTbzMj3l4IWc0BQ==
X-Received: by 2002:a17:907:9608:b0:a9a:835:b4eb with SMTP id a640c23a62f3a-a9de5fa6071mr718089466b.38.1730124447425;
        Mon, 28 Oct 2024 07:07:27 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f029559sm380642166b.58.2024.10.28.07.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:07:27 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v3 11/12] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Mon, 28 Oct 2024 15:07:28 +0100
Message-ID: <13ad41f172cc8605cb9b324ea0f22296c4c97033.1730123575.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1730123575.git.andrea.porta@suse.com>
References: <cover.1730123575.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
Add clk_rp1_xosc node to provide that.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 6e5a984c1d4e..efdf9abf04c4 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -38,6 +38,13 @@ clk_emmc2: clk-emmc2 {
 			clock-frequency = <200000000>;
 			clock-output-names = "emmc2-clock";
 		};
+
+		clk_rp1_xosc: clock-rp1-xosc {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-output-names = "rp1-xosc";
+			clock-frequency = <50000000>;
+		};
 	};
 
 	cpus: cpus {
-- 
2.35.3

