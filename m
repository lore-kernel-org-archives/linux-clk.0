Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA38A476072
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246424; cv=none; b=AfQE+iOiOQy2scY068NSFONFj7tl1b1f7pCAcqL+eejbnGYrftKESbZnvdbkmz3/clMnm9MdWOec09XHR2UADg+6aKivDeswdAgxZ55vfno3VKl66bAAQbEFTxpKmtXJKH+hFbzf3aVs6plNNlOavj3XFv0LXzy9x1XUoYcb790=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246424; c=relaxed/simple;
	bh=AIEXAacqyi97GA2j6N+EcGrJcdQhhv3NZwqXVRI/NxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b1fbQi5lrdFI3b6z/XEZq1AzFx6JwEj8yTafEiaaFNsKuptvhaF4LTlrjZwNYOcoVpl281gFnC+iUduMubDH0B3pTsm1Iha0bdaTNh1tgOTmVz39pOwlREcRLgYKdCAfYmQvvRBQKGKOasRiks0SvTYmqPKJpDunS1EuiZxvf9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P0D8pC8P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OUSG2ZcI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P0D8pC8P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OUSG2ZcI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PLTc2919200
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	op+i49uaIACzxUErEOBE1uvPQAYj4fTZpwGEYxYcQQY=; b=P0D8pC8PB/jdsjkZ
	3fcBkdDybu5kTZ19br9kQB+zev2vbEqM+JPdiwXlLQU5xeeOcZdkW807M21eR3QS
	2VypzCeQHoVyj2fJXrvcT7rDDK1mxKbYbA81I+gSerAd10GNzress1prJuzNGxb5
	u2zkXotEtqVN2FXXsJRZD4ffig7NKrqnm8DrjFjw8lYWobqy7hA0FIQK7laGOmws
	FQbsL41tlAZ3gVbWtyy2GNtQLyQfXquByVQBAp+iz+MSVSgd2OAeohjVp1MXCogY
	N8zYBMlHfNX5hk+va6vBOjq33E/46F9YQstOT1Z81tDUB1ji9Z1wMcxe6W08zpPl
	eTtd+w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstuj4ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0b66ecd9so232601685a.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246418; x=1790851218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=op+i49uaIACzxUErEOBE1uvPQAYj4fTZpwGEYxYcQQY=;
        b=OUSG2ZcIC90jmPndmzPUD22QdL9RFHm/L3o70TFapJneUoGuBpugqg7ecNfzB35BXU
         vsUBpCePLFXyi2Qg90rpEhjE07BJDkWJteMw/K9npO+RSBZOIqllQVA3wsIYADTxfqGK
         SReU+SEJ87TDp3ZYCQjjdn+N904N7y8dKZlLzb+0dKU8oEnhkvqSsG6AavUVBN297AIt
         R3iyE4agl4Eyo93636f5Ar/oA4NPdDy0E4EpfOZMrjCBohatU0377PYMezFx8SrJ2Qhc
         RL4/2uer2WUWD3Mcco6uPm4CgXzhQ/tz25BYvG3fc0blHVuAyv8H5Loqg20g/VF5N/XF
         IQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246418; x=1790851218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=op+i49uaIACzxUErEOBE1uvPQAYj4fTZpwGEYxYcQQY=;
        b=SGr7aKcoM4HtUYvkzDe4t5p5fHIS6zoQSqy9/7we/Brvw4uBORZZoFUD8Q27DCJSgO
         Rk3YIJlxBDJOirRWjN/ZyhSxgNTiipDhunYmFt/qrG0qQHItSb92MOLIZRJqVVNrU+P4
         fKt89zb63AQ3Fmbfu4UUG+oCKJ4q6DY+B42PrQbJNw+58V5TA5byPRHIvyYRZCHB/MkB
         FuEg/Jbg8gyTt3BSrUUmHqnjGdjmko3ITW1IVVJVsUzoxjxUGeR3qm/Ecvs+nHKUIs1t
         d0+hEGDizS/7hrPGCpbipuM12pHznb/obO4szvzK5BICA4bRIAtXPQVa3qnSdSsGBvsx
         owHg==
X-Forwarded-Encrypted: i=1; AKwUvBwxVLfeHp+gUPWVT9RB2gybTs0ic/vzwSSK3y18yY18L+HNebxGkbgfES0eP6NTIFMpfIu3do0aKYM=@vger.kernel.org
X-Gm-Message-State: AFuF++lwB1SG7f8IXnXv18Y6Is+GuFN5ZC+SF5Q3KEJtuW4PxXYrYcKb
	VotTIeC5/5JiItikGxs4fZEAJkCCGaVxUKU/1JxAUmXp0lu/R/fGTYiPLDiDOL7u7lHRMTvOkKJ
	0o0gWDH7Za8eOIh8UteUzIAuTsVRmzqoydOkTPLIidCUqZszZ06MnWCdlo8G0Ngw=
X-Gm-Gg: AYBFou2bOCkKMvptspDJmhdGsTXkCYkuRxpELCVzDx+8/OwmQNI3u9bjgBXEDIlBfUy
	hvg+ETMdJBWPCRrpVFbAQe8RYzSxfjU0BTDQ/8uvuP/4VgPJ4+cZqq/lmBMyeCPK9l5SnaaVALo
	NqonE5pPJwjhFuMy7foelvua7euY3moj9oGJDII7tlP2eQo9TL6YSWk1d/QTCWmkhc/5zLkEUP8
	gErf9nDw1K8z7dyUagrpDTcS6ryretu2YonmNJ3t+vWUuFdW12uFJY9rbNigHyw2VSuc40BIl6v
	tnyN+knXJE/P/9mtEZB+yTYJT4R0gvWl50qVpLq3Uk3EKMgKM8j0f8FlHodjzdpoO8mJ/ypvjtx
	OtmTt1sQd
X-Received: by 2002:a05:620a:31a4:b0:930:9585:e08e with SMTP id af79cd13be357-93c362b2742mr229042585a.10.1790246418042;
        Thu, 24 Sep 2026 03:40:18 -0700 (PDT)
X-Received: by 2002:a05:620a:31a4:b0:930:9585:e08e with SMTP id af79cd13be357-93c362b2742mr229037385a.10.1790246417381;
        Thu, 24 Sep 2026 03:40:17 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:16 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:19 +0300
Subject: [PATCH v5 03/42] dt-bindings: clock: qcom: gcc-sm8250: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-3-38732033e5b5@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1785;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=AIEXAacqyi97GA2j6N+EcGrJcdQhhv3NZwqXVRI/NxU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3clsCNiIvFJg185U7JJHK5tk1sUx9CgEy5P
 4KDodOB4kuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT93AAKCRAbX0TJAJUV
 Vq7RD/9sJOUTon55JjkZ/j7DgzMtIgV1/oHM455+t0dGpgzXE83NIjGI/vaJlB0y/Y05PF7YyaC
 wgWto1tRRWn2goHGyvQmjAsPwKA32+qEu0U5ksP6nbO1rrvnfWw2PdsrjJ3Ye2a6iRgKQZvq0/f
 Qr638b0hLPGNbGjXmfTo1cpg+htJmCK90GUttMiNHGTQ4IdWPDSOjdG2XhA6c8J7qe2toWAS6Ce
 snR69yzvFCVi8a3vNY6xSRKIyB0o1BH/IQIoWQtP+xWnuIcoD78riQjcXZCJ/zbq2qiUVCJOMm6
 ET25okdzr2lj6eybwW8N6kGme+wUgDs6hNV6yXDCAblsMx3kRXm20oqR9qW+T6C8KGZx3jiiMxX
 x+cFh26lEI12Nrg5Mfc/mXkLWsxHIphRsc1LTSXq/SBz+A+74QfVD6W9uvTHZ0gZ+x8JdyUq+T5
 CSG3/b0+DRoLBZxDeziqmNHVxwt9X6c3fLn5wfcTrLeb/TEGEdI1mFIb9EkgtfWzjgwizm6qzkB
 YIwYkbtWXTOth/780hjpPJ/IkYRwk0sQ/I5gCwjc/kZ3k3nubsI7tQa1BN1RUav3ulH7TryWyId
 RPegPbIrIzNltlDVXdH0s6QcHukbOTHOSndVRCIhqhn1Wfg/hdMaumSXU2oVzwF9cI2iggNkYo2
 vvobIiVLcdxOeUA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX7vLzUGCMs0hV
 CEREvG4yEnAI0NI5WAkxtLJPl1SxnL8xmth9utiLZwQmDZ/68xLcNX9Igx4YzZk5nqeWpKt6fHc
 HmJxz6hk3evLZiXtcyjl48psz36h82Y=
X-Proofpoint-ORIG-GUID: 9mxFLQ30MCiZ2v1lA7aTUZsww3LymtFz
X-Proofpoint-GUID: 9mxFLQ30MCiZ2v1lA7aTUZsww3LymtFz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX4G/sBuT0LXZz
 PNjUhUKL7GY8O2Ruk3a/dp1y30xMdEG9M07O4FddSP2jtxpa++ANUcLkXWp/miclSYScxDO6+8x
 uSg3rATkaWHo6jLfoW/qyzMkE2w963z4AbfGTdmNBeT++pohHQtIC2qfEj6MA5P769SIj3sg7q/
 D5bJn34TUFnlzLknga4i1qXYimC8wp9Xhsf2QIGxZy+1qPAledcIK0QC2KRNWjFKfe1dJnfh0dM
 Fn94OntuamaSZvtqeqIANDx2J16XnbwRLkY+z8aa5eDyqX/8VS9BhKfYCPPwya646FUmkRskuul
 klSEkQT09sZYAUcxcd8j+kkUtG3593KnfqTwDih6/s57qJelzrnufrJLYOLq8whA3u9FdMde1PU
 BZnY1DVBFOvfbtyNhbx+UtnITtupssNIaQxTPz0nsQzGIUuvNDQGOp0T+SJY+Q/4bJ6ke3JCrv2
 tN9yFhGF5pzPlF2iltQ==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab4fe13 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

The GDSCs provided by the SM8250 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

