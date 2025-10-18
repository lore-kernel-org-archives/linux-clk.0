Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E47D286413
	for <linux-clk@vger.kernel.org>; Sat, 18 Oct 2025 17:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760809553; cv=none; b=p5Ev3XAOzLu5W8HTNGkg7TnRNk94q1twPHaGuGTE03k4JyVhPcZpuBhNjBRrG9INCBDzngKayH9M/kO+hDK+cZ9i+LJgtc1vYsaNYJKjxQ7B0FDW+28M2Ea0FiEFB53CrV/ETBURldD9UdsYgxjlMK+HxzhlQ0/1H5lBsailK8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760809553; c=relaxed/simple;
	bh=/cgHz1cX/7pqPCiwokdGYY23t2YMKDX7WgaCRbImZEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SFGYwupkdRd9ZjiaUFpXr0dqqzHkrjMTkDrpFuY3PK3eSkRB8l0YRgwEIoXDNKBYcsTO9o8eQNElfOtW0wMVQfn5dVUKli83+HBPAPrN5F/jiPr5CPzS3qGfbk8kWPsnyWCLCCSAEIxnWVFTMzE8NVDrAlYjKtxYRPI6SHReSHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aw7kVOzU; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aw7kVOzU"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-87a092251eeso77066706d6.0
        for <linux-clk@vger.kernel.org>; Sat, 18 Oct 2025 10:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760809550; x=1761414350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6x4i2Nx/KcrVad3Kw/MMDkaM+hSW8mJw3uIz+XsVU4=;
        b=aw7kVOzUSupMQBgDrjBE7QuJ7LuSFqr+NhJsKQ7LCquYg/kvtDTTFLRs6nBILlaamN
         inkYr+EVR6qY1CAyYVXZm1jjA6ScXcauQxnBH8OXODNmN1vpZuaMmYS86NmfrRk44JYJ
         hyFNp35WF4ZNz8i6w5zk8QSXWQXAHs4Vk33n8AuuADWpCxny7VMEskeb5PaVP4qz610q
         5Z68eeMf8WA7r+swC/7wvBICNrkN1mlH5Jpo9CuvGZ/pdlxfj5hFxUurO0EH1FSgjTzx
         zuCZ5epmWqGbRlk0lex1rsXOnLOFy9tHJwphVJIRJl3lMhNhBzwrfyMSZPRhVyCDCO45
         TTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760809550; x=1761414350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6x4i2Nx/KcrVad3Kw/MMDkaM+hSW8mJw3uIz+XsVU4=;
        b=DFSN3ls9LtDXErkYSlD9OlEFxUfREy0arD1gApTU02BIeleHguCOcRrnSSVUgZRRAR
         TfkB/K7Rk54/D35XRVtXnBflgjC3E0S3vAyRlNI2Ta9UFZp6uCATMZDVvCjNPFj0AqYt
         ZY6LOYtGCWAFTWB3onbexV49rppSwdXZpJkRVmIdiq+3MnuhtQKX9g9jyRIIavKljTw0
         xXsFSOiinXCGU25zphQUYpikmtYiwWLTwSB6ND6TkmofNCgS0yTDsmePkPHFN2LTuhUp
         PbiZZOwgh5cbYhTfewXXdRVAUAFkXH1KH9Qvl6HoCHEuoWiQGGq/KjQ9PVgdrJsOVfSv
         notg==
X-Forwarded-Encrypted: i=1; AJvYcCVVhIkWlWgnRboxZAkxT0DrZxlmJsVE2VSULVkvgiRkEWEIqkB69fCA5OcJcfI/Nd/9qCsbsSj7I9c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6nOVnTl7vzAb7X9WYaoyc4HeFn7J6aYqc7qYEqi4KZe+Axeoz
	YIRpm1NIwbSrS11ETNHIVDGcCGwAY5kH+aH5vcZK/9GkdMNz8uUnVPZI
X-Gm-Gg: ASbGncsgEnH3ll9Hvg8uxVP6bRZk5FmlyZWjfeweEuDsnbLtAEz+pad6U7vqbX9f+KY
	1gT4ft9G4pqa4WREzhdxtoEcapvD+AIHvGHtezL/jSDh8yMF+bSxsnRDxBPnNY2HD5pTBJU984S
	KoDPI+T45h58zwzWEdE5PuJKJ6tOQbRb/bcxkwnHcsNdkgi0MlN14TT1sR+bjBu4B347zaPQobk
	WcwkPjI4dX9hVDJY7To/f6xxBmFFgWFwHXf2dSgMPs5JWDra+zT7wjNRmX1/U+51FCbixLbU11k
	lOGtGw1wU5EVmqz705MFNNBP9DmCfoZQx1btoboFAF9t76KAGDypdy7k0miPDrlGNJ8sh58U6Ul
	ldqwHhaG+A+iDDX400znhY6I6gObEbgdENx3AqGZvVSZ8W/owJCbVxM23+x8Ohcy34WyUmiq0VB
	qoCQ/JElRAe3VwzeSYfDyjjI7iCtRrEhC82O5+mJXqEnSHO8Ku0atkNk3sxta2HLZ4fammxa/6U
	9/1xxzMR4bmgL4w97ircvQyD9683c9g1beb/L79yAkK8TNEYqyS
X-Google-Smtp-Source: AGHT+IFp9Vyr6DTgU7wMi5TzpEwlGd9IqV/k5vFAlka/PSHuVo2bkmg6CmRBEzK7leqOE/jg7Hax7Q==
X-Received: by 2002:a05:622a:609:b0:4d1:c31e:1cc8 with SMTP id d75a77b69052e-4e89cf24499mr98131111cf.22.1760809550121;
        Sat, 18 Oct 2025 10:45:50 -0700 (PDT)
Received: from 117.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:1948:1052:f1e9:e23a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e8ab114132sm20445161cf.40.2025.10.18.10.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 10:45:49 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 18 Oct 2025 13:45:16 -0400
Subject: [PATCH v18 05/16] rnull: use `kernel::fmt`
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-cstr-core-v18-5-ef3d02760804@gmail.com>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
 Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1760809527; l=1568;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=/cgHz1cX/7pqPCiwokdGYY23t2YMKDX7WgaCRbImZEk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFUyC4lRe8XY0+2gwbmqCYLMq7haRexJVvoEh9TOXoK7TJHzmAqN9kHMrHdHUQpbaYKcy+kW0rr
 jQd4qaEURmQ0=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Reduce coupling to implementation details of the formatting machinery by
avoiding direct use for `core`'s formatting traits and macros.

This backslid in commit d969d504bc13 ("rnull: enable configuration via
`configfs`") and commit 34585dc649fb ("rnull: add soft-irq completion
support").

Acked-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/block/rnull/configfs.rs | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/block/rnull/configfs.rs b/drivers/block/rnull/configfs.rs
index 8498e9bae6fd..6713a6d92391 100644
--- a/drivers/block/rnull/configfs.rs
+++ b/drivers/block/rnull/configfs.rs
@@ -1,12 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use super::{NullBlkDevice, THIS_MODULE};
-use core::fmt::{Display, Write};
 use kernel::{
     block::mq::gen_disk::{GenDisk, GenDiskBuilder},
     c_str,
     configfs::{self, AttributeOperations},
-    configfs_attrs, new_mutex,
+    configfs_attrs,
+    fmt::{self, Write as _},
+    new_mutex,
     page::PAGE_SIZE,
     prelude::*,
     str::{kstrtobool_bytes, CString},
@@ -99,8 +100,8 @@ fn try_from(value: u8) -> Result<Self> {
     }
 }
 
-impl Display for IRQMode {
-    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+impl fmt::Display for IRQMode {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         match self {
             Self::None => f.write_str("0")?,
             Self::Soft => f.write_str("1")?,

-- 
2.51.1

