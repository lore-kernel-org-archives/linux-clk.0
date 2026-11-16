Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841383;
	b=q1uI/Ceu1Pa2VaP1a9gimGWMmwM8HR2p48V/iRXr1bm2cmcQ+lbsOCf+EkI9heVYGQVt
	 bedkXtj/4nRC6vNJYpLKE16gwSMYMj/J0faKmEMFfkOJGCEFeD4WMFc6Ah+e5C6iPVVQS
	 RiHuAHP1nVRNo/lhD2KddV4PHCzyFYRAlETvBiyf5jfxJnd8aCqf41rehOno5Uh2131q5
	 awRf3JB3l+yQ+kcCtnyK8wgUBc5hpH2cQbQ1BKunuOTkWAUQTIx64eQxbkND7eekDLqVx
	 BfAhTpw/7gZRNbj6kbVMTl7SKCR63lTmt02mWuqS38nAbHnCLN9GZra3vXL3Gcz4fDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C68V8Zp2azDaDb/EYiYQl69ZsdzwyG+42yAMIe0A6Jo=;
	b=Rhxb6Np/HOb++Ywpfl1PmgzQxZuRMnHDVXUkfGivY5q9E7sShZj9EasrGzuboq8w807/
	 pcZNNOvqZFmhnczogbAk+wU2pPTlfJf0Dqbs4tXhDxuQPwHalE9DLPcxA15gllqasVWPA
	 0f4BKafeElDPubbRl5pUJcYRuXMsnATDo11T5G+/A5OxHhYEqRUHnWPtIVJqoA0s/wCFK
	 kQI5Xj9V/7vXhpUUbGW0ggfO4qfbY3l8SNEjruZnV/SH9PqL+Q4zyHZ32b80P35Ip/QFp
	 a7dcvgGIdx3y3IXzHtM37BTXD0UKbMxG8HK3lArvP+fQaaXja/LpOW/l6UyeGZ/dbAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPfo0MX5;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A84606A882
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 15:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81A84606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPfo0MX5
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4cdc606b47so618414666b.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 07:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841381; x=1795446181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C68V8Zp2azDaDb/EYiYQl69ZsdzwyG+42yAMIe0A6Jo=;
        b=TPfo0MX5/qR4L+XUpwvsAIulq5SLhgctltzs/MtnrLc94IsHZh9WyYogU/a5Fo090J
         P44VtWX2wvpxPaGAuNm8bNS0K2a6KFZy25TiIU4NwSEwwBebQhpe2WhBJ5xz30Nl5FMm
         BRteK9fkLxsQEf6pvhNlcw55G7ooH2VR2xkHw1vAhq40GhVQ/IxTBlowyywiAzzYG4Xv
         KdlImwY5zYQhTScNfcNar6QHZSXTorGI4hKl5c8sVSoPO5hISss3807MAe+ZTVjre4MJ
         lGMV9LJ//U6Cj3rlFVp3Z1JcaSYXBZhIbGnZcnFfB/ijGBgDMq6+2xZTkYxU5nur6IXW
         1pRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841381; x=1795446181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C68V8Zp2azDaDb/EYiYQl69ZsdzwyG+42yAMIe0A6Jo=;
        b=m2M7wiyd+28l9foPe+U5e4QS2PzbiNAaLcbsZ0Om8pROaCduJoqtbQK9mdeNdb/t8F
         Cax0tYmxmcY2lzxbR+wn9MihJjkBG0Mpk+blNt2FHpdZTmfhPjK0+YeCHHWbDn67xILS
         stTACjXR73wKs7V5CsSmWrpMdHpMc/+PGFsSP4aajxNd+mXKPY5tFtWI6rrQhbbgA68M
         OMG8IAiocb3wkXiIFM1pppiRQzz77JB+kYqGRWtYvuV0Oy2VH74ha8hJSgUlLFuIHZWE
         6J1PRg51OPjBlMiWq0nAqFiw9PhVHkI55Ui5WSaQ5+a83hpZrkmlOVTQKIizyVw0RmPO
         0QTg==
X-Gm-Message-State: APuU4Z+Pio2Q7ZnodWrNz7NFAD6c5FZdBMAJMXg/UwFhNFiteVTvq9jP
	xkUxR5jPi+pPh6XxkjnsmqXB+Kx90wTiPNq2F4GyCKx0vk5sgZEFeazg
X-Gm-Gg: AYBFou2rCuVGTlLdMlaSISc/gia/Nywbn/53OI/xqBSdcVKRQ+myXyilSDxvZi+/JeX
	Qk8dJk5S3vaE09af6+sP075VVhkL+OUlcLUrXVnsj0djGWUVBy6uINyHrnyXMf3xlAc0G2rTAPz
	xIiVcKPwOi9DBK7fOI3igMjAUuv3h1X0FCnatsZTYbqfvJXdccqSPREil43LdyGfCQMvB8KnT38
	eJuzbcSPYNKArsjFy7Pvj52FXMkafuo6QF4p7cUb5vlUeqJMHS43+KzJrh5ZI+UM3zHE4RfeRPE
	PgJkXfQVX42f4MTm8e3dv2HTIYY2S+9Nq2Bg/VEj+d/5deBuyygNA7u8mgtwFdxgbAYcdRSBohS
	ZqaPanzqN90EbrZQxWHPQv9rBhOTrSl2OWBmtFuaI3IxjibrG0Uk+/zUH0u/JNYaK4pVK+c0LJG
	v48rSGu/8eLyRai2IFEyS8uC7uPNRdaShkyGZ3+L5zYcytQw4ZoR/UWuYiJTAY5bcZSoLPwhp1y
	GRWomVbEy0MGrTAX2hnJcWrUZgynkqtuSu6V0ifsEtV23SysKV34xFaLgL67TloLYZhXKJMk+0V
	kAl+Vylu6zBWvetNlwTuk0zrtbYu37FhQ5nwdA8zzvIEx/Koz/Bqpz56imwRPXlft71fiqwIjGQ
	hnRTTawQL8xbkXqH4jIkFHqhcmlcaIAw=
X-Received: by 2002:a17:907:7b96:b0:c50:62ca:6f7 with SMTP id a640c23a62f3a-c50963b3398mr889831966b.25.1794841380793;
        Mon, 16 Nov 2026 07:03:00 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7eb14sm439306966b.75.2026.11.16.07.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:03:00 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: clock: tegra114: Add IDs for CSI pad clocks
Date: Mon, 16 Nov 2026 17:02:37 +0200
Message-ID: <20261116150239.264139-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116150239.264139-1-clamor95@gmail.com>
References: <20261116150239.264139-1-clamor95@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra114 has CSI pad clock enable bits embedded into PLLD/PLLD2 registers.
Add ids for these clocks. Additionally, move TEGRA114_CLK_CLK_MAX into
clk-tegra114 source.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra114.c         | 1 +
 include/dt-bindings/clock/tegra114-car.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 97f5500b13b5f..80b7f64125d92 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -47,6 +47,7 @@
 #define CPU_FINETRIM_R_FCPU_6_MASK	(0x3 << CPU_FINETRIM_R_FCPU_6_SHIFT)
 
 #define TEGRA114_CLK_PERIPH_BANKS	5
+#define TEGRA114_CLK_CLK_MAX		314
 
 #define PLLC_BASE 0x80
 #define PLLC_MISC2 0x88
diff --git a/include/dt-bindings/clock/tegra114-car.h b/include/dt-bindings/clock/tegra114-car.h
index a93426f008acc..b53f5942f4bae 100644
--- a/include/dt-bindings/clock/tegra114-car.h
+++ b/include/dt-bindings/clock/tegra114-car.h
@@ -341,6 +341,7 @@
 #define TEGRA114_CLK_DSIA_MUX 309
 #define TEGRA114_CLK_DSIB_MUX 310
 #define TEGRA114_CLK_XUSB_SS_DIV2 311
-#define TEGRA114_CLK_CLK_MAX 312
+#define TEGRA114_CLK_CSIA_PAD 312
+#define TEGRA114_CLK_CSIB_PAD 313
 
 #endif	/* _DT_BINDINGS_CLOCK_TEGRA114_CAR_H */
-- 
2.53.0

