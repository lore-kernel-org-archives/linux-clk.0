Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48F138FEF9
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 15:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768317213; cv=none; b=UAbu/ySOPGAxpvw96808F8QRajPZyCmmgvjCQQixjURoxE5vcUlWVEtNqDwTV7ZWfMPqEQunhxBAvXIWTHkRPCCK6SyaX+Ddkk6Lg0CdlZD05nAaInonng7KbjdR6JUdOqbmhOWubSf5rG7yQ3LgjXRiuumzp03rusaxuno7DQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768317213; c=relaxed/simple;
	bh=vFWramkwrqwtJwgC1sH4LSgngbV/etS8iNI590sqCqw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EoyKKb0SfzoJso8BEUtm1t437uIaw1BSw4IpuJfQF4jbrceJeGx5kRqp6eTVB49KiUPjUuA6fwpKuLFRzDJfpMkmFIS5vAhiEd2F2NeKdcVhQlDzfDmmA5JqTAAnbtXTvL3FKhIQd14O2llfPcbmDSurDBqIRf78M8WuNB9LKwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D9MBpuSB; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D9MBpuSB"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47d1622509eso49720335e9.3
        for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 07:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768317210; x=1768922010; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+gU9SYYpNNrQwCuq4FN+wHCGTlifJ/wCG0O0IkTkZkI=;
        b=D9MBpuSByWz878kOb/4JrWv+zQhlvU7+jNvCvJUNCXxPsWW/jI0DRcLGSwFq3p6XxF
         aG6dgoFPdG828zvPGKQL6tkQCmdRQs+k+eMOlvldtWa89rLuLxCIegEVJlUBf3AdY4HW
         Rr9tc0PDH/SHsCeoWaNLBkx6+5KqMa/ZLo5O6XjV3iTRoNbOLCXUQd3bsUDI0CqSQB+t
         dz04MUwmMVQx7CJ7ZVjwlZNazViQEuC5/RZ6w/N0kIno6EeThHGDNQ05sJF7PzIodkpY
         VyZhvj7hZ82Ku9TgFJw0LhcQQxqnk8j7rcfYD8Yr6X7tSk46LpXxQPeAcjC+Zkb9WPv7
         VFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768317210; x=1768922010;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+gU9SYYpNNrQwCuq4FN+wHCGTlifJ/wCG0O0IkTkZkI=;
        b=lkYHTas6D/RlKOrkakVVl0xSm2UwDMPEvv5NwWIdsDpMB9yPdH0r5QpbtsDsh1Lef3
         H4f1JxtPu2r7C7ewnyRcSf4dvxJHO99lkoVyMGFFYc2voJtdu3ucbSZc8MJsI89ogSeK
         GFF2iB/pcZ+uAa+04gQ5MlQU/UW0UX1GMEeqylbEqNmv+zaF7CUH2k3Q+s8VU0MwSkYC
         tIaYsqYbrRfJFo/4Jm7SYm3W/t0Ga8FIUTc8WLJvQ9K5RUfbKRqmDFgJfgX4rwtKN9A3
         Z5kLs21BnvfOvkjIoHgEK+LRh9SSUJsE5NmcT6QGONHtbSQhXmM4fCtn3YARbCSSiQgD
         SAAA==
X-Forwarded-Encrypted: i=1; AJvYcCUt0FDEFOJZQcKc3jsgJCu2dwDAnRfh4i6TB3DG5l63aSXBpI9xHJbdpvDtgm+9rgLCnOrseFW5loo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwctSxD/P1cTzQG7stooJ3tSF5s2ZnJQ30SkcdgsOzlPuLu4qFh
	vg6kIO7d50OtcEnx/4Oq6D81D76eoh1+k0iWtedr/KXL2lKfAD6ECMBz8k90HqfY1/09JC1xsYQ
	iCa1HTgdKort30dmb6A==
X-Google-Smtp-Source: AGHT+IHnuUTaCAWBbZD9W2h/OSSmDtQjxvZdpq6nNLyiRYLG1dj5BdsEl+mKz8Ozip0V1tf1O9hZfCnqvscWuD4=
X-Received: from wma11.prod.google.com ([2002:a05:600c:890b:b0:477:a4d4:607a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46cb:b0:47a:810f:1d06 with SMTP id 5b1f17b1804b1-47d84b26da4mr243374615e9.4.1768317210336;
 Tue, 13 Jan 2026 07:13:30 -0800 (PST)
Date: Tue, 13 Jan 2026 15:12:38 +0000
In-Reply-To: <20260113-clk-send-sync-v4-0-712bc7d94a79@google.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260113-clk-send-sync-v4-0-712bc7d94a79@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=vFWramkwrqwtJwgC1sH4LSgngbV/etS8iNI590sqCqw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpZmEQEuN4uaDvBaM5TmqN9WnhJMSuME0tcTbvE
 YTkLG+hAaWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaWZhEAAKCRAEWL7uWMY5
 Rl6hD/0auoTL/sGpImpn7/kPf/KAL2X3YoNiKIZzHThKN8uT1uxeAYone+3mo8qyaTcM9DDITr6
 5cq6SQN1VE2Upbba2oSwzLdXTkToZdNh+mu4Eq7ky7DhHdURd5KFsAFZz5bKVWAmFMxPGbXUWic
 zpbpxMTJ6QUnuHOIvfuu39nblQdZZj/6inRVCAcTQSmG5vF+0/DftaL6fp7SaUGj5FCNfgFRCmL
 YfTJ/wKsnbTffuMy8sp7BuWtqb4OBFXJPp5j+I8cTSmiyuKCVi2p3nkwxAr08fVpyFR5Jd0y50w
 otlpyfnNzzPJXkKkBzupe6ry4LS/qg/2JcnC5qdPiY6x05rKLHCxRz3ClDVzNNLp4vntSxuZQ7w
 9aVP+poXva8l8+v6nfWgIO8ciKcZUO1IAaVilhy0TPvkVEvV0b33l0ek0qo35T+BaWJ++Y+42sY
 fBHOMq5NlR5BNtcXrC6GJUruPQL6goEC6xqO8yv++luTB8ag+k81xfDQtXot3b+YVi7M5xPzdwd
 JuhPfPLk0Cs4EE/1l2ROvSfM+IWqM1pzSJLQxHJTr18UvcST4VAvFFyF8C7FGjeAdCeRgpm4/T6
 FzJIbAfWa+VuJMMWr7B1nkYoHdHqGCIR4tLS5Meh4HkFP2AGWG+8teZRq3kTzVMedKRt86fLJ5+ 5OXudD+J6HDSHOw==
X-Mailer: b4 0.14.2
Message-ID: <20260113-clk-send-sync-v4-3-712bc7d94a79@google.com>
Subject: [PATCH v4 3/3] pwm: th1520: remove impl Send/Sync for Th1520PwmDriverData
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
	linux-pwm@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"

Now that clk implements Send and Sync, we no longer need to manually
implement these traits for Th1520PwmDriverData. Thus remove the
implementations.

Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: linux-riscv@lists.infradead.org
---
 drivers/pwm/pwm_th1520.rs | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
index e3b7e77356fc2492077c519073e861beb3e44df9..043dc4dbc6232020195c7b73fad302bbb69652df 100644
--- a/drivers/pwm/pwm_th1520.rs
+++ b/drivers/pwm/pwm_th1520.rs
@@ -97,21 +97,6 @@ struct Th1520PwmDriverData {
     clk: Clk,
 }
 
-// This `unsafe` implementation is a temporary necessity because the underlying `kernel::clk::Clk`
-// type does not yet expose `Send` and `Sync` implementations. This block should be removed
-// as soon as the clock abstraction provides these guarantees directly.
-// TODO: Remove those unsafe impl's when Clk will support them itself.
-
-// SAFETY: The `devres` framework requires the driver's private data to be `Send` and `Sync`.
-// We can guarantee this because the PWM core synchronizes all callbacks, preventing concurrent
-// access to the contained `iomem` and `clk` resources.
-unsafe impl Send for Th1520PwmDriverData {}
-
-// SAFETY: The same reasoning applies as for `Send`. The PWM core's synchronization
-// guarantees that it is safe for multiple threads to have shared access (`&self`)
-// to the driver data during callbacks.
-unsafe impl Sync for Th1520PwmDriverData {}
-
 impl pwm::PwmOps for Th1520PwmDriverData {
     type WfHw = Th1520WfHw;
 

-- 
2.52.0.457.g6b5491de43-goog

