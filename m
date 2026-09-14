Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849AA4746D5
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390204; cv=none; b=h9aGcoo1YiGn8g74Hxy9MZm45YY3HXprWZp/bSSKh5TwdSXj4LmKA9xeaUziXLxvAtZynjLn1+Xu4Vq523z4l7o4NVtxFge/uwEXus2USJeR62ish+hsGWiDPzBeUuzkSUeRBkGnjuwTDEb21SHSH7no4HbGKpt1jbLO2gk5Ibc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390204; c=relaxed/simple;
	bh=kwmZWbieObu19HJwMat+En2+qUYDIaJNELdrcvjW9vE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ueT2PObXA7lXHYGln5J/5mpFvtdNv4vI2aviqoIEZR40cdXWrzGAopt2nIGBfIj6gQlVDIiItIDpTlIwqZPL1A5XVkh2VjiSbT5K6ZRbkmyiCjrw9vgVMWyiEiGiig5zmNBkDl5gHl8OHhm7Ce4Qx5yZbyu693lANeRfH5t/g1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VEmDD/dn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZoEWCnSA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VEmDD/dn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZoEWCnSA"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm3511216142
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X9udNqzS6075n4aY4trAVywiFn4/XhY5ESNd4vQ1FkA=; b=VEmDD/dnyRwC3C6w
	5IIWT3wScfdvXPuZESs6wMODG/sv7r2chnwFauJen4MlXV2JAyk/iym88DG30L94
	5dUjEshht1E5syqacFjxhhwztIwGcDfF0uq5y7nGWvp6QD0Nhcj6mYHu4Yu7Zs0T
	nU0YnAnM8tgirxYpMIPFdlcWfOUog/BhcK4uK0vr/DFk9V8DNm/wfL07oZBT8fID
	fT7SV1ZmqI9lwuk/zP3uA5fXguTuWQA/8EQndpNi21N18vGnHhwsEVnGKN3pnDL8
	rwtfbvMH8DOQmHzUmwHa8aYJG3BZuzuke/dY/UZ7Vn4XImME4STZ6fkYEISNSfCZ
	hxTklw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0ahw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a183a0e93so211576985a.1
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390200; x=1789995000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X9udNqzS6075n4aY4trAVywiFn4/XhY5ESNd4vQ1FkA=;
        b=ZoEWCnSAez+smscY9jhbMb10C3rH9aTDkugQPMDMRhfOe6zSSFaRTY9Kz01Spi1qBT
         FgFCRwQ0YtjtCknpdXzuUO0V+fFxAu5NVGxNtuobCgOo1Py1KbaKnre1yuLaj9VSS/uq
         TyOPjpI70fkA98oZxJQjZkfsntMKRDjMxeWPh0/YTJ7UGjeFmZykKNpWXXNxDBshiAim
         dUsbQIjLdKcwDcZe1CRFbSOn8S86vtsdG4XS6vkQti6kYxBDrOlNFwgVGmZYB6o2Ix2W
         v5KHERbaC0kdkaQW5nYmCl6FUg1576fgsZppGYbHm42vl7hWaTPpHodbm8ax8joQaiqX
         fbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390200; x=1789995000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X9udNqzS6075n4aY4trAVywiFn4/XhY5ESNd4vQ1FkA=;
        b=KrK6Kp3/fdmZwOCKZnsF0d+i7DB0SI2eTjlGs30peERkqlEYVUPSpchnt4YoNV55FT
         yGKKF1Scbqhpicmo80VVyjmuZqGgaA+OPX9q54XLImnRUnYpKhnnyCFzt7PhkStX9oBy
         IcHeJIyzb7PypTmgm3MIg5xfyT07mT1DHd5cPKWQG8yuiZfP5U497COg4mwfN7O6ZBnf
         S9nl+eJ8RqJBHq99x55rTNZbUvbtpLhyfPPxqEh2zMw4lquxGp9WoSO3Okq74TjOqpkt
         EeTpBLbJ5fBj3bE0A1a4788CMg+JLHMvHVJcihgusHLE1QubnXqTOy1BE8w+XpYclSds
         Wa7g==
X-Forwarded-Encrypted: i=1; AKwUvBx+vXWbAZdWeIWJrrP+e9gn9jyKKCZ79zfvUhtd/wj9c6TQO/2VGP30/mawOO3uRLYfMhV5w8/6CYw=@vger.kernel.org
X-Gm-Message-State: AFuF++l1r3u4a7tyT+DK/UExOTyw0nRuA2TmHQHZ9HBuKZmqfYn5k2ie
	F92gej2AR4tQUePkHb07TuYfE0NtpJG99nb1eF0SV2yAi5Ho6q1DZRUwBlDAUzVp4UT7nDD44RX
	RpHejHq0T9xtxpXtk4b5wZw9IhRIJ5MkgtmvGJzvL9Fv9J2STKDAfdRa0DDIYzG8=
X-Gm-Gg: AYBFou0/1jBWQzzvZlvVqczjdyGw3J6JMKpFHNO6yH0td58ObJhndqx/0mjr9KgoYDI
	syvPIhTQDv9LkktvQweeYLpjz191TLk09REQBQljDli65wRCbRAclk7SHrDzNtyQuLdrTE/gcO0
	iqGPvB6ZKpvs/FrKwld+c7B2W25QzYqqJyMLVWkuZL8ipxzay+1o/xwjZa+yJilLzfvN8Ttf8hk
	0iD7eyCmGSBOqyUqALgaxRo5xaVIQuvZTV4rJWa0d+yjnvWossGUPXMs+rPxOhJm4NOlSMhr18v
	asnggX9W2853qSt+ymsUcIjxI9EkYz2CcQ2yqHdW5Od5TF9SpPCLwJxu3U1haAhqD+XoGE4ApI1
	j0cySzQdF
X-Received: by 2002:a05:620a:43a1:b0:939:6db3:6cad with SMTP id af79cd13be357-93a2975fb61mr312437085a.12.1789390199823;
        Mon, 14 Sep 2026 05:49:59 -0700 (PDT)
X-Received: by 2002:a05:620a:43a1:b0:939:6db3:6cad with SMTP id af79cd13be357-93a2975fb61mr312427985a.12.1789390198941;
        Mon, 14 Sep 2026 05:49:58 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:57 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:43 +0300
Subject: [PATCH v4 44/52] arm64: dts: qcom: sm6350: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-44-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=963;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=kwmZWbieObu19HJwMat+En2+qUYDIaJNELdrcvjW9vE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z2zmUXCm0QHKUuJH380N2/WzBm4SBX+dCc9
 aKvCdEtj26JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs9gAKCRAbX0TJAJUV
 VhTzD/9EvyfLjevZjNur+y6tg8FyEyj/I/buwQFZcFclamb8CwsvW1GtPyonOvAkUIGUHy9t7NS
 X4ZUqtgoJhuThsTs7nJ1blYHpzzwv3g5UqPNCHNgNi8OSohXJXqgDSxfw92vL57Kgm1/at8yUlz
 YdY1EDJKvVEWQ155iLWyvs/YZCF+itM4LWeSi7d7vHMbCYNhndJ8BP0rUEWX3YzsKJPzGrUWNed
 3z8lxRTj/GU7+dljvy6d0S8J7lIchp58mx0pDOhQ9eKZ4ymEf0/SyWCJ8lmhEwjEyYm+39DNonN
 0U0qUkcEeFy7od4TUvMJnIDbinzDp9mRYMwIMFfiVefr8qemt6AjQNBq3ytQNau99qLz660YbM7
 W4xu68gisJEf1eUXc2xaCfZHwwao3aBUwhUcE7170I0Fh1NJOmJ2M/sBQmt2/T/u/TrxX9Lups0
 BwWfcw/PDw5O4ffnYKqBPVFthMkYhNPwa7da8P+oHJoIHiXd1njrWIu32sJaa8XSzgbpdlHgQnA
 WtS/+8WD6Xe3LMmL+p1TRb87lGVKgzhVO7ZWZQyqyPw0M4X7oKfznDt5pRpiwVa3irDWko/KtFG
 Ea1MboW4hwXiIGJXq2cZu4HOlNStzQ/GTYscFCtQ5TJ1wvM/6hxhPzBbJAv80j3wjbBVO9Oq6vq
 UMLLN/qZ3w4JJCA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX6wWPwJ6q15C8
 g1rg7afkLsbbE5YCSqf9FvNDqoiafQ8LwXZUNuDEB22ZB5MfKdOUsXEIQxOuY8ORcKpqPW0V6CC
 z8uM47ReCbosYeq9oQHJB0qg9w+lZWo=
X-Proofpoint-GUID: s4h1CQd6B3y7AFmgRRbFj4wUgBtgXVdx
X-Proofpoint-ORIG-GUID: s4h1CQd6B3y7AFmgRRbFj4wUgBtgXVdx
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7ed78 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Z-KR3oKqXnE-yqQhW-kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX9XzWlbnUrXjh
 jjkJU5QpL88hhTVgmE8JyDmZYyF9w0f7JTw2UCpIZzv1vlIx3D78JmEqXncGj246hDmOGF3OK8m
 Z9hKVpz9Cj74+XYV7HuIDXmdiJseJwNILbya/0SpkwAF6AY0Q4xqr3ZFUH2nx9FCn9kGgomVykm
 Pl4tNVIUhNZvzGEj7xV5PbMW+WLBictarC05YklJQm1LAoKq6t5ufxUJqkEt7gQP8JV6KC+qH0l
 wRV1rrinBdZnww4jujLV7uq9ErMFS2LUG/ArDeqdYdMJGya2t+ZJq9kEK+BfwFYqgDw1k7/kZAh
 AN71cF0mV6S1UtZ/HKZx5SFVlTTXck0b7jo5uK6N1bxGJro9JtQqDZ/a5wyr8t62xyWq0sO4wzo
 ZsbvBO2RHElMZXdPyuH1lQS2p3stbwo9xLD/0VDV+iT0JyMc9NrNRnrOIwAdXZIF7XlVRHiUaYG
 TvDIo0J+tV2ZPzXhs3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on SM6350 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 15d38b7e803c..ded5c3a45891 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -794,6 +794,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd SM6350_CX>;
 			clock-names = "bi_tcxo",
 				      "bi_tcxo_ao",
 				      "sleep_clk";

-- 
2.54.0

