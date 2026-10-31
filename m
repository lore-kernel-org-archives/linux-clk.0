Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793449251;
	b=MSDV0dAPUGjBQOdzN4HjIhdi3E+y40dOM9USGYgh4Kk8Cks4UQ8meOKfymui5mn5BskH
	 XhutofTXxhy1ecpSAYepzphgZ7trt2jKSOPLmqLT+FHi9PgnsLl+knAp1WymmhXskrszJ
	 EYaGMtUBaQFR9bTjTtkcPAJqfgX22zoCu7eANCXvZVqwNwH3fbIDS/paDfWd5EEpw48Sm
	 MRdMyLdeuCJpw8P12Uvwsez4g7GJjgmv0zLIwj0rxsbti5dBxeg7SkXXwrF0+eeZarGPR
	 M3SyDgdigLGspeaDd++t10uDyt70EmOVivvpTENx1sTjHpAuE9XQVKm/fazx5jD9tfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793449251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z/mFqmY888B/BY3z4ZVItkd6G0cdZL4x/ShWpC0Z85w=;
	b=w49Pl2ithKk24IlKtC3w5bsRxQSOu6ZW1HjucWMdCDSVe42u08QMEyVXujMY7+6C+R3E
	 D/g+1MpIwAzdKgYfIwdPQV89QVxo0cXtolApksnKcz5GfwJriN6TleY+toKG6kxWIpagR
	 JZSeGgOjAWd2wMINc1DMAA3QfsTa069bdaYB3SdDgTh7whNrKRIco/df/3Qu9SjAKImJ+
	 X9Pdp7wYwh+f/oYGVd637LKtbVdqGbzQ+5GTVO/r3b6cbtuqjG6FES3ZH7TFcVBRKyshM
	 Ok0W4WzJEk5oudqIHKRFS7mvHT6oDkb+k9TLzfsOqFQ+CT+tEVxLw8iGN9RYLR0S6fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rmnYKnba;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5694A606A31C
	for <linux-clk@vger.kernel.org>; Sat, 31 Oct 2026 12:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5694A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rmnYKnba
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a65120bf25so2556721fa.3
        for <linux-clk@vger.kernel.org>; Sat, 31 Oct 2026 05:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793449249; x=1794054049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z/mFqmY888B/BY3z4ZVItkd6G0cdZL4x/ShWpC0Z85w=;
        b=rmnYKnbarn8lvFC/p/TuYzvWN8LDg/VM3B9htlFSgSs/H1AJAU6vO4Hb2rIkxGxG1y
         nUcJQSUe01Rl0U7qP/3D4coRfr+pAPUHukRJVx80AQRYJWxVleRvZqoGaqYZyE4YfvLi
         9x0TuwNLhcsbSlC7On2oHvUsZgJXzPF6BEUNQ7xT80fP8D9RiLaDNiZU3xNGasUdRTDo
         K50eIudOE5Osnaip7uuhFnufHr8DOkBXJvi4ac0zLOSjb/4x544kbA+ecxikEcRB5ov3
         CdBu5Gd7hJwF80Ej6nISCzxrqFv0qbxKST9uSjigNFtfq2ZLvyY5cMAUExdiqHooOywe
         SjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793449249; x=1794054049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/mFqmY888B/BY3z4ZVItkd6G0cdZL4x/ShWpC0Z85w=;
        b=m2QtvCaxOD1Z7Sv0UxureoBjujMOW9Nf5m8qpL9LUDnH4qUHwgl9tABBvOCIch+X97
         p2DQTf+dxhMWODLl96foQwX+BGuaw1pUeDTj8W+aEykymd2W3F2YN41do5Kq5w5vgoB3
         FvKXFS4O24up9FE56o1YfTjg+F1/ZUEhLPQ9wazbfnP+ju8wqtiCkr+ghXMIrMiCtwZy
         v4HbhDLGXN8ToiakM6r9/RdrzcNqw9WZv2jvhX951SuO9O7CGPCOwt2dHFPHZtXTT+0z
         H7Gn+NK4VkbarVePijjVbM84PY7ELdDnCqm9unWv2rqxl51/KXq9yPosTFM1A2FWYCiB
         70sA==
X-Forwarded-Encrypted: i=1; AKwUvBy3Yvvh43v140sQwFvk5CJT3gTAMBaOalHVxIA1eUuzJBh9sU0XAhppgLVtF9ZL4XzWEmj/JI+IlbY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIndF4AxzbYxXHN6qm7Zf51Av7ZjNxAS7ob9LfMRJ9l3WuUh2Tj
	8hfxjxIugndrke3IFUZEQXPhnhSiX/7dmIP6DYjloe/aVqrWsrzdWeY2EZZmFueAA2M=
X-Gm-Gg: AYBFou3K0oV8/bn8qUFgyMabe4rO3AF4ZKkd7liAXxITmqVMcLZ55VuXucX1B4v24an
	VuLaV4wZe7Gf5GDbBPdzFpqtpLOxp+/IXIax4koDjNPnB1GfLXMIndyF3810GR+qyw8uSuKL9UZ
	SeTGQXYYRNHFq0+49UsJiI3BXyQFMdRbE60BXq+FSN7TpGaR2rEYezBncu3nq8Hlb4om1KYm+Ri
	niggyUairln6b7jPGhHKxN2LkZRr0HNxPCG9jtcpUQkizGH0sFGspViQWsc52r8T5p8rsL1xyYz
	LFNVETE2Ep3+56N+yKWR8lqH+VinZybzBn6vbSj+kyiy+YNe4y6F0OU4Y7T7LLj5LcGa74J974Z
	e4KAHqOxgOohwpjngn5cKUz++27I1maI7ZsQyF2qmWhGXW44zqrTindB2pC6i96bazuyb3dAvkI
	nomu/Ca3kWp3ng+jpc711E/Qk/kuKWcmW3CZoceuTbQHbPmzkL2YC+ju5AEDc4YOphtZQ82ij6M
	hIuKMfD/mxKjIUPekr22iQ0RS64cWCvGaFT0TvSs/wGRY/yaOFBw4mdTjzeLf90L9Ich90vj+iz
	9neUemMF+itylpR595472eQyjBBkpcpldPiUit48OY1p5krkMfSZQ//hBhuFyS/Fnys+ZA==
X-Received: by 2002:a05:651c:4353:20b0:3ab:618:fc81 with SMTP id 38308e7fff4ca-3acb7a34d8amr10639811fa.1.1793449249381;
        Sat, 31 Oct 2026 05:20:49 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbf35251sm8743311fa.37.2026.10.31.05.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:20:49 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: camcc-sm8450: Use clk_rcg2_shared_ops for RCGs
Date: Sat, 31 Oct 2026 14:20:37 +0200
Message-ID: <20261031122037.565113-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On power on a GDSC enables the RCGs within its power domain, and if an
RCG is left parented to a disabled source clock, the GDSC power on gets
stuck. After a camera clock controller RCG is used, it is left parented
to a camera PLL, which is disabled together with the RCG, this leads to
a problem that on SM8450 the TITAN_TOP GDSC can be powered on only once
after boot, and every next time its power on fails with the message:

  titan_top_gdsc status stuck at 'off'

Update all camera clock controller RCGs to use clk_rcg2_shared_ops, so
that the RCGs are parked to XO on disable, like it is done for SC7180,
SM8250, SM8550 and other camera clock controllers, see similar changes:

* e5c359f70e4b ("clk: qcom: camcc: Update the clock ops for the SC7180")
* 52b10b591f83 ("clk: qcom: camcc-sm8250: Use clk_rcg2_shared_ops for some RCGs")

Fixes: 6082037fe62e ("clk: qcom: add camera clock controller driver for SM8450 SoC")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sm8450.c | 70 ++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
index 4025db23d1a9..a5379ae21332 100644
--- a/drivers/clk/qcom/camcc-sm8450.c
+++ b/drivers/clk/qcom/camcc-sm8450.c
@@ -834,7 +834,7 @@ static struct clk_rcg2 cam_cc_bps_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -856,7 +856,7 @@ static struct clk_rcg2 cam_cc_camnoc_axi_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -877,7 +877,7 @@ static struct clk_rcg2 cam_cc_cci_0_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -892,7 +892,7 @@ static struct clk_rcg2 cam_cc_cci_1_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -914,7 +914,7 @@ static struct clk_rcg2 cam_cc_cphy_rx_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -935,7 +935,7 @@ static struct clk_rcg2 cam_cc_csi0phytimer_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -950,7 +950,7 @@ static struct clk_rcg2 cam_cc_csi1phytimer_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -965,7 +965,7 @@ static struct clk_rcg2 cam_cc_csi2phytimer_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -980,7 +980,7 @@ static struct clk_rcg2 cam_cc_csi3phytimer_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -995,7 +995,7 @@ static struct clk_rcg2 cam_cc_csi4phytimer_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1010,7 +1010,7 @@ static struct clk_rcg2 cam_cc_csi5phytimer_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1031,7 +1031,7 @@ static struct clk_rcg2 cam_cc_csid_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1055,7 +1055,7 @@ static struct clk_rcg2 cam_cc_fast_ahb_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1078,7 +1078,7 @@ static struct clk_rcg2 cam_cc_icp_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1102,7 +1102,7 @@ static struct clk_rcg2 cam_cc_ife_0_clk_src = {
 		.parent_data = cam_cc_parent_data_2,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1126,7 +1126,7 @@ static struct clk_rcg2 cam_cc_ife_1_clk_src = {
 		.parent_data = cam_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1149,7 +1149,7 @@ static struct clk_rcg2 cam_cc_ife_2_clk_src = {
 		.parent_data = cam_cc_parent_data_4,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_4),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1170,7 +1170,7 @@ static struct clk_rcg2 cam_cc_ife_lite_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1185,7 +1185,7 @@ static struct clk_rcg2 cam_cc_ife_lite_csid_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1208,7 +1208,7 @@ static struct clk_rcg2 cam_cc_ipe_nps_clk_src = {
 		.parent_data = cam_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1223,7 +1223,7 @@ static struct clk_rcg2 cam_cc_jpeg_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1245,7 +1245,7 @@ static struct clk_rcg2 cam_cc_mclk0_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1260,7 +1260,7 @@ static struct clk_rcg2 cam_cc_mclk1_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1275,7 +1275,7 @@ static struct clk_rcg2 cam_cc_mclk2_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1290,7 +1290,7 @@ static struct clk_rcg2 cam_cc_mclk3_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1305,7 +1305,7 @@ static struct clk_rcg2 cam_cc_mclk4_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1320,7 +1320,7 @@ static struct clk_rcg2 cam_cc_mclk5_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1335,7 +1335,7 @@ static struct clk_rcg2 cam_cc_mclk6_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1350,7 +1350,7 @@ static struct clk_rcg2 cam_cc_mclk7_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1373,7 +1373,7 @@ static struct clk_rcg2 cam_cc_qdss_debug_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1396,7 +1396,7 @@ static struct clk_rcg2 cam_cc_sfe_0_clk_src = {
 		.parent_data = cam_cc_parent_data_6,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_6),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1419,7 +1419,7 @@ static struct clk_rcg2 cam_cc_sfe_1_clk_src = {
 		.parent_data = cam_cc_parent_data_7,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_7),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1439,7 +1439,7 @@ static struct clk_rcg2 cam_cc_sleep_clk_src = {
 		.parent_data = cam_cc_parent_data_8,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_8),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1460,7 +1460,7 @@ static struct clk_rcg2 cam_cc_slow_ahb_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1480,7 +1480,7 @@ static struct clk_rcg2 cam_cc_xo_clk_src = {
 		.parent_data = cam_cc_parent_data_9_ao,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_9_ao),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
-- 
2.53.0

