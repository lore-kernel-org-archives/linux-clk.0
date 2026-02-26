Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD66426EA1
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 18:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129888; cv=none; b=tjHDIdP6q0NHSuYgMSpdkP7xFdscN6zqm5lWK4BWyEF9OavHccJp1ILqizLKanQ5q+1ZnF05PgcWRjgdEClEowhTFO6opC8ituTZ5FMv70Obd7Apm52By0KePGHjswISTgBidDEhjJ0qt+Bi6wDBBeVQpaWKm0+J4oy0r6J/sfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129888; c=relaxed/simple;
	bh=+NML6hp6/SZdlNV0n5JD+pA8hAvR/oSkGS4hBF1OYmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iMy8IbsEbg4kSWc19ypUdJFpIdCi5w+6cBvMlr2HmTABpgGv7Nca3PG1YO4KVNyr4EZhSJmMzRyo/Lfm32FQwwrDVYx4LYUpYfw5sIYM1bexuPpfJKGERWGW99mtlqE14XGWdZX0IDGjYzGkQIMKYJ62LrrIam1Sz8Que7ncWdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TdW1JXMo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rCbgaQbD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TdW1JXMo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rCbgaQbD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jBi9B2WSL8r/6ledYBjWi1ZZVo712Gw19OuWCebmMy4=;
	b=TdW1JXMoHdkvJa1DSrEJbqgkCvZmGvmC8bCoRamlnx0XVdOIW6Z8zGR5YHEZ7l7T8fzXmQ
	QxHh0UgOOB+AHsGJH7WMD4w0YzAzwy75J6ONpGF3vr/XAPxRIU7O3E02rpdqNNArjmiTeZ
	x2puauv06yjaQ8qOnO/UVryqEEg9TTU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-AyF9IKzoN5KeI2DdJogqkA-1; Thu, 26 Feb 2026 13:18:03 -0500
X-MC-Unique: AyF9IKzoN5KeI2DdJogqkA-1
X-Mimecast-MFC-AGG-ID: AyF9IKzoN5KeI2DdJogqkA_1772129883
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb0595def4so1028205785a.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 10:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772129883; x=1772734683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBi9B2WSL8r/6ledYBjWi1ZZVo712Gw19OuWCebmMy4=;
        b=rCbgaQbDr11InPKRFEJ6zMDvs0jgGoGLDPy6EhuZW752d1+BdYJkeravBjVtv8gX6p
         4N3doaCk525SdKaHjHifQ/QzZk/bBfH7SBC1a44FvhoUTRQfqgfqCpdTv0MG3TGYXt78
         FevVuQjTQ3fOPd79VhQ4YzFj7PyqibiWpmb2IK8/ohjA9s+RTpTwnFnAhM43MzKv6fNJ
         eo20H7Xn8Y+HQMHigr9lLhOY2e1JoZMqxU/b67xSM8CE95WrHH4hlj+5f4wfWB/HwVVl
         qpnFA59LLyYtAp5+kWhVwLVvROjsCPSorDssqwWrSp50oh3RkzSOIYaDmwbIeGuJty1f
         A/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129883; x=1772734683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jBi9B2WSL8r/6ledYBjWi1ZZVo712Gw19OuWCebmMy4=;
        b=rwpUwVgPrQBdgrdGetqPDc5NwPTKEbnZUoVEKPrr75171LVVJkV7dyYUUUqMVPx2O2
         EsK+nEKWY+R/kSy/WDSVKMkH2ZOrwQJteEJfHamQEu9r+QmMFKdnQEmetDVofiBHHZHG
         aR2jd68ajQ4xqYc4cV1TrXEkIfdK05CTbAYaqIkZGh3CykC1KGu5FEDu/Z+guRr3QfhQ
         kSetXFgxJhJLS6fTS1qGQ5Z6rNjUdtiqxx2OL14aYgykgB4JbZviU6iJ9WSG/UxAgIuI
         oobpCfh8CdD57a2f++e40TzAV7yNfNaTsKGVyVBqKAsMKOd+6uYiMvCDqWbXfTxZdTy0
         QUnA==
X-Gm-Message-State: AOJu0Yw5TYJAUaEARxYHop9MiN8y06bapemKHNFb8/4IfiMLjQuoA2Jz
	bUSA/kr+otBieYk3e3poEiwixHiJB1qsXC7HYq+RTK00npQ+RiW1Vnrk+gRj87o1zbZE4Pu4OYr
	rEydEptJL6a6i73gvHeeCn4wrz45RPCJW/3DcowuuOudnOqMQiRh5xnZGSsv0Bg==
X-Gm-Gg: ATEYQzzCqaLfLfXiujAb+vXfrCahB6D5Ti2r5yWPmllZJfnMfX/yG9Hhhc56cJQG+Wl
	H0dpOVT13b/n0tQ0fKn2s2iJnx/8LsEZAU1xsYDb/F+QxtN6uk3OFUFN0mR/vwpSzL128Z1o1NE
	XgOwGzmHEu5HkopCIe7UVAmx8mr0inBte4qUja3xxVkP63pmzP14k6xSv0ea06/zb5rvXxGsEAN
	jPukSxfCVAA3sEcjHTt2nUEgGm4xEdV1xdk4WG8TIvLT865xdlJAkkxLNMm+iv74cl4uBy/2AWP
	UN2bdsxoJCmTF0KH68eFVPFyV9W3oGGk7B5EcOo0/1Yq+Lo5tTh/mL94gedWBp+Tft9m0iLq3E/
	FRTe7wNOsz1u1cz887vfbiANqClXNb7gIw6af4XkvpaToxu8XJ6/cjsgvvUoh
X-Received: by 2002:a05:620a:25d0:b0:8c9:e989:9da0 with SMTP id af79cd13be357-8cbbf35e123mr433968485a.7.1772129882644;
        Thu, 26 Feb 2026 10:18:02 -0800 (PST)
X-Received: by 2002:a05:620a:25d0:b0:8c9:e989:9da0 with SMTP id af79cd13be357-8cbbf35e123mr433964085a.7.1772129882105;
        Thu, 26 Feb 2026 10:18:02 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:18:01 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 26 Feb 2026 13:16:54 -0500
Subject: [PATCH 10/13] clk: qcom: smd-rpm: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-clk-det-rate-fw-managed-v1-10-4421dd2f6dc6@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2081; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=+NML6hp6/SZdlNV0n5JD+pA8hAvR/oSkGS4hBF1OYmg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9BmXHeJwYbbXuPfisWOlz2zpbtlPD9hb7e5Vfvr80
 Gzyx5kvO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZhIXhQjw1K7Yosim/qq+b3R
 HplT/rYdnlciwXDhXP/JIsml0/8YJTD8M9GyzHxyqtbMILM3yjM6V+/Ee52+F6J8WwJvGLcfPsT
 DCgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_FW_MANAGED flag.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/qcom/clk-smd-rpm.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 103db984a40b950bd33fba668a292be46af6326e..96af781195a23d8b56e2b977811a3304a452e1cb 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -35,6 +35,7 @@
 					.name = "xo_board",		      \
 			},						      \
 			.num_parents = 1,				      \
+			.flags = CLK_ROUNDING_FW_MANAGED,		      \
 		},							      \
 	};								      \
 	static struct clk_smd_rpm clk_smd_rpm_##_prefix##_active = {	      \
@@ -52,7 +53,7 @@
 					.name = "xo_board",		      \
 			},						      \
 			.num_parents = 1,				      \
-			.flags = (ao_flags),				      \
+			.flags = (CLK_ROUNDING_FW_MANAGED | (ao_flags)),      \
 		},							      \
 	}
 
@@ -370,17 +371,6 @@ static int clk_smd_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static int clk_smd_rpm_determine_rate(struct clk_hw *hw,
-				      struct clk_rate_request *req)
-{
-	/*
-	 * RPM handles rate rounding and we don't have a way to
-	 * know what the rate will be, so just return whatever
-	 * rate is requested.
-	 */
-	return 0;
-}
-
 static unsigned long clk_smd_rpm_recalc_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
@@ -427,7 +417,6 @@ static const struct clk_ops clk_smd_rpm_ops = {
 	.prepare	= clk_smd_rpm_prepare,
 	.unprepare	= clk_smd_rpm_unprepare,
 	.set_rate	= clk_smd_rpm_set_rate,
-	.determine_rate = clk_smd_rpm_determine_rate,
 	.recalc_rate	= clk_smd_rpm_recalc_rate,
 };
 

-- 
2.53.0

