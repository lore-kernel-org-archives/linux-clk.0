Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEA224169D
	for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 12:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769171667; cv=none; b=osvvIXI1wfkoy9yQW9Ti53udT5Lo0ybz2U76l2xnZICmfs9QJttO5GwTSUFFQmSl29Zh/8j5trlVTvZiRKbZvKiz1I5MZXdH/L+aiApLX6B4utqwzTiywjpF3ZnJJE5oSCSsGKLoDDLuXAxOz7R6caID86qfUTEiPnWJWbCITpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769171667; c=relaxed/simple;
	bh=FIGj9FZrmImtiWpOTbEOzugiJ2mKW0hNxQ5/ly9bK1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=c10rL9Rv4wXZuC7qvTaYYPTII769nEI0zqT3usu6/RBySXnG0ePvkqxEsIy7D4MWwkABob7xBQ8WZ5P1OgiEJBhrWSDHT6mvRQaFxadszFCcByIYgUT1EnFcPWr0N55+kzBHMs3TK25mz+jAF4TUKJgiwNRvpry5rBTGO6JhIK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QA3ANFbn; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QA3ANFbn"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0d67f1877so14556625ad.2
        for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 04:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769171666; x=1769776466; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mvBiaavqtd9LY5Ii8rhgJkezou7YdhX95jkANYYyhgI=;
        b=QA3ANFbnThGZcUbmBXzzX+xFnLpj0kvKI8ZuMs2vr32EArk3EO5jZnJJaQ6BykI8gf
         gvrPWhGKOiqaQaLrIH7cx3d6GhrH5hdSmua3Y7ob6NcHBfopicjOwzYHftiorlFZ3p+w
         tzgYPP/gNKXS5yTvxDkQV+z+L3ksTvM4R3AqvJCry+f+cvAAScOY1C3+iiGPj3oVLdV/
         yUXj3jAxpSKXBLFjbFZIonVo8pNJXJBXBCq03SaFRZWOZJkRlrvJPv+ehZeS7iAghr5X
         nc/dCqzETeiRvZ9KKhSQT/ZIh+aIqbruk8exrQIWHv6tUQjxLobPtExdfZ5kQNqHL2Ov
         gTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769171666; x=1769776466;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvBiaavqtd9LY5Ii8rhgJkezou7YdhX95jkANYYyhgI=;
        b=okZO0SZ+LqYemQ40MHV9y/gljdsoFJg73ZYcm54GfvxRzJipwoZityiEfBPVpcRUTn
         l91QlIZpqSBR1loD0DV6ZgOeCKVitz2MC0QLRlQvTcsECXfEhVCeHLdYmgbxxdljG5k4
         IeYyM03UJ/1UrNE9r5c0yyW3nVHYaiMyT44/tPSDPn2krGiU14/n0/cNT31GroIrCHmA
         Qo8YGMHAh1F2TAYGnyttduJDUnYziTcIAMC2U9s0tqA4CIsjIB2PAyY6bfrIrbWoNilP
         7wDwwTJ+kJPOPkNkdJDL46ZI//MNfip1+lAIjJGs2WtTOYh70mJxPom4MdT4p3qpVB22
         F3pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF9bxrjmZ5ZQWa0Y1ousvdPMARlsEovJCuLV4wY+BDtSlyJ4pptNGE1K6aAUCPKBlak6obE06xOhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeE+PdvBYv4fGVSeGIbXGGz3PZEdv21nLExf204matg0Ful+A+
	E2qsXtTIAiRGplDwJhwYklaZUNL5BZ9a48vzD9nXY+aAZ+2dJAT3mPPK
X-Gm-Gg: AZuq6aJCuK7GVtSTBxqf7mZLDnDc+HOknupZr1RNdcBELDMFl3uxcXv105aODqBppHv
	lVwd+f7oueW47CAeYTSov6hgjEeUDQh8uPFpcBNq7Em16+VXfUH4WlYx/3gOZyEGQ0nIOkrKUT6
	n9qtB7HiBjWqu3Oo8ceIuc0GlADMetAJ7RM5PkD5QvStBAmXNA++fwMH0WblqT4NxxQydvINnoe
	QjCJXRIFipj0b+0QnO0vNb4MDVHINsBCKE0cu1jIT0eS5uCoreqp05q3/Wk2OTOtJbejNE7Im6P
	GQ6dUT2N69oIpYQz8rjVG9biTgZ2Pmrn8ZxcMd/7luvoSG9IGsnngniaV1wNDexFucWEa0dLLPY
	jvE3PmhU/rYqOxYZAOHsU3S6oF4iMargl0FRA5Gaq2lJPHKxynjo3JCSv0L0M5QtY/6iyEudadK
	uXtuDxdCwkuC1JQ0taLbCfttLf
X-Received: by 2002:a17:90b:1d08:b0:34f:62e7:4cec with SMTP id 98e67ed59e1d1-3536701fba4mr2232138a91.5.1769171665608;
        Fri, 23 Jan 2026 04:34:25 -0800 (PST)
Received: from junjungu-PC.localdomain ([188.253.124.86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536dc506d0sm2032799a91.13.2026.01.23.04.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 04:34:25 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 23 Jan 2026 20:34:16 +0800
Subject: [PATCH] clk: tegra: tegra124-emc: Fix reference leak in
 tegra124_clk_register_emc()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-tegra124-v1-1-5e0a5b499d1f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMhqc2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyNj3ZLU9KJEQyMT3SRzI1MDgxQzE7NEEyWg8oKi1LTMCrBR0bG1tQB
 lU4+WWgAAAA==
X-Change-ID: 20260123-tegra124-b72500d646a4
To: Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>, linux-clk@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769171660; l=1103;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=FIGj9FZrmImtiWpOTbEOzugiJ2mKW0hNxQ5/ly9bK1c=;
 b=fkuibI4lprHgaNXSHUfQ+BS1KhYfyCcmALccRzdfryn+SXPEZdC7v0BDpJbL1Bs+oKg7BpZhH
 9LgTGww6TTADDGeVQFOuAefPOb9qmr4RAZizsEe6HWWvNZ1fkxvX72B
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

The tegra->emc_node is obtained via of_parse_phandle(), which increments
the reference count of the device node. This reference must be released
in the error path when clk_register() fails to avoid a device node
reference leak.
Add the missing of_node_put() call in the error handling path.

Fixes: 2db04f16b589 ("clk: tegra: Add EMC clock driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/clk/tegra/clk-tegra124-emc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/tegra/clk-tegra124-emc.c b/drivers/clk/tegra/clk-tegra124-emc.c
index 251209ac50db..802a6ff4da7a 100644
--- a/drivers/clk/tegra/clk-tegra124-emc.c
+++ b/drivers/clk/tegra/clk-tegra124-emc.c
@@ -537,6 +537,7 @@ struct clk *tegra124_clk_register_emc(void __iomem *base, struct device_node *np
 
 	clk = clk_register(NULL, &tegra->hw);
 	if (IS_ERR(clk)) {
+		of_node_put(tegra->emc_node);
 		kfree(tegra);
 		return clk;
 	}

---
base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
change-id: 20260123-tegra124-b72500d646a4

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

