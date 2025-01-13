Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D5418871F
	for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 20:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736800294; cv=none; b=PKst9cESVnvySQQB6HXJMK2TQdk0nqRL+1r51lGn87VfXZYi9aYEMDRRdoaTMBxuzOxrlR7U8mhI41ZdJEEllchZJEIj5UfQ2IjOnY9A+wmnzZzu0PCU24M0GFvZ24niQ+Llqm9rdaSE5t3DPHqpYJfK4tDGfFxEveWmgVG5s8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736800294; c=relaxed/simple;
	bh=x4+nb9/PGNUsK/89p1ygaH+gSdVhGarf3xtoVnn866Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Kw/ho5sK+cGILTIIZfoawcucoaiwf1w1Gt7F9e2QW88Ean4/PRUe+gLcUYpx8RkEAyOEKhsf7V072QVC9Ta5WGl6iBxvJ4vd/F+e/vZ96kdRndrBGGf78jtQVsctbcbC1KXypJXx2zG3CIpagZt1HmNwMlRqtwGx8ffTqv6Pbu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=AJz1q7x+; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="AJz1q7x+"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2163b0c09afso86495435ad.0
        for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 12:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1736800291; x=1737405091; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HCZFWXIAcGGHQ2KfGyCUAdwCjbNuy+/7pP/Yd0hTD5A=;
        b=AJz1q7x+KDxq9/EZtCfXNCxYAH2Ecaju4g10Z+qJOG9HhpTFhOvuNdaExBCqxnHlcj
         2WyIBaeqbF+cyeDwrf490nWw2eefJVVSzBTWmvkt7JOXwAHirZUU28PLKPIXf5mLvkcq
         E2blywkeszcnXRe+tpJuDFDnL334z7XrC6twfU9jG4sau3QaDtQtuD50J88JwfApR0mH
         8xqd3+o97y6kPEZS3lnZgI7AaykpEyR1rhyahTwcgYAyOu7OdSvX5EudhHYHfISzs3EW
         E/YUSBq+MOiVnGujMZhe9mQMBN/IdvUPkeNUk5upkcTynAa3Q3z0aepnjmrIguJUIc3t
         b75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736800291; x=1737405091;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HCZFWXIAcGGHQ2KfGyCUAdwCjbNuy+/7pP/Yd0hTD5A=;
        b=wy5afPo8HpIao1bAft7WxlaqikWRltIWgOwLuHKMP6O49MriH6lr45OPy36iRjjbco
         LUQBZce0EHAimKyH01v7gxHUOICBGdwj0RkePUdqaCz0dcfT9ybaZbHBKkLShs4btZ7G
         Ewn7A3H6hpF08YkZpyV5hJz3SbdAuZNUik17trwJQMH3kyscqKZSfQ6J+PFL3kF8cJB6
         2co6L7ULbva3szaeNP9d4QQI3DoHVfPV+tpDrMpbEmu47UsLBrTiE2lROWMlaKkhrrLb
         mheud4RGM/25SAjUjIp1fKferr7gKvBR05CaLlC5DIQI9+Ouq2Qczp+z2VUh4C+qfMQG
         UMIA==
X-Forwarded-Encrypted: i=1; AJvYcCVa/RKavHbyCKTJtwOXzUEtzSJPtufwwX6VkY6at9/Q8N/CzHXF6zRomnI2Df1uxRCWuwj2ZGO5ulU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqDKdTaaQfN+jTQ3PpqEmo+J9+tvUoRXAdMlxMAgacgNs9jbFG
	A3DJR0GIpK7u6eYkEUFVzQP2Eb7Jx8UGEI9QPUOxapko5CjD9iFlyhz9MkAX/WA=
X-Gm-Gg: ASbGncsKhnS/JiCwnymGZWdoUucEUPMmM4j2BSrZ4GDfi1RZRBCEOiSL3MtPnUSi7tc
	Y3pGaZ9Rcbqs6Tclh82Sp4bioHyzVEDJx1riX4zUrnhULEy2lmDHIhWaBDZujCy8069pJupDsGJ
	HcZo0KKxt233uCtnqzEtUtsla0YiLJGxnJASWFV4d/iNEDH8hTcXB5ljJxPyR732WNhW594QvpR
	7J5mRIfEd6BkpSGsLcUgJMDPCb1aC3HcK5L5M9ZzpE1V9VWKjeGiEBKUfyiQGWBvglDLoB4p05v
	oez4T8zlFbqfcQm+
X-Google-Smtp-Source: AGHT+IFQnzVNSYDK2Ipv9ojWat3P1YUOAsFZ5wRMmF2E5BfK38xPBdomxpf2eBseMH/qh/uRMcoZGQ==
X-Received: by 2002:a17:90b:2b8b:b0:2ee:d824:b594 with SMTP id 98e67ed59e1d1-2f548f761d7mr28582443a91.31.1736800291267;
        Mon, 13 Jan 2025 12:31:31 -0800 (PST)
Received: from [127.0.1.1] (75-164-218-15.ptld.qwest.net. [75.164.218.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a2ad3b7sm10514811a91.31.2025.01.13.12.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 12:31:30 -0800 (PST)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH RESEND 0/2] clk: thead: Fix TH1520 boot dependency on
 clk_ignore_unused
Date: Mon, 13 Jan 2025 12:31:23 -0800
Message-Id: <20250113-th1520-clk_ignore_unused-v1-0-0b08fb813438@tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABt4hWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIyNz3ZIMQ1MjA93knOz4zPS8/KLU+NK80uLUFF1joySjFAOj1JRUYws
 loPaCotS0zAqw0dFKQa7Brn4uSrG1tQA/Fvx7cgAAAA==
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Yangtao Li <frank.li@vivo.com>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1

Add the CLK_IGNORE_UNUSED flag to apb_pclk, cpu2peri_x2h_clk,
perisys_apb2_hclk and perisys_apb3_hclk. Without this flag, the boot
hangs after "clk: Disabling unused clocks" unless clk_ignore_unused
is in the kernel cmdline.

In order to allow individual clk gates to specify their own flags,
the call to devm_clk_hw_register_gate_parent_data() is changeed to
actually pass the clk flags instead of just 0.

This series is based on linux-next.

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
Drew Fustini (2):
      clk: thead: Fix clk gate registration to pass flags
      clk: thead: Add CLK_IGNORE_UNUSED to fix TH1520 boot

 drivers/clk/thead/clk-th1520-ap.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241227-th1520-clk_ignore_unused-32b2d02ede38

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>

