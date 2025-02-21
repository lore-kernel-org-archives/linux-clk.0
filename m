Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7FD1FBC9A
	for <linux-clk@vger.kernel.org>; Fri, 21 Feb 2025 06:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740119633; cv=none; b=gs6zE2KH8iMrCEfvEuuVDLf3ccOK8/0dGnGVy0UbdnR7+I/sn3CcHwfKnnA1FceyMb8sbDJo2U1KG65EzvyL6ZwtwbB9So21bRBjqQyCwU/DcFwvAmvaEqGUk7n1nQgANFvtV+HkfV0lBUpVMeaYUWwH+v1OlOPk46VBZCyqgIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740119633; c=relaxed/simple;
	bh=UnV/+GfcAYzsBk/o1/mbrqjdXTKd+qmvgLBpMdIuhrI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C3xSsZtw4ycYa0Y/PJVGQC4txnJrMy+ZDgsH9Thco3qTZd3piH2cU3hCS9CMuWpXINi3mvZYRnSx8YGry61mhbKYpqU0uoxve8efhFulfiELkyGs49H2EKgeIQSAxNYXXxMhJNtzWzdsqN9t8ku0PbjlFcs0XGAL8QzroImGmiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PlcTKdCK; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PlcTKdCK"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21c2f1b610dso48627635ad.0
        for <linux-clk@vger.kernel.org>; Thu, 20 Feb 2025 22:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740119631; x=1740724431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3qkD2W8GHPxS6rjoat2i19yWeUXmPG3MQqxSAFZ/8c=;
        b=PlcTKdCKDpi1QO7NG8AQYezLG/xToMvncu9ycJf9FhoLe2ZTRb9jfTPK998MKrBpKn
         +ZOVThGps+zEJqqz6fLAa7SrK9Fz7ahCfSRTtbfR1NOYrI6EMF1nyHuWV9M3VYU7g2b3
         EG/ldhckbswoCKjp7JNIBeyV1rJFjPipK/xeR4/WQx4W/WdjK0M4uyEFgahdrRObY5hh
         vIS+mgHgHllHQjR4uMArpRYwdyiEQu03hWzFejE6rKIFz97MQCMUPz03MolP2V6kR6mW
         1y0/mKdP2RV4MdomVsLK0ZwQ3xoR9MsdH/h2iumaq1XcuCHS6jQA8Atr2paIfNikn/xL
         Nzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740119631; x=1740724431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q3qkD2W8GHPxS6rjoat2i19yWeUXmPG3MQqxSAFZ/8c=;
        b=dFDZzesvh6jig970cdXEWzQ7S8+A8mhBDGqBEc4UxH2THs9Ng7dzgKiW4mx5M2+PWX
         IQtLHZzwopBoBEYeek8IdDSL/TPN721MY0vLditrbHoYz9qk364CEpnGcjnkXiv5/1tt
         C1gU88BHgCDk634FARGJKCoRdVPky/+JmlLCPJO+6TLoJdQaNqJ+3haT5JSvS1sgtkg4
         ZadNPJ/w16r0WYkfsW9xG2SWl0i4BYlzhW8eKKpds+3Xxk9ciK+c7LmQaX16G1qnSoup
         pNLhYCDotuXunmaBWPPL9NX7shsU9Zp6vPW/vCNoNFQHXmpk7zBoT5Q6yyhwwm7vJinB
         4tJw==
X-Forwarded-Encrypted: i=1; AJvYcCWXnnCVoiMpXDgn/CMoxiUSRY48bdeXi7C5s2tU8vtgebzEQE6ZtqWkXtykJGSKWr/dz/5FmDseSts=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP/1gO1kwKoEdUSKMAygrRjV2xznUmkfHbqqOdryAHOIeE2EnC
	WV3IFUb2zBuuWfSZI24PUC/Z8e5biahjRdsFXH9N6ekq7PiTCGvHbBLrYUPoHfA=
X-Gm-Gg: ASbGnctXjsl5JuNrSrKS9cKdstTReP9CPE55M9YE+EbtV3nCFmRgB2QzXMDOH0tfb2Q
	JkXhWCBZ5eHaf6KU7i1BM+YYOW9k9DSoH4CwWtsPkoGIMgynBR12BGSiUiHE+4dhXbkf+mNwkrM
	sl9TGCwo/1jcEfBsFVrPwbbtnDxpE6tAuFjYea7pUaNUtl5ZmajJGX4hI8BtTLysY2QMtmygsf+
	fuhQ4nvM3NHoEQNydeWJtnvH+2W+/PYTmzUSXPmiRXp7FTbspp25HPbtXs1dW0q5/m/WT/QZQbE
	yVE/MWReg+uTUUiRPs7Zn9kk+Yit
X-Google-Smtp-Source: AGHT+IGBFTKUqNROscBFlXFQPsAysi8TjZrSjaBBpoMwqoUOJ2o4jmxLvYsGM0FXUS1xsZzgGKCJBg==
X-Received: by 2002:a17:902:d2c7:b0:21d:3bee:990c with SMTP id d9443c01a7336-2219ffb5fa6mr30105085ad.42.1740119631572;
        Thu, 20 Feb 2025 22:33:51 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb02d7dasm523355a91.5.2025.02.20.22.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 22:33:50 -0800 (PST)
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
	rust-for-linux@vger.kernel.org
Subject: [PATCH V2 0/2] rust: Add basic clock bindings
Date: Fri, 21 Feb 2025 12:03:37 +0530
Message-Id: <cover.1740118863.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This adds initial bindings for the clk APIs. These provide the minimal
functionality needed for common use cases, making them straightforward
to introduce in the first iteration.

These will be used by Rust based cpufreq / OPP layers to begin with.

For now I have added them under the maintainership umbrella of the common clk
framework, please let me know if I should do it differently.

This was posted earlier as part of the series implementing cpufreq/OPP Rust
bindings [1] (since its V6 version). In order to make sure this gets properly
reviewed and I don't accidentally miss relevant reviewers, I am posting it
separately now.

If possible, I would like to get these merged via the PM tree along with
cpufreq/OPP bindings, but its okay otherwise too.

--
Viresh

[1] https://lore.kernel.org/all/cover.1738832118.git.viresh.kumar@linaro.org/

V1->V2:
- Post this as an independent series.
- Include more APIs, apart from clk_get() and clk_put().

Viresh Kumar (2):
  rust: Add clk helpers
  rust: Add basic bindings for clk APIs

 MAINTAINERS                     |   2 +
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/clk.c              |  57 +++++++++++++++++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/clk.rs              | 104 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   1 +
 6 files changed, 166 insertions(+)
 create mode 100644 rust/helpers/clk.c
 create mode 100644 rust/kernel/clk.rs

-- 
2.31.1.272.g89b43f80a514

