Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF42298CBE
	for <linux-clk@vger.kernel.org>; Fri, 11 Apr 2025 10:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369156; cv=none; b=CM8DOEdH+E2/0av2/fmPKQa+LbWzajNGHLRYzEfCu+x1WZj/yUNtm15ytwH8/XNPXXv4WcGbeUx0tuQ++KxZ33Vhq7ZxWJFEICjbfw0lH4bZ0nSj1qTDr83GcdW8HsYOUR5WKcuwtfTV3n5v/yxp1DQpLdCjNFPJj52PvGWFS50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369156; c=relaxed/simple;
	bh=pRm5rikPg836Cpaht6T2Bti6G/gsdEEiL/oreW2ehWs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NblF32y76U1pW3cSR+hFC6cDpPONvv/w11LjY7C7fpwSYxcA1kKbWeNs1rA4C5AuKQXrOtBxCBRb8kUyZqUg12ITBMBb7bFGpbXp6ndI2VQ3XfwLma00wPeiqjLR4vbSp/oHQbZlsLkuRfuZ+VEOGpiqDglpY+GiHrFR6GXCUUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H1qYXtG2; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H1qYXtG2"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736aa9d0f2aso2110052b3a.0
        for <linux-clk@vger.kernel.org>; Fri, 11 Apr 2025 03:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744369153; x=1744973953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaMUD1BDVL417dtmG3+/1YWJeUCWl78+KVSs+NX3TJI=;
        b=H1qYXtG2w6A9BaStWjrBIEmiaJMoT491tdHxBC94cM/FM1hfGw05kHtxEYk//+wVkW
         PD4MANlH4dyT503CI/lm/kQwGFL1v7AvDdDIXF8leLKJngjgtYozW/GeVf8zxIxYkbj5
         TpCY30DzU40NPzn74YF3l3MSJVT1CrIIgeVocBEQPpUx+UuONzzGif2mX8dGO4Wxr4ZY
         M24ntogLefdIwgMK+IzE9w+5EJ0mlNLQeXzJbiYRO1RYYs4YkbIEqXk2FSjFW7iuIN9+
         L89wd2mXQhdmS6vsLrxotENe6obm8SrzyoWO4rPj/71TgK7BM5vWhI4ujDGK0AQGnYt0
         qeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744369153; x=1744973953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaMUD1BDVL417dtmG3+/1YWJeUCWl78+KVSs+NX3TJI=;
        b=Fu5+8DU+De7ed/+nSLCC0ceYOrzrIkhwcytpYD9HEUoxbDYsJeIGfbFSGVnLYSDXDQ
         ffb7yQpYYyyFbJw/Zc37aeZRaJl8BgmT8SX1o1QWwJspXXQoJAFM6kQ/k8KaAts6QPKq
         TRYezZB6T+yfHBBAnZTJs3r9zw7QWGRGkgCH5nUe+mGs5Hxo/NY8p9G2q956/3BJ7Uyj
         05byWCcF+oaKcIFUNR+EArrsctMBQsH+VZ5Iwldu4Os43tObbpMPQ9Bnb9umxmf2Kp84
         1ScmNkm/74I8Fl6bpuFkBAF5v9Smh1yKkg/z53iAloxny/efx5vzDOIKhGIlHHWhf816
         xoIw==
X-Forwarded-Encrypted: i=1; AJvYcCWxwErMKaoFsmjzaAXu/hrkgugGnvL//FjkwEtP8exvlvR5cfVR0bZSFkvpPQg37WxmQf4u/q4i9Yg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgg3rKZ12VdfQzQ3etKoKV3i+JHIlHGsLFpdGDQFS+mEITqsHT
	/KnOTzv0VQlfBbrAHo1hEeJEZf5I+U3NWTMJafUkf2WyQbvW+L+zJkoDFocz2a0=
X-Gm-Gg: ASbGncuOqGFW2TwSorDZCyfpE29A2BGVidwdKkVe8k6g1s6a71+u7SqzbKuWQUHpsPj
	pbEe28iGSzichGrur5PtX7vyVU05CGWTPUkRCC8oV7YPUyfjySrmujWs2w10EhrHudTtx24Lmvw
	zlhAN5ekANSYOQl81/0DdqNK8VVzwR7nnXRv3woWzmd20OW7cb5unfMT1EMU5azupm9XSHOEtDJ
	FCtHENJ9dZuVGuTWE6zETaWL3nykE4CUrD9iH+9e3yXIgvKcBwIvYc7f/bg2ipLDNqr964EaznE
	0vM3E+mQIa+YxXJtBGW6XmqxSfQFa2IsTWxltcsF+1Fi+GsrZ1xG
X-Google-Smtp-Source: AGHT+IGwEFN9ddJRuuBdJHj8RuzbOI95LYFz7Xvvsh4FpaazgcpxsU/NNRYSzTHyEh8WHWzJdCHM0Q==
X-Received: by 2002:a05:6a21:108f:b0:1ee:dded:e5b with SMTP id adf61e73a8af0-201797b1ec9mr3954789637.24.1744369153569;
        Fri, 11 Apr 2025 03:59:13 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd233787asm1222223b3a.173.2025.04.11.03.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 03:59:13 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V9 04/17] MAINTAINERS: Add entry for Rust cpumask API
Date: Fri, 11 Apr 2025 16:25:03 +0530
Message-Id: <69c085aa4ea2418ed400591bf9be22c215a924e6.1744366571.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1744366571.git.viresh.kumar@linaro.org>
References: <cover.1744366571.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the MAINTAINERS file to include the Rust abstractions for cpumask
API.

Yury has indicated that he does not wish to maintain the Rust code but
would like to be listed as a reviewer.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Yury Norov <yury.norov@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..bd7c54af4fd4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6237,6 +6237,12 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 F:	drivers/cpuidle/cpuidle-riscv-sbi.c
 
+CPUMASK API [RUST]
+M:	Viresh Kumar <viresh.kumar@linaro.org>
+R:	Yury Norov <yury.norov@gmail.com>
+S:	Maintained
+F:	rust/kernel/cpumask.rs
+
 CRAMFS FILESYSTEM
 M:	Nicolas Pitre <nico@fluxnic.net>
 S:	Maintained
-- 
2.31.1.272.g89b43f80a514

