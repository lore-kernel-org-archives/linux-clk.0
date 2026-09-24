Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC7C474267
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246480; cv=none; b=TKF63Y8YX24wt3zRqov6oyDkTt6qdA1N1Dgz6yS/tgD3QSZal08OsN42L7ENIOmOL0PHOqvSS3yZ2Z44l/aPSmzi/i/ab6A1Qx2nQe6OWgiUeh/JZF8UqaYiWe6XIxKV9tqVkz5wsfOe7DNuYYPVdq9KSjnpE9hMRfX8RFOTaCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246480; c=relaxed/simple;
	bh=Ve9iQLgnDMsA2g8SuB4W+BubUPBR6RQwDcIDTO0O/O4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J0ZimM0KjhNNnzgjhYBtep3IH81aC2aD7s/+Ny1RvEHfMf0mVhvdzMBu/pe44wOovtzuK7SFRkpWabjFkVAVj2AuGkVvFLd8IgSDyV3ryrrGutodIYurWqiIKNFq/OQXs9mN+Z02Dk0mcvdYidYktY7cXJWczpVzXBnUraIyrdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mxT+ElWq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jmz7R01q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mxT+ElWq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jmz7R01q"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PEnK2025655
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4ds6fKH7tM2v3P1TXKG8+wczMeC3eKAUm1HM6VrIBks=; b=mxT+ElWqZAiI9Wou
	lUi/IDpkISIIbBKZuwhA37N5VhZyQK4okCfbFEGS8+CCCGePiOWK30tnyATI/5BZ
	UVA5U9uZp7cYVHnlZeVtIo09iqC9LHtRIgvXgHtnPApE/ebkau7DYfzAuC0CnYb8
	eL/so+4KL4b6JmBrcGUHYDHckCsDbsEGnqfPfPOzldXEG50fXbI52EmhFX+kYfk+
	r3xtevEtPW7V6VAWQ9m1xEfQdFkETfsVkMcFd/wvD5hMJ/IR/etvR0D5Ch8HR8ac
	uu0NI4oIiPxZMu0aELw1tpXEfTvLYxgUEJvbyGiZYwVEl84Fm3XGhqy26KCa6sSa
	kwU41A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvsfgt28e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f3426a7cso401744485a.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246476; x=1790851276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ds6fKH7tM2v3P1TXKG8+wczMeC3eKAUm1HM6VrIBks=;
        b=jmz7R01qZzQGuQwcIRIiPnGE4RU9MavDrA3CibolIJsZChWB1DvDZFHi5c+TZu0pSd
         VMH5aPrD6Fjoh2p1og79V9VC44KG8cFF43qucEE4o+DSkQcfXFjilxL/PyIZPWeMxAGG
         etYuCLY7lePGdPUbY8yPidWQa9zPi2kV4N6pKkbk6LFESoR4MOkBW+toPkIX+Xr1ekgV
         Dce8BDexAEEML0tuopJl80u8xMXfEw6GCV44zQbb6TJ5r9ywf6i8jLiSuNCTULF9AubO
         kCfXWYRXeKn5OHb0PT4u3JQaJAsoEGeJKjuMy5IGAAsHU9SCWtbeokKTT5fhERm0ALAN
         pFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246476; x=1790851276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ds6fKH7tM2v3P1TXKG8+wczMeC3eKAUm1HM6VrIBks=;
        b=vgHhj+CFd2Hsm5cBXQscAZfnr75oim9xAg9PbeX/FyqXLz4WeHFUkEwSZ6PiqzWerm
         mmMVxrVxgObmvW9zZrJhDTMe6AFQQW3euKbT+NEoVat5XgowcIwPScupFKpmtrn6qze2
         FxspG/C/gvN1TAtGArbgfZcWU/OdW3Pr1969Z4teCPUonr0kwVM640eZGOPMOji4yy/f
         QOWErP38uK5chJ6FppCnKHbSXdSP9QHTprba+EdrggfBJclQRY6plXsjWAQV6p4gzp5o
         vfiuXRZmj9hPhsheIzKN223/hQvanMEppuin3rn5zV+VfPsmnM4at/+ojZ1FBq7sNj3a
         bteA==
X-Forwarded-Encrypted: i=1; AKwUvBz+qw1cC5KtyLAUFpU6HHfclMMLypAM6D7xN5qTcCgThUKNhdytctvdVZkSd+seT/pCt8I7TUNiYAc=@vger.kernel.org
X-Gm-Message-State: AFuF++mMKQsyYpyAYrhiVqSG/Z8Kgj4L+8JVLPTriWKj4bp9/i5Cl0wa
	LTFTBsLF5VOy1X+YbVTQP3iETtbmmaXkz39QJ99buglooUYCMX+YSTK7TdJRjjD9tWCHaTK2cCi
	86Hb+bz8UjKhyGKUsNCoSPWluWrPt9NBmaZqTCZjF4jd39pLy960JIo2iBZ5d1/Y=
X-Gm-Gg: AYBFou2A9JhKbVH4kSHmp7tbXiBXTL+M5aW5CqxrmBR4Deqevw6LfBJQrDkGrnsHVaJ
	WPzI0vjAY0t7TOXUBBMljxM3nv1dLR2IN1XZOZa7GMMW1KfwQdQ6G4ui0b2qEX/zQXAU5ue9MKZ
	QVFzIISlSerJU87y0OPwebjopNIfSf4ewjWJIFw3SPVMcwveHH70w540x0Bs3ou328WPsPWxjTn
	OpOV/0h4f+kAYYZIxGXIoEk+9EXLHcda7+F74PQugSa7SH1rlmcljdkjCPbmLeeTW/kICBOoaiK
	n+X0xHjSs41WlU9P12qQ1yEmnR8+6jlRFfPXTpO8GF5hgt/zNnTQgsLILE5qFoySr3E4o1rz7xO
	3a1mxq12D
X-Received: by 2002:a05:620a:628c:b0:93b:c332:3d9e with SMTP id af79cd13be357-93c36355307mr224186785a.30.1790246475954;
        Thu, 24 Sep 2026 03:41:15 -0700 (PDT)
X-Received: by 2002:a05:620a:628c:b0:93b:c332:3d9e with SMTP id af79cd13be357-93c36355307mr224181085a.30.1790246475363;
        Thu, 24 Sep 2026 03:41:15 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:14 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:40 +0300
Subject: [PATCH v5 24/42] clk: qcom: gcc-sm8550: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-24-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ve9iQLgnDMsA2g8SuB4W+BubUPBR6RQwDcIDTO0O/O4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3xzeGhSWAgWO3A/ats7kDGH+TKzVsN8lfRO
 ddy+iOZi92JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT98QAKCRAbX0TJAJUV
 VsDZD/9HVSHTWltqmKQUTWh2r5Iq1n2qA7LG+cNJ5TR95mYahYBk+7oMuLORATMUTOOKrQlP85b
 dZhHefA3UIPoDu+uirw+NtKUTj7OEOe7ix1jxfJiIq8vkR1e5StiXDZXpEvXayLwJ7b7dWwtBan
 b+cKwaHTnGJ/2ORwHuVMmRoTVd06CYvdBynv0Wf5OCyDio/VxOVC5dqJV5UG9E1OEm57aebPN1m
 5pJCRk/8reDAUidT5QYi5dkQm0SVMPxHYm2pPAjhVxC8Nf9ydCx3cYJbWbEAC+2fywiWcGKxHR8
 uYrOmGbOlp7+imSrcDQxyHIMsBIeLdOaY7G0LWjvwJfV57elAFgYXIiEvYLT2fLXJhdY3x7ydsg
 qtMHAqKBNszHZhaz0PctZYosiEx+68PvcXmyIlZVyGyFFp6JVZb4rM2ObzXgJiDC2AVGdAz6xV7
 lrhmTB7zSCwu7uCadqonEFsD6h8USOZwoSxayoT3BQxk7TSlz7PJHSFu2e+2QtMwOzqfesWV+1X
 LlXSGlYcp2FznwVgQO1ZelwvaL0lRvr4LhLJKQQ6Ll60XBtrsOEe7WV/3NbVGWhea8pw+C1w+rG
 Y204ymt9N1qhdG3BcEeIdY3gQqCqQDHhjxtduwU6vp/lBVY/kBAmGLs2vlVvtYHyPZSkEidX5Rg
 uVk47dbHD35WnjQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=YfoodARf c=1 sm=1 tr=0 ts=6ab4fe4c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: AnTvfxlxaGCcWlmXt4LDE-Az5BI1492F
X-Proofpoint-GUID: AnTvfxlxaGCcWlmXt4LDE-Az5BI1492F
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX+jJYigiu1bGd
 njhE/VcY6pvhcw3LBVpfnfpfzdRUNJjFfX7IMYD0L/Cv3p46vTyxyGHrtm4hsjrNm+ohRtC0VxS
 RQfnjvyz/Bf42ImJYHolTJsHNREPOvc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX0VB3CZnR/JsQ
 r6k8bBcB6coh2bAd2nGtfSE7eluLqs1lImod7mQ4vyc2uDNGwM4+Esnlkua25RvR4W4iO77qnAi
 A79Kga9PvwkmCU2c2DIFr3d39It+FzBjVqf+jGs3HodKqhQwm+FyXvjQbgXHgy41zec+gsT6x8+
 U8m0pjwt8u+RPCTY243Y31GIhTrCPfW4gc1+oDj3JE8xPeUSan5Fx5UA1h0+bFIFFy0ojumB/+5
 b1h9slWQxd6Op7q0voH98W4y2pBmsORcdg2oE8EqZRDjWvqM3Vsk7ZGrajZWzsBV1kCuyF5L/vq
 8wf19tI8Vzk0d/3pzyhTYwmYuAG71omlKNe3jcb7iOIALUpwkJcGLy7EW2AiA4cSP/aPuJYgDZV
 yFPTFAHbFr+yR4rvoakNZ+IWrj6RfmuGDp2mTr6Us8GOj9ObaBIVELESR14d96d6KbUgfyU+T3V
 iBm1CP4e1pMtlJ/87dQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8550.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index d83a7bb5356b..fcaa4cd82b71 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -3327,6 +3327,7 @@ static const struct qcom_cc_desc gcc_sm8550_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8550_resets),
 	.gdscs = gcc_sm8550_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8550_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm8550_match_table[] = {

-- 
2.54.0

