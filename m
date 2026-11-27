Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779703;
	b=EOwrsbF20VQwNGtPf9i0ocd0IwJVqjV0RC8N4OrtlEbXK5mYO0EWb1kE6lzMBEzdsp9I
	 IWC4qFAqxCMloWqwCzT1fgdQ6w4h7O9yD83wD+Rx+Pc1E2ECU5yzgcyRx4UToyPjtLc05
	 2fXPLzdzfXeMQjh3mtfXY0U1FnAumlcYw8YYBZCWgtc8QAH9SGSr5KcPSDH/vHKt6gWUm
	 5lhkp0GtaiPyq2R6oS6iB1zePYrIiMdY2vuE+0RQP3S6ZitSZAPGiwMdxFUUcx+dM9IDt
	 w1nbkq/laEw/qyukUAewjahRCRAkbdQ7dsb7PDEXW7ppNGiAFgA5VIgKoW7blB66X7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779703;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=t/0sAMHm5hzJzfzL3yAvXJE+pqL2ZqGQoviF0lQzY9A=;
	b=25zSuq1nMnbbj9EeJDo5756m+gXNXu+XLfUcO7ARbVqAqdxajZ1Vesp9iEL4WLkD6NDt
	 V+JtwAoT3VyDJf2LpGwYLMg7GL8E4nUGivNZoY0Vu+85VwmEuMLy3AAAJk1W3aY1EElYh
	 P9xEnqxweKHk8X/gwggmzu4CxEPa1troW9P4Ngona13cOUayg0tbvSwB86/7M93AgkjAs
	 ufXgmug9Kb86ASNNq9wVKISxM2+sZqXC94PGb6pXAkS557IkvFO0NB3/t4eNYUfqh1x+i
	 p575JxaPWaF5HlE6wvSA+RcyqPR38Mc1qtW+tuj+3bOcCMftWBtnlOHa3rRaasj404w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XrFfplsE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EcDr7FxP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CA8606A696
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 11:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53CA8606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XrFfplsE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EcDr7FxP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp80d1376851
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 11:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t/0sAMHm5hzJzfzL3yAvXJE+pqL2ZqGQoviF0lQzY9A=; b=XrFfplsELl76kbhV
	nOsuA/C0IlIimpOrHnwLGH7TeW8lDHUm4utMVOlwensDIgPoAevqfU8OSMPQlXuJ
	xwDGmQq9lvnX5ANUMmcqRimG0I/w3Spd1Ahg7n/Eo7xy2pwx7Pg7J9nNWRak66jn
	b2pcYSTnic8/KwCXZHgqZLmVzWYzXRU9U6E36hvHO45bxFQIb+Xo/3fbCkhWqqp5
	IvVOsmEzHGFlWHUhPvqfbFTtzkdUoCI9Od6QbH56BV0g480Tc5iM/tTVaxZ7JqR5
	oa5ra9W/cWWssEUeNtguu+Tc7i80l1IAuWT5hP3pUZTfiFbjG4atGKRTQePin/nN
	yOEsfQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru3abdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 11:41:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so1728871985a.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 03:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779702; x=1796384502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/0sAMHm5hzJzfzL3yAvXJE+pqL2ZqGQoviF0lQzY9A=;
        b=EcDr7FxPMfWqiqwIQWCbS6sdOmRSfuUm8y/hUPRaGdIcYmREcpmvM7AuoSL4wMWL8C
         Gm0lqGDq7Uxa6X5pGRY9RkftBd+6O4mBVF2moNQ+8jOLr1k+/JrsKhbPFoOqyUZnB9Gy
         DjsLbUTB4bIm9M9aBqOhuIdMzeDJm0kva0hPZ1JDhcosUAS1zqHb7uhEZiQ9jWp7zw/p
         gXeqCt8dIOWLZXjSeGRLB8vWlNwFdjjmE4XLU+dQhBV7p/LYE558ncmlhtg+OyiOsJIW
         llMIHf3I1IL0FGTqg95SnjUK2jCnNXwMTEjdI7VWwpiOknTuNeYaGfn3g0LisaTpK6K7
         awPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779702; x=1796384502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t/0sAMHm5hzJzfzL3yAvXJE+pqL2ZqGQoviF0lQzY9A=;
        b=gpUmOLKiFiq2f+HlOkoK3hvtIjRjpwsZXNfiGnhpZ3XaEIWLhyiLAPGxP+LKtsEqqA
         vQim7/f9CWC2+AgbC8bOpNaM+RTtXlUL8gecLKKHmCQy6SDAzM4PB3vdA4ceBqy3w1C/
         oAh2Gi0F8r8FaGns2js7Igep8T4I8SqIT4zyAoDrn63WqoazKOK2re1MgZOZYPjmVGPK
         VArttQjy6F2eTAVjdsQ45BCT8dnsf7mFfuRfFUchQmMb6S0Zud7EblpvtUoio/T+Ysxs
         7AvS5Xc2uROyvT/WeUzR9zqa+4rLuXk7fNBjD2Zx3fMb3gU66iO/8X3MborxCQPBTTFT
         Krrg==
X-Forwarded-Encrypted: i=1; AL+hErH+uQPJGXUzrPHB9xcCFE1EmEC6Z7fuMzwWK5qMoDG2cUKqDuj239TiaygQSuqdfZYP/GL86bOVzVI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5Frz92gokI/QRITd1uDS9OA14FjPE2ZCQfpe5agCsK1HRL7P4
	2Dz6uLan/tsJ5OCpP4l2TI4faHPjNPIaR+6yXGI8BTEU3iaf7El5hdzIR7A6VBGB7SMj4T3Z0VI
	iCVAVM+cY2FvKGgciDqiV+be8a0QGhZa1H+X9TAcJh/SAZ41XuVkHUf4UqtYwQEc=
X-Gm-Gg: AZFdTZecce6k+iHRqrRNoYNadZvyY3AJlU3qTzBnIw1gGl9DpdE39mckxhevH4bhxft
	5vT/m57IQzHIeuIdas166mehPr9jDtiVwzG4K7Talp3j3NFPNSwG8fvfu7MGuy1NQv5QmJmKH4n
	bW7MnRwYqkixgmpuK3qLAEAZ0jTgocYz1kyPexwYoU2Uh0RMTet235zL2deu/4CD3o7ER2/z0Wh
	8zATIRYoJB2d/xD83jBuxd8+/Oy9XCI8AhLVjxBdr1Onb2mEdnW7jyQxJRvV/NWJioGNpIwDwm9
	tv8zgFcMNeB/jvyltAqMRpUNoESAqzoTa27X9MYs5TBDDP/d1phOCYCUw37Aa/G4215JJj52OTQ
	oErpsbfgLaBtBJgaaoBwJVqntrsaC7tmoezdQV8W5edus21m/NiHaltnS7hcobYpFnlgrbtwutf
	LNM1SbSlLU5DLpOQZ0QxyWznH5m/31dMzKuvW0lnkGlk59k9z7Xv2sjaTRqbuSQ3Y=
X-Received: by 2002:a05:620a:4408:b0:949:9cf0:bae5 with SMTP id af79cd13be357-949bab3d2f2mr4353887185a.69.1795779701337;
        Fri, 27 Nov 2026 03:41:41 -0800 (PST)
X-Received: by 2002:a05:620a:4408:b0:949:9cf0:bae5 with SMTP id af79cd13be357-949bab3d2f2mr4353881785a.69.1795779700825;
        Fri, 27 Nov 2026 03:41:40 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm45137049f8f.7.2026.11.27.03.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:41:39 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:41:30 +0100
Subject: [PATCH 1/6] dt-bindings: clock: qcom: document the Seca Global
 Clock Controller
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-seca-clocks-v1-1-1781298e658b@oss.qualcomm.com>
References: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
In-Reply-To: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Tyler Baker <tyler.baker@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15351;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=p9pu2+cWFEBhVgNXgxC7s25ouqXGMaV1DiQUT8YT1/8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCWxwwdWnMTOqZ0CSfhlnSUc/E6u5ELvoGfDD8
 c0NBWmambWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawlscAAKCRAFnS7L/zaE
 wxvUEACmZGM6eeraAgD/Ru6Uy1/2pGm/8FX1cnFne6fFL8MgKBAWDRTrONxlNn4TAu4M1T8yI24
 A89GBBZSXEWPpkXD4hMDrRiyg/X+UtO1e+d5dR5y21AZSPndp3hwZGjTQ/i/0WtFU+dzIw+QSGb
 /JMHgAwzFgwmNNI3OVr71SxOhfA08UDL6+S+yRWc6Jz9ZGwE0OjRj90H0lyE5cp+kkEDq7x/7v0
 woCR+AjoFN5njpmh3hy6ggEDKfcFEK/Ftkz0gwtN+IEdynrn87vd0wDA6I29AOmVcZaTnFoo76E
 Mm2xR0GRGOJ9F6QJxBuVJn+oyr75FMOEKheZebezh3lL6pAu7Xv7e+XKHhVA8jcQs59KW0sFSIz
 UYLp1i447zsyxobMItCuddDYMPLEcuGLD3KjtNqdLDnJtVLs4x/I57sDxus0f+rHMX52hsol/P4
 4CRRpbTWpxC3td4aSz/iEWl90376UBkuTf0CsDYBYfLOKtkEH4VE96m4910DWycx1GeZ9pHsubt
 LKRDaPpScHxpB3BmBSgWMt3Uy55ekn4v24E9fZPO9+jNzVWodqctngHs7bWBmGkaCZ8h1gKevAx
 MVDywQ1QHoBeyuGmsQwFYJp4zKoIA9s+ut9Q1MnicJjLJFyhKIaQt4jeZv66V2NZkf2LZrZ2GPT
 Bgw5CXCVQF/TwmA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b096c76 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=c_Q_heGQvzKhConXP0sA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: ADkhp2E5xb5IhSjr8T-ohgTD3YfNc9bv
X-Proofpoint-ORIG-GUID: ADkhp2E5xb5IhSjr8T-ohgTD3YfNc9bv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX8n4XLAeyXSzS
 mkUVNxe2lY4st1N6Bg+8bkWLr4HgzeUFFNFJW8kkeZy/tppwGx1Z6P5Y7B+Mo1po9iYQSzQgrZr
 dql6pSADC+z6g41yvfA/ZODAFBd4EwD0wo/ZBQ2hdBaLiIEEp1uECVai+IGZ+E/gkXITYgR2GDq
 XRF0p59EEUWcbrVn4A5ZTuN6wISDy0PPehZTUUlBJgVk8QQnKoBfRA7kxj5hqDzbZa5bcXB5l/t
 JHpYChcy1FbuKpyeqK3wHU1poyPEhI6ey0A99Tj8dWCj05gyHuqJEmEUeHcxUiWzu/jgFkPESut
 DwWjwgtfubdUhZTynBVlea3DBDVOvT3HqzoVO/8xISPsoUjt06UJgeG6xkizsM2tfFj/iLgYgEX
 SfpGpqvQdEK/KoHENPCxhj9fOGABOpRNuPPmgs+ZpZxeKvJ9+yaitUJ3SAcCY/W+CKTFnkFVDl2
 /v/vahdYVi1cLVL4hug==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX24UfurYkShrC
 NLZQaBx//i/oYrBOWeXypYFF50BiDD+CG+/VAJc7sDH8Sk8ATYNl6USR9zgfVfB01WiGEIUWjQk
 uz5nMHkl/TAlI78nPDRkV9mwmTxSQ4Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

The Global Clock Controller (GCC) on Qualcomm Seca is split into the
North-East and North-West modules. Add devicetree bindings describing
the two.

Co-developed-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,seca-negcc.yaml |  61 +++++++++
 .../devicetree/bindings/clock/qcom,seca-nwgcc.yaml |  69 ++++++++++
 include/dt-bindings/clock/qcom,seca-negcc.h        |  98 ++++++++++++++
 include/dt-bindings/clock/qcom,seca-nwgcc.h        | 144 +++++++++++++++++++++
 4 files changed, 372 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,seca-negcc.yaml b/Documentation/devicetree/bindings/clock/qcom,seca-negcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b1595d7dda2b3db59a7fdfc9f6b30d56655d8836
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,seca-negcc.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,seca-negcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: North East Global Clock & Reset Controller on Qualcomm Seca SoC
+
+maintainers:
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+description: |
+  Qualcomm North East Global Clock Control (NE) module provides the clocks,
+  resets and power domains on Seca SoC.
+
+  See also: include/dt-bindings/clock/qcom,seca-negcc.h
+
+properties:
+  compatible:
+    const: qcom,seca-negcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: USB3 Phy sec wrapper pipe clock source
+      - description: USB3 Phy wrapper pipe clock source
+
+  power-domains:
+    items:
+      - description: CX power domain
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    clock-controller@8900000 {
+      compatible = "qcom,seca-negcc";
+      reg = <0x08900000 0xf4200>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&sleep_clk>,
+               <&usb3_phy_sec_pipe_clk>,
+               <&usb3_phy_pipe_clk>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,seca-nwgcc.yaml b/Documentation/devicetree/bindings/clock/qcom,seca-nwgcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d6f7096b9a4ac9071e65164daf3412b09dcf9f1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,seca-nwgcc.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,seca-nwgcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: North West Global Clock & Reset Controller on Qualcomm Seca SoC
+
+maintainers:
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+description: |
+  Qualcomm North West Global Clock Control (NW) module provides the clocks,
+  resets and power domains on Seca SoC.
+
+  See also: include/dt-bindings/clock/qcom,seca-nwgcc.h
+
+properties:
+  compatible:
+    const: qcom,seca-nwgcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: UFS 0 Phy Rx symbol 0 clock source
+      - description: UFS 0 Phy Rx symbol 1 clock source
+      - description: UFS 0 Phy Tx symbol 0 clock source
+      - description: UFS 1 Phy Rx symbol 0 clock source
+      - description: UFS 1 Phy Rx symbol 1 clock source
+      - description: UFS 1 Phy Tx symbol 0 clock source
+
+  power-domains:
+    items:
+      - description: CX power domain
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    clock-controller@8b00000 {
+      compatible = "qcom,seca-nwgcc";
+      reg = <0x08b00000 0xf4200>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&sleep_clk>,
+               <&ufs_0_phy 0>,
+               <&ufs_0_phy 1>,
+               <&ufs_0_phy 2>,
+               <&ufs_1_phy 0>,
+               <&ufs_1_phy 1>,
+               <&ufs_1_phy 2>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,seca-negcc.h b/include/dt-bindings/clock/qcom,seca-negcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..33d942c073d693b86ea2ee79ecb206666ac93424
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,seca-negcc.h
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_NE_GCC_SECA_H
+#define _DT_BINDINGS_CLK_QCOM_NE_GCC_SECA_H
+
+/* NE_GCC clocks */
+#define NE_GCC_AGGRE_NOC_USB2_AXI_CLK				0
+#define NE_GCC_AGGRE_NOC_USB3_PRIM_AXI_CLK			1
+#define NE_GCC_AGGRE_NOC_USB3_SEC_AXI_CLK			2
+#define NE_GCC_AHB2PHY_CLK					3
+#define NE_GCC_CNOC_USB2_AXI_CLK				4
+#define NE_GCC_CNOC_USB3_PRIM_AXI_CLK				5
+#define NE_GCC_CNOC_USB3_SEC_AXI_CLK				6
+#define NE_GCC_FRQ_MEASURE_REF_CLK				7
+#define NE_GCC_GP1_CLK						8
+#define NE_GCC_GP1_CLK_SRC					9
+#define NE_GCC_GP2_CLK						10
+#define NE_GCC_GP2_CLK_SRC					11
+#define NE_GCC_GPLL0						12
+#define NE_GCC_GPLL0_OUT_EVEN					13
+#define NE_GCC_QUPV3_WRAP2_CORE_2X_CLK				14
+#define NE_GCC_QUPV3_WRAP2_CORE_CLK				15
+#define NE_GCC_QUPV3_WRAP2_M_AHB_CLK				16
+#define NE_GCC_QUPV3_WRAP2_S0_CLK				17
+#define NE_GCC_QUPV3_WRAP2_S0_CLK_SRC				18
+#define NE_GCC_QUPV3_WRAP2_S1_CLK				19
+#define NE_GCC_QUPV3_WRAP2_S1_CLK_SRC				20
+#define NE_GCC_QUPV3_WRAP2_S2_CLK				21
+#define NE_GCC_QUPV3_WRAP2_S2_CLK_SRC				22
+#define NE_GCC_QUPV3_WRAP2_S3_CLK				23
+#define NE_GCC_QUPV3_WRAP2_S3_CLK_SRC				24
+#define NE_GCC_QUPV3_WRAP2_S4_CLK				25
+#define NE_GCC_QUPV3_WRAP2_S4_CLK_SRC				26
+#define NE_GCC_QUPV3_WRAP2_S5_CLK				27
+#define NE_GCC_QUPV3_WRAP2_S5_CLK_SRC				28
+#define NE_GCC_QUPV3_WRAP2_S6_CLK				29
+#define NE_GCC_QUPV3_WRAP2_S6_CLK_SRC				30
+#define NE_GCC_QUPV3_WRAP2_S_AHB_CLK				31
+#define NE_GCC_SDCC4_APPS_CLK					32
+#define NE_GCC_SDCC4_APPS_CLK_SRC				33
+#define NE_GCC_SDCC4_AXI_CLK					34
+#define NE_GCC_USB20_MASTER_CLK					35
+#define NE_GCC_USB20_MASTER_CLK_SRC				36
+#define NE_GCC_USB20_MOCK_UTMI_CLK				37
+#define NE_GCC_USB20_MOCK_UTMI_CLK_SRC				38
+#define NE_GCC_USB20_MOCK_UTMI_POSTDIV_CLK_SRC			39
+#define NE_GCC_USB20_SLEEP_CLK					40
+#define NE_GCC_USB31_PRIM_EUD_AHB_CLK				41
+#define NE_GCC_USB31_PRIM_MASTER_CLK				42
+#define NE_GCC_USB31_PRIM_MASTER_CLK_SRC			43
+#define NE_GCC_USB31_PRIM_MOCK_UTMI_CLK				44
+#define NE_GCC_USB31_PRIM_MOCK_UTMI_CLK_SRC			45
+#define NE_GCC_USB31_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC		46
+#define NE_GCC_USB31_PRIM_SLEEP_CLK				47
+#define NE_GCC_USB31_SEC_EUD_AHB_CLK				48
+#define NE_GCC_USB31_SEC_MASTER_CLK				49
+#define NE_GCC_USB31_SEC_MASTER_CLK_SRC				50
+#define NE_GCC_USB31_SEC_MOCK_UTMI_CLK				51
+#define NE_GCC_USB31_SEC_MOCK_UTMI_CLK_SRC			52
+#define NE_GCC_USB31_SEC_MOCK_UTMI_POSTDIV_CLK_SRC		53
+#define NE_GCC_USB31_SEC_SLEEP_CLK				54
+#define NE_GCC_USB3_PRIM_PHY_AUX_CLK				55
+#define NE_GCC_USB3_PRIM_PHY_AUX_CLK_SRC			56
+#define NE_GCC_USB3_PRIM_PHY_COM_AUX_CLK			57
+#define NE_GCC_USB3_PRIM_PHY_PIPE_CLK				58
+#define NE_GCC_USB3_PRIM_PHY_PIPE_CLK_SRC			59
+#define NE_GCC_USB3_SEC_PHY_AUX_CLK				60
+#define NE_GCC_USB3_SEC_PHY_AUX_CLK_SRC				61
+#define NE_GCC_USB3_SEC_PHY_COM_AUX_CLK				62
+#define NE_GCC_USB3_SEC_PHY_PIPE_CLK				63
+#define NE_GCC_USB3_SEC_PHY_PIPE_CLK_SRC			64
+
+/* NE_GCC power domains */
+#define NE_GCC_USB20_PRIM_GDSC					0
+#define NE_GCC_USB31_PRIM_GDSC					1
+#define NE_GCC_USB31_SEC_GDSC					2
+#define NE_GCC_USB3_PHY_GDSC					3
+#define NE_GCC_USB3_SEC_PHY_GDSC				4
+
+/* NE_GCC resets */
+#define NE_GCC_QUPV3_WRAPPER_2_BCR				0
+#define NE_GCC_QUSB2PHY_PRIM_BCR				1
+#define NE_GCC_QUSB2PHY_SEC_BCR					2
+#define NE_GCC_SDCC4_BCR					3
+#define NE_GCC_USB20_PRIM_BCR					4
+#define NE_GCC_USB31_PRIM_BCR					5
+#define NE_GCC_USB31_SEC_BCR					6
+#define NE_GCC_USB3_DP_PHY_PRIM_BCR				7
+#define NE_GCC_USB3_DP_PHY_SEC_BCR				8
+#define NE_GCC_USB3_PHY_PRIM_BCR				9
+#define NE_GCC_USB3_PHY_SEC_BCR					10
+#define NE_GCC_USB3PHY_PHY_PRIM_BCR				11
+#define NE_GCC_USB3PHY_PHY_SEC_BCR				12
+
+#endif
diff --git a/include/dt-bindings/clock/qcom,seca-nwgcc.h b/include/dt-bindings/clock/qcom,seca-nwgcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..887d76dbc5093acc62e42bb0bda260a7bfa835da
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,seca-nwgcc.h
@@ -0,0 +1,144 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_NW_GCC_SECA_H
+#define _DT_BINDINGS_CLK_QCOM_NW_GCC_SECA_H
+
+/* NW_GCC clocks */
+#define NW_GCC_AGGRE_NOC_UFS_0_PHY_AXI_CLK			0
+#define NW_GCC_AGGRE_NOC_UFS_1_PHY_AXI_CLK			1
+#define NW_GCC_CAMERA_AHB_CLK					2
+#define NW_GCC_CAMERA_HF_AXI_CLK				3
+#define NW_GCC_CAMERA_SF_AXI_CLK				4
+#define NW_GCC_CAMERA_TRIG_CLK					5
+#define NW_GCC_CAMERA_XO_CLK					6
+#define NW_GCC_DISP_0_AHB_CLK					7
+#define NW_GCC_DISP_0_HF_AXI_CLK				8
+#define NW_GCC_DISP_0_TRIG_CLK					9
+#define NW_GCC_DISP_1_AHB_CLK					10
+#define NW_GCC_DISP_1_HF_AXI_CLK				11
+#define NW_GCC_DISP_1_TRIG_CLK					12
+#define NW_GCC_DPRX0_AXI_HF_CLK					13
+#define NW_GCC_DPRX0_CFG_AHB_CLK				14
+#define NW_GCC_EVA_AHB_CLK					15
+#define NW_GCC_EVA_AXI0_CLK					16
+#define NW_GCC_EVA_AXI0C_CLK					17
+#define NW_GCC_EVA_TRIG_CLK					18
+#define NW_GCC_EVA_XO_CLK					19
+#define NW_GCC_FRQ_MEASURE_REF_CLK				20
+#define NW_GCC_GP1_CLK						21
+#define NW_GCC_GP1_CLK_SRC					22
+#define NW_GCC_GP2_CLK						23
+#define NW_GCC_GP2_CLK_SRC					24
+#define NW_GCC_GPLL0						25
+#define NW_GCC_GPLL0_OUT_EVEN					26
+#define NW_GCC_GPLL3						27
+#define NW_GCC_GPU_CFG_AHB_CLK					28
+#define NW_GCC_GPU_GPLL0_CLK_SRC				29
+#define NW_GCC_GPU_GPLL0_DIV_CLK_SRC				30
+#define NW_GCC_GPU_SMMU_VOTE_CLK				31
+#define NW_GCC_MMU_1_TCU_VOTE_CLK				32
+#define NW_GCC_QUPV3_WRAP0_CORE_2X_CLK				33
+#define NW_GCC_QUPV3_WRAP0_CORE_CLK				34
+#define NW_GCC_QUPV3_WRAP0_M_AHB_CLK				35
+#define NW_GCC_QUPV3_WRAP0_S0_CLK				36
+#define NW_GCC_QUPV3_WRAP0_S0_CLK_SRC				37
+#define NW_GCC_QUPV3_WRAP0_S1_CLK				38
+#define NW_GCC_QUPV3_WRAP0_S1_CLK_SRC				39
+#define NW_GCC_QUPV3_WRAP0_S2_CLK				40
+#define NW_GCC_QUPV3_WRAP0_S2_CLK_SRC				41
+#define NW_GCC_QUPV3_WRAP0_S3_CLK				42
+#define NW_GCC_QUPV3_WRAP0_S3_CLK_SRC				43
+#define NW_GCC_QUPV3_WRAP0_S4_CLK				44
+#define NW_GCC_QUPV3_WRAP0_S4_CLK_SRC				45
+#define NW_GCC_QUPV3_WRAP0_S5_CLK				46
+#define NW_GCC_QUPV3_WRAP0_S5_CLK_SRC				47
+#define NW_GCC_QUPV3_WRAP0_S6_CLK				48
+#define NW_GCC_QUPV3_WRAP0_S6_CLK_SRC				49
+#define NW_GCC_QUPV3_WRAP0_S_AHB_CLK				50
+#define NW_GCC_QUPV3_WRAP1_CORE_2X_CLK				51
+#define NW_GCC_QUPV3_WRAP1_CORE_CLK				52
+#define NW_GCC_QUPV3_WRAP1_M_AHB_CLK				53
+#define NW_GCC_QUPV3_WRAP1_S0_CLK				54
+#define NW_GCC_QUPV3_WRAP1_S0_CLK_SRC				55
+#define NW_GCC_QUPV3_WRAP1_S1_CLK				56
+#define NW_GCC_QUPV3_WRAP1_S1_CLK_SRC				57
+#define NW_GCC_QUPV3_WRAP1_S2_CLK				58
+#define NW_GCC_QUPV3_WRAP1_S2_CLK_SRC				59
+#define NW_GCC_QUPV3_WRAP1_S3_CLK				60
+#define NW_GCC_QUPV3_WRAP1_S3_CLK_SRC				61
+#define NW_GCC_QUPV3_WRAP1_S4_CLK				62
+#define NW_GCC_QUPV3_WRAP1_S4_CLK_SRC				63
+#define NW_GCC_QUPV3_WRAP1_S5_CLK				64
+#define NW_GCC_QUPV3_WRAP1_S5_CLK_SRC				65
+#define NW_GCC_QUPV3_WRAP1_S6_CLK				66
+#define NW_GCC_QUPV3_WRAP1_S6_CLK_SRC				67
+#define NW_GCC_QUPV3_WRAP1_S_AHB_CLK				68
+#define NW_GCC_QUPV3_WRAP3_CORE_2X_CLK				69
+#define NW_GCC_QUPV3_WRAP3_CORE_CLK				70
+#define NW_GCC_QUPV3_WRAP3_M_CLK				71
+#define NW_GCC_QUPV3_WRAP3_QSPI_REF_CLK				72
+#define NW_GCC_QUPV3_WRAP3_QSPI_REF_CLK_SRC			73
+#define NW_GCC_QUPV3_WRAP3_S0_CLK				74
+#define NW_GCC_QUPV3_WRAP3_S0_CLK_SRC				75
+#define NW_GCC_QUPV3_WRAP3_S_AHB_CLK				76
+#define NW_GCC_UFS_0_PHY_AHB_CLK				77
+#define NW_GCC_UFS_0_PHY_AXI_CLK				78
+#define NW_GCC_UFS_0_PHY_AXI_CLK_SRC				79
+#define NW_GCC_UFS_0_PHY_ICE_CORE_CLK				80
+#define NW_GCC_UFS_0_PHY_ICE_CORE_CLK_SRC			81
+#define NW_GCC_UFS_0_PHY_PHY_AUX_CLK				82
+#define NW_GCC_UFS_0_PHY_PHY_AUX_CLK_SRC			83
+#define NW_GCC_UFS_0_PHY_RX_SYMBOL_0_CLK			84
+#define NW_GCC_UFS_0_PHY_RX_SYMBOL_0_CLK_SRC			85
+#define NW_GCC_UFS_0_PHY_RX_SYMBOL_1_CLK			86
+#define NW_GCC_UFS_0_PHY_RX_SYMBOL_1_CLK_SRC			87
+#define NW_GCC_UFS_0_PHY_TX_SYMBOL_0_CLK			88
+#define NW_GCC_UFS_0_PHY_TX_SYMBOL_0_CLK_SRC			89
+#define NW_GCC_UFS_0_PHY_UNIPRO_CORE_CLK			90
+#define NW_GCC_UFS_0_PHY_UNIPRO_CORE_CLK_SRC			91
+#define NW_GCC_UFS_1_PHY_AHB_CLK				92
+#define NW_GCC_UFS_1_PHY_AXI_CLK				93
+#define NW_GCC_UFS_1_PHY_AXI_CLK_SRC				94
+#define NW_GCC_UFS_1_PHY_ICE_CORE_CLK				95
+#define NW_GCC_UFS_1_PHY_ICE_CORE_CLK_SRC			96
+#define NW_GCC_UFS_1_PHY_PHY_AUX_CLK				97
+#define NW_GCC_UFS_1_PHY_PHY_AUX_CLK_SRC			98
+#define NW_GCC_UFS_1_PHY_RX_SYMBOL_0_CLK			99
+#define NW_GCC_UFS_1_PHY_RX_SYMBOL_0_CLK_SRC			100
+#define NW_GCC_UFS_1_PHY_RX_SYMBOL_1_CLK			101
+#define NW_GCC_UFS_1_PHY_RX_SYMBOL_1_CLK_SRC			102
+#define NW_GCC_UFS_1_PHY_TX_SYMBOL_0_CLK			103
+#define NW_GCC_UFS_1_PHY_TX_SYMBOL_0_CLK_SRC			104
+#define NW_GCC_UFS_1_PHY_UNIPRO_CORE_CLK			105
+#define NW_GCC_UFS_1_PHY_UNIPRO_CORE_CLK_SRC			106
+#define NW_GCC_VIDEO_AHB_CLK					107
+#define NW_GCC_VIDEO_AXI0_CLK					108
+#define NW_GCC_VIDEO_AXI0C_CLK					109
+#define NW_GCC_VIDEO_XO_CLK					110
+
+/* NW_GCC power domains */
+#define NW_GCC_UFS_0_MEM_PHY_GDSC				0
+#define NW_GCC_UFS_0_PHY_GDSC					1
+#define NW_GCC_UFS_1_MEM_PHY_GDSC				2
+#define NW_GCC_UFS_1_PHY_GDSC					3
+
+/* NW_GCC resets */
+#define NW_GCC_CAMERA_BCR					0
+#define NW_GCC_DISPLAY_0_BCR					1
+#define NW_GCC_DISPLAY_1_BCR					2
+#define NW_GCC_DPRX0_BCR					3
+#define NW_GCC_EVA_BCR						4
+#define NW_GCC_GPU_BCR						5
+#define NW_GCC_QUPV3_WRAPPER_0_BCR				6
+#define NW_GCC_QUPV3_WRAPPER_1_BCR				7
+#define NW_GCC_QUPV3_WRAPPER_3_BCR				8
+#define NW_GCC_UFS_0_PHY_BCR					9
+#define NW_GCC_UFS_1_PHY_BCR					10
+#define NW_GCC_VIDEO_BCR					11
+#define NW_GCC_VIDEO_AXI0_CLK_ARES				12
+#define NW_GCC_VIDEO_AXI0C_CLK_ARES				13
+
+#endif

-- 
2.47.3

