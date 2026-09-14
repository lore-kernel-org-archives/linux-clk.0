Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0512B347BA7
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390091; cv=none; b=tEo82VvPWt0V/0jU7emfXHiuFPssL7sx6gWGFocRRBE5t75RvZXNqvAcxatCJG10HMg3m1NtALkRK3rwTWBg5mibpHAey9F2ZKzTgOUSp1lDNjONNtFhZYwwbICbjDy7dwiQeipXMQgilWNHeO/S4pObNmnof7ZXkV2JfNnNcaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390091; c=relaxed/simple;
	bh=N7jnuq6C+yj5oLcd2HXsBFAWD0MrczZna9mzhZ9Prfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gvpwe8CjZV7rE1XuxtfVHQfbipGzfqpRyZgiDs9mQP7BIJSnRxy5CiXhmTL0vs3PlUXAWaquRaHQ+xfI/smVWqrV6iRT1iZ+6l9N03z+T0gzLG5vfepDa7wcAwmM/GMzCs5WoQsINtSU+ITwkZBtkkMQ1oK1QBcWoQ8HRyyfxFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D+yREEBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Htbw79II; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D+yREEBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Htbw79II"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRFHB406691
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+0L4XoA2dQDE/N8WbaNlqkad34WXHbG8bzQOUfiNGZc=; b=D+yREEBfmK6a8uQB
	Fec4cbxw0qGgpC3CKH8iZD8WUKMjbb+3GG0CXjmLH68oaCtymLS4sNBURqcQ/vhs
	nDrdCcbmd3ghHdms3NfXsb2QLiqC24qi5+ywg6dPP/MP0L0h9QZ8GV4McFQWhtFt
	FurV4CHnZr6JSfTiKyY7rBI79k6q+yOflVOiM2iBIOl6eA4Yur8dxJgM3Nx/ZT3/
	QO+XYgwa953ZMpz3jcGiyW07SikVE4hQAa9ItnU9C9ghqtarq1b45MjJB939Gxmp
	zfwFTHa+J4ZzYHuun3tAXvzhYbfT7cSVd8oOPAPMpuXFVQ5j7QyyeErxdv/ghbTz
	/2mxmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr865-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939a6937513so503776985a.3
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390088; x=1789994888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+0L4XoA2dQDE/N8WbaNlqkad34WXHbG8bzQOUfiNGZc=;
        b=Htbw79IIsYZ6Puyxv6eM7yXChgNpS6nLId/fOqOnjrKUaEkjIdrV0DeMyV872OOvDW
         VCITCclnOgS4Djt2Wi9/QQo4rG1c38Mea4TeB4vCPcNXCJm2opFAynEA4fIcbro22Acq
         p/Y3oQLqknG1qisLJJ1pWQsHNxPQtVArx9xPVil6U5XBBs5o84MCcgqo/YjK8w8TVaoP
         WxetKbXICNaU58ChQ+Gh66cppOsuXuVVB5jyP81n4PqeO7txe27pIyCg+hPC3Tx8tjap
         6Mbf2+8nYMk4e6w3IMX8mrBLG8B93IElyRRD/gxbQ9sdmbkha3y35SnzHjFhjTqf+j8A
         ZgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390088; x=1789994888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+0L4XoA2dQDE/N8WbaNlqkad34WXHbG8bzQOUfiNGZc=;
        b=Vu22NCjWldkm2QT6Q3qt3MCzCefqs59nkUGmUpbzF/fgleAph72A53ndOINRaWFPFl
         rLvVdvEfI2W2pLxMCU0bx8yR4nZt7fkYAd7AUR0ZFsbiPsziH1XhwApRSEaUJ6xd5ppr
         hf0MxmEGOGluE571fPz+lA2KDAsffrxOycHasq5JTcOWzsfn2eWffdAgBNgMyDiRn2dU
         2CLya+S8UjQxLohwt/NvKtW2oJLS6r44l0aokONE91LtzhuE4qOgaRD8nRe5+770JnmV
         0IaeJn3FsvQrj+k5fhlbv/ctjZIhKZJH/q1tZjQkHRBlxx0XU0cLj5vjPF771UNk2xiW
         Vv0Q==
X-Forwarded-Encrypted: i=1; AKwUvBx1diNVtdfQ4K1l8Ou07YoC1MU+RttDAayGEzhF4Z1dVnKcLlTjg1INKMJPiiUqIbq2GJsyuRC54mg=@vger.kernel.org
X-Gm-Message-State: AFuF++lureqOt7k7s6T7dg7lJ1IUKTUjbrTBJ4SBmF1VodbGCKONFuVi
	DogsDLGKaRo7DMdXFyKNb+1rbOMhuC8V/VDv4oDFczhn3eGb5gmMBVqaFWGHqIP23H0/Voe9kZT
	EOcOTEDJfXBVtqhHhsKUaOs1T6HXgGKVKGYVKR6JGsHH3eU3ja7QkYeoTCl8Y3m4=
X-Gm-Gg: AYBFou1sggQqJofDjKjL7gPCb81cCaud3VPFoy6fFM6EUXP8ZEodSljQC4M+eVYEdKd
	hhgPnwS94syYQWdF3z959wml/QEk+pwY6H4QV23kXLS5JPOxwp+qQOsMsuskBnx18B87pgT/bvf
	WCiV+JtqT4Uyy4Kj3PFTF8FfBTvLW9c6ymb8weVCVWDdjeJv5LKFe/E84I1kpDUnntPe8u3Nlfi
	avVXEhE3/TN1BfGLur+NiOn3Dc5roLW4LWuDBBfJQvly9P7pxBXY3HMhkKD2I9pRGbzotxDfUhF
	jYJy21N9iKny5sz2f28tHgoY/XynlgktQsllyY41OoamjSryD618XbxoL3BDXbP9TXKsA8VUy+H
	k4TzE1PaY
X-Received: by 2002:a05:620a:640b:b0:937:2443:341c with SMTP id af79cd13be357-93a29a92df9mr318081985a.41.1789390087730;
        Mon, 14 Sep 2026 05:48:07 -0700 (PDT)
X-Received: by 2002:a05:620a:640b:b0:937:2443:341c with SMTP id af79cd13be357-93a29a92df9mr318072785a.41.1789390087093;
        Mon, 14 Sep 2026 05:48:07 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:01 +0300
Subject: [PATCH v4 02/52] dt-bindings: clock: qcom: gcc-sm8150: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-2-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1496;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=N7jnuq6C+yj5oLcd2HXsBFAWD0MrczZna9mzhZ9Prfs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zNAg4X2CpnnBqf1aUODW3dQgnRGDe48+cvw
 ule0n1coFGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfszQAKCRAbX0TJAJUV
 VkJYD/0bZdZ+iPyF8n9s5B0ICsQLAGpxbWVuyIPl9//aymR3YuDJmz9mv7kj8o2HM3TNg6S67Hj
 gtyxnBqW0agbwlFMHknFg2lhZSlJdI3GTDFWpkacMKyOTsmESEoALVK6EmI7RDEEo++Lt67yJxo
 37dRAdFmtF/O7r1yOaW0c86wGHMzBksLrHo/h18a2QFXyCcQ58Xhg+uzCYvRJ9d/cVPY84L2Af8
 XjJAdG5fuLHK5c4ye7OOyRXuO2XBvfJ9CXrksqv8Y0vTQrvG4CYgifXlcLmOPtEGpqLBsN0nmsu
 ++5ShBq3YS3+UsaAbIbRi1erWRfxcrslPjUlca6M7puk+Bp5InInfiKfsfz2b3v0QHbQ4JNGkuJ
 f6V+v9EzQe8RGF45l8Lw9gojx3C1m6losmeMFSoCErr+eIlFeQYBg00LLxMchcEVCEcm8Y5jALL
 VAZTsRq2dGPKJbhi3AGgItA8WP2runOxl348hmDuzuPrmHXdY4k3Ih3o6wIKEVOiF27Z6mcxgRQ
 R84afuSaHJ8IEQ24m4ZIBbCu/UUjIfbjSCWTeD4FmWbT5pPh+33iWcgqhNOxeAq+jCGoICV9Pqn
 apWm0lKXeuvVg+r728gYD5MW4Fl24q1G54pREKLumvzdbdWenZvflKjHsPe3ZfRDX8XgQ02Dpcl
 yzP06QncIQuYarg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 4bxgLazhUl2Q6qGbrZ9_yLMZmd8mVjv3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXxKrYuY/Pj9kf
 +bB1pMbu+e+kC/qO0BRKapZ9Ing/Ux9Lc41hrpbt4GzWVHAVY4wBcnUCCpee9xBasnMUsTMhdiM
 UqAAz4qMggMLQnaWZPtjN1sKBQo8A7tI1QnPT3z0rS4Li4fkUO/2xRBcZhstONOyhKdfSuu+swy
 NGvRjFHGBxibZb1WW9n0+mRlWPai95dPDRGTL+n7GyjkdrGm/OoenTGeMZUMVnsxamw8BZt0+SC
 6zxjpkiLz4hn1Ie2fbQFSz3026F7YyVKNDUmpOay/5ne18rF5fQT6MghzqCHMgwVU3nMJoepW5O
 5SXRNas62wOjk5PL4IfbEi7iW4Funz4ZWRZoEtntsaA0jxEgk305l2TLvNplZqIl+qq2DLsxaLp
 GL0Cu+mHRUMgycTdictK8cl1MmR6S+Jx3nkuYL58RC2qKMxMxcYUqS4HVlrZbUYtTh0WxXjcwtE
 YlQnuapMp1MmSoKiEbA==
X-Proofpoint-GUID: 4bxgLazhUl2Q6qGbrZ9_yLMZmd8mVjv3
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7ed08 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pFmz-OvcvwPpwNjHdmcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX/Bxnig7dcRtV
 rBjDZOShW2I8LkpET8o1I51QSIiS+DymG+6uSRCtE0OoB33Q6mYhZnrm/F2ThXjASuEhYgQv6de
 CQVc7HA1jFlSVpXpjvOq3cPgk1Sgotg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

Describe the CX power-domain dependency for SM8150 GCC and require it in
the binding.

Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
index 5f3f69fe9ddb..82d67b0d82d0 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
@@ -30,10 +30,15 @@ properties:
       - const: bi_tcxo
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
@@ -44,12 +49,14 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sm8150";
       reg = <0x00100000 0x1f0000>;
       clocks = <&rpmhcc RPMH_CXO_CLK>,
                <&sleep_clk>;
       clock-names = "bi_tcxo", "sleep_clk";
+      power-domains = <&rpmhpd SM8150_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

