Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B2A33F396
	for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 13:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766064471; cv=none; b=c8gMv79RJc8bXSCY2yujWNcY10JBV7cO4+pj2XwRDspY0SIlpnzZoE08uclaYrrtAhLK88T0lzkQsRt5DhQXQ8Lc0cYz7KuTxdbr2j6OGXgFc7S1mQdSfkohS/lVLCujBFc1dA7fyxCkpla0Ut8KGLi1I7eAInPm8Xv+07EZPB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766064471; c=relaxed/simple;
	bh=TNCoBCaC1De+GuiDPz38rW09O9saXkMK3Ckv9akyQNA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=r+PZzoIFDaDMM3FN/eZoR8J0zoV9tVfWneQqZ+P7+T43GsDvxLyriCiVIN9umnO8Bko4ayoo8nw8fiTIzbNsKXOdivBEvhuXL8clor8g4SS9YeavYNhsel9ErOvsaLo/om66HYK5qktoZ8ve46k8BTQTObkFgWc4Xc48cp/kxtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c1jphxOP; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c1jphxOP"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-64b41dc3b9dso637436a12.3
        for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 05:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766064468; x=1766669268; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qi+diNh9H3fqHmnH6Hx1SnRjbjw/DBqYuPovI/jASd0=;
        b=c1jphxOPBgwx+lEBcJoRzH5oqLbjtx/cXWH8l+phYJLXCaJHhy/7vd0boFPWIC6iOg
         SnyAKuEylnpIGoBGUIT1+DFg4ib0GjLg7uSFB+n4wkWNXjsVq8P2xiz6jkpaW7Gabp+h
         Vfky4woVHhpe3+g/JtAKIerXt/Fua6M94HSc5WIHXt/qPNj5M1RBogf+8lhmai0izjsa
         Q3qJD0Nj3yi4QZqjzkFo6Ny3lH5VZp0ZMDMPzgrPVz66B+OJ1UNfmBTWn7t1FtUtodCs
         PJKy4tNKhRuJyCQP/aGuxLir1cYY3ONlrWT8YTv2bB67VFRMZ/QcTkk0VAz+LEHxUvKC
         c7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766064468; x=1766669268;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qi+diNh9H3fqHmnH6Hx1SnRjbjw/DBqYuPovI/jASd0=;
        b=ZKrtthMreX1pPTw1v/xQ3EigB+KEK1VyS4YkxH9Fn8FUJaKge2Ng9hGWXsgddMkNK6
         nV9YW6MJcBVIeSiP/yzNZjZT+TsT9Za4C+LmVQLiOCq9rNDhHbL2PkQx1qy6g2bdIB0w
         ZMMfUQaGgky3A+kE9DSMkjxc1xS8F1Pd/SWXXxhYwBat7clPRSq1cJm24J7fnh0I9yH5
         rYquSpi1CY55WwGOjp88kmSDd3FzWoDL2pd9jfQ0Zu9rBMdPRwHfofaRp0qZ5YtbgKhD
         TKETGwiLY9Onp5ifGAol7JVn+ZRC1iryZIu6b38EniFRcBWwtMWawUkVgGqcBEA9eu0L
         6c+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLydcKRjtglgww6k9SKhVLTZAKVrrNzutDgMyepMrEwTGccjlJfxHVoiz+tqWWfaJJU+vC/DN5ax4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRTo4KSVbvYJdI93GkakdQxMsWw1zuy9kubymZRSK6lCb3TtU/
	F/6vm1gvebOFhgEY0cmkZf+0VxNsqPWDJeew9/sr6BBxNQfrfe3kCObkgVPo6MCpdlL49RABWl8
	mAhJuZ4O2P4mZBo7aMg==
X-Google-Smtp-Source: AGHT+IEJ9HLtb50XHuIEDIn2I5dEKRfpXNrH3igp0u5gga3J4+yG7DZI2Q0fi7gmDBfxIdYoUF2j/d9U4mcuUv4=
X-Received: from edbin13-n2.prod.google.com ([2002:a05:6402:208d:20b0:641:9bdd:d74f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:557:b0:649:ab53:f11c with SMTP id 4fb4d7f45d1cf-649ab53f181mr13887194a12.23.1766064467917;
 Thu, 18 Dec 2025 05:27:47 -0800 (PST)
Date: Thu, 18 Dec 2025 13:27:39 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEsBRGkC/3WMQQrCMBAAv1JydmWzSbF68h/iIU23bbA2kkiwl
 P7dtAdBweMMzMwicnAcxamYReDkovNjBrUrhO3N2DG4JrMgpBKPqMEON4g8NhCn0YKyrTm0mqV
 lErl5BG7da/tdrpl7F58+TNs+ydX+OyUJEnTVIClFyHV17rzvBt5bfxfrKtEnl0j4mxMgaG3qU inDWOmvfFmWN6cYRdHqAAAA
X-Change-Id: 20250904-clk-send-sync-3cfa7f4e1ce2
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=TNCoBCaC1De+GuiDPz38rW09O9saXkMK3Ckv9akyQNA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpRAFNFVzmcQ2qN1p0BMkwj9qfGdczHhAq4h4h8
 brc4EWRh+iJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaUQBTQAKCRAEWL7uWMY5
 RsZdD/9D8QHTjLTOthce0e12XPB+tRv7yTYfTigi7v76k7nrub0lKoKFh5YWCFnp/HL8DRywxKb
 oxs4TkZ46IOOOzwErax+03oga+ud4RA5ABn2ckO9+qT8fUPy3GhuUXscu70HfPiUymY65J5HtKS
 x1v/qKELfXqmLSu+t4/CfIGxtLVN6znV8WnqApVX89X3sYG8OJFT1Lrqv3H83yFlfcW/aaKlxe/
 UTOgL6htm/yH98HfawS0BAuPXG8f8J7T7geAiZ2LhiEJoivaWalj9qcuNxa05izSy+54u3NwoXQ
 /cCACpUNeOZnAGatJra0dJW4pPehjlM0X3TtI1bgq/Z6TL08AoZa7wmJaxv3kYvoACDSg6uQnoz
 0pzCePqB0kse0Fz5H8nxVc7Z0VWBAkc9Ij4s5Fh+S3l0CDIIxk/cr9PNYBUxtcF2Qqb75cMiueP
 mvNcZp5DsU99p93dsNst594/1XVkYTPcpurKSTtmOvxTImC2AL+0RCI+BY9CsuOpYiqnGVMTe7N
 mGTNbC5b8FDZe9TtKb2nhVBwrMt9OrVGLqj7gT2yMGUiKesa6kTrkd1YllkFpEDiLJJW6fUsWJQ
 zt1Psk8ettsFrj2CWt2WZdymF9Bz/KV8ycv/6A3TMtQuvymfQHZnQ83QUyLw3a/GekISTmoqW2B Nc412T9BlsDc0+A==
X-Mailer: b4 0.14.2
Message-ID: <20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com>
Subject: [PATCH v3 0/3] Implement Send and Sync for clk
From: Alice Ryhl <aliceryhl@google.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	"=?utf-8?q?Uwe_Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The Clk type is thread-safe, so let's mark it as thread-safe in the type
system. This lets us get rid of hacks in drivers.

For Stephen's clk tree.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v3:
- Rebase on v6.19-rc1.
- Pick up tags.
- Add fix for pwm driver as well.
- Link to v2: https://lore.kernel.org/r/20251020-clk-send-sync-v2-0-44ab533ae084@google.com

Changes in v2:
- Rebase on v6.18-rc1.
- Add patch to tyr driver.
- Link to v1: https://lore.kernel.org/r/20250904-clk-send-sync-v1-1-48d023320eb8@google.com

---
Alice Ryhl (3):
      rust: clk: implement Send and Sync
      tyr: remove impl Send/Sync for TyrData
      pwm: th1520: remove impl Send/Sync for Th1520PwmDriverData

 drivers/gpu/drm/tyr/driver.rs | 12 ------------
 drivers/pwm/pwm_th1520.rs     | 15 ---------------
 rust/kernel/clk.rs            |  7 +++++++
 3 files changed, 7 insertions(+), 27 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20250904-clk-send-sync-3cfa7f4e1ce2

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

