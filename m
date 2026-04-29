Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D33F3EF66D
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 10:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459933; cv=none; b=D9DWFQ295yL18fhFHV/y620FrC6CJ0/MqRi5Yu9gQ+XP8ZNPNEf3YAaKvCDQIrfm6tjXINMYKV4FlcDcKPTBfd07uv4sWM63fmeJBpamk67LPAG+DVslJdksHQwcLLnatXJmR4Z3nR89F+bpxGKK+K2y4ZfIKXqp2pZ711h+wXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459933; c=relaxed/simple;
	bh=oc0BUGs7hxS62BzdR38BKFZMTtbi6X5LksJcvy7Q96Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mJLX8poUZ7qOO6qu01GBhncrQYPM4AnIgqZTOrPNqVEcfE1Uqk/A1xmQWhZ0ODwqFsHb1tsovhne5mTp/j6/NttrugIwh6FYd5WIYDCde42SzxV7v1CePkkM5iC5s3hmSzQU2f4ijraz9kOhQTdPM+rEUJLcy4QURA83WmQp1nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5ZipRlX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cG4e4vzn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5ZipRlX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cG4e4vzn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pvlB4001936
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 10:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U7L4L1oR9Ld6c0Aq902NuNggR2GtSSCW13PbHPuvGbI=; b=o5ZipRlX27n56NGC
	DVsDVd6fOKpSkNvWWuJ7eHNaCFX34RFJhjGjYCqRMReuBnGo1CPC9H2MF0KBN/aZ
	JaIeuSLvhmmXlkOTenPBcPHmSJknxFQmGpyoupI1bK8lwEuPCLV+TNBga4u/pieG
	S56BUHGfS7DE2xhUKfPdvN18vnByQX/XovjsYcyY3Yx4RC3ga9bBDwvOYKQ6qyNf
	VoSy+7mosFI6ZrmdBJ2mcYPcD8T/WvxMpghgAAIKCY7HzwnymeDwzSqK3a9I3dkg
	OD6kiHY1vTpVoQX+O/Ocm9NoeDGyJVntjVFd54keW6lzmthEd7Lt9AN+YseP7xLT
	Srezfg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du9em1u2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 10:52:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b458add85aso31983015ad.2
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 03:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777459930; x=1778064730; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7L4L1oR9Ld6c0Aq902NuNggR2GtSSCW13PbHPuvGbI=;
        b=cG4e4vzniMcrxjx4N6f5owOAqodrvehembO/4JHjIjmsguG12hEhrQHxdxO9xWud4D
         Yz7in4UeY1sO/9896Z4YVYlrMGd86KIjYWPoUl9h3CfuU+S40LoldcsDB/5eCU4uo1zn
         y+egCyGaJyKfFDspD6BJHCGBRxT4i8cqUPvsw2uH7BXy79ZxZdzFf46hPzSMCDaNBB3o
         mj09zbSVAuRA9eTaigv4dfGK6MhFyjcL3YGGSHDmSwV+Po25Q/Ru+XVxHEqqRe/i1Dgw
         47c+fKokR1JNKT+WVrGHyi4dTpiOEtyIAyz3978S9GkNbwGTRuOObW4U/keMYQza0GFh
         c21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777459930; x=1778064730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U7L4L1oR9Ld6c0Aq902NuNggR2GtSSCW13PbHPuvGbI=;
        b=fQM0jpuoVGoaI09dUnGa1rlAAVMkFuS2vjMoN1SsPE8rIsosBHvRvapJWIICmUlMYw
         TaOdsQLbl1G+9Fx5VleJNRELkO3wZU467mIyarVF8iu+12GbQ0hyJ4hhapm0JRcWmTZ3
         Dv3VyJXA3aHJeoJXCkA82VJFDIi7AjqLx0ym8gOrZ0oTJdT/TuWGqcw39uMbjrx2EVjF
         c4mh30lsRLuwDLiC4wRcduOb036kp+VlQhUCpFOfgcCtaH/EV6+a4sE+oXRO4v0oksfQ
         jegeemGHQJIFgiU0XO7nfAAtXnsRRHK8umRFyxRApTkBIff2LXcOiL+IXKJzyD06aCab
         s6gg==
X-Forwarded-Encrypted: i=1; AFNElJ9JTB+eGAyUaihOwUu5tcJJ+bpvdUz7hXIQ9HPVQWcnAfIE1gdDH4eEC7FAL5hadFe7+u8J4Xw1AXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWVQ5o20UDKV9b0kqcUTlVjCsa6pqj+Y/dwFF4Csdiqkxv/OD1
	joMjeisNLSs7ZXg5iCA1xYyJ84QKGyfkkUHkwaamYN7GvKZgoohZ+c+/br5TOP9/uPjCwOXJDgg
	LkgkQFfSprewQLFgUY1dQ1NKc3XlTEG87upnSo5ru8jvSS/LLWZyRhNFOlYbZVhI=
X-Gm-Gg: AeBDievkXQKURFzJKsXTvvSCYQQwJRKc9WVsx4ExGXHP2SvOqwdKQqbPaMfXQG556It
	RGNRB6ksXaTissdRoYMXX8K5Ma29S6u05MgTIAH9RQ8bRd1PMl1m9O8kxxV/Qvd63NuxKa7INOH
	rzAry3zEmhJ5/dN+SLnF6JxKibClH5Vdur5fdIg5opb+2JzTGTTZRBo3LvbCpEN4qKb1yGJUrJ8
	XfhIYNiPw2nkVkh33rur52EQ3oqZf436Moxxo16Gmq4kTKop5CedRGIgTkZ4IpMW4sRgGMd9U+a
	QaETM/zzRQdz2oafY8a8nSOFi9yOD9sDa0KKkvy9e8ymbUF3tkLWMUc4gweD5BihNPAMgyVD5nJ
	ejruWJFBlSoEph32aLnd8fZJC/iGRgQ6QRs3A6/FU0NWoulVAngxi6WAwedoMiNA=
X-Received: by 2002:a17:902:7b8e:b0:2b0:9c2b:641d with SMTP id d9443c01a7336-2b98730cb97mr21791875ad.2.1777459930286;
        Wed, 29 Apr 2026 03:52:10 -0700 (PDT)
X-Received: by 2002:a17:902:7b8e:b0:2b0:9c2b:641d with SMTP id d9443c01a7336-2b98730cb97mr21791725ad.2.1777459929820;
        Wed, 29 Apr 2026 03:52:09 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988772e9csm18316715ad.9.2026.04.29.03.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 03:52:09 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 16:21:49 +0530
Subject: [PATCH 1/5] dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra
 SoC RPMCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-shikra-gcc-rpmcc-clks-v1-1-c3cd77558b7a@oss.qualcomm.com>
References: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
In-Reply-To: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=bvd8wkai c=1 sm=1 tr=0 ts=69f1e2da cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=5MG6tTDo7b5tcJehnegA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 7Dl6PYpEi9dD4OWzWPWhGLeAfmzI5Wfx
X-Proofpoint-GUID: 7Dl6PYpEi9dD4OWzWPWhGLeAfmzI5Wfx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEwOSBTYWx0ZWRfXycRw65jl8SLp
 GZxKxCMqPLZVNUbcpth4EWeYFV7xfmJY+96dNrrq11VnT8OdWMHlebUL2lR0uZASCwZ8x8ukMdl
 ntWzMU+6yPlX2+rGVmJAoe0kJq9UMsaxyMpB1JCqELxbq4a+9lIcxMAEyMrWHAYbzdrreujQP83
 4q9WtR9LBCrwzArMS0FlGNLfx0k7eD3C0vzsLDhAQZU5nPEtYjCHdtgbR8fMS5q2G7nGYk2PQcT
 ZDEA2d5cHsw7YWmeEm/IYuMJOx7fAOCzytZ14kKgPeN6kpl9Y8Xksj19nxx02Qt3vUDeDGnAO+P
 brtom44wM+Sjb6k4dk6w/jtDMLoWgv34Jr+7rlY682QQK1EjnS7mcmSswiCSqkkjDVHgdkY6CTI
 cGlMo8TdPS6lIAPTQ6885NjPPInq4JZdBwzdzHjYvlYac9IEWmI47h+CHvkNejasVay3wltJPO9
 OK7YOmYwCuICwYr0b2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290109

Add bindings documentation for RPM clock controller on Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index ab97d4b7dba8bc8d38903b399d2bd4bda087db8a..b8aea98b00bc22c4ab6da1e6235ad676f200b44e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -46,6 +46,7 @@ properties:
           - qcom,rpmcc-qcs404
           - qcom,rpmcc-sdm429
           - qcom,rpmcc-sdm660
+          - qcom,rpmcc-shikra
           - qcom,rpmcc-sm6115
           - qcom,rpmcc-sm6125
           - qcom,rpmcc-sm6375
@@ -126,6 +127,7 @@ allOf:
               - qcom,rpmcc-qcs404
               - qcom,rpmcc-sdm429
               - qcom,rpmcc-sdm660
+              - qcom,rpmcc-shikra
               - qcom,rpmcc-sm6115
               - qcom,rpmcc-sm6125
 

-- 
2.34.1

