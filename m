Received: from forward201a.mail.yandex.net (forward201a.mail.yandex.net [178.154.239.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969912BEFF9
	for <linux-clk@vger.kernel.org>; Mon, 16 Jun 2025 15:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087186; cv=none; b=WZ+QX+vm4AkEurGlHgIO3AqFqTrg3Q88SEm14pbHpXmgF9O04iF4n5ZnQ7N0REntkH/JVNl54pF9QRxp1VMwBwIgs6Gsy+bKrgvCzocaHrilGCjhBZG/eGrE/0nrozcMXzNgA7XQkjKRo9CfmReXKMWGX40MWqvRwupfNBZbPjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087186; c=relaxed/simple;
	bh=+LwYjfXJzueB7HaMa0+cHKiOwLTDmmJ5whlPzH24Ljg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fq6kMuBxB7amUE4duDnM6DS/DsA7ARKid5415+ZoA4I47rRpgSR/nbMT4dvab++YWOtecw31yoxC0VEWLceGW/OWryzLG5EV1Nl4kssqgYrV5+cv5GyO1haD2YSG1zPkeW+KJH0i69sWjHD4k/ZR20FQ9UvKDzx3XbxsZRNWkKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=NFRO4nfq; arc=none smtp.client-ip=178.154.239.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="NFRO4nfq"
Received: from forward102a.mail.yandex.net (forward102a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d102])
	by forward201a.mail.yandex.net (Yandex) with ESMTPS id F314C650B5
	for <linux-clk@vger.kernel.org>; Mon, 16 Jun 2025 18:19:34 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-95.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-95.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1d:5915:0:640:b034:0])
	by forward102a.mail.yandex.net (Yandex) with ESMTPS id 6AB7560B60
	for <linux-clk@vger.kernel.org>; Mon, 16 Jun 2025 18:19:27 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-95.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id EJNs2J0LgCg0-hqskJXNB;
	Mon, 16 Jun 2025 18:19:26 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1750087166;
	bh=NrkI11pzc6I77alUozshicWIJzB5Sj6lRW/o0Skdp4o=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=NFRO4nfqCp7p4uIdncyBY6fWFyF9oFKLbEvJq62jKc29F/diVtqYBluHWVP487HQg
	 Nfo0ibkqNzcbDcc5319usvtdkZYy91Nz/PgeO+mDfoyzR0NF5jZLvypfnkDsNPxdCV
	 /Ehyb4hkLmYltsOT2g4Xfx0+lXlsU7MaVTsml0iM=
Authentication-Results: mail-nwsmtp-smtp-production-main-95.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: onur-ozkan <work@onurozkan.dev>
To: linux-clk@vger.kernel.org
Cc: onur-ozkan <work@onurozkan.dev>
Subject: [PATCH] Various improvements on clock abstractions
Date: Mon, 16 Jun 2025 18:18:49 +0300
Message-ID: <20250616151849.11936-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A few changes to improve the clock abstractions and make them a little
more idiomatic:

1. `impl Hertz` functions are now constant and compile-time evaluable.
2. `Hertz` conversions are now done with constant variables, which should
    make them more readable.
3. `con_id` is handled in a single line using `map_or` instead of using
    nested if-else blocks.

Signed-off-by: onur-ozkan <work@onurozkan.dev>
---
 rust/kernel/clk.rs | 42 +++++++++++++++++++-----------------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
index 6041c6d07527..fbcea31dbcca 100644
--- a/rust/kernel/clk.rs
+++ b/rust/kernel/clk.rs
@@ -30,39 +30,43 @@
 pub struct Hertz(pub c_ulong);
 
 impl Hertz {
+    const KHZ_TO_HZ: c_ulong = 1_000;
+    const MHZ_TO_HZ: c_ulong = 1_000_000;
+    const GHZ_TO_HZ: c_ulong = 1_000_000_000;
+
     /// Create a new instance from kilohertz (kHz)
-    pub fn from_khz(khz: c_ulong) -> Self {
-        Self(khz * 1_000)
+    pub const fn from_khz(khz: c_ulong) -> Self {
+        Self(khz * Self::KHZ_TO_HZ)
     }
 
     /// Create a new instance from megahertz (MHz)
-    pub fn from_mhz(mhz: c_ulong) -> Self {
-        Self(mhz * 1_000_000)
+    pub const fn from_mhz(mhz: c_ulong) -> Self {
+        Self(mhz * Self::MHZ_TO_HZ)
     }
 
     /// Create a new instance from gigahertz (GHz)
-    pub fn from_ghz(ghz: c_ulong) -> Self {
-        Self(ghz * 1_000_000_000)
+    pub const fn from_ghz(ghz: c_ulong) -> Self {
+        Self(ghz * Self::GHZ_TO_HZ)
     }
 
     /// Get the frequency in hertz
-    pub fn as_hz(&self) -> c_ulong {
+    pub const fn as_hz(&self) -> c_ulong {
         self.0
     }
 
     /// Get the frequency in kilohertz
-    pub fn as_khz(&self) -> c_ulong {
-        self.0 / 1_000
+    pub const fn as_khz(&self) -> c_ulong {
+        self.0 / Self::KHZ_TO_HZ
     }
 
     /// Get the frequency in megahertz
-    pub fn as_mhz(&self) -> c_ulong {
-        self.0 / 1_000_000
+    pub const fn as_mhz(&self) -> c_ulong {
+        self.0 / Self::MHZ_TO_HZ
     }
 
     /// Get the frequency in gigahertz
-    pub fn as_ghz(&self) -> c_ulong {
-        self.0 / 1_000_000_000
+    pub const fn as_ghz(&self) -> c_ulong {
+        self.0 / Self::GHZ_TO_HZ
     }
 }
 
@@ -132,11 +136,7 @@ impl Clk {
         ///
         /// [`clk_get`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_get
         pub fn get(dev: &Device, name: Option<&CStr>) -> Result<Self> {
-            let con_id = if let Some(name) = name {
-                name.as_ptr()
-            } else {
-                ptr::null()
-            };
+            let con_id = name.map_or(ptr::null(), |n| n.as_ptr());
 
             // SAFETY: It is safe to call [`clk_get`] for a valid device pointer.
             //
@@ -304,11 +304,7 @@ impl OptionalClk {
         /// [`clk_get_optional`]:
         /// https://docs.kernel.org/core-api/kernel-api.html#c.clk_get_optional
         pub fn get(dev: &Device, name: Option<&CStr>) -> Result<Self> {
-            let con_id = if let Some(name) = name {
-                name.as_ptr()
-            } else {
-                ptr::null()
-            };
+            let con_id = name.map_or(ptr::null(), |n| n.as_ptr());
 
             // SAFETY: It is safe to call [`clk_get_optional`] for a valid device pointer.
             //
-- 
2.49.0

