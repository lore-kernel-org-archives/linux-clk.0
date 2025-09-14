Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D4F264A74
	for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 12:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757852487; cv=none; b=sA9EFTpQkIQ4tiEdI4QF10szq6GFvn/O5O/JpZguz30jE8Z7WgG08C5Z9yww2e6xzM3PmwJ5I3aWU+QyhbRqY7+UH3VCjPKcbSs1ECARZ75hqG00flLO7CaxDhzPNxYgkN336464Rb8HHANgs4AXR3o+Of4Y7pcT6C+24wTdEGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757852487; c=relaxed/simple;
	bh=hyEa/GySa/6Ls75v6+v9jFgXVHwsTBG2UIuaqEWAzoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aEkRJVBCHX0sr8D3pC2F3Dw6a7q0XUZdC7er3fuIeFg6blI5oMpmzC47g9tDnEaqKvfQnWSTwR9WTK6CSZikKcffFRO3RW61fDNtVVbf+U+FrftN7+MJBwzjwGD0dNBAxyfsxHLVsruoMlZHFQrJ9Vu6mi+xdPYt5JAVS+LZM1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/rx6r0u; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/rx6r0u"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45f2acb5f42so2740595e9.1
        for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 05:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757852484; x=1758457284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5V5EvIIFmYlE3GyO/jzMM5XnNife2k0lUvzm2HmsfY=;
        b=D/rx6r0uFSdJtz2w12P1kmfl/F1yXRfsAVUI8lEK+M0KNftzb2UkM0SFDtRIff4FSZ
         BUR9MNPr3NwBx0kqY2iX6M7wTXtLuKGN2kVZyqzRz5YU/5wg0I+aG4Ctq19VEqIfcwvL
         n01aqwHiRjH7zyi1/NsoRLHtL051eEktR5TRF0g/gUfR2oIyDKDrjZCjpkadEuH00zLj
         N/WqSoQ+pf8U+4VUm8GlmqpQR0fv0ldfTjEiAMJeNzUSoinQCWFYZ3B/ABlcOBsT7hFA
         6qbf2fP7FpBZwBtztwBTZqSKbEE+FjMMhTDdwkKv2ERD92CR40hF043bSXjKo1EbU65L
         oDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757852484; x=1758457284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5V5EvIIFmYlE3GyO/jzMM5XnNife2k0lUvzm2HmsfY=;
        b=JzXBAckPc+gTXmoedn1ng9D7bUpm0zrt1MfCwx0UT0tcziBZrh5Qwrsi+gIkE5MOs/
         eONoPaLsByrJJRQvHvVtZxbQ/l3bSXymXd1RYJYFcwifQWbo1vY/AoMjytHmEDKTH4Hi
         UI7mmWONVnKh43tqXeBlne5bsWBVfmKO2jaQP4uE07S6AMicdAKYNMS4B3ckIr2PeYUr
         Lk/8tMDusSOTW9kSNyR+lDYbC2341/nszjZSkH6uEZq/fywXBIUQgDAOahEIEWf9Wmw4
         Pr1Qs4QORdUAL5LZzb7qFWqsBczLm/xNlJlbg5XWLLd/nps0B2jrXnwpnED0JAsDVq/M
         CIUg==
X-Forwarded-Encrypted: i=1; AJvYcCXsI5mlfW4bFCSUyGuHGBbTVNADnt+/xkGYBIWRBWjt0/CXd9TDKeUi11Ba0SQkFhuDf/OoLRQVEQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNXQIPbkkoJU2NeLbMcAxaYmcx2k4joXCAL/tlYRCI30d6FP8P
	T5rX9VuCVupwtXa6FSUekf6Sl0Ze18436cxs8kNu1AqVizyE1wr94O6M
X-Gm-Gg: ASbGncuTGcnj21M8TxFPsdJFl+FsrslMYANxcDu68u0TGvuky+25XQzWnHDJgFbdN9k
	+vDWsTA9GRPttRG7OW+URjaTRHE0mYa1/8T2ygq0h/VsnKMzog+UMgqOrDRBVRho46SXoJyizhM
	BO3cQhomfK5qvqRK18ZiNChjngW82XxX+6VJtrt9PAy5xthp//eKQUCkO7HqGP/Blexd4EHcv0m
	bpjPOhy4JnPYAysaySKkDkV/gAvnPONSQyvyJq96S8SMTmUMc/0lXbO55jJameobdtXk5F7Cj//
	oHDqMztB7XX8whYuq4iMa7jT6vOVolptY/2q6HjoevVr3uaE/efDvcjc2p9HfPclEc72jYnFaOz
	lnY5ANWxw0cUt68wj6haYvwSUcd8BRHg5g5QKUKV4id8OyktrqK8aRIRjwC3YiyQV6kWVVCWQLQ
	==
X-Google-Smtp-Source: AGHT+IG0ZXg0sjBbUNfdeanXFe0dMTX//arWD3IfNQ77haSimowawRn8wcMXpw44W5JXi1TEnscc4w==
X-Received: by 2002:a05:600c:468a:b0:45d:5c71:769d with SMTP id 5b1f17b1804b1-45f2126253emr91249815e9.8.1757852484220;
        Sun, 14 Sep 2025 05:21:24 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b4222sm136476615e9.20.2025.09.14.05.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:21:23 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/5] clk: samsung: clk-pll: Add support for pll_1431x
Date: Sun, 14 Sep 2025 15:21:15 +0300
Message-ID: <20250914122116.2616801-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PLL is similar enough to pll_36xx that the same code can be used.

When defining a PLL, the "con" parameter should be set to CON0
register, like this:

PLL(pll_1431x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
     PLL_LOCKTIME_PLL_SHARED0, PLL_CON0_PLL_SHARED0,
     pll_shared0_rate_table),

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/clk/samsung/clk-pll.c | 1 +
 drivers/clk/samsung/clk-pll.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 6b3593445..e52e010ad 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -1420,6 +1420,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	/* clk_ops for 36xx and 2650 are similar */
 	case pll_36xx:
 	case pll_2650:
+	case pll_1431x:
 		pll->enable_offs = PLL36XX_ENABLE_SHIFT;
 		pll->lock_offs = PLL36XX_LOCK_STAT_SHIFT;
 		if (!pll->rate_table)
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index c07d76121..964c35ddc 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -51,6 +51,7 @@ enum samsung_pll_type {
 	pll_4311,
 	pll_141xx,
 	pll_1419x,
+	pll_1431x,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
-- 
2.43.0

