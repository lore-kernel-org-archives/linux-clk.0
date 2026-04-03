Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603063B4EA9
	for <linux-clk@vger.kernel.org>; Fri,  3 Apr 2026 14:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775225483; cv=none; b=fIKhBttAbCOr/TBfseneIZ0vCUDZl4n3JbxIkHsiGqbywKJ8+zr9+k3bxAOZvROKiKHAsry+OBMchcICurbdevc0W2AuGwoFP9s+LxrME7YdO4NIsx+F8RCgRr1i62H0OpTVdXQQHIpRjSvyr8ND/oirO2+mBdg/hbLdLlYVS68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775225483; c=relaxed/simple;
	bh=8maw/fT027cS6ut1qfM0lsSbHc5qNfPqtdXoI+E29ws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gqAJDb6bebK6IgqTl3/R0qY4N1LVnLYu5eZdHNatcfFT9h55UsbHnCjSAb54qrBkQFxL20RE6QVF73MMb69aecCEzndsnismVAdBTrROloiArnG1Iw/6HEkBnhFsAEaHB64AMfpwTc0EvHgHz6p4bkEYbV4fJqF2HsshRKoRE2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jnkaYIEI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M52m5a46; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jnkaYIEI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M52m5a46"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6336EMfZ140000
	for <linux-clk@vger.kernel.org>; Fri, 3 Apr 2026 14:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RtrpVGaG/qb5UuHyLBRD0j7N4RxW1mJWpsqy1LkkOFc=; b=jnkaYIEIYrka/5FR
	t2FkELDxuyM+POozKlqfLxDYzoxLzDd8B6gJrFnn0vsZztR6eFyffwwC0KaEI25S
	eE/SC5p/EAsqLDXbfcXafbxnc1mzY4ftohEhcJmhJyNEs2QMViv4JMGysvgqDExT
	rQE1/SGdyOfHeB2mGC1eZttffd0U/3WJqzUYndEPogbCYSlQLOrZqObDRCMrtsby
	naa9wieNvrhyWL/OdyXvOSnB/o5MJcIsJ5Nra1pmnwmO9/Tfd22iGNvmV0A9P2h8
	qCx6siUoZn+DbmoFuobLsHzaJhoQ5OX0/Odhb+xP0Uw88/ULVQfS8/xqTiwuZcmA
	/6UwhA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y19uf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 14:11:21 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94e4b6c8cd5so668849241.2
        for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 07:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775225481; x=1775830281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RtrpVGaG/qb5UuHyLBRD0j7N4RxW1mJWpsqy1LkkOFc=;
        b=M52m5a46JDSZ2xVJhxDz3ee3OmkGGXKf5sgziwWSXuaPgeMQoK0OvPmbknXYszIgha
         QnYgi76OYqLMcJsRtkbaxNM6wq9clJ5YbUqEYTd1HiokOa/r3TYyHLaoD/9IUA7Vnb/Q
         ekao7OocdrcrpYW34t80Z0De6qGQZ7j72VRshMfFN8XyZrZEggZJpMhX8fiHUv7UIQ+p
         z2/+mCuWnQSp0hh+VwTj7bTFSUFZe/7gItBv9HFR0BupovXABQZdRBSHwcmXC6WSFJt2
         K1hKQghMWUmRIcZXTtWYua8Ybpf1IioBwsuoC5Jg7qJzRjXGLMMb88//7yUs6GmLm5Nu
         t41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775225481; x=1775830281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RtrpVGaG/qb5UuHyLBRD0j7N4RxW1mJWpsqy1LkkOFc=;
        b=Tr6XDJbdyIl8Dqdcmc310UkutypjsbS4X+qr6brAstv6sK14+HV2sL4RW6ROlthZEY
         g4h8k2b7aprW3s/BJdSUVz+QpIm6icfWJa1rumC+42/4kML5Jfa+2mfPGqShc1ty11NL
         B5bhMSMr8yXv9DhEnZCZd+5s0igAJFLF4XEn8Vo4lw0unbFZKwdifrPlN9s9mUiF+uTS
         blFI9WxGhhB+dKuCCoOvAgD2bOcwsTQayjnBZLJSU0VbFjsNMhSvxCpbsbN7V+eWyOZi
         kRnpJJi2dom3ljO+SIJo6m9yWMnxlYfdtxWd5ytgpigMIVqv9YeAYKr4xXEZv+BP/zt8
         6hMA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ4b0IYTL8LNghM2/gXZmQW0xFZgOkViVUbZx7c+DkHj5XCEcrpRLorSwC9dvU3IpAhLn91Vrc2Aw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDC/Nc6T7UaY9QT0ncIaP3rX8+lNCYGbfuYHfBCIZi3NwKFZkT
	3hpzdbdRlEimKOKWbsfWA/ouA6Jx72FYu+eBh7EtljLQYbzgAx9GMhBW8PbrorG+iYqdSfXdOsh
	BkYz5ACngl0Ll1HD8l6vX8WFyVvJp8qgHH9MjuxS7SgMkwdhjBWOBlTBQgc3JxsA=
X-Gm-Gg: AeBDiesCX+j1EdEIH7esmKunmilq0n7JMhwcP+TznmjWN4qyroI8vE+GQoGBtBolG8a
	T4FHAg6mN+dikcu5/Z7jHcOcfrIEypNwIBDLNKxTcPnBRbXykhpoL6eHpPwnTeWEmf0G11IufCQ
	MAnSqVN9dxWVFQVWx+CwoSXXzhZIsd6FDUcmApjemeIbbdjUgPCdA3G7crKOyl2iFWMoVWIb6IC
	JUupIWzSrSrwUmYqab5uNaxJ+8f8JuIu5YJ8CsyJ/WI/7/j6rpPMpAm/oCONQWZ9jt0aaQ/WMu/
	7ZQ/kTbwhIvRIZrYJpGbtxYP16n+H+g1i4nPYuCMbl6LxYwDldRm2k8YPctfMVF8nI193iXRHWB
	IdzLxJxISid9EvNWARLKQdZRquJLZ4FB8qJUMfIgjhT+2FUVCaLA=
X-Received: by 2002:a05:6102:808e:b0:5f5:3638:776f with SMTP id ada2fe7eead31-605a50fcd2fmr912869137.25.1775225480734;
        Fri, 03 Apr 2026 07:11:20 -0700 (PDT)
X-Received: by 2002:a05:6102:808e:b0:5f5:3638:776f with SMTP id ada2fe7eead31-605a50fcd2fmr912852137.25.1775225480293;
        Fri, 03 Apr 2026 07:11:20 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d1b19esm30127315e9.6.2026.04.03.07.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:11:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 16:10:50 +0200
Subject: [PATCH 2/7] dt-bindings: clock: qcom-rpmhcc: Add support for Nord
 SoCs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-nord-clks-v1-2-018af14979fd@oss.qualcomm.com>
References: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
In-Reply-To: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=949;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=E590LE2bCnYKbTU4d7bl5dBbInnMd8BSX7Wam2pIke0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz8p72uFD24m82FANm6XZZZegbUNOEe/0YrDvs
 VhKjb4cY1mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac/KewAKCRAFnS7L/zaE
 w0VVD/9GDKhPhvnhDiq3vo3PXj3epOUdglhyQWXlujODHh/+pIVGYPujuhEdW3D41FmFs0duqaN
 8Ir/3CuvjbcKPXL4YzN+F5HL1KwIo0N+EtXxPhlTH0T1Ycoz1D1ZgGcYwn8c5Rlj1nWecAGQZLG
 CpMU7ZG7OKuoYwYrkZYM+4qEB3+JhnaKgud4ad3q43XKjVlCDu2zcu2bcmiWVOiXuZNVam6Hgrb
 ZOyDKRGtSDDudoH8Uiz8BFsk/CyKeI1h7GIh4WV44Qrz9ei7UMvDAc9TJxne3pnM6S9zAcvzMbg
 PdidAbqvXjk7hC9i3wDm7I786kDFTWPIbpMbuFlhybCJ9u/a2fOi3tRoNbQm3JnWYroe9JWtabr
 jzf+24Lw/wOEddPDCbw57TIm1mn8sPaqG5wqzJmFHU4nMr3pAaObXyS/fhWQ+SAyP14r7EVGiGA
 L944olxkv2RYQSn/FltrAufcIgHzHtxO2Z10epXxGWu730DLsGBGzEZUOSNzKTmK1QqX7Ew1tIc
 V+8GbeiYwNcfcaT70Jqv4huK2watI2UC+gwpUzgZYXZwt5HX83SbLFcnCAsUlqgZ6vUBlC7OTBB
 Sys4/lmU/U/bV6bXuVXvFWt9Yto5/oUHt4jpOABPAOOhnDPEuHaT8eiQvyId6rbJpXTjPOX6IYd
 AZnFqbL9EPRHkng==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69cfca89 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=fWd7RFOGuVLGcsxqf9cA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: qaoeNyBwUuFEZQn9MIZC969uN2_6XBSQ
X-Proofpoint-GUID: qaoeNyBwUuFEZQn9MIZC969uN2_6XBSQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEyNiBTYWx0ZWRfX8XJl1/FuJzdl
 ZGaKsdngsSoMhBm29caBDuJEVtqj010L3p5wbc9yN/+aMcMaGIXCRnKeC23JPvldvbGwZRa+44b
 2ljuf/pWBPi2LypGIfcPOtf5Oar1mrxsruqasX47pE+hrZnjNp57dnNao7OpNUqKcF8I36zG5rt
 MdpkzynRvo0FI9+xHP8KLN47hqeRDPFqQwbdBZo2g/eMfO49hknzyX+MVyqYbx+tPow7Dvf4dDT
 HsjnHmcZg86GM0bwc90Iv6LwfLmQ9Pw3HcrDPezNxgjCEAent9hpjq29ZkBj5rb4m1AsL+9Q6CZ
 TDWtIm97wRHPLHfRJz3d4ttAjeAnmmuWcn2Y893GpovK1zeR1eBUSwAtf9u64aqSvSTo8l8fngW
 DAzgMNFAH+YvMy++UJzym7gpP1pnqAK6TP734qSrYN0XIHKsmTlMBQZBmMGDx2SsMxyhib6atEJ
 bdz3KllJQP+RERSVh2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030126

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add bindings and update documentation compatible for RPMh clock
controller on Nord SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 9690169baa4697bbd3ab9197f9661368a0827bf7..a2c404a579812dae073241ea71b63e55e798e80e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -21,6 +21,7 @@ properties:
       - qcom,glymur-rpmh-clk
       - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk
+      - qcom,nord-rpmh-clk
       - qcom,qcs615-rpmh-clk
       - qcom,qdu1000-rpmh-clk
       - qcom,sa8775p-rpmh-clk

-- 
2.47.3

