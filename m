Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1C23CCA15
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220544; cv=none; b=YktP1LP1YjW434Bh/stsL/8h9GcbSdQwsLjAw81A6rDP1GsxqvrtV6YMtfBbaYbOgBw3rqY/UCnbsgs1RRzYA9JK6iZe2J2+SVJUvCjyR37CtU8kM2iHBTAwFeFXBPs1Z3k40KY1EJ9s06kYsU1ko4UHh2mvzQ8y+VdGuEn2iyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220544; c=relaxed/simple;
	bh=vec+DMGrftoeTWQTfehcJjAH2/j53PBxzFUEMWg19XE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mBHM40naJLiKHNPx0ab9Zq3+Yo5ijB3rQSfLNsBWwMmavBCIcvQEbD5dM/mupJAKAw/cKzk59TL6xBsMvMNJxFrsErnIlV4kwSV8INGmoH+oFVxpf8lcqJuwG9n0y1CMPaj+84viJyREfgvmHyopbztKSGbKsFu47narko73SsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z7i/g4JR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R3V0fPoH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z7i/g4JR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R3V0fPoH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6nGOP3732561
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xc9cRjhmIS2VG6NPtJVb4hI4xDqvEMv8EKXIDrTAkkw=; b=Z7i/g4JRisXoZzio
	hQ3Vhi1GT3fRFIGvkp+iYxBnN/gwUHht4iGCGFl7+qLBcjIidkuZV568R43EjL7V
	/q8nQyozJzdHLyDDaDXBLgN73TVCMelcyBHH+8rbMKOjuky/tLt1vb1k6tLz7ZVp
	f9u37Owg4eAx+0Jb56UKeLat9p4ss+1jX4XVvhAjdhpanOBxYdwLVXG+klgms8WS
	QAUuh0xEtzmcIFUW6DkDISPgO99J/gIGMVJ1j/qjy4qim2YCN3yinGbhDfcTv8Cq
	Bz5OYQTr/AW+obRui6s9kY3OkYtqHmMqNGmIUn8izFCFntP7DzPzfwCAroX2kskR
	JrxoVA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vn88rcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:08:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936e393061dso187732485a.2
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 03:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220532; x=1787825332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xc9cRjhmIS2VG6NPtJVb4hI4xDqvEMv8EKXIDrTAkkw=;
        b=R3V0fPoHICC2oBQxsd+gxdqQOwTTVx8RVJNcPslS/r3jxY8AE/Rypk7OaOZkB/u4h1
         3NWKihuAueMsoJcL0iEq1n8v/w5sAC+2c7s2/B9/K37A/EQEEcYAIv0VBtMHB4up7zLI
         znkuxLBeo7/w9YUmOM0DkNOtbGg8PrbcibiYHEm3UsZOcvByhXPGGL1iMdVveY/MMeVs
         iNK7fp45Osugk+xEw9wj6rCUTyxXTgvJT6qIezWFmMnymnf3gjsKhDUCGSl47q3qTXyM
         VcT3ZTh/79y7hbHQrhS4DmCiNmmQ6ww3ZaRy81djURr7uj2IWXCzBiYZ9Ky9fV0SBfIQ
         NlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220532; x=1787825332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xc9cRjhmIS2VG6NPtJVb4hI4xDqvEMv8EKXIDrTAkkw=;
        b=oC0VzIqREYF0kgbbMATSEGcdxbXQh9wxSmcTlGAm2rW/Bluqx0MCcpxRo+ucYhNi0s
         td4ScVOUTUWWFtje5P35Cecb0E/wG7dwowmBgMTy0CxFL6cSFCXm+cMXHQ92WbtfvQFe
         DnyIegox2/w4FkGsT+ct42DbLNCJxYOZsQ5PbJAS3+KcQ9S/NDIvBWEsYRexDtoZJQBA
         M/Yk4J0tvrVZYnRkJKXlylJIEPNswJ1OhZikkqiXdBzxySAIatrAkZbx7abhAaDrhKHL
         uyaKgOckK3OkyGp+qbI7mkKBHidCNH5c2Pu5SlJEAHHrD+kWAMPkQjoCRl4lD/Em51vY
         QYjw==
X-Forwarded-Encrypted: i=1; AHgh+RqWP1IRHhxYQ8UGvbRQ2AJ8YS+Ep2kBqNHarRXzdi70udZEUFyp1IQOGGWOnb6oVRdOI0AtUM/no9s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1zRCWhOFpNGbPm5lK69w6Zow18kOv4ttvbRj3GT4Vs06KVMfU
	YPuGAa2q74pLYBDxnNa/T0ZUQxU59rHVxadPs9DqNa7goX/Se5VvTIsDwRs8yFBbyst86YpV50E
	djkry8FxGplQgESBD1C/imDBIdnkIk1uUMbR4+5fpFA9XzeGWYhuJiP+FRuh2nos=
X-Gm-Gg: AR+sD13lUNOtGugWZyJ5VKFKXA/dFZeuoCwKVJkQwBmtCUI7AxCxkgvfbeLeSltiAb1
	C10hWJ/EkcGsncXUz8tCBMxNZVend695TIvMtiiaR9cR73kqXGONdIr3MnHnUUIDGnNWy8YaL1V
	sjhB/EgoQaR1t3ShPJmr4MaQg21fIv6ns1cUDiMsDaBHBWgFHYtKJwXYCmSzJR2ig2bj0hwMu2D
	l9CRihCaOCPvVuvZYxpQfLRggkuqNO7Y7EdUEnj/WVFKJITxNYrCl7l9hV1jhtVQFaxo7/jE7xu
	O4Zd02dB7GQ5DbL2vX77KhymSNu6Un/Ci9Bm+M27f7Xjz21KUKxg3mxliL2AGU0v/mmFVbHgymg
	+rFNEI1KV
X-Received: by 2002:a05:620a:4094:b0:927:25f5:ee08 with SMTP id af79cd13be357-9371e6371bbmr904480285a.43.1787220531771;
        Thu, 20 Aug 2026 03:08:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4094:b0:927:25f5:ee08 with SMTP id af79cd13be357-9371e6371bbmr904474285a.43.1787220531230;
        Thu, 20 Aug 2026 03:08:51 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:08:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:09 +0300
Subject: [PATCH v2 06/16] clk: qcom: gcc-sm8750: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-6-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=733;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=vec+DMGrftoeTWQTfehcJjAH2/j53PBxzFUEMWg19XE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtHwuETN4WBvpEynT85i6pvE03AaNbHakzOIr
 mfsO6nDLzeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobR8AAKCRAbX0TJAJUV
 Vi3+D/9BwWzLJ8/BRbyQnXRJC8ipU3NtQLH8IzAo04Rj9DSl5IqdMXM4d9YO/6xy8Kvtjtnb/FE
 6M71k3lGO5Zi39sfYM0BiTKkfFoULVt0ssKrVH0jxOtpxYuZpfeZqOAgdpUkbe5tHIImet9o5k/
 uiWpNa1/k+3u14iqNPh6ukrY4/+qpFMOVvyaYVghh8WuNqa7nMS14c5F0EMTR0Q7R2JzB3HF16h
 gEBTSwSZ0heFb060l/ovIiUDABwpgn5AY8U+qWzQf2jb3snFk/ivJLZq3PHXwHCtpDxNUwGX8uK
 MqXbUKzuiQ7oJcxKMe4U7A0kdt5NCxwG4iettXjX1RGZcDrYRIot63KGmvq8Px5aQyepXlG8lrJ
 8YD35EOJzrR8t4AB0ar+G2/6Aoe2xTNya1LnWYmPlZAXSQ7Z9RVdgemjgHoUl9riQJ5bv3HZOSy
 V9nAJQIDg4Z9MsaqTPmJMdZh+JVPinzj9udEmx/yjDjkjL5vIRAvyyJ8cGzFJ3x6oiALFaVzzg7
 wkUcHfR/3ZMWwI1BZSKGm4i8+KfiM8j6u9TH1/PM3YwNefkWzSRtIJWV418WizcNRwlLKzwmTOr
 Jm09pK6BXW7m9xgcFpYanZEJEEsjdrPge+r/4NDswIR4L/g12w/cONJSwSRJBLPAkCtxxhxTniC
 fVXMh2scesXR/1Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX0NKmjF/AHBt7
 FLFnrGM3k5rf1o143dKgMg01E8WCWExtL1e6NIc+sRJnsX0/2j2s1ZaWNk9QNDfk48SaiJAn6Vi
 HZMM3oZo5LOx0i/r8Oye/cG2nPg1AOkMXWXIWggre2LFZ/WEsns0racTpMggsUenf1lJC39jEc1
 frk8Oypjy5t39ck9J2fyu5Lt7RUlmAt+2W+/wYMhIghXh+3vV5UjxN17a46b9v7w3TYXjogNi0U
 elTfNHM+9fysvUg6EkrIp0cr2JHrb+FE3H3g7iBY2e+ZLDWAfS7SDf4sGd+MAP3aZNMocUL+bTt
 5MRmzMd6QRG3cWzuLSdb6fflN05cP0QDschzdLUyQ7QnSnlF3bx1WUp0NGyKcySW//ovFUi599u
 ovCxGKuwRV8f08vSlyg201ppFXNdXnT5kYKkvSuRtSCeP3mkTwFuX/eEQTS46nQ2akFHt9SE4ih
 0R7KK7wBV4KGVxQtR4g==
X-Authority-Analysis: v=2.4 cv=KpJ9H2WN c=1 sm=1 tr=0 ts=6a86d235 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfXx/LXT/MSyh00
 d59jO2BiYAdLgAOTGlur9JuvO4MEfRA4IEioEnizPPCtzMl7GMS6chcBpsuqL2LMeALoGSOEbaQ
 bg+biWC2yyTQ6z0H8nrHIbDQirbynLM=
X-Proofpoint-ORIG-GUID: bmSjDTdeExi4sq8B6vvc0IfDAf-TD1os
X-Proofpoint-GUID: bmSjDTdeExi4sq8B6vvc0IfDAf-TD1os
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200074

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8750.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
index 6cfe90122268..a4a3ece74f40 100644
--- a/drivers/clk/qcom/gcc-sm8750.c
+++ b/drivers/clk/qcom/gcc-sm8750.c
@@ -3195,6 +3195,7 @@ static const struct qcom_cc_desc gcc_sm8750_desc = {
 	.resets = gcc_sm8750_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8750_resets),
 	.gdscs = gcc_sm8750_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8750_gdscs),
 };
 

-- 
2.54.0

