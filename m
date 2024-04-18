Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DEE16078D
	for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 13:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713447703; cv=none; b=LNEIFnb/svMgUoEa3NJon74hAykayU+2yC5qm6IkCKtzw4TJ/iRiIotu+DKywbLWfd4rY4i6AuEgQzIZndlzz00TgEDC0KqVWP9QYS1X/BNBf7WrJzuCLGrG43+UNNk0QbiGZxWbW0SPocgrrRBat90XkYd66fxfyBSh5xQIJ8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713447703; c=relaxed/simple;
	bh=8MzW49dMcgqrWLiS7mwIpQOpeo1dbVcEjhaJQWBw44Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=b0R1Pl3nztHBQnUNdMd/9zEgl6fqpclquo7vhPqblQzvsoNzjvSqN38XKN91gjbBNP0bfNUOQLddzMc2NTbh1ECSbGS+T0nZv9i3ZlbfAFoLaGdyY7dYOG1Bz5TACoBBmOuqpouoE3DSwrrdL56q1dVjAi10WJQJtCXv239JZ94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xlJnhtHj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xlJnhtHj"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-418f1d77adaso2982985e9.2
        for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 06:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713447699; x=1714052499; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8Q8PkKj9VfKJC1mpdjogpO5/6dV0GWIjsKclaHyBuY=;
        b=xlJnhtHja0Dclh8taVACp9PDwUc0/kUUiCKi3YaA6+zI5SCZYOHP+iLHmyLiyucS/U
         fChC2MrxKZOGwjyAoIZtaRMcsuweoPcEgE6t6RA/PRsGYY5me49gSEgPbgZLcSrQciFn
         muEUAwVQ7XKDmES9E3BfM3DXNfWlokYd/lpMM3VLebErXpd3QXW+s7yQXtST70f3Htxv
         EFhUIrsKA3leJlI7LHccQ/bGnnHyJs+ZMJLZrgHWc/4/AudJ8FksehC7JjGDaPXUxqRC
         qGHiODxKZEl7R/NsvxBPa1dDj1X+tgpsUMm5opcq5qSDd0MutLS3wA/1blWUNMD/YE+J
         OoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713447699; x=1714052499;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z8Q8PkKj9VfKJC1mpdjogpO5/6dV0GWIjsKclaHyBuY=;
        b=ftcIJTzq1Aq5qZHRGCbZ36TqgCRMo8pJsHzUBVyhHBP9lOuJFoJLZtOaeVYEgDOltc
         kPX0/UTXKZbDZA0EmTYihUoz9vay5Y7lRaZC063DDyQE/nP83/oXraXlaedJ2lPCu/Qy
         w4m6BZ9o1vE04F7PVKU4cZNDIuPa7GP7YMuYn4mZ2XxIoUxYV3/FRoIt7aVOrcWP/lrO
         EHu9hJVWjKnpsEV6qYCKXMr5Kg8l9oiEmwFc8+YNGQWfsfpa7NTrR+YVT0n1F1/zNgYJ
         IsOaoshLPB3+Ecazg52IEll5oqSSxwsqb7dPCb3ODkceE96veB6BPPD6O+q1KYJB2Fek
         6mBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9skmwfJbzOuNXmjpPW+bnJdnj9xdQssRAsgJKDjzSEt+h0mVd2CSZofKUIPdzuifW9fVHQYQgCQH2q6KB2yAgKxFZqvwD++Np
X-Gm-Message-State: AOJu0Yzcmc7H8nN73bqYvZyDEqpXwGNNgLW5tJnxipcuwor8DOzzqw2d
	hjXOz89bdBT5M6OAeRj9DaBmeSwXXYMQf+K5vtK/ladogrmKyt1szzmO+t6IeqxlvEDh5DGog+S
	f
X-Google-Smtp-Source: AGHT+IFihOygOq+RuFRNYpUjc3dh2ppGPOrymInr2wa7gdeDSW8Z2jhCCG4NPFX9yOx59qxtCJF4vw==
X-Received: by 2002:adf:f107:0:b0:346:d7d9:83ae with SMTP id r7-20020adff107000000b00346d7d983aemr1974699wro.52.1713447699420;
        Thu, 18 Apr 2024 06:41:39 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.100.236])
        by smtp.gmail.com with ESMTPSA id bi18-20020a05600c3d9200b00418d5b16fa2sm3540809wmb.30.2024.04.18.06.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 06:41:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 18 Apr 2024 16:41:32 +0300
Subject: [PATCH] clk: qcom: clk-alpha-pll: Skip reconfiguring the running
 Lucid Evo
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240418-clk-qcom-lucid-evo-skip-configuring-enabled-v1-1-caede5f1c7a3@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAwjIWYC/x3NQQqDMBBA0avIrDuQWEukVyldmMmYDqYTm6AUx
 Ls3dPk2/x9QuQhXuHcHFN6lStYGe+mAXpNGRgnN0Jt+MIMdkdKCH8pvTBtJQN4z1kVWpKyzxK2
 IRmSdfOKAzlrv2I3XmzfQimvhWb7/2+N5nj/6GHCzfQAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1399; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=8MzW49dMcgqrWLiS7mwIpQOpeo1dbVcEjhaJQWBw44Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmISMNHLTmgu0xX/TL+OLtu5GJXEUyNoWCimTfq
 tbNZOviUHSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZiEjDQAKCRAbX0TJAJUV
 VtJ/EADLoUXsaikbAsY4EWLnvAbdfIRHcu6YkRARES1bYuTmIw4WTNqpe66miuk4dFMkrJ6b8Rm
 D+/b1TLzpzS5Ua9w16t+EHDIoPIdOK6OZeECopbWIY+Qz7sRmlXe6Xk5n+0Wh5KEjulOfb/vlR0
 +PuepWRH3+lxr/ctyWZ1GgEVncjMgwLhqxQbn1FDYLJRF4tLj/KwsEfM4DZwMc0BIsmTMhR9px2
 inQ+2Y4/krMtEHAYTxk12bnp5xoxVQ9SgMol4oE9flajb+SJiTTuBe7/VUZPYgrYOn65QK/uKcZ
 pQPHcYXA5O4W5VZvcnTXdEDEe9kcSAcElJ5bAdA6Cag25ODSM22CQQ+KjGd/AHzbUY4dmLZIDUd
 YxvXarxk+QofUBiVRBH3gXs6eNI4VGyqePJm5rC0lO4A9hj8eM3r9mR5DtLzXPx/haOEyTywkcI
 p9mUNg/l7SNryQEg9QtQDT3YiTnB+Ow2lCPaN9Hdl25eA9JTNuvNxu3cqqy/ql6nM4Qjt1JJooX
 GgxNydIWFJ8h0UxXVj9lFBSivfFtPPoVbQwDHU/SY9K7D8HoQsXQdne576yzco2rQRe/79b/W3B
 kDQhsoBseoMwGJp2NKcL7xzJCCoXqvyIhUmQj4IoVZBOCdkjwJWT4HWZvZmj3q1el5ZxwTIhM7U
 uNCOFy+AC2ZxZCQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The PLL0 is configured by the bootlader and is the parent of the
mdp_clk_src. The Trion implementation of the configure function is
already skipping this step if the PLL is enabled, so lets extend the
same behavior to Lucid Evo variant.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 8a412ef47e16..4c5aeccff0ef 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2114,6 +2114,15 @@ void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 {
 	u32 lval = config->l;
 
+	/*
+	 * If the bootloader left the PLL enabled it's likely that there are
+	 * RCGs that will lock up if we disable the PLL below.
+	 */
+	if (trion_pll_is_enabled(pll, regmap)) {
+		pr_debug("Lucid Evo PLL is already enabled, skipping configuration\n");
+		return;
+	}
+
 	lval |= TRION_PLL_CAL_VAL << LUCID_EVO_PLL_CAL_L_VAL_SHIFT;
 	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), lval);
 	clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);

---
base-commit: 4eab358930711bbeb85bf5ee267d0d42d3394c2c
change-id: 20240418-clk-qcom-lucid-evo-skip-configuring-enabled-711b7e7835b0

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

