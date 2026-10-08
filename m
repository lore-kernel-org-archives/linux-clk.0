Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8542E4446E1
	for <linux-clk@vger.kernel.org>; Thu,  8 Oct 2026 08:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447067; cv=none; b=OPF5xQpSl8YGJB/0RvGoRZl65Y4AOqmDRzxnr0JchjMT4MG1OojGczAoan7agQTmur4i1l78eD4MJbq+hse9VPb7NXXlygyMO0pQUp+qFRg5KpYH7+zlKyw+k3A3hcsGM84OTGlmFLEdErlzYLB1F+/tWMtjIglnHHkfzL+isU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447067; c=relaxed/simple;
	bh=DvQ8wWjzAFYX10JuqGOvkohCd+ko4JNFR4il8Qwjgbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kfJw+SVdGQ3eTb77A/ekL1snsTsgdxfQ97p2Bfh+3BUFJtbLTi/wn/6hvnIGuCLVecm5sl8pXjXR6vOp73ejU6jqDWWjbdXGZOHZBX8ry7iTQOzG86kY4Ee+e+5OfL13/xlViQZ3OY7IBsecRBmxqVpaiu3s06/642cMoT/Sv/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CXM/+pF1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YRIplpqx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CXM/+pF1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YRIplpqx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KX2S1169986
	for <linux-clk@vger.kernel.org>; Thu, 8 Oct 2026 08:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ilmh++1N7R6
	5dkDcOOtxHaZj9s5Kb/r2ALcRYTEeVlA=; b=CXM/+pF1DGPpnRqE4xlWxFiD8q6
	f4/t4u/5gOHemlS+f8Pv4IY+GUrtoKAgYFdYAiOR1NExyk222fznyjAu+PXO85yU
	OFpkCZvAKS/P2NLWENO3RDo2nza4MDc2yR+ikupPwCEmq28QoJfLqZRcaETQxewV
	JJC3CySS2IvcBhDx/dfbbFyvi0Xx4c+EMgnDEGDmX0lsxbZ5aXWT621+bT5ef68s
	w1G0o/wCTkcJWdRqVC/nQxCq1f1hgyObdpdRZE4fd9sprN1qESZ7l7eLD8XG5sjM
	nzF6RHb4R0OMdAeKu4zfoydJPhJjwJNYQ7QPWy9pJQQaZ6/rBGhmUD9kbtg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe39tqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 08 Oct 2026 08:11:04 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so17507839c88.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Oct 2026 01:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791447063; x=1792051863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilmh++1N7R65dkDcOOtxHaZj9s5Kb/r2ALcRYTEeVlA=;
        b=YRIplpqxX4ZuqOMWk8ZqZPwgC0Hwi82Insti138OIdXiQ+FVYyBinL4UJ4T2oiDwLv
         Ur754oZstGQbcVzb01RWBKus5SAm2IjaN9D2R+KXZ41R8SyLFrQMOeF419EWRM5RAfqw
         flGKP2iGtt4bdDFO3HpkvXNBDmwZzmG7T2A6F9e1MKF6rq6v3yidKMr1JjEv9a1Sz1gH
         bLEMpma0jv7UGG9ttJDvly1LmJU6ftg+cVDcp6B51CeNt4UnwdfDG1PSMKDC5tX+4L+O
         +BDXQFKL9CCpK0Ds2mnZquVfcKcPIPsfRRSuYNho4SnpTfliYJeXI4eIO9aNMQVHoXs2
         oOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447063; x=1792051863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ilmh++1N7R65dkDcOOtxHaZj9s5Kb/r2ALcRYTEeVlA=;
        b=oTSWbrIo8msHxWJH1G4TlQn8i8UTRz7JdwQ5ERicqYwyE3LVImgbnXBpfNEVvi9lY/
         E5d/DwExaYOHUtGKiYLiBSB1JD8dgskdvzvW43Fk78y+IIO9uTXQ+wmn1p07Uck99XDL
         HAHPOHWkjNZZNbNPlt9FsW6JLaaAhCF4dGYbSFerCJtLkA//mXs7wmsgv430CUBSaGQY
         1UBc16XQR5TJyxugaMhIG8loAIGGuCI7RqWSwi9RG3SWVqwJeFC+w0kg62f54ho6C+xE
         MY+tep8qh2kUtHbPEH4fhABc/ZgGn/QORwgdTbLOBMoy+KuVTfR1Pz9mkM55jb5znkJU
         KtDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrYZE+mzbfkB45DUguOMVZDmcW5Gn2TteKRBUkqU+zI4+JciMmspRqsOL+kkFdgVHBt9T5S7aNw3s=@vger.kernel.org
X-Gm-Message-State: AFuF++n1EPvwRe5FQXsiNbXPCl1oG6sEJSdsPthr7o9kbUMUOhREnQnC
	leUDGna6GBTI0KwvG6+cBnghU8K6Mio209YYvMIhpiejFOpORM4o0SCxt/KB50YCejqYfh88sEr
	lD8YMQJGfOhFuntWnPxJucjyqNy4W1M81lhTjz65Zyyv0hafE8E11shBUjXUKIas=
X-Gm-Gg: AYBFou2Iu7lMnx68pUVUFmqsA4t/okXUR2UGgbwte9VYYtXgkFfAixcUfHIJehe0IFj
	Q48v6XzKzutwV8Fin2zwu3cvrLkhAcLO5gXvO4xnghzvb56dDZ0eWlh0eAVJb7LHIRrTfTRQ/7F
	cPKw4lQEDgilKbHjmDv/bHIpEYdUK6VICVghQ40vDdcjEH2n+zCiwqqnjB49YES9llxNvlTLAsr
	0lDgkLDJ/zb341kYmDystBFi4coTbru3rmr9SKK78pBJWdq3WymQyT4ZC+kxzLnVFuti92NBIUN
	9EBpJu3oaEAsNgb8dp+ykuqX7cofS0swa5/9MuN3wJ2RoYDXTAAMAh+2wJapESUhBrAVgAonvoz
	8tX1tqDeIDPuqiuYO7elG7hgf+DIOgpWZZK0WiA0MAQhaL9WS3KX7ZDPzZt0=
X-Received: by 2002:a05:701b:2096:20b0:15a:9834:73c9 with SMTP id a92af1059eb24-162089f4544mr5396700c88.40.1791447063244;
        Thu, 08 Oct 2026 01:11:03 -0700 (PDT)
X-Received: by 2002:a05:701b:2096:20b0:15a:9834:73c9 with SMTP id a92af1059eb24-162089f4544mr5396668c88.40.1791447062702;
        Thu, 08 Oct 2026 01:11:02 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16166121f2asm14522277c88.4.2026.10.08.01.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:11:02 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/4] arm64: dts: qcom: glymur: Add videocc sleep clock
Date: Thu,  8 Oct 2026 16:10:34 +0800
Message-ID: <20261008081036.3492003-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ghcKxqhfYLIxi8X-CZeIZ4k2Rxy9O4YO
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac75018 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=kYVbGFCUSVokFan4DuAA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX6YeHrs6iujXe
 9PHg9Z1NjiTLLQDTTAlNT3PdhURG1PL0VN6gL6yABbEedAjyqe8YaSNA6rYfsElNIMGaM+hkwXd
 rIBhFnIyL7IuJHB4Blt6FoHF5zoUEvU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX0l2mUkh4pckZ
 4olfMNlQkLmGD24Qck3QAd243WfgCgCRKzFc8xohcMN+nPHOLmrpVCwtB/6SCifAjkel7i11dXg
 dQPPbLDWIcmpK/U+9E+Wb6vx4OaC7BcRucnzwg6lTrEWwliJgSYdLxTfgpaVz1J2dI3zBFx2PFw
 vgQHBCJL5l+k4DJSBGBIPgnG0wHfMmbS5qDnMopBRCUulNmuYt0wdTkQHLwlPXw5mkDH1gSU6Im
 dUly2DCZVYJjdfeeLvwY9MNHW/ogKBPzoyvZ9JrtI7g8CXnpfVqFJjFf37JGWZV4hGdXo8NiCWA
 EyDmTAAChEYigqY8ZMxPtv0bx7ifaCGhVUTg9tKZCIS9dKIgf9bvYwmqjwd2eGRJEhIJdCWFdT+
 ivQ7i7SYv3AAWBCalB55+LKRrXw3mevf/iiEctJxQ6hN2IAWyuM8DyJ2HRZ6BP/PsVV9d13N9Xh
 cEqWgt6nhvKpK2iy/4w==
X-Proofpoint-ORIG-GUID: ghcKxqhfYLIxi8X-CZeIZ4k2Rxy9O4YO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080032

The video clock controller binding describes three clock inputs for
Glymur: the board XO, the always-on board XO and the 32 kHz sleep clock.
The videocc node passes only the first two.

Pass the board sleep clock as the third input. No functional change,
the video sleep clock keeps the rate left by the bootloader and has no
rate consumer.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..b389f953f97f 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5810,7 +5810,8 @@ videocc: clock-controller@aaf0000 {
 			compatible = "qcom,glymur-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK_A>;
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
 
 			power-domains = <&rpmhpd RPMHPD_MMCX>,
 					<&rpmhpd RPMHPD_MXC>;
-- 
2.43.0

