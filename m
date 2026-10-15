Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD5C5304BF
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 13:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071358; cv=none; b=PUENvw+McYGJiaVPWApTCX3xUTqug7G+/JbHTM2m/oPz1X1XOctH6BQ94CNK0CNQV43LMXp6tOfCcdTDxcbjroSYjP+SlHkRJM7RhtbnjmVFas2rgOA5CGR6awiVbFlQUdDFqEtR+Xbl/t4M1TnsLcOCqrsTGa9NoTvd19pq3PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071358; c=relaxed/simple;
	bh=+PSGHcYhlKBGUAOZOmZLd2LslZtgKoxn3b+rUp13o9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bJcUMwnElHRA1fiZ7DpjDtA5ZSqT3nejNUez3FoaKuHlJPAaER+E306GcBFmCffcXYYUNmSIM5DymWz5D8TTo1peArj41p+7wrLjCQ8y35UKuPOP/P7RzPxINMz5HdRASyPaxUKHPCn24QkD2zSr8q5g+/XAPtS1o0Ak9xHr93E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GPlLOmSF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j6tuGt4r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GPlLOmSF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j6tuGt4r"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jlVL3510608
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 13:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	si/Ff0+6PYM+xJYLGWHK2Xz4OkYG/9a6KfcxGBIOM8M=; b=GPlLOmSF1Lm7pu5P
	gXV5tInEi0F71FyHXVoWuKKvWZ0arQju0g+p7t8sE2CxyZiTCqfe7YBS7+WLhTNk
	LmYbPwTIXC/s05nK0YYsh+yok8G1HUEmFn/FpIgvzVO0EuugBM/+VsPeppBN4OLs
	PTw05TZ7u6wJljpwMOwmvt2bSqWTQDIAk89Jm9ZDC6KDknqQAogWH0IUOKka6FqZ
	ExLBbd4C6kE9lvCrxIKRrRVDGf95CiVQcGwVFuYmguvfufjxNlsM3kRDPVKBDHhW
	W1NleltdcDoCjmnr/hTbRrW/2SOlvR1hz0LxG+TVYkpARS+DnW0G8owhTTT2UTAQ
	8d00yQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdsa91a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 13:35:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd60a365440so2954853a12.2
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 06:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792071355; x=1792676155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=si/Ff0+6PYM+xJYLGWHK2Xz4OkYG/9a6KfcxGBIOM8M=;
        b=j6tuGt4rc39/iT8YlhFfjWIleYvJkmmvtm/0Xv4e21hte3X5VzSiR23xW3OB1+jetJ
         QAAZGcytKn6v+y9gWGxcLwqma/+ZIEdgL3YxY4r584k8E3i2kGz6AvkHGMS+s6bsl2tl
         mfmfQCKTlz/j6Krb2lG8M5LYy0B7kNjMwQkBmiiD14YSHHukBmFLyXD5cBSCa+ay+7M6
         am6Xuehw/aUf81cqVHPglFe+WtBbwkDmfMRYgCvLWgcXXtb9G7PcTFlifFwJKFkgxfVE
         V4UsouZueORPmTCSy6f2CzCFlXfaY99uhInFs2yRMHwhtShK1ZHo8WLu34VdjLNbwgAv
         ADCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071355; x=1792676155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=si/Ff0+6PYM+xJYLGWHK2Xz4OkYG/9a6KfcxGBIOM8M=;
        b=Nkxaf6R2WtUEc/cYj9K+swRl63It05iZBJLFEUi3IOWOw7Bted+lPkHM7eq4KsBQd3
         mos8/G5K1rVZabqZgKC0VPrt+5bHtlG+U9Lu98xJk/7h7Hi6+fymX2qusNm74pOKfPgS
         GZYKW9rhnxLjcepUS7IFrY7DGZ0RFWnsCq2+chZKQuvbq2h18UY9lynWVr0DHbzVXv33
         JN0+Eq3yF4gYX1kJEI9grEbGB8rFS65BdrQsxdZFEsdrirj9q9mCdhyvd23b3zwdLy/I
         fotVQPyrdZCZHBIlU08oXsFotMGMjWcWQT8bXn57Oczh5XTr0fiSLucsB1BJDQnWY+gn
         Fm5Q==
X-Forwarded-Encrypted: i=1; AKwUvBx1UZ7jcM8jelVad6pHUVt6KW1adZdDoPNXJX+CmTVh3WFFiRL1CcC/WPf62kcEU7q5xEXxnycL4P8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYoCaWQYrTCRUpg/JnOUHAL+Geg26EEDVgzlLPnsWTkS90IPhd
	7/xF2uCAmtAqybvAjNvdFFxIff3d0rQm/nea32YyZaZzLA9QPtXd2tfy4yDJg+M/eOGnNc/iDhN
	eCHlVQ9bxonh0JP9iyJV6imPwkDywFVre7JAd/hH9HLcQe+uRcm5ayGjgNpZ3eHY=
X-Gm-Gg: AYBFou22II6s6qES9pDRm7EYM2RGubXEiPOInmy2ZO2ve5npSX9hNYxvaQ2GPIlrIhe
	cyDdIwwTLu1Yq/Rh3EPeNtvlFevcuc3IzoIk04sFBc1fqyl/UnRSeADY2fem6j7r2bIfWHV5KOx
	4JVxqMMb9NIpdI6UHvrTI28Gbh4u3FuOwRPZtZItAGCe4we5ajzI0FJwPwO3qe8rjImAUhP4jwo
	GxJ4wYGE2QyJqHqzR3A04VN7Q2Z+1h2b3/3jviEl3Y4P1TK0cJYc9WsheVJTtdbTTaGeXO/caDa
	d1pc8cS/4UCHJYsbgMeAhuLBNKauWKtcA0U+nczYlnes0XVXFvyXKpOA8gI+oQVvTgPYGIv9SCW
	v71f5Xntb0kRtEV1BacbjnkLMBLyKKg==
X-Received: by 2002:a05:6a20:258a:b0:3e0:b778:d988 with SMTP id adf61e73a8af0-3e16bf5d189mr17201048637.83.1792071355228;
        Thu, 15 Oct 2026 06:35:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:258a:b0:3e0:b778:d988 with SMTP id adf61e73a8af0-3e16bf5d189mr17201036637.83.1792071354770;
        Thu, 15 Oct 2026 06:35:54 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89ec1705f5dsm476617b3a.53.2026.10.15.06.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:35:54 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 19:05:04 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: glymur: Add support for AV1E clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-glymur-av1ecc-v1-4-448a476d54af@oss.qualcomm.com>
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
In-Reply-To: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 5ohaApUvYjxFgBf2VvNyAFnZXljXj7Fa
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad0d6bc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2qHST6af7bV6ZHC55aQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfXwLcroJBVSX4M
 fX6ksh3hy0xtGIOS8UDxjsAPbnd+o3yYVx+3bdmTZTkQVZzYqVbnlfq9dXeTpdvaTszjhsUzc6F
 4YuEno35eLKXp+YQCnCcc0zw2MiPG+ZQ7UEgQETJKP3vf5pSwKQzM+UaU0S2q57DgPuBwgHHs6Z
 nclWCqMSSl147RxZ6C32OJP/nMjebTeoUsFjwhE9wh3/F2c1E0vlErR4Vmuv+we5wVsCqHZjnYT
 11f/GrZfrPa2lt/5sdlexH0Rsx4HeNxL9umqaZ3BDi2KVSkNgAP+dIHTXvPEOOekC+BXHnf2I8u
 45Rkgi6nSER9QaNUy/R2VT08CdkMbBnvH2CpoYwQ7YK68ccIUe6DT1/YLREAl0ext+VAF7TGijq
 FMGK6F32ieOBfgOBT4g+ooUroM6S5P75o3JaH5Wsu6ESOWZVts/NH3zB8h7O6gR6j1AMP2J6fdd
 9WQFEoehrlp4eiWWs1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfXxhR7ghJBySi+
 zn2FFSDGiAVzVOPdpbSFHXQ7u+nIq0wkJMZ+eul1xGWriaL54MpKL+N9iaGQq+LKOyL3dMFSa3V
 cJU0q3osYfwsOV3/trnIBlyViOJx2yk=
X-Proofpoint-GUID: 5ohaApUvYjxFgBf2VvNyAFnZXljXj7Fa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150054

Add support for AV1 encoder clock controller (AV1ECC) node on
Qualcomm Glymur platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a99208584797eaca8196348c617619af..da7548e6f1c555a01513c964dd974d45f07f7266 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -8146,6 +8146,22 @@ apps_smmu: iommu@15000000 {
 			dma-coherent;
 		};
 
+		av1ecc: clock-controller@15220000 {
+			compatible = "qcom,glymur-av1ecc";
+			reg = <0x0 0x15220000 0x0 0x14000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_AV1E_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pcie_smmu: iommu@15480000 {
 			compatible = "arm,smmu-v3";
 			reg = <0x0 0x15480000 0x0 0x20000>;

-- 
2.34.1

