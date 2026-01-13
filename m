Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B17369961
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 15:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768317214; cv=none; b=A7q792UB7s+sCNUCLL3Rugg/BTMaMZQ5bnBZo7x+2gLk+XnO5NskLwZSnNC0H2Gr8A7utJ8tJbxJk6syd/UXJzrW5ejOFxR8nSxRXv2i/lX7D6OKu0uFz6Q1ZF5HcbXCOzOMkOzt2b4YwHJhuWKop/HH/RmZypTJT1GLVpkGvP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768317214; c=relaxed/simple;
	bh=5DE8fHUHNeug+88kGFo3S/QoXnkelD/PvswD8rGjIrM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HsR2v6iWcFdssnYrTX1fS1WLPqfpxy+NMC9TTrN1ZI42CQh+JziVak5yzerb7EbjRVUNovjTRixvjP2FzcMDTuvi3I/gDyrOOE/RvTyTzsdCsrpetfjPM4n9e7fhMlVtPjnqmWDm5agz8AZqTBmq5K2rzm5qRcNAVlyWaecuw6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I0xhZ6ud; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I0xhZ6ud"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-431054c09e3so4532823f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 07:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768317207; x=1768922007; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=clahOJSyAVmCLVNVjHaJTlJ4hThwgbY6ylIwpTEN8h8=;
        b=I0xhZ6udPcaRNeEhWztS9BIlheYHH78ilQ0ssnqyG+aDyEtt2ZgRIJEFMXcZxmErFh
         Ej2OY3B9/C1PglWoh/3bi7ywKQ9Bu5WqQgOzme5UiIqNVRzyb/pQXdUnkO6Qmgkjtrt+
         VV8NK9cTKMs6OTRzWSN8SAXRtB9ypauip8DK5c77gK3x0M6AZ5GljGjFio4BWiy7IzkO
         OSIzEOHDw6GimKjcPKgT/IlhLE7eXigs3cSRMyYQcP+NVnhC02k7+z2xaiaE4vOvtQbp
         oq2p3JqOcIirjWXkhLjLJdZo5/nTn7RtXay4utXCAc9lv569lZArjJVIyxu8U2kfUKi3
         eAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768317207; x=1768922007;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clahOJSyAVmCLVNVjHaJTlJ4hThwgbY6ylIwpTEN8h8=;
        b=S7nSFLSx6Z3/OzGbfc1eqokkSe74jsZFhbED2PADFZGOWpBFYbVGOwXr5fCPnJaRJx
         7KPMDNL+jn9vXpxBN2P3A8VbsL8zEFeDcGS7gDJCbzwLjnz87SuysA8CJ9+uQyrzv15K
         RKiOLFuVf7gzVjf7BOHiY5Lr3bd1304SPWrfK+Fq40TirH4xAl8/CyRTUD/kwI/hUT1F
         1RzF8HzPo3lae2EK9UUHc4qJQOra1spi03me7P4dkQWkvl6+rfi2aruStIQ2EzmCKNQX
         3jsKSvKSMR7L9rFqVkIWcIQ/g7W6LkpK2EfNjF87CNZwVxuaRoY+yQHaNAeze8smeiOD
         YP5A==
X-Forwarded-Encrypted: i=1; AJvYcCXDKpI/ChCPltMAvBDgtxwzfsOa5hlh9cKnNhE4Fbr3iMgHCBwQil1YYmXwnoJBPIk+wKZkEcalNaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YykMgK2u/n9CubfpiEOC2OiYUZlkoIiE8TEDauppRZIDpkgYxqh
	Sshat8YPivmXTuqFej+9/k2JAP7MMxwCcdj1y1Mm+XATv9W+OM+CR6vQZ936JFP3kWeEyztb62E
	u7hQGd2LejVisM1Vvyg==
X-Google-Smtp-Source: AGHT+IFANjV4vLX5QPuJ5KpCs0Rj644PourkYIVXhMKZkYuRk0oEaR0gmzWWf8Xi/v74hg4ToVXO6AC9XE7qoTU=
X-Received: from wrbbs10.prod.google.com ([2002:a05:6000:70a:b0:430:a835:4ce8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1a8b:b0:432:84f9:95f4 with SMTP id ffacd0b85a97d-432c374f4a7mr27176145f8f.31.1768317206801;
 Tue, 13 Jan 2026 07:13:26 -0800 (PST)
Date: Tue, 13 Jan 2026 15:12:36 +0000
In-Reply-To: <20260113-clk-send-sync-v4-0-712bc7d94a79@google.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260113-clk-send-sync-v4-0-712bc7d94a79@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=5DE8fHUHNeug+88kGFo3S/QoXnkelD/PvswD8rGjIrM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpZmEQNNwQvfw9jQxuDNt4fC2n5Cfx+vcwSjcWB
 EjbHAg9hU2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaWZhEAAKCRAEWL7uWMY5
 RvRxEACuwFIesZvoHE5gK5RQaiufwGNORvDKEuP1GJmMebtB3qC4PmH2wFMguWvNpJTUKWU0D5d
 jdQ+ITMxKWDtDMpGzdoBMliByodTN5wwtvNZGIPaLLEUZ+uImdP1HlZ+5M03+eyQJOMs05GW7Zc
 TSlL6zpiv+54WAj40TJH1d5HPB0WLbITPscM6xHXaCvfaCMxSEcbqqDprp8VoDZ6zgZSeAIqc8v
 zVSXwizZxkbc9uGfqfyY6kGS2soNpo+IyeElYFqMNY4pR992VOqL1+37BbqF6BxAxLrtBwNoyBC
 KbUq7ZcC+1DqYAejPv1soQ+e+hcJK9X/dtfkBjW6GBe3B9P0Y6s7qEHIUqV7BSEvxOB/mIQ5UZ0
 rtRm3VEAOnA8v8E2oGTQazJ58ezoKWwB5L6muDTmHlSyEYQhVqNUNAVsxi61bWxCcuXPu9KmxgC
 LHI3zLNriAuors7Gzwlu7Ahzu/6yPgqwJ6ebzzMhWAwTKLvVRvIL7BbAMjEEfFofP9IEuyazi/l
 Up8zWnwYgaiqqLz/g9gxZdaF1h1dm0DWqMUCkAe0/o95w00/ZUtgyOkYMGdSqL8zyYHhS6K7/Qg
 NaPzd6f01DT77HGn2DEO6xOX2PbrAgvzU9PVSXxUEpt/0wR1I5PF2aS3brFDfpjwLpJ/0c2p8pf 28UFVHEynEoLnxg==
X-Mailer: b4 0.14.2
Message-ID: <20260113-clk-send-sync-v4-1-712bc7d94a79@google.com>
Subject: [PATCH v4 1/3] rust: clk: implement Send and Sync
From: Alice Ryhl <aliceryhl@google.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	"=?utf-8?q?Uwe_Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

These traits are required for drivers to embed the Clk type in their own
data structures because driver data structures are usually required to
be Send. Since the Clk type is thread-safe, implement the relevant
traits.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/clk.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
index c1cfaeaa36a22be2e3180b1e9142bb608ab276ea..d192fbd97861212d738d24510eebcd99c9177f2c 100644
--- a/rust/kernel/clk.rs
+++ b/rust/kernel/clk.rs
@@ -129,6 +129,13 @@ mod common_clk {
     #[repr(transparent)]
     pub struct Clk(*mut bindings::clk);
 
+    // SAFETY: It is safe to call `clk_put` on another thread than where `clk_get` was called.
+    unsafe impl Send for Clk {}
+
+    // SAFETY: It is safe to call any combination of the `&self` methods in parallel, as the
+    // methods are synchronized internally.
+    unsafe impl Sync for Clk {}
+
     impl Clk {
         /// Gets [`Clk`] corresponding to a [`Device`] and a connection id.
         ///

-- 
2.52.0.457.g6b5491de43-goog

