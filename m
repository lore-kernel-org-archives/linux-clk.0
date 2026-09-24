Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E654B4749E1
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246418; cv=none; b=upEDgVAjPFl0/bsr9ho4qGDQ3SCtFM02z2M1jOTmS+r1UOozciYtEJ7ZHn8fHRrYG3lxlT5QuuEH0aAlQPngyRR3GzPy44JXlTaymI6oFjA4rX4x4yZCbMSfVneDVvRTNL5VuW1fGTRrzurXFMH3wfZsV4zVXEEJpqtd6UYHByM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246418; c=relaxed/simple;
	bh=nMD6xMrn6lL5iJ8IxikWl8h53ZFdj13HahcbJwWFnFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sdLoYWrrwQFheQurAPc3BkdO8hOppMaIRh+j7/LCC6Mdp/p9ycM5NpCTVu+dMgGWYsCJkXUsgddoEbGTRNoN/ZxmiVr9s/2ThTTbRQXd9zb/uu1AbS0D1gzwsw5cOoOKiXQIA6DvMODla3RjLNjRXFbehMqiq1RNxG4qi85eEzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VIgTYuOI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gj9zxYC8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VIgTYuOI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gj9zxYC8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9P3481064098
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	blnAvdyz/oCP8BFz0wT9Q0/FqHtwsyu3g2gkST9t3vY=; b=VIgTYuOInlVmn0v5
	vWolzsXHUFJcM8DIsM3mHsWebas2M91suV5pqqp2d4wskUbqKjTKvzvWMHkI/6OY
	fJ/JHFIzAUtWVShfkg9lEDaycTDswi96RwBlXur/e1eTOO/Ji0e+xfXkVafG9l+g
	Cc9BcfNRnhTa0AI4xxFgWC6kaHJnYLq+4fyRiC+6VxuWwgfqqV9Cn5lJ8wcdL849
	JWt1A48I0pGjGA/HRmEzHhC8wuY8dJTpmMnGg1onovrN8N7frnqcr/RIMBEzTyWx
	Ia8m+kRh6ZBgGTQOLPysxTAoyj6RCnmg7jJzvzANy+28Ax0uTSvIfrQycV7bo5H3
	AOuT9g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgh9hn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939062ecda9so293219985a.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246412; x=1790851212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blnAvdyz/oCP8BFz0wT9Q0/FqHtwsyu3g2gkST9t3vY=;
        b=gj9zxYC8fToRU1Z9W5VKKve2npkJZP6jpkzTTUViUkbA59FmlyTfzL998/xROHc3zL
         Z6Ft8A8sm47LS0erPprnyw8zISVfOr5X7+5gt3xwqIkD25PJlM5hjfPztiNqsGBQpPJg
         7cD4sIcpje1aJxoAnzKlb0sx/49YDKDEg7bOS60YvsJv2SE1TFSXX6sXdnKhANdDP+fO
         qE/zLkgJb5Z93KwDlUAYYKDgIbd79U3KV71alixV0QCKj715rStFh1j5VAwE2KZM3hjt
         5uARLnFB7uWPFxvjziRlTYpVSlP1okmmGghvAaeCwma/qmlTp6KhpqGhV0jSJt3kxGuq
         3bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246412; x=1790851212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blnAvdyz/oCP8BFz0wT9Q0/FqHtwsyu3g2gkST9t3vY=;
        b=UpmTU70xkVC/qUPk956lZybl1xhJLzvc4Uxm72WhR/AWG7o1cj6TzKqsNEKvPReRf/
         Q/nT53EriVCegiF5QSIDee1HmnWwt8MOkwkPqi2gsRGaLPnJF5mIiP4Sb9P3xBc1DTBa
         /XKEujHKgleZL23d8HX7FF9A2RH2V3HL03N2pGvQ2vZ91hU2v1qDM6fB2pngpaeuxsCq
         0ikss4G0+k36f0PZmERWPDrEXoO5Fisnm6EPnBT1nafoiaDvwLIF5Drku1MK+W126RpM
         NXsioA8ScZKhJz+4pscbyOFwuPRAvYrk1BVfLSDmT8fOozKWTRGH70RgyA/3eTfwI3B+
         VI5g==
X-Forwarded-Encrypted: i=1; AKwUvBwHlVXSsiXfNCxf7RoEV4ddG7gQ5kL3boEEy6D2bDmN7/TVFY0UzBIKc2VLiVNA3T3/hOOIz6JPDus=@vger.kernel.org
X-Gm-Message-State: AFuF++mpBJKlI1DEJPBkEq5lJu+kCUtfATlgrxwUhaliLDNlMiLgUJFI
	/jgBr/6rmZjUjTpTufXb+fcilPOb8RhLL9rhbY19Yao/I4qe5tEmKzyjMCyxL57wkNXlOMhAVJ9
	gTYUMqkfKKoYE7vuNaD4/PPbcOQZ54qXkVHuWA2NY7y+1vuy2TZIM5ymTrliTXBI=
X-Gm-Gg: AYBFou3aVVTHOiz1x254QchJCrrfj2KE5T7SfkW7SMg3CjKJVrl8M03fQnI4enfqjoF
	9031OY1v8b4DFj5y1ME433xN3UmLDUlbU0xqDcElU6/JVUzPUYCHdvojpRWAfex0g+QY56+jiC2
	sp3jO1lpWRx1Qcp9idD5YVhjsfaqRFa5fJxg98fGFWsSiLmj1Zy5IqJ5Y4O6uKNRlB+PT7lKLfv
	wnNR3lZS0xnhQ9IymKMwKZzafazUU9bJMyh6ZfBomksTPiT2yn0O5zKR5vmrgw/bBLRbxqPjIr3
	8ROUgNAOcLyqD96zAcLIwWjkQf8BKkOj0LAYgp1XNSmbgDYQZT8+Iio3GmiTMfynf7CYcMC1Er4
	5HtzZDHXz
X-Received: by 2002:a05:620a:7003:b0:93a:1264:7f46 with SMTP id af79cd13be357-93c36442915mr235561185a.46.1790246411601;
        Thu, 24 Sep 2026 03:40:11 -0700 (PDT)
X-Received: by 2002:a05:620a:7003:b0:93a:1264:7f46 with SMTP id af79cd13be357-93c36442915mr235557585a.46.1790246411058;
        Thu, 24 Sep 2026 03:40:11 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:09 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:17 +0300
Subject: [PATCH v5 01/42] dt-bindings: clock: qcom: gcc-sdm845: Require CX
 power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-1-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1542;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=nMD6xMrn6lL5iJ8IxikWl8h53ZFdj13HahcbJwWFnFg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3b/+b7gJiKtrDdjdFve5kosHdjQ+34O3bxT
 AdYnfc3QSuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT92wAKCRAbX0TJAJUV
 Vq64D/0dSCCMNOo7QYQhn1N7bo1qPxyeX8nsejB0rbRoNBN3uo5tb+ma4SL7EhatXCvbMl4Jzs6
 BK48ttMnL1f8DnEwCJuZlQPofw+daMtRnR9GVIVo+6xlQ4Ya/kYTmq+8+Wzsrq/+CI/80h0ySRO
 N7hGyyM34lvh/QkMXGEEzxBH/v9IBKlzMz1Sj67aM6xl35NMYYYFfD6NezKgzw8h9GdCrHMA95J
 S5TBQ+JDGWtcfqwdvGqWuZBtfd+/vZWV1NaQuvymdBSIOsQ1IvARKpXvMVWzUMPoy+orBuImIeb
 oKo0+fesxKQ1HWoOi83SrMgGditQO1/RhAx1/SOcSxziwNfgONkurd86HhXmT6fv/SzbxpW6vri
 O1NEGW1IiELBKTinxKIiPWmupxopbpIOkljWRNdkTPiXHBMrPfCuNG6IRlprkT8Xkdqoyr8GKfD
 uLCCVCLtySpAkGOtQtVUMVuwTNCDT1RsHi7JsVH3ZZkB9RUpp1DNt26Zdyoah+qJ4pX8uTf6YXc
 a4bLi4/6/i8V9w56fdBAdED93DC6ZcWFqFfYTP48TdthJEYPnyF24JP257iNOTVikT4CB+FO2Te
 zCbLD7QGJNTj+lL+pMrkjMwG3EVXgpCuuJRP4C/a64uOYw1C07Q2VfatCYGRZFXTnnYoKJGAqWY
 f46ChGcOidCSW4g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab4fe0c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ic6PIZLzPb63q0Q4sZMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: PfdCbefrdAQvrJgRDWmoeNGgSGwpX4fQ
X-Proofpoint-ORIG-GUID: PfdCbefrdAQvrJgRDWmoeNGgSGwpX4fQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXwVZcsUE1hJ8B
 EJnPChf38ADrJIciuI+SCPj5E3b6ZsvZKf/ockOt7bKOm4MxQNXZwJ0cwGU29NXt3d7kNbqA8DH
 IhtISNvKH729qOIHt/Y7/pvwT9QSUYA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX2e7sv1rzxteL
 PtcaGSeSBELUweg14PF9NJV1JcFTTPuH9mqtYmMvxFiowBW9x7KdRJXDettmuuWLzmkLrYMIliu
 Xhem6BXwvIRXoV2a0Zox6ySsClLL+LVroPz6p6Dr4xQFdFZrOBO656IYrBXME2pkyg8BbjB9xIL
 V5jeHsn4ny3h5cO4u1AhtTS+67iJNlKr/snQOALK9/OVTT9eLPbfnHzDIBM2veMUdys6F3n5qUb
 P8LMAOYDP1HC2iEskknFZ1fc54VDrqz1dRRC3BZqvxlJZ19745BhREsmNh4ZxNvIJ4r+d36p2PZ
 OJbBxIT3kbL2ZHc8pkX4YIsbKDrCuj8sEVGf4CJlDnkHBrFPkf35eQj0E7aEB2bfHdr4jKWa0sY
 htTxGdm8CDz/PGfGC1svHVbYrL64QEQQykTM5vjPcwN3KHLmU9ShONs5R0gHBmcM0Sz0EGr5qbf
 AmhfUBwMLmVuzFj4Dxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

Require the CX power-domain dependency for SDM845 and SDM670 GCCs.

Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
index a7523a414341..41767eb11651 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
@@ -31,11 +31,13 @@ properties:
     maxItems: 5
 
   power-domains:
-    maxItems: 1
+    items:
+      - description: CX power domain
 
 required:
   - compatible
   - '#power-domain-cells'
+  - power-domains
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -85,6 +87,7 @@ examples:
   # Example for GCC for SDM845:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sdm845";
       reg = <0x100000 0x1f0000>;
@@ -94,6 +97,7 @@ examples:
                <&pcie0_lane>,
                <&pcie1_lane>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk", "pcie_0_pipe_clk", "pcie_1_pipe_clk";
+      power-domains = <&rpmhpd SDM845_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

