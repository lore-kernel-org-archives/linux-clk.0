Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F737082D
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 04:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785125801; cv=none; b=AiS5BnL5k9J1Jeim3KMz+ehn+vsUT+5WZJhE+hpR28vB2K0+SRBQrXf8k6hjligYuRTh+/ApwGr3FdYokL+faKsu9oN6Y8YFwcti7daNwll804DKls74XMlzmTJDpNlXfwluLjUBJxs1XHBcGwMETuXM62etPgSO3RP1Gskml1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785125801; c=relaxed/simple;
	bh=vTgw57gEbNXXoQ27XK+/fcfhflhaBxNt+xdoBYs9C+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Y/rQrBXPIp3r6E7lrWQcAoRtO3bjhGfG285pc+9HniZXRKN406Z3gQmMRfD/c2xm62J8q0xIwKDxA4wF5Z1bcc95FkMQxphjVsSGhFKOQM63dMp+xjagzu9Mkpt16hBBM86snl1rxWR6VQT2GvhKdO62slzqGoclXRnm99ak+sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tv5Lplah; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLEg+RYm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tv5Lplah";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLEg+RYm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1g30w2138758
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 04:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n+K+VWO30soBLFytNSDhh5
	hPOyqHp+P+UX4v7jKzrRQ=; b=Tv5LplahINfu5ETnkZ7T6sqridr1LDyXuSM4HN
	pgIMFlcVhnVA70xf3bqnI7woHNHkH/8oQUhT0SFSNojr4SsinMSGpWlk9cyBw/Vj
	RHnE4oQQQlmgQBdzHvOdSjna9kGRNQk3Yjm79Fg7f6AXqUoMtoipgTdaKLq0LApN
	fVNbPWTFY0mREanKv+Zdbvga7RSJV11Bm4CePDJx3MQxZqehvDqSRin4l9mzsMRU
	t+i7um1G8+DrSl/v658GYjWKDojkj+eoik3oYfkpbS9NTGg1aed4l+0Kf4o79jak
	QGgOakywNiOraRwAISvQRj1OaoMwQWAeGLSCElgtq+OY1Jrg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnh7vdnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 04:16:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8485d853b08so6000075b3a.1
        for <linux-clk@vger.kernel.org>; Sun, 26 Jul 2026 21:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785125797; x=1785730597; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n+K+VWO30soBLFytNSDhh5hPOyqHp+P+UX4v7jKzrRQ=;
        b=XLEg+RYmkrC3dXdyesPwa1/xt21NN1opUvJ4V/nbsFT/GJPj3Bk7kTohNzGWE8h9RT
         fN1mJz864PO3RdFX/VdkLTRMDt9lg5y5WWvb24QAQkkcSUJRwnO0+EuMHqHOoHXUEG8o
         orna0IdyHAPZ0LuDc072aooM7kXwj4BA5TVm20TQQxvVIHSjofQcw1ZRW3Bf+hVOAkP7
         68oXhYpk3QSBr8gt/xh9sYwsLzTeY73N+jsaW1TczVb/oaeGaY48V/brCSFlBm/Iq3/D
         IEnpHt744j6DM/n08Y1MG9ExXRBk6F2MXJRfxyZe54ZoSm8LeHlyQCCUghJ8RPH8P3c4
         etWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785125797; x=1785730597;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=n+K+VWO30soBLFytNSDhh5hPOyqHp+P+UX4v7jKzrRQ=;
        b=GU29w0RNw95d+t2qEXtJXmRchxDUwXMd0Vv7F942yxK7r2t5kb31jDhd/qNwvtLmSb
         9KjB/2gmbAotxi5zeeDXMoTOpIkEKZ9nAT45mwnHdfatC38ABumvGjE1cMyXXa3ldmpJ
         QtmfevIl71s5N68WBGkY4rUIuZtBHGWHpGPEU/zjMJxlrcKCKgYdO0d5rnUGD9t6Svft
         CyaPNDurFZjWtUz7bPrqKvkjSbApUz257QAiQBDm3aIqySHZGTNnoPDEN/wjyKIgx8sY
         SaXjF28qMkdXyqPLayZ0+TsaikXTWiomIohbIg9Pvk19/3PuhOGiC+7A+SBNFX2veLVo
         RZTA==
X-Forwarded-Encrypted: i=1; AHgh+RooJi9wntZao/K+C//F+eopXHs6YC5akgoWcYZ46kAh7JtL9SgcnYhHK1lmPwKu9a4lTnQGuqzgnUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSK5TRoH+bCC11rEFKSTIWYkvvOH1SLEEgo49Q5s1Bq++u5hpx
	w9XUK35SpVjQnwSRuJbKyqBjY1+PO+VFQS/bfE0eSqtZGS5wLEnir8LRNup3ED8AQFEQEsHLThG
	0EwENhmbFB+pZc9ieSpyLK4YUgL7eP6A6VLU1sVkD0MbBRjjWYj1JRRnTMEKVRlvRbvADEFU=
X-Gm-Gg: AR+sD13bSCXkSQxzXewu9cNmYOpjB8oQY6mNku8vV1h4aykyGYYy/fyf1gJCX/Q9aeC
	Dl+1SAYmnyTnuHdFyvo9y9WS23nNIyZ2iqXIvnaabs8MOd6t/Xhn0NavojWruSQaqguho45kBmo
	SqbF9FPumwo1CVfiNG7KzvMYjRMCjd9m19IiVWP1mfmI6znsaITJssEAK/0+5xYG5qLlZ/gvcrt
	oHVGoV/VeUgseghEOufApc756YKP1/D5UG/VuepDR6acNutAxxGlfrhw7p5tlGvnxYHIY7p6dLv
	927VTkUJRJc308uXEem/qItIF7SG9Rx9Vr+iS7GG2joANAKdjy9nlWDhLsDsiWF+xvAdZjo1dni
	Lf8eXE/fXKmI1FQ3HBdIrU6A4+vLjiD3neA==
X-Received: by 2002:a05:6a21:7118:b0:3c3:7ac4:dac7 with SMTP id adf61e73a8af0-3c67e071be1mr6656058637.45.1785125796814;
        Sun, 26 Jul 2026 21:16:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:7118:b0:3c3:7ac4:dac7 with SMTP id adf61e73a8af0-3c67e071be1mr6656019637.45.1785125796296;
        Sun, 26 Jul 2026 21:16:36 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc579819sm22629953eec.20.2026.07.26.21.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 21:16:36 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 09:46:29 +0530
Subject: [PATCH v3] opp: Use clk_get_optional() to avoid leaving
 opp_table->clk as an error pointer
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-fix_ptr_check_on_clk-v3-1-94629ac7aaae@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJzbZmoC/4WNzQ7CIBAGX8VwloaCQPXkexhDKt1a7A8V2kbT9
 N2FevGg8bLJJN/OzMiDM+DRYTMjB5PxxnYB2HaDdJV3V8CmCIwooYJIynBpHqofnNIV6FrZTum
 mxoIwQbhmwDhB4bV3EHar9nR+sx8vN9BDdMVFZfxg3XPtTmnc/UlMKU4xF1kuocik3Imj9T65j
 3mjbdsm4aBYmuini/9w0eCSJRX7UhaMleyLa1mWF6vw/owdAQAA
X-Change-ID: 20260723-fix_ptr_check_on_clk-603605c3e350
To: bjorn.andersson@oss.qualcomm.com,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        konrad.dybcio@oss.qualcomm.com
Cc: mukesh.savaliya@oss.qualcomm.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, chandana.chiluveru@oss.qualcomm.com,
        Sebastian Reichel <sre@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        linux-pm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785125791; l=5881;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=vTgw57gEbNXXoQ27XK+/fcfhflhaBxNt+xdoBYs9C+4=;
 b=tGak9tO2d49qj6j9uvooUPnrD7icrqQ5WXhlHhP0scZY/RFTAz/V9NL9fVdTornirEwByI62S
 bZAgBOkky4NBAVX7kYu4PRm8eO+LNRnuE0AqPKZ7c9wddP8sb3OGw4T
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: IGySuvkQ-irYxcs1WsoJvEk2zJd-9fWK
X-Proofpoint-GUID: IGySuvkQ-irYxcs1WsoJvEk2zJd-9fWK
X-Authority-Analysis: v=2.4 cv=f/54wuyM c=1 sm=1 tr=0 ts=6a66dba5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=E6oeNcGg-Zm19Bj38ucA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDAzOSBTYWx0ZWRfX7uiSKAmpkmxV
 ihD7FTcG4xh0lsa+dKUW26XrHkO014tYanEnv1Qkw3gzhNvp6P68hHkBYFCT63AeihUBxWkETuJ
 hW39bVaplr42x902zPahMGTMCh8Z9zsZ+s1fEjhP7+g6oeVNYl7HbuQAoPGwqp2LtY1iF/Bkynm
 FXyAmlHA9sITjvBqGD8Ulf8ZMaE3zmlSw+DKdXCES+8b3xRMxsuVpLg8Cwb6CFZv8MLbjgM3Rk0
 TznHUpJ8CUQZdEkxg3InlMdY1LjzNVNNLIO6tqTFD3XQxr571Q4gdMKsBWfBi7qotFyQPfD8zNx
 952xL9RINoGCS3ZysrrPF8jXFiLRLZGANkhk7EUyXsoyvqewkfloRlofo/fe2tw9C+d/5XSZq6l
 uvhgdzKOK0i0Cwnt9brM4VirJVDvUjrmAKcwBylekCwlQkqzCswVKDRN1QOecF63pZ6ywM/heD8
 rh/7HTM3mQJh1h/vztA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDAzOSBTYWx0ZWRfX08f2oawHWHGA
 aiQHy3UX3fQjAbc3FinffBXBH1OE+FAktXqc1AWGQJNAPgDDV9ivs8pKk9deUYFlAveNwstfqla
 bH0eHUTKJY2/xTdKanTuRUXsKwt1X2s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270039

_update_opp_table_clk() uses clk_get(dev, NULL) to acquire the
device's clock. On platforms where the perf domain device has no
Linux clock and is instead managed entirely by firmware via
devm_pm_opp_of_add_table() (through
of_genpd_add_provider_simple()/onecell()), clk_get() returns
-ENOENT. That case is treated as valid (the OPP table can still
have entries sourced from firmware), but opp_table->clk is left
holding ERR_PTR(-ENOENT) rather than being reset to NULL:

	opp_table->clk = clk_get(dev, NULL);
	ret = PTR_ERR_OR_ZERO(opp_table->clk);
	...
	if (ret == -ENOENT) {
		opp_table->clk_count = 1;
		return opp_table;   /* opp_table->clk is still ERR_PTR(-ENOENT) */
	}

Consumers that only check IS_ERR(opp_table->clk) treat this as a
valid clk and pass it straight into the clk consumer API. In
particular, dev_pm_opp_set_rate() calls
clk_round_rate(opp_table->clk, target_freq), and clk_round_rate()
only guards against a NULL clk, so it dereferences the error pointer
to read clk->exclusive_count and crashes:

  Unable to handle kernel NULL pointer dereference at virtual
  address 000000000000002e
  ...
  pc : clk_round_rate+0x3c/0x188
  ...
  Call trace:
   clk_round_rate+0x3c/0x188 (P)
   dev_pm_opp_set_rate+0x114/0x33c

Rather than teaching every clk consumer API to special-case
ERR_PTR(-ENOENT), fix it at the source: use clk_get_optional()
instead of clk_get() in _update_opp_table_clk(), which already
translates -ENOENT into a NULL clk. This documents that the clock is
genuinely optional for such devices, and keeps opp_table->clk holding
either a valid clk or NULL, never a lingering -ENOENT error pointer.
_opp_config_clk_single() is only wired up via opp_table->config_clks
when a clk was actually found, and every other opp_table->clk
consumer already tolerates NULL through the standard clk API (which
treats a NULL clk as a no-op), so no other call site needs to change.

Suggested-by: Sebastian Reichel <sre@kernel.org>
Reviewed-by: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Changes in v3:
- Added OPP framework maintainers
- Link to v2: https://patch.msgid.link/20260725-fix_ptr_check_on_clk-v2-1-7f269f7d33f3@oss.qualcomm.com

Changes in v2:
- Switched from guarding clk_round_rate() against error pointers to
  fixing the root cause in OPP core: use clk_get_optional() instead
  of clk_get() in _update_opp_table_clk(), so opp_table->clk is left
  as NULL (not ERR_PTR(-ENOENT)) when a device has no Linux clock,
  per Sebastian Reichel's review suggestion.
- Dropped the drivers/clk/clk.c change entirely.
- Link to v1: https://patch.msgid.link/20260723-fix_ptr_check_on_clk-v1-1-568a7ed87746@oss.qualcomm.com

To: konrad.dybcio@oss.qualcomm.com
To: Viresh Kumar <vireshk@kernel.org>
To: Nishanth Menon <nm@ti.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com
Cc: linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/opp/core.c | 51 ++++++++++++++++++++++++---------------------------
 1 file changed, 24 insertions(+), 27 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index b6966e509f7d..80da241d40f5 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -1591,39 +1591,36 @@ static struct opp_table *_update_opp_table_clk(struct device *dev,
 	    opp_table->clks)
 		return opp_table;
 
-	/* Find clk for the device */
-	opp_table->clk = clk_get(dev, NULL);
+	/*
+	 * There are few platforms which don't want the OPP core to manage
+	 * device's clock settings. In such cases neither the platform
+	 * provides the clks explicitly to us, nor the DT contains a valid
+	 * clk entry. The OPP nodes in DT may still contain "opp-hz" property
+	 * though, which we need to parse and allow the platform to find an
+	 * OPP based on freq later on.
+	 *
+	 * This is a simple solution to take care of such corner cases, i.e.
+	 * make the clk_count 1, which lets us allocate space for frequency
+	 * in opp->rates and also parse the entries in DT. Use
+	 * clk_get_optional() instead of clk_get() so opp_table->clk stays
+	 * NULL for such devices, instead of holding an ERR_PTR(-ENOENT) that
+	 * consumers must remember to special-case.
+	 */
+	opp_table->clk = clk_get_optional(dev, NULL);
 
 	ret = PTR_ERR_OR_ZERO(opp_table->clk);
-	if (!ret) {
-		opp_table->config_clks = _opp_config_clk_single;
-		opp_table->clk_count = 1;
-		return opp_table;
+	if (ret) {
+		dev_pm_opp_put_opp_table(opp_table);
+		dev_err_probe(dev, ret, "Couldn't find clock\n");
+		return ERR_PTR(ret);
 	}
 
-	if (ret == -ENOENT) {
-		/*
-		 * There are few platforms which don't want the OPP core to
-		 * manage device's clock settings. In such cases neither the
-		 * platform provides the clks explicitly to us, nor the DT
-		 * contains a valid clk entry. The OPP nodes in DT may still
-		 * contain "opp-hz" property though, which we need to parse and
-		 * allow the platform to find an OPP based on freq later on.
-		 *
-		 * This is a simple solution to take care of such corner cases,
-		 * i.e. make the clk_count 1, which lets us allocate space for
-		 * frequency in opp->rates and also parse the entries in DT.
-		 */
-		opp_table->clk_count = 1;
-
-		dev_dbg(dev, "%s: Couldn't find clock: %d\n", __func__, ret);
-		return opp_table;
-	}
+	if (opp_table->clk)
+		opp_table->config_clks = _opp_config_clk_single;
 
-	dev_pm_opp_put_opp_table(opp_table);
-	dev_err_probe(dev, ret, "Couldn't find clock\n");
+	opp_table->clk_count = 1;
 
-	return ERR_PTR(ret);
+	return opp_table;
 }
 
 /*

---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260723-fix_ptr_check_on_clk-603605c3e350

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

