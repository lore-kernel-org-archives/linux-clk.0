Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33773146A70
	for <linux-clk@vger.kernel.org>; Tue,  4 Jun 2024 13:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717506342; cv=none; b=BPIyNaM0uerjJ2NfrcgtcFNUoRevK94z3xOEXnTjBH1M7llnkE8On7Ws1+DAqsqV1ME9dy3k9Q5+qb0LU110xAqrNXcLdLpp0GN1MBD0zJK8CEGoklqfGgdXLRtCmXUUvPkqVCwnPfHrvrrHdv8+3nfnw0IhyFcqEho1LrBJoyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717506342; c=relaxed/simple;
	bh=y/0k4cj1U/HXhi7gEv84nKFSEhX46PQFmUke6alZTKM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lF8IKu11PnKxfwp5uM31HgeP8G5YpMzYaLFEc2P5C2y6DY9ZX16muiaLYwziu4WNdfWVeM0ZnU0lM2rN/WMXiEgnGsKBEgsL3skAU6g9EbsebiySEUMoYw8evG+zc6Oz4CPq/6bv+2CEMjxjKV56Blb2p0lPBClW6SkRvjA6Gpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IHhxRvIr; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IHhxRvIr"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52961b77655so1060569e87.2
        for <linux-clk@vger.kernel.org>; Tue, 04 Jun 2024 06:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717506339; x=1718111139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LcPd0EvGWInISD65KsuyYkyeorSvJUBJhZgfuheFWcQ=;
        b=IHhxRvIrT+gMz4JDOEds6mhWWOgLigMBF0gYRpdDTkflPseKVX3bRtI+uTmxpCMFQ/
         nvO0xxZcEgo26yqvsjb4w0IvQqutin63RV1NUV6rAI8FyECDmcJHPUcoWnv+2nGovAkw
         S3cejlEnzUNMwyKDUZ2NMP4csaaz+nX4mCYFHcSaK2pZJQMACxylJzPHbS3q4LMYbISF
         g5Offha7DH3SXcRjYcjSe7aqWZyGJ9Qohg/92yi9TUIP8SB1VLyRXNPCVQ0z93qinEb8
         W91dsjCvvYoHom6C5bxCzqnrCTEUg2gmcTdMNNqfr0BY0+uA4bD2xmKtxCQbyTmGu92I
         UztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717506339; x=1718111139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LcPd0EvGWInISD65KsuyYkyeorSvJUBJhZgfuheFWcQ=;
        b=hfF83RiCPRAEkklOiI+gVuYDGCPB2N4SYg677NK4Jgq7pDkGYBlhqUTXUZ/LuRuavo
         ICGlM8fa/NRf+G4JPKTwcXj7Cj0lg5uQhDjI1PUafPWSjVFiKRj+8l1H0PTw9gttEHCa
         4xiXjiCghB59aZaFOFOw1IBvQtckp+ySL+N5TFZlC609qSzGNPJZN5Jr4rctHWAPv0i4
         QDlB8vABXNprESBSA0TU9rBTw8sDWkanD19AKoudWaNf3XIZmH2zahzGaOJu5ui2tQ7P
         dsKwWNLRXCRRj3+QTtpcIJlK6ngUWR16CbEHATSPSVFsv2MAUt3qYIAgNesRzaAcRnIY
         Vzkg==
X-Forwarded-Encrypted: i=1; AJvYcCXJcpeP/0EwwszMoALJLhzsIJp3fL9iMOVSO/DWM470uUhvljqFli1pNtt2C7KaNm2+o5bLWxEUuM9ZEPow4WdhM3uQNY6Lvm+A
X-Gm-Message-State: AOJu0YxTChm8MAc9AV0TodmD3YT+1Nik/IB0XUAiTAiNUSkDkgSJLiwA
	hCTQ8z0WHbR2NmUEek4v20rcraFibnt7Woo3K0nBzbJXoe4qHgDae2rWyY5+bJVzD1PgB5s1bSJ
	rdSc=
X-Google-Smtp-Source: AGHT+IGQ0jryfZA0LLkh0n2aqxVrJ3UY9JtqM7qOVOHdB/b5Ws7J9Opew6MYO5nTDhRe6XK+lzEUpQ==
X-Received: by 2002:ac2:59c9:0:b0:52b:84bd:345e with SMTP id 2adb3069b0e04-52b8970c011mr7177186e87.43.1717506339216;
        Tue, 04 Jun 2024 06:05:39 -0700 (PDT)
Received: from krzk-bin.. ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42148ae3262sm29798955e9.7.2024.06.04.06.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 06:05:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND PATCH] clk: sifive: prci: fix module autoloading
Date: Tue,  4 Jun 2024 15:05:31 +0200
Message-ID: <20240604130531.170371-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzk@kernel.org>

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
based on the alias from of_device_id table.  Clocks are considered core
components, so usually they are built-in, however these can be built and
used as modules on some generic kernel.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 drivers/clk/sifive/sifive-prci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
index b32a59fe55e7..caba0400f8a2 100644
--- a/drivers/clk/sifive/sifive-prci.c
+++ b/drivers/clk/sifive/sifive-prci.c
@@ -603,6 +603,7 @@ static const struct of_device_id sifive_prci_of_match[] = {
 	{.compatible = "sifive,fu740-c000-prci", .data = &prci_clk_fu740},
 	{}
 };
+MODULE_DEVICE_TABLE(of, sifive_prci_of_match);
 
 static struct platform_driver sifive_prci_driver = {
 	.driver = {
-- 
2.43.0

