Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E450434FF54
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702603; cv=none; b=l2SAmVMCqg9OUMVLRKKOw6K66IPDLBmQ3zAM+uk+5I9CHbeEDPzrdiVu2lv/zzeAYkYA1a19CC4DP4+TYhYSO1qAbMmtSw58LhJdlaFYlEcJpQmYz9MoV363pjX0BYXJYp+v+AmcLo/YImjNBMK242AiesH2/1AElEvfTva/f60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702603; c=relaxed/simple;
	bh=SOdAbNbt21HBHcLgJoaj2a6ESEJpE6twEKBKVpgML6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bCrkck740uHrpGha8ugzMAVDMndmt19ZpYpMqXTHO13b5RZTNyn2n8Rd7y4aV4/WlGPeKW5EDmIOpuHMf/uor9mhlSopykeHnb2Jkc+KAIV/lyQZySYRCnqjL4FpakTwcpyHthIKMYi5KnmkjQRnpqoAUBrL7LZK8LwoixrwLvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYfjFUWc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBc9BT3V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYfjFUWc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBc9BT3V"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KAvS7j3015242
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:30:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VSG/MswqxcAVwAMltE+fM34VppJcZ2LRqFDVhbD1xqs=; b=kYfjFUWcXVNCQPSa
	+iLfrmUkR1dMRE03sI6eI79Q/38AIICcU+g54FnGQlVOyJfYi+tAmAicTD0H+FJ6
	/oIDpcKZx7Oig3XewfxoWi68ZQ900+Ji6nRNXsRB6BbaextyVWEij6sIxsB/nrUe
	RDs+sWhUNUjNbK+n7zcyWizvOhsz3tork9cPqXkRXWOSwD1C7Usp6KT5DobxRQgN
	n4qGzON+IFzo4xthHP6RmWdG8iMKz5IojAtgOpcDZF7CoTiV1vrvkyM9/PE5i8A5
	kpbXAHUyMnunHcXGT5oPEg1LX+PHVNEiURWLMcIqtScmQtBiM/FdNQhTd/MNDQjt
	PcjksA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnjuks7n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:30:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f74f0e3c6so2176177b3a.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 09:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702600; x=1777307400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VSG/MswqxcAVwAMltE+fM34VppJcZ2LRqFDVhbD1xqs=;
        b=HBc9BT3V0mcmjTtDj2CMW+JhTa1Ksf9FJZsDHNKo2FQM62HQeI4zEoYivFHjQspOyQ
         MhQG4y8ad/njQ974ahpTBVnhV14hd7i4dpT7T47t3IlLRtNz7k3bAwkPlX0vRfl5gIUT
         z+4M2xewytUUDxiz9Vv4DikNo2ltAc7xLV9w0sVT9dcVIfpnoXGzkLzFWjaBpOI0nChd
         8QxGWFj7Qb6jjnMwdPkHx9rUabHRuDqmTClaw0xIm1OVZkM4Jvpprk0YAIe1HVIT49K9
         0aJrlrn45I3KSWc5ppZvxinkJ484NX6MENBbluoDgtdFQdCZT0kUP6W4nUUdipOos5bE
         qHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702600; x=1777307400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VSG/MswqxcAVwAMltE+fM34VppJcZ2LRqFDVhbD1xqs=;
        b=FAf4dgjn7BoVipnWE4kbx2/9hjNDi6sd7+wZzmiSEtgj+trbwYSTjAwNzoAGdMpzEa
         CpS0yLUa1MLSjRuSADkBegZiaHMUNIuPH2HD5kXF9m+6P2vnY4n5KXdBgidsTXvHzRFK
         ahAYvCJMyM3pvjxNZzfmdyPoDlt2PtpG+r1K9KOYxzZE0SKoSEJ+Gj+ndFKrZ5JfhJs0
         pj0B+bisaiUMBB5kdcx2/w27hY9eCZ4Gz5xL5UpJ46cm5KgaC/LcQNawo6Y3D9tZnSZg
         oJadInwInWKY6HxBzMY/GQoAIDHSRSG+YnryNR01YMzCjpsVKvRNgO0qHe/f3NYRXdGh
         ubUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9eN33DVk5DRsonPdxaRTAJyYA2vKjg649LN9t48JfMay7JWBhiXeVluTrtew+ewXDHY4+MKJ2QIG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxVTiauUBEwgAM9rM5/q/7SLSUhQbtBzF71mfwIm/5Bko3tE6k
	L81NVJOB+E1tWpwugz70VaSPZzQD/L7TnCIhnioCKfC7/EJ12ZS/JYOc5/t8jgVX0TgCh7H9bWD
	GZ5n7Go5zwqHRVd9g2uZWowPJf6ZyYWgz54DfSRlpEHWFEV5drfZVM6HwnI9wwf4=
X-Gm-Gg: AeBDietz7BNXWMcm54yGUf8RdIo4c+akzisYG0vVfQ/KoLRFFVTifZ3NmH4Mhl7ZnSe
	jbLka9fWsAFKeJnwWKxveSoBRAXJX5D+Q0l4O2TAnWbMa3pKvP/8rsHgsQpEB06dvLHsDWEPT8F
	hrmzNd3dNywVw6MWvZPer9b7neFhCnygyYq/I6LdQP9Jtz/xcfw77oXXQ2KrVwu3Nqynw+dJdbG
	aB0P4l43pmWSzjr/aGQSxSRcxSj1abjsJmqG3RzSGv3me6EXpubsXUEwXrncgIw12895ISjQSC9
	tVewmFvBiXshdgDgw70xqfzUl9NK/gzoSm7j1sNVJ1Ctzuuatj8DBNp6P8Ha7HipyiFpweGDWa1
	hEY5B+uxcsjwhvSngR2U32ySo+7IJ8KXbX8NV74tdhQpTfVHW5vkSjgtXZaTiJUY=
X-Received: by 2002:a05:6a00:bb84:b0:82f:1d38:f693 with SMTP id d2e1a72fcca58-82f8c8e0f98mr14014201b3a.35.1776702599876;
        Mon, 20 Apr 2026 09:29:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:bb84:b0:82f:1d38:f693 with SMTP id d2e1a72fcca58-82f8c8e0f98mr14014174b3a.35.1776702599334;
        Mon, 20 Apr 2026 09:29:59 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:29:58 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:58:56 +0530
Subject: [PATCH 03/13] dt-bindings: mfd: syscon: Add qcom,crmc-syscon
 compatible
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cesta-sm870-dispcc-v1-3-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: lD9ge_6udIxlP5kDvKOMVpErVYPzq7gq
X-Proofpoint-ORIG-GUID: lD9ge_6udIxlP5kDvKOMVpErVYPzq7gq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfX5oHQr44Bllar
 2fFbq75mdhiJfMwPtxX+8FAZJFBpd1dzGkGZuBXiZnxHStW3hkDYusUoPjsuGQtKgYz6ZIEb3rm
 qpCy/t8ZmPQK2kWaJ7H06GIh52zku7PADzqFh/YQQmMCok3mYUbuKsiWpNycY/h15aoqoFFr+W6
 RPAWOngXCOVYt6OCxu/ro59UZ2zVYQLZtdV5USgpa4VFp5rpzOQNcb4JjFDwflrP4jJzJ4FcsGW
 F+G2Tny5UghHEmBc6e8IJI9HqpwjPQFVHYyHR9xEYotZFZbgTmP0EGCeZI38/oEE6cDSr6L8p99
 twfDkB6857g/f+b0l1tz102hF2vcueF8CdbX+hoPHMSkK7ZOk38tqDVEZrJcBv+5tFcMowznlVz
 f+e5EVXgM/floNdWEFIeGV0kUHN/bKpntjPAvspN7ejfcWIFa9q6ibGYMhpRRxUGpk4vFy/QtZA
 ebfbWvAuBhMimz7F+lw==
X-Authority-Analysis: v=2.4 cv=WuUb99fv c=1 sm=1 tr=0 ts=69e65488 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Gjla_oY5Z_Fy-GYXBTcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200159

Document the qcom,crmc-syscon compatible for the CRMC
(CESTA Resource Manager Clock) syscon device. This syscon
provides access to the frequency lookup tables provided by
CRM (CESTA Resource Manager) for clocks controlled by CESTA
hardware, so the SW frequency tables of these clocks can be
populated from this data.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index e228670880631429836b542ea5d40100b73d69e1..231e30144a5f3704eacf3387187cebde39c7148d 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -107,6 +107,7 @@ select:
           - nxp,s32g3-gpr
           - qcom,apq8064-mmss-sfpb
           - qcom,apq8064-sps-sic
+          - qcom,crmc-syscon
           - rockchip,px30-qos
           - rockchip,rk3036-qos
           - rockchip,rk3066-qos
@@ -221,6 +222,7 @@ properties:
               - nxp,s32g3-gpr
               - qcom,apq8064-mmss-sfpb
               - qcom,apq8064-sps-sic
+              - qcom,crmc-syscon
               - rockchip,px30-qos
               - rockchip,rk3036-qos
               - rockchip,rk3066-qos

-- 
2.34.1

