Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76B028CF50
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 13:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758808476; cv=none; b=UNBR5I96X6smMK76gdqWcYaENdjYA4IO7SRzZWEnbUXzXIllbMT0OQA+48m3Qj8lUnkcXQh9Uw86PzejSOJzzhNM7MvazIl3swnq+vhcVhTX7Le0Edz/eawda3QutZFeYL0/tCMij4tCOrPLvwIh8mgb+iezOunRQdW2Fj9Sg6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758808476; c=relaxed/simple;
	bh=hAcmGZ1oTJ4jVBQJEYJ6EMTc7nRfLDtEyG/sjigYIyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S5t87B5M+/OavnnpIeR0npl34jWGiTdTekZ2TIS3xJZC+Rqb4qZM3Wnv6olgD+/aUliOBiBJSultVKzwiwU6jeMjSwfQL0rEdcZGDmbMDmu9H8k/cMQ0WwDSV35plUxDmMYk2YMvMKlobgpPZS92XOEHiEJXvklHDiyNWaFYu5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdFJ5Y+M; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdFJ5Y+M"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-7960d69f14bso4700376d6.2
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 06:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758808474; x=1759413274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2xzf6OZF5c76vENMOs87EjkdVa89C5AWM8vex+/TLyw=;
        b=mdFJ5Y+Mr5cQmu2a8FMx7odFq4o5MU4BtNFZUkmdmuk5NsirvsjSA9+cuF1FCaZ/oJ
         7wiY8Pgx6585HzC/a7LApe9Ol775mowjqiHcnsl8BVXk5hr+s/Kw3bhzgaTJ/AP2mN0n
         7fmlXG5ejtVjGJTM0UCXTvNO9a+yn9hoNAv8KGozm6Lz2VOnWwqXfkU/5lj3C48p42jG
         J9ypONLwel9qPlk2MIK2ZXA3mt3yU35/JsHk5wqj2dD6Rnn6nDeJ3/LHViyX38P5LUBX
         tdXG2Lxox0kyA2sb9DwgI+ROdjMbTirj+beoub0FU6beRgwH8yBdgKfJJS58Rq2vLX/5
         +KZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758808474; x=1759413274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2xzf6OZF5c76vENMOs87EjkdVa89C5AWM8vex+/TLyw=;
        b=GTszqVwnJou/8KcFvZBLIEQC1EvjiF2+PrK/BDXQqTCgEpmtkjy5ZlDEH9CsYndaQW
         YWRrNnJn5MEnm+6Ncsce5DqOVTziCOm603SH+jqvpxCYBDWskqjwUQSMGxWvMV1AneDZ
         R58ar0NAYmcHhRASOMc8/KuNKs7Co0Av7KSGTNfPbSNseGigrCH26l39pWTqV2fvUf69
         vGvgG4z9709iSAk/iWO854Ln9xEVdh1CHFcd0gEG0crCwFhXaHku2HoqdYh2TX9hGTle
         6UaVXYwYIMZwN2wESq9kq6JzU/LCd5NlH+e1wk2/YV0O/0t6bm77f7YwbR4mK5vrNCpQ
         7A2g==
X-Forwarded-Encrypted: i=1; AJvYcCXAJaPSbGs0haDZVTvA2U2tOkYqLNSS1+yiq+nG8o5dBiRKhnqASUm1mfOh8CotdohGG/D2RcxTjhk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1hkyBaO1FDy5hUgSWYihXRRH/bZkKSbUM3eYievvY8Q4iWer+
	eRDTiYMUk3GwIyDEE3k2teXHL/TVcdhYNEO+89gI+blnUvMG/cEzkZ+i
X-Gm-Gg: ASbGncv4oGHyQ5Z0Y1CU5+KazCEkJsQBGsdRZh6B5F+Hncr8EOdL8+B/dDh4LdpDEni
	0vft7AxuPOJmQOL/XB9Gcnp+p1SggdGAO+b64MaAZRoSSQDa7RqFZzo7vYV3oZVJ1nFJw+98knM
	gQKiFZzZfc6WAR2khqA22f+jEvOreL5ZeMQ1G5HzmztiaDsWNc9hG2F3SMj9YQwcPl46zJasI+S
	8d/bGZSnFBKKLHLkntkJOVrJ17jnVqJBlm0P69fAxWYFFc/xXujzCV/5Yl71BYSnMGVUL0zHqbH
	36vwhxy1CvJ+ZLCQFE8vKdMc92Lvivm741zBOILKuV3cVK1Zj0lmtS0DjNHWqK4xyA0wjj4meEm
	l+6/tIX8oSxvbsPV1TIukR0BhroNDNRkwu42XdLO67r5CX2QqrlsmgEECSiFJfACBk+3upN5mUB
	HuBkJgsyZtVbJIm3fccfcR1j4741B50WJHYLF6ljCettemlj4GoRZAO3f/hWAmTz/ulCC0
X-Google-Smtp-Source: AGHT+IF/YXOPVFfPbsLgNMSmKy5gMrqFYiERb3qNmBjJICdsnhp8ZUohxvtzmsCi+i1Rv5C0gLGPJg==
X-Received: by 2002:ad4:5bc9:0:b0:76a:fcee:97aa with SMTP id 6a1803df08f44-7fc309ec826mr47810606d6.29.1758808473264;
        Thu, 25 Sep 2025 06:54:33 -0700 (PDT)
Received: from 137.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:7c:b286:dba3:5ba8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-80135968d5esm11536916d6.12.2025.09.25.06.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:54:32 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 25 Sep 2025 09:53:51 -0400
Subject: [PATCH v2 03/19] rust: auxiliary: replace `kernel::c_str!` with
 C-Strings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-core-cstr-cstrings-v2-3-78e0aaace1cd@gmail.com>
References: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
In-Reply-To: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Jens Axboe <axboe@kernel.dk>, Alexandre Courbot <acourbot@nvidia.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1758808437; l=1276;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=hAcmGZ1oTJ4jVBQJEYJ6EMTc7nRfLDtEyG/sjigYIyU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEE+jmobZ+OS5gJ2DI0z3t4gywTvP6wS/uYHw9wdi8Q0VEYO/oiFsjlDMO0nWijf77etP3ctTic
 ZfcFfCn7DRwM=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 samples/rust/rust_driver_auxiliary.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/rust/rust_driver_auxiliary.rs b/samples/rust/rust_driver_auxiliary.rs
index f2a820683fc3..7c916eb11b64 100644
--- a/samples/rust/rust_driver_auxiliary.rs
+++ b/samples/rust/rust_driver_auxiliary.rs
@@ -5,13 +5,13 @@
 //! To make this driver probe, QEMU must be run with `-device pci-testdev`.
 
 use kernel::{
-    auxiliary, bindings, c_str, device::Core, driver, error::Error, pci, prelude::*, InPlaceModule,
+    auxiliary, bindings, device::Core, driver, error::Error, pci, prelude::*, InPlaceModule,
 };
 
 use pin_init::PinInit;
 
 const MODULE_NAME: &CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
-const AUXILIARY_NAME: &CStr = c_str!("auxiliary");
+const AUXILIARY_NAME: &CStr = c"auxiliary";
 
 struct AuxiliaryDriver;
 

-- 
2.51.0

