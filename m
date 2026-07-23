Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437CF3A4F51
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 06:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784787062; cv=none; b=LoGuSKyFzM6DPbd8vgEmtP5igeXHEfjOCQkMJ/6dfadPZUCyvy4HnHhuIclNFPTRy+Qt7JZtYGaBmeIn5uosZ87BDyZ5QbbWUUjJ40wTOYa47IxZ76P3r/kGiMetyePphw95zxScp2RHpxScH0kboPwdAa4v+7iEKgLTWPlEqcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784787062; c=relaxed/simple;
	bh=hi+iIessdn39GO6b3cxvpHV44T4Gxoi0IfOLEBKfLK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=O11Eeuu7/BCP9GmXSYrh2RB+NfkZmdiZAmMGxxOLzVZBJQOjgUus9biNYob50FYpa9pDvMqk0rv7Xdb+mSwkXAHxQGGdUCSXrB/TvO0/dcArSa8I5Kc6fC16LcH00W0mGlUQ5vXn2qTVq/+P6zW74a5oU4eZEgrQaTRrkNgb2CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gZp3Pmhv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQNaZY6l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZp3Pmhv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQNaZY6l"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N6AR7s2889943
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 06:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VDNk3olTWQf/PpMcZI1NYf
	Ft9NS51XhKqKrm3cvr/O8=; b=gZp3PmhvcD9qlV8NY5tQTgMt2j5un4OqM+8wbu
	6U8VbYXe+kxaD2vYOWMxqlQspRuf98CuWbQFnJlpNbhBMAaTVX6AN+GknlUmDX1c
	owL6L6M7BgXRPL+tirJfWZxVltYMnntwvaVCvMHCrHcFtXYENLlDZFr77MlpmMi0
	YHGJEwBpw2LPJh9leLxVcFevAU3sQwQVjJlrs0n5V8FhqUbvrJFuOUSraPLtXaWz
	bYsYcfeB8PUP4G2E+5YbjrLowwTZHyTCwYLsltvqcziosBC0UMzchfhKSoin96yF
	VvGAHk/Zh+4xR1umgvBAW6D4YPxgV0/y4qf9JiL+21G209ag==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkafw0npn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 06:11:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc73f47bdcso7496025ad.3
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 23:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784787060; x=1785391860; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VDNk3olTWQf/PpMcZI1NYfFt9NS51XhKqKrm3cvr/O8=;
        b=iQNaZY6ldDoGJAie0/2kjl4cAZne5iRPmYD/TEfHIYAwKFpLsHC14IU0QhIaq5KbUn
         ftiGp9N3IvgDvpE/9/rragwXjqz4GvxfOyUSXGCd6DaC4DjxiYwP78GN4jCZmPIP4SYM
         2aBB6E7fZYejHwOVevjOnnryKOhSo6401PfbQPch2PSxlpFqupoVdeQho6HiN5nGGUFg
         f0WS/aq2j9To/NuUE5HDuKmt3bPLCPJVpg85VDiuwIK5Icr00DEamZcEGNKudsbnUGrX
         rSzGIfEXIhEQPjuZ2qAjhoMjfF4QcIlrMSijyh2ii8aTbG3hvHdYLy4dMoC5P5J27v0F
         NCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784787060; x=1785391860;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VDNk3olTWQf/PpMcZI1NYfFt9NS51XhKqKrm3cvr/O8=;
        b=b18+pMX5pNoTQYC09yeepqrk98WXJdca5vO48SQSItO7njn4jpMNr3hLqpzmz/qejS
         Y4X/09YjfH0zHN3FDcc8pH69Dg1XOwCj+rfEaMApmMjdreAKjwT73EW42/FHLxLWAz2r
         7znd2itv012+WmXnZe50oUfGZQBtlRH3FlmPqS4qZ/G3iZ4gSU5koQFx3DsJg4cRlY0v
         HWdY7NgjUWVM0ntBst0By/0NxOGi0ANx4WGJQhoIQGP8/rflQPLbUZKuuFaEhGZfn0Z8
         3Wr5jZmi7xPH8eZ49Uw+iLZIw4C2xQ13PnxJ/4NM86qJT4kEEGUuLgHZ3+c+2ZCfVvce
         7yng==
X-Forwarded-Encrypted: i=1; AHgh+RrWFLQ5i511DVgy87DTBndCo/z1+ijNQZ6HtX+m5323am4sliNI4/lDOtS1kOZ6Ly6a2eJiJ5A71fU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqfboVln0u55KI45Dpg5F8m0y0E+7zkaVCsvZHlvIRBrzL2PAn
	qyyjp7qeJ34OOYumtgg5Bbek5QqFaxniSsNjZbZclQBmxkIUonPBWB1OXqQyjfQqYvqLVuDIUkC
	vuYuWLBufUom6T6T2WI4btm9sXM7uxmHEiImzjADPnMwVRNY9RpIfWz8ac9pFeyk=
X-Gm-Gg: AR+sD116+UGDtXEUIl15fbRjt8Zxu1AaipkG/lgJVE5upUMBFlcYwdChvaVAJ9LEB++
	U1Y7HKvkOeKdnI4zk/4/yPykf65QPiHCqbes3VSLymF4xwY5uvznUCibcokIc/s9EpnbneGQVUK
	dAy8axDFQa7ekqFsgQwIt320guF7sxesqDQbGacp6fljtTLpxQFNkciuL2EyA6XmtZ+Y7iqTjCt
	oMqvk4MzrxYnqkVgaEgOv9f6Hf/UztY+zMgZ1B8lH+LU4n3Mv+rHdaddt0aqtnkJwM7An8Z7Btu
	fjfbBVk8FX+7MY2mA8VFNhxntHsttI3CGeBek96ubE1mrAgvT9CYelmzKAVg+IgZduh8O4H/th+
	54as5aMXNoNzS0SdFvWlw9VVONuNtTcd5wg==
X-Received: by 2002:a17:902:e84c:b0:2cc:9179:335 with SMTP id d9443c01a7336-2cfa6a43e6emr25063245ad.8.1784787059675;
        Wed, 22 Jul 2026 23:10:59 -0700 (PDT)
X-Received: by 2002:a17:902:e84c:b0:2cc:9179:335 with SMTP id d9443c01a7336-2cfa6a43e6emr25062925ad.8.1784787059091;
        Wed, 22 Jul 2026 23:10:59 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa9918sm26404805ad.16.2026.07.22.23.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 23:10:58 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 11:40:47 +0530
Subject: [PATCH] clk: Guard clk_round_rate() against error pointers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-fix_ptr_check_on_clk-v1-1-568a7ed87746@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGewYWoC/yXMUQqDMBBF0a3IfBuYJpiCWxEJdjrWUYmSxCKIe
 zetnwfeuwdEDsIR6uKAwF+JsviMR1kADZ3/sJJ3NmjUFp/aqF52t6bgaGCa3OIdzZOyaCxWZNh
 UCPm6Bs67f7Zpb8ftNTKlXwvO8wKlSPKDeAAAAA==
X-Change-ID: 20260723-fix_ptr_check_on_clk-603605c3e350
To: bjorn.andersson@oss.qualcomm.com,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        konrad.dybcio@oss.qualcomm.com
Cc: mukesh.savaliya@oss.qualcomm.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784787055; l=1662;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=hi+iIessdn39GO6b3cxvpHV44T4Gxoi0IfOLEBKfLK8=;
 b=rU3od/Zl5TdXy7fUfsioknOmwBM+4wD4Qg++AzZEYWXOBbqyfftzukBGTYW9DmFsWAgP9p0Na
 nYki8E00LgMDKGzjlTWJBAqtaIPhGuSCG/IPWqqndcAPHk1c5gFmeWT
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=XNkAjwhE c=1 sm=1 tr=0 ts=6a61b074 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKQlwpLLMM6cNVQtMjsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 59rU2_lIFSH3mQpzAk9dHiKEApYxnlDG
X-Proofpoint-GUID: 59rU2_lIFSH3mQpzAk9dHiKEApYxnlDG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA2MCBTYWx0ZWRfX18fH2GQVLuaR
 kalYTijGghqfz8rqla1txNn5hJsNVZyZMyxd+8VQqxBQOeunJGurUqv+uWso7Fv+PdTp5P5y4fm
 7MsPCxVgLjVHxLLeHeyU7lFZvRbxpKQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA2MCBTYWx0ZWRfX5CZ5NDzs0JBH
 Q6WlyodyXjeMSLqJOVwCAyO0w19bvKgfpdzL2JT8Elu1ARcNuAru9eiQKv6RmT9pk7k926tNgWQ
 yq/NgExDl9HqZ+3uEI0Zp+zmjk529IRoiDAyI/Yq7Dmn+MAMOotlSBBcmmFDgidrG991e9O4+75
 os611q0lhxPU05UdQ5OK50pQShpTHg25tI0mcprjBveA9R8y81rYc+BHTqEC5nBqjU3hbFepwbm
 r1c9q6GJa1WdCfiPPQbI7Lbx0y9FrZS1suaLTS8BEpuPPEOUf+H9Me1gGC/RpPPl34txwnN3sHp
 0RYmH/dY3r9y42xxZDRyYSMi1AQPlw1TSadU3ipk++sIMU6CtD91kFmleG8kANhw7NC6EoN0tJw
 +g3J4/GXGcHxRMGfpSMwjfgJf2HSwFXBsP8QN/srpvP7oD5qgrb4A2SX1PYPEVnieLwRSGU6CO5
 qiBmc8BtcY2odjyYH4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230060

clk_round_rate() only checks for a NULL clk pointer before
dereferencing it, but callers such as dev_pm_opp_set_rate() can pass
it an error pointer (e.g. ERR_PTR(-ENOENT) left behind by
clk_get() when a device has no Linux clock and is instead managed by
firmware via a genpd/OPP performance domain).

Dereferencing that error pointer to read clk->exclusive_count
crashes with an unhandled kernel NULL pointer dereference, since
ERR_PTR(-ENOENT) plus the field's offset lands on a small, unmapped
address:

  Unable to handle kernel NULL pointer dereference at virtual
  address 000000000000002e
  ...
  pc : clk_round_rate+0x3c/0x188
  ...
  Call trace:
   clk_round_rate+0x3c/0x188 (P)
   dev_pm_opp_set_rate+0x114/0x33c

Change the guard from "if (!clk)" to "if (IS_ERR_OR_NULL(clk))",
matching the pattern already used by other clk consumer API
functions such as clk_unprepare(), so an error pointer is rejected
the same way a NULL pointer is.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 048adfa86a5d..8c1ad3d10284 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1780,7 +1780,7 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
 	struct clk_rate_request req;
 	int ret;
 
-	if (!clk)
+	if (IS_ERR_OR_NULL(clk))
 		return 0;
 
 	clk_prepare_lock();

---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260723-fix_ptr_check_on_clk-603605c3e350

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

