Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBAF2FD1B5
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 07:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763450241; cv=none; b=iV7hloreE595RwbzflXtOT3R7k19P051rKF2hvmtF9cV9EbypydIz/npFkeh/8Tv4Vc4K7WX5/g2JJeYSkt2r4e0/S4yT6c/PUJWXuME1IaQJz0jOeClbY+leiMPtm09iMXMVczIrVVL62H28LBRJGCX3V/zK2g5eavvCci6lk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763450241; c=relaxed/simple;
	bh=1sHC0UwVVr1uwS8Q4dv1DDDeIQRkEFp5snpvfPQCymQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WbrhfZRbgK+b1RB1a1r9H2ZsrHi32znSO1WdXrTapyygJC8YCCoOgVY0F0tyOApbCpsiL9ty4KmxIA8ngKZAs1SYXJ+Bov4t07sQ1/K1d6FODWkfCdNLFhSAhWLNVjoeJZbXKAbcCcIXJ11VKJYu7yyalNEKX4KX9LN7tZcnaU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XldyVQWT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dO4922dJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XldyVQWT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dO4922dJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI2Y1eX027649
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 07:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wQlufkIMG06hgf7XqBGCgD5Spw3+VerKIv8n6vLCr+w=; b=XldyVQWT2lbBe11v
	5n90JZWHZiGQOQDy/Od+v+PN1yzWSDdWmSuQdwAZWVQLfcXB/jqSX84bqNDzsbbp
	A6Fc5zeQvkE82qeS/M3np1Uoswwo6e8xS9HGyUtiv3sUOPx6tvKixftr7Dexo7NK
	oCv67XvPRzrQRUUZNwPuhvBlNNA7OfvmHnKBePWENYXHAQptPvvoN4y35SUdk/Vt
	2Woryze8EpZk20OsKK9wtGdxTrHMtW9+rcL3nVTa7boMj9gdBhuKZvBYSfq9QiiS
	ApA13jiiO4/JZ86VV2syXKvpuK0xmCsjHMyxDPOf2PJSFdKtGWBIqY/CAgc4OcQV
	UMcL8Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag77t2607-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 07:17:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-299ddb0269eso25978335ad.0
        for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 23:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763450239; x=1764055039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQlufkIMG06hgf7XqBGCgD5Spw3+VerKIv8n6vLCr+w=;
        b=dO4922dJLqRiU7aOIjynnl77gUDJes8XzoaZ6jLdVo21Q4xqiDnGgqYus+tcE/ZDiX
         ShRNK7xuMkbwXlqlhy8wWnPffWaMXevWzsm3SkSUjs9FwDDc8kKgzRbEHyuuvpF6GQR0
         EhGlMmlI9oJiQRQAzGeoZomqsEOz64/zRm20CTdwUp7qUApMv5I1pdrqJvQ1BBsiOGaK
         OKYELAxhOVWxaCCndaN1rsw7HwWn7FnzAtTs9sjz25Gc1YiRj8TToJEINz9P8QFQsh/Q
         fczA3OSK/DlGqLFfkBS3jU0F59QpsNV+NOSpXi9nigYZffQGSBqm5ElH0mfdd6+iYEEL
         MT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763450239; x=1764055039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wQlufkIMG06hgf7XqBGCgD5Spw3+VerKIv8n6vLCr+w=;
        b=UFcaDc61+SKV7hJZ2WCXcCTVYIUjd2v6qHrghKA/hFgpxEquhG2KoFN3mFyfMnYBf0
         sX/2sKNCXJoSsWA/MA6H4ezRD1EWehr3c4IOSsbng2alGYaTOWBVlaEX5pe3Dx/OWc+4
         9u6kjgmzYfEmXrfO+046ebVSrgGUUQ/ZdafwSNjhGhfU8/9DAvOmokqDjCD76kT6oicA
         HFDlFFSKfYWHSXcRA1uP+pVQlF3oZO3vmlZq/gkNf7ausJxDp9nty6LnjOQdn158GIJC
         q39YUQJRFKZWT9UXCRTXU97AfxPMyl04RSeoQaKTMAobUVl/kWxqmVaMzJeMuvNHgkU5
         Eg3A==
X-Forwarded-Encrypted: i=1; AJvYcCXNrmCT/V+G+Bo6i3XmjFUAVezh28tvGceXR9C7Yoz6Wsupe2N+PbJO/Lfou2ZEEFw9kyDNy1D4Bo8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6bEUcdHog8LpkphJ0fNUT5YNDe4dnPiUJjZ8BQ04ppT46hzQF
	iDhwAZn8D1A6V8PDcTb3vAWQ3AVOZZHxxgVweqs8VvxNX6RFs13SQxB+07cYPLO7pRNVnPjR3A3
	4Jm9CpllyZPBPPa7u7P3kkJfEeg2i73A5JaQT9YVRMk/DSFfSsz9tuSy9zURrSSvN7miLVGI=
X-Gm-Gg: ASbGncvsan8knPwPXvMjrZgX7F8KsLzeaJ2o9NanjQ76UF23YuW/mp916ATOJR1bcow
	F+8OUq+fFjY7f7NkYZT8jHCzoTU6YaWrOo1vsOudmOtS8vs133kqGbOLaixPwVDNaqUiWZoDMXn
	o2U3TlUPy3r1MhkmHdxHqyqa5+lsdHBDcq5kfb+tzQbc5z0o+miHmSXx23rC7E8RssuLtJkp3Bt
	wvGWnR8jJKkmY2F0sXC0jzD1BZlpc10na6gxRdp+bh3GOIBUdqO47VrCQa+GWGgNf1LnyDbhqO3
	WY7NEriDbCsqKfWvoM5K1UuMOtjYJEJ310N0zGpDRZFhsVh3k2cuQufAZsnM+4jesinYZAcwt12
	ZRusVy1MJZG6epU9G92mqaUivsm5SMm+S6g==
X-Received: by 2002:a17:903:3c47:b0:298:35c:c313 with SMTP id d9443c01a7336-2986a75f3camr183720865ad.61.1763450238958;
        Mon, 17 Nov 2025 23:17:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOM35Z74eyPqKFWR25yKr6fKKJcJK6FbOocM2TrUkwY9uR2CPRB3wvxbrYNAsIfZOMJ566Jw==
X-Received: by 2002:a17:903:3c47:b0:298:35c:c313 with SMTP id d9443c01a7336-2986a75f3camr183720575ad.61.1763450238470;
        Mon, 17 Nov 2025 23:17:18 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2986a60b116sm129955285ad.79.2025.11.17.23.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 23:17:18 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 12:47:05 +0530
Subject: [PATCH v4 1/5] clk: qcom: clk_mem_branch: add enable mask and
 invert flags
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-sm8750-videocc-v2-v4-1-049882a70c9f@oss.qualcomm.com>
References: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
In-Reply-To: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA1NiBTYWx0ZWRfX6wWvqLRwNbaB
 cevQRgF7KJZtBWBS9QrkkILvRbIb2ci6IcP0ScnvvQ6/TkNdR2Khi+GCQ5Y7TL8faWKLFojFwxK
 fhFc7u20rejmHUfHdwasf4TV9FIwQYy+J8XNbhYqF5Md2/d0BwdtnS+OXD6us51UzeZc2w058qm
 mAnsQOsy1Jk7heNrSiPO8tbuZviUMwq9jZ3/UUPIeENEHqCSUscVJMOIvMspWBfxzEX66rD92hL
 18Rf9PTJgsYnt5OqIU4nVrv1pA/+yIubjSyTYHvge0WJxkZGn/RXanK5M31EZqf1tOSC9Vo3Tr8
 lX/iCx4F8f5AIU+qd3ECtGdoyFiSin4FJrsijZWvztdOSJLqFq+XX9HOmkeelVrtrVM4OT/Ws29
 oJoKsNjOzJm4mVL2lRN39a4jfJZOTQ==
X-Authority-Analysis: v=2.4 cv=EPoLElZC c=1 sm=1 tr=0 ts=691c1d7f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uR87BbDKUCx-STIg3aMA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: TeCepqy6GY_c9qpnwyxc0TF4HnZMdSi8
X-Proofpoint-GUID: TeCepqy6GY_c9qpnwyxc0TF4HnZMdSi8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180056

Introduce mem_enable_mask and mem_enable_invert in clk_mem_branch to
describe memory gating implementations that use a separate mask and/or
inverted enable logic. This documents hardware behavior in data instead
of code and will be used by upcoming platform descriptions.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-branch.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index 292756435f53648640717734af198442a315272e..6bc2ba2b5350554005b7f0c84f933580b7582fc7 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -44,6 +44,8 @@ struct clk_branch {
  * @mem_enable_reg: branch clock memory gating register
  * @mem_ack_reg: branch clock memory ack register
  * @mem_enable_ack_mask: branch clock memory enable and ack field in @mem_ack_reg
+ * @mem_enable_mask: branch clock memory enable mask
+ * @mem_enable_invert: branch clock memory enable and disable has invert logic
  * @branch: branch clock gating handle
  *
  * Clock which can gate its memories.
@@ -52,6 +54,8 @@ struct clk_mem_branch {
 	u32	mem_enable_reg;
 	u32	mem_ack_reg;
 	u32	mem_enable_ack_mask;
+	u32	mem_enable_mask;
+	bool	mem_enable_invert;
 	struct clk_branch branch;
 };
 

-- 
2.34.1

