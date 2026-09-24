Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004B648EC98
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246520; cv=none; b=GowUTM6Ynn4fdFk0NYd+ShbUR0rKTMx9Iu2Pe8uJVpYAi4uoKarQc41aZb3np88W8ctjryZ17kfDEyr0CHrAAQ4o1SdNh3zZ4bPgqiQ178XYmVsn5/b1raTK065WYMfCVO0Wzqv/rDCooKS8qjeLuOqTBg5PZJqQP0PO99lWy70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246520; c=relaxed/simple;
	bh=gTast3d4XqcPgNd8hTEWoP39BKm5rck5V3njvbIRnKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OXlK2FyAEm3Fvx2xt4anHX3HuQfbqfpoGCUjC4fQ64ZLj/2CR6mJtcwkj5A+bck7MPrPNtkm98ZKlZt/XQuQ9MiCVlc7TnGj6c9IdLq6VBAoSuoeKG1mgVT5J1n7zgiOVara5i9oOfTCND1O5EQY72wO4n7/sdKAgLswNiagW2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TEnoTllk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z1yeDyt8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TEnoTllk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z1yeDyt8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PDRP2025623
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R8XgR6p4Y3htUtRenXmyvInQaKMn/me1Io0PRL7IoRg=; b=TEnoTllkj+Uyv9WR
	0Y/rK3JWlr/OZsPDATbw17xoxIA2lv0b8tS0Z36S6mnDITa6YeLSj3v+/Ddo7ic4
	qIYDsTr8/c1qJzhHRfHu9mztEsRG4OZZqf8f/kD2VIPkqhanTAlY+vxv1dvcS0gt
	Yt0eNoWBvat/jvhh9TuTuCq8cenQNKlypdQcNk3kXRclDWJ9vZnKdeLwRhkmm5GS
	jFMirL2X81CjKib1UpQrX3ZIy8Bt5eA6fka5wi+BVQuTEX+GaB1kqeYtIu/2Lf7v
	MWVwtRijKAR3qsxHXuesybHvrNHDxHfDTKa8Rrc85ZzqEzRcs3qkRddEO9NAg/bQ
	asaO9g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvsfgt2bt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:41:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1b824e84so401578685a.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246516; x=1790851316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R8XgR6p4Y3htUtRenXmyvInQaKMn/me1Io0PRL7IoRg=;
        b=Z1yeDyt8iMIKm42IyTbYU/LXmTNMndXSC2otcpdzyaXktSuf6MooQ5jO9Hh+ZbDriN
         HGqdQa1kjZBW1IwkPo51Uciy3XZwUpSUCC7A3CTUxjTmv94srwF5RbqsI17PKEHgxbdl
         ryE+lRnltIWh8eq+u5bGw46HXtQo/tbK31GUngRUrF10piLxiaou+TZ0nu9r+kU2SI/N
         F0yOhYcPDNVCJaoPmPnH3m2jebH9NkXw/ltddsraxva4fLOzLwff+l1Ame3woLucIdkb
         fvAI6DjJhn8b0IESOOMtCXWxszce1i74GygNz/vK+aO3EPhKc32Xg5KvcvN9fFNRlShW
         Y/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246516; x=1790851316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R8XgR6p4Y3htUtRenXmyvInQaKMn/me1Io0PRL7IoRg=;
        b=SQ25AsQ2XP/6wElZgVlLWotGIBvTeORXAteLXOiKLrQlrAe1FeLabvFLfm5Ea+DUQi
         OuhGnzrWMcQWvrhH8b1cHYx9HvOPVbhTvlvsS87UMC3e2GSdixXlqhM6vrRiUmGOG1HR
         nipguzDr48YhJw0o1f2XDSYheJDJJVHHlLJ3/WPAy0I8JNjhBFfvIgVhybp2acJgBQ+7
         xnVdoMTt9vW0xVGvUQgtCmD5hntI0xEIaie9Z5jNUmY13Hmu/9QKrj5OiBnc/SYgV2xU
         IyWHFhvkQnMytBLfMbqBZCIpXt7CTL5guSlhmiJ2wi2yWJpwK6/ADbXVzCH66i/Y49zH
         BCLg==
X-Forwarded-Encrypted: i=1; AKwUvBwiYyhA4TVJ9HsR87jhS6nsNUWy4yRabsEwOLxt0i28iCNnOYrQJaVe4iTNpFR+s2DJ5Iy4VKqG07o=@vger.kernel.org
X-Gm-Message-State: AFuF++l8v1cpsA45Ju4uXg7NbbofXbIEmtgtsgfb2eiN+fK5VfvsoFOr
	81BsKo27fiwhxvFkU28wpY/rGWSTkYLpUHUGSLUr6BqZtbxpBy8KkejOoF8CnqCt4NEpWhu8Zck
	W6eE0uDLyQl0crFpKaLZvCf5a+z6P+JHvfgfiztqiaawm7wVyPG3JFaTZ/MA8Ldo=
X-Gm-Gg: AYBFou1IqMP65jK9LikmHep96LIMyqCWRjo5xePetaWsTov5cNYsk/ZGV99N2UpPkra
	EFq2UL3BGI3Y+qYnPsCw6vymqqKWtmTq6+ffk6ViTJzrnOrI9BVkPKQD6kKTdfeNOkC8s9N1iyB
	ShwPARTDTzaUyKSWEX5DH4pBeKqpaeDVjsLq4LH9jrG5mHAVtDFhl3BlHXRL1V/jqSxAxtAH8jO
	i+BhaFm0hl3y5oqrqrsfxLugy19lwoV5JuimbvllMpkpyMIj6aAlbepzGIAm6Qc8CvKPTHWstnp
	bDbySprKFA/oT6OXaxBpWyDMoExbTaH6L0NafbIk4BglzG9FLAthrLHPVr1AybrOjnxCnX1qZbO
	zD3V86rxT
X-Received: by 2002:a05:620a:708a:b0:93c:2110:14cb with SMTP id af79cd13be357-93c363d3c70mr226897585a.46.1790246516029;
        Thu, 24 Sep 2026 03:41:56 -0700 (PDT)
X-Received: by 2002:a05:620a:708a:b0:93c:2110:14cb with SMTP id af79cd13be357-93c363d3c70mr226892985a.46.1790246515452;
        Thu, 24 Sep 2026 03:41:55 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:54 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:55 +0300
Subject: [PATCH v5 39/42] arm64: dts: qcom: sm8550: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-39-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1001;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=gTast3d4XqcPgNd8hTEWoP39BKm5rck5V3njvbIRnKE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3/qqHrWUcAxuohzr/xNHzMvJzTuWLm6pe1C
 NQ/Fuo+EN+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT9/wAKCRAbX0TJAJUV
 ViNOEACzQBlw1ReZ99LPaZPpKi5CQxJf7bOX9nPJJHFmDz533OP6jYUwDoUSu2kTiFwi4TB2gGJ
 ey37t+x8fymJBxpYKwNHm7haLRS9be/s2+vsfMfQHBlfGT3WpHX28TagYUR2nf9BnkP1Vnua6wC
 HnByk2K0idNsWgdvRsE6Cy0xOqAEktJutJd9EdjoQIYBF/U6+NJisTQlRjeVmcvzWripHWgnxK6
 kTEomd+JcGmBJPW/3+6WDiori+Ha/XWhLWY8wvsf8yYEKcqJjMhuga5Mio89Lz37sVmChbx4LtY
 M9XWdUp9KY7981GnSKhYFoJiL5kQyrogBeTxCVh8xHcsXMUwpUDR9FTzpk0Qw6F9gXE7EF8ysbG
 Dqo0sAeaugzdnC53fPFWhP8FExJYkx7RfzcR2eCXsK5g0TTEYMibRwyW7rn4ip5sTsxSU05dIYG
 bn7wdlqo9Sh/dpCYJPpY2Lt5vt30qo4DIUBOTOwTLK8mWK9xquHttBiYnYQ4+vs0leLk4Y6y2Ah
 LrhjjaA+NbYZvc5RBOLEcntXHNFbkQxAQSN6DzR15cz20t8NQhfrvtt4mNfJSo/yM+YTRR9xKEn
 vxMvqtxxMNDLaK/RZpqkQo9vJeehaL+UrMcKA9aSlimqkSGwCrqCpndPmYF8WnWaG2VnLXuUneh
 MU5+/4dl3CEYh9g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=YfoodARf c=1 sm=1 tr=0 ts=6ab4fe74 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: gZlleM3gS2SkrFi2BpfLM0ynXsMeVvw8
X-Proofpoint-GUID: gZlleM3gS2SkrFi2BpfLM0ynXsMeVvw8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX5XAFT8+5yGkk
 Qm238waLC5AtqE03z3dA/95ctGRXpgLh+ks4QJiHIjP8P2ojU7nw03L0VG9PVgXdDkK1frajPV3
 DN6ptiRENbs53n+1pIo02OFpBVbsKP8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXyL+2mRCnXj2W
 xoMPgnaSOFMS3Jy/GLFw7hooxm6tP1AArCLiTZXGCOKrVpTUnBzkU/J5BkwfJZ5rXAvA6Gqa95R
 hQGrUeY2rIXf8h8hEMwJ4OwpquO4JD1dPZ6hO4oJLur2f3i/mDgBgZpnQg354O1fDtJ3j8xBBiS
 vis/mLQiqLcKBFM8LL46i39WuzPXEA1n8MFaOMAOT44og+vUcuWu5euYndLt43x/Xo9w74VW3Pu
 Q/J9fnY/KtTD6N+C6MCz8KLuRBA4h7oYFk1v5bbpc4NlG3+nksTkZGWQzqEiJUdg0Z7mhuMIgQ9
 SAA0Kjuep+Xi1hNNyp2q49EDu8ZjJi1Nzmsm/RRgt1aNcbRj5YQwnhETzIfr9XSWtBlejeGtOBe
 gGV+Rm54pzZAJGdNNGg7No6hbd18Xq03p+0qcPcYMBy4pRki2UvzHJV0Vp9uDGglRp4Yfmhn724
 1AUWNyjF3jtHQBUvHbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GCC GDSCs on SM8550 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 23604436add3..9e60836f4064 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1194,6 +1194,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 1>,
 				 <&ufs_mem_phy 2>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

