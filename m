Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9630C22422D
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 00:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756427939; cv=none; b=IOLJL6s3v1YWjIl04d/1c6yfCWxi6BQ0ahT6QjpOtN+waUXK/4U5uPSzftFSHG3MhZDuVhX+URwohRw21DcP6URsRsiiYsWnj0qZW9CHi57fYoJtNvHJcra6xKrK4OvrpMdUq25oKgZB3gvYvUGwEQYEYLI6x3nxe8hTIgiek5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756427939; c=relaxed/simple;
	bh=yQjDlKucQbDfv9rLtsx5KS2YxuVB1vqwKzuSAh7+mnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bd6CvJ4E1vuSYZxS989lFh1wX/Hx+Hw6uwYiulrLPUtdRvfJRIkUje4Sv+b7lUmPkzze3oypy1y65ZtGgu2cPhf7fSATojZfouxCURuy6odswSotORJwIzW3fW/QgfYuy/ZaT9frUa1QutwbsJwup9ElDEBp3qNRHcalJbYP2YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ax6qIbBx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ax6qIbBx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756427936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GfKsJTdQgTKprCHDD3jSWtPOt7a36P0+9S4imFiAXj0=;
	b=ax6qIbBxHZ2QiEdurasfxgHBqwL6jJ+m3WHJqrW2eOG1MqSnLcfjWpqZHc1cK1h3phkWRK
	LTiZMfsHPRTcjsL8aHh3rP6iQOnlF658f1cDJ34Ldvdk1KcBXUe4mxMABhWWmmFb2QY8DS
	M8lS9H75/G3OAG6hh4fbPIC9+ezl260=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-pRNDAGkOOY-tVVXbD-bquQ-1; Thu, 28 Aug 2025 20:38:53 -0400
X-MC-Unique: pRNDAGkOOY-tVVXbD-bquQ-1
X-Mimecast-MFC-AGG-ID: pRNDAGkOOY-tVVXbD-bquQ_1756427932
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70de52d2870so14715276d6.0
        for <linux-clk@vger.kernel.org>; Thu, 28 Aug 2025 17:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756427932; x=1757032732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfKsJTdQgTKprCHDD3jSWtPOt7a36P0+9S4imFiAXj0=;
        b=pk3URoDJg6IQ1VO2UsxJin40G9In1+/ShQcrTzVQYSnGm4Sc+Jk02dukFlhvypC3qT
         o7GzTZOdAnr8YoiQJASNDZevKtdFbDLTIuFJUigPmFFuH7h+PWkUlrsKTUkthc7F5w9Q
         XICXT87TxzR53e1yoBxbNj2fVNIUANoHVWWVvJ7pZLri0AHwQrfS+V4ATvPpblwZ/pZx
         A6XUXUiwwFw8MP+lfCQ6ppyP0xKzM5KmgdGYKSj//m6eWzs/0vt03T0F+LmFsBIzrCRA
         cEir/7KoSHcobVe8jLTPhaK9hrb9lLfLzJRS0MK4D0hPJevazNKzhVrGW8/q1JiIjJg2
         saWw==
X-Gm-Message-State: AOJu0YyOwTUc1w8nE59DTk1NRlnRdvlHJUrcrTIf1cWmwKzRlKSdqaLl
	xNPEScwLBsX2DcWNEPfvbbesU1+NMJSKug3Z4wDbhL6wKZvZIyJ+/32TNywk0BCpKz9kna995GM
	agUkUy1zoL8ULbkLQP3WkyfyF3PGmFSoI8BRbmnA7S5ZnCCXlFJwFVbo8MwQHcw==
X-Gm-Gg: ASbGncvLbcsmsdLV2buvXx9HLbvn7zJhFlREhDqomV2DbLqUFwsQJoDv83k7XDNOpCx
	0Jztfx0sv380BCU9L6hFi6quXfMva19cxI5PtOv0dZuVx0Z3SFKJOkE6U5gzS+lzXZFlXISf1/n
	/tcUlFpsPO2pCT77X7zUT6ns/UrTxDFqfM7q+vfzumAdmXsua+Bm6xxviCc0oL6DGLwZfGo7RkQ
	BnObbP2evyr+XzA0TmZcxPZ8ZWhj7PUTQDYux2eds8igQCymFTwIq2qEGg3pg0/4i489+HU9oVm
	FNfe00gtMZuqyszg4bSsgGprBnexyyjpsWW52a+Jhm16PCaX2+DDo/zuTbtjJZ1WbMYgmrzDoLY
	+q3IoO01Bqs4ySLR8umEf3R16NLyoMu9ZkQ==
X-Received: by 2002:ad4:5ae7:0:b0:70d:6df3:9a8a with SMTP id 6a1803df08f44-70d9740287emr335625156d6.58.1756427932234;
        Thu, 28 Aug 2025 17:38:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwEc61ysJKMEZh0lWoU9IOEqRG7fUQ4re7qEY+oU+35ItiYKJvIfxusraAgiqWCmyxfYtUOw==
X-Received: by 2002:ad4:5ae7:0:b0:70d:6df3:9a8a with SMTP id 6a1803df08f44-70d9740287emr335624916d6.58.1756427931903;
        Thu, 28 Aug 2025 17:38:51 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e6264141asm5588696d6.65.2025.08.28.17.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 17:38:51 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 28 Aug 2025 20:38:25 -0400
Subject: [PATCH 6/8] clk: sophgo: sg2042-pll: remove round_rate() in favor
 of determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-clk-round-rate-v2-v1-6-b97ec8ba6cc4@redhat.com>
References: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
In-Reply-To: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756427914; l=2918;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=yQjDlKucQbDfv9rLtsx5KS2YxuVB1vqwKzuSAh7+mnM=;
 b=NIACu2uEJBGAECXwzUlTYQmeDeO89xJedpYWiz+3jVOZMhats8C5aEq2W9Xgn57Xm3aQE46TX
 bO0ZY19dAj/ACNhybTA+CdBVvm/B0H9sIJNyaJ+3B0kXEmy97yyk1w2
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

This driver implements both the determine_rate() and round_rate() clk
ops, and the round_rate() clk ops is deprecated. When both are defined,
clk_core_determine_round_nolock() from the clk core will only use the
determine_rate() clk ops, so let's remove the round_rate() clk ops since
it's unused.

The implementation of sg2042_clk_pll_determine_rate() calls
sg2042_clk_pll_round_rate(), so this folds the two into a single
function.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/sophgo/clk-sg2042-pll.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/sophgo/clk-sg2042-pll.c b/drivers/clk/sophgo/clk-sg2042-pll.c
index e5fb0bb7ac4f97616f3b472fcab45e5729eb653e..110b6ee06fe4b61e89f3cbf2ce00eb03c078afb6 100644
--- a/drivers/clk/sophgo/clk-sg2042-pll.c
+++ b/drivers/clk/sophgo/clk-sg2042-pll.c
@@ -346,37 +346,30 @@ static unsigned long sg2042_clk_pll_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long sg2042_clk_pll_round_rate(struct clk_hw *hw,
-				      unsigned long req_rate,
-				      unsigned long *prate)
+static int sg2042_clk_pll_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	struct sg2042_pll_ctrl pctrl_table;
 	unsigned int value;
 	long proper_rate;
 	int ret;
 
-	ret = sg2042_get_pll_ctl_setting(&pctrl_table, req_rate, *prate);
+	ret = sg2042_get_pll_ctl_setting(&pctrl_table,
+					 min(req->rate, req->max_rate),
+					 req->best_parent_rate);
 	if (ret) {
 		proper_rate = 0;
 		goto out;
 	}
 
 	value = sg2042_pll_ctrl_encode(&pctrl_table);
-	proper_rate = (long)sg2042_pll_recalc_rate(value, *prate);
+	proper_rate = (long)sg2042_pll_recalc_rate(value, req->best_parent_rate);
 
 out:
-	pr_debug("--> %s: pll_round_rate: val = %ld\n",
+	pr_debug("--> %s: pll_determine_rate: val = %ld\n",
 		 clk_hw_get_name(hw), proper_rate);
-	return proper_rate;
-}
+	req->rate = proper_rate;
 
-static int sg2042_clk_pll_determine_rate(struct clk_hw *hw,
-					 struct clk_rate_request *req)
-{
-	req->rate = sg2042_clk_pll_round_rate(hw, min(req->rate, req->max_rate),
-					      &req->best_parent_rate);
-	pr_debug("--> %s: pll_determine_rate: val = %ld\n",
-		 clk_hw_get_name(hw), req->rate);
 	return 0;
 }
 
@@ -417,14 +410,13 @@ static int sg2042_clk_pll_set_rate(struct clk_hw *hw,
 
 static const struct clk_ops sg2042_clk_pll_ops = {
 	.recalc_rate = sg2042_clk_pll_recalc_rate,
-	.round_rate = sg2042_clk_pll_round_rate,
 	.determine_rate = sg2042_clk_pll_determine_rate,
 	.set_rate = sg2042_clk_pll_set_rate,
 };
 
 static const struct clk_ops sg2042_clk_pll_ro_ops = {
 	.recalc_rate = sg2042_clk_pll_recalc_rate,
-	.round_rate = sg2042_clk_pll_round_rate,
+	.determine_rate = sg2042_clk_pll_determine_rate,
 };
 
 /*

-- 
2.50.1

