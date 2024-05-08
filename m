Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24063F8F0
	for <linux-clk@vger.kernel.org>; Wed,  8 May 2024 08:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715155984; cv=none; b=UrTyiFZfur9iPpgfXYOSatGzpqXm8EVGwMe0m17y3/2hbYajFIZDM8OnOFUREe1u8iOe1bRLOW9DQ+ZQal1bMkTNR967LKoNJuT2GxEothyfv72L54b8/7uJnsczUJa3XJvo7rpxcD8BbhK4KHeKFmk2efQHptlzoln8/vlUW28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715155984; c=relaxed/simple;
	bh=WCkwErRZyljeBlt1Jr4HGlQt0q1XbGKrsEZ1B7EBZFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NF9bALSw1v/BENjZbwgD/u2xy6m7s2MI+q2qBDgesChTA/VN6PdhsEBuAYtkQRRqadCpDEBGYvEsps8oahtJqmRfGjVrmWtSKQcbYj05q3BDeZYIfrOFP9fMr81nVxTHzlNsoO+Y0KB8VPmd27l/FnoI/OjLRzY4vpneAUC5Vvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cEA/h3vI; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cEA/h3vI"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a59c0a6415fso923172766b.1
        for <linux-clk@vger.kernel.org>; Wed, 08 May 2024 01:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1715155980; x=1715760780; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zvfcVwr/mFxjXcj1cizgE4k3o6ft2+QQYHhXo8/rWmY=;
        b=cEA/h3vI/hTTG+MzwkWlnu+8LYsW0nfm1/BYamUIDjWKHn2/pv8umAD7a4TIYre3i1
         YMqxr+YQ5mNrgovv9YD+cGE8ggr8lSU/l1Dw00Ed2kdshNmfFNlDDUvkgzZQmFs0qiLJ
         hsLmObwLW9C/pdM7wNkIkQlvqsXG/xzYPFTTn+lqk2XlG24DRXC3BQkM1JVqMp3U1HtJ
         ya1lnxM1W3KcxbqYNUbjBizCh/2GVKhpiJcz0B5zsBIDrNsMdvJlNM63NWOmCtPb3VvC
         Lw5Gaz1cKWr7CDJqDM8C4O6QTm0SVHnyagSZwKYFNho0Fnd8kj38nMkCjuzsrRPmrQdC
         y5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715155980; x=1715760780;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zvfcVwr/mFxjXcj1cizgE4k3o6ft2+QQYHhXo8/rWmY=;
        b=eIW5ptSXKlz39Gwxuo6XEgx5iecNPB5Lm9hpkoqYCb+mUVwmnuLbSTbbs/xJ/74G8f
         qC/sn+qPLxzyBpaPzOp6wuKg6GwFzKuAaQT8E/n+Ynv7JF5TopxvKCCuL5Zn455FQwxF
         y/laMW3awrYxY0ehoyAJ24qnv9TgQ2vdd2PlsMBJba7RxgJm1xhGEN7FiyiVXGZgqurq
         IgYLDhCAnE+Wk2fIU+wNPaNq0i+++NSyfbx8wB6LjYWROaq4up7TEXOikOwdopv1JJSm
         IBsodpc0EuNYMpQo7LrsjOl6Mwp1yC7zKzeffi9C6xU9X+peedWR8H/lW0la5hi3/B/f
         Lp/w==
X-Forwarded-Encrypted: i=1; AJvYcCWUd3o5RlAIToeLWoNIMaq3l5uN2NdobjwOM3+sO87Vhaje6T2YNz3UFclbp/UNTym7Bao91QwrjNJBROtzH0/73r4N3SjokSAT
X-Gm-Message-State: AOJu0YzWkG7fvKW3IH7jq+rnYSBEEFw9ELmyKjPCR6zTWiz76o4x4LSD
	cnpPCVjWP8TY+aL4dnJcHLoEei7uH2lBSv+8jHf9A3rYKZHaLH9qptMhe5eUpTA=
X-Google-Smtp-Source: AGHT+IH5ZChJ+ZUtI8nQH6jVQm9JoEHn3A4cazCjqHGPJIzlcyPwhNOYnmGRrzKtCq/qXBFOO8Pi4w==
X-Received: by 2002:a17:906:e24c:b0:a59:c52b:993d with SMTP id a640c23a62f3a-a59fb94b612mr103226666b.20.1715155979987;
        Wed, 08 May 2024 01:12:59 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id h8-20020a17090634c800b00a59b8e16ac7sm4507713ejb.36.2024.05.08.01.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 01:12:59 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 08 May 2024 10:12:53 +0200
Subject: [PATCH] clk: qcom: gcc-sm6350: Fix gpll6* & gpll7 parents
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240508-sm6350-gpll-fix-v1-1-e4ea34284a6d@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAQ0O2YC/x2MSQqAMAwAvyI5G4imSvUr4sEl1oAbLYhQ/LvF4
 wzMRAjiVQK0WQQvtwY9jwRFnsG0DocT1DkxlFQaqshi2GuuCN21bbjogwOTHUdu2LCBVF1ekv6
 PXf++H59gmuphAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0

Both gpll6 and gpll7 are parented to CXO at 19.2 MHz and not to GPLL0
which runs at 600 MHz. Also gpll6_out_even should have the parent gpll6
and not gpll0.

Adjust the parents of these clocks to make Linux report the correct rate
and not absurd numbers like gpll7 at ~25 GHz or gpll6 at 24 GHz.

Corrected rates are the following:

  gpll7              807999902 Hz
  gpll6              768000000 Hz
     gpll6_out_even  384000000 Hz
  gpll0              600000000 Hz
     gpll0_out_odd   200000000 Hz
     gpll0_out_even  300000000 Hz

And because gpll6 is the parent of gcc_sdcc2_apps_clk_src (at 202 MHz)
that clock also reports the correct rate now and avoids this warning:

  [    5.984062] mmc0: Card appears overclocked; req 202000000 Hz, actual 6312499237 Hz

Fixes: 131abae905df ("clk: qcom: Add SM6350 GCC driver")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/gcc-sm6350.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
index cf4a7b6e0b23..0559a33faf00 100644
--- a/drivers/clk/qcom/gcc-sm6350.c
+++ b/drivers/clk/qcom/gcc-sm6350.c
@@ -100,8 +100,8 @@ static struct clk_alpha_pll gpll6 = {
 		.enable_mask = BIT(6),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll6",
-			.parent_hws = (const struct clk_hw*[]){
-				&gpll0.clkr.hw,
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
 			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_fixed_fabia_ops,
@@ -124,7 +124,7 @@ static struct clk_alpha_pll_postdiv gpll6_out_even = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll6_out_even",
 		.parent_hws = (const struct clk_hw*[]){
-			&gpll0.clkr.hw,
+			&gpll6.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
@@ -139,8 +139,8 @@ static struct clk_alpha_pll gpll7 = {
 		.enable_mask = BIT(7),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll7",
-			.parent_hws = (const struct clk_hw*[]){
-				&gpll0.clkr.hw,
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
 			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_fixed_fabia_ops,

---
base-commit: dd5a440a31fae6e459c0d6271dddd62825505361
change-id: 20240508-sm6350-gpll-fix-a308bb393434

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

