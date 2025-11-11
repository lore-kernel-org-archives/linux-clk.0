Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BB936B060
	for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 15:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762876220; cv=none; b=LMSKLOUjj+K+InTJgYdkspR4P8QU7hDHPKHcuHQG0IBHwwgG5YBs3E2oTW0BUvx/Td7PXpGKyP7/r+tYSwzHB2V/0VHi1Ibo74LKw7wncaVu8vFcKGkulsjLWSbSLqZT0Yb0/LE6HNuKWM+g9KWXISMyDwpsM/jZ74qTplMk/h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762876220; c=relaxed/simple;
	bh=DHlxEl4Cm3VRdwsbOA/YSIyQycDreMiqXswBc5rWTMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IpvdXhOAY5BiVf39tf82bg8A9E0dMsRqqRGtcg+MBtFRiq4s9R918eLE+kbwNClscj7hwNsd2x1/2Y6yo7BSdnHmeRUC5Jhk0iYT0A+gt2eCh/AdLsmCqWoRJQnG+x8Ftisr/p+S+JwD3B7rLg8KCTs3kimGaMdkOxkoxKIRmgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4rKv81/; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4rKv81/"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ba599137cf8so756953a12.0
        for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 07:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762876218; x=1763481018; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kwxwWH0h/k86KA6Lqbt4Xcny5Xif9KRZerM8f0+lE/Q=;
        b=l4rKv81/JX0GM6mncWXjrWkmY8XtAtwOHkFkeVsXXDSvDNhdrnHd26iM+8gOcPt5gC
         GPohYZFO16Qc9oUdZsSKtNpFktwtlrc+qHY/BdCsnrVDiB3BIJgLc/q4gknKfvRMT45f
         XQQAMN0Ahz6MPTKYqxJ9nzAQ2+019pdjfv0POpV7AX8ESgKgOs7mf3Vk3opaGDE8SvPu
         R/wGNTpq7+JOTqNXG/Dj2XclZxALV6XwWCztoy/hYTk/e3L6b9yaOVyRSVOrDQqWiw97
         T1paQva5C5UDXfCM7Krvk2h35zF9KRij/x9DuLMSGFPnrrtmzcj+nKoG/nB2XSiaGxhi
         p9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762876218; x=1763481018;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwxwWH0h/k86KA6Lqbt4Xcny5Xif9KRZerM8f0+lE/Q=;
        b=XmXFG+hAeClp89mgbxed//PFxUL0EP/3i34Ph8Ww5spsHzLpY/WKAI9FGO1PPcfbUt
         B51MwFmLEQq1Djmcj4yCuzgnWYXJl3yVXofupfdyW5ZRbIbqxVmELqXxC5oaF9QxUPih
         9jp4dh8uEYh2e12458ahp+564up9RLCcBS/0qENIvomrOwV3m8tSIX25hfwqFpXnxyby
         EO2/aefcMcVGpp96tSe/vawNJuB96foYyXT0QL3HBZatoRtRKVcHU5UyLuDG5YKjWar+
         b8AqKi8ZaDvDjYV7VJgrhEVAtWwtwkXjaWpritjU0RF1aYUtIOnNAy6fB+lfqMeJmPuU
         acSw==
X-Gm-Message-State: AOJu0YwFHupsbmZoeQBd1cDNUTPkV1mJMN4Hwx779TNIkyPxgvhZ4wCQ
	04R/7ZwBx2VbZhAH+Rvue2EI7QKm1Y3I8pspK+AbxYiubwwvRYKRcx5rCAwMwGOT
X-Gm-Gg: ASbGnctn7fZMIwkTh3/IQld2AtVmqnNveOnIskPqGm3WwUBIaDbAAcb8LbMMzCvKgp6
	E5c3fNj6tPznsMgkf0S2Z61EnwaC2vLjJKwBQdCIAObqEbBeA4DKF6MkTjoPD5J5SP+dgI69Mx5
	YuVmjNwlzjyD5UbZaFA0pELGCVObek+AhqlEzUUyBOgv7PKUGyEgjLV3Y+FImUf2CCq/ijwxqZh
	YSpFy6+SksILrIHJ0+0gNXmWO42Vow0CJEXOp7+04gc93WPLLU5v1JUGYhuUwnfOnEoXx9Y+1UQ
	dci5MmAwVPYMm9xe65ehnoUzDBbQmuWAuDexyqmpOuzPwUWQpgFU7yWNUweFwYNKHxWrs8QifCi
	nIF9hndDNgAEJKirC+/qLoazt0IvzJ0bryUJfu/uD2qkuSIiV8/pvw1Fh40/OzwR3LOGlBP/GFL
	rs/A==
X-Google-Smtp-Source: AGHT+IFUeZ86WNREaY3JnN9DeD2rSCTPmqw3Crt4HqqKMYEinhAe5X1WLVaqt8s1Jagy5zo/mu0g8Q==
X-Received: by 2002:a17:902:fc4f:b0:295:55f:8ebb with SMTP id d9443c01a7336-298408213e4mr48838695ad.21.1762876217391;
        Tue, 11 Nov 2025 07:50:17 -0800 (PST)
Received: from localhost ([111.55.24.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dbdb09fsm1087615ad.17.2025.11.11.07.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 07:50:17 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Date: Tue, 11 Nov 2025 23:50:09 +0800
Subject: [PATCH v2] clk: spacemit: fix comment typo
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-b4-fix-ccu-mix-typo-v2-1-d64b97b48d1f@gmail.com>
X-B4-Tracking: v=1; b=H4sIADBbE2kC/22NQQqDMBBFryKz7pQkatGuvEdxoeOoA9VIYkNFv
 HtTobuuhvf5/80Onp2wh3uyg+MgXuwcwVwSoLGZB0bpIoNRJtfKFNhm2MsbiV44xbtui0WVFqT
 LnlNFGcTl4jh2TuujjjyKX63bzidBf9Ofr/zrCxo1UtN1bZoXim9ZNUyNPK9kJ6iP4/gAIVCcB
 rYAAAA=
X-Change-ID: 20251028-b4-fix-ccu-mix-typo-038c19fe30c4
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762876212; l=1164;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=DHlxEl4Cm3VRdwsbOA/YSIyQycDreMiqXswBc5rWTMo=;
 b=y7lORg16U5lsvcS9/DoSo7mwT5fo22eEVpj3gCoSuWbYgbLul4lhSwzA8UAzZmSxgvPPJorn1
 KMkTZ/dZIi5AGLNsXQ9FoACulckMazmMA6jsBicgtNXnh6nT7N+o4BK
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=

Fix incorrect comment to match the filename.

Reviewd-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
Hi Stephen,

Could you please take a look at this patch for inclusion?

Thanks!
---
Changes in v2:
- Simplify commit message.
- Link to v1: https://lore.kernel.org/r/20251029-b4-fix-ccu-mix-typo-v1-1-caddb3580e64@gmail.com
---
 drivers/clk/spacemit/ccu_mix.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
index 54d40cd39b27..c406508e3504 100644
--- a/drivers/clk/spacemit/ccu_mix.h
+++ b/drivers/clk/spacemit/ccu_mix.h
@@ -220,4 +220,4 @@ extern const struct clk_ops spacemit_ccu_div_gate_ops;
 extern const struct clk_ops spacemit_ccu_mux_gate_ops;
 extern const struct clk_ops spacemit_ccu_mux_div_ops;
 extern const struct clk_ops spacemit_ccu_mux_div_gate_ops;
-#endif /* _CCU_DIV_H_ */
+#endif /* _CCU_MIX_H_ */

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251028-b4-fix-ccu-mix-typo-038c19fe30c4

Best regards,
-- 
Encrow Thorne <jyc0019@gmail.com>

