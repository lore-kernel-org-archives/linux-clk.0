Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32F130C37A
	for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 13:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766064473; cv=none; b=N4gYU/xPq9R+mo6sO28jEMYZcKIDUimbhp0MbAcK/TB5aewDuO6zyXgV4mxbx+PDiIAPPaNuAdr1V5tGdHgbSV+pjVWa+bczRHEOH8aB9FseBjmqSu+EKCxv5PrPrQXsjBZGV/G3r/dhZzvN12zIVwiddQ5Vgj08rbgVD8BhXzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766064473; c=relaxed/simple;
	bh=GfyAuLsrs0QXvlLECZS+Ag8ZW62Fz2Y2rspmoop5J3s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BtaCX7iqSIuF4Gp6mtQ6J7xGkcuO67Ou8cikWPjEuU6xLpoLjlladSNyR2umBm02hU7wqHFMt2CL9LQzXptAwRUXz4NCPWYs1aOPKN9BNggjE4hgAJ0qHT35C0y3pP9XuFI38PCU3Wxzf7QRnHnvk0HPmUi6FR/Mz8/NxUNq0/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o2bThxjz; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o2bThxjz"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477b8a667bcso8434215e9.2
        for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 05:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766064470; x=1766669270; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jK28JFeXstDuyy0FEYnFWM4ECthU7/SRvZ+Uc2K8TMM=;
        b=o2bThxjzPnLXU9L9oDeGhOZkES3GeRTi1zL3NrEGaNdq5jkqWT6YufCyA5opuTtGEv
         02oZOcKKVPzPb46XSEH/6HgYmoFn7eNtH7QHv7VUaAbf6JphZnkBv2nWSls+eo8D9fiZ
         0phoA9jebLIq1vz0AeUAgYhIrIL28aBA7b3L4U0/HKp8Pm+b5ofzMi0xjqMk+5RE8QIT
         UYvW76TLJ8tiMGG0gZDR6yG0Xf0xK2pTrzeV82VfHuE5IYEQD4K0cW/YQS9P/BwNi5k9
         /AmJ/4K1dD20yGEL71Z9pOKA4bvSpm5v8dlk5+WWJrgD9bB+LDB5oe6tXmjgVOyhxHwU
         vS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766064470; x=1766669270;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jK28JFeXstDuyy0FEYnFWM4ECthU7/SRvZ+Uc2K8TMM=;
        b=l9zz3/b0csnGHY9Ahgfuw22GpDqiAkC2vxeZkei/LwC8iBKDIynXiHBmdieQtAsnjy
         JDWIErYQxzGiqbEhJ4nknPzlu2V3wBfUrfLu7chqPmpZfVbZzdzpaMdsGYC94U1RtW9z
         gTsPuR9kf2W65xk23o5Y0KmT/u6UT/eT/N5J2u9G9CQMIfdqmRvqs/ttCJK1BSxSS7RA
         qxiiVcsUhOr5qYyZ0nEaII1kosR2+DJNSCvI2oTlYzkuyOWabb5GHFe8J4ecptoXLLWf
         kKlO83/KHfhMO3IAn4sa/1d99Ys/aOf22JSGf34+v32n9VpWaFFMOv+8p38uiBiAirgA
         uyMw==
X-Forwarded-Encrypted: i=1; AJvYcCUmkBG3QlmamG+XehIIpLBDWtumgULFUcinTibhJ040wsCZ4dN1ldqsHszGnq3joMGRa6cAVNAEpHU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy02WxFFpJFM9reLFHJs1+CBMwNNTSb2XiUJSUof1AbmtGMVhoZ
	yY7/h4GzNwlNWdNKxFMhXRI+QmPhA4b/Wz7pgzBxZNDHCI98NyWGgPwKgwisVmTx6hQgxIm2S6K
	7OdZh+30zuYRtovGbow==
X-Google-Smtp-Source: AGHT+IE3mV0hHlOMpYVWIjAwdmvo5jE0L9sBOpWL6XsbMzQezjxagjqpMFllYAiylsVjD8lLgu0n6vRFRAWYICM=
X-Received: from wmgp21.prod.google.com ([2002:a05:600c:2055:b0:477:afa:d217])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3104:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-47a8f906dd3mr228600355e9.17.1766064470141;
 Thu, 18 Dec 2025 05:27:50 -0800 (PST)
Date: Thu, 18 Dec 2025 13:27:40 +0000
In-Reply-To: <20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1327; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=GfyAuLsrs0QXvlLECZS+Ag8ZW62Fz2Y2rspmoop5J3s=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpRAFSGE9hInQJ93qtSDZ6USDztanUVRXYt7zuZ
 u/M3OKN66SJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaUQBUgAKCRAEWL7uWMY5
 RpjnEACSGceY2rPEdAJ9IM0nAQ/WAryJFpSfxt+WLrj3iN4p5BmgrDdLtUBRaFYTYqcli8hAS05
 YJwMVlfRAd6iFo4DaO3eqnrvZQRPSaBmxegr8FhHpfv8XSaez94scQlMk6FrcSlvrA6Ee4Gtlwp
 l+ilXpbYOyAubw6GpjlWswSHxKOg0QwnWCzW2KwjpbXJnfLQ5fH4lcncuzMfaAkPvCFV4t1y2KV
 kaWXQIWrkEvVGzZJssbmxCb1PvSE6oyjcy3TzBBSM/E1t9jJSdXBS+NfHM5gMDUErPaSO224COW
 ei9hJ+Rb2IfKuZtQ9gud09brWgGvjaOVaiC9LM5c3bNNygut/rL2sqBDf0eUnTjZZ4hl4T7zj9w
 q/VO+QeTNdEDV8AfXeYCZs11q9X+mpJK3MYCF7ZLQsBZFOiaSgTwrF5Q7PSXXxL860gZaGED9so
 hqtSPCzOrli9/mHqIoHfLoSPuUaf2bxTBaNboLD+d8kdD2+h9FLLvMhgGVhXYhEUmOsBKZC9MlN
 DwpN5R2dUuDE7iXXAi9r6a3YRd7J5IHGfhXALODtLYLu7bdkcna8Ggb35wgjrid9IfeQf9eEdVQ
 9zkYMJevx5Tf5DKTw7VxZGkTJHxKfsL+G8+CcVjptxDvHWl4UkCa+/HLohudluaxij+Yf/xnesA vfDaSFT0gn04/pQ==
X-Mailer: b4 0.14.2
Message-ID: <20251218-clk-send-sync-v3-1-e48b2e2f1eac@google.com>
Subject: [PATCH v3 1/3] rust: clk: implement Send and Sync
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

These traits are required for drivers to embed the Clk type in their own
data structures because driver data structures are usually required to
be Send. Since the Clk type is thread-safe, implement the relevant
traits.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
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
2.52.0.351.gbe84eed79e-goog

