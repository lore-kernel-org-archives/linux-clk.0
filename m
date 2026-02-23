Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629BC361648
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 10:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771841319; cv=none; b=q2UmlwK4gouqfo9WZl9l0pRXaJVxjAFnxjcq5CTNHZNsmNF/4GXhZOXAiFWFHnRYKyw0wWLIE+4Gr7L6441JHf3lzkEExWzpCfNbJnUB+A+4YGueI3RNxfgpjQseDwU/NPWjagmXNNaOV+FiixTiqCkf2YdfA+fFyjm+E7tvhOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771841319; c=relaxed/simple;
	bh=pyY9kK4oV6p5HO7c/+g+XC/Va/dVtmU2Pzel1xZKbW0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X6XrdrFJNirUBnPxDOH/qHOWGlZ0kjNAvXgLEolrMiqA5D17PaKzM+KeAaxAM001FrjE/qzZUmh3bXbd/kn3yZ3oqxl5nkfT0GxvuJTS7KYh7o+k+4CP0z4eQIrC24CPzRMFf/5mHGz6u6n28lIfeJUbEp5aIcp7H+l43X9ypT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gz+kDW21; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gz+kDW21"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4836bf1a920so44087435e9.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 02:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771841317; x=1772446117; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=74oBSEu7KeQiZ+IoO0+YkS8FCtMu2JGZ7vr9oRz0PzI=;
        b=gz+kDW21aShQ42gx89RO4N2FPDKFjyt/nXcSzqWPphs7dSFxRDOBzMX2IoFl2Vdqlt
         K3WFxjF45/i6V8Q9H8iC7XpKGOP4X7IGxF9rYz8mfkZBVO+gXruRAi1J7Aw9XdtTWgtM
         B/ByscH+5ewPO9qsB4HPgw2urAjrIE04AspQO1w23PU2dlOny7FOPLqNexMK280w87zz
         SG++UiJQgLpCbqGA7+9l6BWq9B5b+w/w5A4hw8aSBt+n/77QlU81JUlqt6AYmqXfaJ/j
         EQYyMCJFVMAuaj6BEdSVRdy0ub/lJQt2s//eUrW8eVKsEUyL6zXrYVr9qCv1lVoOmZ20
         Yo9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771841317; x=1772446117;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=74oBSEu7KeQiZ+IoO0+YkS8FCtMu2JGZ7vr9oRz0PzI=;
        b=bU2FabuhTrRgZfDMAmS28BANJwlfqUUGi40WfFrzXCtMOnNvyvlMKhqCb5pZMT82o4
         lpzDeJPyhzeFar4IOizOR+gvhzcuawdIjp39i/PmvZnfVya0waV1urlb8uzMCKldYA2i
         iPif0Vb2pomiX80UDiqlSQWD/hiWAiFsC51hHAuvIr3Rv5J+oc35am8xDeB5Rj2EPKK7
         h3w98VomA8DZuUjQ3P/ay4rSVC+aDtXylJ8Ta1YgW4OtFrOnOy1x8q8RjE5b/lXubjx6
         ewBF6YXGqp2UlGpYxudmGdtAWyN3kM0g5gzFhwfe6wEea+Ewgfu5sm+GhWe0ExeoKTV5
         S9ug==
X-Forwarded-Encrypted: i=1; AJvYcCWoCa+9XdHzrR1at+9+yaK4CpVr+DPSItcoiqMJpf3gCMFcxHsDGe3kt814dEO+MDgokeG7DwdbNeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0T202vfYwx767V+vpFGldeLUeHaljxlqyvXTl8zT6nPTLpkF7
	zGhGoEv/qwwbmaCORIVxlKuMMx4CU7O/6RCmz/F8Qjt4oPrOfqz1CB8jLw/bN/J4JOJ9oVe9+c+
	a2lsF5PRri3FRag1bMg==
X-Received: from wmqf8.prod.google.com ([2002:a05:600c:4e88:b0:483:509d:729b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6298:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-483a95fc1b2mr131544185e9.12.1771841316659;
 Mon, 23 Feb 2026 02:08:36 -0800 (PST)
Date: Mon, 23 Feb 2026 10:08:26 +0000
In-Reply-To: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=pyY9kK4oV6p5HO7c/+g+XC/Va/dVtmU2Pzel1xZKbW0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpnCcgQsWGO0SyEW1aYXJHNJ1ToG77ov+/VqDIJ
 2Rqb9pykuKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaZwnIAAKCRAEWL7uWMY5
 RvPKEACcCzYO2H2oHLj3JDXRaxmHYGc/SeaInq4aZ2JbFlexxZTT4p23CkD40L5nX9RPxIEFFFi
 c7N8pnaUWanWESy6oExuxMGfeErXamS1NMw1HApdc8c1tN2HuU6S7Ae/5fZodqUPjq58GFujgik
 UjrEnwkWDYYu5Ur0biyjS07f9wtR0nHDaTokNWxkoINedZCvmyz4tHzGFVG+ckuZwdEPQTS2L4H
 suTrShLXwqeePnkJisxZPKyPYYcELHBOB1WnvpYJ9Y+ECidj9mgbPFjQx53XeHyg2Q7aBOa9nxN
 Tvn6x1DKjWkJbFpGOthc8vlwDei8eMV/hPEu5qdjPtogR4LpopTrhVGVqXoVHK0tcmV1gktjxYR
 fA2KrSdElAcjkxQsZWBOSpwOEKp+HjxgeMjatw3CtjYZBAeyKgmG+cGoSvZmKzcD/220WpvoDtK
 NiGtga+cJkHAVUyjDv6XC/R8zp6+ZwmrK0WJdqkIMoQ1vpj52EJBzZDdljwKL3knHM1h5GSlran
 hUcuddCm9qyCl59Tx2TgYGdiUe4UcF3qxsHzSFus/3+kaqkw7jNKs0jyZ40pz4pM+tqkOTQb2ly
 5H3BRIhQ/kZhj+W1ZRRKzRuBj/lunAY1BW8Ry2zahqvU+ESFtSG4uzeTTQQBMCRRPpiPuCstoW4 wHfC88lm6sts2ng==
X-Mailer: b4 0.14.2
Message-ID: <20260223-clk-send-sync-v5-2-181bf2f35652@google.com>
Subject: [PATCH v5 2/3] tyr: remove impl Send/Sync for TyrData
From: Alice Ryhl <aliceryhl@google.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	"=?utf-8?q?Uwe_Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="utf-8"

Now that clk implements Send and Sync, we no longer need to manually
implement these traits for TyrData. Thus remove the implementations.

The comment also mentions the regulator. However, the regulator had the
traits added in commit 9a200cbdb543 ("rust: regulator: implement Send
and Sync for Regulator<T>"), which is already in mainline.

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/tyr/driver.rs | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index beeffe36b6cb068f2a87129872b37cbea4fb2010..e833e9f537b0225368ca10f5bc71b2612b0befa5 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -53,18 +53,6 @@ pub(crate) struct TyrData {
     pub(crate) gpu_info: GpuInfo,
 }
 
-// Both `Clk` and `Regulator` do not implement `Send` or `Sync`, but they
-// should. There are patches on the mailing list to address this, but they have
-// not landed yet.
-//
-// For now, add this workaround so that this patch compiles with the promise
-// that it will be removed in a future patch.
-//
-// SAFETY: This will be removed in a future patch.
-unsafe impl Send for TyrData {}
-// SAFETY: This will be removed in a future patch.
-unsafe impl Sync for TyrData {}
-
 fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
     regs::GPU_CMD.write(dev, iomem, regs::GPU_CMD_SOFT_RESET)?;
 

-- 
2.53.0.345.g96ddfc5eaa-goog

