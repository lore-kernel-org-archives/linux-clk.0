Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B18441DE00
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 12:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572836; cv=none; b=P6jJI7OdB216WsoXGqm8lUY+wUQIlooA6ewY2s3vUhz+aKzeq14coO3gw1B/MIOsayf5/9zfiqZB90Nbn9RyOQ7dalFeMwX9w3pg8bPXiIRKolZgK7rLFcPNib2MK0+GS01p2IiPbQD9q7tWx/3WHwDKHqd0O2hbeyO03i+PP7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572836; c=relaxed/simple;
	bh=6qFf/kDPw9tgUbvy8kWxoeUEXj0aF58lOGYhG7+ZlZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=licPA5twSrbRZYnXgaIOzS1IUjWiZBen99wT0vK8h19JtwtFuywmqJofsfW7I1PoNEveCUj5aySM1Pz82z7u5COe0s6E0QnLbk1PIkPqQsdEP7c2LhJP4WXAqMn2zaE/YLeNo9EL4iFBM8c7KLLjddvmd2lxMLCVy7RA9S6/h7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LsexOkjX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PXpQc1G8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LsexOkjX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PXpQc1G8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMWSi2376890
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 12:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e/IushsgO7MvkFlfGxM9MPtKLnaVKr9D0ywtvvyNu7c=; b=LsexOkjXSwQjI6Yr
	TwJw0iVIoATib8H1bdxA5igmvu0+GIw16P1jZvVv+7JuV/ewX73nrufrCUZ8erQ8
	QV/B6skkzbBx/t2UagJHU7QYnpd1+LdHPe+OOPgfgt8vT0dRzJ5i9MM+AUF+Jqzj
	pWztDfO8zHkD0NqGxuii47VhCBwa+pgdcisOZrxNBJ9UXCWCYjwmb4yqQXn7wxjD
	OiF6rgbplWchRO3ZfRBfcRAV+p16IWxmROiSKeMmIH+gA0V0FU/mjTu4qtvgTB6q
	BNR/LR97sKdtIqmJF8qN3v43/HToZTHJBd4CO5oUolKN9PQizU+nQF9VGYTFHoeW
	vlx5Sg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hbth53t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 12:00:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1c7f135bso61070731cf.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 05:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572833; x=1788177633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e/IushsgO7MvkFlfGxM9MPtKLnaVKr9D0ywtvvyNu7c=;
        b=PXpQc1G8Er/rBBNyyMqy7XbmvF9/cjaB16geGde9qHhZVdp05Ra+4o9u+awP9m42pZ
         S9MrX3sr7yk59IGlhBn3hcQH6NDURVxpOddmYPQvjMKsituo+zd032Uac3NSIBzEvHAU
         bO+BE2ZyuAJFbY2cEP/tLZ4iXXhHFC3C1fiGMcTcx7aHOtcmCWROR1p2pSUoVNkKCcC7
         aheu5nk8G/eGPyC0s67odiuvwN2+7/HTlgFUSJ/LraJdQrF/ug1Iw7qu7uR25w+GHdgI
         MdITAL6ShkKEn3bDvzGvsAdUcTKJVZeG8KxXcn1bmryefWyPhcbGlIPw4plZvkmF/o9j
         dlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572833; x=1788177633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e/IushsgO7MvkFlfGxM9MPtKLnaVKr9D0ywtvvyNu7c=;
        b=aq//bSNvdf5LojFLf8gJNGn/vE29xq/5nvQJsWL+KdmcN8qujdnW8kNSNYm/tmWuF+
         m7QTCdFbn8uNY4q/m51+qNDOumZE3+eVIIt1tYnObcu1WkMLXz/cQKYbAZpEYtPi2wfB
         m0wZrm7HKzhQMwpCIWFvVaS6A9eqVhR86bLY7mrERi5sn7x+DBtBswZ6tp83yVQx0O/6
         xt6cJVzYENxx0G9r3wYu4Xv5/V/Xfy+D/4dmz1yitHidB9O/doHST5butTQQmX1QQJ+F
         UA6ikLpC6ADGoBF0yNOVEBvNuYW0CyDQoyDzIk0JNOffcxNu21OZAdgNPum5ilcfTnSI
         rzWw==
X-Forwarded-Encrypted: i=1; AHgh+RqAFATn8bIFqwZAHq3ZU1OqZOfzF1MHZ6rr0yyLFvmWJDx4Ja9xg/V0EJXRRu7YQhEBHLfvt1vrzEU=@vger.kernel.org
X-Gm-Message-State: AFuF++kvCjSi6dFXhtxIh5JLxhk98QnUemSxefydtvlLTqGh+aWJSMHY
	wt6BuFlC6awmNpWMuIKKQPx7Vj/z1ib1OY9B9Yz2H1R1QT4w0kGEju8pEgle8lipQ14YTS7FNnl
	3pSGESRvt535E+YlE7h3mxloNFfXp0ach6KeYbzTPDAiQyDsq/1lv5r8mjMtAkf8ClB4kSME=
X-Gm-Gg: AR+sD129s9eKGfraAvqTlIVsOkUlgHNcD16NK8BY/T7+J4zKaYZoQCQ1t8nyseU5PSR
	OjmURQozP6f5N6oAL6Lmi20zRIAM/M1nfjn6Qupus7/+4fcrDn3tv7oXnydOL3dglZvHncleJ4f
	7PDq4tqlyO3vQcIGVcFZzPuO0hqP3ZVlfucNQ+sUc7z/Zj8jK5srBLY2760UQehsX7Z/Aepu7mv
	KKPRUir4yB8yCZaXUxTUZ4pnY0vwi/9ppKDRGEiZMtnQ+BA8BrQi/UxZr6v4v+S/6RYO00s5u8N
	A48UAo5Sj25qbKC1fuSTOP0VJEWNsddzk/QP1GyGje9CJIV6032z4OUhm+d0jUhhKkziTSQIbFg
	slY1Y4S3R
X-Received: by 2002:a05:622a:2307:b0:51b:fe3c:6c1 with SMTP id d75a77b69052e-52df585c861mr253272891cf.27.1787572833213;
        Mon, 24 Aug 2026 05:00:33 -0700 (PDT)
X-Received: by 2002:a05:622a:5591:b0:516:ed02:c85d with SMTP id d75a77b69052e-52df5637a7dmr287456001cf.3.1787572510985;
        Mon, 24 Aug 2026 04:55:10 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:09 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:53:56 +0300
Subject: [PATCH v3 09/47] dt-bindings: clock: qcom: sm8750-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-9-f1205a92682b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=6qFf/kDPw9tgUbvy8kWxoeUEXj0aF58lOGYhG7+ZlZE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDeg3Aptz66KE+9arLO4DSsW7tzotpNDfdO9
 BKgDBRgb6iJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww3gAKCRAbX0TJAJUV
 Vrp6D/9LS5BOj9HDcLwpAH/D6hGEdjg3vkv/540ATe9J4DQTQh8cCttQoSQ1aoId+8ddc/LDiM3
 eY4YEXXluWUt8gbNmXYfZ/zUYdDf0a0MT6RJQ1OO19a5K6C2aVqCmknviLbI8KhW6mRlF4A4CRI
 VHGloCOEo5KDeNgSTzKcr/AOwQtqoK2NfsN+k42aF2SlfCKV7v2OgmTlF3l9wczp1DAdsB9wtWe
 SqBSVUTZZxjf31QGbB86BEGwhdzxRPO2sh+1jc//20af1i8lcbhDyNzwNqQUrHfuM1YRawt0co7
 qB9540F56R8ZdDoIGt23KNQ3wszxtSHmnoUZ900J9MnLg1iSAPL8n+3zaWJMmPFmWV8BEDaSpxm
 xpMc9jzaymrKfjpVWVMhgvpp2YuSWg57Oq2maE97TYZvn8/w1+Gubs48cD7hNe3pRMXTEH/0dkR
 Q6IyqFi5hERadtecdePOhrh7pWJWGm4m3bmBUY/jp/Yo1RDXqwi0DS8uv/KBRXoqW3wPA1Y2wAA
 I5beZKZuyRuTxoPbCjRjL4aKrKs2oFZWNajRmiBJTtdr60xbk60fTYdOwEuaPqRyzJP4D/vaTF2
 Yzr8gCzlTvKwnsFzjkY6wQov76SuCHnzSGdfyLYA8UbJYQ8yqcpbkDYYaP68ObDIksbUCezMU1n
 EgYkuTqevEWwV0A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX0t2IgiAUMBRb
 Xh9KStfmAuINczgQVVfeqW6TgYL+2LA9+V2Hn1xDKHzpN7z3VErKSuhFp4kj9gxS4dgKr17fBGt
 fjfXK7BBwj99kejDpJlq0KPrB7d38Lx2+IwVCfPjuphRW+7iHAlSNdkOeIJAyeqBp3DAPIFoLNR
 uKbMgD4WP2sLYNv2EA/mQRhz3Zp8MG3n2H7939iL9oujCtqYvwtpF+/J0G6ysPzPnZPV3czgrW1
 tIsMktKm5bVFGCrG50Q8ukb4W5OR70tf7gLT0JJI1zaRBnqOhmtohT43VnhzWKrq5815KgOOamk
 nqmG2zpI8DAQLKadnbJFmxGljw2IQrMceeFX09Te+BLnL39PBYsX7z6iHc4PFrwh6YADwMYLXv5
 gN/cNZI2lkIpEj47W6lKUDNeUPvEksHElIBXBr2yQt4juVb6uwjAZ4crRKml7LMqOpom/SxGIgB
 w5JputFDOwXOXIn8wLg==
X-Authority-Analysis: v=2.4 cv=JL0LdcKb c=1 sm=1 tr=0 ts=6a8c3262 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1VWmMwf-hiIXLgPH03YA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX2TsvJz509PmH
 MCvZfXXiijDi5ZhHS3x8xRj22CtoxiLFnLywEwG15zbB6w0VkWzaA8F2hGQZ3xw1gEd7TP2opb2
 OaFytpuAXBHrzQaaO8agkuI3itCu/SM=
X-Proofpoint-GUID: 8_bJ6_Z5nXChNelBxQXrp9m2lPM_AHaa
X-Proofpoint-ORIG-GUID: 8_bJ6_Z5nXChNelBxQXrp9m2lPM_AHaa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240100

The GDSCs provided by the SM8750 and Kaanapali GCCs are supplied by the
RPMh CX power domain. Model that parent domain in the GCC binding so the
provider can describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required,
matching the hardware description needed by the GCC node.

Fixes: 342d2a607450 ("dt-bindings: clock: qcom: Add Kaanapali Global clock controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
index 0114d347b26f..f54e836f3135 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
@@ -34,9 +34,15 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the CX power domain.
+    maxItems: 1
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -47,6 +53,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm8750-gcc";
       reg = <0x00100000 0x001f4200>;
@@ -58,6 +65,7 @@ examples:
                <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>,
                <&usb_1_qmpphy>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

