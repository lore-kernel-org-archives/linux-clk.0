Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D14839D6FA
	for <linux-clk@vger.kernel.org>; Tue,  5 May 2026 15:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995445; cv=none; b=T7FkjOIwYKoG72IIk7fvlo7RTNOWTMJsE67xn4/b5edxMFiYY+nFeJJ+eaQ7zasqJ3oKeTn8OgkjvWdgCU40DJQmLncN5BD9oFLjhveOqFQwqFWXTJZv71a5iEETf6wD+GHpYB8p02/tj++bMfUs58gkILqmIuZSczTaDp0sQIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995445; c=relaxed/simple;
	bh=Y8wFckoK7TOel4C6zawYi8+9/+CHXFWPohzFYsuL/5M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DuezK1+8Bgxypy5t3kFnNEvoRHWWD4DP5o50Bo3/56j7V9CmhK8iWcCxUBaC84+3zOt9YUbjeSUDyS2ctfd+hk4uHNxfDEPHd8Km9pCGgqmvT/abzS2iqNCarXKBHyNiZ5v9ekrlDsF3FUTLNSaTTop8Hst/QSp6dIVnTCPZpsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lLjZqamn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VgFPaiUp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLjZqamn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VgFPaiUp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645F4ga63409253
	for <linux-clk@vger.kernel.org>; Tue, 5 May 2026 15:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sj2ImC8vzJGHf39H6sT6DlniZJhgy59BgKM
	TAr/2SrU=; b=lLjZqamnNyFaTR6GvFU6fnf65+pLgdtTV87dGQTt6nIqEiDaWJd
	ioYi+4S6wD9yt+/Ceu6/MGMz9x8fDYfgtbdALEimr99nB118tKLcMQ7N99PjaucV
	xZYB0CiFwIpsl6p8vZ04VCnGsNZID412RlmP/eDUzncWb5Kk4rZfQFFoMttrPLEj
	EOLKDNLNsTFXBwKaEdsL3cusHp7gBFuHrrlwKsFQDK6/PiZThhhtr4pDm4h9eUg3
	wsBDmLukFw14gwU7/zU0KqSduMpwSIVEtIFEaDPKLSlL7KCM1WSo3AROZsyvmCk7
	NhT5QmKRHGVI6PPMfQVcl1RNOo7VBuRiTyA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx00vtc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 15:37:22 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56ae34d6738so10413271e0c.3
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 08:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777995442; x=1778600242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sj2ImC8vzJGHf39H6sT6DlniZJhgy59BgKMTAr/2SrU=;
        b=VgFPaiUprVLJS9PBxXGpKBwiWi/fYUnKPg74GHSJPtOpx+NoKnW1hr5Hk04UiX8fK2
         jrvIgIdIJitSSh3qeFOFH4N1aeaFK1CCNlhM/2/UGXDCwKeHWFCG8KGKoevG2wU7DTFO
         fPgnfNli6laTxkf1qQLvAvutr5jWRZ1DkGaKcqfFzGs+mWr/QefWMVJuC8r2dBcsEOjF
         LFLmIdnnwyDtYEFw2sCZd1MbMXtueKlHrfpGlqed8CrTH0yjKQNDQc9e/YicI/ZNDhly
         BMdcXHQKlXXmn10os9Ck2XNlz91ws90equpo/Y5BW63SPGnk4vqqBL0qs7vj94gGaBWy
         FLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777995442; x=1778600242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sj2ImC8vzJGHf39H6sT6DlniZJhgy59BgKMTAr/2SrU=;
        b=TGUZZbllHMUjuleg1l0Yrlo8HZLs66jFWSswbLzXBsliL76J+IJjmW1qyzFnJ9+EXA
         E2PWHWVrSt9d2+NGP8PokBICaByldRummXyM9HXy7FZAb2eNKoD023v8Q5MFbGr/xLCE
         2j8ojrJCU4XL7IdoIXc0L6ABA29NNjRgsUVdKCcGpvVqdrh7iY7Ac4MbybaLKLBjVVKg
         85PRaZCNB0CE1BGSoa4MGQvReukuR7fEhDyAqo748O2E7zlPlLSf9/cFExJTP9VnQFJA
         vPcDJrt2QopKZgxQyBNT5lQe+hLBbtFkaOu0IkEpZGykN242hXAUb6bxSd+BF3C6cHpK
         r1og==
X-Forwarded-Encrypted: i=1; AFNElJ9Z08p2L35neAB9QcCDIqjJ7X2r9nW0FuQU0m7tWwUoxZofVBUHYoUwPYDXQ6ltlsVIUJ5Qf77DkII=@vger.kernel.org
X-Gm-Message-State: AOJu0YydKPw1e+x2qmZCsgXjEX+HrRijz1sHK0FIhQf1Ue2tTsnqe63d
	F11UYetvqJ9gROubDxep0VgFezS/KLhHCE/oa7gthfBgnZwoFH6b+reUHC3T2PnwjraP7eqAM0s
	nhWkGxyCT7KdAvBQt4gUwiNFTJJSzBal1cmWYKeGvtGZ31FwDdUzgHGJodCm87fs=
X-Gm-Gg: AeBDiet5GWV7YSSmOOkxeWVgzZksYVFedTF/hoEhFJRkm6AZKwcurQMb6vbpZoageJ0
	nr2yi7OzZuHPxkkI8hJ+f6TZPmzjbqcWRP5L7Iw/gF0eojbXkTipFF4sO9BoQtW0jFruqOyo9ce
	HaXmHzW3Qlk055jpCiL+HuyGwy+X668Dc4TCtEhedYg4x+fSpbVKGr9yn6ohMvLgHBmGxpL5Gzd
	XSqQIFNTumJKKikWCGcwnNEiN1M7Kxhmp3+2TFiHCKqc9UQi4rpl87yE+l8MtRt3nXCXZJOJrGi
	sHclmiJaQk3M3PPEH7yunPQGiiDylRVZGheHb8gGHZTGMICLOCDx74452kyd12rvv6+rZYS9ytk
	G0nDs4leOamWWvB426PixQJbNOKPAydEjecNLYV1s8s9V2Ig=
X-Received: by 2002:a05:6122:298c:b0:56a:ef51:4cae with SMTP id 71dfb90a1353d-5750c562655mr7381061e0c.4.1777995442383;
        Tue, 05 May 2026 08:37:22 -0700 (PDT)
X-Received: by 2002:a05:6122:298c:b0:56a:ef51:4cae with SMTP id 71dfb90a1353d-5750c562655mr7380992e0c.4.1777995441944;
        Tue, 05 May 2026 08:37:21 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb69800sm351141845e9.2.2026.05.05.08.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 08:37:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [RFT PATCH] clk: qcom: dispcc-glymur: Fix (possibly) dumping regmap
Date: Tue,  5 May 2026 17:37:18 +0200
Message-ID: <20260505153717.303414-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=961; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Y8wFckoK7TOel4C6zawYi8+9/+CHXFWPohzFYsuL/5M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+g6uNcG/zL7V7jpw0+Q79/UyHf7VmJgGcactc
 LT3egAAv0yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafoOrgAKCRDBN2bmhouD
 1wmND/9gPF4p8EX6Nz0/ZcmRz4gDWzCJ+ExajwwFb0e1SMowg9UwOHz+VCstN+e/xnfR0JvafB+
 jI3b+ppF8Og1CCCWJKTvCWiJpDGgNrgIUVPcQZIdH2gMndLt5fImsaOCNi0+IvJBPHkrFh9KOxj
 FMsiBylYByjmnrob/pEu2yD+fKGxNCN3v3kM3ZT8nGWnCyCvSyfys7XFvD509jGRYGszO1PTk0L
 TmwpuxNDex9ARm7COzCMa8PSvYIO0/HGok0Df4h1hCYAM0dO+DetLmU9UQyfc4HzTLOvpRAuCQM
 2YC95fL8lhVQCkEJ2ip4sLFB2N2L0YDsrom6J0ec21u/LSv5R4vo9MvWRZhPOOms9OTsXLvc5zh
 CXkme/MK6AQPJNunVEqCkg1T4sGATcndDyoJTBTiYjlrHig6P0BYRGeAmb4nCcB83NcwljxvbEa
 61eZMGcWevdwJTwy/8OD3WfcTP2oS3Abk4A6hJsDlbWyiUMsOcgECamBMNSPQadpf3W60hTvK9X
 qBNoUk4g/3WyzTlcaMifB/eogZK6lw2mY1e4fPo3rKxrHgVyYgfZyp4QBgrPWOp1UdlJwerESME
 Yojt5BHUbfgun3DdV15+qKVR2YiWVsBL4VG18St4hZfOnk5dJ5TRdemj18VmQct/px7ICQoTRTj rzikSRHxMJ3Lovw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=APflyhIR c=1 sm=1 tr=0 ts=69fa0eb2 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=-rrMuzNktfTFCj7_FjEA:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE1MCBTYWx0ZWRfX4g3jdL68QLM+
 RE9TfSaL8jXcIPprHMrnlq1/ppbB7nCUu46uLTRFOA8LNfDcPbZJtqzagMoTsPyHHqSHOSfHQ8M
 2l8aGatmQXCDzOKvSv1OVVRtZJFhqSQQHMdwKUIQ/Vpg3vpk+33RESoW9tB3E9FhGeCDyhYtP4H
 4JEjpL/fbc4HiOmOhL5C5SMs05uHYByrrzYRWulCNS+otVOa9uD9XrV+fEz3rrlxNbYxAA1jwUe
 bZtz039WLbjxi78+hRac3m3DXmf5Ll2eeWubfMB76AeSBVne2YNKd0uxlb7E0O199jpfdNAQjpp
 16ivQZfRuKXqT1i2tuMUYZMsFKpahYd5a0sCxRrwj4ZI8KAAAol2T4JgXLS6pxEXruX1QBBCs8D
 VQhzGbxIy7SfdjISj94QY1R8SxDDn/7/vP4A75XBashaSCkxlPU/5XXc/p39+gkP4aSgRMohmnu
 G5a81TXqQZmpC3dWbqg==
X-Proofpoint-GUID: wIUjUh2euBxwQuN9OisSr4EkBRGK7KNg
X-Proofpoint-ORIG-GUID: wIUjUh2euBxwQuN9OisSr4EkBRGK7KNg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050150

Reading few registers at the end of the block (e.g. 0x10000) might
result in synchronous external abort, so limit the regmap to the last
readable register which allows dumping the regs for debugging.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Register map is the same as for x1e80100 and sm8750, so I am guessing
same problem.
---
 drivers/clk/qcom/dispcc-glymur.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-glymur.c b/drivers/clk/qcom/dispcc-glymur.c
index c4bb328d432f..412b92e227d6 100644
--- a/drivers/clk/qcom/dispcc-glymur.c
+++ b/drivers/clk/qcom/dispcc-glymur.c
@@ -1930,7 +1930,7 @@ static const struct regmap_config disp_cc_glymur_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.max_register = 0x11014,
+	.max_register = 0xf004, /* 0x10000 and maybe others are for TZ */
 	.fast_io = true,
 };
 
-- 
2.51.0

