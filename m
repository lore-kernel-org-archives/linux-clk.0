Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB08411F88
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572499; cv=none; b=s1wHY2t1Ymmmk8mP/CGfRZH/Q2Y2mM7QYRdioDuArmqjd0FPzLg7vY7i+l013qP6TyNKLOIhtVahueZBB7RzoibtNgVjG1f01tU70Hklt0nheXOJ0oMTY6Lm4CbL98dsPUe+CUuGVsHw6L+s3WmrzAJtt1xGt9nLMLUOrKG7EEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572499; c=relaxed/simple;
	bh=REJZawy4aBEbtBGd3KEmnFuvi8s9k7aDbXSu0pw9loo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BJRddo7vEofjYnzogjWyzBlV+cSdIN06ZosGAIL+yzkiD2Z+j4TvvBngx7+Y24flAyc0n7OQMzq9RR6ixdBslZTjlWeHcRNlV+zmmjl+bYCwU+NvV8Wh6v7gnuH86IYZCq2pemgjeljkzDd0kuhcgI/4AO2ExoeDJEdfiksQ+l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OvWpJJsX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T3blYhG0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OvWpJJsX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T3blYhG0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMpnL2372816
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oxfa+FUs8WqJDbLPx7xq2/8KB0/M6FXPg5BITFA+MLE=; b=OvWpJJsXFM2eMFTu
	m6PwVHxir/fqaoNnGX8KnDRVZzUJ0CLAMvuuUhusZxVOHsZPG0lXBrZkE+64H69K
	CHolfOWG0CW3Bb2J3qjgp+DULvPIHfRMeaHQPVlhWLNGyglkw+jbuX/NeHUEVmAM
	TnsJ0Fzj1OopMkwLg7mq+UUjqZ++SnIHo1xVjvG1uPdCRhmENYCR+XXLjTuE/2BZ
	pqI58SjSGM/0bf/Tk9OEkup/wiyqXpr2sfp6Wgp7W75WotMFQruV33KQdo8KEUXT
	+NYETw+rtyOuUzs92RvWdVF2jpMPNLBDju4CJ7wUAZLGWRFIq+GZzQlSoOC0tdPy
	9/rkhw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdsheds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:54:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90c8cb9f37eso23387716d6.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572495; x=1788177295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxfa+FUs8WqJDbLPx7xq2/8KB0/M6FXPg5BITFA+MLE=;
        b=T3blYhG0ZFC9/g40dEBM/RhVjoXAQwhTXQR23nmAOKQ2qMKOsqZhvKgvCfJ4xmlWug
         MOeYDIHtBj6xmpsdi0V1cG1P4YKJ9xdvWfHoYj+TV8Cs8cooqw4eHbMIabLxziPoDdoo
         HmPAQWbf48X8+xkL60B9BFJb+MEwhvqmvy2yEpMK81SEVzyTIOhhu86PiVi9jlG75nXe
         +SENFW5pGG/udsX3MnkReIAVnbcAypOCFnPxsMrW3zWg8Q9PnCdiXuh52hdqWl45+K5I
         zPW3isMyoBRtDDn/ULPO5C3t9DNxNDCouX7gRP8MCBXTzcvP6Oy0KywjfG9NZLlrmgig
         Y3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572495; x=1788177295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxfa+FUs8WqJDbLPx7xq2/8KB0/M6FXPg5BITFA+MLE=;
        b=F5z2tU2z/PGqUDP+nzNdO9GX/KVN0a2DhDOhw3O6LnG5Avpo+WhLI0poMtXKGGS9vP
         EFCxTZO9qso3SNXUJBbMrUXIXeR931q1oB/s8mNHUJIhKmltQIwXAJFv0DpsnJ7ox/ou
         513KMsW5FpAFJXrjcUWIltzdCRFiv8TplYtMNE6ayRo2PviVsH1o8p/fLlHhBHXxT/QM
         d5Fv5coSJeA5kY0vwkW9OPjn7ajv/jGnAcud8r+BD88oHg4HRk0e104bTkFpzAIEZhTf
         FE5MJzxCLaxktUK4AHugdk0qEhKRVUWhDOc9ykUuBQrKoN7U9LOirJUKL2a5/uJ1CGz4
         dLsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp41ZxjKUkBgKfN6pRn0qOBNIFKZknE7gdHCftrY908LPEGvTaq2ktWeFutJC5P0QECEGuhM9nQXvQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lsO6TqQkNCqYM6/5469QYEvOzf4BAxyujlcGtE4/vtEptLVNLh
	SIqw8Kgko8cWCD7WSh+eLUeegFkuH3oo+7ee6nfJ1aMw+Zge2sqz7M3jLoGMeGInktFg10LoDG4
	LHfRLODhNM1ZpDvweZkmrWCBlg+LZq/YYSsLY8ZeV+OzU4q3Yg1vWghAtuzxpkpU=
X-Gm-Gg: AR+sD10wExxboJJa6DhChiJ/Pdn1Src6FWzVbdQZ3w8A+daSYJMRkUwi4mTw+s5cPhZ
	vdjY0NAKhb0K1OMU4s0zJqi/y6mAB9TWgXp1gbmlu0btEANSFurVqLkSbsLllXAEbRL2a2WXyAW
	EwpF/MucjsRuIdf0n58DpByugdhBgEqdLTzUlWuatHFNZzE5s1yQKqO7B6HzAF9XNJKbwQqunty
	yzMhC/FVau/PoMnKKd9UovpZ/skYjlyN+h71IhSMxqxhUnKFjXAcYqejST7jgBYCsw7w17WyZSi
	V/JHeWPJKDivaxJziq9Jk6fRfHwvmqKpctcyx4dZR3hC7AJV8CjRUlkgdxIloU3dCOiYc2gyzVN
	Zw7RobBOF
X-Received: by 2002:a05:6214:46a0:b0:90c:4ddb:e298 with SMTP id 6a1803df08f44-90c80ca639fmr283314306d6.6.1787572495442;
        Mon, 24 Aug 2026 04:54:55 -0700 (PDT)
X-Received: by 2002:a05:6214:46a0:b0:90c:4ddb:e298 with SMTP id 6a1803df08f44-90c80ca639fmr283313186d6.6.1787572494900;
        Mon, 24 Aug 2026 04:54:54 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:54:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:53:50 +0300
Subject: [PATCH v3 03/47] dt-bindings: clock: qcom: gcc-sm8250: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-3-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1731;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=REJZawy4aBEbtBGd3KEmnFuvi8s9k7aDbXSu0pw9loo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDYZBq2yLVBcLIMiiwwt1UrTp3pLhPT4ndQt
 RqgngtR1ZGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww2AAKCRAbX0TJAJUV
 Vo17D/43SKJo6r4cFVkKNCPl3h2NTwc2tdxH249u4t3uSWKJGh6N3vDUe/CyhIkfeNKhF1TCKFt
 SbOFwKDBjHl21hpdBvt+g9wvg2rgGqnV1yWQAgRtdFWuVzUqMFXjM3K3ZWlmQLXlnNuO5JGxGBf
 /tn6cLI4FWCj5C24GcKICHKo0W1uPjlKqeHYe1sYFyHXA6sir0PcryYZ57ioGSVCuNsN7baxq4O
 GwwSJGK0K73HtYPcTUOdLfDgmfr9wh7rfn6QFy5jRaw278VmaIk7MtwNjWcnHidYMEk87XK9ee7
 Ky7AakniDMe4gZSWgGDZ945o2L2wvw/AeiNL44UJ7kFih944oGWoFZM4rv//xgj61oSgSCNs0G9
 vxFXK6P9/gaqfOxZXr7cSMs49fFsiu/FcxCHdVSHwIA1Kj2puImHoXeM13EK5nMfdCuIyGqIqQI
 e9j4o5g1aFCgaIbQOH2bmbRLbyyTln3w8wXfZ/RX8CrdV/1zQ2N3A2ytSgO8p94pqV0cDoN40MM
 nZmGpKTxwX6WqfDLM+3nQC5e+5XQF2/sZ11x+wqCoJ5TAjeiYRDYyAx1uxS3PJOAsdTa2UY6/Ru
 0RHO0XDNo+9NetQ/XMse6sMFqv6+F5gfiDIinMK9blEFNrzpPDI6+cmAvNgYnANjo3xOqfyE1Hm
 8eJsi5IcYnplDrA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 54e4LyUAnXNEkunZ3EQLy_eGpWV6V2tG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX2Z00M48NgAR8
 APHkE8J5Wsn+icarLeDyTGirEbiOyxqK9yI3aPB/dY/F51uKqI9K6p9HpAeGAgpr17zCqFIhyIm
 QMdhxW3ricq1ki6SC3LefmJexRyPqb1A7fbPeBgPGicKyrr1Kg8ZjrbxYZ4RdoJMr6ZDBaVurm2
 xIkm31YHXSNeSQEXrUDg+7mSoVNGjs5X2a4lzJyKgUU4j52CMWIJUjLtsBIZcLv6TrymOO5YF/m
 0MmG1dfeHyGsjWMiqZT1ydZ08x/IIjRt5GFO8znOX0fW7WUwD0Kq9Jf1vJePPnF7Lz+Ys+Lph+G
 lBIkXQ8WcU9S7ucluMi6NXgDc/yqAuLgF65UZR1mBPyIBSVb1tx+Ez1rvo3x7UJGPtMjzQlJ/Nl
 LcM2OuKGHBlw4scuQoGYXH7zf9VsPZOV3eeZVrsFKwBHf5hCiwrnr4tLXnYR9eEjoZE1ugwtedz
 gfvUvDoSXAaNJMHb+7A==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c3110 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1VWmMwf-hiIXLgPH03YA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 54e4LyUAnXNEkunZ3EQLy_eGpWV6V2tG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX3LU2rXPXnai2
 Ma3IHFNMwopSj/3UEnn1auObriN7fGpuVbQB5EvTvY3XUsfmex9XMo/e2REIUu6ylzvYOW8VXKU
 rMvrtAphEksrWuzesF8scqUr9OqZF+0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

The GDSCs provided by the SM8250 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required,
matching the hardware description needed by the GCC node.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
index f4cd5a509c60..7c0c3cc63281 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
@@ -32,10 +32,16 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the CX power domain.
+    maxItems: 1
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -46,6 +52,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sm8250";
       reg = <0x00100000 0x1f0000>;
@@ -53,6 +60,7 @@ examples:
                <&rpmhcc RPMH_CXO_CLK_A>,
                <&sleep_clk>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

