Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF6D55D875
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 16:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994792; cv=none; b=LR3yUKVw+TLxoAS59J+CKPD4F5dMG0UIr0cgjcdhwAM2KsyRU7R+7rZ2HFa1ifA1p58Qzk4mwJRI77cXz33l7oUTu7i5mI8Cj5S/YsPPTuG9jrJegeVv/HYLRIN4hXhoqicvLyYkqhhhFq1Q5lBUaivL+BHgBo7szfKb3NyeHdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994792; c=relaxed/simple;
	bh=BF6415btVpAVudmuKDsPZH7SQiNfH+6JB5g0CaPUoN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YaMnixD+vFU7Ev5uLzH6OgaoznnhhSdvP/v16QEB4/Df2eidcqf7I2actc3WY7jQsW5Ve7rxj8GcpJwu0QYONzPwI6ztIJ06nbkEsRA+a2GWSlevwr/CNin7um/oJFARcD8wGCUhIJpvjvNd1yq/QPpxkNXZr5Rip8vAytlFsHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZyOJRqI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grK5mhDs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZyOJRqI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grK5mhDs"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbHas467703
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 16:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=; b=ZZyOJRqIYjFAd7S9
	dr/0WglLBWaRAH8j+8R5jKtyzsdd0bstAetyP4LOuG/xgaQ9mbi1VhfZdf2+tYET
	HUjHSOFOkMD+09dIX2ftCeM3clRebEU5t0FB81gFpOk9XnaFIy7T9tMobUT4aXqO
	1lvHtuix28sn6JEUKinpqGdjr3vjQZxHJsQXG4XrEgv0YvJG9m57BpmpgIDIPn/5
	PW6TtUdR7Jlewbdy21yz7Y7R4jz7n3esc2iLQEJsh5o4maLwrwHrA36GMNVhNzi6
	1jrK1bZOYyk54T05VpIv1C1wxUKOLn8EnmetzChmL6VZX5rRSFyFzhWsHseBFdXy
	UmOnjQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphkf54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 16:19:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a082c014aso277574885a.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 09:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791994785; x=1792599585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=;
        b=grK5mhDslRh8w+R8Mwp4NvPrcmUdc7BUxJeD1lv4SxhUUmB8V8QLiBvsRbEO+GkoD0
         tGDilTNcuMp7laiN7CsSEu/SwluI3NjjSXq/7qg0Xn6FY1zivMQDyJmnenMUVXspIE1s
         6cS+JwGYHT0GYfRhNNLcz9iCdRcl14DW356X1XGBFFXk+CaeD5aONmIx2ulBOEG+DfxR
         25TeM+WgbsVe+NrVhbluqEZahbyrDs50ciWGZqZiRPBLaPDkPTHandKwOLR+QanqqQda
         HoqRLp2WKUCkE7+t+MMPMxzBrlxhcsKozDrg6qEel7bz83+zFy1EqC7s6mrG0/zRhhLI
         0v5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994785; x=1792599585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=;
        b=enTIKtWafYKOGAWXQZgF0MPotCPO/EW4VIAgYegDUTqUhAVz+FFsevLNhlQdl1h1Nz
         SV1j3Csxk4+Vrip5UD8Y7AezTPq3XgLX0yRveMjGePEmQPPXMfD3vsdAFNN7uVVdm1sM
         FXjuE2QgY16MNHwqYTY/RTAEZF+myNBY98gPsyG6KIYWPlm1dY9nlchwB5pJL3w/zmgA
         ZJ9y7YQbMB0uE1BEObcOZTif8SoLWlEdJWCrGPCYZ3FgzuBdU1ks9nusHyaqdXUgLnan
         jheUoLY1utbXyo1AsigX/F+k1IZ1//OLFnwCTcxkWF9i4QWQUtIa8vMngkuUeF1eCXdR
         lpQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWaJvZSsll1qjy8wwdyvHjNdaVs45aYcsm702++qOUDbIdjxPEJZeuLY3WvteEFFJtrB904qBAk7Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9uB+6TQpLG3460pvv7ZDDwGCUbk75XNmaxh5pTjv2xzntWAUX
	aLarQYXXH1m9xjxgjshjItLPiXGc+q0VQwmFc++waByAm7MRDO80DnuReuXBaOHq23l8EDpBTTv
	NSklrK/McPPFfm6kC0h4WIhBNfMDv9xonkp8BabcgCgsLQOkJPW2RREqCOF1AnQ8=
X-Gm-Gg: AYBFou0/yaCjl/Yz5h6XfUV/x/D1jr4KbwUO8tAJcjfmTMOV4bPRsMzSGZp9mhqaE93
	C5dzj6HRpGCwri2U09Aej2xdxuMyl/5f7qbkb2a53v24ntkIGbYrdAZ8KSEKqFp47bH+keheAsi
	mbxLco0DX38YunpBG8ds4W4UxgxlDxT2gD6gHHdENdL1yG6KJHNqugU75vhW0rSxtiOJN+kau5j
	c2qRolTPIyuZps4qfZbLXBHiJPSX7MnbRqUys8xsRF2tMMla4ghkw8GLFPI6b+Cnpz4rChuP1Bs
	TMuscjjU0qgKnTDXsNk2AoKbfeaTI/O9Qbq4NX2udv/yGcc04nXAYmCHxne80WBAQUI4U5aeAdU
	iUclAfQeaaTSZGxmktqHhyGFjPk1EpYfLB+UHBKKmN6hcR18KdaFjv5V9NgbbjBIwDoztKZ1DGb
	XHXttRAzVw4GqQ
X-Received: by 2002:a05:620a:4010:b0:93e:e1f9:4c2e with SMTP id af79cd13be357-93ee1f94f88mr1408416485a.5.1791994784851;
        Wed, 14 Oct 2026 09:19:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4010:b0:93e:e1f9:4c2e with SMTP id af79cd13be357-93ee1f94f88mr1408413885a.5.1791994784400;
        Wed, 14 Oct 2026 09:19:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d7d0f6sm740187e87.38.2026.10.14.09.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:19:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 19:19:18 +0300
Subject: [PATCH v2 3/5] dt-bindings: arm: qcom: add Qualcomm SDM845 HDK
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-sdm845-hdk-v2-3-6d0b4b42f267@oss.qualcomm.com>
References: <20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com>
In-Reply-To: <20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqz6uHJJ7m6faoZhSn2B4QgkaU3xA4uixppdDOo
 qz9u9klJLOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCas+rhwAKCRCLPIo+Aiko
 1TX4B/9Zj+v7JOjDrwahfYekeT1LMY5X+HCPT314urp97pY7q1yWMbNC8QLpJv5rirx7PMkd0cw
 w5HlO9Ujt4PvUxWm1x1TpEZuRwsz7s/RfKP7/Ckoi6CrfSgMn12t3o5OmPi2XUhRLHlaDM5p+el
 EBClZ0ZMOIGO/N4aXP/hIJEAX2YXX+pkXWGU9gE5lU0H1oV8QgxWKuBwETEUSRJKubpkQbSst8+
 g+mHxx2pnPgRqVvVCMjqXwwsT5HjM6QNQ8hVpHxdWLV7+QEH8QKU6+Lix8zmBEq6MtmKUrX9Vou
 1Sk7e/bhS+l2qvWOZu1nMEmfUMR0GoUPMtTS98n2LHeY/i8O
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: b4xFG01ue72XXFphoUn7WdHHW6nbZFM5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfX9utK361RRvo9
 X3bxbR/BkfBQoXyvsSgm1+d2S5SldvJAANRoyLx2yyS1QkxyJoq4zYUFrSEviygJmNV4DFJONb1
 ZUpM5ahcDXt6nu2ciSBTQbrzCTHWWF0=
X-Proofpoint-ORIG-GUID: b4xFG01ue72XXFphoUn7WdHHW6nbZFM5
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acfaba1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=9nMZPvWkDyzw5AdY2PIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfX4PA/896BNAJE
 /twOz8Z56f04fjX9gQCw2Ki69J1qwzbmJp30CZL17qhsBdZ4HNiKHyMup2WpvnyGWqYuyHAH6/H
 6Oc+IMMPl+71MutE/yRAe7bmjZe63VQy4Hhga8WEehrL79GOUOL6yIgmnLDWq9xSsRcgHpawjK/
 38WDIn6A0JBcbATtE7nHhdmuSVVHoBdAfZIAXM5H+DiZswMLpIYnX9zjFBi8GgSftkfYRt9yfU3
 P6uITdUhjELligHlb8RL6YyLRp5Bcf/81GTr7GupM1UtnPxMVsFku+rT0vfHva9FPkO57WSlZwa
 1ajE6R2DpOsZtJzXLDhbCProrsKc1cXz7eiIHCeT4/w9Hn995joRKujftzPrxaOC0KHfgAJrpHE
 oXfWFwJLHfzFuvr2MRF3bsc5mhmbMfFQBryH6Z3cI8dOvcSfh0qGnjkB36+YBXmr79SmHpwwEac
 0cJkguwkuOPZZnLDJuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140064

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

