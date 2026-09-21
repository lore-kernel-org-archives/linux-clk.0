Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0373331EC5
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 06:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971597; cv=none; b=gWlsCitadCF9wM29fqUIP7SARAlUEuQP3JQCasz4Ky9UZMxJ9O+C230IGc1n4L8hIQpkYRa8uCClSVKlBZChbVsvuW9d1aWgel3KNyB92hs3bKvg3fqnmxRM6OQCAqVAk2vDQ5PfivCcD0ZJTHicjWhG2MQA+INQ3OT9meBsfRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971597; c=relaxed/simple;
	bh=80/vGrZ3GHUbldEoaZPJNavu/WmYAHTn//dUWIpRDOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gL8a6rkGXCjRU8MmaIUvAw46RWd2xkjf5gNtAGvSrjwJyoAL5NjY3e3AZZRI+D3Ozzql7NI/1woBCrx9sE96FiTkR4JY7i7drrn+LcY5zQuKKlPKBByBmKSebCUMpQ5IknkBhpg2hdt6k8I7Q1gnh/asLLlPUrcgH4XZidGCq3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PuIfRqk2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RLJngAd8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PuIfRqk2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RLJngAd8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Z6LC3550344
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 06:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W1GrKVI9HDm4uvapAYqDyihZwduMuJhrjZ2Za6rHkrs=; b=PuIfRqk2QP7HSOZk
	fTqbFM0wMZMvB6w2T08iTyr8zCAicKvM6dtlrZi6ePtwujzaHOKEGA8lFIkxVua8
	jX52Sc++aqRjyeoz/zr290QvTyAinTbuetZ/PIO2XplgAllWjMVm2RMdZQZ5q9i4
	iAf+nzTBs/7SCd1aAiSoq8uM+Lee+n3FQKLo9DdTlawuYWmgo6pjRse7fa0IAplM
	jlOf+gW8S161jhqR4CaeMIZ5vDfpj49UgVaLEm11EbP3ZD9CNF3tDe/piB5doOOJ
	l9p5zg5az0xH5kZIOZvLmogUwM2wBi5tWoCQ39hdCQrv0BmcnMXAZXllWs1QjB+s
	BamGjg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs84xes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 06:19:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb92868263so2298383a12.2
        for <linux-clk@vger.kernel.org>; Sun, 20 Sep 2026 23:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971594; x=1790576394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W1GrKVI9HDm4uvapAYqDyihZwduMuJhrjZ2Za6rHkrs=;
        b=RLJngAd8aW8Rv3v+eRUk7yYZ2EB+5cYbkx7RtG6rQ6aZ/nnNZtTRGiYPigKOA52N7L
         DanEp4n91DSEsNXZRw+86pEluPAawm7azkjcoEhcBNAs2ANvNaeLWLUomx79nzDfPJRA
         FQnVXS7XkzrsM9LBmSYHbV/HERGBZ6zvHQlFgsrUwfxOwxMXqgzJItBPNUr2LRVKkWxR
         tnmklhxfpQl2tCzuyEHWccC/4ID6QhGaZEKqt6T6bSSpxpMNgF03Hv3oSuqAqxmBuoi6
         CMnhQK9BJCi8b3pkwfrN4U76WjcBs4dBFnEfFmrfq100F3GsdVoZo9JwG2JK0TYra5Td
         f/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971594; x=1790576394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1GrKVI9HDm4uvapAYqDyihZwduMuJhrjZ2Za6rHkrs=;
        b=071wUrLGbkTQUUlN0ih8y5X31OBc+yZosgVgRykHqyfV355Zaa+bIJlqZmoLoEHAcw
         mKCzzGHdQQgFP+Zl6RzPhJGOfRJmLLMLk+AbSg0G8f3QMjhvfpTyvlqz9DIASqe1DK9i
         k0hcepJ5X3PmaQ40qfZVvI9rbZrH29Qq7/kD/MqOxW0DqjI241PoRIv+uvG5SHYw0yu7
         r5etBKgBHe+yXFJDrKeT5g8DlkHi1zHGcmF4EDfVm4Bpuk030xbXMXZ8MyL8UQVoo0Ue
         5Ml34bIWRu/rBr0GIsAh/5nbtEM7pkdt9eod8s/F6LxWzWWI0fCC7ydUfxzw4wL2fQ4z
         6SjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoLVFNJZybZEqR+TMaY37KtBX9eeiago08XcG2TF2VjrVEYdnCG6HIXvyuTfCRmF0wd3QeZkpJ6Sg=@vger.kernel.org
X-Gm-Message-State: AFuF++nRNoqn+oDOJO4NX6zsFdXT11mLyfwjvF1YFT6nbHkvkIs10pTx
	E5VIWx5+EDtD9kfWhdqXBHiZYimZ13A30kWt5V5bF6gdzTAH0/hnNoDUgACsNgkxEelDCzPYMnl
	f0EvNAe72GIj8z2g7Nyl5g1+hzNo/b1Dewj6b2IQ6yCPxCtsjWDDey5LqQhhWrpg=
X-Gm-Gg: AYBFou02FUAznpFL1EPb1Uk4e7aKkHCcveji3k5Ok6gq+JmYe/HsFjfoZL8pnkUgH20
	Xx4dt8em/+IfOmuiXusGdusXlUfa8pVY5eBQARtZDMxB8//BG3smDzNdbuHhPwndBZTsGxSw7aK
	FhZ9ed2PWtXDwya5mNrNslVX5lqrJsnbX6l2IywiASWGGLOH/OqDl40PrJjhutXBvjNZSkkMEhw
	u9rVRtcINmNDISGIKTmQ7/qfEqu81JbX2HMFbNBk4ayW2JaBDMTzx80Bsb9lHRP5v08uwiTAqoI
	SSSq7Rfl/gUnoez+9eDRrJPdSKNB08UlCilaqyGEhKr2AhsgFSZZuItBlfI69kFpaI2wQ0FtrAR
	QKVgRImBjEVBDsQe9+NAwpOwRdChJ7/ulC6M3YaHznswk2KYgqDf6Su4/vPzHHUGAX7OFwR/kgo
	nhhlELenCviuJtxRuBrrCJErMrBDNw16BZmg==
X-Received: by 2002:a05:6a21:7e8b:b0:3dd:a00a:7acf with SMTP id adf61e73a8af0-3dda00a9faamr7840850637.60.1789971593733;
        Sun, 20 Sep 2026 23:19:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:7e8b:b0:3dd:a00a:7acf with SMTP id adf61e73a8af0-3dda00a9faamr7840824637.60.1789971593315;
        Sun, 20 Sep 2026 23:19:53 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:19:52 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:34 +0530
Subject: [PATCH 01/11] clk: qcom: ipq5018: add 24MHz rate for USB UTMI
 clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq_clk_changes-v1-1-d242e3d49648@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
In-Reply-To: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: 0sy67iZTtyTlustzu7LrGbhAcYQgIdDl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfXwIXM+8+7UZwN
 umCZzx4XQQPSUItVGdb75Ai2HN+b9ZISPsUxOpY4K4tiju+sk/y37JJ8xvsJXfF6X6A+Nz1hhbL
 SLoT0+WZJXwBBJJKq7vgBZOqr3YoI5k=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6ab0cc8a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T_jLbkAMJ8GdCbUqRukA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfXwNvWqMqADi/f
 HuJLJ9yDEuNr4iAVo5gLzKm30Ipzx+KPDj7DLoehPAMmvgKGufBMh4YqyC6I7PmTlQQestXzQrM
 DXnQWJHeD2xL5hiZhD1QaM2Ib8nOI+/i1WOFD+Nc6zzZ7NIgS9jij1dqkSfE3RMvwIZeNFO8ofV
 fYamBHnf1Wm0yU5agyyqZgIzOZhkgS8dIi6OYRp6SMLXt99eg7TBYwViY7Xmz2pdsI3YZauVsNb
 3aRu0XV/RGIt56JDWLJNra+FHC4bFXkA+uc7PaopkcUnVPId/5MiqCL3hDFjQr94P+iRytdZrnG
 B0ZLZBUO4G54nqlmJYbhGpIk55X9IEhD8yoowhD7UxSflCgaM67YbVbjc3ZduPpU7AwkWjUivXK
 cZXlTE1h5v8hRucOLsmuNteMF08myJKTOg8GySTeuA3hARWQrEdEaNY5RluojsgUurQ+ghw3iau
 ghjJBno2CYqcDqR1KIA==
X-Proofpoint-GUID: 0sy67iZTtyTlustzu7LrGbhAcYQgIdDl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210089

The USB UTMI reference clock must operate at 24 MHz, as recommended
by the hardware team, for reliable USB operation.

Validation showed that USB 3.2 hub enumeration with USB 2.0 devices
fails when the UTMI reference clock is not configured to the required
24 MHz rate. Configuring the UTMI reference clock to 24 MHz to resolve
the enumeration failure and ensure successful device detection.

Cc: stable@vger.kernel.org
Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-ipq5018.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
index 594dae3bac4c..7d0889eeffd5 100644
--- a/drivers/clk/qcom/gcc-ipq5018.c
+++ b/drivers/clk/qcom/gcc-ipq5018.c
@@ -1260,6 +1260,7 @@ static struct clk_rcg2 usb0_master_clk_src = {
 };
 
 static const struct freq_tbl ftbl_usb0_mock_utmi_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
 	F(60000000, P_GPLL4, 10, 1, 2),
 	{ }
 };

-- 
2.34.1

