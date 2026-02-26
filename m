Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33B638A72C
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 18:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129878; cv=none; b=Uq+dpR4CxNvTUksRGkB7KvRR8EnTFqYpT8EzZrvqlftMm+QZjH4SqDn78AfYgzJEMLxNK6cjIkP60GcANdo2fbK1iC3mNbbGQvxcM7O2KgjQeu8+scwfekGmAQgULSeSRjxerjg+i5W/Zhl1rrzkRlJvzIIbPmeoc4wPgKHX96w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129878; c=relaxed/simple;
	bh=TodRKnNtjx7goYZ9pZValLwSYYe0U+36cHd1VYB3PEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=icQlhZ5Ef/ezf7rC5Lh9QPl+RO3IFhhXYGBKRBFR5CKuG5Ul1up28xVqFAScI7CfdfLHfRGCTprkOV7mJ5g5XzHkHMdIV3/jgp+OIM9SzkwtNwxTY/1vk3edP6mSl3UIgeYyQmMcMq6a70CbJL3eFf/eLdhIR/JwZR3ETbyAGPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XZ5AnqLd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fn20RLgA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XZ5AnqLd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fn20RLgA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W3uV2/wAdMeM5qH5oqiOK9IOTmbJcovH/H1PireO6xM=;
	b=XZ5AnqLdl20y4JBd6TTN+l0MOEoa50P9+G8YgkWc7j/pXWw/eTj7xpWNKYP2LQvhWGLaPm
	x3DJDd0BGGsD8FBILLpREVe0MsOEV9bv0CmYZIjDDx4oWgyaCA8pjTXZ61xLDEhFBIyUOC
	JHtaPWqRrLpPRteJqPXVuf2P2vqhinQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-CR-h6pHXNJm93B2rj46drQ-1; Thu, 26 Feb 2026 13:17:54 -0500
X-MC-Unique: CR-h6pHXNJm93B2rj46drQ-1
X-Mimecast-MFC-AGG-ID: CR-h6pHXNJm93B2rj46drQ_1772129874
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ef98116so914459785a.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 10:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772129874; x=1772734674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W3uV2/wAdMeM5qH5oqiOK9IOTmbJcovH/H1PireO6xM=;
        b=fn20RLgAsirY55uSO+RDGSpe3k/bqbXAl3+4lP3IcPdtYO7c4Mi1rOdakMS4/xqV8P
         rn/hMIhbI24oZD6uxiN7i8qFb+TmeRxTTEc+ebBBgMiueoBrJP34kteup+/MJYi+K0d9
         nWKnsbkpvVUY5ruuWQPneuyYSUfz1NAAMRa5WPBgWwdModn4P+LxXFiPlZ82FEFigit1
         TlhA775Ear0Ijc2yU+EbHheOx9adnWdv3ojlvD8oWD7E5SQxtbpF8PcprMz/6V8GCXY4
         tFC6iw6xEXEVQxiGsU8kVRAPHfxeYSqxxrBJci4cpHLZgeIu3cisnA/HYMnrU57/FEn+
         tT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129874; x=1772734674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W3uV2/wAdMeM5qH5oqiOK9IOTmbJcovH/H1PireO6xM=;
        b=ukgBkku6cbFGC9hS1zxgoKDLfIkvEDlUNP+eSSr778vN1dgsSTuc8thRxkPk2TztPY
         2QmfE1tGZHmriz3QpbI3VBka0fNFe626QMivh4IVqnV9f3fKtNjtx7oPxTjeF56ScVHh
         Qa65UpApjEZnkYWo0Gm53u+zSmSPzWsJiUp8WN0CVnR2Z4U8rSlIY8FAAYhF6s1eZdAq
         Gqr7j7hUmzAqqyw0m/EFRh0ZtvBKbKnEpKrpxqN2RJ2ZzJTnHJWxn9CjzfdZB49Ebchu
         q6AnmIiT6/oLU6pOjLwy5+ZwxIrr8bLV4OlWjsYIA/fyKFwo7P/eL5rKRZK7b9MZqXgb
         n9+A==
X-Gm-Message-State: AOJu0Yya5VFuqAAvY+mj8YPVHWeV6xgFcUMW8axpnBuQekH9xZKAOOdg
	nDrk6iRMWGiJjlO5oY9aAoiUGFiZ2ZpQGiZiRUm/VysIW7+6SWy8pp7k+w85h2HavbMHRvQ2A81
	KUlF1HY2BOmqcgct89S/KHvMwdHAESQ9yAF5A9QMrDsWBilbshfSqIdpYEnWHyQ==
X-Gm-Gg: ATEYQzwmmh88vMPwOBlIlNtJKJXHP/NAfDKKqVBhsuonSPdHkdX1F0LCwhqkF2cX+Me
	0BAW8SH50+/7KaZYq6345ITb0rwhBHgAgIIdS0223ayz8CBF+7tTxiqgNwY+pf8/kYbIyubb25f
	POD90wtkTUuThbAmzhmMGLruErwoygQERMynXZBf0jIx+8FvMYzBxb7r4YzUT9pKmwvnO9au6U9
	SCp716B6f+Ta6D1H5kGOyCSOcB/VUIvRsrsoLl6DkU7+gU/JP3/ZEYwTL3V1KmnnkpEidDIynLL
	mt93cXmoxZvWJz4tqCq3xcEOIeAUmfgN/qSi2rWcYdVhVGk7VSEoAp1js1Wtmi95iBNnBlrSPgh
	YXZse+PRkBMlhCz40qD8rDXCTlyC7Iuob5PH8cxwyG1nByexDNCXP1fb1Qe/2
X-Received: by 2002:a05:620a:40cc:b0:8c6:a707:1b52 with SMTP id af79cd13be357-8cb8c9e673amr2555084085a.4.1772129874442;
        Thu, 26 Feb 2026 10:17:54 -0800 (PST)
X-Received: by 2002:a05:620a:40cc:b0:8c6:a707:1b52 with SMTP id af79cd13be357-8cb8c9e673amr2555080385a.4.1772129873991;
        Thu, 26 Feb 2026 10:17:53 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:17:51 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 26 Feb 2026 13:16:50 -0500
Subject: [PATCH 06/13] clk: imx: scu: drop redundant init.ops variable
 assignment
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-clk-det-rate-fw-managed-v1-6-4421dd2f6dc6@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Abel Vesa <abelvesa@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=TodRKnNtjx7goYZ9pZValLwSYYe0U+36cHd1VYB3PEo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9Omz/9if9mBCnqkMh94+5yWMMk+cJS1CyharLw//z
 s3D1BDYUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwEROJjEyfBaTZ29cWDSZS/HG
 x7ORv9LX6G4MKXByZTmjdCi607FmBsP/oL+rljKc3tHXVud4P6Il+PIB9dclEXF/Z0Yt1b3lvPY
 NHwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The init.ops is assigned a default value, however right below it is an
if, else if, and else where all of them also assign a value to init.ops.
Drop the redundant init.ops assignment at the top.

Fixes: 3b9ea606cda53 ("clk: imx: scu: add cpu frequency scaling support")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Abel Vesa <abelvesa@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/imx/clk-scu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index a85ec48a798b58a12f893587c85709bbd8476310..a39c68d664655537e81df55c7e6d32304de9338a 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -475,7 +475,6 @@ struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
 	clk->clk_type = clk_type;
 
 	init.name = name;
-	init.ops = &clk_scu_ops;
 	if (rsrc_id == IMX_SC_R_A35 || rsrc_id == IMX_SC_R_A53 || rsrc_id == IMX_SC_R_A72)
 		init.ops = &clk_scu_cpu_ops;
 	else if (rsrc_id == IMX_SC_R_PI_0_PLL)

-- 
2.53.0

