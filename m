Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B0E348463
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 07:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137712; cv=none; b=i+JxHZTydxceCJzWcFrkLs4u9Lcg8KHlloQyaaLsdXhXgTil3jdEp7zudvLOKzzFiOWABrmBYZLJ6OppX4x9Tm2CD9alQFKBaSfe0uznBc8JRzPvOtcWVyeSCSR6yFxSBRRey9XpR5SL81LBndMBhnlQ/41I9yp7jSaTPW5/7pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137712; c=relaxed/simple;
	bh=m9X312GlyTzYrjaE5voUXDp0+TdVreRfHVkajhAsNBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=auzLr0z/wESkXrgFEIqI4xumY7Mvhy5DhTshWqvCVb1/gLeORBZ3kFJXKtlvaP9Exc2gWXdRBqGu2sAmFWaoRbwiDYbcPHVsdLO92xDCl/qrR+/Zf0//jXejUQh3Q32VJQfArC36INAme1Urszd/5l4L3CWEW5GuJRxpM/+8Ie4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OfDnszid; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcVEJNnB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OfDnszid";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcVEJNnB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64745qWI879602
	for <linux-clk@vger.kernel.org>; Thu, 7 May 2026 07:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j7Zo3oRVuQPAjn9JSO06MZzxwB1mFI14yIOh6gsjIS8=; b=OfDnszidh1huHy7n
	dOSgZhK+fx8rZMoI+iMYbTptdWmsKh+pXr7mZkXyuaDDy0ZEdELNfBF+yzb63Oaq
	84g7qaZ/URporNtjEO4+dARnUPY5FjU+Xlwe8xtYwsqkUvHFfpgnJPNedSWJNKhu
	3ZX9p8kBz1UUkfSAH1i0e6Fbq2WCoCuDPC+g7fQ87StfhcMAWjsT1mn8rk6G2PJq
	0EKQHhGPKqQGPVgItqQ2iAUuShuSw1L0SQ7LXaS6VL1kEXCGESpXR3rDrP9QWt4K
	SgHmlkim0mxClH7xtu/Da40QtDuplc9tUdZXQJ2oiZJRElG4vZJz5Hv90K+pBFrP
	ow552Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq0jp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 07:08:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8ed08aa4so16500751cf.3
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 00:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778137709; x=1778742509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7Zo3oRVuQPAjn9JSO06MZzxwB1mFI14yIOh6gsjIS8=;
        b=NcVEJNnBj77xvXFFNERLgxdfV6oXjFgjjR3PUBCi03wqYXsPpQB6O6ujld0toH7on8
         WUdLbGnJiL1IzB6JiNvSkmw6i4V6Xg92Nm8eNqzBRFahLavplwvFf3VGpFFQTDA+q75G
         k5/g9AwuDTmjryY3O7drY7PvzD0iiBpv4S+FZKR/tgc2SUlCq/dY1KmHTl/30832tAdY
         zl8eKH7wg1e/IRgkEe48yBkrCcIt06KeDeq7vQfo3/sxYNwNpVpZrVK3y/t3zkD4cqlZ
         yCdQBjgeqY7dqfrhcuBspP8pQtdF+ZFc0Hs2Ga3+uXik7VHPp/iTCznDz6d76vKFgHfK
         D+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778137709; x=1778742509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j7Zo3oRVuQPAjn9JSO06MZzxwB1mFI14yIOh6gsjIS8=;
        b=RT7JwaYH+TcdJ3cZopRRmtVM3P0+45zwukysY6purPQn0Y+mbwyRzd/2n/nudXMWOK
         FeibUVmUt8PsZ6YdUK6dU0chPjWHcWVhZxA/K3RhETF+/TbWD/JAxDG+AeruQPSwuRbx
         xIfxTfpbfEWUK3jhNz7pnkFN0m+3P7CIasphzwr6Sek5tTdziD02bwfn1BaoyGu0er6c
         zwwekM6hJRnjiaKLxAzJJjQcidbAGlNa7wZsQgP+ZAP0heXCJvV3JoEJgY1zepM/hdsY
         /hiYFj0lHEP7VLnAwLomuNIn5ByXsGV6v31+mZwgyWzxQs10eav5lv63u1iw/33/5kSO
         wqkg==
X-Forwarded-Encrypted: i=1; AFNElJ9B2q8TIHBEjP7m0n/FG9/0p0UdcNGdyXq0Yp4jOPrQh/qhZjKY7/T/rrD++y8o18+DTVaBK0HQDAI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF8UxdnDvgjoiGKB3cXWHzjM5UXOL4QgU68ClbOB6oqZLdq08Z
	b0qPH6ZrZ/0sY60PBCohdunxgS8+Bb0NygBmAM16GwvM3+H/3ODcrKzlPfxKdLzM/xPTrDGfTUT
	+8ygaPv78m3lum3NaSPwvvPDO8/gSKVCYvsnot+VXEhU4XVxztlX5v2jeONgwMmA=
X-Gm-Gg: AeBDievN6QGsiM0E9IXS63SUSqcmfZ6hKT2Jx/NhDN1Y4xF85fIJ3YzcWuU7Lkqs6er
	7/myX+vXeg1eozrhzrmpntobIA/Tx1pSkCf3NpwCpMZ8sUq9eyef4/Ou10KAqWREy0mFJj967fs
	vu78hrOCtGpTQIqYtTCHE2rTfUycLd/Od0gfe4pH6KR3ZgTIoto1sRczspJKNlBt6jkaP4t9XWr
	IresE/xORY3s59XQ17WpM14gR3GVGtq1Dc/FRcatKwxcJOWxTCmiZeVPk8JmGY5Ige31O5pazAn
	4gqYY/YQAJhB9dCl7mHNlPwIerMHG7WGXYDDCuCqs+x8eu07ouuoS7mFm1fLiZCLBPnMm9sm5vV
	e/Yfo7QRLV828md+M0L0fu5Bu2Y6io6l4R3tlswC6JnTgMtx/rYEWDpnD3shWsDz3RVfalCbuqj
	vBL7Y293ddTZoEg2rV4XEz5bAbni/BuaUVKK8f2OZYkFVq+w==
X-Received: by 2002:a05:622a:5145:b0:50e:41fd:52e with SMTP id d75a77b69052e-51461fce4e0mr88874681cf.37.1778137708754;
        Thu, 07 May 2026 00:08:28 -0700 (PDT)
X-Received: by 2002:a05:622a:5145:b0:50e:41fd:52e with SMTP id d75a77b69052e-51461fce4e0mr88874531cf.37.1778137708343;
        Thu, 07 May 2026 00:08:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86aa338aesm4296784e87.43.2026.05.07.00.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 00:08:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 10:08:11 +0300
Subject: [PATCH 3/4] arm64: dts: qcom: sm6115: add venus device
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-sm6115-v1-3-0b082ad8eea8@oss.qualcomm.com>
References: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
In-Reply-To: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2620;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=m9X312GlyTzYrjaE5voUXDp0+TdVreRfHVkajhAsNBw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DpgH8Ky50VAX+QaOuWk0Kw51X0lsmHYY6OtT
 sCMRPq123CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw6YAAKCRCLPIo+Aiko
 1YPxCACGOzREuq6F0fo5UGrKdPv9UFXP/CN5XxQXw8/Y5r9n1h1xwc5Bqx77HpJ+Y53mla1l4Nl
 FJJ1YpPMm+IYuy2PuP2gn5XXVhdCBJS3NfG30J5JTfB58rsvpFgLs47SigzorPadKF8W4yg4R3o
 NkCJ4krilnUZK6DO0JUTs5QNQbFxWhuwKKPF++oCR17N7cil1R/vm92L+fMkibC5+R+k8ZIgZ6Q
 pItBZUVqQ0Fsf8MeVMN3ecAAQ/lKwBH5+m//zLZQnZQUwqYQTUPCM8F+UfI8yjzELRZjBaL00ld
 FtSwaAqakzu/38kFqudc09UYu+cY6ns5C3QfwliHXjGrdSLz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc3a6d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=RLkLXjOyRIPW4P0KXqIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: NPxHee0VwYIcP4pvildaPoNpTTzIJdp5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2OCBTYWx0ZWRfX+X47qimPGSRc
 AlcJzqnwHEMKsGzdR3zvo396lSvrECMWJ3RgBn4ACPbzw4lRWKdwIPwpnf+vXbhsd+sWuHFN1Tj
 ADAI2khTE5iaLMW1nw+3+s/HTc70CLmyx5JQ1jteRiiKN+iUa4peieu342S0OKv2Fhe6KWnoQxR
 IJ38Z9CSt6Am8IiyI0P2yWqnT9WvlPS+lCtVEtC4MCfRI4Z69Afr5yzs5IiX3o8XCijJMdFxjIY
 VaXC64RTqocdlnUzYgJRg7d+0RWIFqbimVvrQhnVdJFR6dT6XEXkNjO5PYcGgwNDY0F1F6101/l
 N8R5xyiG74OxI1RY83qV6K697tIEKeTJZdTV3Vt1q8+VqGDTCyFB2yv57CX2tRN289QyczM2PXn
 wDvr3OXHJNwZl1B+eE5qO82/Tm+QW16OwubZjOABq9F6QYDWw5RFOEpnlP2AT9uzMkSI/6a850B
 WP+cYa15VwTO71KxK6g==
X-Proofpoint-GUID: NPxHee0VwYIcP4pvildaPoNpTTzIJdp5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070068

Define the video en/decoding device present on the SM6115 platform. The
core, AR50LT, is mostly compatible with the one present on the Agatti
devices, so it uses qcom,qcm2290-venus as a fallback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 65 ++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index bd94eb87d6f9..3520802d1fed 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1853,6 +1853,71 @@ adreno_smmu: iommu@59a0000 {
 			#iommu-cells = <2>;
 		};
 
+		venus: video-codec@5a00000 {
+			compatible = "qcom,sm6115-venus",
+				     "qcom,qcm2290-venus";
+			reg = <0x0 0x5a00000 0x0 0xf0000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&gcc GCC_VENUS_GDSC>,
+					<&gcc GCC_VCODEC0_GDSC>,
+					<&rpmpd SM6115_VDDCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "cx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+				 <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+				 <&gcc GCC_VCODEC0_AXI_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "throttle",
+				      "vcodec0_core",
+				      "vcodec0_bus";
+
+			memory-region = <&pil_video_mem>;
+			iommus = <&apps_smmu 0x860 0x0>,
+				 <&apps_smmu 0x880 0x0>;
+
+			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&bimc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+			interconnect-names = "video-mem",
+					     "cpu-cfg";
+
+			status = "disabled";
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-133333333 {
+					opp-hz = /bits/ 64 <133333333>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,sm6115-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;

-- 
2.47.3

