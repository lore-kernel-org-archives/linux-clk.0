Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426677;
	b=e1Os8GmNyG4hkhBdknExRbN/C92Q14P6XzmDlDUlAAVP15sty813pjNBWtnUT8wVNJ/d
	 R/3anzK8rOg1nAhXBzK7XrykeK7CelK0lQhhHo/6d0APDIzXks5kF7yIarsC4iLowat3t
	 rBkmC0TkfKjd8sm+o4OJzOiG2OvPEb+WS8guaCRVYUHSrUMuf60ElSzUf8cCKmJJAj/aj
	 yMdiG8IglwXiStGf95YfI7xK+OvwfH9yPpklIblRFJUXJpCOXfKPSRwvkB/gH+1OYWxQt
	 yLZ4FmlaIRuj1wrsoFXT0ubV/d+vwIjzv6W23QRhZZBUtHUglnz9m9XUAkULk81Z+lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j9/YY5ZYigZ1aqT0I55Hlkm3+bQMNT99YHPRJIImTVQ=;
	b=hMbXeWV6yktGUW1UfGO7tFDwXBgE873LznpkJ10VXDA+t9OC7o57SJqDjVfrqItsl+X6
	 bvUCzja2WCmH5KqYq35M9jXA4RsnmRGhLxjkvW4V+KhAvLPAJCDjhpYdwg6ieBBPc4T3r
	 20FSfElFXawZa+JXBK5bDRVGYko6a73vVY4qCatBzCQSzgMp7BKbSZ/15FJGn38SU8tT/
	 eu85QsAK2pM9vOTSJqTnUPQCMTs26hvBcaIc4JotbRLGerrk+yv6qDz5XRtTJ9nt6XFog
	 UDDzVZtAVjkzbrg4lgIHF/u/HMcngPNaBqp4/5nZo2e9FJnHZkP1ImgZmAOwX1sbGAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="qDF/voXd";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDF560A263D
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 16:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECDF560A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qDF/voXd
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-353804b591eso4394326eec.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 09:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426676; x=1793031476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j9/YY5ZYigZ1aqT0I55Hlkm3+bQMNT99YHPRJIImTVQ=;
        b=qDF/voXdFABxdK5aqc6szv0m6DU68u4FnQLKltgfFFS9FTwVcQUs5mpmv1ar6qArnv
         EBAcMNZLwr7QOzfMGz0obGeBaSWYonpdRy10XrrpBY0DDamcAQfFKjtJHYfwDpfUzHVM
         JkGbBeEjtS0MwWX6GhHuZVqQTWpb1a7HwJhP3WqZGzT9gH6+zphy3AujM3rdT3SvqIAA
         9ZrtZjvxtQSAkbKFQSdJlguPJZdG7NR0tW/ppWdUaauv5s81lcVehkNTjn0Hb3Zd3c29
         j3ZesgtL1gOVmOrqVXSP/mWCbWh2aWyTL2unyetNjHOL3oSBwmHPGyRAXuZYLBDJuLWv
         WrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426676; x=1793031476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j9/YY5ZYigZ1aqT0I55Hlkm3+bQMNT99YHPRJIImTVQ=;
        b=U6OoIZwqcFRGlCdGVCbdNdZzafljdAdbcvAfViPR6noWsegS5KhJA2H+ulfT3bPvJ5
         zsvvJjC3xPE/KTfhznO276GR3thLceAOa5WYdHuAcSCr0A6euVuuAK/+ctDtKD5gzcmz
         3Qn6N0ffW1uUC/cap2+IMyae36U8KL1+ucs8Yn496zuTvUxBfpvdck4J0AC6CTVd2+fD
         Ofb8UspLjB5Ja2dYwK278G7Kl+TDl+Y5SxhZWdqTzLbLRg3lvUBCfylbVhbwLKMSXuA2
         F3kZ65Ak1D0uUHVRf0XjnqhFDTmjwKgmoqLHOfVSRL1R3Ccm2MxGTqw0xC7AmwZIWWE3
         dBXg==
X-Forwarded-Encrypted: i=1; AKwUvBwYNrjxmRzahGrYcH5q2R+QuX+u3I+J5SYf0a3Em4bVd8IFVLBRqI6iwg5REUjZITm/KDMAyVelBeY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtpQExN+GJHEFl9WWCeGAUzHfLPBZU/5NLhRlu4P+lEj8/8JYq
	roThSfGGIAmtHQDYd0vWRS97BWq2O7jY5hiureH5wPy1VgH2Kux0c6pT
X-Gm-Gg: AYBFou0TrhZ5opnUkeyhtxjx3LnNdW74DPg+w3SQQWTx7MVJ1bL+iKDipwiHqToM0Xr
	PNVasP9qGmM2V1eLEoXv1xZy5PSVE1NvzMItBEKuvRk39N0Ul07+nTab3sp48LAm3OaAv+2pUia
	/Oud+LegV8nKO2jonc70vIxxPDaIqsPHEdvamf1YF/VCafaTSEyh4+DyRqCH3AwzVimsoqZX+Qa
	Bm/hSEKEa98MMveVOs4V7XKlrfBfhlwF6GFIpnyGVx7hdtiEFshHQJmWS5e4xBRfAkcnSBYOHBs
	jvdS3EspV24QUB+/G5j+3keRdGEWph35kEaKQo3OwzzcWnfGHRXNIQ9pwHs/tiFUfGNsqFEpIed
	Z8x7RJpaOjoICIzt5jWgqA3eWUnLELjTnrLpGduWv193rVKSM/UHuEPofCJuqlMRxOvjC4KSou2
	yvF8kxOw5iLVhTDSrZb32Md8umOcAJy0tYrG7CdDGjkHR0lyKTDT0t/cLRwoCXiddxyhBZi8OuW
	crmThaGJWY=
X-Received: by 2002:a05:7301:4614:b0:35b:3181:80e9 with SMTP id 5a478bee46e88-361a185eba9mr9880037eec.20.1792426675354;
        Mon, 19 Oct 2026 09:17:55 -0700 (PDT)
Received: from redducc.localdomain ([183.83.156.125])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm33410985eec.13.2026.10.19.09.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:17:54 -0700 (PDT)
From: redducc <sushmit718@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] clk: qcom: camcc-sm8450: Retain flops across camera GDSC collapse
Date: Mon, 19 Oct 2026 16:17:39 +0000
Message-ID: <20261019161740.2384-3-sushmit718@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019161740.2384-1-sushmit718@gmail.com>
References: <20261019161740.2384-1-sushmit718@gmail.com>
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
Signed-off-by: redducc <sushmit718@gmail.com>
---
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

