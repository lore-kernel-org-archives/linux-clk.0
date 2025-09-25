Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E2A2D640D
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 13:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758808533; cv=none; b=Qw9Z9v3UcfFfD4TYcAkyAPsEhl2N8a4FnRS1cUt2t0zSQbOf8Mw001Y3z6XDioQnk+Jgif2T9Ppxc+f/MYJRrrsxcvfxnws1vcPffCGJBdUNeHoIamE38ah0eoOL75A5jxhxbR6LrtbN+FTvD7thIfHxUqALtdfTYmivxZLWGHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758808533; c=relaxed/simple;
	bh=D/F3RUnYNMNKrZc7ezIrEwfyGQmWHVwyjceS6shQSWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kX4UfDStVDA2TE1+aaISwKfXA4i3+aqqZreuUaYUuG+vpz9Pym9ww+ZquNxT0s4zg+QxC0YWyGzMvnMQT5bChLRHrKLe+amPeLDMKjfsykXrircQiyz5xR2MrYmtEsK1L6HsuQAqgCg0igRzw9WThhv9lCJZPIaUcPyo50cRH8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyMXbrVL; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyMXbrVL"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-792f273fbe4so4555886d6.3
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 06:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758808530; x=1759413330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovaMuoVhmWcLonjnTl4MFtKaHR9pluhUoUKBZs6ASUY=;
        b=gyMXbrVLp101h/tQHbeWqrn9fQ3voncTf+fRhGlhOrd8SqhLi2ljfdqXUG0/MO0IQe
         s1m5AzsWY7rreX5eh4Oi8zLFAFNpdwprKWu6quAe+RE9qoH1ouf/hV//HrU2k0J9i+Yg
         V6G65nlSuRBEfJBQ/5Y3vkd6/lrvWyu5CoTLeL2g/OsQ/CLlQyMnAYVrWFY0L+/W1xOW
         0yt+XVJ3rnN2O8YlLnQM2WMnGZhYbP+6LbwPN6zia3AHc4GmjSgNKiYHdotRO0Ecpjd3
         /QPkpeN1j64pWep+kZJkHdlrdjg2q/Y77RxCg47nUbl53ihGUJ6QBg1XDQZowveaqrPu
         ulkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758808530; x=1759413330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ovaMuoVhmWcLonjnTl4MFtKaHR9pluhUoUKBZs6ASUY=;
        b=dM0Cu0z/L0TT+pSa8YFBU2kDfFA4LB2dFpSIoZ8UHSHZBQJ6zZR6+wiE5YIHGCAfFW
         dEp8BJLG5/fS0m/+mOZMFtmKDTB5stNa2on4xpTnyKOG5kfWWKYu+NuVx5mpMbwd1lxL
         8jMg1t+rXu9LOYZvtoYAjE/rj0emX4FsXnVEA9ndZYHhWCyz98N399CymX8M71unZ2f1
         w7LP7a0cMzUYTb8cdGV/jq7o01v8wjeG9k6LgPZb44EmNCM4xjwrK5G9g+wfpZh28kFa
         nJ33eX2yJXxiJbmIimMvrZEaFEKIzDROPieRYz39ymLHjEs1YirQIMT3HMyBBjaJfDaL
         dFeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVec0O8agRaKkZ70W1z8HN5AgCoqsTibpXHGtc+83bQWS4l02R3ThsxP7cw55MWrxRu1ZyTBWnetjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4S1oB6JKoBVjJ3aXvk6cbD8sWu8/8aFtgi2mgoJmE1mY6tMq2
	7QtKqm6/Cyixfdzqr5UDCdkAIl6Vlolk849Abr3iuF8DmUPzMwX4mfPz
X-Gm-Gg: ASbGncuA9m6QYN55jxO3WcYgvaophLFS9u/641beYmazge/eFl2puBOXhxx+qhm7rmJ
	N1GDk5l3N1OYGeMFe/SulECsYP/62soDR2cyKW8s3dzjSnbDMEoOltv97Bi15jPyXiiuNTfxulb
	ychju/Z23nLa8Tpznuatl/waQ+FNMSvYmFdbk+rOGE+80NR6/Y6Zp//E/1euW3uEcA4ud0OLNaz
	aDthBkAEVg/ig999ICNaRAyeJ+oGYoE3ZjCV9746NUJ9vdDDqrWP9xIX1K1lL4oMAcz34p9TKnr
	N6P9v/J/nKHs8C4a2exF03Zm6POapG3r9vHpKz/zVM2W3ZUDTRI/EW0DpA/vUS86VXKIgcm7U+Q
	BAMtKS6Gbu5nZQgJTVqnf8e0G4WnNWpPlxbcJ+Sd79KCkiJRHtgcz3TG/K5rTnC8kn1JIoDR6Y8
	ErMa/qmmG1T5SY+wMOmBv/QsKaAaoG4Hfwn0JX7ML/e94p0zpvQhPzOOg36OhzvHaPbCog
X-Google-Smtp-Source: AGHT+IHcH/Zjn6brKl+FzN0cM+iQubEhxUKmnAUgz27UdizV+uwHwEDx4WTup8nJvc6pXzFU23iTKQ==
X-Received: by 2002:ad4:5dca:0:b0:792:50bd:2fa8 with SMTP id 6a1803df08f44-7fc30ae34e5mr50026206d6.30.1758808529557;
        Thu, 25 Sep 2025 06:55:29 -0700 (PDT)
Received: from 137.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:7c:b286:dba3:5ba8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-80135968d5esm11536916d6.12.2025.09.25.06.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:55:28 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 25 Sep 2025 09:54:00 -0400
Subject: [PATCH v2 12/19] rust: net: replace `kernel::c_str!` with
 C-Strings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-core-cstr-cstrings-v2-12-78e0aaace1cd@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1758808438; l=1712;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=D/F3RUnYNMNKrZc7ezIrEwfyGQmWHVwyjceS6shQSWA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLl+bRXWnt5oagOInMjpq0Q6TsOND3CIu30DW9zld+zzKdTSHrUu641mOBVFK+TECUsf9QEq85h
 /zu5kdzwmPg0=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/net/phy.rs | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index be1027b7961b..9aeb2bd16b58 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -780,7 +780,6 @@ const fn as_int(&self) -> u32 {
 ///
 /// ```
 /// # mod module_phy_driver_sample {
-/// use kernel::c_str;
 /// use kernel::net::phy::{self, DeviceId};
 /// use kernel::prelude::*;
 ///
@@ -799,7 +798,7 @@ const fn as_int(&self) -> u32 {
 ///
 /// #[vtable]
 /// impl phy::Driver for PhySample {
-///     const NAME: &'static CStr = c_str!("PhySample");
+///     const NAME: &'static CStr = c"PhySample";
 ///     const PHY_DEVICE_ID: phy::DeviceId = phy::DeviceId::new_with_exact_mask(0x00000001);
 /// }
 /// # }
@@ -808,7 +807,6 @@ const fn as_int(&self) -> u32 {
 /// This expands to the following code:
 ///
 /// ```ignore
-/// use kernel::c_str;
 /// use kernel::net::phy::{self, DeviceId};
 /// use kernel::prelude::*;
 ///
@@ -828,7 +826,7 @@ const fn as_int(&self) -> u32 {
 ///
 /// #[vtable]
 /// impl phy::Driver for PhySample {
-///     const NAME: &'static CStr = c_str!("PhySample");
+///     const NAME: &'static CStr = c"PhySample";
 ///     const PHY_DEVICE_ID: phy::DeviceId = phy::DeviceId::new_with_exact_mask(0x00000001);
 /// }
 ///

-- 
2.51.0

