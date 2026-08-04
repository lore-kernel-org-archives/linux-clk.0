Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AE84A1399
	for <linux-clk@vger.kernel.org>; Tue,  4 Aug 2026 17:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865849; cv=none; b=neJ+Vheiij0UQinU4o+FYkCO42Mt9cx9InQuURRPBF/CWXdjl/QkhzQoNGy1eS2hDXNBJuD0rg+zSFC83/wBGZ9cAOVzDBOlNhoLRUq0z0Q/ZOv8drLpQoDkzNgpY3rvGwelKJ0UA0FtmgdSS0cOFAQQujU5TPNPNyKYifRowZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865849; c=relaxed/simple;
	bh=FKdRkV0vik5fotN949Ln2kZ8riKGXiZc629o1UfD1IQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HJRNigRY/SAskegdQFfnTBSdIJafwxnj/U3uU4/kgyqAbvaSErBnp7vA2o5o4vp8Bspksa//mEqZlqtFxwPkBBn7MyB3Q01gReYUWZ5xldYIyqTDbZR9cIjspSV3On6sGfxIO0pvrDaMIs0ewgnDPEEKuBev9w+LHHUBNp2GQMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnTfGHT3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DW4hdPqb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnTfGHT3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DW4hdPqb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674H0OsL580300
	for <linux-clk@vger.kernel.org>; Tue, 4 Aug 2026 17:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aka8zMnZUWdgbY/H4c3NWQK0JPmAp5Rg6iT0lDWOvcM=; b=FnTfGHT3qahxkSb5
	/ijMOmXTgkzHc4IFg8IvtAG5p95ZuTyDoQoAS4J7wz2cH91C5Lg9kDcC7YzLpFY4
	Rn82kO7sHVRw8WSaMwAQH4FKJ2Q+P9+qQyWzT+Vp+Ff3wXJdXISNxJxhsLT+FPFU
	CoPFIaUlcb3P6DQZllZXZ0Eamhn3hwHT9lJPMdo3wli+vpmnotUE/NuEOGN6Zc7o
	/4TPTLM3uKqX2tapj5UiEZo34N1Z91jxxWC7SLod/aqPfDXfIa7J2qyxF0R+WpWW
	xSdB5T8rVfYHYqV7d15uHMFugVw20WLL9I0bgq6oGu4ISYYXJ0UHR2+WUgFIo8x2
	Jv7Q7Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3q8854-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 04 Aug 2026 17:50:43 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so46054a12.3
        for <linux-clk@vger.kernel.org>; Tue, 04 Aug 2026 10:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865838; x=1786470638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aka8zMnZUWdgbY/H4c3NWQK0JPmAp5Rg6iT0lDWOvcM=;
        b=DW4hdPqbNjocs9emhSwAZjv8J+c41ZkYa+0eXibvk0NvJB+tNipIW9HjnMoxWCBV15
         Hus1otR+UdrqjfwYl57vpdUNNSzVlPXTHyCBFuTH49D7WoSJJ8drnixynWxa3MT1bOir
         QqG3Kb3/e9D/j6XV+zpGAHBms6Y9syFkZ2onTcJwZ259kVNPH1C5Sya0y0m6/v/rHn61
         hl0QQXSYgZQtNNehVnQTGexioiKDFE7e4mLWrzPKDnYvENyhgVPRE0XmYm6/HPLNfP6e
         rC/QP8DZzUqqpepMOBlgjpR8A2I2ufzfQcClmBtkg93Iz++lub8K7D6TBE6SBS6tq8XK
         ENlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865838; x=1786470638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aka8zMnZUWdgbY/H4c3NWQK0JPmAp5Rg6iT0lDWOvcM=;
        b=qRGWYHOaKXyJOVFNRKqVHDEhQ1RDT3dD3IXoR+359AP7GAkpl3sGQAxAU5Ne/oTlvL
         z+64QDg9JmfhPHxZvog8h6l57ppoK0gmw4YqBkkjsMvMz+UIFZuDkp8cIfkRDQyGbAcF
         YQl3ip85bgYrXohwYe4bwVJk/NW+h5cJ91P4C71GRBi4Mv8K4nrPp3sj0llj0ua2dbEW
         9g51A2Yb1/ZoAaPqOSx7Oa3ZTFhfKGUoBUKk4cT3ZBMwWFtSN9k0xcJXDorArmg7n6Ej
         ThkWrQtQrjthBC9e6cq1G0gxDBuGAMekP9/HuHkFTs/53FfGPT2Y63/wiFkgvZyyH0wr
         T2EA==
X-Forwarded-Encrypted: i=1; AHgh+RrXlz//H+H24ifSEHFxpwDecy6zCwsyqFdrZksp6pbyiHoaAFlThXAbVwgTiaQXlJ4rXrdJez67obM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpGkL7FAsDck2Qv0cK4IUYGe4vYcz5wJ/05MsmV6e7IV3VRcBL
	8AzTTJkS8Tg9gk8u2rVmJwoU7kjtm1Ix1UPwwJ9SQk95Zsv0p6CrSGxmKaMVXmxQlhTxzh+hsS0
	478I+DUGBZ4pOhM1fD3TSijKXgc3nuZmbtp0SSfjNfipHd4kXmagEdfQWpLlJrM8=
X-Gm-Gg: AR+sD13N6+PUuNHQ5r1rMzkNdCoCnJcDH/0hVpRB36M46fnfwPG4z8wjTwJORw1z6/N
	Wk4gZSGXLXF4ntJtnby+WpF93H1Q54MY8cIgT4+uljuCOgZG6BRob89AnjYTX6QjVx+qUGbLT7z
	qH/AERLs7pxUD4b4jfl4vJ4LAaMebWb0wC5l0T6NJvL1rPYVHCujVuQZ4Gda++g/IKsMaNRH6Bu
	iB58sNj9XWup2d1EacVd8wgL9h4fDyoydV76uoCMGteGm3FSEy+2OjKFvBSalzeVSIAiNzsyKDY
	xdsbLKKQKEmTGKszhvrH3nKmeD7iNaaezoWMfjInWccZh6UIKXW5jAWW1M998NJqq5yOiZdT5E3
	kp6KV1u1MQux2rXCJrNrkEtcf
X-Received: by 2002:a05:6a20:d48f:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3cb86027257mr488658637.35.1785865837965;
        Tue, 04 Aug 2026 10:50:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:d48f:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3cb86027257mr488615637.35.1785865837508;
        Tue, 04 Aug 2026 10:50:37 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:50:37 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:20:14 +0530
Subject: [PATCH v9 01/10] dt-bindings: clock: qcom,milos-camcc: Add missing
 power-domains support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-eliza-mm-cc-v9-v9-1-39067760dc3c@oss.qualcomm.com>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX+xOcpfhSTbci
 FGPmJsy+5XG335anlT+8El0mnyGOG/qQNHLbWwHpLC+4ndsmSwTVaddZRdL7Syb+rsM2jl3VxLL
 FnnV4eMq+19xl1gyKhBwUCucLyv2noxlCMpP1M8bbxOCIAQeuPGXhgtKOatFLwbrAAFZKz8CbjB
 SlskmtYCHKJOyzNVgOoYMdMdevYNq/4WMVzgHjxpuYWXzGCjqDWGWVIAxRhjKT+1f14Vylwexwt
 656xoqPXDk28ra79kBWkRFcJ8AMhpkpf4WZMtzOKuHZyDmXzsv+TNZpJAeKjTbTHW/hJ0ML7YEP
 fBxqgEMdSAtDCCAoFRBGSmavTDKhOZgl17Xypuqv0jgfHKC+3fexhpQeEHerKdFB6ykocjZsz2V
 WMR3R3sSjrRwiYce8D7+qNvHY828QHsMYg6cmNtCMizGRmKUQouUUTWIeMUm4Xepmhzs97XhWLE
 /s8M5jJb8Sjpcr6qnyw==
X-Proofpoint-GUID: hLRNDwn2xvHaA51pvDVbAK701YPixqRN
X-Authority-Analysis: v=2.4 cv=LsiiDHdc c=1 sm=1 tr=0 ts=6a722673 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=90z41mPHMHFWLCXoM8oA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: hLRNDwn2xvHaA51pvDVbAK701YPixqRN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX+JijNn45O3z+
 Zg0abch9R5WJ7+G34bzuSIIl2NOxE27soiFWwWtNu0STMUa+Gt9CDux3d6YQp8lWeTOazgQFMWB
 KyzPweznL5AOfHykaz/BTdjAreAYWFI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040144

The Milos camera clock controller requires the CX and MX power
domains, along with their performance state votes, to be enabled
before the clock controller can be accessed.

Document the 'power-domains' and 'required-opps' properties and add
them to the required properties list and example. Since these
properties become required for the already-documented qcom,milos-camcc
compatible, this is an ABI break for any devicetree using this binding
without specifying them.

Fixes: dbb9d53b7197 ("dt-bindings: clock: qcom: document the Milos Camera Clock Controller")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-camcc.yaml   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
index 707b25d2c11e601384b9b21b7e73bebf72c674da..c4aba40e316ca746c7ecc6955823c7d1292d5547 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
@@ -29,9 +29,21 @@ properties:
     items:
       - description: Interconnect path to enable the MultiMedia NoC
 
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  required-opps:
+    items:
+      - description: CX performance point
+      - description: MX performance point
+
 required:
   - compatible
   - clocks
+  - power-domains
+  - required-opps
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -43,6 +55,7 @@ examples:
     #include <dt-bindings/clock/qcom,milos-gcc.h>
     #include <dt-bindings/interconnect/qcom,icc.h>
     #include <dt-bindings/interconnect/qcom,milos-rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@adb0000 {
         compatible = "qcom,milos-camcc";
         reg = <0x0adb0000 0x40000>;
@@ -51,6 +64,12 @@ examples:
                  <&gcc GCC_CAMERA_AHB_CLK>;
         interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
                          &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
+
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        required-opps = <&rpmhpd_opp_low_svs>,
+                        <&rpmhpd_opp_low_svs>;
+
         #clock-cells = <1>;
         #reset-cells = <1>;
         #power-domain-cells = <1>;

-- 
2.34.1

