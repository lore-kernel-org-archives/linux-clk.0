Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8546E481B1;
	Mon, 22 Dec 2025 12:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766405827; cv=none; b=teHLtPtoqcYhqW0aGhC6cyvwHvIKfsrOa8Sthoaq+J1CG2g4coAxIunKwLikLPrvP5x2PXfoTpeTqnJtBZ1fI1iUAxoT8H54R82wEnTlx3Gi9k/Apk7jIWs2B0+fcq1hvNlVamAFw1pGBGs7CgsklBzjS/tIkpoE2MbJEKQ6taw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766405827; c=relaxed/simple;
	bh=N38wzrhWJm0TAw0LugHGfoUnJBbqzn3OUcxJdu1dAaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jEI+cjpyUukM6WWbmRvcQnmqwBIaLagv/LWESpA+hZS7zLk+3l/edHpuXLK4/eqCdVDG+iYQb7t7rU7dDss+Ws/BkFNpRMEw4Rl4BNuoGpCRjAtAvC0dAfoS4iEkkpKkIavuuCebNkv6DSa9k/3LbC1tfoZi3hPK7pQz+Fehxi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLeIv5l1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLeIv5l1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7D1C4CEF1;
	Mon, 22 Dec 2025 12:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766405826;
	bh=N38wzrhWJm0TAw0LugHGfoUnJBbqzn3OUcxJdu1dAaU=;
	h=From:Date:Subject:To:Cc:From;
	b=nLeIv5l1pQWUlnqYv6hFnH4QmEPlPx5Z/tyAK84TkDLuIX0D/2pT+4tfCysMqgF5Q
	 kWM+zsHmRrnv6C7mg/DEaQN0VkorLCX1WopY1ro7KoHjAX5VXWSN0W6Hf5oZVRIbTc
	 1iRZ2O/wTvJ9BbEHqgbt153DLFxs9NuRWlF9dgZ33B0S4z/WC6bm2SgoQzGfNsg7I4
	 GQZ1wiELPGx6kdGy4zBduCfzhzCqWAFfPa6iTZ5RMn8vK20uK+GR9u7jhUWsXm9A4p
	 /VwRcb+YtV5dnMennwV+LN9OFUswcX+xFKmFeHkD4e8w1bB6eGGOmM7w9Mnmx5HISL
	 RpVwBwUUbyBBw==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 22 Dec 2025 13:16:59 +0100
Subject: [PATCH] rust: clk: replace `kernel::c_str!` with C-Strings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-cstr-clk-v1-1-ef0687717aa1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAQBCF4VfRXNuyE2W9ilywBoPQDlKbd7e4/
 Oo/x4OQYxIoIg+OThZelwAdR2CHeulJcRsMmGCmEVFZ2Z2y86SCap1i3hhtIOSbo46v76qsfsv
 RjGT3dw/3/QBnJhpNbAAAAA==
X-Change-ID: 20251222-cstr-clk-122a1428b919
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1766405822; l=1937;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=x6t7zNaTJKp2V19AwBeJWb78M4ILaH9QCkLr0c/YQrQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJvxBNy3RHVriGU3UUaAFlRWEOlFpXX1yZszFR+9rrYdBoqPQ6M7pQ1KDAOvQ7mHCKmBPNw/HQR
 CyJQpqWmPqgE=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

From: Tamir Duberstein <tamird@gmail.com>

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/clk.rs | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
index c1cfaeaa36a2..68a0c2f4e318 100644
--- a/rust/kernel/clk.rs
+++ b/rust/kernel/clk.rs
@@ -104,13 +104,12 @@ mod common_clk {
     /// The following example demonstrates how to obtain and configure a clock for a device.
     ///
     /// ```
-    /// use kernel::c_str;
     /// use kernel::clk::{Clk, Hertz};
     /// use kernel::device::Device;
     /// use kernel::error::Result;
     ///
     /// fn configure_clk(dev: &Device) -> Result {
-    ///     let clk = Clk::get(dev, Some(c_str!("apb_clk")))?;
+    ///     let clk = Clk::get(dev, Some(c"apb_clk"))?;
     ///
     ///     clk.prepare_enable()?;
     ///
@@ -272,13 +271,12 @@ fn drop(&mut self) {
     /// device. The code functions correctly whether or not the clock is available.
     ///
     /// ```
-    /// use kernel::c_str;
     /// use kernel::clk::{OptionalClk, Hertz};
     /// use kernel::device::Device;
     /// use kernel::error::Result;
     ///
     /// fn configure_clk(dev: &Device) -> Result {
-    ///     let clk = OptionalClk::get(dev, Some(c_str!("apb_clk")))?;
+    ///     let clk = OptionalClk::get(dev, Some(c"apb_clk"))?;
     ///
     ///     clk.prepare_enable()?;
     ///

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251222-cstr-clk-122a1428b919

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

