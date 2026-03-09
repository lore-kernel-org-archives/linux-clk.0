Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B483D4115
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 14:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067183; cv=none; b=I1NZ7D+PuA+6AZckOwMk7AvvvkDYNbLYxFT2a/cHmJldhsw1KSO3pYxkStUL0Ih9vjEwFxSwG6KiivVNRYClh4KIsnlpu6SXTw3TSRMH5yHd0D8w51U2AIr/oG6LqxeXGn7EQR12K40LZTaEFKoTXPtNTcEVKQT71BPhheFTpvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067183; c=relaxed/simple;
	bh=sLSzbJh7cXz15yujfKRUKVwjHxPskav4bPrL2rWVpLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K7G06nMBuuypjKrX0VqGIQ8QT38gdf/U0+dk1mJKGaOoDxbAh32rjFpnfT0g2t2aPU69BsRNYB4Mshw5/004nAgdtXcCGw5zrg2IpKqL9Gq/UcYqbEnlXaokqhgztaWSGYNVWOuOjiC4SlHcsW0Mw1JfKlijGAR433iBntD84Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G1Md2uo5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=G54NLwuU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G1Md2uo5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="G54NLwuU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nHpEuLdBDx8DUfHTyOeAjGIaxuajst1Ir/ZXwDHbftw=;
	b=G1Md2uo5H+fsm1Mf1k+EMbAHveWvkJ98Uon9xYvGQtPDlvt9+kVxn9gSF8bZIBxuusiAq9
	dc9/jZOr3Ia9Mnv/7sw/cmHaZnMj+DCwJbBUerhNpvp8Yt0JNNK1jvhLmsykpWgQRUyQ9+
	vUxCwFhWKdFWlatCl6KcrIzG0frqC7A=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-Te_EL4JdM4W6O5qR7_p_Wg-1; Mon, 09 Mar 2026 10:39:36 -0400
X-MC-Unique: Te_EL4JdM4W6O5qR7_p_Wg-1
X-Mimecast-MFC-AGG-ID: Te_EL4JdM4W6O5qR7_p_Wg_1773067176
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd773dd39bso1429344385a.2
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 07:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773067176; x=1773671976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHpEuLdBDx8DUfHTyOeAjGIaxuajst1Ir/ZXwDHbftw=;
        b=G54NLwuUtqRSXg15tAN+AAaFZDOFqVk5BeprEleQPGRVJr5mvnOyUIbMfl4LME8pA2
         PE3L3Emd9weBSPuPxQ56DZRWAyb92wnKPrSeZc3ErA+ynEWXzNjTGWoxoEAA/nCXvnqx
         TfBLqtUA/ZeSTGY6pveSNBdwlh9L9+p+NM92FgPSCrHSML6FMFt0aY9Ffh5qUZZFlZjC
         KSSO3cKQ21++kGbJ46eCaoP213t5qUjzOLKQNOPHxBVQi/d05il0im8tPXgxxiw0VPTi
         bdiRon8M9TbyOaK+xK/uHxYHYSFoe4WaV8r/4CNW6NX6/1gMAU0PevPVKbnv4jyl6NEC
         oXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067176; x=1773671976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nHpEuLdBDx8DUfHTyOeAjGIaxuajst1Ir/ZXwDHbftw=;
        b=bXKhlesksnno/sQjC/iaoICdW4Hl3Fq+XAtfLfzWzhxz181T39yUh3A1QxhaB1DALb
         218/Bo+/BaZi6ZW4TfEJal3fIKcheaAOl/gWpgR/tz56emu5fguqCNmjqvH8AlNzwPQu
         Zcxbqb5szlMMG2GJ65tS2dQwZcj+uFZJASN9MyXYtyH5yKsFKLYa2ug9l1XtBxG9VdXP
         vMdRHeKAWVEp43UB8jTxibsxcBdSt2KTA99KZaOaG3lmHvU4e4clVASCee43w5I2ysW/
         Zn5zqzBQF2BqhBYWhM95/8eyTOZjA0xjwhVxMyadP/W+adneDdLif6PMG01f6asQ15cZ
         ZT4w==
X-Gm-Message-State: AOJu0YzJCpggEoF3LxuYp7fyJCVNf40Of5wv2DyetNeuszETqMqm1dF5
	6LA3flkQ7ZHXs5OKG+hbFbI5KCEKlP3syTqa3XUTYVjC/Y1AnOg8c3OlnEhTTrey9WWgtgFz0Sh
	d3Lf4kwRrAX8DIK4PnndT0Otf6no0dIGtzXtVzY94l2LISxLROUjZU1nMqhQCFA==
X-Gm-Gg: ATEYQzzRW1SXwlFN/xaZ4FsMRgU2m2ZlDVussoB5OBwHQr03WefwKi9kVMNpjytYVtS
	ZKJM9WVniSGohXqy69RD2hmxHrh+qBIK5dq6af/Bgwefxp0COJjHnKjGL2uz2HMx5Pivft/Yiax
	OcczH3CdAQUQj6PrgxvsFNzQKQyOCFjiWs4f+xd/6GXd2Wlez80HukBfVjGwfRktPYnz6cxAHFw
	vT8X22uiqOR+G3c/7w0Gizpsse7152d76sREa4xLZQyDosKOE1++agyT8YcJxKVj1KqJTz4SEN5
	wQHnFYLwQ5wSnVNR1xl0qex8DgXyHdjCNa8H0P84WD/7CUxYQu8jIJi147BGV0AEfZNLg9r1FhE
	uG0+VZDxp/p++EiMYLR6k9b7fmKmuJbzgavu7v10n6RAgbUlLvkjclBCIrCLlJg==
X-Received: by 2002:a05:620a:31aa:b0:8cd:8f04:50ec with SMTP id af79cd13be357-8cd8f0455ddmr198562985a.2.1773067176053;
        Mon, 09 Mar 2026 07:39:36 -0700 (PDT)
X-Received: by 2002:a05:620a:31aa:b0:8cd:8f04:50ec with SMTP id af79cd13be357-8cd8f0455ddmr198558685a.2.1773067175644;
        Mon, 09 Mar 2026 07:39:35 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm756064985a.16.2026.03.09.07.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:39:35 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 09 Mar 2026 10:38:47 -0400
Subject: [PATCH v2 08/12] clk: qcom: rpm: drop determine_rate op and use
 CLK_ROUNDING_NOOP flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-clk-det-rate-fw-managed-v2-8-c48ef5a3100a@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2724; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=sLSzbJh7cXz15yujfKRUKVwjHxPskav4bPrL2rWVpLE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLX3Z4YsMBuVzxrMftysXMGLcYlHX/1Zf2ZL2dYffQQY
 ulKn67SUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwET2djEyzItv2OzQ3/A+IOST
 tb/ePe279Yt/MZrHxef+Ol6y+cDPVkaGV4fbmRTj2sUlP/LWSLS3Jl04FVHfurrFeG3gjDuap+z
 ZAQ==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_NOOP flag.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/qcom/clk-rpm.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index be0145631197bea65438f3bed10344f18d6de802..af2cd40107054cc6d25724497b5749a23f72a04a 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -42,6 +42,7 @@ static const struct clk_parent_data gcc_cxo[] = {
 			.name = #_name "_clk",				      \
 			.parent_data = gcc_pxo,				      \
 			.num_parents = ARRAY_SIZE(gcc_pxo),		      \
+			.flags = CLK_ROUNDING_NOOP,			      \
 		},							      \
 	};								      \
 	static struct clk_rpm clk_rpm_##_name##_a_clk = {		      \
@@ -54,6 +55,7 @@ static const struct clk_parent_data gcc_cxo[] = {
 			.name = #_name "_a_clk",			      \
 			.parent_data = gcc_pxo,				      \
 			.num_parents = ARRAY_SIZE(gcc_pxo),		      \
+			.flags = CLK_ROUNDING_NOOP,			      \
 		},							      \
 	}
 
@@ -78,6 +80,7 @@ static const struct clk_parent_data gcc_cxo[] = {
 			.name = #_name "_clk",				      \
 			.parent_data = gcc_pxo,				      \
 			.num_parents = ARRAY_SIZE(gcc_pxo),		      \
+			.flags = CLK_ROUNDING_NOOP,			      \
 		},							      \
 	}
 
@@ -351,17 +354,6 @@ static int clk_rpm_set_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static int clk_rpm_determine_rate(struct clk_hw *hw,
-				  struct clk_rate_request *req)
-{
-	/*
-	 * RPM handles rate rounding and we don't have a way to
-	 * know what the rate will be, so just return whatever
-	 * rate is requested.
-	 */
-	return 0;
-}
-
 static unsigned long clk_rpm_recalc_rate(struct clk_hw *hw,
 					 unsigned long parent_rate)
 {
@@ -383,7 +375,6 @@ static const struct clk_ops clk_rpm_xo_ops = {
 static const struct clk_ops clk_rpm_fixed_ops = {
 	.prepare	= clk_rpm_fixed_prepare,
 	.unprepare	= clk_rpm_fixed_unprepare,
-	.determine_rate = clk_rpm_determine_rate,
 	.recalc_rate	= clk_rpm_recalc_rate,
 };
 
@@ -391,7 +382,6 @@ static const struct clk_ops clk_rpm_ops = {
 	.prepare	= clk_rpm_prepare,
 	.unprepare	= clk_rpm_unprepare,
 	.set_rate	= clk_rpm_set_rate,
-	.determine_rate = clk_rpm_determine_rate,
 	.recalc_rate	= clk_rpm_recalc_rate,
 };
 

-- 
2.53.0

