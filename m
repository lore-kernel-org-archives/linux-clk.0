Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4DD4562A1
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246457; cv=none; b=kVmDIy1Jdz224i2PyeOef1A25vYoGbhIS03g9doFFQntAbVGf3sDl46ftx+KGIFiXpd9YnvOMY6GITzg9fKsp0OrVRSi4N7tY8fO648biZuanfdNZDRoT42Ad/C7dH+h0bw7B8LqmBsrtRU9c8KXOPuFDQlzZDIRPE1lqy2BFVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246457; c=relaxed/simple;
	bh=pxpWIPYAAKRdf4CVHCE4SHi4Vq5Zm5vjxhNSS8g8qOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RhjWiYFF0VuVUFX/25RarlHURA8dLd2o9sDwsEkhKXZK+nZCYbSDSQC/V40BaDTMtMtaQ0PmNXTHvOGF2aI983NAzh51vZWy9BgYwavvGZv87IpbnmXA/FYbOaj/G9+f9zTnlK2VIww3eKdwlTJErwbLUjgWwXyfeZeda4j4EJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQwF3EZR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VvngVGXJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQwF3EZR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VvngVGXJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA5LUW1175627
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yTxapWDRt6RSXBUQ4A+5zXCQbxO8Jl+SiQZjxhT6iys=; b=nQwF3EZRaIwJkoRB
	ezt4LJ2rTm3Ksq1KZBPuGvdKRCy29p4SqPde1+0wRpbzP87cj5iz3IbzSux7Z/EO
	92zlP/SO/l9FamUkSYgwvozPHyH+d93wrqSvWzdspmb/fULUysUzSac5Ko8Kds58
	oui/A0NM9NvPjE7tfzpftmO3qiQKh84kFoJcqWbLxpqLsF86phdVRykf9hfot5JB
	lhuGZ+pvyzxw2WIn0PTmHLAr10VHqXKerEu4k2pgELFgqX4iQsPxpptSvW9Hvjtp
	Yo6I72g6gQXBDn+J1ByfZ0/lTckygeYC/f3MOlrAW4ks4Y3vmmzroP/ldJY5Q8bq
	QC/vyg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7r44x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:54 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7a04805f8f1so1750351137.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246454; x=1790851254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yTxapWDRt6RSXBUQ4A+5zXCQbxO8Jl+SiQZjxhT6iys=;
        b=VvngVGXJD5soVWeDe/mrQTdAdPq0/C3DW9bVSzMjr35QhkseurwCxkdLhdaGlAN/+Z
         VModWQvlM0E00lNtUpX6vr5zjsrsCN4Q7YQQ9DjpvwltwxV6ykH5ulPaOIj4XqW+87aB
         Da6lb1iTGEqCPdcw2kWftGwtcgc9+UwzZUeGfzYbDjO5R1BFn7Grv+V6b3t9SbWiYqgB
         JAkrAKtoIBFti5KLxJsPcWO9kPD3UL3b+mi7Wl0uQj+9ZjdKZpQEu22jJFlMhUYHvW9m
         0KmO9fh5sGdTJg3FA69rEWUFhqpmbkB/L7DOY0GcpbDCfGaMpP3Wx7RAGzRDK1yL0fHE
         YLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246454; x=1790851254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yTxapWDRt6RSXBUQ4A+5zXCQbxO8Jl+SiQZjxhT6iys=;
        b=g1rVoJDaK/jPLsh1K5xhVu+OWQzYzwE0uKYNlCe3rUN3PE9xQuVkFOH60G5XE1iIIr
         5lQfFToqGb5rD5XnaXNUNH4DVTqawJGzSdHKzStBujpwwwjkRKeIAO56StbG+83zxK7X
         KNsuaixabUqb2mszye58GpXy0bAXT+YHUdiM9ONBemArHLaEjeJvVrs5La6mC/U3aqeD
         iIrCGNwo2G23dB2OIsNtzipTMrPY78Owz/EX7iSxVNgvczT6IspVd7SkaKdxep44co6g
         3VLLSKnOQ0Dcy/RKILl/cgSETKYTCmuMu3KM0KoD34ogwSS1HW4tRAXMx5ZbjxdaN6dU
         DuHg==
X-Forwarded-Encrypted: i=1; AKwUvBygtwlP6yuxf5hvxcU8UczIGzsTHC4qByrzAizoJl5hG+H+B7AtZ9Zyl1iJoEpOdzEpO2bGMsOU16Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mR1RLT5f1myhEPlXKDbBz0hgAOhWO5xoIj0aTJh4GvKw/cvJdp
	pwzPu6+/D6lMrbGs5fYcVpaVN3G3ZfWlMCetyQQMYrGZogwgVD6COwP5FeuZN98q2DR/JXuF5EU
	kRCYoRc7mBAm330epUNWjOHfut8jTpANlLVcci7eALHTpGKjIKRILvZvsZxTAmao=
X-Gm-Gg: AYBFou2gxVmFBsXVVgrqrDKAKZlVT94XK3lh5JNUBEDUUlOI6ETF2UdT8/hUxlEMFuh
	zw/+jFgECAHrgDX9oQSyTFutrUp/iEFpAotZbkF367vnku8Xu319SyDNhYDt5tS3MCtPxWe/sbV
	KIL7401ODtOJnuRmiapQ/mSOCCyHoaR+s/cZgxK6ZVJQXR7epABJ7BbmeTaGYOPWdKlO98WBE/s
	Eyozuf6FtrR6vqVZuK0O4fF8sFrUzIoditpL/7sH3SSGOQ8RaacGMe3WgsIK8HIGO6iHN33mjWn
	lAgSwfK6SG6mMd+QGGQtVQpT4zKonRpGkwYrdQaN05u9T3x506vMYeH5q9K2HpJ+M9qSZAZzHiJ
	gcUN7GkoK
X-Received: by 2002:a05:6102:3750:b0:7a8:d959:bd76 with SMTP id ada2fe7eead31-7af1e2f30ccmr1174018137.33.1790246453850;
        Thu, 24 Sep 2026 03:40:53 -0700 (PDT)
X-Received: by 2002:a05:6102:3750:b0:7a8:d959:bd76 with SMTP id ada2fe7eead31-7af1e2f30ccmr1173981137.33.1790246453300;
        Thu, 24 Sep 2026 03:40:53 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:52 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:32 +0300
Subject: [PATCH v5 16/42] clk: qcom: gcc-qcs8300: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-16-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=pxpWIPYAAKRdf4CVHCE4SHi4Vq5Zm5vjxhNSS8g8qOU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3p+ZmrOqdYWrQJ7G9djCHjGLgXj+ko6yWl3
 a1vCqc75uSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT96QAKCRAbX0TJAJUV
 VgmQEADMm0B5druO6aYKKDtd/DTRDtznUHo5vuD5E9UzGCBrtSFZLwSJRrusvsD0RcmbtvlAXwV
 5iutS+kJJlz9VHticm3LYz8ZBuewzALTqZZlCxZ/t1deRMkif6O68Jmh9iqEBnLWZhUbfzccYpZ
 sBA8B3HyALAUj3kuf4iOim3IfMdhllbWupdRNbOf6ob2xLBDA/6hsl7BMC1a3i1M+KOZeXeE6hv
 i/lSbFJ+y7o6O8NvRLuODDCkrcrMs8rRD6Ht9KInTDc0wnmrPn0ppBS2w30o3ZZGoacRGc0oRHf
 sLneA0ETO0Z5RJl96h28t9wGmT7Z+bpxnB2YAT8rHu5m24l3PQ7bcePdINsx5bwF0PH5CbpNSCs
 dgo542iq8BmTbQNsPoagMKNI2yztII7w4FfmheXI2Gc04/AYfEMENzhB3ogIZDcwr5KKEuxB1BN
 0HEPpgbF8bk8Doj7xIu/9GTdObJO1RjOR4IqsotTm66E3rE4EFsCzLFxEfRksZtAlz6Xx8+XPLx
 jlyqjGU0Jl0wEUXG6F3k5EX+DUqD9+s0fktYlOQVntzDKDHbZZla05w0qwqfKthvTUNQ6tlg5E9
 zegv7X9xY75JZhnp68XaU7ROi9eWW3nKxrk/PWvvHWs0IvWR2SnLcjWN3sbyOdURdJRJ3Ueq94H
 mbvF4/IiQpHtmRg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: WU4XByZ-QxnOMgzLaqPKtTa9tJW_VvT_
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab4fe36 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX9RrpHrZ3Gov6
 XJMojfHr9BcKnG5Nm7yCw4CWu1fnB6JjNtZq9K7tPJCyqR1oZb/f7bgJhpZ7svmLaO8xTYEsIub
 +9WIG8Lk0+8ZOPet3Nemzxk31TWRszlxHEgbE4EQpVuFA8jpZJYdpcgF2SjfH4ye8d3mlnul0l+
 V1hz1g4AYsTPL9rmwaG6vKi7iypKqf+tapHyJ/t0cwHeDjgW3nXQ7hiN1QOONrT/NnK0dGImcFw
 3gP81tqbjDI3XhOT8hrdtSvceRkyzDxUu8g6N2GMP9iKXQdzUZvcRXk4PpCNhD/iF+RAOLhCwL/
 pFlHFBuNKHsx4TuQzg20oo5lPQoI/nex+ci/6AvLZ40t8uDUmIZ5Gj4/0jWZx3xjglHxtJSBHSF
 GPDQXNY0GGMdlapKTw3ZWCFnhwZIytkxySrsZW4mQo/bHiAanjPw9HRsghymepf1+Y7pDxVLuG/
 o7ZV3SPqPrYCr8P+xDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX8MvX9gDgznA6
 qYZRziWBfSEtNtaWPVkMaLR4TvjZ3sdpS0ZYqq3KDtSAX6rjEUJpip0v4q9RmSq70mqOpzMq7Xe
 j6j+fTEc0j2OEKQXPdE76/SSNeXhwCE=
X-Proofpoint-ORIG-GUID: WU4XByZ-QxnOMgzLaqPKtTa9tJW_VvT_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs8300.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qcs8300.c b/drivers/clk/qcom/gcc-qcs8300.c
index 57014c4f8c6d..fa57c3989eb1 100644
--- a/drivers/clk/qcom/gcc-qcs8300.c
+++ b/drivers/clk/qcom/gcc-qcs8300.c
@@ -3681,6 +3681,7 @@ static const struct qcom_cc_desc gcc_qcs8300_desc = {
 	.num_resets = ARRAY_SIZE(gcc_qcs8300_resets),
 	.gdscs = gcc_qcs8300_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_qcs8300_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_qcs8300_match_table[] = {

-- 
2.54.0

