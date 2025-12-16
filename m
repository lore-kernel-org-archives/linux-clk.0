Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E153B8D77;
	Tue, 16 Dec 2025 03:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765856807; cv=pass; b=gUNftEtm2pvAI+pEsn7kprwv86HY8EeqfCXuYMcqlLvF+A3uqUkmYlW/b73vWOXTl3X63iXZYgWcki+14gLbCoHC28DW2KTZBsmUcbFfCYPLVszD0NKk+Gf5+3goZpHFGmMq8kmylDe/sUG/sfKT/IGBoR0PSX8ueHdGuPV1wEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765856807; c=relaxed/simple;
	bh=U6Koewa3ToGVhTuDIa0v9BciWTIN+kAaknVqSU9Al/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UuP5l6gR1je3ZkHNnO2PvOkw1tOOdo0jFZ81KX97vgd4PX0QjGDG+772+HuQXjdzHWkK/XeoWSBDxm/0PxaqaBjAbq6ytvJusgKQyrRwvARTXvlpDRN1VZKBlovgpeOB8v0osnHgENdeWkIAYmFTtbpaZ8YOZ+5Wt7UUDgOVkfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=Bj404qBv; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="Bj404qBv"
ARC-Seal: i=1; a=rsa-sha256; t=1765856780; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ngrer83y2UhQ9LkYF5OxqIHo0oS/4Odx9msBOJCj+WZ90FUwiajYzTHkqejmYWxC5cbWATSK5L6Wcl1Tqbqp1ftHFD+mPWqlK6d7aoD2s8cfH4QCSfkGAhqseq7e1GDAxhmM4gaqqozdRwRvuwPb0ZWiBjccN+5zf7JS6+xzQRA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765856780; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qqyZoKN1UsOMI2CBQ5W9TknPxhID6l57//deLC3J3wU=; 
	b=UGitHZBaSAwp2tPCi3BDahLxciBm6l6EdYPjUBttbNi6dzLWnHTlJaPilLMhICNdsqUceRD8NGNaeNlc92AU2E4chLTbWS+1njr7ifq/FsgpBN5lxtrhwxTNbY+GlGwL/Z2jAzacMnc0JVs50oUG8c4ob5p3i5GXn1RHThnyzMM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765856780;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=qqyZoKN1UsOMI2CBQ5W9TknPxhID6l57//deLC3J3wU=;
	b=Bj404qBvZwDt3y5rQxfPzLA6KbgJDyoM1cWma8zgMF8AcP3qAk2WAy8iHg3oOZ+t
	kZioT9nUHhW/xKgOMfmhcWyl8x1MHxUgrSpQwIKI9WXS56rglYZc68Aq2lBwwikC5Cu
	P88OcH67O7MK3w5T/+ShCDLMHiCfQeP/vYVZpI/o=
Received: by mx.zohomail.com with SMTPS id 1765856778639683.4460283002935;
	Mon, 15 Dec 2025 19:46:18 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Tue, 16 Dec 2025 11:39:41 +0800
Subject: [PATCH v3 1/6] clk: correct clk_div_mask() return value for width
 == 32
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-dr1v90-cru-v3-1-52cc938d1db0@pigmoral.tech>
References: <20251216-dr1v90-cru-v3-0-52cc938d1db0@pigmoral.tech>
In-Reply-To: <20251216-dr1v90-cru-v3-0-52cc938d1db0@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765856765; l=1263;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=U6Koewa3ToGVhTuDIa0v9BciWTIN+kAaknVqSU9Al/Q=;
 b=cbJ40hyHxLUKuvui6NA3kRi5QecXXmnrl8qI8J+hxP5Af6TB+OguIa9aQZ1sMULIPiwp+BPBp
 U1pGH3FrSJxBWS1J+w60N5WLgJSBUYUDRadFG3XhbHV5tmIiAYZRVWU
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
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
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 include/linux/clk-provider.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 630705a47129453c241f1b1755f2c2f2a7ed8f77..a651ccaf1b44ff905c2bd4b9a7043f9e2169d27f 100644
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

