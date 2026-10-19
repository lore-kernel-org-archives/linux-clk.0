Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A274AEBF9
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 09:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401505; cv=none; b=W0gxvNrus6dpvuVjKUwl+USgVa7r7Nt4NET+r/tjQDna7edvLgrgx8hwgwX7Wn9KA7HA6eiSQIRs3+rIIpQElqEyURTALlPgfmPiuassGjQREP9RjYJH9LF7IQKA+0VmrAEF7zMvkFrlAJmc3MYXLFEk07GVhAxxN1wVNKzepmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401505; c=relaxed/simple;
	bh=BF6415btVpAVudmuKDsPZH7SQiNfH+6JB5g0CaPUoN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ivMUPHYao7J93RbWsncjFcTY7LZDBmnWFN93l/25ow2UhFSC8kSsMT5m1RM1eF7yE9jTS1a/73NWsnX/V5b0iMkDYvhTX4Jw/QXLBEVzTD1JKmR3iJhzyxfZ5Iy4ntbaDOf+KKjuVMaNisuPl3FPmgyMir/i2++PytDMmQqxLu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OVSly8hw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S46hWdkt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OVSly8hw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S46hWdkt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8PAm61896752
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 09:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=; b=OVSly8hwaoQ6Usmk
	+W1+TmqWW2KtP2JewCKwM5qvVICbxi/S8etKxnivLsmdnTKs42fg5WmO8lkSCuyz
	4aLeZzfMoSrG826PCBYC5BDYHR5ddAU/ZAFIX6WPbXXyK8ataVsoYCu+G5DzMEIn
	ECnp7c0tXZszwfa6icOhnplbo6xgWxziAucBfo4wmif3Xb+l1mArJ7riFaDNzxIc
	pZTRNWwKshTBzRBLd5Fs1l/yhZ/mxVKCHZq4uwmPwMOlwlME5Oe4UC/wzPMth02S
	naxza1DTyvuk5ecb+U9AADl4t7BvM4fxjBLfRDpN1a0TzNDhHcqG3KSX97tAp1Jl
	CvGceg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdbvr953q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 09:18:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f32050e72so527994985a.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 02:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792401501; x=1793006301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=;
        b=S46hWdktnZrG/PllBhkq6rr7eX+gR9ymkgxojzlxp+xedCvjZq9u+LQJFN5FEDsq75
         zlgq26bmhLkMlSPsqCaVdXJ4iwRpQ49IWGzUUyh5eUslqQA/Lav933JE9NZTkKE4em60
         OF7poXZ45H2LJn8XRVjddjGx7/h+wPDYFv6YNWRctKna4bJ3HrWFEkdKdv/TNwsbcYGg
         RQwGI0K1QncVE2shFL/EMeD1YNI4Q0ruRCiIqkw6YZUXUwSKdTQcZ0A4NDS9h5OkybQf
         WbMVurFYtl8XytIf2qXLtDyDnGRLWIeYnZvoQowp4U4DLrAP7Ig9TDTqT/r15tUnKjS5
         urCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401501; x=1793006301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=;
        b=CKYw1tbHRVSsPGp0+cnHdWjyJSiTrT0pj1ltlo0FF2eHoPHw28S3rD0zb7qCbYCozX
         D87Ooft0g2oHWzNDxhz3nj5/RA7X1SYKAap/OlVPmPzXzttBQeUzOg4JVu5tyt6lCEkc
         9tWOmtbxWqIl/c8eT5g8yo9CZhW4z6UUvjqYvt+amrpBFlobEeZm+kYsYYuUenLqGBf6
         5ZtRUeBQqdWY5aSOd8wOf8dSe3lw36wKJlkW0ypTYC6BkEzJQe7QKH7+gmIMq6H4/cE2
         Bje1NYX99p0Zj422kunqWJ9qwJAJoy0CbL9cRl+XPRMt5X1QKu+i+pbvbUlqwKIkfs29
         xSDw==
X-Forwarded-Encrypted: i=1; AKwUvBy63uD7tgLl1M3OzDT0Ai2qWObGpvLBihfdilfTKz1qPtYBNzXBw4N6xpDYNPISi+Mf1r1aOdCosrY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzI6/SyJTzQQdg4vUrNEAfHItEVEeobVkh9PfqVtFejIW03wQf
	vFQ8LdPKTdS82Bs+S++VpzO7Rdp3rG8VQQ5WKIeSnkvCUv+iLZji5SgLYyH2lTkfiQ65c+wnzyF
	vGOlMgL99lj91G4gOyReT/5TTqYE8FotCbhYq9vNJZansGjjfOtaKvoc994ZPlgE=
X-Gm-Gg: AYBFou06l2CNzuhYMsA4OewwnNVT4YaRLNsn/W2pdVzK1gD4cc35sVOyw2BSqojmatY
	e3LCxBDN7oe8H5bA+4jwva1plrrG7wzvUubVYpCOjm4uvos1pjEcIwluSYsueBHUWyRhjT5bDLa
	bfS4zJ8fnlYaPMzYsa9ZrbKoRTdVhwNcKM7ouMYHr+p7X5K8Q9e1J95ODTRNk9vnvtAPL3fAmg9
	H6Sd56Tg/3DfqBf70r0PKG0tDzo3EOOgaqyQ8f2oGHllqFaARxfULxPl7cemin+tefIQJ4iyYrZ
	YEv+aMppSGb/As68y/Y4KV8QHgupisL/GPLZXTuCfEFBAK4LX73CRXDksi8x5IpTN946Xnp8dhQ
	NICHQTDXgtuUDqGUHtkZ7xaAIuBiND5HOT0+5QkliK73uukgaLJLSgtR5CmenO8/odMjqXyG5Fb
	EbFoUYtXXFBC03
X-Received: by 2002:a05:620a:a0d8:10b0:93f:2ab9:7294 with SMTP id af79cd13be357-93f2ab978a0mr752274885a.29.1792401501051;
        Mon, 19 Oct 2026 02:18:21 -0700 (PDT)
X-Received: by 2002:a05:620a:a0d8:10b0:93f:2ab9:7294 with SMTP id af79cd13be357-93f2ab978a0mr752272085a.29.1792401500588;
        Mon, 19 Oct 2026 02:18:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab2e4e05c2sm15893441fa.25.2026.10.19.02.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:18:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:18:05 +0300
Subject: [PATCH v5 3/5] dt-bindings: arm: qcom: add Qualcomm SDM845 HDK
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-sdm845-hdk-v5-3-4aa7e22cd0ed@oss.qualcomm.com>
References: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
In-Reply-To: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1eBQFMOLG9PQ36ITEssszgQVT12P+KtvGzFFK
 NbVV244DieJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatXgUAAKCRCLPIo+Aiko
 1bQtB/4l4qocq2Fo6r7FjoNyp/oDBsptgFXXkJhqJQwPL1HbgxdeG9aUp3rqEcod2MAB8EW/mV1
 tqlZ/YJULnMcyyIXxoyBQwNQo9BKHVh/1iQlBqhau5BwFUam5j6ynUdo1HUeVm8hOUhpQq0XYIu
 Gckeqp+LLXJAUa8WoVTXNKjFkvJCB7ZD8//mvvyTmcoCpD5Yv+ugd/Ja6JzKRaxBBE9tBZPVBYm
 wQoi3W6CG9lKpoXm/m8kyjvct2N39YhIF3qajF6m+rSK6imLKP6goxozOvVOwfARfUSpKe7X8XD
 xN6CIS/jxKiQ/gQerGFRFGgtHBJnh9dHnbbvvBt0q+kww5oX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX64ThgIjPxpYA
 lEJUy3Ba8+NnpNxSNMLo9ykLWGBAwXIQOLJ+fQBEnDOUMGcnZ8+RbQEjL7cxiAlsdz7OMg8eCis
 d9vK9NZJdB0EOLECA8yeQH3Ut3QinkbvUIVnfTIGTVsghPLQr8JnzLQh7QTASYcPnGhaAahuQFI
 dPligQFgayMZ6EY/VhSH5ZnUPKgw7FoXyHHvRXWvKdTod09yrnTMInr0jTA0/8N4Q2vxsjzM2B7
 WlWV9gDi6SbeGejfbU7jLJUrUAzC1Qol7bZ7accEsGFuaJSjoe+SWWoflMkMzCMPt3/dL/9onmK
 cN8x/oJZj97da6q2AgpD2Hs1Ubnsl2URlAbqyIZG3Lfb1jUHL2WL9RYP9mjFfwOdVeLDUC1ioKb
 oZFlnmgcRL8Tuj2zKXOvwbps9bYDSZLrJ1scccD3nb06r8x9ZDxCF3go3dDXEsP/pdveCdzYF/a
 H0VRQ/5R8baVFPIuuWg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX6BR+IqXD546q
 /gM20YmfnSbghry6uxsFVT3XUWjf8zX65u/CbZimtel4z8ouab/0oW0SwFmZra1EzGfar5rJikI
 PSwbPuIZ9OtTFfDTOCdcJ3ve2FKujaE=
X-Proofpoint-GUID: wAD0m9y9e4cTRQFjhlyvrBtv9766_luj
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad5e05d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=9nMZPvWkDyzw5AdY2PIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: wAD0m9y9e4cTRQFjhlyvrBtv9766_luj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190036

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

