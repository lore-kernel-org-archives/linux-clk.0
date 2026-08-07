Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2244B45FFA4
	for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2026 07:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088781; cv=none; b=rMmVYxA/6Ett3YREgd65dVkcnRJ3BP5g+M4I80DCByTZ5QdgeOs8PU1xxJ9TeKqF3n7DLa1WsQyomiJPLTZt5y40WNIXKHcm8aJvjJ9MJC46hOurOmoCrVoUhmLEy4yIK1QrH0OGt76/sSc7CM/f7fd0aeBKmXYOVeY0TnEoPrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088781; c=relaxed/simple;
	bh=xuFI5Q5PVaGG13a653oWxSPz1g51NAalhPKeOlwyekI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LTtiOHTtJ5MdR4rTIlikErnSTou1HFqT9L1DT70U2Q2wBRRFMs7EnmUzLEeQJ7C9YKTt0JePIZYfgSFKQFgA7un4s+NDnJ/QgF49BUm21o1Z0qSB7t5u0lAgn65fjegX3EUk/s8qsEbNMmoMUZ5SNo/TP3dRQLN2JbAY9uk0xtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=c2u3/zxz; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="c2u3/zxz"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a097f5ab95so4900867a12.2
        for <linux-clk@vger.kernel.org>; Fri, 07 Aug 2026 00:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1786088777; x=1786693577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hUQBHJUBPKqNKadVj/rfrpbmjDMRBzP/h2QeAnKpatc=;
        b=c2u3/zxz+KnYRQYcigh1U/0hqAHg33hbKIvMatAHTEajvXBrlkTo2QF59hrkVQd2OF
         FPdEgW+UeSM32X5IrUwdugR1pq8heT+y5o5fZ52HcsSyRK2YU2MpMN9ARbyPvvJikR/i
         bg468eeeB4hlyfCh70OBDEb3DOYyqd3tovsHoKGeyGZjfB5I0lASjy4+W+5F/Fhw33lo
         j6VP4TlOhRZWFIOZJ5w/Wje6V8GJT5v3vaOG+AuTCTcVWi24KrQNRcaKdHghZO+N+s0N
         TihnlFztbZW30gc6B3i/b1cfxqysdWyeysBHziCZvEZ/L+wd4vqbmqlGDBngJgxDzPIP
         Q2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088777; x=1786693577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hUQBHJUBPKqNKadVj/rfrpbmjDMRBzP/h2QeAnKpatc=;
        b=OkU6QuUVF/mGXpUGk/7Fp3DPscWBEhWEfJIQgS/Y6FoKOz7ZW+HDwr82tWLSIgVN+O
         Nkrngf4Z0jqM4ycQdcLn1TLp7eWUo4gSJ0+k6ISwH2HAmNGmfO6ObqIhO0IG2q82le90
         6IA0fqjUDu3AEGz56KWY6NpdZEDEsxwGbdxP8l3tgnhV1mCBzYSVRTNT82oGspogfgy7
         75yjd+xptCa3t29A0iqpbqxSYLWzZzcGjTuxikJ+p8KhhFwuPWg3AhMAt6/iFP8NYSEp
         y+FTS7G5obCye5FtNf41UPA3b3q6Jcjd5+5dqkfGqPqRuURK+OKxikWjSzZBp7E0Bi93
         dB2Q==
X-Forwarded-Encrypted: i=1; AHgh+RpoLT9WBAxkaJfGxcsIEYZ3euznqcnjRY6EdHk1fGDt7t849ADArgMXBcdDiX1rB7h2YnY2OpAtaSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL31RsGf0HlWUryzTW+CEYZpnhhjAfs5/Wfnv4V+dMq1nxJK4d
	dB05ZmSE2MC3KfiYI/1pX7DUDtelJqz7WdhSds8wY/8BI4SsreiBcl6E3JfcPyJRsJ9XwgvwTQ6
	YLIvF9Tw=
X-Gm-Gg: AR+sD10I9NgYScpd2T+zAN2U0cL+nc6DSyxUzQGYl9d6K7B6a9DnCJaE264qFXOYaj1
	lS5jdkz5tb4r3uxlmdzNJ/wUau8PhwzZSkp3Me+OllWob2Q2zGMWZf3o34vhyBueMK3vMqu3Rbl
	TAqHmnwbXsbkcmFmJOHWNVrsndXtOIwFONIh0qjI87YhxJzpuEvEEeBt4cfEcVHxGfK6fA+VtM1
	lW6lyBe4rztAnUzrgw4K6DzRS0hfLguSFtoqcBsOC1XyMPr7FF3nhxJaCBldjUWyrnKC2nv/d8x
	nY7iyCgdq8ftk/8bR5uKH3DRUHNu8pJJLa5tvO6IWLKbFe7lAkD6BCIjG+Bv+Rl1Gjz5hxFaKTa
	gj/v0KBY6VlGlpSvdV6DOSOejzNADXExUQtZB5t4NtoSgMa3wsS7VWXsT2EnBihVNMnDmzrBARG
	ggu75YIvk4yFAYTsplSE1FTEz8CPJ7bQoDajFS9Dk00h3GrlmcLXEHNJO28O/uokEJx6/v42UJ1
	lyLankMNRR5mSVPkLxcCHLZxVWYWA7aEGk06j8aTbQ=
X-Received: by 2002:a17:907:c0e:b0:c19:523f:5a0 with SMTP id a640c23a62f3a-c207eba2525mr104403666b.11.1786088777396;
        Fri, 07 Aug 2026 00:46:17 -0700 (PDT)
Received: from [172.16.240.102] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080c90494sm19432266b.36.2026.08.07.00.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:46:17 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 07 Aug 2026 09:46:04 +0200
Subject: [PATCH RFT 1/3] clk: qcom: gcc-eliza: Fix always-enabling
 PCIE_RSCC clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-various-pcie-clk-fix-v1-1-5caf78a599d7@fairphone.com>
References: <20260807-various-pcie-clk-fix-v1-0-5caf78a599d7@fairphone.com>
In-Reply-To: <20260807-various-pcie-clk-fix-v1-0-5caf78a599d7@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786088775; l=1636;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=xuFI5Q5PVaGG13a653oWxSPz1g51NAalhPKeOlwyekI=;
 b=OXG25V5ARtGUJVxIyXDW+USORGyOaj0s9wColp0IAl5AEuF1LG94pyjn+EuvGXuDY24NQTytp
 q6+8ZYpr5E4B3Cw6u9cCqMwEwftg4L1waHGPpbXfiHhvfwOujJ9vvS6
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The critical_cbrcrs array will get qcom_branch_set_clk_en() called on
each entry which will set BIT(0) to enable the clock. This is however
wrong for these two PCIE_RSCC clocks which need BIT(20) and BIT(21) set
respectively to enable them.

Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/gcc-eliza.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
index 3e26c7a1e5b5..fe18942a59ac 100644
--- a/drivers/clk/qcom/gcc-eliza.c
+++ b/drivers/clk/qcom/gcc-eliza.c
@@ -3010,8 +3010,6 @@ static const u32 gcc_eliza_critical_cbcrs[] = {
 	0x26034, /* GCC_CAMERA_XO_CLK */
 	0x27004, /* GCC_DISP_AHB_CLK */
 	0x71004, /* GCC_GPU_CFG_AHB_CLK */
-	0x52010, /* GCC_PCIE_RSCC_CFG_AHB_CLK */
-	0x52010, /* GCC_PCIE_RSCC_XO_CLK */
 	0x32004, /* GCC_VIDEO_AHB_CLK */
 	0x32038, /* GCC_VIDEO_XO_CLK */
 };
@@ -3045,6 +3043,10 @@ static const struct regmap_config gcc_eliza_regmap_config = {
 
 static void clk_eliza_regs_configure(struct device *dev, struct regmap *regmap)
 {
+	/* Keep clocks always enabled */
+	regmap_update_bits(regmap, 0x52010, BIT(20), BIT(20)); /* GCC_PCIE_RSCC_CFG_AHB_CLK */
+	regmap_update_bits(regmap, 0x52010, BIT(21), BIT(21)); /* GCC_PCIE_RSCC_XO_CLK */
+
 	/* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks  */
 	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
 	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);

-- 
2.55.0

