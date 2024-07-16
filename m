Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FFC13E88B
	for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 21:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721164420; cv=none; b=seF9wy1KLVToydTPMDFF6oqYB6WBr2F6RfCdKdoycIq5bvzPi4zD3qo8dIoT7KLt/oPGSkNUMI+p8P/3d3wU4OHVMx+pMCJHdUG3ZND+fhTvXXgh9zZnkKPeFO2Zw2hFcaPpL5RaKnaX4jxutvr2g70Y0p10V0f69qyoji672Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721164420; c=relaxed/simple;
	bh=1xdmr1yatgGg/bSxXkpujHT9fyMfuqG+m6Dv29abaf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gKwQYdzITGHAAOYf51obWu/jv54vCvJbOqCby0+SJ9xU/kjF2dmCX5wwpsdH8YPf+FhLaBF8sElaBrRR+R6L0O7W2oPUjJFZU7NZ5LmFfXJ+U0FPF4sgPjLZWfUGTDyl8Sz2P+HSut+E9jFefBA+rWnxZOBnfkgbjbEtl5otdBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bEnaiROE; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bEnaiROE"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so79745751fa.3
        for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 14:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721164416; x=1721769216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbKxYxe7lubvAjjdHM0QToLaF16amC2B2aF6b5kcukU=;
        b=bEnaiROE3CPXmkjLJ72GX35xQ3kRf9PGf7g8j07fduEKPLu+d7QfH5KlvvHuJoSwts
         71vdKbILGAl9Ufdcmf5qkTYA5b5RDPB0nJHjKD+LN2Wh2wxP63L+2D7ISG/ne4Q1nVlu
         sV12RoG0xSwIwfYngee3e79cEdQNrIXdRS9qV2A96agoMb3n8z4xDAt3+fqOh7R6F8eX
         Yktu4w7UXrDv6TWV7EVylh2bLXkwmWc87pTVwd8B1aCVBbfnLMKzVVu6x2pWxiPIu/dW
         wVoo83U1wqWOaxA05ry6o4UoUAOxhSzmPwUcbSVbY+003W2fsim0RfLHANtqvb3jEhjZ
         n5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721164416; x=1721769216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbKxYxe7lubvAjjdHM0QToLaF16amC2B2aF6b5kcukU=;
        b=iV8iCa+U6uEJR+wN0Swg64kpI/4ug0d0CYscaDltfl9wt0QmJ8Dq2dUmCQsyI5STaY
         QxkOeojxDVBEoNbQNERxMzAbK+liDF/IDMt7ipfgC3X72I1E1B0cuN1rBKNW3WoKkeGK
         3l6vCZudMP/uHU0cjSVnAs3x68pnfgquAzvqqMW8F/sdqcHsJbJmPLrvVTOVjRWXGTUf
         I3CFnhKSUMzl98G7erXCkFTyq7zK0l7nIvcQKMOR7NiQQiAUCjRTZ9qnxUYWlIJoxllc
         j5Ra2o6E73nIxV4+xbuz3mV82GmGwlPxwjDFvN64B54yQQhhrmZQVPYeWuH8xSckK7Iu
         ZlTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaZ033nZmxbAuHeZWFmWwunC/gXO6+FxBqlILedUowKmWeuCX05mXqfybxbwI+tWG61gEGVln6bUmL3/j33l69illJTOZztyWm
X-Gm-Message-State: AOJu0Yy+nMcLpUX8+hsp7kqo/CscqgsYO4LjZn5zUmBOtDMiYv8KuhWX
	uaC1yL59YfWVKbkMzl32OQU7hV2liB+Y4aGijihcYsIHOXK5JT7TGMPc5T1lUSI=
X-Google-Smtp-Source: AGHT+IG7VznonBLw1UyAD3dxBgbO+ddUytugj4HLbekBrRatgjK3Wjbpd0VV0lLhFFFbLQ9Im2VTWw==
X-Received: by 2002:a05:651c:2123:b0:2ee:86c1:f743 with SMTP id 38308e7fff4ca-2eef418de46mr31325161fa.15.1721164415952;
        Tue, 16 Jul 2024 14:13:35 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee179e723sm12433871fa.24.2024.07.16.14.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 14:13:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jul 2024 00:13:32 +0300
Subject: [PATCH 5/7] clk: qcom: dispcc-sm8550: use rcg2_shared_ops for ESC
 RCGs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240717-dispcc-sm8550-fixes-v1-5-efb4d927dc9a@linaro.org>
References: <20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org>
In-Reply-To: <20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=1xdmr1yatgGg/bSxXkpujHT9fyMfuqG+m6Dv29abaf8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmluJ6h1cZUnl50Dm7I1C3867Vej1LNiWb3mBu2
 q+lHSFxC/+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZpbiegAKCRCLPIo+Aiko
 1UoJB/0b12ohLWBi4o4BbSP9xHbKo/nYH6Url2w1BoBMCljh1WR/J3TNxS0kX5W60E/LoW2CYAW
 TJAOz+akYCx0YT69J1HwWuay1oTIpNavKyDwIk2q7/Y5wqOZXZErO+RoTsYnh1fsZjjxla8HbBM
 t8eLqP2mHssqsStIV/t6hwz7KjxscnrW4bbcKEzmNV3O4oENnzurNVI0iWoAfISSJuBeCcmFpG1
 QxZci3883BsezPXWf62Puyh3wPqozyT7WOMAYkm5mP+dNbfBS6prcafzCd4R/kbHhja+dQWHReh
 BCDhQEJHcnPx8E5uJrKEJG8uqkblR6R3cw9e4Rn8kjIjsOiM
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Follow the recommendations and park disp_cc_mdss_esc[01]_clk_src to the
XO instead of disabling the clocks by using the clk_rcg2_shared_ops.

Fixes: 90114ca11476 ("clk: qcom: add SM8550 DISPCC driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8550.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index 49dff9b81fa1..a476be3403ba 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -562,7 +562,7 @@ static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -577,7 +577,7 @@ static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 

-- 
2.39.2

