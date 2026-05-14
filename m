Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4064F39DBE6;
	Thu, 14 May 2026 09:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778750915; cv=pass; b=A8ImTpZRqBNfDqyOS0AizAEGYNM9z5JKcDJpkZcTy1zBPu8LeSwX0+rFQ2d2IYrJ/SUh31ov4owJiOkmZJ/+7kUAyoKdIx2d7s2ZNneuqfpRHhNzetugioGpD+1g9fz+MK+1DvlcHpog/tDs0YOhxT54P0WcjajB2SMoOVBiyM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778750915; c=relaxed/simple;
	bh=GC/JrZxzAO+rxsVxcWTATynI7wEQhuCoJL54aWi+NWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ml5XUPkIyudoSZXnbedqVzN4NLclltqrLdvXymogE6+obyixJqOuKP9+u6zHOQMZssTLrMs9ZHyRFD2AB/Sn7BRLFHIH48Yen5fscW+RMIRSWvThQecT36gyN9Nu9Tz7LjRgKJQMZvqpKZs2POPYmVFyrIpFgdXHbJlVbpoRK6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=g3HQ9HiW; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="g3HQ9HiW"
ARC-Seal: i=1; a=rsa-sha256; t=1778750882; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=horYZKYMvsRUbB5Sx9tAHV7nLNY6zYRaZtV+Ctv0AvRqpYrws+WZgvfGoBsf7y4xp10RIKxYHlRP9NsFM3/fywhZuCxt7TRtMXumn7e8b3Ngi4nu1vxkcPgMrX23D0upO4JTW6iEntP6ophqreAMu37mKLcRYNY5shujmRPk29s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778750882; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zPMcKoG5I9qnPtHQDgthnEdvM17iSNpvGtYFLktKU+4=; 
	b=iHqClzVTBHKnJthoM9ZoOOztuTFn889PHN7TM17wg+QZJYRMl/mFFjn37Zgz+YH1dYZuVtr4QlGjVy8GoGFOWAVQubCMARdmr0gLb5WI4oNva0LT2txyJu5+d3ApIiKVW1MW57w8QQhEV74qXxcBKNJLoq01pYZxoatLhRDBp30=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778750882;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=zPMcKoG5I9qnPtHQDgthnEdvM17iSNpvGtYFLktKU+4=;
	b=g3HQ9HiW5783Xz7Gz5p08i/qEt2Yn82ue4rg0PA1kyDuK48HmFAOtmjxOVyFGI4Z
	uotMXAn/ok0VYMa5H07ym6dzAWbpWcxAUoFWsrYVJB8npV0VHZaSComp+C06XucB+4H
	jiWnswHWhYnDeOtu+kyv3lJNgHRfRap6d25Ps6/E=
Received: by mx.zohomail.com with SMTPS id 1778750879948411.16321020159114;
	Thu, 14 May 2026 02:27:59 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Thu, 14 May 2026 17:27:17 +0800
Subject: [PATCH v5 1/6] clk: correct clk_div_mask() return value for width
 == 32
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-dr1v90-cru-v5-1-34f3021aab51@pigmoral.tech>
References: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
In-Reply-To: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778750853; l=1738;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=GC/JrZxzAO+rxsVxcWTATynI7wEQhuCoJL54aWi+NWM=;
 b=qI8aod5XO4PE0z8UDYWgNMJM9IflnI/HKy+dSi+Ho7ZEaVQCm8/G90+GtNjfteefzqWKMg3gC
 EU+l2UtUC2FBHHMkCsh+VXvKtAxI92rPUzXcieahuf7/Wsn2jy8rJ9r
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External

The macro clk_div_mask() currently wraps to zero when width is 32 due to
1 << 32 being undefined behavior. This leads to incorrect mask generation
and prevents correct retrieval of register field values for 32-bit-wide
dividers.

Although it is unlikely to exhaust all U32_MAX div, some clock IPs may rely
on a 32-bit val entry in their div_table to match a div, so providing a
full 32-bit mask is necessary.

Fix this by using the standard GENMASK() macro. This safely resolves the
undefined behavior on both 32-bit and 64-bit architectures, while also
benefiting from the built-in compile-time type and bounds checking
provided by the GENMASK() macro.

Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Brian Masney <bmasney@redhat.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

---
Hi Troy and Brian, I dropped your Reviewed-by tags in this version
because the implementation has changed (to use GENMASK()) and requires
re-evaluation IMO.
---
 include/linux/clk-provider.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index b01a38fef8cf..b986cc054d82 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -6,6 +6,7 @@
 #ifndef __LINUX_CLK_PROVIDER_H
 #define __LINUX_CLK_PROVIDER_H
 
+#include <linux/bits.h>
 #include <linux/of.h>
 #include <linux/of_clk.h>
 
@@ -714,7 +715,7 @@ struct clk_divider {
 	spinlock_t	*lock;
 };
 
-#define clk_div_mask(width)	((1 << (width)) - 1)
+#define clk_div_mask(width)	GENMASK((width) - 1, 0)
 #define to_clk_divider(_hw) container_of(_hw, struct clk_divider, hw)
 
 #define CLK_DIVIDER_ONE_BASED		BIT(0)

-- 
2.54.0

