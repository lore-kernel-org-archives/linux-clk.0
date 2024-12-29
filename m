Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B1F2BAEF
	for <linux-clk@vger.kernel.org>; Sun, 29 Dec 2024 07:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735458469; cv=none; b=hQqySmHkW32av+X0x+9/vxC81yfCluNki0ALNn6to3rDi4cOP5Pk8XZDTN7x7OT1BtvrZdfaBBDaHrbgwPegEuENSjWXXQerqO6U/iOi8W9LH5ep0sOm2uWcouCtvhaaJfS/lxdNXnDlSZs9LtBrdcc+qpJCIUZhmZigEA37YZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735458469; c=relaxed/simple;
	bh=r2fl+aSZQSe4Gu96IWu9ki/qiNVdSrpnUYBU3JUFi8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d/8vdNv9f6vutOLvkHD9OWMCEeyhd1wOX3TtvvBy46b6yGNoN+FUvxCWGY0sc1dLHERbT6e8b/NlU6PDjmRQux/lL2nNpL+0ocVk8YLL32fIlPa4WcLVuDF+FEaINq96JWVBfd0EBwEnWfoQqJ1p144GAVWRI7RZ9SvKZwpDZFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=Z15hKbX0; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="Z15hKbX0"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-216281bc30fso122687325ad.0
        for <linux-clk@vger.kernel.org>; Sat, 28 Dec 2024 23:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1735458467; x=1736063267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/p3qag0MQVENrEZ+1Hv+br5ltoCbdPuVgxId6PkIedY=;
        b=Z15hKbX05Jk719Fjl3o53HMLbRYoCHqSd/x539mBZNpsdqfUTd7/QvDugUmIheeKFz
         xQiJmqrC/iXQpZ1k+NKgd2wyLmgg7uJ2AbVVBJpbMAmjRLRQhWJLjxcoapCDM+IUOi62
         QdqXcqyNBu89CBW06ki5SEWGP9mAwMQjG3gEz/QsnQp+r7CpDz1CrU5MOno7z0lM2+Yl
         yxmWUigln7jwDqKZYpHPrY6IJ4e+HL8JjPZnTZTuJBScoyOIgcWStcwWjMHKLi35oxjK
         IOrYga+HJcksbSzSgjVwGm7q4aIXuEHU7W5sxtTrdApjs2/fIOiFvRiyR4qDRTq6q9aD
         BsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735458467; x=1736063267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/p3qag0MQVENrEZ+1Hv+br5ltoCbdPuVgxId6PkIedY=;
        b=luXp+XSGukXa99CLUSLKoO8iX+p2G/Tj0+bkG7me7WMu8pBTzzq0DkW8sJiMoGrOVX
         r9XXc6Iyi3bNJMute0zmryHIeV/Fkg69z3+wbgcDxLwnCucNx3DxuOs5KtlC/CZbMq7s
         Q2EkRgbNpD6uRyE0D7Y8LSQ05ZEiny5h+FnUfKy9XeMu+0Y8jA9k/WhZ5idYmGN0qWcT
         hNLujfcQG1oKl7wVV14+oHci88J1v9DDofeIp/tgEqxzbyHYKoZYH4OKAvM+s8XkgmB1
         Wl/726mJf9Q7TTVJ3uo9tYnXl3XgCGZVNGgzrg+AaHTD0CFTy995c0nZ5BhdRU/ovhL5
         OgQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYyEOChXCipViBEAFMQta+MUVwEGBk/GwEjpnsVHCTVOrBCxjyaiLMzkVELVecLlmbAeqb//5M+Oo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNMykALCgahx/AZpSFM2XlwvH4asQNETKjGupSkYbpgk/ulll4
	4Ket1w02l2gJhR5Zdr0JPZwQOuTaGV1osuFth5qBjacrzi3CbKVnxghL8GGyGqI=
X-Gm-Gg: ASbGnct6mCQ3Ep32cNrDTJe7GKnRUKoXZtyCtpmpTDOpMTd6xpNHay4BXvoIUogeBIe
	I5VKBE9bsq3LMFDUOqzQPnW2+xxZ/ZCSHQuGvaX/QJwGtAqd+v0SfiB88nc+We2wbLZJDKkMMgt
	ngs2XALX5obZoDdzx14iM7N22+RaOKF6SHguuxFYiY1Tn/LTTMdZzDpda23Z9BpiyU4R86aHegi
	CdFuZOECuLa9QOY5kk/i/5CyeXXJJZahAE8U90mI2oMPJRSP3J67OKdXDfcfhxuQsReQ1vR+lD4
	wefoFLtkNeIbWRoA
X-Google-Smtp-Source: AGHT+IEjtnq5bXcHCrVotkW4MshmrYYKyL0Pyq/ZCNXYcjJHuEB1Y7i8WdyieJmaU8IJndr258gDnw==
X-Received: by 2002:a05:6a20:e68b:b0:1e1:d26:6657 with SMTP id adf61e73a8af0-1e5e080cb8emr49478295637.42.1735458467002;
        Sat, 28 Dec 2024 23:47:47 -0800 (PST)
Received: from [127.0.1.1] (75-164-218-15.ptld.qwest.net. [75.164.218.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72afb196c04sm7907658b3a.150.2024.12.28.23.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 23:47:46 -0800 (PST)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sat, 28 Dec 2024 23:47:42 -0800
Subject: [PATCH 1/2] clk: thead: Fix clk gate registration to pass flags
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241228-th1520-clk_ignore_unused-v1-1-c8f6333d1784@tenstorrent.com>
References: <20241228-th1520-clk_ignore_unused-v1-0-c8f6333d1784@tenstorrent.com>
In-Reply-To: <20241228-th1520-clk_ignore_unused-v1-0-c8f6333d1784@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Yangtao Li <frank.li@vivo.com>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1

Modify the call to devm_clk_hw_register_gate_parent_data() to actually
pass the clk flags from hw.init instead of just 0. This is necessary to
allow individual clk gates to specify their own clk flags.

Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 drivers/clk/thead/clk-th1520-ap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index 1015fab95251..c95b6e26ca53 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -1048,7 +1048,8 @@ static int th1520_clk_probe(struct platform_device *pdev)
 		hw = devm_clk_hw_register_gate_parent_data(dev,
 							   cg->common.hw.init->name,
 							   cg->common.hw.init->parent_data,
-							   0, base + cg->common.cfg0,
+							   cg->common.hw.init->flags,
+							   base + cg->common.cfg0,
 							   ffs(cg->enable) - 1, 0, NULL);
 		if (IS_ERR(hw))
 			return PTR_ERR(hw);

-- 
2.34.1

