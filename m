Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44907424D5A
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572583; cv=none; b=Mj3Ijs6UQJKpimsmjcYKcOgWu76gysaMH+nQpeNfyAiarOU0zioULXpQsgVcjXQPfXMHBJu/V8Ycs7S3suZMalXqN1j06v1bFZ7HlURp3f6iV1b5UcnpI4b6Ma1qxugPVGK0SboYT/ipwt+pq6tjvLEa+D10F6q0ZV3M4nevLUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572583; c=relaxed/simple;
	bh=yQHDVatt72dxAqTGiEP/fVb8h6kq5JRi5hP7B73zVGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tgVlGaKvY99NdEWn6eueaIXjupbfB6qv2KjenVAj4IlIsvDb73FA8VTGQSlLd9csObz6Kl0rGqxzL3rrNfC79YxPh6l6bA4y/sBzkmIAZKCIr/kdCZCfZvEoCap6liAl+0wpOyPF3kQnnEpAxmiRCqGwAWRBg+IpU43VpTtCX0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ceN1EG4H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C4T71mlE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceN1EG4H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C4T71mlE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMWS32376890
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=; b=ceN1EG4HzrBeWHZ3
	pLhwF1kA5ana7QYtMU32MCh2sWYWuuGki7/JFtnLujWLwsRA0V7FP8HGHBPpzYji
	O2a/cSKQKLQPks3c1Egy7aUwY0AjYOBsbXnyYMI+kTPz/QImqM8BOfoHOhKYhW2i
	NG871EzgtMGaKF4CyORxo2QlMW7aVy8pzDqIXAXVQxZQSVVZFZeY+TpbnZYBJW3J
	FB6TQQhYCz+bovJ5bvFBR6uFKpJKD3rBvXURhffgYFMbcPWxPgcTztheZkGqUpuA
	nQpNSHvk0iFsSAAVOEcUEHSK6Uuq2A6fcGWOb49McryIK7X+GTSL/fLXwtSeGYcc
	T/gEbg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hbth4kf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f08560ea44so34032496d6.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572579; x=1788177379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=;
        b=C4T71mlEXUob/gGW4rbNdFjJgMHrnRJDbeW4HjASCzNSJi6nve6TYUyiOnA4n3e64a
         lWpaI2Lh4L+uSrfseklOcmUzrzAx88ylVqOGSeQU2SFXihfdi+Yo5t0FRG/uyQOZJDL0
         xa1VOyJTX7tJK0r+tpdZTJLWyvtWhN1ratHIBhv/SQjqrYNqOm4rAHRqmknRkXT0bZOD
         ceIs8Uw4bTodePUB9DS97LuTFbNyhF2AWpzH/XrJ9WCMGwLP1pMaxcHSJlcekaaQvxBn
         2NAmWYStnObQPRpctZXpsQhrgQlSkFKrtJ7qAiHtfYFzLDM/XxUj4VFRvFhI+rKNAiRX
         PHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572579; x=1788177379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=;
        b=E59BlR+pz1lB0PTBZrKosqut68IflTo30H51m11mZooX8VFwEdBqYbZVbFmVHQzFTS
         12ODfMOn/ZTEOleBaM2yVkcmqUnmDu1FWwMDSGPYEsk5qNrUXgO7F64chykd0rkcQzwb
         cobUVEwuFfqDe60QMZL8ERqWHdWQWoId0itx6jkTysSQZlozxh/jiOmJt2GVlNBMlUMn
         tOI535elhYg1aqYHYyHmVchtjOydWOjAoDIu6CjMO/okzTPcUaqO3fFwMRfpi9m5jUDA
         7PeLi23sq9A6J9JfWKVCfZtesKxF9kfJPdkHlYLzvoRwct5L9NR9OSLKZK7Sl64EHYnl
         BKKA==
X-Forwarded-Encrypted: i=1; AHgh+RoseIMg3o5LO2/MI/2xuckxMiYxA2KWCJFPk5vzpTtsEO1UTQdEvEjKwdRy7o2nlVW/qg8edJ0xKmI=@vger.kernel.org
X-Gm-Message-State: AFuF++ldZdPi63obl+MpIFT9CVg9yzd1bV7kGtC/UioLnzuMl7SVPfFI
	lLx8eXxhmdVgKf1mRcDjyFgZRkMmPIWebCBlAt9tzYExZbBvLvhm8M33jQaWGcoaLWWubcbH301
	CsF+Hg8e9Vqqlfc7w937nDZDryKfI+itgyW76vsFURhXY5MzoInndpBPS7MLEMJE=
X-Gm-Gg: AR+sD11w3qhYLcN7dgKUTLapoMlPmwRj2YHsfqf8AL8hDDx46tHNBayf0XuQEghqK90
	erMSV/21Q+eaqjvtnhdM030BwlH03H3E8CQFhJqfbxpE8yNpUoBhIMzcRqWV9WqdWxpNMhC2Bms
	AVmBYZ6BZDdPfVwkr6AckVWC3c5YUxvZVNWW2n6AOThvWUxpniiy3ALhMlhEIOEmKASYzcd4VuI
	fRzBHn7Ili9LZEV8dQeGh4KerBQl8BIvLVQn7NdKdH1RNmIb7YIqoCs2E5En9nnwP1Ojha5nl9A
	i6FW85avwQ2ZyJ/gB9A1mGNtd1Q/pWEL9bDLx7oAjbQvagIheJqMIUtEGo+QKOnWySIDK26FtLm
	s7dHXYX5l
X-Received: by 2002:ad4:5ccb:0:b0:904:1bd1:e002 with SMTP id 6a1803df08f44-90c809444c0mr239096376d6.3.1787572578601;
        Mon, 24 Aug 2026 04:56:18 -0700 (PDT)
X-Received: by 2002:ad4:5ccb:0:b0:904:1bd1:e002 with SMTP id 6a1803df08f44-90c809444c0mr239095326d6.3.1787572577970;
        Mon, 24 Aug 2026 04:56:17 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:16 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:19 +0300
Subject: [PATCH v3 32/47] arm64: dts: qcom: kaanapali: Add GCC CX power
 domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-32-f1205a92682b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=yQHDVatt72dxAqTGiEP/fVb8h6kq5JRi5hP7B73zVGs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDD0u2wyDj+t4GgWXlB3Lj3y8OoRDBcNi9UoG
 RvyDLYiL7mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww9AAKCRAbX0TJAJUV
 VtoxEADLjePLkDhxcEq8FshGE+2Sai2V5ws6NE0r9lAeZWiY+D+ASun1QbfC/EKHXuuoI3XLvG9
 0t5HALj3EgSLTYL71IAzH19RkqhVikdEiAOL82J4muQmwOte4YLpx6V2spvN3DQVHjnwfvcRiZv
 sW73b4IS39u0Y4npx2aopZ6jsB7cZXYSLF5KU1ITQ1ZX/Wpjb2hUDvKt8p3uqMVRKcbUyv3XHzg
 QdLb8hcvZEX08vBMOp74Bg6R8vNYPNmZSJouhEovojm0gx09PH6GclN6CT2bUm5OELgr8J5QqXJ
 SPYgPQQH9rmcY82hB2HsF1zSngCCGWQupsPiLZdxpNnLtyTCpFuIR0t3C3/uU3ZeDHpiQZvZUre
 CCMYzSAFGHfzHA5Sj0oTQnpe2RqDkwFzouOe6/zPrCM57ESCqVfqg5K5SBsmCNWdyu15xbX+/Ux
 OO7w2B4yLH1x+nJ6KH3oMILszWJU2lqOKHhcgBZueWYagYtHs8mUIwXTgBdYv8Z/4eRSAeltGcr
 BD1pc6ExGoNNoGkfhvzriAqs3XxN8bvY9n56EmnLocObYKF7cZdlZqpJbrFv6MAvdAuHaQbxjo4
 V8tpkn3Fn5pBLrdXvhkMwGl2IOhbFv1nmXHo4i/ILgcf6IJJotYS3ncrhRG+C/WR/+TLeMHhRA2
 v0n9uwVVCgPCRRQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX9dm0UOp9PaVy
 un4icf79S7g3BSOain9c4ivZKnS8kXhSyuKNvgQWRAqANUeaZXqTXRjUF2j/1GuJ7LQbW0x2BZt
 wixra2iMAjApmAnSFiNE+eCRVkAlirDVvdJo1NLJDCSRLWdA39F1++iaUtuZRL9glhxFzWvQs72
 r9WUEWIh2ps+GRgx+4Ut+9QuMesByWhHR8Pc3w9U0wpgJ56aRiAdYAtNimjeOoFGo+ITI09vsc2
 hrE18ylHW19/ui/P+a15CigDx/4dc/qeAGl/0KItOrFCGIeo53vnto7L1yQMieKaCjDgDklTYww
 rbkpKKB/fyYXYBtO8Fo0GaAHm/8CIEKvEpgF7Sjmy6aqnjr1Y2tjqSsN8E5xB+uwF+DhnUyKRQG
 29nIz8Hcn28nCznKlurunOJsnl4s+lxJRnr7nQ7q9msF4N1mTUtCrJ4/2tv1VFbQlk3sQR5sqrP
 qXxXWAJKsEDn9FClYNw==
X-Authority-Analysis: v=2.4 cv=JL0LdcKb c=1 sm=1 tr=0 ts=6a8c3163 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3K_yQeBcBf-sZL04j2EA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfXzC5p5uhJiM7b
 AKBz776z4Vjd7jdRUY7HtmK7xdaWa79uPIKLR0HRVyz5Ydbns31GRY/2iWdZ4G4ofgBCZYvyIiB
 IhailvG8/VmEyuOkLQJPwPNYosVHEII=
X-Proofpoint-GUID: ZZTKD0ITZkyitETFrYOKsDGN0rT_cEcf
X-Proofpoint-ORIG-GUID: ZZTKD0ITZkyitETFrYOKsDGN0rT_cEcf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240100

The GCC GDSCs on Kaanapali are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Fixes: 2eeb5767d53f ("arm64: dts: qcom: Introduce Kaanapali SoC")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..c1528cc8b7b3 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -552,6 +552,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <0>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

