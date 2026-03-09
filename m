Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FDB3D6694
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 14:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067190; cv=none; b=I+a+43u5uMxzH/rE2l54ZSHAybbF1zYU4+WSCHvrJOfUBqB/xTO7c8oq+abmE5eK7g3uxAAhA+2Cez9oceDbToA+UZ7lQi9xVpx850sezuRx2G0s89jSuB4DuRVCvLJFWX1RXwUaoWiHd6OaMJ3BVljJu/+JirRwwGXY0Kb3AF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067190; c=relaxed/simple;
	bh=AfEZfqh1V0t+rt0dmTRJcPIGeDmqixXE2Caq7Fy3w7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AwtQeq9xqW1nQueMIk7XxUibsPF3tDYvu0JvkPFWw0l7yy99hYFiPEZEEz0FBGHyUdum/hdqR1BWq1KO6J971u01bUue7YJ1H3HIJRq5Z/NaHNyMQU6rR4SQjUwvNUELGLNu2d/h5ahz3bKDpGpHyKZU9415TA9QZi9jlqrXxgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AVz/YUXS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bgLCwjN9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AVz/YUXS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bgLCwjN9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BSC76DdZcmGTKEKzvuRw2/Klyw70AVZ8QD1QgQnIJw4=;
	b=AVz/YUXSlXsQdlTkC8J+KronND/Kax1JCpanOlbpSLmf/ZriryfcXvbF/Vl7+4wyP4euQA
	MqUqGNp+8DgnZ3WWDdGeB2WQI2Lxlu7NR/G1QYlj8mO+/6PQZhLUYU8+eo7+FxlM3nprOM
	mNGsKz0TwYODDg3U2sardWGTQh0PIQg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-f77s-oYqPtCZdxhutiLRIA-1; Mon, 09 Mar 2026 10:39:42 -0400
X-MC-Unique: f77s-oYqPtCZdxhutiLRIA-1
X-Mimecast-MFC-AGG-ID: f77s-oYqPtCZdxhutiLRIA_1773067182
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7d66afceso1042950885a.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 07:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773067182; x=1773671982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSC76DdZcmGTKEKzvuRw2/Klyw70AVZ8QD1QgQnIJw4=;
        b=bgLCwjN9yp3KUnIXoVeXQSw1Om9tQuZu+yHIC3++4WMh+uM2TuZJeG1NF7Xtzo4ytH
         N7nfPbllXeCxquOscecdjU+idpkBaXteStynYKthijWLrHmGZixVK6PPL7gMceqMnX0w
         qyhlRI+j7bSf9GSPZKgD84YW2+nppJLFnjcC0QoDMN88SP6oEjisjaIjNx0N+o9+sT6h
         Y92msHR9g4i7v+wEUNqgHhUeXxXTAslzjTG6mKCa2CjgiS/wMpOMBB+h+Uu92Co8trAL
         a4oXMf9sujK3/I1megMc922AtWDrb+YIRZuMvf6pDm+/pCRl3CYFehKqkOLK2Au1HO1f
         d0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067182; x=1773671982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BSC76DdZcmGTKEKzvuRw2/Klyw70AVZ8QD1QgQnIJw4=;
        b=Nywyuk0ju/pF1nwmARQqOZ00Ew2LIOwPHwJV5fNJO56qyBM6VuCmLLq8Yr/VI35n8M
         Ghc3p8kEE0Vhly40KZerJCrw99t5GgBSNHU83CqEgIliNTwDiWtM4u0QETHaEZaNPG22
         y5hWx3TDL95j9LIwcpIaXwROYN4/P5favx6rd22KSQvfwZ5cJllji3qMfSr5FjxfgDnX
         hHRimSUPRyW2lnCULHMmAQAUfy/DnxGDH8ydjSpnLsDgh233tpNl+Q1jMcqmTk6nQkiH
         MKHRMUg5pb8daAY2MT7B13E2CM2hE+JaugJpKlSw1Rz/rH3Zi5Oh5pNdmPg2i17zO8Ax
         KKRg==
X-Gm-Message-State: AOJu0YwGJTLgUUfkZxH4FgWenXwrRg8N5hElKZ+PCvwS23Txs6W1eVob
	rMHQrc2yZByUcBlpV/XfHYeIBeQdBVymrJ/YqjZogYzcPWSzcaZvW3GoPUlliBDvNb6GHLXLmCn
	T645MpNOukCR9rY6bPhAOQ+HbkFMmbpYK1e16OAkB3pB5jbk63+nzEQtKerqV5Q==
X-Gm-Gg: ATEYQzy9LnTcoK94yrDOjFFUcOxNVWUddx2ZBEsjNhZ96o2eNpiPNyOinxUOq1Rtz1j
	eAZfb0NvzDvv9GQk3Fk+i2GQkToUekTMZaJG/pTP9V1C7ZlICykhZMObxlEgI36T0l/1rBTpicg
	8DkMIAtRjxvrhHEW/89WqoT3e4ygeXgnLEiBntcUcu+caz54f63yDn/XuMObb2ju/Im0K5Herao
	6Mwba38oUY8wwLimY9kmkPEwaTI1DbGvb55qyavw1mZZYi2LNMN0PKxOCHxWck2UEsoVHyUvAez
	vl427UXi5VNhreqMpQaE89V71ztOujK3RmoBp3vbDjUexfakOVPiuGM3ohsseGYXjWGlRzUAKjt
	TFnt20QmHZ/yVugbAZD62VobzMabH405A/eDzTvjX+Tp99364l5gCdxCUYT/v7A==
X-Received: by 2002:a05:620a:459f:b0:8cd:9231:8b51 with SMTP id af79cd13be357-8cd923192famr115581385a.5.1773067182214;
        Mon, 09 Mar 2026 07:39:42 -0700 (PDT)
X-Received: by 2002:a05:620a:459f:b0:8cd:9231:8b51 with SMTP id af79cd13be357-8cd923192famr115577985a.5.1773067181776;
        Mon, 09 Mar 2026 07:39:41 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm756064985a.16.2026.03.09.07.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:39:41 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 09 Mar 2026 10:38:50 -0400
Subject: [PATCH v2 11/12] clk: samsung: acpm: drop determine_rate op and
 use CLK_ROUNDING_NOOP flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-clk-det-rate-fw-managed-v2-11-c48ef5a3100a@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2150; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=AfEZfqh1V0t+rt0dmTRJcPIGeDmqixXE2Caq7Fy3w7c=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLX3Z7c7Nf0ONFpyx9lJY+0jkclwRkHZ+cGvvr85rvC0
 3ubLMuUOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjI7mpGhsm/z/lfT91dr3b1
 3w6ub5rvrv75Ez9l1fvuvtxKZmFPs0ZGhkaWLf8fm1zpuPSyxDdI+5GWYY8W5+8j4T7KQRFnaxP
 eswAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_NOOP flag.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: Chanwoo Choi <cw00.choi@samsung.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org
---
 drivers/clk/samsung/clk-acpm.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
index b90809ce3f882c489114c9d7299417d7fe373749..b79d973eaa0c275c508a51926ecde5349f00feba 100644
--- a/drivers/clk/samsung/clk-acpm.c
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -72,18 +72,6 @@ static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
 					clk->mbox_chan_id, clk->id);
 }
 
-static int acpm_clk_determine_rate(struct clk_hw *hw,
-				   struct clk_rate_request *req)
-{
-	/*
-	 * We can't figure out what rate it will be, so just return the
-	 * rate back to the caller. acpm_clk_recalc_rate() will be called
-	 * after the rate is set and we'll know what rate the clock is
-	 * running at then.
-	 */
-	return 0;
-}
-
 static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 			     unsigned long parent_rate)
 {
@@ -95,7 +83,6 @@ static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops acpm_clk_ops = {
 	.recalc_rate = acpm_clk_recalc_rate,
-	.determine_rate = acpm_clk_determine_rate,
 	.set_rate = acpm_clk_set_rate,
 };
 
@@ -106,6 +93,7 @@ static int acpm_clk_register(struct device *dev, struct acpm_clk *aclk,
 
 	init.name = name;
 	init.ops = &acpm_clk_ops;
+	init.flags = CLK_ROUNDING_NOOP;
 	aclk->hw.init = &init;
 
 	return devm_clk_hw_register(dev, &aclk->hw);

-- 
2.53.0

