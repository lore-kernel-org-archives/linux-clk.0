Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9AB3D567C
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 14:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067184; cv=none; b=SpKtS9bqCq3xamq3urU4LnYCPgckkJp54hNpu3l2YRtrDNJg/RMOXC55p+ZAp8oZkNX6zeUYlMWcOlZ0IAeH1mPV4Emdvhs1kW8zT56966Tp2WxLes3tR3EegkKQ9UOLAH4U/Fo5Pj+EQrPLpdKuSFCk/o/pxl3+zkxqJvNyliA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067184; c=relaxed/simple;
	bh=IvF6uKMPnQFKE1GbYYFcHqzOqYj9gDMJMos1cEoO7k0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k5feOeis0GEQ1MxypeHRFgOjw3SEcaSNjyG2lnXAHAlrS/1km4L1+ljY+yjkZDXX0sfp6AZBBa5J9yZ9UDbRmK1eTkd0kRKUhKqTiosCn8VGdOobqaTZz3sbS/GmB+FH4gBp5V7p+WgkMb50qxvODKgH7Z85sNQ6V3sQlBGH87I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Olwy5+Ds; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UfohZobI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Olwy5+Ds";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UfohZobI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xiCQ6zXIkcf+xUvAG+Sa0vhKvqR3yyXasqNpgBq06J4=;
	b=Olwy5+DsOKp0husrxWq7susKPiDRkr6kvwEFGbSooNcGMNXarLvX60GFhZGJFvUiwUkfN1
	/dflTollL01bADb9YP2oksR4uywFOFoTe+U7CxGU+tE0UxblRgR0bvnZWiwFXFjnXuaoqm
	dvlkR4r/tPAeXH/L/KSKvRis+TiMy6I=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-f8qNftxNOXq-wUoN1FwPkQ-1; Mon, 09 Mar 2026 10:39:38 -0400
X-MC-Unique: f8qNftxNOXq-wUoN1FwPkQ-1
X-Mimecast-MFC-AGG-ID: f8qNftxNOXq-wUoN1FwPkQ_1773067177
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd80c4965aso175846485a.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 07:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773067177; x=1773671977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiCQ6zXIkcf+xUvAG+Sa0vhKvqR3yyXasqNpgBq06J4=;
        b=UfohZobIt4gvuzq2YS4TSVN/IuX2Z1h6gvuzCJNVKXMqX9Xy26pcy7qW6xeAQV9M7+
         t2HBFZ/kWTXWpOTpqwJtirBeCFdNFbLCQmdY3TNUvK03lhgWUhIRq80FZtGiuvOLJF1B
         ESt5CAo5RuJfX2giPlUkc4VqaYQD3bw0vzXibzl812JupuWw+M/xR9i1M/jt/1bwG9r8
         oMXfHc2rienLW+L0RXy2dhb26sWRjNdu1CKyNOEdCAeM94wjvAuZw/7iDU57He8bolvn
         NVuP8xyyiGkbrotK92mheX5IYHfpvcl+5xF4FypPp+2Edeji9c5IkbOSDpf7KEkBDPnX
         rfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067177; x=1773671977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xiCQ6zXIkcf+xUvAG+Sa0vhKvqR3yyXasqNpgBq06J4=;
        b=EpJ/+peEUzzqBGBplB/a1M73cECTlzev2VvdlfOqBezQPtzm/+yFuPX2xutWYq0crj
         Gyjpj2j7OWZtKfMreLr9yA5ojjZBV9cFFrOzKiCPJriLa5sadPZ6yGNNHMrLLANlrUS+
         VbOazCQjGZt49cJOJC/iADNpg0xDDI8vVrdqrHS2PzkVBQ2NFKOvOjDauWhfxDdn6LYH
         H9rFHLcvB208Ac175oLvAbNJcLD1xqoaKEYCD0FYb30yWMYASQ1Nx+lVb28iadLFx8NS
         dPCnotXtSGldctTWW7cNEe78GxTDGqj3Co+EAg5psQGth07tCnW6I1+6D61ubcj5SLIv
         NalA==
X-Gm-Message-State: AOJu0YxVuJDUo7QJ2FOKBAcTyFp3oNZuMQ/MQcVI01Lgqlaa2dJ9YnT6
	gEvZS5zfLwbfByDb1MKNuQjb1TWmyz/k6pmvLknoIJq2UaqwRd4yN6/0qfJ05YPBiADwec8qhJM
	Rpzr46zCJ+uyd7+gRJmd88DMb1zmqRjXDOwO1du84Ksil3YDFh0ME1YEpxA2R0A==
X-Gm-Gg: ATEYQzyS6oRTFEuV52o9jkj50O3ponHGLDLuxxMHOLfltG1qsTEN6Waj74LaVSzEZTj
	vTiMUmmXo6T7VyAaLkzCJ5e3Ucc/xvElT4VsPe3qs/ulRS+EjszFTSkYqJdgLWvDqlzEKeOYvMt
	OuW9t/yJjAw957MFx0Yjj2y33SqWhQUQ59d7qAQsrPNbfwfPvF8zkcygOtdmit1S+jBG8DrsCbG
	v5inWFl6BEXQmBvchpsUK2Qjogl+gBC5kWxt5fohh/UIHouLc29dT5jaylXym3EzUWuzsoP5sjv
	9YJR6i51ciJQzirklQMjDL0nYPMhV3/L1A2wQUOxN4KLGiMNjIjfrzu1X9cg7uT46gJWxSX3wC1
	qwzBxY5Dw3Vh9skEZkAuw4J1uRApIYcK34Z1oY2GMJzD4PHpl3hYwN0ITI/UAqw==
X-Received: by 2002:a05:620a:2550:b0:8c6:f416:69f8 with SMTP id af79cd13be357-8cd6dbdb095mr1319502385a.15.1773067177367;
        Mon, 09 Mar 2026 07:39:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2550:b0:8c6:f416:69f8 with SMTP id af79cd13be357-8cd6dbdb095mr1319498485a.15.1773067176941;
        Mon, 09 Mar 2026 07:39:36 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm756064985a.16.2026.03.09.07.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:39:36 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 09 Mar 2026 10:38:48 -0400
Subject: [PATCH v2 09/12] clk: qcom: rpmh: drop determine_rate op and use
 CLK_ROUNDING_NOOP flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-clk-det-rate-fw-managed-v2-9-c48ef5a3100a@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=IvF6uKMPnQFKE1GbYYFcHqzOqYj9gDMJMos1cEoO7k0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLX3Z40YbJyYp09I6/QD8vFf5sf63+pEo5V3PG0LPega
 mTSDMXQjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACaS7Mfw32tRjpa/64PacDtF
 v65Jaxqyn8/963Tna9rGAwVXL23avJiR4TBrKecON2H+7bP+a1/jCxO3+lv+sP7nkfazgvsFV7J
 acgIA
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
 drivers/clk/qcom/clk-rpmh.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 547729b1a8ee01cf28c11ee8c4bd2f36d7536e6d..877574b952efffd1bf3ceab5d347ed4d5eb24049 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -129,6 +129,7 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 		.hw.init = &(struct clk_init_data){			\
 			.ops = &clk_rpmh_bcm_ops,			\
 			.name = #_name,					\
+			.flags = CLK_ROUNDING_NOOP,			\
 		},							\
 	}
 
@@ -321,12 +322,6 @@ static int clk_rpmh_bcm_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static int clk_rpmh_determine_rate(struct clk_hw *hw,
-				   struct clk_rate_request *req)
-{
-	return 0;
-}
-
 static unsigned long clk_rpmh_bcm_recalc_rate(struct clk_hw *hw,
 					unsigned long prate)
 {
@@ -339,7 +334,6 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
 	.prepare	= clk_rpmh_bcm_prepare,
 	.unprepare	= clk_rpmh_bcm_unprepare,
 	.set_rate	= clk_rpmh_bcm_set_rate,
-	.determine_rate = clk_rpmh_determine_rate,
 	.recalc_rate	= clk_rpmh_bcm_recalc_rate,
 };
 

-- 
2.53.0

