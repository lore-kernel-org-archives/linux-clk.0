Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45653D3D1B
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 14:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067180; cv=none; b=uV9I0y3V7/47G6qUTP8wbkDzI3RzQPzP3U/01T/2A0l8GAIfWgs+CQTonqBhfBI6UAMI5gBioJbzTt+j79oP1WHppvPj+aWxtosuODou9vt718GqZLz62P0w47VYpzhF8hDLVYUKOcFkfKoXHt0Nmj9dVU5stQeRBMcmBSNPuzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067180; c=relaxed/simple;
	bh=uC9B74/6YaJgtC1tOqhWle/wJGIWD2whJTfl6Yd1DCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rC/YNfkqefLsn3CUtRYzSjnGlL50WGH661i2zFVaQ2hAHN24oI04couBjMdcBhpG3S8KLAmzQvYabuoUiiM469dTdN/nf31IjA7EDjwcjdFzy0TT1nmPNR8BKWnh8HqoC5TYSMm8tKw1X9YcrHnB/PBg9heAZjr4uVzdkcYCdiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ifa35TkT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tgxz83U6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ifa35TkT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tgxz83U6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ic9NeBlXF4wU+xW1snaCZS2ez+lmS5fgnxG5sCV4mQg=;
	b=Ifa35TkTCQZ6V/Lke6It70lf4Y3/R3IBxd2zlw8g6IM17eDGZQkrzI9GAPsbJKzBfi97+y
	zWjnr0O3oW77WkL89gaoqgNxQl4YGblbq7uVTW1YJwOddGJUbRX++p9oiiRltm5pI4OaQ5
	oAmPTqyO6al8pSYTymtg0AhDJdVN/oY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-aFZTQT3cNyKHfgWYHRSqpg-1; Mon, 09 Mar 2026 10:39:32 -0400
X-MC-Unique: aFZTQT3cNyKHfgWYHRSqpg-1
X-Mimecast-MFC-AGG-ID: aFZTQT3cNyKHfgWYHRSqpg_1773067172
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd80bea54dso830628885a.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 07:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773067172; x=1773671972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ic9NeBlXF4wU+xW1snaCZS2ez+lmS5fgnxG5sCV4mQg=;
        b=tgxz83U6D/jt/7XOUiGW/hF8QD2oryVWGPMudZBpIuBBlXVu51QyRRXCEyl+PMWl/s
         y/CeUIWxoJR9LbVMjmLu8XSWiyiSOqVGitI21+8LfSewye9oHCi12BhWfjZ4T+oPghBZ
         Y9mp7e3117FkJZFMn884hHBBXs33EqDc/wy4kOc9IdFzuqmiwsaMIn+Xzd24b6QLJ1W8
         WgjQnl4v/zJLELHmoazmiPafKakEnt3zMFR6AcG1Fyz28phT+iW3p2qIIEXk0ZKoPVzL
         9sKZJxETt60KvNNkpV96BP4wD1MZdhhLIvcjo/+wRInL2IPFkvc2c1/HKEWT8kLpjF2P
         KKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067172; x=1773671972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ic9NeBlXF4wU+xW1snaCZS2ez+lmS5fgnxG5sCV4mQg=;
        b=w5lCzxainzyHl1CojG5nln+s/Rgx7M01TmuIz59BEAMEpmtNpSmWeJr+7trbjGnb7M
         Xk5wlstEO/x8WmOaO1vJK4LFzOJ4Pms9shKas/mFLILTGHOplLlooQ49+6s5AvKpVncg
         NPG3fjSz/fsQd26niBRc8JGDqlbAT0cOgfqC2VIzPV/cka0Jvjw9n3Ms+4WkWpjQvb4c
         5alqwTWDhn95m6WHdZ1JxTR8lf9LFF1O91QNcvmCAHCqsuTxUl2VjYz18ZXNwxVR3Ced
         bnPQBn4izTd1pq2pWYa2xKwsmc2BfxesddEZTs3Nt6+ZoS6nEFYZ49Lboj78yXF0WPXQ
         kPDg==
X-Gm-Message-State: AOJu0YwWLuhGGwTb2fHZlZXzyHLdAQ22kURTRHWtCieeJ/axTE/qsxqr
	ovnzncV9JcewdonnwLd+5AC/avjGHpq4XYFGzCtdBDlMMNpAS8r19kZXgCV3GcC95YldbKuepQ4
	Psyi7hFrdo/kReQ1T7NPf+2AhqZW+PWDcKhjH75182n9bq9KwjfZ7cPZgHMAjgA==
X-Gm-Gg: ATEYQzxH4ASf3Zyg1xk8eWUYOmZHAad2CWQO3QlL1yxskwPrPtj7o8Vj/wmYdw1cBTF
	/uO4hBD90o0is+BD4KxRV1koc1Ys59EcKRcJsg0XSbdsj+RO0/PjKtSRMSq/kBaZPoif08zyRbS
	DIfS7cdaiD5b9RBPhsdR9GS0Y9efmWZzUx4hFd3duDCy1EHeYfRSMCJw8NgfTzS47YtVngYbSvK
	uypBoKl0yYjPIVjBeJHin1z/i63qcmuOHlsG3g/+MEXox9K5I8QFSpXajTq7e920mK6Tn/yFQ/v
	Qdx7zmNAXzN2cgSK8a09cWuvwWKiAW8OnpDhNT2V40sOr/YvZgPx7O5K5EevoCzV7bfSGAAQuOP
	5g7mDqC0BO+l+k3/yQRNEy03PhQ4Eb2kySe9PoxZEZDspEA8IOTV7xj6QPs+RLQ==
X-Received: by 2002:a05:620a:bd5:b0:8cb:baea:89cd with SMTP id af79cd13be357-8cd6d3d9a52mr1391295485a.8.1773067172041;
        Mon, 09 Mar 2026 07:39:32 -0700 (PDT)
X-Received: by 2002:a05:620a:bd5:b0:8cb:baea:89cd with SMTP id af79cd13be357-8cd6d3d9a52mr1391292985a.8.1773067171586;
        Mon, 09 Mar 2026 07:39:31 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm756064985a.16.2026.03.09.07.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:39:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 09 Mar 2026 10:38:45 -0400
Subject: [PATCH v2 06/12] clk: imx: scu: drop redundant init.ops variable
 assignment
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-clk-det-rate-fw-managed-v2-6-c48ef5a3100a@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Peng Fan <peng.fan@nxp.com>, 
 Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=uC9B74/6YaJgtC1tOqhWle/wJGIWD2whJTfl6Yd1DCo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLX3Z7w5nrBvNsrTNMf3kl1rDhwMu7USnYjFrM7VqlPE
 9822AYKd5SyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRJw2MDBM5l//X/rRn0Qm3
 pYasHy02rHWyfBlY6LnwWt3DlAmhvW8Y/oc2pO0tOi6vMcFY/sPuqitLmx1ZUzxdnfMbDDx4bQU
 b+AE=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The init.ops is assigned a default value, however right below it is an
if, else if, and else where all of them also assign a value to init.ops.
Drop the redundant init.ops assignment at the top.

Fixes: 3b9ea606cda53 ("clk: imx: scu: add cpu frequency scaling support")
Reviewed-by: Peng Fan <peng.fan@nxp.com>
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

