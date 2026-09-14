Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2D1496D2D
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390227; cv=none; b=uCdpKnbrZA7uqq5zusely487Ff4ZUgLREtVc/Yi3GclRaXmh7Kd22QCJZ/AON/DYBOPrAItWLRoFpYZWU0onoeBLXxC9NuU9O3f/UNZ5nYknPqgbrk87dgXh9G0vzdYaZx+RbGwLfyrdvSmmazpTIBpzCbJqOYlZvZ6l6u5dTJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390227; c=relaxed/simple;
	bh=gDMpFJWapcnhBZHow5tYWj4u0/ni4AXCm1hEuPmwG5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fzg6tNk1MgLBr4Q2jd6IlvGp7pJgJwZuLhYGJKgCI8oZkgPmwuySpEybywyQG7chi6UUhfNz+DiIwdUtBCxAJpqYMy23EsjgXtQYBwHSGttfChwjoR94his2moQkOYVnExMVWb46/FUeO6W7K7Mqi3x+bpNMwBAvSn2eqIcSKoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjpOMBOM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNXpg8jh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjpOMBOM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNXpg8jh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm4hl1216150
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBk697OcXRYhQ5p1XM5h8Xcl5jMkWBXjU8/ArCjrsWQ=; b=TjpOMBOMnolk1QWI
	ZZOYnirI51SSYdlfuFYoNBqQyE+fpwiIqjrgCAUQlDJ9ynT0qGzik+zl6TUX+IM9
	fA/xFsoId+u0LbJ3XV/8UVBrzbZ5gnY5X0AhsM2zPzflqNO0pGFQCAtndzohBN0V
	O8dJzCgZywnRhsQKP32P7FKENyRbSjm4bu8J9gqNHCSb1zkK1OED8jYQxibBM6Z2
	j7YLsRUGhFP6q8JME+g8XKAx5dVOK1x6jw6hHTxJYl7Dv/BoMnPd7CScNcPhD0hs
	yXGRX3WjNYzhBAFrwxTfX/pHGr+74rjpv6eH/jNDukoDNUU9c1TBFKaoeV269z0H
	HzB02g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0ahxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936708f129aso480002885a.0
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390223; x=1789995023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBk697OcXRYhQ5p1XM5h8Xcl5jMkWBXjU8/ArCjrsWQ=;
        b=HNXpg8jhVSiBhSaDxjOHBnMqvICqK7yK7kTOI/unUGbNfzn7BDmy76P2ez36WJ0hTP
         MXXCmx1xh33BKpp0mrRP6OHVlWoHJQ+JqGWQYVXFMVVJ4xDA6qxjF5WAcORqxPMtOkKy
         FWkrpIU/7E7i8SwHC/n5hfftFk59AXO7ozEvvCtMV+2htbz04dokWFzWJj7dtqTyTFzF
         te8P7OINhNdSWGk6tD6Yb+qrqnqebxox8vGRMQ+QzehgVCXwemovWI6JPsIThlx90fpm
         vFdYmTTu8RbfrL5F3YOJjmoa1l1HHWjja648aOssbkHOeVLlbceVCFaiy8c9kp81nStT
         9kpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390223; x=1789995023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBk697OcXRYhQ5p1XM5h8Xcl5jMkWBXjU8/ArCjrsWQ=;
        b=gmaYWddLqqVUuV8BAvdDpaKswXDPJ4dZEBOtwBQ+xymi2MhxGHG0j9Zf5fNNQaR2lG
         9JjbDhflo/O+yVbDQDoPnUFGLs7h8JtOU+W/NvNhaZHL/uLrEbISH6sK5AGVc0QFqP8Z
         SQ9qxh9EbQsoX6qZcCzQGA4qfr86blGiXr+/wc4YnaEmwNFaWfE3wK5tdx5bMGwqvxnM
         q3gAwQuJBbf/3V6UqODfU1/iNFsHbjhhRo6m4oQFjfGmfVdnjjfKFDqwBtyxkj3EpcIc
         lRGuzyFaBKXhMaJq1AypDJ9cJ3oRR4B4R2LbUtlWRsQb+Y2txg6lG6YHUAvyi/M9uyBk
         O1NQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdVUS4wtg/Hkla2pgSXGFCZ30oEpeybBq5150f3AT3UWMi+agbTqlJMowVnjna3B7DNqQZ8ILckZ8=@vger.kernel.org
X-Gm-Message-State: AFuF++niv9RPi4rFppbN05IXr995ZnmZ0/vqdm+7/NzLpOcLh1nKMMEl
	reBnFR2gqyieTGBAhD5hb3n1kQ0OOvntbvMYak337Vp5CtpRPaHgLPRhrFs2SKjGrdQ468ciZcW
	8m53dFS1qESTfBm9bxBmZ3AV83zJP+gPRS5BP0cfP0NT4UCnLi6BFNtSdR74GaPc=
X-Gm-Gg: AYBFou0XeL1h1OHGpeHaSd/o2bxZqjy3u0aN7yX8zT0iw1MDpaxpVmJKhFfBhNAR/ju
	90C9FpFozh2awZFB1Atyxn1SruKq5TfEl2qWqGlNcKsbct1RrHKmOaYd1aRvHq8YrEPUldRvpW6
	VoP0OXDeHrjJIes1gMVSVcC7Z551pu1anK/v0WQxZ9zJYqqWSLxIIrXlg67jyXcA8mynFvzxv3n
	I6It3xjTVFekbBDrlAz0Hbm6VpN4N6azeds6qDWsw/aSxAvraPZZAr1bsAN1b84Q07anyqCPi09
	kn5FqrBqfZULwZlLp51+knKPQN9NGlh8qoYjbj0PwyMYFrL15SInTD5KTK1svDNyo28B6xWCbRp
	Gjv1kA0Ce
X-Received: by 2002:a05:620a:4885:b0:939:5f4d:67b0 with SMTP id af79cd13be357-93a29766649mr345945185a.8.1789390222775;
        Mon, 14 Sep 2026 05:50:22 -0700 (PDT)
X-Received: by 2002:a05:620a:4885:b0:939:5f4d:67b0 with SMTP id af79cd13be357-93a29766649mr345886985a.8.1789390217488;
        Mon, 14 Sep 2026 05:50:17 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:50:16 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:50 +0300
Subject: [PATCH v4 51/52] arm64: dts: qcom: sm8750: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-51-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=gDMpFJWapcnhBZHow5tYWj4u0/ni4AXCm1hEuPmwG5w=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z99RrWtRkAmEqS+3SUBLhnWTdNFd2KpIwrz
 ImDoDhFN+aJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs/QAKCRAbX0TJAJUV
 VhVwD/0cBO7oZN0lN/wkNiy5t0jlMMGSOEGTNF30cWjVGmUlWn/f0HKcWx1zf/9PJ802mrlKHmb
 Eb3sT3obVr6vcC52UG18hDKNFUK+k6jDqWKfodSlEORd9iIv600ucrs1qVDsp7fzB4YASSselmO
 cyDAWlIBwYnx73kFB1DjALRCXjKJ79uiq49hUQYhO/Dmw/0TrPtXUa01aeQeYSH+wJ/NFTAVlqG
 NvNtesIRd8RobVyUkAjFarJ0stKDh/BGWuPuT5ZdW+XCZ47fA52LLzikfmkU7ZFANUPi17l6xUU
 zx6OD/57BuAloRYjxVENexoJa4GFWYcz1F4qU+C9kC/o244qfB6xZ2uqDA8RUGNj4ARBMK+TDu6
 NP14we0P8nqrami8i6s8fQFTOyXMUiFAOjjLQYiobDOs13c2IyGztV4kC9BZWrCFo4XNwYfkmhJ
 +7fYEJVXUZ2qro90p64Kgowm5f3L/pkXt4sM5myDVhOUCMquoeTfrKHxmsPKLgAQdXJjIkpDmh9
 Bo8ch27D0ODG2CMgPmtFEFNgw3iUAC2LIHYMItCT/YgQqXW0DRDw2spcaAE5NpqOxVq/Wml/u8D
 3h5RlOoYw5DL9zfIT1eZNfrRSum3B4BFR6dyoccYGVKc3PNkhmgLfMVhCD+hqJ111ZMeUPCI7+2
 eRyxSeSYY8w90kQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX1Txs8SLKiVP5
 7WORd3xU2Ng5NcKOwJyBePpR29VDLewBJcjJY5HlddFqV/aBgNH0+BIE7jP3b8+TVXLyHbnzNtz
 0RCIbSNOEf3MkFmP+exCzqHgezVg1II=
X-Proofpoint-GUID: YquqDtvt-0VeCEJAoqIuMKNZraQ5bJ_K
X-Proofpoint-ORIG-GUID: YquqDtvt-0VeCEJAoqIuMKNZraQ5bJ_K
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7ed8f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX8FHNnAZBO9yo
 s/c3dTUeCFqNhoiZO4tfnNAwSk7WVrovDEMHmE62cmzntNq+Z3ZOHO3YD1u0unhU21PmVED0nCl
 XHwOMLAVm3zQs30Ng91Qauak/9B63p+fYjTCKtJMcCnx4XB6Ab+8Ksz50Sj+hWcirGmeZGZNTnT
 3UU/dNp3nu5RCx4LGyykTz2QKuropbpehTccOZAsqRIQzxqBfsCASVinr2uz2xP3fXj59wlSkRH
 e00bxzN/R+tP1MFrhLYK+iQwqxnJs0j+ZDQpCORiYPT7MeIIW2JFNtMiBFfe0zzLdSacD16IxrZ
 tW09lx9abGmIaG5D6oQJWac3eYGYIZvEpiIizmMxM5yNxVKaXGa7zl18OX9ySa/yfSi+AmUV9oH
 I07jV78g8wRCaBUQmw9FKtjpdghko8jhYPaYg/wEYpQL0F1Jjaw8bJsF0DTo0nKD4kIZx3IXJpN
 3z5v6x7ovPcJ5QBXcCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on SM8750 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 28cf22da854d..b9e943afc510 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -677,6 +677,8 @@ gcc: clock-controller@100000 {
 				 <0>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

