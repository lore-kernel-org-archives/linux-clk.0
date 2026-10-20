Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506189;
	b=MgEmcH0YHan90Ayh09x76xMNUNgCc8M5VLDQgQLPv35wduSIxpIHlyjL8IzZs5Lebk20
	 l9ikJxd+M9I7alz93sV7IWtFahSShaLkj1MgXgBQ2gVbtVu1EOC25RnsIIaBfkZNuGjZL
	 ZP5fuA30DzJ5C5l78K645xfCspilo42zwhGw4ThjFaazuIpnc84hSKg9GGhnkAzJ5ozOD
	 eO3MIpkd0LZ3OwWkjvZgUaU4UZF/M9i9thBG9dEOqt51SPlMxjqQn0TVIEwLc8+oP7xz0
	 eWnNsZ0WTFbhZWYkON6bILB8dxBE3a9zEehslK/t6E0WPtCYYcVLAgVJCAlIjifBFJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ED97X6gakA8ucbmLBV/4CVg3kHHt8K/gnR4HvyQCs74=;
	b=qopUX2v6dzWUgAsn/oq2n5mBU27lZHAJQqmTQztlcQsLiXXiNR6ujQbmwMzIpNU2LmLp
	 rfWCPfhEU7mZvfQzxepXCToc3FQ9BbcaKsOmTQxq3uoPepLgWFVTNvnErXlMGTiQ4Mp8v
	 fDoY92XA2th4DO03ysajLq7hO5tvDB1o2Ysxeu+9NCkHhjqMS0jkJ+jy33LerS6HlfFH9
	 aBTKtrKif+Cp0L9b+187R8+Yz5iYk/ZqdFBVFuw5hxfDrwyOg++bF/2phlQk+EulnItEB
	 M6jg0fAzundvJxSb2G766TsuLpoV1RgKMCCtfdQ5cz/VAIu7OH6KC5cZ9/P+S43H1fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U82LcTqw;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1613B60A2605
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 14:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1613B60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U82LcTqw
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-353804b591eso6218549eec.0
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 07:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506187; x=1793110987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ED97X6gakA8ucbmLBV/4CVg3kHHt8K/gnR4HvyQCs74=;
        b=U82LcTqwBDiVQAWDSiRG5S30IP+Reiqhx29QK7YfsYpkz4tdaHHoYNX1Diov2X266N
         P7v/K8Tqlri+wY/dmEBMY6NSZmY8C6Sg2hyuyQJrOPY2TWozntWYUGJzAmvKxdO07hD+
         Wwfh7j/Th7s/jp4z4j9X6zWtEDLPhQ01XoF9AyEB5oXaHlpnaOTzXwcrD9OcCi9g7RJ6
         RW1G1aPhKg3e3FK1i94sOlvksiJrLcd6u7880os5/3CXQf63XGHHEzlqwmy6gnKJMmil
         XiIBmIq5EBGxzRe8P1vhdSD6+JMyTrR/FbCLYNp3YLB+DFXWQWrmJnglSYVMulPqZp2v
         CoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506187; x=1793110987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ED97X6gakA8ucbmLBV/4CVg3kHHt8K/gnR4HvyQCs74=;
        b=n8DmtTWJjKD/H8rMy5cTK0nj3WMBTpE7Lxbvoc+MjdMdNprkknkAQ+TwEfSlab2qIp
         rzKx25rV3SR3WtJJ3ociw9p8dS6uZkTYZdag1v36RjFgWmca22/ni+bFWig1QVcpCPnH
         YNXGH7NAZrBick4aWxIWzvG1V2B95nT0yUKcgAVV3p1MYn18Ghjemfc0mVqCWYbRnk4J
         MFmIcVWkLitAvsN9uwlllZBC8C830TTi3EnCacMRHR7egv9TroGPiT1XpvwtxL2saCTW
         /V10jpZVK14ARprSHwycyjyDhYLbAu1Zb5pHIDWzzQkDeXsEI1JoHzWwmCFdSoCXUtK5
         2Uug==
X-Forwarded-Encrypted: i=1; AKwUvBxHzhAnAM8xrUhvZ1VSmGih5LUjf+M4EJjYvD2ugSQmS6zfVeACD6Blr+mmjbH109YO6Egot0iUjjw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAg5EgLFNh56pDbEK9+YFM3VdEu5KDt53Qo918ZlpqxIW4Y2D0
	owsTSqLrYaglq7jE5Osy/0bIaSUlg9hAbyA2A3ogDhuJxhiWBRW+2FFI
X-Gm-Gg: AYBFou27ZvZVDFSYgqoWuV+78XnECIMUfMEwjUxvtLJlSe7KHvWWpTRshjW280rZf6O
	TM+qo7GiZJM9+cU4PlrqNVZ2pba4mrjrvEVWmY7+R4kf+Kom+DCtq8UX+q3dMDSsSfuTQwRnwGb
	mllrC2OkiwXyGsOIDfeCz3W76nHOe6VPgeIqJe1YBT4+L6JWOqfdL3XlIOhbrHYexn9EWrGrzF7
	OQAwwulXsZYiOL8BVlDlc3TULD0bRC3ncp7WWZEessUj+4acYxUh4QaFaCI5q/iviAviAQ5Jw50
	9QOTfdfqA5UB7P4ZNIsq6YdISJ3UY39f2AZbIGbYB0uGIMmgVyHsBWxx4uHh6nFH8CAfzd59KfQ
	vXpTgicYChh91QpV4U3TeeBZW29T4JaI/JCzQMal7rk9aQmwCg0zR6S52gmTp8c/1iFO4Yq3TjI
	xbNX5YH4U7h9dUJBQ6K0CgXiDv3ARFjxLhO1kSLczP3rWdQop5vfw5FJKul3h4K5bQ5bnweaFAg
	J4CpSROzY8=
X-Received: by 2002:a05:693c:409c:b0:358:ae07:138e with SMTP id 5a478bee46e88-361a0e85fb6mr17668280eec.8.1792506186522;
        Tue, 20 Oct 2026 07:23:06 -0700 (PDT)
Received: from redducc.localdomain ([183.83.156.125])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081ab80f9sm66917444eec.12.2026.10.20.07.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:23:03 -0700 (PDT)
From: Sushmit Singh Rathore <sushmit718@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sushmit Singh Rathore <sushmit718@gmail.com>
Subject: [PATCH v2 2/3] clk: qcom: camcc-sm8450: Retain flops across camera GDSC collapse
Date: Tue, 20 Oct 2026 14:21:30 +0000
Message-ID: <20261020142157.1749-3-sushmit718@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020142157.1749-1-sushmit718@gmail.com>
References: <20261020142157.1749-1-sushmit718@gmail.com>
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

The camera GDSCs are collapsed between camera sessions. Without flop
retention and with the default clock-disable wait, the IFE GDSC can
stay stuck off when it is powered up for the next session.

Program the same wait values and set RETAIN_FF_ENABLE as camcc-sm8550
and the downstream camera clock controller driver do for these GDSCs.

Tested on the Nothing Phone (2) (SM8475) by running repeated camera
sessions.

Fixes: 6082037fe62e ("clk: qcom: add camera clock controller driver for SM8450 SoC")
Assisted-by: LLM
Signed-off-by: Sushmit Singh Rathore <sushmit718@gmail.com>
---
Changes in v2:
- Use full name in From and Signed-off-by.

 drivers/clk/qcom/camcc-sm8450.c | 45 ++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
index 4025db23d1a9..9f1dd51db0d5 100644
--- a/drivers/clk/qcom/camcc-sm8450.c
+++ b/drivers/clk/qcom/camcc-sm8450.c
@@ -2930,90 +2930,117 @@ static struct gdsc titan_top_gdsc;
 
 static struct gdsc bps_gdsc = {
 	.gdscr = 0x10004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "bps_gdsc",
 	},
-	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.flags = HW_CTRL | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc ipe_0_gdsc = {
 	.gdscr = 0x10078,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "ipe_0_gdsc",
 	},
-	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.flags = HW_CTRL | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc sbi_gdsc = {
 	.gdscr = 0x100d0,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "sbi_gdsc",
 	},
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc ife_0_gdsc = {
 	.gdscr = 0x11004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "ife_0_gdsc",
 	},
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc ife_1_gdsc = {
 	.gdscr = 0x12004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "ife_1_gdsc",
 	},
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc ife_2_gdsc = {
 	.gdscr = 0x12050,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "ife_2_gdsc",
 	},
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc sfe_0_gdsc = {
 	.gdscr = 0x13050,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "sfe_0_gdsc",
 	},
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc sfe_1_gdsc = {
 	.gdscr = 0x13098,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "sfe_1_gdsc",
 	},
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc titan_top_gdsc = {
 	.gdscr = 0x131dc,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "titan_top_gdsc",
 	},
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-- 
2.43.0

