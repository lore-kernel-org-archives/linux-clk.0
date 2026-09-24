Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BA54746BF
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246522; cv=none; b=lLMmnJm5Rpyfdb0vQkLXTsx5R0muqceYBggJXofJzJ0NrNwbXI9Y6ZOOgoNnR1DYOaRf9P+k/tjqKG+G21O9LYgtRKtL1bXYaJihJ1Ad3GcfqZt/UDsr+qVJlkNxWy0OWeg5qpP9HCm0BJOx+Qy5Z6vW8m8ilnBHYh1sHR9tDyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246522; c=relaxed/simple;
	bh=mhtnRp9S+i0a7RDUpetDnrE4Fy6EZyBsZ7qeXAQQRiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OAfIO/bE4+IUJkZ3WZzdVjtQJ/nbsVwVuVFYq5ODM27h9Gno+X+f+XrBGVuRZuDUwY2/upSpFDnWR5Fz+EzjJaNrA9pnZ4u1G7cIDF/o7y044pd7jLt0/6QTDUrOoZvjXLRiwy1ivmnoHhfrJoEcy0hZyLm9GJHjOJ6wUi1uRkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1/ftUJc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iPUIAHCM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1/ftUJc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iPUIAHCM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA5KiO1175577
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/1+N15GHXDbkN+QPbbGsdK4ea7My6Fg6Hl6am/QVbMY=; b=J1/ftUJcqw4NQepm
	Ve1CMqTKImAZear7QSAxiV0wIwJ0m/DuPL1BAK3vZy8dntbKaTFJEqJ4yOEJPyTW
	zfLJDnIN3e6HUyPY/1GsAn7USQhTXOscIVEt+5sryAwELB7MXAwU77po4XaNAaZW
	CA2ocTGDVqNRYgeztCp8Ipxk4XmOFii97L9G8qoa63Xarz1mtMBtXROYhXMQb9ZK
	nv1Zodf/k9l1YcZ7HtgmTxHlSsIt09DVl7S7/QgPBGgcUywUlOEiKJzCPJBaO2v5
	4IRoRmpeWHD/tTiMPJUDoOiGTSxfyJyqXlxpmMPBG4ATK5OAnzXEj5YE9tj1YH91
	SLBbrg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7r497-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so388649985a.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246519; x=1790851319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1+N15GHXDbkN+QPbbGsdK4ea7My6Fg6Hl6am/QVbMY=;
        b=iPUIAHCMDlg2UsOdEKxsxUDRN9h7U36sfKAqI6q8FaB+WZJsuc6IytWhkw1afYAxyH
         K0DoJb9vCb/5wIPdVbM5bI4FjxweV+M6R6JQVo1nZ5i31gKgqaTkevcSEXfLVo0YX1kd
         oNTUUJMrUQt6Mb0WtN+JSZYbkTOzcZdD37wuG162B3hS1yq/t9PIqRmIthx6QN62U7QP
         PgLWEe1k+ZHaZqmfFZKQD7o0SfuMaGl43fjT6kV1kwXRV5UhBzfc4cqCY5RQ1ajipCFa
         A4AqFx9jKHqmmK5moSnfPvZ5efhsEnQ5CRu2Fezi6zmbi7eh0996sHIFYf/gSs+Ofwbd
         bZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246519; x=1790851319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/1+N15GHXDbkN+QPbbGsdK4ea7My6Fg6Hl6am/QVbMY=;
        b=nGphYeRST8yVTg2kOczOkpbmuFJRAXW0DnCddmrEx30jo7SiU1VkgXgsD8zLsm+Fnw
         XEKruarnvx80hzh0fhU8sQX9DL6vc945bFk+65Svd7BUJEPO0MCTg5QdPPqPUv6UF95Z
         Qoz8Sb9KgcbXgujvTzxQ4KtEOqPdPve9U7BPcgTCYC5RCDc1dLEZwBRDE4nThllTRN2l
         WXGXG8M1HMpLIBlUXKqRMApkdCUrkt6b1vo05CdH+8o/Pz/ByiM2NgeS6VeVhqhQLGk+
         fW99cZtJLbT5NGx9dfnmY6pIEwRBO3Fqq5Kug5MnZDQZvYTmg1L0q4zLuAY9wh8f/0Bj
         qIwA==
X-Forwarded-Encrypted: i=1; AKwUvBzJSWu+Drddo8jSQYnnVjdaxgerLCmHGe/oUu7r6zOxC2lJkuFywQshkhWCriSkInL+OxUHPld75y8=@vger.kernel.org
X-Gm-Message-State: AFuF++k0qPc5/4H3vicQYKUSGxTBQLMVx/TdhG4moiUr9cRo8gaBeK3O
	uUEJe0oaMsOUVJoJbT2Ops4EvgOF9fKPYc0Qoi/L1T6vt88mJMx9k0gfJj5BSs5JXcIOJ5UkQD3
	z67gMgl6AMZTCG64KIEaIGSZ/7c8wrOpPABcAva833wW5HCSg9lCJDv/dbu0v3gY=
X-Gm-Gg: AYBFou15Jduk/qCH56TJNk7IGL+8bxmBh6ft/kP3Yw3fhUG9rap6DkU619/JtzeHEoB
	ehZ8IiE2Xig+xWCtjXTgmCmcVi97YNJmgwk0dR99QsXb7KCCymgSfdMJkwkA8ngVn4LXdlCmU91
	QJ1dAU1J44NFzjZPUaRQo0oIENoB8pLkTCQvD9Sklnxyv+OPyGq/g0Eq10cHL2MyPuPzPSKlx8l
	68aycQDOp0fA2uZmQEtarc2n5i2gpZGeqZhyI9I1tB29TmF5L4cdrlQPTXacoLZ+ayRlDKERjoQ
	/89ok8iteE2bVG1wIIA0zkOUxV7UwSQTWFr5K/+vCMMwXUpKUqxxkEfp3hy3n+gngmSLgqOys5V
	+hEp8ZrjC
X-Received: by 2002:a05:620a:6f04:b0:939:a45b:76ee with SMTP id af79cd13be357-93c3632047cmr233895985a.23.1790246518477;
        Thu, 24 Sep 2026 03:41:58 -0700 (PDT)
X-Received: by 2002:a05:620a:6f04:b0:939:a45b:76ee with SMTP id af79cd13be357-93c3632047cmr233890285a.23.1790246517792;
        Thu, 24 Sep 2026 03:41:57 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:56 +0300
Subject: [PATCH v5 40/42] arm64: dts: qcom: sm8650: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-40-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=mhtnRp9S+i0a7RDUpetDnrE4Fy6EZyBsZ7qeXAQQRiQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP4Atbx+Wq8nmvAg2M9gzxj/1yDvRvMg+Wfh8
 3FQTJccy2iJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT+AAAKCRAbX0TJAJUV
 VsEvD/0VwTRiSAoNsOomuT38RQe9QRlWzecZEhPlozm9bQTW1n7i++uVZjQI2I43tVpKUzPHXb1
 gWiy864UFWXFFZuEtsPOKdGPHm/OO8z1pitUMYHuGOiG4SVmPUEclVbocQeoZK18UuXBC/wk7EL
 N5geXxLoYYqwJNIEAXl/09qJU8x/ab8SLHDEt534QV9AHFB0imx96dAZnykjLoUBBOAxJVgpRlv
 M30vx/Q0kMNJaHoKJHHM4Lb2VbAQW7nN9orVoKHh01KLQNSZNenVnZY/amThTd2IJgB6mQQUj6G
 XuXW5USSS1NEqYPCRcx8cxyur6hWbAUTlIdXFWLSLw8eKYpB49owY6+0pQhv3MzLmr8OkNV7Vl1
 CICcecvqYFGvjD2qG+bFStS9Kcw6OrxZ1Fp7w6uCIYH+2KlrsgN6AU78jOzVSlWQ9wqxtNL1CYt
 xUj894TCEUZ3hF5YznaMbt6EnGitNKHT4nlWYfGE+XGu9N6mXENl27nvHFLttgTsGR5Db5DSATr
 fzevuCg+Pyk8OgEsJvdog9TKGPFlPOArtzt/qI1Z1qq/8ZBgd9kD5LJd53aA3eb03t8hoap4sO9
 43q7u997zSmdKih4o+0Z4ikWbcZO1F6PhmQhlR7pQVrTdbeFQHamSKpepPNv8xBpTaFgWD/uSz5
 EYd6vntBx+TpD5Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: mKlSdbLLp8zF1C1rHqK9XM7fyNq6sTV4
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab4fe77 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXyhCx/8DQrWQv
 /moX+GsEpJYdD20TkQApwfM6V94qhaoRG7GZX5srAVg+3j+WJ+Nq0LrMoEamyCznoroBcE3xBS7
 Dhy0NJaLwtALi6e530D3bFweiA1K9+O070rpo59j7TEsO/16SP6uU1DXKtfvGfJeWUsG9mPRCeb
 wDEQbsRAK+F9oUGvYM56iLmHzi/eIooGJpM2jbPCH9ICtgsV3BRx5KMD3frEb6Y3i4I7XnWYnql
 5sEfiQ26syH3yHkFUkP95ks/yAPUBKk2gdMRAHUdWP7ififzd3HJW2bZ4jYt1EftzkTNFwtwmt1
 nCPznqkz4j6lnEXp/mx5iGjY6X/WrPZO5cRAAUXrxLcyqC5sDYnng0vDd0F1K5h46FwT14kmXx4
 B1K4Y64LZhFpny6v6UCxr32M1mq2NW8Ill95CDwKLOMP7Ql7H9+YviQQ83o2U8TMBFPq29PMQjC
 tAjHG3inogVXCeF6Q/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXxuoW86aOmI2H
 JwwhrkNKeDqS2Yf6eJHaiLkvjyv26WGHSIEoJV0HeXBh5ccSmGiuPOBurDRRtYIq9SWa0yxwtV0
 TiHY9tZsMykSkfxFUqwOvsM8BWoREW8=
X-Proofpoint-ORIG-GUID: mKlSdbLLp8zF1C1rHqK9XM7fyNq6sTV4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

The GCC GDSCs on SM8650 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 99509305f970..9cf38a7e0b94 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2018,6 +2018,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

