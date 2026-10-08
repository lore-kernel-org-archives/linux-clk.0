Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3192F446824
	for <linux-clk@vger.kernel.org>; Thu,  8 Oct 2026 08:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447072; cv=none; b=OrYIRHVMv6WOraNphrqNGL1Tpv0TNjLg6YeuMVJ2BA3CzXvL/MTdgKITaQTsW9nus5/YewZndg6Rx4xAg3PbZlt/SYI32pHMNUj1l4UWNYknK8AtAAyN8xTP0OoF+/7OGmV0Mdu8I7Uf2IwcbyX0Q20LP1rLkKODtkSyM7ltCfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447072; c=relaxed/simple;
	bh=u/PW08aRrxDDpWBnDNET3ssO+UW7wTEeeUrFIy/d3z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GtZ37spKt1ecxqWV8iC6TuP+gtXh630DginZsa9mmD1vQwUkeNjoUYnIPZhdOFnE5yQdUc1Nyzl1Mfbpj9MaxlckAxLlcuhZEYcG43Oq8Cf9zHBg6Ix9TFdMejus7WOn/TNUXvbabwnaEdQbeZy0MdAZ3hjMuJq2TlgFuxVA/kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BuoCQLgS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IxyHufy+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BuoCQLgS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IxyHufy+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KJA03307405
	for <linux-clk@vger.kernel.org>; Thu, 8 Oct 2026 08:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Xa79qxnOojd
	qdzhevM4v7FsqD+kJqqEikGCHIJRtyNA=; b=BuoCQLgS92IRygsnI1NQbtIP1wh
	JJlFI1v6NY0e247ZA3ROfD8RkDkb7tk2Wd5bBT94Uq4kuSiweRYicmcp3hWqLQPr
	mwQIK5Ck0jps+RiTEo4t3qlOxVxxacmdyTvyZfjz9pnAjvYE6io3qTOUGc5uiB/i
	8IVVYJ5zKHT9PYtQcDb9lfi4O82FYANZ3xzNPbQI7J3jgx3aS9kOD10s6BKCNOXu
	mpyjMvd8K2mGVjs4JY13wbNs+bts9ZgLv1/hK0dJBdW4w81VnYBt3NXvjUEoNGTm
	p6r7S+m5HkV6a8mlmD/hUXYR12dJ9N2tV2pfLgfCRRjFN4evsk8ppRKJGMg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg9e6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 08 Oct 2026 08:11:09 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-151ba226e1bso7111265c88.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Oct 2026 01:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791447069; x=1792051869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xa79qxnOojdqdzhevM4v7FsqD+kJqqEikGCHIJRtyNA=;
        b=IxyHufy+JvkvrCmpUT9u69v54uU8FXqoXSLwwDWVOKjnTTlgYkiZonXvhOVytuoYuX
         IH6tXwrKbJEoAMzcJpop2QQv6x31FYOljpX6XjEfp1GK7KmC6CIrZwlVQnAVXdNHBy0E
         0b5T5PYHXbaHBsanQoAyHyccu/3hsqtbiGtupEizd+BuX4PYKsQBSltxOycRvaqU84xB
         u0cbuWLSK6qhR5qHoZA3lwuVWJOdgy3X44+ztCR3Lr1iYrybPF9KIvFWJ/EiALwwNxOp
         iQLUz7oIUrs9VYT0EBr+KrSnPf1KhFPmzmU4yb2qsux6nkIILdOHk/Xi22FuLPcdxhJa
         8kmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447069; x=1792051869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xa79qxnOojdqdzhevM4v7FsqD+kJqqEikGCHIJRtyNA=;
        b=VCEX4H02ZumXDeZ7S4dF7LbdeBPXEOIOUxhyPAUspU+jy99PKAWi0HhnK8pmL6goqH
         PKxrUj4TRYN51HP9UGyW0uv6y7vlqZ1ayjRSTR3E/6zXqwJMaOkegxWadUyWIzFyMoKW
         cOt68YKpA1MeHTXx8FodW3+REOzWIgNKusPBCaQSOloqoUuCq9PCHe0Ij9sTc1mZbQ61
         8+H6Sk3uVxiLml5PxlyxLGjBepp5LDR+ZzPjfNvXePlZUmJjLExa+5IL+nncDs9xjYWj
         ksQpqw1nLdd69RsRirvq5SVeUgeru3lmLY1+u/hf567wHYjRF9vGCvZ1MQ2LYjKx01Yf
         BAiw==
X-Forwarded-Encrypted: i=1; AKwUvBxF1847KO46Dx3lN96WlLBB4BUqSLMcSKgUWlEVW5URhpZIEH0lFa9Q3UKCB0Zich+nV6H/pUGLsSg=@vger.kernel.org
X-Gm-Message-State: AFuF++leeY6ii5ThUHwZwuBsp3PBWqWBhzh/LRStUs28lQgLbf7HpXYL
	VyC8+OtGhZbUCjTeKDue/hhWfqlq+P80ulL1o2hNT3cM+0u+mf0LbK0Vhv+vvseuwjbpwdsXX0b
	mOHEKaTkSm3d0LJSw9vwlWUPdti7PsJGdqwSLtxwjlv8DksPZCdEqR0Gm8bdY28o=
X-Gm-Gg: AYBFou1e3aX7/46TbeW9xZ9PlfLXzVCBV3nJnmqhQxEdn0+egYn1xoptVnNVrtVk2xW
	kWCBDB9TKQXPVk0haMH9l1K4mS6UCcusUC6K3NKffLgBNkRZOscs7qgjxqLXj2bWJKyEXbe85Ob
	5S8uDh8GlPUE5jeCrPczUSXd/z7t4EaHAIRd6jl/I8B+DvJcU4jbQmUqRO7DstaeMMMBfPXCAfj
	Lk+eIHlPlUetVZ+IXjl8Ucxu72xGtQ/68RTe+K7W7k7Cfl7Fx95wTLamX+dQzBh6pRd0nEDuwCB
	0YhDrCJLmAhQecxzvy4PLMgDj0WcW75Pq5W5dgiozBdR2lnCRwlyaIE4TkdNrxjOmuUgF9HMrg+
	lBRz6JCrORyAfmRpKjlFSlYAD13/D/PZ+ytvJ8SPqpDw9r4HwXUhfn43VILo=
X-Received: by 2002:a05:7022:fa4:b0:14b:992f:c168 with SMTP id a92af1059eb24-161fdfc675dmr7382776c88.4.1791447068564;
        Thu, 08 Oct 2026 01:11:08 -0700 (PDT)
X-Received: by 2002:a05:7022:fa4:b0:14b:992f:c168 with SMTP id a92af1059eb24-161fdfc675dmr7382725c88.4.1791447067829;
        Thu, 08 Oct 2026 01:11:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16166121f2asm14522277c88.4.2026.10.08.01.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:11:07 -0700 (PDT)
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
Subject: [PATCH v2 3/4] arm64: dts: qcom: sm8750: Fix videocc clock inputs
Date: Thu,  8 Oct 2026 16:10:35 +0800
Message-ID: <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-GUID: 9t-3QqnpZ4-Y8m-VluvBDctVVFZhhJ9b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX6BHam+UMsQcG
 WdSQAnZe5dkqEfnXYGcSOrmTgltjb+Dba35adPpN1vxhI9MiprJdVndIwMWsjEBvWYYxoHKMq1/
 zvAwKfHfrIMs5kvl5Cye9PKop96YVpA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX4DKMglXqdF8q
 6JEO3oigp8TzkMaBIRsg6cLAX07Job0Ha9CATbYxxHaBlJkyYeLdCSx6vWS54zR0XIP72/ZnQ/g
 h5cGjrNVnmONDhBpI1U0B8Tf7I8XQw6TRXRq0icbuheb2kDkL7qYGKonr70OScU0ykqDrhGgdZq
 JsmLAFDjF1Qim1fdgR3zebm/VcNg/wXyUXPAn3c5OEu6xL+u06NT0d/pgsNS1MffevYRs7rXZJe
 sUKuUyuwlODAV4frA4ELID1jPqvs6MpoBr9SAD43++c7WSZlo2MmQA3fxJp6cVUqSMLu5nJJhwm
 ebsJLkRJLEmhZjKlZ1TRjmNwI3im3JoamB0DLrqY1XU3M5RViXeQapDdlPrpR9B0nXt0vu7QcGF
 e1Qj8axtCaHumUL5RdJGRaHR9XColCUDX0sEg50caSe4cGWytrO8cJrWLn+TeELJJHgjZ1hvFOP
 trHtLjQRR7k+zRzN1Zw==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac7501d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=PKgm7S4WkqlbYhXdoGMA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: 9t-3QqnpZ4-Y8m-VluvBDctVVFZhhJ9b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080032

The video clock controller binding describes three clock inputs for
SM8750: the board XO, the always-on board XO and the 32 kHz sleep clock.
The videocc node instead passes the board XO and GCC_VIDEO_AHB_CLK,
which is not an input of the controller.

Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
clock. No functional change, GCC_VIDEO_AHB_CLK is enabled independently
of this node.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index cf947acc5760..678e6e167bde 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3338,7 +3338,8 @@ videocc: clock-controller@aaf0000 {
 			compatible = "qcom,sm8750-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;
 			clocks = <&bi_tcxo_div2>,
-				 <&gcc GCC_VIDEO_AHB_CLK>;
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
 			power-domains = <&rpmhpd RPMHPD_MMCX>,
 					<&rpmhpd RPMHPD_MXC>;
 			required-opps = <&rpmhpd_opp_low_svs>,
-- 
2.43.0

