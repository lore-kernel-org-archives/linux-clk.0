Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476CD382394
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 15:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350178; cv=none; b=nIUPQwpPcpXgXt6NgSBXiQ/bK0msqakifDLDultqbGA3K5PAAX5mjpULecMb7BhNumLzwLlDEGkpDQiZn5u52ZLeVz02ecDOa2sjiqijFYoxVFB4HXQ8igV9LM+caIOoDhxKQhwAYEhw3X8BLmqinBww/zIUS/heRLwOf2MUSkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350178; c=relaxed/simple;
	bh=KiBkxRgwe5uqVd9oP/NxWN1PgYVqhA9/vY7MLiBeofQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A0tjYqdb/OLzYYqyaZrPNWHMY7WxWRPiZ89LfASHrc3OqS5fcat9gdYiM/pvG9WEyELh8h4yJ4Y5qf8/2amgCFanj14EOKtTVyaTaeluw4i9zt2QuNe3U2A+MhamLkghrvS9pQAp42YzttqIoihx5o23KQuctBdKx6YVFXlej2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fPKVQ55I; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fPKVQ55I"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493c1950518so20838385e9.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 08:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350174; x=1783954974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34ufVHQVHmP2A96Pdlkv6BGppMJmajk0L1f8lEgp9Z0=;
        b=fPKVQ55IaLlvkEvOftMPI3a9GkxbSLZtH2HgV+o9Mhen8BzXjHXmAw2oP5KDAPJARJ
         2I0H+/Si5XfqAqGMFNueOB18TBL4Lok0Ykz4Ey8HBC1KijcWxyzcNhX+suLh1oRlP7zb
         cI0Lq8opZY1sKFlyuOcNNUtsXgiu5X80wINCWsI3WRPdJFXRWAXL71qkRXnYJhdAI+LO
         GqBVGyCvCpkcdPgCH8u5I+7MFs4PK6cxuJCEYRbrJY+bXPpG5aZggFeP7PcmksB/JkCV
         PhphJ+Polm3mUwQvBZWlfKf0hBu9UGTaFkJAo1K24bprYHi6rOaLW0r6hy3AMm+Unaei
         1Dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350174; x=1783954974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=34ufVHQVHmP2A96Pdlkv6BGppMJmajk0L1f8lEgp9Z0=;
        b=I7wlinGS9b7+FXH95CtRY2YlTqGuoCI7YC8zGxM+VTosOgvoZxE7MTVauhy9XePGLT
         UXIHLQcZCAVBWmzb26MNI4fLsrwupzMoP2mq7blrQA6edh5ynHoxdKcvsK4Ap8kyhGVa
         ApzKmNsm1OVTQGh45qP/1k34ic3XeDAZCQ/6v2ojwrE4MWS9tHF14ZNyJMMKpZexL4Tc
         1BO2rWDyausBfNY0uBsrKsE3oRj/UBBbd4lQO0KlXMuh+IGXOMY+NQE3BKZ+SA4pBLJW
         dNcqtztBMdyHlPgX+UhLbgDFVo2NBKiOdnW2Q0a9rStr4wx0X5NSEaTYJqnS7Asd08vC
         7g2w==
X-Forwarded-Encrypted: i=1; AHgh+RqrQWUwtjFI1RBILjzaGS/Y07WXI2TOUff+sANd5o2JPNJK7NDCP/n7HJ7QOhPB1W0MxfmMRvq1mdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqjJHOayZvz/JYbEGCQqrCjx2KSG7ECHoRn1yhUnpjBQAFKfgT
	iMMAwkbputjxpmIFKDMZg2XBFNfubTPPQz3YvPLtMkqB+bko7q7D8JlfSugIkdN4E40=
X-Gm-Gg: AfdE7ckyMc2EonwI311rmZN/o7drSyS6vyHCakWsJCXspcqV40dX+NrIlIHCJEcnVIJ
	DP9ESHKI2hikBBFE28wFU0VHw0xqj6GMZOCWEilD+9gKsWsoTP+djh7P0EP0xfUx7rosppnga5J
	kzHhg/cOzfZepve4B9XcyVH9OO77YP97TBqlVhRdefV9m73f+TcpMd7EE/3jIL2atvNx73lsQ/e
	Rik6bperYBij3b70HFEdqpOz0JbhNVvqrBwZadBJG9GpnZPS8SLWHi7xqCRtDsf93QEfkUcU9V+
	6QgOM0bxIB78Ay7AZZkfPQg+sT260oXhVzVwalahS+0xnAhP6Qg729Ki6YM0BGrAZRxH3CSrgiC
	WuHYGnM86ZIyVqEHVNZRZqjthn4w2Un1OtLfwxEQ2Yb+lp27M/TpFws/UXL8OLuXY1wHJQw2y2+
	aq1FCBzsY7wiJV3tqYAfcXNYLXcg==
X-Received: by 2002:a05:600c:4e56:b0:492:7025:13fd with SMTP id 5b1f17b1804b1-493deb5de6amr13426545e9.0.1783350174534;
        Mon, 06 Jul 2026 08:02:54 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:54 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:10 +0200
Subject: [PATCH v2 03/12] clk: qcom: gcc-mdm9607: Fix enable_reg for
 gcc_blsp1_sleep_clk
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-3-745565101869@linaro.org>
References: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
In-Reply-To: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2

From: Stephan Gerhold <stephan@gerhold.net>

MDM9607 is similar to MSM8909, where the GCC_BLSP1_SLEEP_CBCR register is
read-only and only has the CLK_OFF bit to check if the clock is running.
This is a shared vote clock, the correct way to enable it is to vote for
BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 07f1b78d737a..499e0fbbfab9 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -790,9 +790,10 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
 
 static struct clk_branch gcc_blsp1_sleep_clk = {
 	.halt_reg = 0x1004,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
-		.enable_reg = 0x1004,
-		.enable_mask = BIT(0),
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_sleep_clk",
 			.parent_data = &(const struct clk_parent_data){

-- 
2.54.0

