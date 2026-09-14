Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB78481A8B
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390158; cv=none; b=GkMFRnMUKJP5eWB0UI0+aTs19ZLTHNrHAaNIZLrd4Ep+oRUGXVfdKz2lrVU4miDEG0Jvu5mMDvX7i9p/A2oGETWjvEQRVLCITL8i9iHYpKnOdruwrL7lBbzIIlHBZONHoJPPurmVVe/rOVSaL+oF0ZxUjfsUJLhXgJb4ws+Jr7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390158; c=relaxed/simple;
	bh=0cKPDq8bRhl0Foa33+8MRc+vxqpYerlRPHV5hLOc+Zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A3Eaw6sYNVq/rDxomNFrcMqtxn2itfrK/y/rKBkeEuTojzjwN4Vn6ieR2kjQ+OnvoG334qMXVPiXb04m9V4CAUWMzikATnYMU3iVaNFMGMpcyp7nRzWyh6YQqi21owrv9ByksjX6KyirswsnSpswgO3BsNvtUdrUYwFq3l+PwR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XfH91VcK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gca/0Z/n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XfH91VcK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gca/0Z/n"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm8ts531013
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sioYahUjRVzX5HHBTg8Cm3Svh33/5T6l//iw4ajAwRw=; b=XfH91VcKGapXVo8V
	qcXXDYqoZK+uQLLyKT64ErQIsTgNrPwObO9Zn0MrO9LmDcY5q1P8MDAEHndYdHeT
	1xYF5Ea+TCbi8n5sc/kSBf+LLJk9JlUxS77IzY36uvjO6hKeZXJzLNfZvHsZanwy
	+iQy0IPJJvgnp3VCMe/HgXuYnifGpjb6HU/c79Hqy0yZYMOSpKjQ3JNy2kdhB6OK
	n7CzNKGowNTN+E0viV7omuXULsBsXXbhi5OhZ8tJoy+A1CSAIAvEjP0BYoNx/A45
	l4Y+tXjnURH246aNQAV5W8ghbIhCieD0oH6CxVGQq1aXNUV82yKZ3cQrxQ85id5b
	SYdjnw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hstfqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:49:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a07b5b5efso305177585a.1
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390154; x=1789994954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sioYahUjRVzX5HHBTg8Cm3Svh33/5T6l//iw4ajAwRw=;
        b=Gca/0Z/nwnrMbxjLnrsuitx2ulmciBTi4CGFDCd+lnD1wLQjWZXxlkq9UPT4FeQSTu
         W9uHIF3IuDCQp6wLeNg1Oy9C+JBpULetNV5IsTKz1lWZh3T5SbQ0pAbJOPuVu0hiexiU
         U4Rjx7dpTHtqMSyPKi1YFOyCk/7UKmFDWz3JersZyf2MyKPO1R7WWxBihTtF4OCowL03
         wQPtwo4WjV0O/B8FEBMbrZit9BExlNGgiKM+hzA3pZ4Gxi43VKxxntYMXI8+2/pp4GeR
         H+hUXT0aN9tys3n7EtX4kEuLpAoC3PSIbKx9H0TB9vF42z7ycI7vV2g2Ofd/afS+HI+M
         vT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390154; x=1789994954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sioYahUjRVzX5HHBTg8Cm3Svh33/5T6l//iw4ajAwRw=;
        b=X26vXXsUVhvAEf5Q2Ox7vfL/dPkY4AYJJWE0sBXXL+sFLUdba2Gj8YzMMFRRJF9WoY
         nSjMrcbbwBoZkPO9t/Of/O3bKvbqRvLDwH0NmzvgxLNHkcM1ibjh1UMm0FPZU72ALnnq
         sz7dXtGGAoLuO86ZXfVgV3GtnbMnPZPl07mNPYTDNy8FuDnsYV8/FhJpFuce4kN5rUG4
         igqnT9AcDhSzldOHl9dRP7JO+lQif/Ufropqb/6UABU3p6onV+TnxTow3SRBveg4EdbJ
         teo+13HeG3/6pWNhnVF+dbieTh7KfYz+yaJsF6O8W1q6YEVEpD7WSxV9nAH2UDbfYAw8
         BVbg==
X-Forwarded-Encrypted: i=1; AKwUvBynFcICEcCtpx6alV+019ypSSxn8pXpw1uIg0r8HTr8uKiFA0nK71IoJVmwcyXcZf3AtmRk1baccNg=@vger.kernel.org
X-Gm-Message-State: AFuF++lV58dBZQzxWT4s4bzJ9/T1QkqHexavzHHGiq/S7I6qwRKrKarK
	cUTLHFugr3H73DID4rGW+/V9feV5UvBwoWujUqRx/h6TaFu1robnSePiUXoMACY0D2W4NtVETlY
	tX+BBEUMjxgyrsd+CCN0J/W96Lx1CPMjyz9ZI3ZwSXZVaudc3CQ8D8JXGuZIx81I=
X-Gm-Gg: AYBFou36aTwgP0/6OX1XhMVPvDQx8oGDV1l5frTq4Ai/eqlZ7PlksqIYDj7Rc16KzOn
	FldoNbXl1KoXHhNjInZirFo0zdTUd+ZPIjb4fQMI2UpS6drmUmZ2cGxNrovB1yYUCPbV12LmsIj
	/nepLOKV7BA0SlYBpqa9WbVhRqaBBIYts8dnk0TLlODaz9zRDfD2p/aUGK3VVUdd3ipLqrQf1UQ
	a2NOtrhx7M9xS0KVyLSU7EsSttlyeIr39CBzY7jqe621tBCHFahhrS4LHS6uoEy+Kyu2mhKkv5p
	8DbLepLYkY3yRyQBHZXKJpVm3A9Gf+65C02DOpCYMJJaKM53iFGze5cjlVlzF1RG1OmbLi+d+1u
	SxiN0fXkF
X-Received: by 2002:a05:620a:8811:b0:939:af12:f5a0 with SMTP id af79cd13be357-93a1870bf0dmr609555385a.23.1789390154424;
        Mon, 14 Sep 2026 05:49:14 -0700 (PDT)
X-Received: by 2002:a05:620a:8811:b0:939:af12:f5a0 with SMTP id af79cd13be357-93a1870bf0dmr609549985a.23.1789390153856;
        Mon, 14 Sep 2026 05:49:13 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:12 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:26 +0300
Subject: [PATCH v4 27/52] clk: qcom: gcc-sm4450: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-27-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=0cKPDq8bRhl0Foa33+8MRc+vxqpYerlRPHV5hLOc+Zw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zlazRZvGVmV9n7b8YkJTQPxdys+XifXtuIe
 eomzrUv3weJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs5QAKCRAbX0TJAJUV
 VorXEACWE1gDrTHnQBd+MA9FuvNfTwH72aiFSgZpPEdLe7Z7XlGns3Yupqj3btjE6Pd1VYUDOfH
 tSokK4rFl/8GZwiK4s5C9GzHzFC0P+gA3c3WQl2JVAxlf2N93eNGyifZ+FKyXXkUE1Qa1/XpEZ2
 iqVoK8B00z7ONwgsJHQ1HI7mJVU2N2F0v6dIV4Xx5K38TrWJ+DjMZAGI7ejcFRa/3cIjYavBPYH
 ITpxGUbEVe64yw4udb6VBvMXNxeF9NbDai6y7BpShVZLI5Ckz4pj/Q8gdmlTxVUXNykEbUHeX46
 tM+ty12R4rYG1CL9v4Op6dG2c4gPLmTjDHExDbR60OIi9ofLe06/4CwX8tylDeCJQBkmdZhRONh
 JVM4KDETMNnuGeL27NQ1+zsucdkUMay8+zgyszvFUJ4YVwVWnFZGv8IKQ+G5BIqwzaL9nXo+bEv
 ht+SUwN4XAN2pYu1JOHUplKDtJXCOZYpsRtIGtZ29kpS4T1YX27j0nvaZhxhsTfp2QniGleWGLO
 RC1erfpS2hn4yvV0iCF3eKl21PSJiGKtNRynXU8sE9oT4h/UWKo88cvO0InsanJPx5MgatvJQm5
 71CDKyNhOAUI0gBvKa+e040Q06YDbYbSM3L9OLsWkbCuk66D6VWQ3MwgdlvjNBH91MbkMKtU89v
 Q7Lacor+tGpfd9A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXzUIS/qUFWwD/
 7hMekOlLcZCtoeClPI0DGJFaXs9XDcpMVOX7Lu7FCQZt8Qh2+/TmRXC1vTdOGJZ26EnVAWErBnS
 TPurVhx3Pkk3dFVxh+8HmvcKYgTmw5128bH4lUlxo1Obt/arp2FiQQEBbP/R9fHuGjnhDheNqwA
 Kbiq69J8fBWAVhjGHcRaBLYF/a6jml7hm1NuclsmOaqBj5cFa2Yi4lwmpjhl9NlFOYZMq7RD4Pm
 7x1F4aCMbcHUHnxdJo/S1DWC/7KJ1eOr6RCpLpOTSqYqK0KvFgKbjA0RvFr0lW4Om62Svv0AFrl
 rjfBIj0ZfjT6pB04K3xP4L4ABiN/8sceduP26QCJOS0nEVbsdJmnYd2fPotKHwcMOOW9XuHhLuN
 yfV6drQmWG1X9QnxtQ0Je4HFJJlG/eYbcb9dJy/ksoeLQ6VqsKT5Fy/AlUAsutzFbWVsAGDt3cV
 1jS9HU3xn8uWcSzTj3A==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7ed4b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ndWLnhsObnT3Y0S1ygmi4NAWcg-9MY2K
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXwoSIRBHMNx/+
 ty/ttEmnuC7TOM8JRY8L2Dm/9TtTISo4faetRHBYa1dd01YWqLUXRZ49ajxh+vi5bPbJt5gpRQ+
 clzt1GErH+jKc48DIy7c2ntsRl+LOUc=
X-Proofpoint-ORIG-GUID: ndWLnhsObnT3Y0S1ygmi4NAWcg-9MY2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm4450.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm4450.c b/drivers/clk/qcom/gcc-sm4450.c
index 30fc7af09930..41d5f35c8f5e 100644
--- a/drivers/clk/qcom/gcc-sm4450.c
+++ b/drivers/clk/qcom/gcc-sm4450.c
@@ -2823,6 +2823,7 @@ static const struct qcom_cc_desc gcc_sm4450_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm4450_resets),
 	.gdscs = gcc_sm4450_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm4450_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm4450_match_table[] = {

-- 
2.54.0

