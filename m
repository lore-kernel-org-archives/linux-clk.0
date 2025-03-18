Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B26D46B5
	for <linux-clk@vger.kernel.org>; Tue, 18 Mar 2025 05:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742277453; cv=none; b=hZGq5OVN9Qgwv8LGkaUdWimbwAqU/HpFSfeixVYmAZTaa8WnRbsfc/p/0NNVXPxqP+pH8xsP2WF5u0TemWNkC9w6OHZhL/yOYQ9GqdVLbTLaO4LOAjqmcJXJHSUlxw/n+3S4QyQz+85zQwohkGaIdbpSWcgfgi68D2t1HYRhwxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742277453; c=relaxed/simple;
	bh=+sCbQh8R9TiUu2oyJra9dESUle0tKB3+uLGKQZ/N9mQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TBakZZcvB6INBX8E2zNn0KRObcNQYP0aBkxiR/NDW/PfNeys4Jz0ZM8UBHrnORdvZBelhKK+twDlASD4cLKCt//B6wbhioiSH63aT9eiyyen7+8n4JBIfK7jTQ0IGKhDNFfOeSY3YFg4/Ona15znyOWKbi/cTqIXPrHIqcqW570=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TDocyHhF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TDocyHhF"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-225df540edcso69306015ad.0
        for <linux-clk@vger.kernel.org>; Mon, 17 Mar 2025 22:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742277450; x=1742882250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aeBl6UcsWDr5MR5JO0HAraFd7qqgoYlegSDWTc4mF74=;
        b=TDocyHhF9xHl6UQit6JetGMGlFOuk8gVHsZstEslB0WnSDxEbgWiM5wngvSBIMppC1
         cGxeS9CCPfbD9JbO2KquRW9QK0QQbtnaZqRsYMG/ixw1ZVfJn3/5GLmoQ9a9hV31VIEe
         n0qQCaT+C95lVmYzos6HDsCBSiH9DmCoLSp91Aig0mD3niiP1DRnCz46J1RZkMzeDlRu
         /Pi0ZyyOHs2OuJVp8DxILB/C4FgvxjOhlgFu45UnyEn2zN1fGAXRgX2KlG9Ot/0cxta2
         YlsacoGBweSQsvFTLQBrV4s9Zd40U+1l5ajd1ugCNwxMLUUxC5MUew4hShmfcXaMgRMd
         Mqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742277450; x=1742882250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aeBl6UcsWDr5MR5JO0HAraFd7qqgoYlegSDWTc4mF74=;
        b=eyBWLfn9FyOdM/Ol1fVbm61EmlxFYV3kh0kNDO9GRew8RXWEioHveDD0nPNsFTPawF
         SMhgx+cWOoziEAlS+Y9U8bLoLpf5QpArVjr016qwrwKp0IbhZRhl/BWNfHCJt+uzDU8m
         0lRpr0nYAYB4UDUb8NVhc7y4hkn0+5DI2Q/Y2sVnh64Okh/iYnSMoPQrknyQkbgi6U13
         4NpkX/RtKmjXnMenan2AfxfwUWsNabz1ZuszbGkxZb15YQL7d14m7G7VhN+lBUr40Kiu
         BJHcegiINSUmEPM56qJWaFzoEtzym2M1AFR49WP0nMxc+ehICPOdzkObSM4uQHFvMIrE
         Khhg==
X-Forwarded-Encrypted: i=1; AJvYcCUTgfHMgtxihCLCrPsN02ehXlf1ncAI4HHlgbrfGJGkWTnX2coWrrjk2e4z9YHdkGtW55eVz5n1ZLU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs41IEjOlsHnpd7cn05yvGUSHv2a2B1xAekMKqAhIpkYQw6Sk7
	zavDWVuVGw6bNudGVMwiBoLQJFA+OIBKRmtmqoLCwgszkvnLO6Rz3QtqcNVPgnk=
X-Gm-Gg: ASbGncsQASy1wj5rtdETcUKsh6FyvpCWhreAJLDpiVE03BonXqdejrNL4IUCKMsYgAR
	nw3LHOeOM9JuBb/Z9g6RyJ4gcmCvE66gzCCEqFcTLeHTOnERruhgcN5QLLbIDmKV4X7Ue99SMw9
	p+PTRRkg2mGj2twSW+71zoPzYP7vF4/uVHa+ZV0D5enopJloN9z5mWaRc3foNIirD9NaOuf2mt7
	f1GeQwDn/UmSvdbezlozVVoP9+3hZgq/luDSurOCtaXu6mjL0kEosH1aNZZZsv9pcsbPF6iedNT
	Urbq1o7/GphHus8AversI9U3+G4f7zmaoCk8isaj4CD43qtmLB0IQVK6
X-Google-Smtp-Source: AGHT+IGZoqhHvlj2fz0gcgs7G9e+hylpXfVfEtrS7DVAG1eIEQ0QX829SvXWTu+13YtzB692qBmerw==
X-Received: by 2002:a05:6a21:1fc1:b0:1ee:a410:4aa5 with SMTP id adf61e73a8af0-1fa50bd891emr2828484637.17.1742277450486;
        Mon, 17 Mar 2025 22:57:30 -0700 (PDT)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371152951bsm8981519b3a.15.2025.03.17.22.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 22:57:29 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <benno.lossin@proton.me>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Trevor Gross <tmgross@umich.edu>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH V4 0/2] rust: Add basic clock abstractions
Date: Tue, 18 Mar 2025 11:27:13 +0530
Message-Id: <cover.1742276963.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This adds initial abstractions for the clk APIs. These provide the minimal
functionality needed for common use cases, making them straightforward to
introduce in the first iteration.

These will be used by Rust based cpufreq / OPP layers to begin with.

For now I have added them under the maintainership umbrella of the common clk
framework, please let me know if I should do it differently.

If possible, I would like to get these merged via the PM tree along with
cpufreq/OPP abstractions, but its okay otherwise too.

Miguel: I have dropped the changes related to a Guard implementation for clk
APIs as the discussion wasn't conclusive enough. Maybe we can tackle that later
if required.

--
Viresh

V3->V4:
- Enable clk abstractions only for cfg(CONFIG_COMMON_CLK) (Stephen Boyd).
- New struct implementation of Hertz.
- Added examples for all the structures.
- Make methods inline.
- Improved comments, Invariants, INVARIANT, SAFETY sections / comments, use
  intra-doc links.
- Other minor improvements.

V2->V3:
- Add type Hertz (Daniel Almeida).
- Improved comments in helpers.rs (Daniel Almeida).
- s/Clk::new/Clk::get/ (Daniel Almeida).
- Implement OptionalClk as well (Rob Herring).
- Fix Safety comments (Danilo Krummrich).
- Add tags from Daniel Almeida.

V1->V2:
- Post this as an independent series.
- Include more APIs, apart from clk_get() and clk_put().

Viresh Kumar (2):
  rust: Add clk helpers
  rust: Add initial clk abstractions

 MAINTAINERS                     |   2 +
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/clk.c              |  66 +++++++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/clk.rs              | 304 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 6 files changed, 376 insertions(+)
 create mode 100644 rust/helpers/clk.c
 create mode 100644 rust/kernel/clk.rs

-- 
2.31.1.272.g89b43f80a514

