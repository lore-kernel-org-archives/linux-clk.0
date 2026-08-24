Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7F2430CFD
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572618; cv=none; b=hgqhPn6PEUjLgLyRgrJXYYk711FdVrT7NO+D7xCPfVlLh5stBeqyjjrxyw3BWSlQujU6d3IbZJ/pf05/MzI18vbXslFUI+T05uD33PTE0mjpLogv1RG3yTwoB4hF+Fzajg8DMiK8VZZIWXwijw1pYF9PgjnPknQ7R/olHl8RlZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572618; c=relaxed/simple;
	bh=yuD7neD9j/pDEAzZX4NpcVwGjsPccvaRkExAeg7FqIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gW16HgqCszVKMeBWzxC7h8pbLyswciZ2gFPxkiqmPVyFreZOKTYmMyvDHHTygMelGEZ8RkgJxf+UrIYV1V4o1I0cdhvUlrRjM+ub4ls0Jb0Q8kwGJbm/yEg8yutt9CqD/qRbKZ3zyVSzp6cDgmo5oAOgcRbRWqTLjFwoWSHQanA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MOshDGU1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cwomhVmm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MOshDGU1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cwomhVmm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMdfB2372610
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4U8SIimaB6KvQLvwqCKJu2AbwWyBV4HQme0oVsA2xHo=; b=MOshDGU1dldu10pT
	W2a5ncTPFbwlkRe/F8+Dtjh3x5J9lso1KUqvG2M8T4darfdVIde5cRAw/R6tKfyz
	jNce5y+hT1OH+P29fRaHvos/M79oDcREGZMg0z7YnXfAeg75gyDoLpoweyIaH314
	zDSx/MNOHEfYSv+yj9EK91QbC+88i8To5tF9qLpvXIg2qjGEp1mQZ1/ysOZjiuhP
	IEpYrgqTP5DMVrNS/d7NRG6qmXytdHFdmqaEtD0LngjJNwRkuWe8cYIq2fYWmVo9
	tlFhuYve3u6twph0moTWdcua/jOs6kH/7WDVda/hb6LAmav2JHfeTcn9qkoWEEUh
	4jDS2w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdshese-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8fc6b670b4bso29884426d6.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572615; x=1788177415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4U8SIimaB6KvQLvwqCKJu2AbwWyBV4HQme0oVsA2xHo=;
        b=cwomhVmmUcYsQ/zmeB7R+n8zTHcpMIP1lvRHkgEtqDEhbKAWDVu0zbYzUbqUPgnPNq
         sWINABYeArKfjfIXIS2tnHhYc+uq0fv648ab/T0LOmZYo19HvMkrEtBQlPJJfq5nJCln
         IQw9/YNBZeNjy4SbBZBURw71zrMDO97zcpLCsRZi1qy0sZWPINjXFFNZUYXPDazBk57b
         KboBnTVh2sDM/hZgsb69VUN9WsZ1XPD7jvg3zn578r10Qi7XU6dohpC7dQ1OqPrwt3lC
         IrbF5heYg3CqzSbFLvO5CSMoM8s+maQmTA70R6kTkO9kmgpDF8X28bbsOv5lMaatJpE2
         UMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572615; x=1788177415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4U8SIimaB6KvQLvwqCKJu2AbwWyBV4HQme0oVsA2xHo=;
        b=A60rY/f5JJGqzvEx7tpf/Avsri8gogYiI2V5e8Fdr+4Obevj320hc4yu9MzzyLJ1Kb
         7CyvzgYnJVVZ6fmHDSBr17wMewsB17F7cJ+CRLJM9KjCfup70SX784W1X0yHoEQm+XXi
         36n5HGSt1HB6MmWcf/qjzPHlPQeFcgFd/ovXClNPkaYZ2gP1WovDd4TokNsLZIQCRZKe
         dfqGUYVxNU9v4E0D5rywM4BSbfvzEyqop8i/YTSXb3s0cotk1IjqKdPCveC4CpaNGPtV
         SBDwN4u2jaExRUnKB6oaNKkIcZ22bevcYhm4DKY/GhOArpZgpt5z7diuaKQOQGwswZEn
         oQhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqQyjB2S0hPCCl/+TScztuoMLI2+kUI7ja1Tta8w1uneOyOZvF39hpwjPTrLdQ+ZrUQWsCoR+apGmY=@vger.kernel.org
X-Gm-Message-State: AFuF++kS6djArolH0sUkcHVQ6yv/NFyFG/L5IyJzanl7mkLulT18ZISL
	A9cvnSZfgLQ+oCfTJQqQmUjGk4oJOKoFRa7fRoasm/oVtL6crvjdaFIq3AjkM4iajABE5kkyetd
	vUkckg+oEKeCCALHnxQc5BLAIZGpXIw1/xmHxiih1QIwgyXVeT3w6zCeri7kn28E=
X-Gm-Gg: AR+sD10cugj6pAwQ1tFChkwoDDDgkYtGKI/2hz/fy3YB2HAtFvhGx4FlJ8XEFoAS6Ga
	gOy2AiTZwhi7DiT0jQsIly5NgSzlmkfhINqCiQ50H/wv2estgR06Ri/24qaWojn6U2I9CZXZlt/
	s5wKgblNLJ2a39nZ4Ees+gB4EKh1qSSSV60pLXSHMPRwv/hdCQfclXBPgyrZmjMEuNdQNEBfljD
	h5dkwmdUxs+Wp8aNkfRt6i87w7+Zxw4slu6U5VAf7EQ4hzDFToUU2SMZLn39l6eD0b6hk++LlAi
	YT1XArqxX9Ga4jPrSchtX1LJcY0Sad9wqK4zxhrs79Hkg0WlI2Vq1xgxUARQUKoyOKq8T0kH2H8
	YMhZaMS4w
X-Received: by 2002:a05:6214:e68:b0:90a:3477:8d36 with SMTP id 6a1803df08f44-90c8104d554mr240291496d6.27.1787572614799;
        Mon, 24 Aug 2026 04:56:54 -0700 (PDT)
X-Received: by 2002:a05:6214:e68:b0:90a:3477:8d36 with SMTP id 6a1803df08f44-90c8104d554mr240290706d6.27.1787572614292;
        Mon, 24 Aug 2026 04:56:54 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:33 +0300
Subject: [PATCH v3 46/47] arm64: dts: qcom: sm8750: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-46-f1205a92682b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=yuD7neD9j/pDEAzZX4NpcVwGjsPccvaRkExAeg7FqIs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDEC5mfrwgU0j3IkRyU2vAlZzwPxAGy4TkiVY
 JvyfG+g8fmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaowxAgAKCRAbX0TJAJUV
 VpYYEACWraUU3aIahadr1pEW9azdSk1lsofojcnXay2c/LV482NAIil9iWh31hQoCtsnn/NSQyP
 tiUkwr9/m33w/KcT+BNl9KgwxwvlsG7K15u7Gco3qawTwb+ZiErP04YVwjgaKSqWuWkfUnn6EU8
 8l6KzzCpx2jUVIfwfSrOXb6NnYj13neULnSSpi9CIQFmTywdnKbNePGPKEozl758DDy7ZtkxIHJ
 EV1k05EofN1oGJGWRygsc3buPr5dTDtaex6HAoD1o6/7Om6l5qf/yg1N8gqvtw+Ro+KsM7CKt0S
 DftoI8ioSw6T/eitzEu6Fxr1/47SDVt5LMajlGZLDFPo8Jmd7SlR/UX7qpRuWggSdEd229C14wW
 dmenAegHzNDeu2/I480iN+xLVHLA3h28IG8fbZko35R5geKbgAcIf1sVo3Q+ruPtVsd3scPsEF+
 p3PryYi7kyTy9ENg5riuxSVXitwwAwINCNXiDPMm2g76VQANwYmXaMk//A1gZnbeqJ+uz5VAu9f
 KBTc4MRh4lleHYXYtGqaJl+A25SFS/tm1KvHSHSgDMg63GFZVKz22uhAx7Q9MyJJLc1duVUj2Ek
 b96V5PvgEnm7hxKsC9hYfKhd6GzVpoKNyo/FZQK5dXybh/Y061z23N6QfFYwAIUTSTz0xW0MGEz
 rbwgiNSjr1YnN3Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: qM9njT96H-xPlZD2BCoz9aIc8XuzsMak
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfXz4/90WFIR4LF
 OTT2nuJOfRCyNNvigjcfCyguDq8UGt5oGftg1+qv6pyRkKIh9cxqY8HT/d8tlZ5tle6jg+UOwd1
 kp1M1BirizlAcrwRB+/PzoE746Mx6B1M4owrOhb84o0Ab2Yl8t/gisHevW2SDWfWXgPCWce70CL
 eFk3df41fMKtDI01zpojDNLSKnDYPrK/XUeGy8Ra/9yYICt4Vakh4vQ8VV7ge33g4kMo1XjmqE7
 dqiFR6wIwxPLgOSq5CDeXA9qT8BUGUxr+Atwz2EC6+cWrMKhYA986U8VtVq27teTouJeOIqgX84
 +tehkG958rfVRklzGqi0RU0NEzWqX9I7iwfIt/7hb7IMZ7pthJpLYpOqSX6uo5cv8yfHrlBpoSi
 L/e9HmsRdkZWsBlGO9nXtaZ1EchVLP1ZUqZ1PKM4+z1USIYgdzy0ytaXfy+YKD5yNXszAY3kFOc
 B7+6iK8VTD8Hq8uwjWQ==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c3187 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: qM9njT96H-xPlZD2BCoz9aIc8XuzsMak
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX3nts9gGt1B2o
 Oa8AHuJGGHpqS6FlBFo+lSTijL5LiWF4GEA8dD40fWdz4IF11+OQetwDtizx+IoGhH7alhdwZzp
 mnWA9TSHoB+mqIbfWDPF/X8BN+Kt9KQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240100

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
index dd738d13df8e..cda18d4dc6a1 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -676,6 +676,8 @@ gcc: clock-controller@100000 {
 				 <0>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

