Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2CF4B04B5
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 17:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853190; cv=none; b=N8N0uFp/SnRmuDB4dxQ4Hir+ID3pScdJ+qKcqe+/OUU+eVqyFYGVY0NBrucPI4V/J3yudOwidaFJKiK8aQBRqsW/oN6orAe45j3zgt4UHeStZkGyJdbngJoQgxrInf+Kwh4lRJ7ALgaiZbWMBI2LOk1B9RyqLbsAXXSXd3nObtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853190; c=relaxed/simple;
	bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N/SNa+23jSVY/yIMzGZ2dc4fHV5oSk1xxyo5ovKE9NjrMW2yyMi+ixVG/ki5TjlLWBN9WKO4hwT4k399wvc+ulvLzkx/wTYoxbQljG3gnuAirBOTRR+v562iTJ50fRTYseJeq8v6r54BuMZIBmEOA7S1whbE0RJG5KMbHtwa6LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mgiw19cL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dGcgK52M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mgiw19cL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dGcgK52M"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHYtV9543643
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 17:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=; b=mgiw19cLbzJcHRK7
	VwPAevQ/8uyHAndrw/snc2A7t2KInmw2k7/t1GZQLI5Uu0SxFiXzsU1Z8HGkH0ub
	cycv9V5eCxMoxfC5Cf0jpCUXs8i1uThgt+SCm1U6a3UMKWlnZKGlcgpVoqAfQHW6
	li/clZWX+3ik3xxqlm9zJh83itxcg683aGzkaaJ6AlNvlF0x35hQnaDWyd17XwOr
	GEIkEPvuUUHoq+XhI0nv+XRTtFTHfuk3csTxwuecRqaN9ap+R1tqQ64vMukLNr+l
	tU36z+SwvLHXS7vW0n7oWXZVS+xh0uggurYrejOaFxgyHdbN5xFCWKiV3sermd9e
	hirGEg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garee0pd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 17:53:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb48f41343aso1097651a12.1
        for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 10:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853188; x=1788457988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=dGcgK52M7ZGVoARJyAYUOxL4BHeX75RTACBSx8YUmK3cSBUjse1FDxTaRdIMy0kW6y
         2YTLSuQsicw4nI+5Y5jUgGAd/BJG1shY3YcfMutyzoSKbv3MMOpkULtCUoNM2jwMEEei
         Z4is5IVAzY8rmXO1D1nJLYHWWtIs2o/yFUTe9TMxgDMorlElu/7y8+pRFKvx5mN5+HFx
         kQe1GVoswWXaq94VfGljOVtPr4k0sTYwK5vsyUmsOuQW8TzPfJfqkw4Dl83mNsWTM+FB
         G8A01bEWhABrIR7fXE6h3KEFIr9ANtPpmiIgQybUTr527gPMkwdE2KWT4tFNM82ji/TK
         n9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853188; x=1788457988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=rVEGdjhnNdxgseAlECsMcvDjRQo8uwRXYNfkoSPTbpmykDVC+s5errFl7Q9Xa2ys2y
         pMPziiHCtKaPUuPtChuj/BEXcGv119nkQfhCJkaXdCmLSNbU7VoC5UMxzV9IjznFaV7d
         8g9AF2lJ7L3J9KjVyWJMuPBeCgHVgFG6HP8vmNXiSR3yc7WhfP9eqoIHS/ku7JS7KYdO
         Mj0P3kqT96aBUgrCAbnSGRlRm117ZldTdKFljfZfdshZea9uXzGn2mUmsqm2BHMWXhVJ
         Xvb0QcoCeqnYhIchiPjQ+dnsVUV9wfOiEdAy5xSglmrHZwxNMVwcXJHWynmRnypYYL9M
         vRpA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1hBwOXjNa5pkIKYHTkY1WPdS2FIqSinRuVAMr6txgPkBKY7iq2/BpbZwhmFl6LY9Dg4wdtZJmLZY=@vger.kernel.org
X-Gm-Message-State: AFuF++lHSbqOwzx7dSc63DJXR5ZdCbjiLy3GYjTlBOmkrvBqsPhT3aWA
	+2tQptpIRL9Pc2ZbHgd7GqTsg+dvikms69BONKvZAMwrfV/mvJiD2gPFOnyanX6KFOrUsvxyVX5
	23RldR5N+lDbB0MsArf4m0huU2DJko3m6vCk5mWq9Kx/uBKQsNh68nS4wePSmIKQ=
X-Gm-Gg: AR+sD13hGFfLxIqrbs/lQtnPxYd7zuUholgWmjtJWkQztwGQ80SYfQqzx0OsBG1/ZvI
	UxPXOXzTfJ60WZaX9nlKeJwlbupAWciFrxz93TWutQVpxS+Lu6fj9sN7tU/iGVxrIeKMnTBTJwH
	aDlQtaPPt3a6Oltfb1zPKCRXpNj4MPnyxg2ldcWHSsX+WdsiNv06JXqm8a7QucnzSRk5dgWZrjP
	/gsyNkuAXl65KK+7+oIbdeWJOjzPpQhX+ZJQb8VvTNuh7eFC8HY77F/ND/WdbYynpcEluUSbnNa
	CiXP4jz3s9KSyP8sVRV+2grV75GiUB07YXZkHNp55BU7pr+XLBrmRGIJeNUOkWoZMnQA8hxcaHg
	p98zZ3qyQ6YbI8nP/MplBJk9QpMBoWYpgDvaTyVaRQ1e/riwpVr3/yrAoW5x5s4E92M44MAH5Pm
	qGE8D0eYsU5i25T6qEWHWp1DQ=
X-Received: by 2002:a17:903:22c5:b0:2d7:1f17:41f8 with SMTP id d9443c01a7336-2d726b17867mr108846345ad.15.1787853187602;
        Thu, 27 Aug 2026 10:53:07 -0700 (PDT)
X-Received: by 2002:a17:903:22c5:b0:2d7:1f17:41f8 with SMTP id d9443c01a7336-2d726b17867mr108845825ad.15.1787853187160;
        Thu, 27 Aug 2026 10:53:07 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:53:06 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:16 +0530
Subject: [PATCH v5 13/15] dt-bindings: firmware: qcom,scm: Document SCM on
 Kuno SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-13-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=871;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
 b=w78Pw/hDL8SLhPCEJMXKoxFhO6U0UOpZUF5rYcwLAwMKc44iN6Fghd4LGUQo47mNIYLcxJvJo
 zAPLDw5OR5UBab9ZlI6me33T5i3eV780/WGOyOnbwyhtJdakaPzl5cE
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX+jJG8wOw9cE/
 2oS5i51lvUJd22AI3fpVps9VsGQHzQ+UeKotlpVc3jubDbBTEGUbrAybNYLztFf6e+8NaGqjohO
 gvGxJpLREXTDmdexOIRExgo1suYQPBRhznqUeXjrUxzqUdzS3F+OIbkwr/33xfU6LeI5o28UwXR
 sNbngswmmw7bNfRgMdlDzBAf3ViohG05jGHwBseyowL6IQTpQrLDpYfEJfLENGQQ5P7aBHpTb9i
 4YjGzwueDIekhm+VTz0mYiMQ4G5HgB8Yr3TWKv50Ry76FBy3ChekV/G2aLkpVAeJ6ps7daViHxD
 OfSHjDBrYq8SEwPCJfU7GfAS7WQbBSFxoW59hoY1Y/FwhGnagguSCQggTg6yNgIdI5PdwEJJsSU
 4+7d27Jbx3lBCRAnjd6/OPYczO7xWkEXK539XD1OWFJ4pFu3KBa3od0CYP15sX4ihXiAv7jTV/D
 AfnlFs8bEq5LzmJdsEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX5IpGYAw6niD6
 4UT1S7oRNyyCSRuQyQRr2+laggXJF2V0kESVpT16SI9m/2I7rDtGInkLJVU4zq6Qx0pmmvIXYiF
 2bRnzvcF+ksEK/4EYbEA/4FMsh7KxKI=
X-Proofpoint-ORIG-GUID: RCqqYu8JeWQE2sRnPGsei52ZIQD1Cy_Y
X-Proofpoint-GUID: RCqqYu8JeWQE2sRnPGsei52ZIQD1Cy_Y
X-Authority-Analysis: v=2.4 cv=e8E2j6p/ c=1 sm=1 tr=0 ts=6a907984 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=M4Tw70yJP9P6qS8g1QAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151

Document the SCM firmware interface found on the Qualcomm Kuno SoC.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f718..ecee5aef65a7 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,scm-ipq9574
           - qcom,scm-ipq9650
           - qcom,scm-kaanapali
+          - qcom,scm-kuno
           - qcom,scm-maili
           - qcom,scm-mdm9607
           - qcom,scm-milos

-- 
2.43.0

