Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE492F549E
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 17:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764266305; cv=none; b=Ci6Rkgg4I2WaObrUKOxB9D5AiRPHepwnSMvOl3+uvynHvRNwvIgfMZsT5o4beQeBoiRscwlK9G13ayPuxTsPuZRqKrddxVdmJz4bq8zilsP0eGWN+VYopj8jL5soFNkyDT99MsACKMEBZnhrjuG/I0EY/ImLwtmWLfI8rhUvJjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764266305; c=relaxed/simple;
	bh=Ma1zyF0y9sO0pbk/wqdo1cN2hv9xdsiDz12axnbyqT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ttk3zVSjyutiyMgGDu+uBL4xqrG4IswnF5eZmdiazBGVcZwxN9WGjRGv/gQpnWqNXKeptmOUIopgq5Em9F/6HCtaVSKZ94gImcApDSYFJ8MDkxqj0lvJ6jC+mqiKFUCQoMy4JVejSpc+Ar7OzTzJ0aWVjCG0Q5l/pAesCyNX37g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMHTOial; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yqj3/IiH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMHTOial";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yqj3/IiH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR9bEOF785240
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 17:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yI+14vZRRmYO9F3gF+G1B1tK11+LDgYgnXZsHLb8Ud0=; b=fMHTOialqhsYY1sm
	KgB3LBbPM0BGgw1lv/cgkFIcb+vZr/YkEyrsmO9lWKbXFuuBrsZh6mitWXBSxduP
	uv2NttAmlrGpUZ02MHFmYlEbbslAL7K/1bZ0I6eVJzzanIJbk8mgzPMH/JURFnnj
	qf9XW+s+HJFeHXF4/7+QZATMdyymkVIwoIADOQ3pJ62F+Z1YJ5hA8J6x5s97uQYL
	Ml438Z4JRNioR6z0klpNdZ+lZBcP/OzoIcS4+QfkBiw1wJ3KjOF9tPi4Z9ZlA97K
	ugm+e7Y7jc8hpoyE3+7GFEwqBQAAaXgJA+U098MFkB1MhHS/JO8F5r038KlyYW/4
	SP/shQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm61s75u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 17:58:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29557f43d56so12292135ad.3
        for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 09:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764266301; x=1764871101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yI+14vZRRmYO9F3gF+G1B1tK11+LDgYgnXZsHLb8Ud0=;
        b=Yqj3/IiHldGJ7HnUDUUpkIp1Z7J8avsBaEVShgDtFjwee/i/h7csjtOdNphOIvk5Y6
         OYnhCCNV6ZWK84OW9n3r9DB+CmAKxEDB82mQsZ4KcWk9JwU0Qdn9chfjk97XdzkaOpu5
         j73KIDVnFm7lJHJN/j+3JGb30THoBsXyh342gliy8HNP5WzMOJ2bwaG2r99kYU2MMqPE
         wM5UaHX3heYdASJ50sRGzzG8Olcmgiw0sbQeER5iqTlBA0cWvMtX0bVfPPkSvHjFhsLQ
         wfCkrkm0OvwpNvvCCeFcpaFQQTuMIuJcA8umiaPHZDTrZpoYsMcQpswKjBrjSFHVN1wX
         ns8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764266301; x=1764871101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yI+14vZRRmYO9F3gF+G1B1tK11+LDgYgnXZsHLb8Ud0=;
        b=CN1F1C5kA4CPHHDqrp/sXwQbToBNy81UusZfuqz2jOsFAEDTxsPaq705bwgzuW3pRn
         ZUoD1Xpy7adyDyI+4qIZvWhH9ddW8YddyCJopkVHmTEu5TXtgZeVQlMSQ2w19oTPGFm3
         avZw+HYs2Qmif2IsCxE15+gHQgNBgisAr1VcDYgM5Oxc6H6P2YessrGz4kBTBAkzNOMB
         DJ9R6ylv0WlXXy57XLikr1nW8hK47i7wBvTswUgoLEkzhIrZ1J6UpL5CdNDV+vN0234I
         8ddJwL2SyPCtsbVQSxu11em/x/JTi4flQgiUaQ2puFDFS2qu5UcJ8hgNEUoupk4S474z
         sNzA==
X-Forwarded-Encrypted: i=1; AJvYcCX5A8MRxcU/6sq8UrfLbp47PvwTjEY8HG9RLsPAboYf2an8V4PDZ1ozcqGI4IUILGRu4lmMv/JcZZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQRsBnWB4sTaYxQPlOA1Cf/80ZlqaogISdriBSZ/JsTw97pXcC
	cDkwgPH2oVpKmaZPB9fdJHRS+zp2WB+B9bJbfNGZZ/um1Fw8F4cioFtpE0HOWOnxg5rKLuftXBT
	qu8ma/IqrQdOorrlikSHCk+S7I/mTmtLWkwUmimyDzUsWNwdnit9HY6bstv07a3c=
X-Gm-Gg: ASbGnctfX4Xkmly2dJR0qWQxRsYzJQ5OZ4EDUKwPVkwa/0gr7RaGul55fvGQD2VqbU/
	HCnBfD6fiB88XOJShfGVN7mDE5ZhuB92a1fxCS9dPHCJ50yFFjpBUhCmaCJqYWu/ejjzRbs9eHq
	oGSOxJKGLCfY1ApdbrgyONmoBzaO+Sjxh7XeZdKy8Bv6vEEiR2qHma3p5m5fBLl34Jzjewzy3De
	8ipluUUUMnRcNCrd3w10XWe8P/GueiAn5Q3qFkeBzeUPpuq690oTMFfuKSU2mGTONrLkE+lu162
	KtdUE5TIWRox4LzCu52gjt5gUgM0Vvl1l+UX8UwJ/Z7eq4BEmYGd0L0fPA/1wujTm/k/F+1VkF8
	73s+D8EsngQbFhimeU/n97CI9JzPJI1WUtaJ6xpL8
X-Received: by 2002:a17:903:234e:b0:295:6d30:e25f with SMTP id d9443c01a7336-29bab1d7372mr120476355ad.53.1764266301152;
        Thu, 27 Nov 2025 09:58:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2sQXAvMubQrkqMte3dBAeP9ijBPMa74tIjYtcPN5YusFXFTo5IO4aAr+rikKw8I3LkgtF8g==
X-Received: by 2002:a17:903:234e:b0:295:6d30:e25f with SMTP id d9443c01a7336-29bab1d7372mr120476115ad.53.1764266300642;
        Thu, 27 Nov 2025 09:58:20 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce445927sm23785535ad.37.2025.11.27.09.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 09:58:20 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 23:27:37 +0530
Subject: [PATCH v2 2/8] clk: qcom: gcc-sm8750: Update the SDCC RCGs to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-sdcc_shared_floor_ops-v2-2-473afc86589c@oss.qualcomm.com>
References: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
In-Reply-To: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: sWChEZS_-7uN5E98gWqABkTOoPcbGsY8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEzNCBTYWx0ZWRfX7EQysAEVnEtb
 y70Xq0/8Vv1/nDzf0B0S/q5YWNP5RfLnLezqPrc5j2a2XrValF1YSjKp9xYLfXWfQfR2pklTcfh
 m7xjQRf0RTDbXd8qBQrtES7lHkpLPwykg9VhDsx+om02yBQxbTwyvoVh1M229a/+JOWRUZRQz1m
 MQZoXVquNzzsQu16Dhkv+rFvCrwPQ5uyR+2LNlZSsdF0NT+sF63sglz20NlbD6p1MlaWNuErDBi
 8qGksPwrbBk1Tkg4RXO/1BNq3ihzkaykAsOVexBp8NSGqDxUx8MrO29VFwtvbinROWnBYGcKgbT
 X4Lp66dVaqcxTxlVXmEemBqXMhCxYe7K0YQx3y3D/rvQS0cqX3FidKOoiFg646meVL/hLpzsx8n
 aB9fNKaW0kPQm3xc5IM7CrfB3FTMyg==
X-Proofpoint-ORIG-GUID: sWChEZS_-7uN5E98gWqABkTOoPcbGsY8
X-Authority-Analysis: v=2.4 cv=IciKmGqa c=1 sm=1 tr=0 ts=6928913e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511270134

Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
during disable and the new parent configuration is programmed in
hardware only when the new parent is enabled, avoiding cases where
the RCG configuration fails to update.

Fixes: 3267c774f3ff ("clk: qcom: Add support for GCC on SM8750")
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
index def86b71a3da534f07844f01ecb73b424db3bddc..db81569dd4b17de1c70ab5058d4ea186e08ce09e 100644
--- a/drivers/clk/qcom/gcc-sm8750.c
+++ b/drivers/clk/qcom/gcc-sm8750.c
@@ -1030,7 +1030,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.parent_data = gcc_parent_data_8,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -1052,7 +1052,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 

-- 
2.34.1

