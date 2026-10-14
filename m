Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF234DDB4D
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 23:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792021899; cv=none; b=XteU7y62nJys/hOdQsEBJqw3eCQ2v8pYIFGEbjBfLrNzAUN5IrsX/aCgb2b7qWD+47kBKE8Rdc4txyryI6Dm6RtuPhUI84kzj7x3U/FAynXS8N5V2n9F3ZXa5to9mnCd4ZxOUbCnyTtba8QjKW7HxVmCg8Us0N63QuQl26Mvw/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792021899; c=relaxed/simple;
	bh=BF6415btVpAVudmuKDsPZH7SQiNfH+6JB5g0CaPUoN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LMN9c9i1wjBwBNRaNVBv4KVYps6k4AYrlEc2/EcXMI9k1QpYd7ljVSf3L9E8ohZUL40YcdsDyCt4M4+X/g35jDBccz8Xj9NsklEGN0pD7dNW9pAVMWsRr1F1HAPm1XJa7Y6zkrDfopWgWn7sFg7E3NQr3OgC1aXReF/mTe/mI2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G8tLsI76; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EpRZPfLw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G8tLsI76";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EpRZPfLw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EHShl4844398
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 23:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=; b=G8tLsI76cPThJ69z
	IBLDwtmos4tR8uMyoRCxTfmwSlK1Nw6CgnbGhY63jy1gKsIxkWsvL//yTBPudf+N
	rOJLOWazuU/UwnlrekIsLZjjK9un4NKl9KvuYpns/Le3eGTuKGSFRqUg5e9FWdat
	AlV+JSv58aWV8M5Kf0FZMQjjryrnTQ40IcwE1n07nouyNaGDrqrn61RHyZDqgExD
	BmTCSTe31YO/f/z5fPeWlWz9Dld5JfGjNTrxq4/S6jSpK3OFDYzf+WAaJ17GdIUH
	HA/tiicEqYS+NPlvvn6NiJqMTgfXTwSVF+KjmCmVH7Vfc8iOTxWUsyiYWN0VIAhp
	SOvocg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4ws75h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 23:51:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91786abb5abso12305066d6.3
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 16:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021896; x=1792626696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=;
        b=EpRZPfLwv/1eBc7sx0RDv2t04410SrZjfGFnSsSXq4rA4wVABDanRrvyhzz3HzUB85
         pslzWU9RE8ovMIWOF+SiRd17HEXU0WhARPfAjPcd9d1S5VHllaPqVxpD2HSiDX1kilCJ
         dLHmUWtjL13SUkNlSzKPkHcfDSp9ECT888ZvKAn05IY9ER1B6XXeMurTIvLNPaiItH9k
         57x+fA9PtsNepHFvoaOHIVmHsDlcii7kylwrFrRbvgFENAclUEeJARuT7oOKQs+xpItg
         WFKtB9Kkwvja2msDk1U4wSf7A/7Zc5vXsP7NUKE7dX8jA4GNWXAHQyj3AdYJt+Kv3KdD
         SnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021896; x=1792626696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=;
        b=oygsprUR8Ddaaz4hVNTU6H9jr+nG78k8zGP23c9uwI1yEJQECUHLdtx3mu2GsoR9dw
         +tnri5Zs7BibRRxo8HueQKRIUw/MTH8C0GTgcOlKiHTqJa4TjNvpIWmZCQY7+KQMzF2k
         B8mLV82ojc4aV37cDfOy9ce0SOk405D2iYzmhCqRJFJVUgOoGHHxj6M1uu0URHqYDnet
         fKm1TWVEqtXEcioO5phbigs5s+KDgSqxK2IeGUZADjvflGm655+yUPV6BbSgCoP3NR3v
         GweCXmUBudehm5carlH2Xg0IWBchb6VPU0HxHfcLL1PQU8/8vIWdraD21sY/sSoewtgN
         WNGg==
X-Forwarded-Encrypted: i=1; AKwUvBxRFBK7CH1B7wWL3UMsK/enIM3UEG7rm9L6eSgyUbevBI7ENejMzQJcvCPuKzGQxUIpyYgEBDN84Jw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjXuHIwQmAtwxu2kNbUqri2m8FGwmB0H7ZRmy+rbXJhHYhbA0u
	l38QgjBhcgMB2RyhLUOiXmms1TmJ0knQ3/vaEAofp+nMFjqwY4RHqPfW+ldbgl/jyFHXDEFz4zM
	quTzAkDp21/idS6zocQzuhtJmqrxU6/cF3aoitvm6VLZz49euLJZAjSRL0seLsig=
X-Gm-Gg: AYBFou3NrO9I/61vTnOVjijNLiWDYP7/W14fB1d0/x7iAFTrFNSl7bUzBB55SDHf1J7
	IUD7u/vpNwfNFCb6Ab3beQXPktelwJriVJb4+bfb6tZjTsbN+qPqAnww92oPBh4p3/YFwOF8j+X
	6MEkgEmZEIfEciNoQVy/YdEt9AaG3K/7XlumeFNatpW69wI63aBT4YLyGm5lZC7b5FtKAiKX8Y0
	Luoq8RHiLXRG8IK5941dG/gQOWyGQW+rEZY82/SkdgZNQG5H2qvudx/8ilOx8mgDoor+sGneYGq
	dG8+zNmXJfEXbbaDTG3I/zZJyyycbppankzgZUPbT899IOsgGzsKxBiWb8mmu8Zak8nrHYzs01b
	jr47L/vqbRGBapGvztBO/AKAyWa59Q9gM05tSP0EQk06pPaVumfNHWWDYw0shRCWXu+IHsoD/z3
	tLurn0Ot/5aGqt
X-Received: by 2002:a05:620a:628e:b0:93c:8544:6adc with SMTP id af79cd13be357-93ebd224887mr2590640885a.18.1792021896046;
        Wed, 14 Oct 2026 16:51:36 -0700 (PDT)
X-Received: by 2002:a05:620a:628e:b0:93c:8544:6adc with SMTP id af79cd13be357-93ebd224887mr2590638485a.18.1792021895674;
        Wed, 14 Oct 2026 16:51:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3aafded5414sm2285281fa.16.2026.10.14.16.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:51:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 02:51:15 +0300
Subject: [PATCH v3 3/5] dt-bindings: arm: qcom: add Qualcomm SDM845 HDK
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sdm845-hdk-v3-3-1c179cd0d16f@oss.qualcomm.com>
References: <20261015-sdm845-hdk-v3-0-1c179cd0d16f@oss.qualcomm.com>
In-Reply-To: <20261015-sdm845-hdk-v3-0-1c179cd0d16f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=843;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BF6415btVpAVudmuKDsPZH7SQiNfH+6JB5g0CaPUoN0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0BV5IzDMXa9K9W+5qSi3hDHbsp6MOA/nhD+mf
 UCqX+ni6SCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatAVeQAKCRCLPIo+Aiko
 1ehvB/9caRFwuQem+RxOWHYn2bSAIPtNo2Qe8PRfp6DGf8AMCcKm8wxrUxK/TO4QPxeYuQ9jn1l
 zOARZ/3OChDaR9qF2/YP+TP14iGxZ8x4S8OIVnAZhqbCccm1jTo+t0sykYmsl45ZtsMOf5YpTQC
 tAfaeAdVGelTbxbnOlsip2kzhiAO5zDWDJYP6X4D7EnTmT3C9RAudDNIIxnWER0yJceCRIYSZ7u
 Xfsq9bxDkrfP3NzzU+d8Kc8b0KlLA19fsXVH+dodWqbqOjYgz4ZnVRnyGKro6qxpbGRBPMIArYW
 Bsqn/95e57n54cUj299X7JYm+zoTBAeorgb2jWADT32k4KzI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NSBTYWx0ZWRfX8iHoio7v+jqk
 ALcua3ToLSaOJTdyxJUWq3u4oQ0eMYjDhgvmA5+MSUG3EVvdk99v9/ccPULgz2KyCmGrx/N6EiS
 29R7MR5DbIfSYaylgzq2G3hLrQdD6PU=
X-Proofpoint-ORIG-GUID: fYsgbYkTy08si5WJDBWxhAl5fZogmQlW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NSBTYWx0ZWRfX3osBL0vtQ2n7
 hi0Wl9PLIH7wL8WziTVhfUMzZESz0jHmGH0v8xlR4uPHBm1Fw8MjCUz0s7ud9y99gAhSMBW8tin
 vxA6sLGLUddayXx8pa2WQnBATunhtbZBppRiZC2nYcH6qzOStP7i0hTNoaZdAUaB8OYvuhiSH9t
 QyXSR9QKO5M+mBGdLZHPDG/MwhldN797HEY3CxYHsyifnv6DOD9T5HI1YIeBrS1OMMi8IVZMqfE
 d09LcwKvjLZSj4WTrEyv2duJfq0zFcznBBlWSFQMlMTLzYmDIXV6jXxB12U0gUGPMJfuDxVjI/R
 yGozBUal27exduBqVOuOKvl8WFNNN3IGyiJWuOE7DLUYMs3Tniy99qrN/CwknEc8DTKIgtnUcmu
 osXoDeGmU7RnyiYcEdvZWuZsXK8nZblAm37aDf3r4Ao2C2doeVZzre7HPQjIzE9196Ow5+OB6sg
 6cKwy+oBLyQ9PIT0/kg==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad01588 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=9nMZPvWkDyzw5AdY2PIA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: fYsgbYkTy08si5WJDBWxhAl5fZogmQlW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140095

Document the mobile HDK for the Qualcomm SDM845 platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..dec58f8818df 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1003,6 +1003,7 @@ properties:
               - lg,judyp
               - oneplus,enchilada
               - oneplus,fajita
+              - qcom,sdm845-hdk
               - qcom,sdm845-mtp
               - shift,axolotl
               - samsung,starqltechn

-- 
2.47.3

