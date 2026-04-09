Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED3F3446B9
	for <linux-clk@vger.kernel.org>; Thu,  9 Apr 2026 20:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775767908; cv=none; b=iiTEX8SYTsp2VvwEz+hSuL/EsQAyALIwqM/SSVLyFZacKwDJ9SwpjLM7/PhZhxRonNfWhph+3LCS+CEwQHU7PdmHdUduUES5I5Vp9OU9Et0dl78oIdEB0kIC8PtIHVA+zas7EXQ/TDpNdPqPfKqQ8TSphwTDC0JpHDT9LxU51Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775767908; c=relaxed/simple;
	bh=nY2cCrjmARI7GzxQgMpI6R5HjZpsrjnJmfPbF5oISiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=biTgnTl3dP1c0SCbVjeW8z0R8IUQAe8CJXxxKSbtZ98qzcOR3vdBrZrOZVpmQExlNw90suyOWWFSrV0vDOF8yTErSNps6pDjy7zrfyFuAIsRI1WHCQrGueCXFr0CY1FuESNp4mATYMDIU9r2Vy4989VFE2gfNPxWrPc6GikVdRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MY8dcJh1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XIPpqhSm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MY8dcJh1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XIPpqhSm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639DdVMJ2812268
	for <linux-clk@vger.kernel.org>; Thu, 9 Apr 2026 20:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EK3td8/fpTbEZK+SeQwvZoOgLOpUZIzxXPa2kZfoRSk=; b=MY8dcJh1YX8W3+tc
	GcxdiUnNgqIRS+WZyec4bRxH/Q3F4uXNFndJD6M901gkDfOIMW7++4ef0PmTZ8Jk
	Y3VXQOCMOr5J2EBUZEN04HwsksaVsIzqFiIWQhng4t9zK42KmCUkuiEvq+2KYwRm
	mhjnwS9RRozAIDJUjNrqBUhGcRVA4CSGt2PV5JyXCXh//nG2nuoClEkx4ZF0fiIS
	+JwFCiJMrNA5g89AHQHp8ItxTk2ucZHDP+uSxssAeV7EdGt2BY9Y6geVpvsbt+H+
	knhTI+HPF+iFYFAkgZ0N+KhT7xF4ZuaZUOXSCxQ54FzJjt3D8xsMY2njk5Kn5Hfc
	Swu3Tw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded6h9ff7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 20:51:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so5430227eec.1
        for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 13:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775767904; x=1776372704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EK3td8/fpTbEZK+SeQwvZoOgLOpUZIzxXPa2kZfoRSk=;
        b=XIPpqhSm6qunOh85DGQUtKTM7iafbxWxSFMdDmcgEo16SbsW32NhpXBJZssTp3G76S
         TAHZQFZbfLXZgF5kQPcC/kj5ch0Z2DTOyFZ6hlqlRL8XmDoy2PRsyzBXO80dqX6/4t5V
         T0tF23wXf0TmPXDgFKt5CaNQiJSc/QT+4xPnjO+/6ff+zFheqy4wIoP+grKnovDy0YL4
         1ebc3jIigDdSAHfHX4ycqnIWGIa/3O4cLV6bIALiRsBr+veoJkhi907LyENn/YxrGctB
         ldyzBSwCmRQbMM6SR+HNnpcKKbcnfMaXseBgwqJ54r1Ch7GX1JbRzhzPwSL5Je4twR2d
         O8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775767904; x=1776372704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EK3td8/fpTbEZK+SeQwvZoOgLOpUZIzxXPa2kZfoRSk=;
        b=c5NaEraVVVEkHjtLOOa1ouv6NpMHuhK/FYsk8DLFfxWPUtjvRi4rtANWIYQmrt8hkI
         p+eynxU/8N4K4uWrgeO3o8A7Qp3yHrRIl6zwcAxv+4LksglwZxWQ6HWGp+byohrBXVC5
         Jg1hyeOXC8dvOlMHU24zbjPHwi7shI5+w7umfmQwUQZfraoV01I6ugd8a5UWZc7QoqSk
         ehLc5dlGDuq+GavOUvjblqpg+EWjeyMWQ+PFnj3akec864ero2yaL0Vi7YZaZB30pkmi
         FP/h+kn0wLDnQtvFdRQGnabOKMe2unv0gFc8VphFcjc1Qhkbfu3921uBhKwPygR+CcYB
         b2tg==
X-Forwarded-Encrypted: i=1; AJvYcCVssavz7KjJC8R1aNVvd4Fv9xeX8uy2bgLdcv3/Mb+SXoFWqQBN02n/+LuYoQ9as3DNAbijUHNUvPo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+k7G86d2HVsIb3mc2KqhcS1GH6cODEuQ2bNtpLYkhKtufhGtb
	0k6QdG1ZDApV/7FK7Fi5qJC2xCXTfxUd/S+Tm5xioFHRXx25ybY774tS6mT1HMRgdh9ADA9/+F7
	bJ+CfGJ6h4pUsNLwmcBAsgJaj8UgfkgsV947P1GFLpKaxu4DBO4LXrPraEjTnr5E=
X-Gm-Gg: AeBDietwjPeaeTSaaNZ0RPQjN9nrX/mXKgPat/m5pVJDCslXyQF7FmDpSfVO3eznIxr
	dfu3isPU/ijpO7Q4lLehK/TE+qq++xX166zLmd3cVPXfFTpeA+NUiqcEP2l4anO9aybz58iYRvC
	NIjtOUli9ZVo8BbMKl3FJxkBCPtU9D4mhDndcOPdC74M7NITV+/QAAp7bOpau+zsLA2gWDy/EAk
	G5Tjc++zvgaCybIhd96AWLeKNawsHTcmPsE1RGRBlw46LNkSJ2bs1/PhVlYsJGPCRDUHpqs30zE
	kaLcSTGiW3ocIIH+oqJn+h0bz9KHYnPMzUM8E4Polg3zJIGThkrM0aD8pBhBI4QCBu4XNPfqUZ9
	TRyjHNigwIp9u1FawiNr0fjwgy7cuhUDN2XEFK1guCpq9YVU/5SDb4N6eNinWmmKWuapw2pgc3M
	yO
X-Received: by 2002:a05:7300:cb0e:b0:2d4:a303:546b with SMTP id 5a478bee46e88-2d58a8905d6mr343700eec.30.1775767904079;
        Thu, 09 Apr 2026 13:51:44 -0700 (PDT)
X-Received: by 2002:a05:7300:cb0e:b0:2d4:a303:546b with SMTP id 5a478bee46e88-2d58a8905d6mr343672eec.30.1775767903579;
        Thu, 09 Apr 2026 13:51:43 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562eb05fcsm1327869eec.28.2026.04.09.13.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:51:43 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 13:51:40 -0700
Subject: [PATCH v2 6/7] clk: qcom: clk-alpha-pll: Add support for Taycan
 EHA_T PLL
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-clk-hawi-v2-6-c7a185389d9a@oss.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
In-Reply-To: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775767897; l=2956;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=nY2cCrjmARI7GzxQgMpI6R5HjZpsrjnJmfPbF5oISiw=;
 b=tdLOisN46KKO8zB0Mgal4aiLJSqC1KhgfivuRFyd0KBHgXT3/O/ljhHgGx3g1Tt/7YDpqM1hT
 EmZwlw1lmbTCI17sKia7jk1j5HC6K60HT4kjAgIPx41EivoONkFnQId
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Authority-Analysis: v=2.4 cv=RfCgzVtv c=1 sm=1 tr=0 ts=69d81160 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Xwuga8JxpJPgM73N45wA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: FdCDODDKdGa-a_1usPb6OaHIwlBQ4Xp1
X-Proofpoint-ORIG-GUID: FdCDODDKdGa-a_1usPb6OaHIwlBQ4Xp1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5MiBTYWx0ZWRfX20ypkTyenPbG
 55vUHY3LfNfOWDDn6s4YsKscbO0LjJJhjHQmLqVQhkGn4ECxaDVu/R44/l9lMzJs+WN/15+OJCe
 a+VktSV/1wUjIjaxSosXTBiZDn7lxActWFaHPcSDCHznncXT1pehLuAljKdPlX7BtN78cfWqqqF
 O5OZ8nRkBB/tNCKKL/BpnQjyc1sZpXwqriMSSIDUuIdh7hQQoL5LJKc8JzZDA+nLBLpVuDuhnND
 KxbSQyLMGDWorx8tVuqctdw7O6az83/7PzbxXL8GMHCCr1y/uvYwVb0lUwfwwr+em1HjQ4FC6Yk
 dyS4VvWIO1N1BO6XI78ACeW3ePAu4dAXEqnUSv4C0sjdFFGpMR4ZMxZnlNnpR9kTi4UidIGpbJv
 FnBh/8YSGCgz99CoBe9qsAaWd7KEF5aIvWQTX+4M8g8tfvN2EOTTlLUrn4eXbCtfP9j1PcLqh52
 dgWq7r3hh+m3bg+rbpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090192

Add clock operations and register offsets to enable control of the Taycan
EHA_T PLL, allowing for proper configuration and management of the PLL.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 42d334492145..3a2157bebc52 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -31,6 +31,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_PONGO_EKO_T = CLK_ALPHA_PLL_TYPE_PONGO_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
+	CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EKO_T = CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
@@ -198,16 +199,19 @@ extern const struct clk_ops clk_alpha_pll_zonda_ops;
 extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
 #define clk_alpha_pll_taycan_elu_ops clk_alpha_pll_lucid_evo_ops
 #define clk_alpha_pll_taycan_eko_t_ops clk_alpha_pll_lucid_evo_ops
+#define clk_alpha_pll_taycan_eha_t_ops clk_alpha_pll_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
 #define clk_alpha_pll_reset_lucid_ole_ops clk_alpha_pll_reset_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
 #define clk_alpha_pll_fixed_lucid_ole_ops clk_alpha_pll_fixed_lucid_evo_ops
 #define clk_alpha_pll_fixed_taycan_elu_ops clk_alpha_pll_fixed_lucid_evo_ops
 #define clk_alpha_pll_fixed_taycan_eko_t_ops clk_alpha_pll_fixed_lucid_evo_ops
+#define clk_alpha_pll_fixed_taycan_eha_t_ops clk_alpha_pll_fixed_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 #define clk_alpha_pll_postdiv_lucid_ole_ops clk_alpha_pll_postdiv_lucid_evo_ops
 #define clk_alpha_pll_postdiv_taycan_elu_ops clk_alpha_pll_postdiv_lucid_evo_ops
 #define clk_alpha_pll_postdiv_taycan_eko_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
+#define clk_alpha_pll_postdiv_taycan_eha_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
 #define clk_alpha_pll_pongo_eko_t_ops clk_alpha_pll_pongo_elu_ops
@@ -246,6 +250,8 @@ void clk_pongo_elu_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 	clk_lucid_evo_pll_configure(pll, regmap, config)
 #define clk_taycan_eko_t_pll_configure(pll, regmap, config) \
 	clk_lucid_evo_pll_configure(pll, regmap, config)
+#define clk_taycan_eha_t_pll_configure(pll, regmap, config) \
+	clk_lucid_evo_pll_configure(pll, regmap, config)
 
 void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				  const struct alpha_pll_config *config);

-- 
2.34.1

