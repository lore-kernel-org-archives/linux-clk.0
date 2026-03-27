Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93132387361
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 19:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639958; cv=none; b=iDydpt/Dv8A1kbwgX8TbbOUnh/85yQReYsQpiHuVi16o5TZHBm7HDiBvsnpsOsZWUN8L5eFPZLAP6pE1Gb2QdeMdJHskPBsdRfiCIJlZPg/2lzywB5CP2B+3N8Z4jtwfuwVeJxUFPRNnz8XcV6O9pK/Z7zkWTX1JTuiU+zj+SGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639958; c=relaxed/simple;
	bh=zZuXuYzRXV1Ky5Xhgp7rZ3YFui3eWbaiq3f7MTmQQc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=czp3ARiPk6z63u2cnmCc7sJfVq9FB1Ms52GKGuVRg7P+/Bt4j6PlMYWM53SaHJBTaKo2GIY+0cjxQrXdjQyUWrMuIPSZOrEnZx6jVBygJ0wOkRoSJukH4iUgNMIbU5fRfqPux2xIWktIX/WRExkNvn5TGKJbsRt3/+Pi4l4NVkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iR4oqZDn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qtkjBXwl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iR4oqZDn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qtkjBXwl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774639948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bICn27k7AW7Sds/NN557RWHAZWLa14lZ1eS5gR80gvU=;
	b=iR4oqZDnesepHnz/Hzn3+M+NlPcHCYcAsOxy+eWnVPowEm/T/Wv26Z78lx4slzVxMeNpdV
	dqLpMai8zPuuxbe3kB5yIonT44EOtn6UIntyrMXqw6r63fI1b1+vhFLS11y9o7vuCq2vwZ
	EN+3jqIR2n5cm7yTypS+2FjEa3aOI8Y=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-9p89i2n3ND6QVX4SSXRdEA-1; Fri, 27 Mar 2026 15:32:26 -0400
X-MC-Unique: 9p89i2n3ND6QVX4SSXRdEA-1
X-Mimecast-MFC-AGG-ID: 9p89i2n3ND6QVX4SSXRdEA_1774639946
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b802961ecso33779541cf.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 12:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774639946; x=1775244746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bICn27k7AW7Sds/NN557RWHAZWLa14lZ1eS5gR80gvU=;
        b=qtkjBXwlCOhngMrBb74Kem324OblelTOyyb3TvYWoTDE+Tg4YhF29QYQcZuFGLBxSH
         VYeGsZSvGDSCfS5yr0pxgPEwoSKb/b2sV9/bOX5jUAEbl0LzitAOXyf3HbCaM/NoccAp
         DT3wmY99KfQCDcXTFZvm0nb8tND2h1NNfViGnTJhVwwTycZr2y4cxfSAVRhSbE1U9ZP6
         Pn8XXO48U1NrcvJLDlO/4se0xR+OdDxm/bUG1pE0HSbWQ+UJTAn5o/O7Nnv+uKoDzwvV
         Ii97l/vV08zooh+LLg1x0saDojKbT3mfPuPvIhm03bMrVPPz7Kb4shcu9gPEeoagWvrm
         39cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774639946; x=1775244746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bICn27k7AW7Sds/NN557RWHAZWLa14lZ1eS5gR80gvU=;
        b=aogGrrzJjjzmFGixXviT26sKEjIiVNTM8fxlFeK11k8BaDyy06A18MVUlu+l/jyjIB
         Fo96YSc8In10gvb78amhYlC/a5F+XC3PDbaTvIiuMaKOkwFgo7FVonI7iISkA1fjRMAc
         eoAcNkLOgn6a+jVxIRsCd7Tm2NYfPDcJcg+i2RwT8PGgZkjGHgV9MaVAOfJRBHwimNJp
         qwEvA1lus0ak2mUCfo9leoOtcHLJ0iZ2zIpKpk1FFO2iPE2AeY2KcpVabHuQRszWEpf1
         mMeUX3/ZQp3kHpBYnuso1LI782W90ob0lVLZImTolwPcLtB8gGandGnoIvBOBKylihR0
         TrJA==
X-Gm-Message-State: AOJu0Yx5PThBRMrmG0aYgpP18eo9KmcrP3lg2AmQoM3nB3K31l8jti/g
	Zoooi4vge1JfU5feaKZx7KWTopF556CQLysV7/ekpnz215qjjEZgeCEWVA5iVcCUtocSJbLGUlf
	Jemomy4o4XZNoudLOftuAFl1CocvuXn5e1os+TIBIWP9t1ouiA07MoZFlAXZeEA==
X-Gm-Gg: ATEYQzyAG+PYAbVkQUJU+VuEVI2HOSte7RBxQMfk4uq+Ip+nZTk5AHwKzoeigvnA96N
	3Quj/NKSBqH4FNV3WFbead8wxUVYK2O8trQs0j63pAJ0Ff2RX6BxwKlvWsLzQAslC6UKnad8cms
	V0HhRkzXGfpxHPRBG6iqkjA1yfboXbHCLWzA23pYC2HRJVJ1uy6FCbpkKGPoaF/in5cmsqaClmf
	1iCThq2yU4+mcaB30ZbsdrbLu+uWcMDTLw7RuSBeTG45WLAH3RV+u7OHYi0MBO+pbn2yaENFXkN
	E+mT470LXWuqGs/Z5knZ4VX5qtDhWnABQKErZFPby+VWnFks0wtpSGqMSrcmNxIpbllRjgpDLwP
	inuARobSN6yLpAPg8419qzsiYLF3/rVAS18r1NDqXnlI+BMR4QXRLK5IV45Yf
X-Received: by 2002:ac8:7f12:0:b0:509:320:2de6 with SMTP id d75a77b69052e-50ba386455dmr52408461cf.25.1774639946146;
        Fri, 27 Mar 2026 12:32:26 -0700 (PDT)
X-Received: by 2002:ac8:7f12:0:b0:509:320:2de6 with SMTP id d75a77b69052e-50ba386455dmr52408081cf.25.1774639945637;
        Fri, 27 Mar 2026 12:32:25 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c678e9sm2037551cf.6.2026.03.27.12.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:32:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 27 Mar 2026 15:31:58 -0400
Subject: [PATCH v8 3/8] clk: introduce new helper clk_hw_get_children_lcm()
 to calculate LCM of all child rates
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-clk-scaling-v8-3-86cd0aba3c5f@redhat.com>
References: <20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com>
In-Reply-To: <20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3927; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=zZuXuYzRXV1Ky5Xhgp7rZ3YFui3eWbaiq3f7MTmQQc0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKP3bYrWtjNd2nJh47cbSui93pPnLazdunJyznJv31rX
 0YJ9ZZP7yhlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiS1wZ/gpd7dWOydvk5Se5
 YcfCjZuLHGRkvM9wu63qfSrF6O4mdp7hr3DMgYVaKzXVH0e1Fa/ac26Sikxc8q75qc/sIy0XpK3
 NZAIA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Introduce a new helper that recursively walks through all children and
their descendants, calculating the lowest common multiple (LCM) of their
rates. For the requesting child, it uses the requested rate; for other
enabled children, it uses their current rate. This is useful for
determining what parent rate can satisfy all children through simple
integer dividers.

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk.c            | 54 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h |  2 ++
 2 files changed, 56 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 47093cda9df32223c1120c3710261296027c4cd3..bb602c07df9a2b523a72e1e05cc3a27956e7198b 100644
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
@@ -838,6 +839,59 @@ void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
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
+ * requesting child, it uses the requested rate; for other enabled children, it
+ * uses their current rate. This is useful for determining what parent rate can
+ * satisfy all children through simple integer dividers.
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
+	lockdep_assert_held(&prepare_lock);
+
+	hlist_for_each_entry(child, &hw->core->children, child_node) {
+		/* Use requesting rate for the requesting child, current rate for others */
+		if (child->hw == requesting_hw) {
+			child_rate = requesting_rate;
+		} else {
+			if (!clk_hw_is_enabled(child->hw))
+				continue;
+
+			child_rate = clk_hw_get_rate(child->hw);
+		}
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

