Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51BA339386
	for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 18:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785004119; cv=none; b=Nc948S6fhB+ml+n+n6hSmNrHy75wqK743cbtpSEUOBLsvlhjLAwAvZEWb0KCqhALtmJycWdasXiKnEfG8eAy0EO4po0XcqFqdDXNx888Xyz21qf1wM2z7zXGAxgwd13q9plhkXX/m4a18D5tqI0/vBgk8/E5vLoUI+0jGKjXpxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785004119; c=relaxed/simple;
	bh=DlCAVnvkr3oHfN9NUk9UsHXGIHD6H4JonvSs97CXKhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PoqJ3AHjXpMMA+fOVHUiOyEJSBKtoszvZlpGmIxKnZmU/gAj3Gys5VpHckO/JHi4iJ3vY6Ih4F9hcxoeh85kgWL9ocEvFv+E+mPPXtlKwxFg7RhVXBu4SHNFm+mRNUurCMNVxpOow3A442Pdbd4RjXJpiTxR/iiTzBfiMnrXtOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RY+OVvmT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HMJXC4LL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RY+OVvmT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HMJXC4LL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66PGvC0v1974796
	for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 18:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VXGNutlPaOARZCU8bMgBHH
	FG88vZd9/1iYFKllAzQtY=; b=RY+OVvmT9kO3/akf93uGO0qNGWbrdYwuf70zbB
	P1o18BwKi7oDFMBxH+h4+SwB7hxZbswJ3zDTy5MeagxQKMkwXD+WjwGdo82veKCc
	ntTDj900dukpvqJoa2i2eL3qjNKNFuhxnbQ3ePcJ4pQDXd7r2HridFp5NM0i+5VM
	pEiwJHMoJUdtlIp97G+vY3+CwNEnynIUi0dXCwirZOgptZKEtd4Lco7zn7YFd7xU
	pliG46hC0HIKm1NxzO4KCflWbZmKNplaVVxiaH5bw/WwXgCOPakEktKlaD+MAjyf
	A9neCFoR14kjbgVgebGQSxU7dSidcDNGxl7X1yQ4YjO5vb/A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajh9s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 18:28:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee894b3d8so2419525ad.2
        for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 11:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785004116; x=1785608916; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VXGNutlPaOARZCU8bMgBHHFG88vZd9/1iYFKllAzQtY=;
        b=HMJXC4LLCOpKiW63CnlMJAf6N4Qwkex60mcGa1qyoSsX+/B8Bh2kVx+Q/FcRcwGILv
         ALs5cJ+IcgW4ulk3RPSe/X3Kcyt/uNjWeQk4aGmQv7QuF9sBOWLfBWFaesIJYHgMcBmN
         9oeU1nKp/6PWhckHje5xzcvD2gQfdpJFES0gIjWRY1+CrgcmYJvn4NWghVXJbAIRYUZc
         3pvvWzRmWNFiayD8yxCU0+BvyUeNp2k6RaeHL3lnQikImNVoJKazUefkfiPftrckjPaO
         nS14PvibNFv0EELIae3trztkeMYJ8cOVqKiGBv6O5iY8P2nVrcThZpmWJC4mKEGU1sPe
         vq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785004116; x=1785608916;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VXGNutlPaOARZCU8bMgBHHFG88vZd9/1iYFKllAzQtY=;
        b=PRfwXg9d6ZOzT0uKpIAq5ygYYe7CQIkxU0P1waLHkoux+/USjTHmTIh9RmPT1szwiI
         53WF4ZMbv/LXBHxzMSD10tR7L7QSzdkgdE4u9YM+E5iMrs7CLVHV1/q1jjT76xuGHnOg
         WTOjR3PSsT8Un6BzjCXzSz1pvh2AT1tchUzAoc0du8JAQioYFV/u++cPTzEu31SU2H2e
         jI1Cikwbr2wuyfgabx8vKAqakgqGSgZhbdgoTuvcZDziUInvtE2+zTVB9Qmd6T0YRuJp
         zef0RzAQGsEXuJVsYebbppIMou96T5dPv80k2lMvemjr+FrqdaVMfgl7UeEECioN8J/f
         KB6Q==
X-Forwarded-Encrypted: i=1; AHgh+RpIMfpEHVb39comI748u5q5UpF1Mu1A1JMQ5RSVZSEpvnJhUGdb7DeHnB/26jzNLAe16coldu4/nFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy4LIrjkUYiLg9pvlP1jeCaJ/NZPLe3qsZG/sr4PDUqL4xaJXz
	tDdb07kfUdNXxH5cQBy7o5ug87nttgWPSKoJe172VTynGOTuon853dyvFrfn+tvh6ft2QDcx2LE
	rUDrJu3L3H3OBpokfgris6hjymbxA61uNAQy2e5ltLlkaYqeZRzRm69kZlrR0tmk=
X-Gm-Gg: AR+sD11FusXCVbQGROX0sn/h3YtiK0DWcVzOSLPSrsEiVORx4Fg6BivzZDCDdPnqiee
	RYTvnxS+m5qulu2E4JEWblMDiOv9TrurRP9uxJ5ed3NbLdAQhthAg/FIp6v5eFF/cyp6zwdxLfG
	qxCBCcDTqpdUYAvvk3eAicUMOhyCbVGopnNHOU8N0ymd1BTICbOjXERT3FJhU8+Yfw/zQzP/ont
	kLGFxAsltGFHLRENHb5QInhSqBlJoghCDObW2i6/IoK6/mhM0r7xEU3uYFzhOqOXlt9fZ1Xz/CB
	wcjzDC4XlcYCA5plCmZiJ4hfDtQlTmSqYa+ZHnOLgE03R4QTtnnpwtkB4q8ucYgtnxb/l2uKg6Y
	pb2KKy3mK/P+jkcNxJHYWiFGoGrqQYh8wmQ==
X-Received: by 2002:a17:903:2342:b0:2cf:7f6b:8c8a with SMTP id d9443c01a7336-2cfde85f46cmr27193235ad.30.1785004116155;
        Sat, 25 Jul 2026 11:28:36 -0700 (PDT)
X-Received: by 2002:a17:903:2342:b0:2cf:7f6b:8c8a with SMTP id d9443c01a7336-2cfde85f46cmr27193005ad.30.1785004115592;
        Sat, 25 Jul 2026 11:28:35 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e1290sm13408919eec.1.2026.07.25.11.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 11:28:35 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Sat, 25 Jul 2026 23:58:22 +0530
Subject: [PATCH v2] opp: Use clk_get_optional() to avoid leaving
 opp_table->clk as an error pointer
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-fix_ptr_check_on_clk-v2-1-7f269f7d33f3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEUAZWoC/4WNQQ6CMBREr0L+2pLSSktceQ9DGvx8pSIUWyAaw
 t0teAA3k7zkzcwCgbylAKdkAU+zDdb1EcQhAWyq/k7M1pFBcKG4FpLd7NsMozfYELbG9QafLVN
 cKp6jJJlziNXBU/T22Uv54zBdH4TjtrUZjQ2j85/9d84278/FnLGM5aqoNNWF1kd1diGkr6l6o
 uu6NAaU67p+ARbudCDRAAAA
X-Change-ID: 20260723-fix_ptr_check_on_clk-603605c3e350
To: bjorn.andersson@oss.qualcomm.com,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        konrad.dybcio@oss.qualcomm.com
Cc: mukesh.savaliya@oss.qualcomm.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, chandana.chiluveru@oss.qualcomm.com,
        Sebastian Reichel <sre@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785004111; l=5423;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=DlCAVnvkr3oHfN9NUk9UsHXGIHD6H4JonvSs97CXKhc=;
 b=S6o90VekCzYvYFTAYhPU3EEQ4BJ7ISbw68RNzuIJAGc0sPed71rMx78x+4BV87vAV4ol2QfJB
 zPI5TtEhfiUCVKjaIfg5rVoW//WYpIzCGY+5qqQy66erRovufDpnS5s
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: wW6adGN17_Ee305EwUQIwDK-DjzceDH0
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a650054 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=E6oeNcGg-Zm19Bj38ucA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: wW6adGN17_Ee305EwUQIwDK-DjzceDH0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI1MDE3NSBTYWx0ZWRfX+mGrFpuVEpim
 TNyX4puh4JNpz7FJHLdUyNjteNIXOvwdjgjDhS+X7bXlNq7knq02zHU1T61SeN14xuBtr0iTiDU
 yH6cVKa+0dL/7Zi2PO4vMqYlhg0Y0GDNRHBwdA+RmCkRpOltKinmOJcmg2XZpOq/uF94+uPOoON
 54o+2hkj5cLZARpAsR6Cwzx+Lz0x2Edc8kum8y3SUYhP//DzANTVjvnOArWVgWgbb1905t9GPXP
 TQBwf2owi9LHR2TN6Bzvj319v0WtO9YvfWN6BNc/8tRTiNOq+u6WEmbi0aQ54uQ7ff8xdYeo9ah
 Miqlfxnec7oGA+NcsgfPuq3/vS0m2Xpw8OtTJ9ChEBwg7YOStdSsKVnqb2HBqgyi7mOni3p0G3I
 wycvpSDo2GWbRjnsxI4z3bYhUwxTCt72jYTivo2wHDSOGj1zzS8YY3UrJvt59EVM5srczFBibDM
 iA068FOeluUfizfN/Uw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI1MDE3NSBTYWx0ZWRfX2MLwosfqPYxP
 r4CDXI7DwhFXsGMgoytrvZOI9eiXBtOFHFQ7a9lTaPBC+FnmKZDQO6MVoi9KZZXJ4YaRqBTjBOF
 2KXg+X68MrvXYtVBq7s9mmAcoxlIlrQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-25_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607250175

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
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Changes in v2:
- Switched from guarding clk_round_rate() against error pointers to
  fixing the root cause in OPP core: use clk_get_optional() instead
  of clk_get() in _update_opp_table_clk(), so opp_table->clk is left
  as NULL (not ERR_PTR(-ENOENT)) when a device has no Linux clock,
  per Sebastian Reichel's review suggestion.
- Dropped the drivers/clk/clk.c change entirely.
- Link to v1: https://patch.msgid.link/20260723-fix_ptr_check_on_clk-v1-1-568a7ed87746@oss.qualcomm.com
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

