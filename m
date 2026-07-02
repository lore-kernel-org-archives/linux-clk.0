Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0C836A027
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 18:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017264; cv=none; b=epi7cJSaltpO4l0hO9nvSKgp3O7JT2gsZJ/wMOGcKaK4MfaF7BasvJ+OdpyJS+X2rwC72OP5jjAOfnWp4BO76aWyP/qKtD9XhSu6Vj4GPW6zfrP6u9Z6we7l7O0V++xuaMaIgHWTJuUjAe+jhNt1RXcKaL9GjYrBYQysusg+Axw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017264; c=relaxed/simple;
	bh=coucDPCtTPijonyA8RvkPeT4AJ3BXja7sjzuQEwuMh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pogO2BryTZbqG2f1zGmRZ41Vj6xaIGJHjSHxKQFA7JmbdQT57pE3k1gilrhFCdnQxvoX8XhtihjIrZqeQjhr6TLm7eVe6GhWm0FB2lcwSXeP5nPCYa2iOgQYN6XSUwJDTI+kJaZm5nTXGpEFyPYWSsn2fECPB0ZS6OI2i5+RwhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fbGKjUBQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ImzsNj53; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fbGKjUBQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ImzsNj53"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3IEc661894
	for <linux-clk@vger.kernel.org>; Thu, 2 Jul 2026 18:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sn8J9t06jVCzNvGuI9rOYQMvLkvIuFOBqO/kHqzRbRA=; b=fbGKjUBQo9EKxPT3
	OyMXpjY7I9SmebKfHqzyO7gb8eZ6v/IY+je+Y6WXUS+VyRQzbgrPB8rnJl2Uaxw+
	KEVO3acdYY0BeQ2YrsYJQuZdoZT0UcbW255/CSHQGiDiqqQC7AUFcISyGL38coT+
	ePnmuEM2PX4SCQZXEGPdllZeex0eiN5MNlfnjey0dv4TMrVir3FxVj0zSn6loNRe
	QpCu/qm8pz2GYnxta057a/mEaaOCk3pd05Y8rSqLGq3Ui5l71DUdwRSRcqn+6eU5
	2jsU/6B05y4jrF21/DFPbk79s2eSowovxktgaCEKhXyB9jx4vN1IM8w4PeKuiGcv
	eMTKfw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnp9pfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 18:34:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c98a4ded1d7so1455902a12.3
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 11:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017261; x=1783622061; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sn8J9t06jVCzNvGuI9rOYQMvLkvIuFOBqO/kHqzRbRA=;
        b=ImzsNj53rhWwJczGlQPHUnAYiPEor6V/Dj+BhN+6tOlKhjgaafEguY9oyY9sGVj+Mx
         2kOyileeTnEMVWQYxfatfChsi7pdZwraT4YJNcKuuhw/lXyB5Bau/UB4Olyomu/xjx7D
         hLKAAHTLoD2FtfZDgmBBcdfLnK+XmXoYrhhTLwdaW/LNkn8SRaoGvPRBnPM/bXCnAIf6
         iWYIlfQuCIYeLdQHpGVMr/e5kwRNWKbb8eHVWMmRTEz3TLH8ZZjLbNnY6XLcfZBue/8M
         hEHztO4iaiLFm5fr0iXsJDhSg8uejr1QxRPjJ8RQeavkELDk62F5ZkcUM02WInVtBtIp
         eFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017261; x=1783622061;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sn8J9t06jVCzNvGuI9rOYQMvLkvIuFOBqO/kHqzRbRA=;
        b=PdfL1KH5lUhuwmRiMFcnxyPzU225W/Zu+UTnEenTc7SnUpHi8cDwOo0JI6XZNhYePd
         C84ux49wyjeARG17sznzQ0vuvVk8uipHHH24Oo7OIF2evxlg+s8U3FQVkSrY8603Zrtf
         pFYIrmNXlCrcfGFz3UFLzKBf7+Bu/Bnhi/8ZOw49BEIVpUMDAtIyvUwiqVBQpdMY5qMa
         A2pMe0nV6zXQny3bUHxD6jiAjjAXQ48KtI5PYV1NkLnvEwBfHx/VAAKwC5qnitXBQCJO
         gczJS79b2/10AHge6K9/rk39KFNE/IV0G79AkJrdFDXxVGWOtSGe9fWkd8fyBNP0QKMM
         5NUA==
X-Forwarded-Encrypted: i=1; AFNElJ+yxXq1xMRJVE7uaet0FgnqE11uJcpUvvKpOX+PoA9ODWr8tBdQmu9E5jrTFKUEyMtEofu9iAnRDKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXs6tzVjQAtHy2DpAotXFJg94zlpnbbS++j25weKZZRvDCwuAz
	QplMEjKYa8EepkYbyUEHIuF/4lXyYvQPDU/ry1fqwb0IAaSYgeSmqwaIXOeKgaWewxeYuzxhDo8
	btVAY5NjZ2b0UXvstNBldDBbdE2OjpyvBzKCRdaeF+/1uELEae+2yh6/rOtQpe/Q+IANFKuE=
X-Gm-Gg: AfdE7cmoCwpiksfrBSSedLipYao3X0Jy1B3YxPeC716d4cLoqMLSqQFmnWpKdxc+nHx
	8o6epWKfvDoKTE6dz2Khzp4y5uCT2LDwYL8L8pLF6uDW6J8XIx9KV2SSNUCdM25Y9A/bJi8/RdO
	07pfh26mf3s/wld4E2nvZuaFNJ9+yUJ2y5JZ6wvEiuzBOzU6J2bXw+jOYU+5/xALlOrT3fHE8Q0
	5eh389r93VBa+pX1Xi7sgrrKPcG3l/puF/XRZFSCVpnG+qbsLHiwr06b59+7CZZ9Er7UzW5BK+g
	gNUVzZ0I6noyt/bHVovyCuROOJ9tWjCqZBQktlR7vZ2nAoO+OOhh2CL8nc3wbppv95/x8jdqWvV
	iUUx4+hnN3DAuTnL9RBRltgIovJ9c4v0Y5RmMA0xNSg==
X-Received: by 2002:a05:6a21:b88:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3bfed0e254cmr8198799637.4.1783017260840;
        Thu, 02 Jul 2026 11:34:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:b88:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3bfed0e254cmr8198748637.4.1783017260404;
        Thu, 02 Jul 2026 11:34:20 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:34:19 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:37 +0530
Subject: [PATCH v5 15/19] clk: qcom: gpucc-qcm2290: Park RCG's clk source
 at XO during disable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-15-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX3LbA10QfutjN
 E2TS/jLAQ30nWo/KJGRc3/S1wzcCWjLJnZ6AzSjZerExzFU2wH/UixnjI5X4FkeC5lrru4cg+Ve
 maqGt43IwOPlLaZGWTUGp3Y9JpB/G14=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a46af2d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zEYBLtLDRKTvQvC0xrIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX8pyp3a9yNuqe
 OYDd30xFxDeOfmZVAm/fX/+daWcRRiUWL5k4f8iU1B76wDwS22l1TOzLti7w63kL8SCeo44LoIW
 582ImRB9E2cCrAt5rY4XRmqmYlh8z7kc1/VTKAikj10W1gSLY1sYb1pqbmAkJkMk+ZLDjkSh07C
 nairK9eEBKjm/thP57ifw9QkMgdEdsWD3+kwnG83qej1b8SDz3LfoGqXmYsFjovJ1vSZKTQAU5f
 /WZ5Amw3ePZgzOtAwFk/mTfMH2hA7y/TvwxUPVpGYCcumZH0Kp3E3mwo1qBbTUWDOiQCYbYSItm
 9j12pjO9Naeg0Oqp9WK168Il6SN18e8C7/HxlbdNjlDBLFX5HGOkLNzpjJzgLY1Tj/5V8pzPIcD
 YB0KfhBG2ZwVyNzzJtAa+R07uI0BnSjxVTHqSGX9iqgvCZQLnUMxILdox8tRnE73ydhQj2wXa3t
 KrmQKlenRyzLDNLiDag==
X-Proofpoint-ORIG-GUID: sPuGcvhP3E9vsUAmMqLu9HmBcbzlUsrt
X-Proofpoint-GUID: sPuGcvhP3E9vsUAmMqLu9HmBcbzlUsrt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020195

The RCG's clk src has to be parked at XO while disabling as per the
HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.

Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 78797b77d7c7ba053201064ace3963cf2bd5281f..fc33d82bcfb6843307d002d67674253f0174cb4a 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -144,7 +144,7 @@ static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 		.parent_data = gpu_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 

-- 
2.34.1

