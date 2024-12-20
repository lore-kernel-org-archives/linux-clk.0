Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CBA1A8404
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 09:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734685430; cv=none; b=mDfAm0xGveIroITvJklhHZ7QDqzDd6y0b4O1Ng07d+puWu3a1GsV4QJzFCBmao7rXcsYABPGGW8RHkEQdbOkcPzW4YM1s0zcct8IYFphCN0l99Ki8NBovob5uBO1qzjcArQHQMZYXPnBV/wgeSQgS/agCjETJHoBfFcHWziPq2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734685430; c=relaxed/simple;
	bh=sYfJ8wnk7ijxOCPLQlV1R18oROlrwY0cZtyJnzBm9UA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TvSHU3OTyZMWdy9I+gKiHY/vV5vOqtbZcKp5fG3bxAW0395Y13M6QIlZz4SqbgDsXItTBgMaYfxZ0Lf4EUIlnhNz9hSxLubCduQbEvxvBvYX//EFhiZJXlz9iRDzHYVWVZSR/kkBtjrZrpADVZ/Z33ZwACQiGU6hEfu1wds9h8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=46Dm2X6z; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="46Dm2X6z"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43618283dedso15927655e9.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 01:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1734685427; x=1735290227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qTCVs5hxfcVP47+ZWc/YNDn2g1Drj1Yq7gW/RQstCeY=;
        b=46Dm2X6zMEwBR1jAcACns7FPs83thyYHMYhfvg9jmPQ7R4FYcAaAhMYHdo7TMUmAZ8
         oDHiGQ+fUJlo2lodqLX8sgv+1jP0xof2QhzVTAI0ReguUACnPoUJOEnzFAmPlxakkXGK
         K1o+fx9xFQBWBTzcTqfTccatBYc2gvakRTeIRguVHkQpz76sIlPlS5jPZmbCjfVGTjoO
         wkw3mDSjV5JKKDDeeTg37wzkzbSwTd6I4a6vDiDgC0iaxrp41H2doGWtA2jWPNuqhEUQ
         JMePRl7hhX1Appl3PKDTU2pvP9hFQBqX+zX7zhaod/HGNp6q2BHTAsZB6l75Pk073eUb
         ztHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734685427; x=1735290227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTCVs5hxfcVP47+ZWc/YNDn2g1Drj1Yq7gW/RQstCeY=;
        b=cDY3NLO+xxjNw6mIQijLRSyNIf/VQeHxdIvrgZZZnvLkrIk0Wd5y4QVJm8RPho0qXj
         NNIkSGhVwezFC2xdQVqSVNN2bAUBj0YBaTvISpBU78wPt3tihONVfXjd7hKmGUG1ZRQk
         0iGVWqo7VJC3nCoOtJPy4TuiCoioOT6BuYoWSpsoqnuV5Zw02FM0dDDpBd5/e0C3NgF0
         0kWybt+4TSwRXsHeR3KoM7gR8YYEbtQ/QwO98dwFMRGL2vCAJZLkDi9VBRzgQgHKQs9E
         z3vj2s7eUWy0/WYGLjQWrQ63P3tx3xRG1fPdGGbPUhlk22SwRBR2r3qyp0ZoXM3AET6c
         sn3w==
X-Forwarded-Encrypted: i=1; AJvYcCUpNocdmjCohFWPXR1bHc21onSUY7v1UQt9uu51k0tkQdUM2xfteid0iDltyAr5bNEqLvFT3kJ1Gk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFkBP5kDi1PK4fajm7dyp2Cs5n5enL54r8v6/jVcg5nGzxmcEA
	P813gmBjbkO9mp+uoYJOerTiBtbypqvwt1BkvojetNIoN5FH2Xv/Enm70tjIEq0=
X-Gm-Gg: ASbGnct/u5kaGBt8qBNPDxH7QXeipMGZDhVJaVmKV85CunfSdoIl+4a5bpkA/3gCLlT
	urNx+zK+gMjqO7h+5Zj1U0Yxlf+KalKy1a0PC+DkwW9o093QzYyvdfm9Eh+Ap6Ufom4wC79bXhC
	P2DsntmsNEwKjTaSXiefZ+nagPunDGqoi19kvZt0eFzz7ZRZtTodVijif1U3Qo3UIoYOXOUimA3
	iO7/2/xpxqFyuw4VJvy8tbGkHrXk8j745NooTFpUKOciuF75PIPfA12SrpV+4UC3ybqQNJtBxS5
	+NN5rtf67OKXp/qZkN+UgtLtLwTLUg==
X-Google-Smtp-Source: AGHT+IGHpITziEb0AqGEPqXQ3d/Kd1ljvCdDAf6rDGr2ZBgcyCuqixvJ/Icbd0mED7HVr/rTukylng==
X-Received: by 2002:a7b:c3c7:0:b0:434:a90b:94fe with SMTP id 5b1f17b1804b1-4366fb89a04mr358955e9.10.1734685426814;
        Fri, 20 Dec 2024 01:03:46 -0800 (PST)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea3e0sm40610375e9.7.2024.12.20.01.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 01:03:46 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Dec 2024 10:03:31 +0100
Subject: [PATCH 2/2] clk: qcom: dispcc-sm6350: Add missing parent_map for a
 clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-sm6350-parent_map-v1-2-64f3d04cb2eb@fairphone.com>
References: <20241220-sm6350-parent_map-v1-0-64f3d04cb2eb@fairphone.com>
In-Reply-To: <20241220-sm6350-parent_map-v1-0-64f3d04cb2eb@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

If a clk_rcg2 has a parent, it should also have parent_map defined,
otherwise we'll get a NULL pointer dereference when calling clk_set_rate
like the following:

  [    3.388105] Call trace:
  [    3.390664]  qcom_find_src_index+0x3c/0x70 (P)
  [    3.395301]  qcom_find_src_index+0x1c/0x70 (L)
  [    3.399934]  _freq_tbl_determine_rate+0x48/0x100
  [    3.404753]  clk_rcg2_determine_rate+0x1c/0x28
  [    3.409387]  clk_core_determine_round_nolock+0x58/0xe4
  [    3.421414]  clk_core_round_rate_nolock+0x48/0xfc
  [    3.432974]  clk_core_round_rate_nolock+0xd0/0xfc
  [    3.444483]  clk_core_set_rate_nolock+0x8c/0x300
  [    3.455886]  clk_set_rate+0x38/0x14c

Add the parent_map property for the clock where it's missing and also
un-inline the parent_data as well to keep the matching parent_map and
parent_data together.

Fixes: 837519775f1d ("clk: qcom: Add display clock controller driver for SM6350")
Cc: <stable@vger.kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/dispcc-sm6350.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm6350.c b/drivers/clk/qcom/dispcc-sm6350.c
index 50facb36701af99923584f1ca1549df6a70f06d9..2bc6b5f99f5725bf56c63623c3d5c16c25879d9e 100644
--- a/drivers/clk/qcom/dispcc-sm6350.c
+++ b/drivers/clk/qcom/dispcc-sm6350.c
@@ -187,13 +187,12 @@ static struct clk_rcg2 disp_cc_mdss_dp_aux_clk_src = {
 	.cmd_rcgr = 0x1144,
 	.mnd_width = 0,
 	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_6,
 	.freq_tbl = ftbl_disp_cc_mdss_dp_aux_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_aux_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.fw_name = "bi_tcxo",
-		},
-		.num_parents = 1,
+		.parent_data = disp_cc_parent_data_6,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
 		.ops = &clk_rcg2_ops,
 	},
 };

-- 
2.47.1

