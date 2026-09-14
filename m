Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6344477E57
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390094; cv=none; b=c6P7sxy6jHIgCgQs4gBHaq9l+s0gZ9ASaAhseK272sUQbyutHSDalyG/wicdSiDY+Yg2sl+JC7tWGoUOWOr3fFM78IQWZwnKTQ2vZWXQIzE/hG988Oub784VEKVqhqFBcVoRf2/CCk/km6ERQuCF5nGaRXJMx4fTejAMwt8TwAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390094; c=relaxed/simple;
	bh=HfNHkaVNQW8Ivt7UX8oz+gycqQ1mngAo7/JgQDEJuKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pDT5lml4ZFAbSFglQNnN0U6yqzilO8JNAwvbafWVk12VF+Vvr3WUIYQ8fMcCw98xjnlcdaLl8g8GS11SYx4U0ikRe9hp4EQ8xuMDWDcn3SD38ZycvheTwMkmYGRK3JkTA1tB+FsT3D2ES+x3uHzXUHIlHzX9+K454Ddtt+8uu48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzxD7pge; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f3Xl4Xx5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzxD7pge";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f3Xl4Xx5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm1ge727598
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8dmVNfPdj0vkPUVD5zgWrGN77gfTJny/x13eJrlZW7Y=; b=hzxD7pgeXwJqbBaH
	gxxAEUehlba71vOBJQtsrBEa2kcSgaWY+ubcMMCyfWTOUOZrxMMleulrUD8xPa8X
	MExU/bycvSPhNjqm2Ku48fh9CZi+hz9iNtcrTxduUMCmXQJl361bZ99ZAjPHlUOr
	DtHPIFQwwYxRb4qbgCTo89i3d5tN7sqdF9Zm+FyrmlfgpTgZICy9D08OnKYj6T9w
	YjW554eBV8lHBnGplmLIUyko34JW9xadxBh3Y0MyAHnXHQxSubAC2MgNOoN3VAQP
	A8N8JWVZkJ/53OGbMNpHY9+HZoxTLsoX0nmrWXeVWpeU5m1B0HphwtE6cV0kqVBZ
	a9Bk4Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5rxxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93918756165so601838285a.0
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390091; x=1789994891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8dmVNfPdj0vkPUVD5zgWrGN77gfTJny/x13eJrlZW7Y=;
        b=f3Xl4Xx5zbnvQk7Xz2rq33En7t3pJKxdB7rU/fMqMon2q59p1IxY+yb4umYgCWXty/
         yMpc0fVGIzdmJDKOv0OxHa1dXA6p8F+LhW7Ltp2cjvt7k6ePhGs3APVSNd0BaKJHyTIZ
         jmky2WM9xl7PZOaP9nNPeKJY4QMvwLpksHr/HFG1mxLgBxWLXlGzzIp2x8+4i7EkQECd
         Tm6ZmIHQ7n8ZiYk0U7jxhvXGkwjayDsc/1iZHcTF2NUicHaSKQgtWETR+vG8MZl18ARv
         G0e2rqufMU6POvwKUnC+FVXLRKgJtvgsalXSTLoZxeoTNfB0Rk2eEm1AgyrKUDsc64Sl
         bsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390091; x=1789994891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8dmVNfPdj0vkPUVD5zgWrGN77gfTJny/x13eJrlZW7Y=;
        b=laFu1Chl9VdPUfkvyenK3tqk99+UOAS0CF5XQ9RcvSkJnoW6aURXjIOSa6Bmx8r1dk
         BZO84OuvYWC4rMSR1zy7pXNczDdP/XWFi4WMGFQe6Az0Phv2Qt6fjGkXRR2RVpbR8nrx
         pYFvm0RZEB9huG8KIGvZFxfe9JuyBBXj2ZTXJ/HAUqAJ7ErzvT33CTwNBZye49Pg4nZc
         +kixUL+QvRX34VyZsAn9WUO0MrTMQxCCGirKJh8ZdPUJAr8LEoS/WtFXC1hkw0atoQz0
         Q4tPg5f3fa/G0WdKOsnNgfKTIwdK/yLnooMQAeCvN1yKZtuAaSwquIbluGxfm8FMzoZZ
         4nOw==
X-Forwarded-Encrypted: i=1; AKwUvBxemdHhR2pGB0f+Qa085o2vIsKamav2w2rNxBXvW7M4XHT+/ll9Js/EIzgBQyurEQfmpJfqSZIAxhQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mg8g2GTXXsd4cdbJ/X4jHxALU3n/a1UUwyD/QjzBI2tSAA49pT
	Ci2bVBELlAzy97Rqsdg6OQi0zuVkofo3zg5aCOmPiqtV8S6AjMvkOSmHXTrlmCBRwpg+PDHZajt
	kPYqvOVGyvcpMm8eLP4dER0qPBD2FJmpRPOaKaMlfmTIZLNnYA8xuCMsK7n5Jkwc=
X-Gm-Gg: AYBFou16LT3gUrw2sADG/BKvmR852hSWwqWjWiDvE5HRLABjSrv41bhUiPY9nthv7Ys
	/DJmJSG46ZfQjS0iR+Z8ehVOOF8vg6QURrS4Sb5fM6ekEf06Mj3Bzj6S2NVEAabFFb7azhh80nt
	bczcPmgGl6Gj7ToXlIvQgMAKqSrQWoknJj3r4y7RC07/VLMrNORLuHSUHGXmWu9UBMa+8haYa0e
	Cs34cPpnMfR/rFU6wqOINKvS4XzLLDWscFAczXvhlydTYKCZKvcpP3Ntnk/tD0vjF+QHXpouq03
	XFqKIduCPa6doe3Fbc89VBypinJ5mc75Zn3jpi4ujU+3xX3StQWXr5y9E67smX4oj3h/Rt0+h6g
	xEHwZhojr
X-Received: by 2002:a05:620a:489a:b0:939:fa1e:d6fe with SMTP id af79cd13be357-93a29966d7cmr334800785a.25.1789390090662;
        Mon, 14 Sep 2026 05:48:10 -0700 (PDT)
X-Received: by 2002:a05:620a:489a:b0:939:fa1e:d6fe with SMTP id af79cd13be357-93a29966d7cmr334793185a.25.1789390090028;
        Mon, 14 Sep 2026 05:48:10 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:08 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:02 +0300
Subject: [PATCH v4 03/52] dt-bindings: clock: qcom: gcc-sm8250: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-3-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1712;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=HfNHkaVNQW8Ivt7UX8oz+gycqQ1mngAo7/JgQDEJuKI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zOOwIgbxods8dI3eNoWZOHGKl2iXFWTRguw
 YdCq40ZQj+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfszgAKCRAbX0TJAJUV
 ViXpEAC56g5nwPtkEKHi1LBazQ0ZY76kDbzr7aGAXOt0oqDLb9HpicMxabVKpolPBJJM/rCr5aM
 1C5qz3WFmFvEoetOlIugySPphwMB+aSCJ+KWvs6e9XVu8+/roLYk2cGsUYjVmufeW85P8v7RtKu
 QXcn+6qNURNcgBlwrCO79MQxxPGvVmKyyviy/ckA/9oYnVp88BK2rTSK3bJ6DYIdZzYnSzfw+sS
 2qF9H57NAkCSbus+Z3X9++NuNo1X8S3MJe1UQ24yapSqQikFcF0qfzsPlm6Yq1FTL8a1VIMJKFx
 j6w0FinE0ezknAM2ReZfG+e4kg6y4drLjsw+rYMAJfYgxhqK/q3U+winPG1vPcPO5eGhJE6EWOb
 DuW3/6TazCtbS/Tma9OLW9eAww6UQ39B3JdInRJ+iyDvSW5JnhD9kHYjkQ4Iv2bWZwyYW1G+Gdk
 +wjTckEosNHBjaeCxfZMqY4iqlnucPNoaSPGF4qbiSZxkT3uUiJwKRH03cS6n9x9TDpp1igeYcK
 mEwM4i9540Yl00nendPLQoKbxWZiLQ+IzUgiSxQmkoaKhkXyfnMDNce8ciN3NIsmB98M6HmnmQE
 SaH4bxsAhzuTH+88B/kiKj7CfCTw9Na/J7nyvcIqVERkLZLQxM5lm4C687TzjMazqJOTrVtJ3IW
 K2SWTihGKZF9BWw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX0+GbNdMH05li
 7wf6iPIT3Vv/Es3kij2OsHvA8DiFF5hYlbgG70CDWA/VUriUy1tvAnFHur2RrFdMDzj27x1qxQn
 O85oF8JeWUHhyFtAzXJVS1tNJDKELxI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXzH2zn0dPOuaS
 PfITRatlwA5hrsfrCDYc52GdDug1qis6jknWKAAT5UUSwxPov2i3igf8RYRdsX4Rl9nxAiyKOG/
 hbyRfoACRy1KpI4u1rRusk0lXLFgiCFfWdtD+t2eQmiSpx+OLt6TG13iE7III+qPVRgVDWg5XmE
 TMeREQQRyGEs20Sqn81gCHYAZZxwSCX7rV5VB1KxDam5b1rVtSJzZOMRsOH94GrK9UFy2qwaGyq
 qB7z/nzsb/Qi9NSkNYSL14GaXkWRoVQ9CEVh5KGcU56jlI8FFMgHnSkEx2wvnEvSs6vHdOXhaI/
 /edITigMCPWM3LZu7eATs9VsI3B7H0Z5azr802RrkWX78e0sgjeGBgE2vCDBiLFbUnHnpPv1k8P
 7HqDxTvSJjy76gOYsk1gesTcCIj1vU8xbpiAS46iLrjLiMAWmT99RmsnTXP2fZXBgYlxXw5CiLo
 TBsAdG2EBKZI7+HGMDA==
X-Proofpoint-GUID: 1lyDgwJQZKKLO5ibk_c9_o7rV97DT_2v
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7ed0b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 1lyDgwJQZKKLO5ibk_c9_o7rV97DT_2v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140182

The GDSCs provided by the SM8250 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
index f4cd5a509c60..5f9aae728245 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
@@ -32,10 +32,15 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -46,6 +51,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sm8250";
       reg = <0x00100000 0x1f0000>;
@@ -53,6 +59,7 @@ examples:
                <&rpmhcc RPMH_CXO_CLK_A>,
                <&sleep_clk>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

