Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FE93C65E3
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 16:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420251; cv=none; b=gz22MsQTz8dzVvYXyY9gTwtYngVVa9v51sHr2DVj1g3D9vuWTQe4YiSqpAjKNvEmZEvA81U/8Adr4y5h8YpL87yDStLvYtut6S1XRsMWAFP//YNRca8dKegQX8/WvrzFvKA3LzHf0OImLpvjn00d4968ilGH6IxLusfElvXNZIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420251; c=relaxed/simple;
	bh=e6VNEFE5OKDlGjgl9TvkE/uAdwoIcDCMi2TMuH/63MM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fFmmlF+W+O+guBNkohupr9ZQ0w3TWcCn23YrJZibmoGjDYGiAjjMwSw6QboohPID/jUs2FFfH+6eApKkBDQoZVZLn23V++xPsM9dJ1Wcc6G2WegZmLP4SapIZH4ZI/Ku6rUh9gfr60Z7WtYV9zn+LHOLJzmcmuPb/JP2hb2xrQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DJvw8XG6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=j3HYrhIf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DJvw8XG6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="j3HYrhIf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773420249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LDONcomQB2DLiXYCP0wRMGDkX6OSYJ9ENHojQAPp6Uk=;
	b=DJvw8XG6BtsR+V/haORIuftE9Of5nBn76OgNc4fOgPUMI5QWa7ziY8WAzeiI3LB6J1KMBW
	7ieLZZqsACtBnWXpERbMwqER82EMmTPXztAq1crdzqk255jyPwsUWfDbXjLLwxTE8UWX3+
	3Mfz3i5/zYTo5h3mDK+w9cpUlH9CaRc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-70uzxEeNNtuuFfwvAghD2w-1; Fri, 13 Mar 2026 12:44:07 -0400
X-MC-Unique: 70uzxEeNNtuuFfwvAghD2w-1
X-Mimecast-MFC-AGG-ID: 70uzxEeNNtuuFfwvAghD2w_1773420247
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cdb995a1bfso666783785a.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 09:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773420247; x=1774025047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LDONcomQB2DLiXYCP0wRMGDkX6OSYJ9ENHojQAPp6Uk=;
        b=j3HYrhIflimqcgQuLjquds1f8tyAGuYUQlPNJIafBQpTlBb4z7Wn1b+IQCs6vkhZ7V
         OM2LzfD8n9XTVO8BNHraTflpIm46D2vtWrxaZ4wZI/zO/mscEGFAqZFyguGuClv6P2Ro
         YI0lkqL+hp5OI3GH+aiasFp6Grtymim1c0nkDJWMdNp/RcuFPZLildLMb3jwRzNtRWEq
         KPbaIokdZyloCLMC60jr9OXO4UTTe3mDJvy8wBEf7lniN5qS0yLMCwdr5R7jjO6/58HW
         Mw5wzl/WFP3RjBkJRIl4PXPyE9vGW1cAKM/EnbgCz7/W6kp4S0pJyDBNhSPXPLe6whsm
         l9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420247; x=1774025047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LDONcomQB2DLiXYCP0wRMGDkX6OSYJ9ENHojQAPp6Uk=;
        b=WoPAlQkt+8w05ulDNVxEEJFWt+QpfP4AqAaQ5zn2XITABFXCUXjThpByePEwdHsr8+
         uH5QbDAFvpRD4sNDsBgUIK4YD8pVRJXCeVUBiSq4rsJr8ZEE0I7dfKI39cxRkA75OlUm
         59x3U0e+rKqyw3duhbSmPk9ji48grOd68Sk7vZEh8wB++Tse+tUEfjDw3kdd08YroLcG
         pSElOfRi/YGPUtSPAOch0kvFNpLC3hjCdLXMs6AaRyYre2hrsi8SmdV0MtuSmOVjuKT7
         Rwhz4gpmyprs/sRySNwx5GEYGBvOR/GWVEzPnL/G8sry1bDNZquu8JLKOaM2UQe2CQzh
         jUFQ==
X-Gm-Message-State: AOJu0YwPHLGUp428jjTYSZmc3VXNtvdOfq+MkDW/zhAowU/rRYjduNST
	Ra/PzcPO7ncSmR19Jj67OeuakSCNarfXu8DLgeOWPc2fc7IlsAAi374l6ZPe20cq2qWpdQlReZj
	wnqUPz77U2L7JJJu6B6TBEZsqfh3z9P/Y8WM8B+v10BZJ9kHWyGJgu40btdDSTw==
X-Gm-Gg: ATEYQzxgDWE7hxVM3OJsDPVbpPOcYK4XWMluF8mQ4Yz80VXKlsFV4XWHT+RGnbD6I24
	kjzo2IPQoUiUcXZBXiL3mt6PHvwjyW5S7Y9mZd4iZ7rvK/iV0JU5sV3MASBv7uORZ910W1GMXiq
	nMW5lfpj7cLfnaV6U+y7WiUu2puJhF2VeVfUm5xs3fAwkRjLMNj4MAVi6se0vmRmUAxQ5YTYp8W
	nB+du5S95oG0hvrZhgRGb5nlKobxB4me8ogAJmU9Iu9lATyLPhsYzxTVqtDW0y2doCFQzUZTXRm
	BBKr+HzTc1LA4x3lxKOBBVzMJfpTXoc8rDBY1/VfKYijwlpyJgVpJ0JxSeJ94aCs1ADwsekhgFy
	p5Kd84sOyqKqePECzRjM7Wq5m6CXunaoTmKiZ2iTPPsMAQwuWdkFC95I7IBS4
X-Received: by 2002:a05:620a:7e5:b0:8cd:c035:4fd2 with SMTP id af79cd13be357-8cdc035512amr158896085a.48.1773420247403;
        Fri, 13 Mar 2026 09:44:07 -0700 (PDT)
X-Received: by 2002:a05:620a:7e5:b0:8cd:c035:4fd2 with SMTP id af79cd13be357-8cdc035512amr158893785a.48.1773420246970;
        Fri, 13 Mar 2026 09:44:06 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda215c2a9sm587964785a.46.2026.03.13.09.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:44:06 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 13 Mar 2026 12:43:10 -0400
Subject: [PATCH v6 3/7] clk: introduce new helper clk_hw_get_children_lcm()
 to calculate LCM of all child rates
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-clk-scaling-v6-3-ce89968c5247@redhat.com>
References: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
In-Reply-To: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3798; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=e6VNEFE5OKDlGjgl9TvkE/uAdwoIcDCMi2TMuH/63MM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDK32J36uUm3NURfuTvh+BHTEN15Qk/ittYecl5aaHeVc
 eK6dTx1HaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzEfx/D/+ofYu/XrvdNqNMt
 ez318bu8R3//TePlKTXiejP/Xq90UDbDP4sPqX7aDOsef7GosTshFCn5I+hTSvvf297fdGQiAxy
 dWAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Introduce a new helper that recursively walks through all children and
their descendants, calculating the lowest common multiple (LCM) of their
rates. For the requesting child, it uses the requested rate; for other
children, it uses their current rate. This is useful for determining
what parent rate can satisfy all children through simple integer
dividers.

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk.c            | 48 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h |  2 ++
 2 files changed, 50 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 47093cda9df32223c1120c3710261296027c4cd3..051fe755e3bf1b0a06db254b92f8a02889456db9 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -14,6 +14,7 @@
 #include <linux/err.h>
 #include <linux/hashtable.h>
 #include <linux/init.h>
+#include <linux/lcm.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -838,6 +839,53 @@ void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 }
 EXPORT_SYMBOL_GPL(clk_hw_set_rate_range);
 
+/**
+ * clk_hw_get_children_lcm - Calculate LCM of all children's rates recursively
+ * @hw: The parent clock hardware
+ * @requesting_hw: The child clock that is requesting a rate change (can be NULL)
+ * @requesting_rate: The target rate for the requesting clock
+ *
+ * This helper recursively walks through all children and their descendants,
+ * calculating the lowest common multiple (LCM) of their rates. For the
+ * requesting child, it uses the requested rate; for other children, it uses their
+ * current rate. This is useful for determining what parent rate can satisfy all
+ * children through simple integer dividers.
+ *
+ * Returns: The LCM of all non-zero rates found in the subtree, or 0 if no valid rates.
+ */
+unsigned long clk_hw_get_children_lcm(struct clk_hw *hw, struct clk_hw *requesting_hw,
+				      unsigned long requesting_rate)
+{
+	unsigned long lcm_rate = 0;
+	unsigned long child_rate;
+	struct clk_core *child;
+
+	hlist_for_each_entry(child, &hw->core->children, child_node) {
+		/* Use requesting rate for the requesting child, current rate for others */
+		if (child->hw == requesting_hw)
+			child_rate = requesting_rate;
+		else
+			child_rate = clk_hw_get_rate(child->hw);
+
+		if (child_rate == 0)
+			continue;
+
+		if (lcm_rate == 0)
+			lcm_rate = child_rate;
+		else
+			lcm_rate = lcm(lcm_rate, child_rate);
+
+		/* Recursively get LCM of this child's children */
+		child_rate = clk_hw_get_children_lcm(child->hw, requesting_hw,
+						     requesting_rate);
+		if (child_rate > 0)
+			lcm_rate = lcm(lcm_rate, child_rate);
+	}
+
+	return lcm_rate;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_children_lcm);
+
 /*
  * __clk_mux_determine_rate - clk_ops::determine_rate implementation for a mux type clk
  * @hw: mux type clk to determine rate on
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 630705a47129453c241f1b1755f2c2f2a7ed8f77..2699b9759e13d0c1f0b54f4fa4f7f7bdd42e8dde 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1430,6 +1430,8 @@ void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
 			   unsigned long *max_rate);
 void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 			   unsigned long max_rate);
+unsigned long clk_hw_get_children_lcm(struct clk_hw *hw, struct clk_hw *requesting_hw,
+				      unsigned long requesting_rate);
 
 static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw *src)
 {

-- 
2.53.0

