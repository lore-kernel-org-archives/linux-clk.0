Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C7829B8E1
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 13:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758808490; cv=none; b=Y49UNrW24VSeoVrb+W5YDmJiJjuaGWYiKQoraSXhWpd1cYab/nNiwmyAl6NkN2bSXhJMaEunmPb9cFqN+Mz0/tZuhAwu6Qe/mgU0mBdaoaK4W0/CORrCbvBfgODL3FtYm6dmsp7xRzZgRid5aMcxxthvEoyAkPeIz/3XrRVsaH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758808490; c=relaxed/simple;
	bh=JsC9L09JB7c5Qto+RbQqrQ01xP/c2mn8RT/NxDHSNBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cCNlrkceOcGEaBXj4pCl/CByGKbDGA1PrBSSohL7aOY6oWpOcQRZ8vyuJUW/eXBJWsVuUC3rGXcG38b+7ESeSGH5gl3GvektB98Zr301Bc5hegkYfZ2PEcFNEqgOM+ssDhth0T7lH6W9iAQ1ZiKzxkTfoLVJ6bA0ot0wvocepIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1gv5qj8; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1gv5qj8"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-7900952fb89so6177076d6.3
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 06:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758808488; x=1759413288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVNYKpGpulAPMt7+7S4cKU51h0g+oImaV0zrihGhT7E=;
        b=H1gv5qj8GfIQ9NRTPG29jnfP5KbJmrzGm60wuBegQlxfzi4jxkdpfIylfdPN4xZk3c
         q2QUApB4uLNi93Kc/1NIhhyFmnA1rPCsUs5s2XW2e/JrEsLPA/pxZAybOsQYypiNyJeZ
         F8E9r7EDbtojWKa2jPZRZriZjW06M/jx9c2eSyWMVQyNRvbS2OQdR1jjMRqF2a5aOqZO
         QS8CHo2QP6ms+mSoi/5P0ntPuvt88siRyvIedXZ/900jgvPk/aMHzzqGqC+Cpd/7m7Zu
         Pzva6Sy1sPibjooacQDQ/Sn+UIF8g3VST6P5tLbOeD9V7u87lsIOCbavrZPRrtxhJODn
         qeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758808488; x=1759413288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVNYKpGpulAPMt7+7S4cKU51h0g+oImaV0zrihGhT7E=;
        b=oIgF/17r8j5CiNxeQaNlWABe+erVOVvH5b+qKno6oGK9RfOMZjt+M3hWUWXjXwDxIe
         yyEucNz+Nab1U+2xA7cksM7t7FUb+rFvemlDZV8X9eB5X3z8EUaCJwpb/6OtrMy9YcPF
         u7K21MjyIgjK+vDu27xsS7X8LHxdAVMDavlLiZmADDTeHMpduZnMzFnz5vGVtRASy9qp
         99PfZaykVpG/vmjva0m98o6eOyEK8mAEAMIyMNKnVOPsnKvwGJxna+d+97BFCcu0Zj51
         gJp9OHBG8BO6LeFnJ97L4judMTt2gZLbuBqZkloMN+8Ij7kMqJrAWcOTWgw0em4Ft0Jz
         7gAw==
X-Forwarded-Encrypted: i=1; AJvYcCUCI8AoQ/TVnLM6Yl38hgkR+2SjZsfMSdDwvpDciLVg6AF4RgBStbcdzKt8WjIICroYWOhDrc6AffQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfTkY2eoO/kF3FZ2K5ajYc9oEiJO44wEsGIjMiPYXHV+/K3zsM
	SswxwHZMeqU6weGlllT/s8g/RyJHwyrACpgbKAUjnHl6X9/FV3AB0Krk
X-Gm-Gg: ASbGncvpohAKMrJyQXsspsZ2zWl93O5inpfah21Cjah3AEqa7/oe0fY3/k12hjPIU5g
	PImgGEgdNKZh4NcQqttlhjhn81IxWeX/WM/ltzWfoNXpbOpC96MN5TtV+3081SGuhMLXUekx6Fc
	d+Ndw+K1zwpW21KIdtdj9eE1icx+da0EAcPOlbd8SWupnU1gWoX6OXUZLxsuyEoaoViF5+6POIa
	ReSi3C9Foh7cwF1z6MyPIDs3AZqlh/vd9/1eAqjf/DKUquQMKFqvvF3F0l5YKwUJ77HnIWhP3z0
	SKOVHPSnyBZ/+WRfIp7qMufGp1FKz1S0hwRtL0N3UeCu47uY/VQhZQWYiE7u92DstghJ7aGjLuP
	rjlJhCC1czaz42JePhq1owzxU2rOMWK+lLMkcZeFAAHy7VZmEJM4TqdKz7HHEuVxbn5zuFLi85A
	WiQLaRfqhxKpsyahCfEOAk990/p1r81uSjs5oI6SyCju88nMivIYGCpU0KlLxB3/Y6w2d+
X-Google-Smtp-Source: AGHT+IGcSCDHxLWEAv2+tvuTndpWh14kIE0XwxqS1qORz7M/FkaXk4hS2hKSF3fui4XqH/sHYATWuw==
X-Received: by 2002:a05:6214:c87:b0:77e:443f:dfab with SMTP id 6a1803df08f44-7fc3bf7dbbfmr47922816d6.32.1758808487268;
        Thu, 25 Sep 2025 06:54:47 -0700 (PDT)
Received: from 137.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:7c:b286:dba3:5ba8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-80135968d5esm11536916d6.12.2025.09.25.06.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:54:46 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 25 Sep 2025 09:53:53 -0400
Subject: [PATCH v2 05/19] rust: configfs: replace `kernel::c_str!` with
 C-Strings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-core-cstr-cstrings-v2-5-78e0aaace1cd@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1758808437; l=3197;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=JsC9L09JB7c5Qto+RbQqrQ01xP/c2mn8RT/NxDHSNBk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCiWFaUQLEh7L6qOIxKWop5VB/xMpVQ3YvBt09OraNycfeOEzMuEQ7DscsvKM0CSzPbqArJQKNv
 7EXOamgAaLgc=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
Acked-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/configfs.rs       | 9 +++++----
 samples/rust/rust_configfs.rs | 5 ++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index 9fb5ef825e41..69bb1fb53543 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -21,7 +21,6 @@
 //!
 //! ```ignore
 //! use kernel::alloc::flags;
-//! use kernel::c_str;
 //! use kernel::configfs_attrs;
 //! use kernel::configfs;
 //! use kernel::new_mutex;
@@ -50,7 +49,7 @@
 //!
 //!         try_pin_init!(Self {
 //!             config <- configfs::Subsystem::new(
-//!                 c_str!("rust_configfs"), item_type, Configuration::new()
+//!                 c"rust_configfs", item_type, Configuration::new()
 //!             ),
 //!         })
 //!     }
@@ -66,7 +65,7 @@
 //! impl Configuration {
 //!     fn new() -> impl PinInit<Self, Error> {
 //!         try_pin_init!(Self {
-//!             message: c_str!("Hello World\n"),
+//!             message: c"Hello World\n",
 //!             bar <- new_mutex!((KBox::new([0; PAGE_SIZE], flags::GFP_KERNEL)?, 0)),
 //!         })
 //!     }
@@ -1000,7 +999,9 @@ macro_rules! configfs_attrs {
                     static [< $data:upper _ $name:upper _ATTR >]:
                         $crate::configfs::Attribute<$attr, $data, $data> =
                             unsafe {
-                                $crate::configfs::Attribute::new(c_str!(::core::stringify!($name)))
+                                $crate::configfs::Attribute::new(
+                                    $crate::c_str!(::core::stringify!($name)),
+                                )
                             };
                 )*
 
diff --git a/samples/rust/rust_configfs.rs b/samples/rust/rust_configfs.rs
index 5005453f874d..ea84c23b784b 100644
--- a/samples/rust/rust_configfs.rs
+++ b/samples/rust/rust_configfs.rs
@@ -3,7 +3,6 @@
 //! Rust configfs sample.
 
 use kernel::alloc::flags;
-use kernel::c_str;
 use kernel::configfs;
 use kernel::configfs_attrs;
 use kernel::new_mutex;
@@ -35,7 +34,7 @@ struct Configuration {
 impl Configuration {
     fn new() -> impl PinInit<Self, Error> {
         try_pin_init!(Self {
-            message: c_str!("Hello World\n"),
+            message: c"Hello World\n",
             bar <- new_mutex!((KBox::new([0; PAGE_SIZE], flags::GFP_KERNEL)?, 0)),
         })
     }
@@ -61,7 +60,7 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
 
         try_pin_init!(Self {
             config <- configfs::Subsystem::new(
-                c_str!("rust_configfs"), item_type, Configuration::new()
+                c"rust_configfs", item_type, Configuration::new()
             ),
         })
     }

-- 
2.51.0

