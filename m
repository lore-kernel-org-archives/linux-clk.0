Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA4747206C
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390176; cv=none; b=gJ0rMBeIyJ3WAph11ZT+Lf02Ohd1cUfnttRZZxrqlZycAsEWGubvPLD+Q4o/arqHoEjjP6TkS6inJUDTpH4GIILT4IRdqXLOtwwkcB31x8k6fOUAALtNzQzxRrQlgP7j2vWQ9uSfiZzr1uH3ylHjyIuKPW93KaVt3y8t2Cf4450=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390176; c=relaxed/simple;
	bh=8unvUEpP9STiQNoF1CREMz34B7ZPBMJvLglEkBYOewM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=saTrzgy7su3bDXrajbXTTLEqMH+Cdz1pPqPROKF0ET73H4eCUfZNe0icMwAypMLpvLn9uw3z/BNcuP8VxmS7Eg/JgCn/R8gqTOIFW9FFx28I/DEn0rxepybXvDTGGZefVaHnqatvXD0TldXtCcmOJxaiu05PFwP97dXyw03HC3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MY87Q0AC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kFUyxH9C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MY87Q0AC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kFUyxH9C"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRShM407302
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BS8xI7KTU1nTf1SesfJE9zQsO8Grh9MUHlF+za6AxDg=; b=MY87Q0ACcqUs3OFL
	CyNz0b80TTk7vaynmsdRltqmTToi9F3IBMchagaWmI8+0LVPO/bEnkt2iYJfmYwr
	015O9RI2mdkHGpy7/d08Uzd4vYyBS1gFx6wLQv5+qZGW7mR/L/6VhqOuMJN334EE
	pOzQ6KscggQiKK3pcU99tPRiadxpXWQ+SJl/6BGyesrUN1l1Lj5YXaVhZLW9jjsF
	X9llEpcGQouEqMbVXNd3Ap9Yj+Gv7hED3RRtpm54ad50IC76sbDsu6q+sJpg3s64
	uYef9WDWpyF2pYIyCJybqti2bvelbeTwufsKG0KbzK7rhuZRkcOk9Qo7zuZJpVIz
	uDSk4Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr8d4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f248907fso242070885a.3
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390173; x=1789994973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BS8xI7KTU1nTf1SesfJE9zQsO8Grh9MUHlF+za6AxDg=;
        b=kFUyxH9C5MKYWMiI3VVinIRpfU79B3yzUlcxw1PIJipW7MFA4q2GYqRxqkz/OByyBy
         i4xFcY+hK8imS6fI18HNRubDVT+7LJBAqDWfqyVFWRUjcFnZ5y7oClhieSG8wrWeEFya
         66pTdCcvgyEMNMh9wdZuHvQgqGTpVke436ZrLS+pdF+3dMA5EA9C3WrvvFG31UtnxIRg
         lp1biB3n7rAhaCcGDL+QJrkOyCmomewhYNQQ5fG6l6yIk3fgPns/Cb/9xKY6H+lr7d7M
         OPdtW1OBYzJCmf2wRlTQKik3yIawi6Q7Cue3g9X11kZHKgyF4BfQXfZTiXXEdkIMO8et
         I3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390173; x=1789994973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BS8xI7KTU1nTf1SesfJE9zQsO8Grh9MUHlF+za6AxDg=;
        b=LAzFNx5wRtWKD7fwxymtDM9ugKoCl5kykHZnqlyrC5C091NoeIULEe8cybSp9BYPlC
         8ReCj+j4z5eeijFID43yvOCVjj0tI7Sgj9GLjeLYP6xXj/BrwAHQKGsJhCAwmBLFmun5
         uFMQoQeXfuwueE+XPtgA5w9+gdrHs1Et4vvfIeWMZwkybB5ZQMD/CIcgXpVPkEyBnj0w
         RTc5y1hfFLhAOXNhIfRDwUoeVmyuMTNMFINXPldzjEA6JT1mtejEhRGFDuKEFJCRGxlU
         gTyDgXIVVmCmiH+OTZ5s/obca2xFyUJWsdlH4HmXN6DhS1CE6uPAbNrsncN2XazqhhFy
         W3SA==
X-Forwarded-Encrypted: i=1; AKwUvBwsxGKuPkaJ9zKVwKP4/pisu6hluz+bzr4z5apxXkuq2hxNyN5YwEGfIeQT1Moj6Pduq+3YhijUdns=@vger.kernel.org
X-Gm-Message-State: AFuF++k9UsZPk2S7CpGQHzpKhpySXSEkAMEnZZ50lHNVJ6VjjLujD2or
	xLnAdR7Zk6m6aZjabVwXtvUmjjp8vCcfr7Pc32WvYo1If6q5ED0Z3uloqzkCusI4Wp9XZU2emV9
	tixHooenm71xnhXumbywGHY3Xk69ngahoHMNZCLP0JMifzzTsCRHHH0ZUtFGmnT0=
X-Gm-Gg: AYBFou2WAFQa/9O29mZ8pt1xA0pp8iVc1/+qlCA9xMtfAULSQIeStk7AIDWi4cSPWGE
	LmT+UL2CRih8pXaBiPRKe8RX7IPSuz84Gf1cQ0SUpqKxHl2yVWIV4kAQs37hwXvG+3rkrQm8egy
	QAyGx+bBF4mCNn4DCBoxxO8rhHNuK2G6iNzTD8SBSsiZwFraLLU80M6ehKcPOmvMT97xElSyYor
	5SSVwRMGu2DnyhAQuBrhidzXNu5EdtFy18jEyNMd8gqBR/Q5tccR1z8kTnOMvlafaC71dmih4aV
	K4ekJBSEyhmetLtuA+Q28wjvhx6Rq1sGGaMjI+A1F+pAYYLkX7WXk5GjRh2rBV2ivchCX7Ggxja
	WrqVtNl8H
X-Received: by 2002:a05:620a:31a2:b0:939:8f2e:a0cc with SMTP id af79cd13be357-93a299eaa8cmr317620485a.30.1789390170517;
        Mon, 14 Sep 2026 05:49:30 -0700 (PDT)
X-Received: by 2002:a05:620a:31a2:b0:939:8f2e:a0cc with SMTP id af79cd13be357-93a299eaa8cmr317612885a.30.1789390169886;
        Mon, 14 Sep 2026 05:49:29 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:28 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:32 +0300
Subject: [PATCH v4 33/52] clk: qcom: gcc-sm8550: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-33-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
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
 bh=8unvUEpP9STiQNoF1CREMz34B7ZPBMJvLglEkBYOewM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zr8ZZbsgQFGJcw0YXyNwtv5CeJfAJFldSIj
 opSd7Hp8SGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs6wAKCRAbX0TJAJUV
 VvDOEACdiSsorjb9lqVUr8uCCAh3SVvKslzA1pNJz434UyGoTnfaGE/M+5sxx6MeqZYbVBfYrfz
 kTtXWDE/Yc5Gt6KnPnZtol944tvuNWjsIjunY20vtwReq/6b77fPRW9/ieviyqf/TftHM4r+/pT
 hdKLgEHJHm+I/t1xjnHt2NlDURAB20p2aeXVMNBP8m/TCe4guIGyMB1IYIrR9qYj/tmiK1nRwh8
 pN1cH+b/S1x0LB/N5z4zCG81AGYTRrQovwTSl85ix3iRUt7ofqEq3G2sQ+L8ija2Bm95aCLVOmp
 MBOwSc1kTY7X9560AwqvI1mDQZZLT4bihprHF6IEjxLg7A/Tp5cKzakyi6pJj+x2XgyWsZ3KZwV
 q/qiQcFSyMMeL9akKfSMRXIMz7zTSktDDrGFiQQXmJT47jLFPTuE1LGZaiT0trh1gF7/LY2IfF+
 S1aiQTRwb7dr2r7G1UMp0yuCNH4wHW7nCkC20uaQssr7Mqfv/z6xK+aApTBJZMf5q4n/sSKOjlX
 rRyNS7DijYE68Ueoi2uz3wD1+t3njTLqsv4kqqEk8ZhFfeaJJzP8rJPpBywIIhV3S4SCe6TWdIP
 pxSsg55LgYu9itg/01Rq8bxE3WQDOaVaVFh7D9eyzt+asuZAoQJjFgbSpMuIRmzMJdlJdmAawdS
 4NrQTtwPAQuHoBQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: zY5eNekJTL6l2-veln-vb8wE_8ZJkkom
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXyZPNKQh+yjAc
 rUrNhWaP1+shDI4SQH7EWkOpVQ0xckpk1R/YfLwsvFezAOQvsy2yF1M3wFol1icxA/LapOh81w3
 I3wheYoqO4TZwKje2AUjSl8befatfSCxc8gGNaGVJkmrUwjD4bFEchroI+nhNTQhtqn4i6QIjxb
 QjjW9ISNO6vtYdpHUH5QJH1BD6OyJ1CdHqIxbsTAgtS34azk8ZJvOvKrgBXCf3FrUkAlBLW8yhK
 TEVT6ZWc+ewMBec+2OXGC6UUYwYD4uhayULAN3xrh2DG2W2/9ux0oPURwi3ADEu85xqpLstMrTr
 ORhTt2PNYIujrxvIc/rDVrAVfCYjxPkK1Lr8rdhad8n320qI7q4T6TX10YmrIllCPtzkTy1/LRk
 bLxdgNAnVG2qFyz5IFw28Br4VZ//7Y9jSqsgfIURwB/gz4AYy/H4hUPy4fCaWrXCc0t4fqbFD0Y
 VXP5dXYiJtma6vWmf7A==
X-Proofpoint-GUID: zY5eNekJTL6l2-veln-vb8wE_8ZJkkom
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7ed5d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX565PHDPTQChH
 Ot08XXgraw7patA9Mo4kuW3i6EZclTwt2DZy1E2J/hJzv/aCu6NEL7fv5nceHLW0QMTyt7DeP3E
 N8GluMElDO02KxcsNIAplnJ/A2Bq5EI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8550.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index 36a5b7de5b55..4d6db0e59bee 100644
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

