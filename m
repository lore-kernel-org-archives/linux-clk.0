Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55E93101AB;
	Wed, 31 Dec 2025 06:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767163435; cv=pass; b=K+o+KGWOLdBR8dWH1jQ+1n4MJKhhzyX3WF7YvT1ThQThNDuEjl/pztBavyFiO3sFuvrrYOSqOP50oQ2chaQyQbVgCUcLri4vtkJx2E0yyEdiGZEhmncUMZ0SUTB2QqLv9YaxMAqN3a/q/4LVy4lTssnc2TVI57BD7bSod4HbL+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767163435; c=relaxed/simple;
	bh=Zt2ZFWEQWPCjuhNqBTL1Ms9NEQgcmV9ScY6KDJoDJuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pMBvq6k26cZbvDKegDYmJub8RVeX7mxBzrKNfbFX2XF0NehOOKBMo1EJQiLKQVDrc5kst6OSbStjaowvt0vrVFxhoa6kX680rFQRN9/msiqlQt6xKoknH1VmTo+FvfSgjgy284AMeA4kY4yZLZ8F+JvqHoVeI+j4egqTFUxUV7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=M4e5CA0G; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="M4e5CA0G"
ARC-Seal: i=1; a=rsa-sha256; t=1767163402; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DLZWDUu6ddRnviGOFJJNEkcdRgfjhGGfDWwcugZ2yZcab+BGZMg32dLoZNDLuZQjJNqvNK3rkxkde4t0YAAaBe2xY3WDmhRfWtFdIH2ap/L9+GISZDf7kdJLFHMkIB1c0ujoheCy/LroLm9e2yCAXYipRUthDJYmV+d3Jt0kyEU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767163402; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4zRxeIGs8y23jXBsR9znLJ6VfQ+IjZXlTpP+EKM8K+8=; 
	b=g7CQ3lhlj0wFQrIUlxhwmAp1OiHEFH47jYUHHDt7uQ3Gfc5JEOZDJEK9RwS0jQmQZu6kv9zNRRI3dwoNbF0EEgmILKSS5x/CjHrJu9vX6WOlU4CWwoi54hKRN1iTA+qhInLJkjbTIfMmpFnoerj0+63vZvoqkswaHZtanUl9SOs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767163402;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=4zRxeIGs8y23jXBsR9znLJ6VfQ+IjZXlTpP+EKM8K+8=;
	b=M4e5CA0GhG0fygFGN2iZDjO+xwVWrRyviZG2Ehk7vNftfb/ipRibOICuNiCc7O3c
	mE2jq+ezXK78OXCTy09VqTPMKvIv83T9gxd3hQIbUvEThKpZZUl8VcqaCm11zErbJxt
	p/ziqs4z3iBxPUW0NRHm6pCz1x1MigcjUgLXR96U=
Received: by mx.zohomail.com with SMTPS id 1767163400138691.5606100786748;
	Tue, 30 Dec 2025 22:43:20 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 31 Dec 2025 14:40:05 +0800
Subject: [PATCH v4 1/6] clk: correct clk_div_mask() return value for width
 == 32
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-dr1v90-cru-v4-1-1db8c877eb91@pigmoral.tech>
References: <20251231-dr1v90-cru-v4-0-1db8c877eb91@pigmoral.tech>
In-Reply-To: <20251231-dr1v90-cru-v4-0-1db8c877eb91@pigmoral.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767163372; l=1255;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=Zt2ZFWEQWPCjuhNqBTL1Ms9NEQgcmV9ScY6KDJoDJuI=;
 b=dXmGwZRFz+yTIccspMDDfQDQ1u1njRUTf6ZIS2DxwddcODGo/8mW0fW5uBI9prwdLMj84Jqfv
 2Kc9fqlMifbBlmxMRjSKF1HY9o704GcLi/RmDGRDJDB0AyM4AZxkf0b
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

Fix this by casting 1 to long, ensuring proper behavior for valid widths up
to 32.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 include/linux/clk-provider.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 630705a47129..a651ccaf1b44 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -720,7 +720,7 @@ struct clk_divider {
 	spinlock_t	*lock;
 };
 
-#define clk_div_mask(width)	((1 << (width)) - 1)
+#define clk_div_mask(width)	((1L << (width)) - 1)
 #define to_clk_divider(_hw) container_of(_hw, struct clk_divider, hw)
 
 #define CLK_DIVIDER_ONE_BASED		BIT(0)

-- 
2.52.0

