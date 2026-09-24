Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1006848D896
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246506; cv=none; b=g53hzT94PevIsLu6fQKriabD6AlqW5iglrbU5zBEV16IY6dOq3z0gz7N8Mhb4igFklA8V3oKRCq66sq+bMM5QwC1FAUALncyO9UNpbNLdf75PrzuK6J5mYT7T8jJN0/al6P7hk/eFfstJI+714puEpJyUdpY3q0UaTmaqdte01o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246506; c=relaxed/simple;
	bh=p3n0vkGj1UgvhrXgJJZcBSedsJb1DlcOzeAG/9UG2H8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OwvADrNHTr23WSC+uFTwZs6HLEhepQBLZiRdfGUng9bgvzpoNcY5Vd0w4yT9CMztjgot9s3ISeMp9HMm3B9MQvTxcatU5/bnU4J8KxxamQREmlC9TT9Gbjpr1l3gjz/D+2VBjOYSfesUB6DWZBHsvHIiyl2zlP9Q+wNZgYD/KZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=msnL7tJg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M7TcgpNa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="msnL7tJg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M7TcgpNa"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9Pj381270396
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pwHR77Ikl6CgHJ9i+7qXtKNMboGDr8DqEUo42XmSYD8=; b=msnL7tJgJjUVpVC2
	CS60395Sl1F/4FlEB+p3KQKPgGER34v2ivaz7ghWBdcVElX9uzV69hhlTWIIfJQb
	w7Wkv1A7kOmM7merw2C6DkGsznacYNsdp1G6PAGH2gEFnAwGFIXXGmxXKO726W8X
	xU7xz99OTokTsWZzM6YEDOsLhOXjo9vGR1NYO3zBufp0Ggyqc8DUapI0+IKWqV/j
	d5bG2qst0TLBDn3m5N8gL9ZmTCzv8rCpp4Ww8JcOQ04id9RcEPD1LA4dSJ2XUbil
	mjkFzhArbw5XysQbypp0W7Z6mvtkonk9ptlPXbgWHWJyZKbUMIUBV5MSoqvgx4DM
	iPgZbQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90ajxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939d6c515deso374171985a.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246502; x=1790851302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwHR77Ikl6CgHJ9i+7qXtKNMboGDr8DqEUo42XmSYD8=;
        b=M7TcgpNalPqIqHn/OWr2y9tLoaEZjf1O2myO7XqfyjzX9D1GJNKauYcnR7fISE8vZh
         fdVeekR0z5UFdYWSgYwV3vDq17rpcZPRxOjE5ewIoJsC2LsOXFJgxj+821QCDu6fnLX1
         Tu4yKPdBcYf7pts/zhHSpjB0kI1AE6MFdYYP+frFt8Zjhk7hkAfkqldTpBynwCsmQ8Lg
         87tK/6ggqXcz7UddlmwI3rH/JtLLvSJFiQ6g5DMGcP0pQEQZjsPLwvyB+j7IpecOf+hf
         8oQI0OqlzmEab4UL33DGiVTqau6aQFQPQarmNCqb+1T2Kwe97XpeUWuFH9vqDUb5h3WR
         ra7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246502; x=1790851302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwHR77Ikl6CgHJ9i+7qXtKNMboGDr8DqEUo42XmSYD8=;
        b=GgCz3pEm4/9PfVGVBQTWpV0aRFFwBl7VSRxuI6HTC3IIJrbPK0jsUFwW1mLJIwEOAs
         e4CveGZ2VozsmKCiDvNoV660afPF7gJ/sdJj5LsOiLSP74bD6HQUJyEg/5dvQvhbeh7L
         SkmX6kcqS25K8Zh+kotIvtyYprw+8VHntG/HychGRlUEnz+u7wyjrfgrD18MfBqiqZmZ
         ylpoli5RuOrzjnC0UxaalbsxByEomiX6kIHggzQqK0OeP1W0umJ8Zw4CHqiwFRI9kWbw
         d2L1YJXmqNeOBLGASnz5SvjnBm/5+ppp1g+v0tW4iG8+N+qtB3D9sIcyyRUZO4/M464N
         ep7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxL1iItNIcrPjojjTNRCE+3QJ3JCuvczXKZ5l/8GbpjNrY5iy/Feo9lsjWhnjcaIShq8HnUQIYed6I=@vger.kernel.org
X-Gm-Message-State: AFuF++kgCNcGfIv/T4r637g1hn7COJtFJlDeJNJseIPQuRflB1t10bNl
	dmcTIFTC+a2eykh9YENMmVnhHVO/zBZK9Pnv506HRpQvxyRHQ5o0Ba4Fv7yPbMbZzzrH9nwDgnD
	6NELGJZcGdy1m5YY9mozkDLdvNgZH9kHm/z+dALG4cIXDNAHFexYbEQSQmDgvgVI=
X-Gm-Gg: AYBFou0XsFGoQnCYLut5+Pos6FOyEoRdg+GW4wKh5fvrengho/zvx7degJ9zeCIDysX
	Ira0XGPQbwiFYH0e2r1fJFCS5lP63MVa1OG9neStQwjKXRprQqmpgdZrTJftaVCK+EmJqUfhapW
	hYYyT86hg2s4wt9cTDQZ22E3mIazAi3uBvIRFemER3O+h1hi2EMe4KUoGgHhbZhi/z4cYtTfF/V
	MPNqMnBrWKHtpqNdgFcGbZots+fC/Lt6JVrY8PeNbQ5pBmShs8QjNZOkIM4p+8rRxRxZyjVfCeC
	vjxNCHJDhk+5qHIX/XmZZ4xdFsgxtbwq4/QcaGAIIPVmSn+J9OZckrjroQ/c9AZ+U+Pd1Dq19gg
	49jHQCvt+
X-Received: by 2002:a05:620a:3913:b0:939:f188:6d97 with SMTP id af79cd13be357-93c363febacmr208439085a.48.1790246502018;
        Thu, 24 Sep 2026 03:41:42 -0700 (PDT)
X-Received: by 2002:a05:620a:3913:b0:939:f188:6d97 with SMTP id af79cd13be357-93c363febacmr208433285a.48.1790246501415;
        Thu, 24 Sep 2026 03:41:41 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:49 +0300
Subject: [PATCH v5 33/42] arm64: dts: qcom: sm4450: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-33-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=953;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=p3n0vkGj1UgvhrXgJJZcBSedsJb1DlcOzeAG/9UG2H8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP36rsI6Vk0qlvrs3AnGXi9AGUflFqHLjE8wZ
 G3XJCrELkqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT9+gAKCRAbX0TJAJUV
 VlzsD/wNXN8OuhKqNm7fOxIdx9WVRUvSf1b4ElIXw+s3tWJTQfxPOfx0K9BTdmH+n+mWK+PSkAh
 VtBgEvWA0akzgdT1oM6RL8vfDzBGDwwwOwVULKyPposlNHxGaVeoMZfneCGm3PP1HcEu8hXWTog
 SxR2duLIBJQzAp3VsnrI3CEhYzSl9zz5fNSR8x/bmlhBPuADDyZJgKd7DULKcEvEP7IBspw9OWT
 86JqsG8Y5dNv1TP43NmruNqh0pOeKk5ZU62yGxsG2RAqKqwdkIWYkwiqh74t4NpymsnUgvN8BwR
 U5LqzEylDWNEXAmqeYlszfJzvVrxyVILc5MsEBLqpkaFKk0tBb5tD5souZ4rmTa83uT+EgVw/Bn
 mFeP4WkR+1D/yjJvQkTo8awT8GYZUT26+OlnQkzq5joXhcue7UlNRf6XLPK5b2oY+XZ5nJKBFay
 kvnVyMBf3WKFqXi0KHXeIux2Ri3wjMgHjNihV6b1iQlyQKzNVllS7XcPrsEJzWarH555BW0aUXe
 s3jJBbByJHd2umo+YWV4s/FX2nW1+k8mkZAwCefDhMjucZdM8Vpueq0IpeIWa051UjyFWmDI8vE
 1nBkuoUlLlVGdW06EOnTJYqMvloFhG0gs/FTUggAn53Rr376ynUzIiJ1Ore/KNhhG0fQbgAILYa
 yk3wOjOH9W2Zdxw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXwoi5JPrkz80D
 z196scUZZSObxJtay6MbeY2nXJyE2EMafBVAWo0Lj0+QLVoWFdyv+pA6uxTERH+/6A8gZLV9PVP
 bq3WAr+OO4X3/O8NPChEMxLbgHekIew=
X-Proofpoint-GUID: NB_146L4TsvGuaEDT-B3qDAuwVeXnoR6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX6kvajegv5uE4
 F9aynsBS0i2G6JQNv1fQdRTbx4F81U5Pf1DP0J7w2h0LvSJYyyF4vQHFQfGhmneoztjbZccblkJ
 RtAVVZWVriQWzKVRN7m5hUYckD3e8dcsB5SU+q9lyRVDw+8ONSqio/Dn+3RUquSEdlhnFZY4/hm
 U1Haa1Eo7nJtdEajPIGAH4FFGit+xl0dJDc63S+zqBypGmPraDNRats40AVbNTxxacuT6aYiO+s
 pRaRK9c/w+KD4BdipFsPw7OFyjMnEFoYL79qDRcznRvBHIWKBVkW8HECLFG2oNq75lhqjKg2ebW
 Gjr68zWRNdsWctznWvu/if/p329BAAxucUCnoBetRmwb8fy21UEDxFC+kkMqSjADdrT+1OaJ7di
 LsW1HsbVcncRd3GhDY8vpocDyA+fHZ+/2L5nvIPlpV0un00sI3frjUy5UhBT+kFpNxCkHOXnfWo
 03WFsd9jqjrx942nAog==
X-Proofpoint-ORIG-GUID: NB_146L4TsvGuaEDT-B3qDAuwVeXnoR6
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab4fe67 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

The GCC GDSCs on SM4450 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm4450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm4450.dtsi b/arch/arm64/boot/dts/qcom/sm4450.dtsi
index bc9c788b92b1..11ab6ed4f655 100644
--- a/arch/arm64/boot/dts/qcom/sm4450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
@@ -389,6 +389,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>,
 				 <0>,

-- 
2.54.0

