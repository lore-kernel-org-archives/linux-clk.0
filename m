Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B397541D130
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572564; cv=none; b=P7bO7SM+h7q6iT9QZUzxVRthWzdSKNbbREo30t/nOIrgigiJTcvrENNnhGuzhtCwIEe1nDtKIZW8I0Tl/ZO/pqrArJCyYOVO6CyW2QPs/P4enk2k26xTbT270smnpB57soVAPyqTLGYW5AM39olvdcVsyhfR43gfjp9KsKooKMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572564; c=relaxed/simple;
	bh=MRJowHguzbNfcT2rStZLwQ8PUcKy9tX4dDpzrESdV+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B4Gx6q3jdxl8z4TUoiIsU9qBZNRKEZH4k25yoY2OB1wHVo7pSORjNyPF4KwlNXX1TV6VsuNZK1rdr2OEr5wnTMSxPyBgPvq+HDPaug8b9qSLKnZjFWf0+8fRNlTuLQ9nJQc82RKO93tXyNq/WexzM5V0e16Dk3Tj9VgRYokUK30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AjB+pWeR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CdSnrLln; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AjB+pWeR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CdSnrLln"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMeMx3195023
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3tDisx9byyde7jrmeKqekh9TmDooMSFvQicbyx2kZ0=; b=AjB+pWeRRwPBrNN+
	0b9kKNcniBw5VXuZ+CTAPXsb+dcXmhuPFtUXJLErvQpkCpFxFTTxEzeTcfkDdH3+
	cixgbTEi0ohIJ33UT8v48Zw08gsmvWyjedgm6fHRaB5mN8LNOV2ypd5ve3f8FXV+
	boz0GifEx2egpa9++CK2QREyOtTnoP2NpEFjIZoUNNKKtb4UFZ//yiANzF0zacjg
	V02qwB+e1Cq/fkzIcLKqbyMb4qtFIc/0ip6W4CUf8aEr3FIJy1Uw4n1pR2fcOtKN
	SeHopZpL8fFSAd5nmwWUuz5AULuh4gfhX1RBILzu7M3/aVPLAhltITOD9laEzOgW
	09L5Nw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgs2y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c26012cd0so34147691cf.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572561; x=1788177361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3tDisx9byyde7jrmeKqekh9TmDooMSFvQicbyx2kZ0=;
        b=CdSnrLln32uFvDKAp8QlULXv/Te5WT1UXuQa6AhJjI7rvqlP8DWwC5rUG9qOO4AsCe
         7jQ+DZ3MKleqGR/JhhkzNqaFXsesg5a5LSGA53YhYHa9N1odZIlATur2orkml6W/CHjy
         irgjIqjVlrzyf3QpdlyL2Dyx5M+BIr4+NW5zNaAJAFh1QXAHSGbuVMtVAW4afCA6HGZe
         wZZ28UZ6q58OvCjKDTVAILznYVLEqa5ZJvXtvwlDYdpO66QPzjt6tr+n6ykBE7v2Ii/A
         9S4PUlR3F3/uTqsyH5fqZE0a1Se4HgY2XVW9/oxhN+93e4CnuuJOeLUZJyBst9XeNGTn
         RLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572561; x=1788177361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3tDisx9byyde7jrmeKqekh9TmDooMSFvQicbyx2kZ0=;
        b=q5J5EdvrF6foQtkzLQnY4kNCnLeuXcKzu/ObirC4NcSHf900K88w5ManyetCl7C1z/
         B8azX6YppiFSjMjMrlGvudmV3fxJDG5eqnS2FP3tS5VtXYCDLUuv63sTgHR7ZD1uix8Z
         i/uVlAu90TivmIoakDSFgLXuOTTJSzKzg14hUXVrjf/0blYyYy4R/gYC9zugKtJj0OIr
         J8PoeLh32Fb+VKi6uJj2H76EI/J7QiuHZljdVyvZ6/Q2vD1cZMvru6opSV8dCMnNvjRU
         3yjDeU6+sQ6prTP65Qkh+t75UJLGnI2NU0lkXk4IeN/Hf1OmWNJamCFHY1cZydAKVhEk
         GSyA==
X-Forwarded-Encrypted: i=1; AHgh+RrPPIkxIepcx6VR6q8fdLWlV7kf+9DLsXGdTIXnZi3SDgAaN80WJ3YlWGYDQo6NnWSYrcZCXveO2Qs=@vger.kernel.org
X-Gm-Message-State: AFuF++kD8HxEo0BChSaw/1D26h8H0NNJKTVS8Q3fwLUVC6hX0tZw6Xaa
	Ms06weDKWO3HmyTbo9g702gDP4esjD3ZBp27+R07sFtGwn5jRWZLhu0az2UzcnGhtzlF00JfBU5
	KXZ06T4C8pn/h3Tr61BePIFIfdjCFNJbj/k0aXmPXdWoetCFup38XlnUZfkovDog=
X-Gm-Gg: AR+sD11qmxtSGU/S81pCAbLum3yp5h6e03MnzDlY71jny+of1k4z5/oYU4/e95V8Xri
	VDo8Y/537r4m+BEz63EGbjx6x7f/bQXBCGtnYiFU4OF1ozG6IJYxZ1CxWRo3JTQC56rxZIdCXo/
	wJ3yP6wWuctbYFkyaLWDCdN1qtclfchdAuTwvhk86/lcFrVkEZIf3qvhEjR7MhLY/hdUgCC5IV0
	a75Ickbvftb5sgIC5xOvdsaaSAwzZYzGDWzD7wHFU4uPxC9+36ZypQ+9GDQWf+5AnADA9ni9m2L
	Pye1PSeqGZXpkyDKq3FabHhqYLTtBl+cuHQ+dy2UmCxAPU/5fd3x1E6mFWJWRUiaf5pnDPCwDwd
	8AmExXKgx
X-Received: by 2002:a05:622a:1f91:b0:52d:8c01:5238 with SMTP id d75a77b69052e-52e09cb983fmr163063361cf.33.1787572560660;
        Mon, 24 Aug 2026 04:56:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1f91:b0:52d:8c01:5238 with SMTP id d75a77b69052e-52e09cb983fmr163062821cf.33.1787572560064;
        Mon, 24 Aug 2026 04:56:00 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:12 +0300
Subject: [PATCH v3 25/47] clk: qcom: gcc-sm8250: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-25-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=861;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=MRJowHguzbNfcT2rStZLwQ8PUcKy9tX4dDpzrESdV+s=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDtOyoGs7O50Nhu6TXplPr/b8hTyNcxvnNj0
 Jah4PmK13GJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww7QAKCRAbX0TJAJUV
 VnBjD/9I/0PKkqq+H6p9PPNvTVEPbnmRP5JtJ9+6GyYtCwQlnKb6kkLb96AdbrJxQzQ3Af8JKMx
 jSEjSAW2NzL6WorT1x/dLeWODU6e97kstgbipp+6DTqu1i2Jr2DUVHiDvygKGZ/EY1p4Ox38f9Z
 mNKszuUtG9PjozGGATP8m5fy+mMJpia3uKtXMWRLeo2X69joHqD+1sOaNNPzJ2KIznEsviiFb1S
 FaA7bHBTiKpO3a+IHBzdB6UJ85VIsfTOsUGrgK7GV0Mjca/6UsO4Ch4EK5aHXu+jjBOU1dm4+UZ
 7/McBdKxtjn0gawB5AGYHqkWbJ4u/HRI2XyvmK9b7v8Vw2CAOwbt6lYnsPxZarjRnZRiMoBDMj6
 wm1RboaktNaYvtqGEgEqKKAwuFM08f3/ZKJfcHI5hl8X3gxUS1neLr1O42Likx1Lf2yWKpAoZms
 2gU8qLlZ5e7gH2Z8U8b164g8yzf8zrcK8QyPSM/EZwM7IDytZmrQ4CEVZoc7wWIoJAhAi4B6URH
 oIqnpEnV7CVQiGe4I3Yz2isDq6UMt56LIHsvSzoJY5mGwohpuIyr9afnkRgJbFvZeBcQP3L9M7S
 MsT/KrR0Ksx03TKlP1hoqG/bzes3OyC2dIlr01e7UiknTKA3QuyAHK+Y7+0LSRw3LRGkEOMF4h4
 e7/wz2JiEiNL9Sw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX9lb/999x5J5U
 pLpiA02eZntMbAJLckh7LLgew09SrcUub+lX2IQkq+7oCvEbOS2uMVHOmD+IZQ8obDMEjGCsdAT
 dz2JXgNu/RUr7hN2RQVEWhpvMXdT7y4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX5Cz4Zab62Jj6
 aSiO1bZDNRQUw6ZnXj/Q6jyZCCFFk69U9B1qviF+jVIEMmRcwcT7ohC0Th46skp3gFrfDa88B7g
 5Vy9cotmVqqKUXSVipnmDNYrxG0MhgkJ7AiODL0qH/i9hiDT4trnfZQZPHFdzrMTFB3AT0DQWda
 2ZztkSY8cFvaVLvRQ5RrjNsRdZAEd5mo8z27gud3yhOZq7mBu0aLXUlOKxxalMl5Ozz3gd3zlSW
 jo/FmAs2RlFQ/ohwEi71bRPR2o6nOySaVycm63tzNUiCX0syaQIMducdlPu4qFvOqOlUEEjTJpp
 3oNOtlw7mXLrP6QN4xcba1ppNfjQbB3s3vdHo8okn80sLjCiv62n3sDPK5c92spE1QithcB0yAw
 jZzfJ01POfgf1X8MDidNLJ0kEjp9SagmikqfC6/9628KwDhwjuXk62Yjrj2KvYegW2v8LxTZN8O
 O9YS9QZlqesxuAs9Eww==
X-Proofpoint-ORIG-GUID: AJ65otd8rQ3m0FfT1jlVpSlShSw898av
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c3151 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: AJ65otd8rQ3m0FfT1jlVpSlShSw898av
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index 1c59d70e0f96..86c2be3804c1 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -3618,6 +3618,7 @@ static const struct qcom_cc_desc gcc_sm8250_desc = {
 	.resets = gcc_sm8250_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8250_resets),
 	.gdscs = gcc_sm8250_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8250_gdscs),
 };
 

-- 
2.54.0

