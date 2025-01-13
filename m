Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083861BEF6F
	for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 20:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736800294; cv=none; b=rfm2wDlkuo+dHIKPVYTL/6OZcxGcAwdIKf0X2ufsstyhIVGYoByrMgldVrbe14srJSMHPBlXyAwJMdPDQ/oCs2LgmJtvQSrVDiiswzHrkLyzkaEzSn+QowEaEnY/qljU3FrBHenoa1lwxrREt6EiFuTWrl5Hauoz5CXxgQ/tM/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736800294; c=relaxed/simple;
	bh=r2fl+aSZQSe4Gu96IWu9ki/qiNVdSrpnUYBU3JUFi8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pffV+arpbR2P4PZcvnmoGf53LAJxu3YOj3dwjKMgUnYKUjJ6ybGoaT3woxWm7JyYZRWeh0ctAKQFBQziMqIhWvw2MfdS1pmojrFdTair7OMF7hMagKvf7fdHCFKcdUIBVuVxrLk0cejK6fIPMeWg7/pm9/dPHpRpYDAeTrbJjr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=eGOoGNFA; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="eGOoGNFA"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ee76befe58so7931607a91.2
        for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 12:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1736800292; x=1737405092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/p3qag0MQVENrEZ+1Hv+br5ltoCbdPuVgxId6PkIedY=;
        b=eGOoGNFA5l9YV2i0e1kw2IuwAE6VmWS1zBFlFicpeTU1NHOVsBMqOOyZjPHQzRorVr
         b8I55pRxSiPE1xBG2wf/0JdF5BnmRtPJKa4RjCNFDcBcc/6RQ+zok9gYb6ag1TksCb/b
         JL3t9UIDdYJ5UqOyGP3U7DqpRnlu689VQR+hd7HUKjKKLB2AgE3O30ivorpkFEUBpdDY
         a3VPNiAraQdMT07FKFgDGUZqRW8f8oO6RiquGDbVKQyc7SlegFfwLunRYqbHkpSiGQMk
         f/FGLrC1NmkTmQU1TRZAWFPFmN0p6bbfGQHN2uhWsBbhasIFXrVYHcEHYeWsMYOAqPnK
         Xidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736800292; x=1737405092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/p3qag0MQVENrEZ+1Hv+br5ltoCbdPuVgxId6PkIedY=;
        b=sBvzYFDuvNMX+hHC8eVX3Yk0A1h+pU5dw3tYmQPI1gAD508vRaWoAuR8ShELG7RnaR
         g3CGRyMtZrplkMs5Aumm7ufH7UG0TQTmODEGRRPGSi+L7pK3XH7QmwOr59CmR0u1U4cd
         gLG669/G2ziyA+V7QWo8/Gwe5SrWCuxMrN2VaLswtqigAhk5QtEw1C/8c95AoAAFgu0K
         BdepcNVSyrIo7b0xO1HDARNeLa6aVHyKbo42EK/GvJGTLFCR5GC8AgH8pN3bx968q3ie
         lwiUdqUfA3mzS87sbMGbI4JmxhJX6tDHhdVWfkwRQbhMgclDrcXy4GutvEngj9P0hOvd
         RBqg==
X-Forwarded-Encrypted: i=1; AJvYcCXuf07kjJEpdA1asCPJJb4Lk7YU6nNhfwa64Klgl9ynd9lwsxVh8aHSqGmkSXkavgVB2Ow3W7jtVDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjaiYQmuToOVS1mbao/ISLfy90etwSeedHt7Y9y+ogAWEhmDEc
	ea83YKTpEYvp2iEAGNKcW3FGu3Lk6A7U8dGtCClpaj0W3tjN9E7xrpprdqqlDBYKLbry/Hy3BSP
	D
X-Gm-Gg: ASbGncsMUsPCJx9hTi25qlng8LPDFhjNS+pKAJM/QUUR4GD5LBiRVhKz4uWdankUtof
	WzbApGf4yZZWEd9vDnvlrFqobmQQgmXzXxDIAxNlreNRsRV4bqSg6+GbU50BjH214ycNITj7XIL
	wBP1uxl334trs0msILfH3/O8sYXKHhCARtPs5YIJepRn0I8EKchjT3ns7YK24FqUIh0viCbPUjn
	Gs+KMUbx01FtrgOUzvGgRs3D9ZHP6dGJ+wX4Dnew/U58tqRsS1h0LG97AO1+KtDn4rNjjQw7/rr
	eT4mnl8iaxwurlwt
X-Google-Smtp-Source: AGHT+IG/tMMpscU7gZH1eJnJup56GCo1pHZUlOei13gOxP0UsZsm2CL6bABRUnZN9TpfjVCLNXKKsw==
X-Received: by 2002:a17:90b:2dc6:b0:2ee:53b3:3f1c with SMTP id 98e67ed59e1d1-2f548e9f9ecmr29485858a91.5.1736800292356;
        Mon, 13 Jan 2025 12:31:32 -0800 (PST)
Received: from [127.0.1.1] (75-164-218-15.ptld.qwest.net. [75.164.218.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a2ad3b7sm10514811a91.31.2025.01.13.12.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 12:31:32 -0800 (PST)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 13 Jan 2025 12:31:24 -0800
Subject: [PATCH RESEND 1/2] clk: thead: Fix clk gate registration to pass
 flags
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-th1520-clk_ignore_unused-v1-1-0b08fb813438@tenstorrent.com>
References: <20250113-th1520-clk_ignore_unused-v1-0-0b08fb813438@tenstorrent.com>
In-Reply-To: <20250113-th1520-clk_ignore_unused-v1-0-0b08fb813438@tenstorrent.com>
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

