Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A968255F28
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 00:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778028645; cv=none; b=sMbs1+vQ6eDVgAXu8aMV0M0BVqYHLCqTTFP1kescbIfAx02FXhvnFLM+JtVRuyqU950JUKjHALpdO/NApO0ZZiA7eIBPzNa2toytQt1CMK02lCkWbFZ08kzd+nDAM8MMmVRHGYXrDSvA2qpr0vU6q5OPU3fXIUoAw4EbEy+30w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778028645; c=relaxed/simple;
	bh=BgD+oQMuEH1fjaVOsxXLZwQNVYs4vGf/5ml2JNrIVXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BL+bCQW4k99/njr/ghfhK7HE3XikocQgrvWEvDtlJHXF8n1s+MUfVFQpbCYS1MYR86+sFEYfGN0BSMPElXUkbOaKKfjROMHEY5sACjHJXHaqWQWu0waVx2uKqMK8ujDZ2DfHnNHG74RSd++IEpSvkq4lNKPcO0eb5ibzyxf7Ank=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fBXhu97O; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MK8KQoZA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fBXhu97O";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MK8KQoZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=30rTgzRaj4YeHU5CkBXJIEPPpMq+Ia7k4HuNzziJrXY=;
	b=fBXhu97OBY50XSHz5risXxbpLNmEHX+XHSHbUlVOqFsfnBsToEGoW/8z9WLVR8RUTyAmIi
	Uaf0pmdQvqG9+kVbXrSKLjmUEPlSM089Fsyq803fczJ0twJtIq2sGn2XbGrKU3aKz79G2u
	3HkMyxg6eUwi/81GYxemaLLw0VnKGfU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-ArD9CBIoPvKE9Ie371dfEQ-1; Tue, 05 May 2026 20:50:39 -0400
X-MC-Unique: ArD9CBIoPvKE9Ie371dfEQ-1
X-Mimecast-MFC-AGG-ID: ArD9CBIoPvKE9Ie371dfEQ_1778028639
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eb52a22e85so363706485a.2
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 17:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778028639; x=1778633439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30rTgzRaj4YeHU5CkBXJIEPPpMq+Ia7k4HuNzziJrXY=;
        b=MK8KQoZA5E8xTdsJKpmEaiIwEgJ2CFuV7BAIrvwKqhFeHgI0P4ezB2naSspalCgu4e
         FoH9IdCfbFVhXcndNew+srN1+7nLPyVnyMGjn2Wu57dOIvtlW5nSdhwaeZqZs4SQdXsu
         Ec3eMDxR2T34G7eYKpqfpzH7LlteBMN5rQPH1WeHdogkQ64ldhC8jeYqtXnXW3O2PR45
         fVk+M4zaZ8BcIiL8bpM8VJIKl8blbanG0xo0fRJpc0RYMkgGDW/Bv8rabmud3JFz0CY6
         OHuR9DhyaNnuaQRyVOD/73x0We+H3g1kmO6doa9WfRrtWzeM62rbJw/Xq6jR/sAsr2YR
         KP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028639; x=1778633439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=30rTgzRaj4YeHU5CkBXJIEPPpMq+Ia7k4HuNzziJrXY=;
        b=GweOvjqwlBCyeC/1yVL1+cSXS+WfI0WO1uK4+4lHlOhQRrUkVjF6Tds5FfmVL0rqb/
         alZ21v/2ZHJpalqnLlqkFH4itv2Z6hcxsTjxRh+w5kOmbulIESUDyl6FFnA4xvrxNwfk
         VB2IlE5DCYOMf/gm7CTD5rKTOqaCIynVjBbZ/GxSLhqVQietH7UX0ZgbStzbE4TfU0zD
         oVWDEcnMJPmL8WBXVPwZOCJlFq/oraeC6JQ51mZVR5rUGygAwa302yhB6mmV9ZcwXn4x
         6jCLrF+sx0P+2XfoXRoQdJLRiV3EJ8FBYjaTVn0nr62iAn1X670E464CiqW7UcczeSUa
         IqAg==
X-Gm-Message-State: AOJu0Yy69/hnPwHjnHLayYypBqOq0R8yw0al0tQYFQZfOGGzBcg6TTEp
	QMB2+Z5IbSV56xadxXM9NaUGCvITZjIcKnOSYMOcpIyCpSaw1tryqo2rFB/4wwZl/dUzyXRGJyL
	XzKlor0GBp394lerSGVp+7YE6kUa8MkTDYRk1P0r6Gq6yzBf8ZXlbNi9UlHw46Q==
X-Gm-Gg: AeBDietXkNcIYZs3vyyCMpf5xaMBK8rH8wX43xejdKbfzHWqPko4u+kKdu0Ny27ZWPD
	0950uYOfFclibfMisdTJaANGyEQozvxhR+tcf2euBj/kvsBD0iTSt2D/Ur6CrztnEUCEQhDGJ5i
	9USshfAsZWWnXoxfDugQzqn7/lj8frWJznDCHafwlxPQ6xoKIH+Vxva3pCBqXPBHHCRWPgnrrcv
	FK0aO0IvMDJDQLKTAI5nwnqQd9tV3NBDEwy84BR08ZNsrQE9Rykng1+jktxC8G0jeBuHGy6JvsJ
	LN7r7sCy7KaCs4CWqXxhJU5QrcrncFOARPs+uaTXFlgSuF5wLOdQZpwaR+wGGjJ9o13pIYTPpkA
	wjGPR0+7DLFcLXdu4j+pMbMprrzl+MD4iEnr+P/3WshVkfBI95blLGZtNClZsAGbMCDeje18k
X-Received: by 2002:a05:620a:6ccc:b0:8cd:b617:6522 with SMTP id af79cd13be357-904d61ec30cmr233505685a.29.1778028638948;
        Tue, 05 May 2026 17:50:38 -0700 (PDT)
X-Received: by 2002:a05:620a:6ccc:b0:8cd:b617:6522 with SMTP id af79cd13be357-904d61ec30cmr233502385a.29.1778028638433;
        Tue, 05 May 2026 17:50:38 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:37 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:49:00 -0400
Subject: [PATCH v3 04/15] clk: imx: scu: use clk_determine_rate_noop()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-clk-determine-rate-noop-v3-4-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2668; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=BgD+oQMuEH1fjaVOsxXLZwQNVYs4vGf/5ml2JNrIVXU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TfCwvr/K4sY+A++OW289npydPX3rounzuJQ53trOq
 Lp+RzPyQkcpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQATWf2O4Z9mK3vLvvUpysu8
 lodnv1UvrZnRZyPM33NxHWfsr7RWw2CGP9zL+R5sknm1LGnt8feVfgbtdzfqaG7tfT9LRLlz0ea
 mZwwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Drop the driver-specific empty determine_rate() function and use the new
shared clk_determine_rate_noop() helper.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Abel Vesa <abelvesa@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Brian Masney <bmasney@redhat.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/imx/clk-scu.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 658b6d94de9b..44220e9c5c2a 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -262,23 +262,6 @@ static unsigned long clk_scu_recalc_rate(struct clk_hw *hw,
 	return le32_to_cpu(msg.data.resp.rate);
 }
 
-/*
- * clk_scu_determine_rate - Returns the closest rate for a SCU clock
- * @hw: clock to round rate for
- * @req: clock rate request
- *
- * Returns 0 on success, a negative error on failure
- */
-static int clk_scu_determine_rate(struct clk_hw *hw,
-				  struct clk_rate_request *req)
-{
-	/*
-	 * Assume we support all the requested rate and let the SCU firmware
-	 * to handle the left work
-	 */
-	return 0;
-}
-
 static int clk_scu_atf_set_cpu_rate(struct clk_hw *hw, unsigned long rate,
 				    unsigned long parent_rate)
 {
@@ -436,7 +419,7 @@ static void clk_scu_unprepare(struct clk_hw *hw)
 
 static const struct clk_ops clk_scu_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.determine_rate = clk_scu_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.set_rate = clk_scu_set_rate,
 	.get_parent = clk_scu_get_parent,
 	.set_parent = clk_scu_set_parent,
@@ -446,7 +429,7 @@ static const struct clk_ops clk_scu_ops = {
 
 static const struct clk_ops clk_scu_cpu_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.determine_rate = clk_scu_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.set_rate = clk_scu_atf_set_cpu_rate,
 	.prepare = clk_scu_prepare,
 	.unprepare = clk_scu_unprepare,
@@ -454,7 +437,7 @@ static const struct clk_ops clk_scu_cpu_ops = {
 
 static const struct clk_ops clk_scu_pi_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.determine_rate = clk_scu_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.set_rate    = clk_scu_set_rate,
 };
 

-- 
2.54.0

