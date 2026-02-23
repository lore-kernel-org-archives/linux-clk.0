Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE31361671
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 10:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771841321; cv=none; b=c/F4NkGWLwYCr8uri0X+UU4C2XgLSfaUbTUTtv3p6GvSgdOeTyBg93iTXAcAa/bsrjntsa7M9hb4+FacA21+8lx8Qj8Rbj+4iMMZtXXyrit+EzmSvpbCNhL9GnSxPXSA6TekoRLUjZAw1ht0fZ0b78GyvFCGXz44C3duTOxt5hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771841321; c=relaxed/simple;
	bh=+Vwn2RMiQCLbhdbFzxMNsyo+6P3BWAiCt7b4ppvm0lc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gco2+OoeKUZQ4XnTsGOp9qp7OQJgwkSJ+SswNyDIYFA4ili7mRkZsjDR58vX9rRdq29vyGeCSRBQwxiIvcJsfFISIrkJszaoEdac0vEheJNfiO7WHOuTUXxj1keHxrFc9I+l0J2+UEJkOQdwa1s5arOPKZ/M2fKZSlbEiDMdM5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pi+8rdk7; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pi+8rdk7"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b8704795d25so337236366b.2
        for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 02:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771841319; x=1772446119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OdnKcgHkjFRmgggTpTfgYETTa8fsvbvkTrjIctXuE0E=;
        b=pi+8rdk7qhbkmTrlMOBUPZ4jNC+DQ0xjprhXSbsJ3gCUHo9KrP7Lr7kLV0x6grSMs6
         bU784O7TMnQAtQCyLHde1W9HWXBa7ONXfzoQ5YFxLMovRBaydbTe0heF7NklvzKeDRVb
         868hZ8iuwZgo7R2AuTN25BgBFcdm7lbCNm2yKfn1oGwiKeyU9ADqezMoLGAKYG/jXBT6
         bCaaP4vUbDhGHHODN3auskIP0Zm/sz0JTsQe4re8jp+UZG4j/33S48aqQTNR2rCJkAny
         wIm3DzEWj15C5naxm4Ts27n9ZHIwTaMn2LgYozV9C6Y7xGgP8OvC81SdE+NLzDrVK7pF
         1jLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771841319; x=1772446119;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OdnKcgHkjFRmgggTpTfgYETTa8fsvbvkTrjIctXuE0E=;
        b=ep4uUtAWWgwdGVrZO/Bzfe+LiwGVJja5t/31QUZH6ytk6Xs5siWulPAkwJcdAXFGqX
         rRYaXHj/fuh70e3jAo1T1u9qREvTxBD9H1XmkP5LFDxqNQOa62nn4C/TZAAAAPo08YEJ
         vdDRPOYoTZp9HkKZKE+45t/ccEQ7zw/RilJQL9hYcJQNZsX4qoEF3gTGh7dUxJzWEXee
         F04jDXKhcq8loZNPZXPzrM+tH2Jw+QxFk817m/HJUnkW0B7II8MWqq8lqDs5SB1h5KLQ
         apuQzL9qCC7QSsoGmfy42apOvXW56UwcIAhEMBHyxEpc3vWZDLq/4OmTmBBHarsobUH2
         3Mmg==
X-Forwarded-Encrypted: i=1; AJvYcCXzxwMKr6BVkPwxTQw/vaf6RNx27gFLcg4ONlJbfXvgvHp8KFrKYlmiSzJ0KQEIQZRLzC6SP7nXTfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkoJ5qu29V1iUBr6TdLwpjhW3cBi5gWXaMxcGOERT4p9XTXV/c
	7H/TWYqD/73PPscbwleMfxOeSVo+5GOevGyf2IPxG17i8z/VyqM5dhOsMq2G4gD8jTihFgZn4It
	/SgdwouZuBIkr4BwL8w==
X-Received: from edgi6-n1.prod.google.com ([2002:a05:6402:a586:10b0:659:32e4:b9bf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e25:b0:b8f:ad6:db92 with SMTP id a640c23a62f3a-b908196acb2mr410233066b.3.1771841318227;
 Mon, 23 Feb 2026 02:08:38 -0800 (PST)
Date: Mon, 23 Feb 2026 10:08:27 +0000
In-Reply-To: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1832; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=jAawhmP9tDMdeWRIiWq9BA5B+z9O+mAwAwRx1JUlWqQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpnCcgbTxLXepdurAu3GuF7CkmSYRcJGHXg5wHK
 hhZLv4P056JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaZwnIAAKCRAEWL7uWMY5
 Rmg5EACUr4q9yVqlI5z1xy9rbC8EGqAU70l/fbrINwUJqLf9Vt3GtkZDEI/b6AlgN8RQX4mTF5N
 HbhQXKgYr3ZoF6FEaPGouSxpJfyULOX2dOGt9yKD2+/TUDXWtEMqF3IUZi2EVrynHGVLOQ73+m+
 2f9n2iLzZXtFHFAqD6y2m4alR5jk3jY3z6OJxCUBgZsPNs0LI7md9QylC/vN1NfF5gvEv/QouDJ
 soiXmdHJCUYyBnyOsmDvPwMu/fbl+x92jpt87qPSH9hLWfJbGFojiA/aPlR2W3jIJCkbCVMntgY
 1Ae/ApT2P85bQovYJ1xpIrQ3H0f6ywsWkuPhtEderymKHmGPSukBCAx9tbtw9kt8rX+Osg8+grg
 fg8/woo0bSdW0aIwDRIeUpet1ZR6eMqgjOoJyYt3ECDnWWOZrj61nr1OPmCuQAIMqcYD8rT2XxM
 nJ73kRZ3WpHs5JtCSYUPj+qacn/BhfJdTlXQrHmhF3ZYoHv+bJv+XYe/Z6b5rSx9PXx+nQb5Bg9
 TrnpR3YQeos5D8NteZVWdTP/iLDuezjrC85tGipCA7HdZgQpAhFbDQn7ump6S53j+KhQ/g62O6M
 Vaaurm+dt3EGb3ZPkYJiKXj1PZ10PFUfFE7r/ZFauGbCVwih6pBzgXs3nTUUkcLAP8gj6dP9+Zi c6sJUxRyO1VAaWg==
X-Mailer: b4 0.14.2
Message-ID: <20260223-clk-send-sync-v5-3-181bf2f35652@google.com>
Subject: [PATCH v5 3/3] pwm: th1520: remove impl Send/Sync for Th1520PwmDriverData
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
Content-Transfer-Encoding: quoted-printable

Now that clk implements Send and Sync, we no longer need to manually
implement these traits for Th1520PwmDriverData. Thus remove the
implementations.

Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Acked-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>
Reviewed-by: Michal Wilczynski <m.wilczynski@samsung.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/pwm/pwm_th1520.rs | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
index b0e24ee724e4501b812e5f9c7904b483bfe5e2dc..6cd6fa3d298484cbd84b88cfdd3=
244217855fa05 100644
--- a/drivers/pwm/pwm_th1520.rs
+++ b/drivers/pwm/pwm_th1520.rs
@@ -99,21 +99,6 @@ struct Th1520PwmDriverData {
     clk: Clk,
 }
=20
-// This `unsafe` implementation is a temporary necessity because the under=
lying `kernel::clk::Clk`
-// type does not yet expose `Send` and `Sync` implementations. This block =
should be removed
-// as soon as the clock abstraction provides these guarantees directly.
-// TODO: Remove those unsafe impl's when Clk will support them itself.
-
-// SAFETY: The `devres` framework requires the driver's private data to be=
 `Send` and `Sync`.
-// We can guarantee this because the PWM core synchronizes all callbacks, =
preventing concurrent
-// access to the contained `iomem` and `clk` resources.
-unsafe impl Send for Th1520PwmDriverData {}
-
-// SAFETY: The same reasoning applies as for `Send`. The PWM core's synchr=
onization
-// guarantees that it is safe for multiple threads to have shared access (=
`&self`)
-// to the driver data during callbacks.
-unsafe impl Sync for Th1520PwmDriverData {}
-
 impl pwm::PwmOps for Th1520PwmDriverData {
     type WfHw =3D Th1520WfHw;
=20

--=20
2.53.0.345.g96ddfc5eaa-goog

