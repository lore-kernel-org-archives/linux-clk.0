Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A144D90B0
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328689; cv=none; b=plzXveTq8UT05kM4HYbSd9+UiOouwTB2ZeexSYOVcgYq4+hWp5dg3+ZBJl6ioaahzXRt5Vccbd1P8tsoQz24w2nDVdaxFVAgHeQHaR0sx3q6xO4Ewew4QZFYwwvVvv/iSt7jTye1nXS1DVfkRBqYk/EYagZ9qPxH9b5kuYRQilc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328689; c=relaxed/simple;
	bh=mcaRPD1yVE1lNbFj9arsqohiAw2BWUacERpzcyqjwvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HMRMlh7unOWidOdPr+c1MXQ0cTD5gz1cVuv18S+aPx+oCuYKLvy5ZIfB7Wi0YxzI6ksEdyfgCTx6WyAGeFt2vhCKckogqQsohuapurCPw/nL7JRfksM9MRHA0YiUyA1mdwEYxzSbitlmIyuiZoStF25u0NsDiF+KtJTO7DhEJXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OCoPJGGX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6gbQ3l1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OCoPJGGX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6gbQ3l1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFm5sD2855854
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	knkJrTiDE4SRc4qBJ0Ar/hCVAjYZAE9e1hRiGXLNN2Y=; b=OCoPJGGX7igyFx7L
	ze7Q6ck88ijWO0zgCDWL5grpQ8CYTsRf6T8Fw5NRWY+/9gIWHYJ/oaXY25t5xj++
	/6OXmeH0tfHJDQCU86+tPCxhIoaIfCpgtXP/oxvX6eYCzE3B6CweyXVW9RjOPQVX
	Vo3c5bFb8wVOND6wQqSAA5ytnKLRydFeNx7AeOA7QpUDVQ1e4re3P7/VcK6Hdmm5
	fzi+LKp9AXuO4OL5+Z2GzmlZnB4yheVQWLjbO8BwjEfDgj8YcNMsSg3LA+GrLO3+
	Sy+/TIweQxRzI/WWeTVIB/xKfxaCMArcQ7pijkQ1KGpXp9JICZrN5kKaFQYe9zYQ
	2c8+1Q==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gddjdw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:11:24 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a45b3f0bdfso2089137b6e.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 09:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328684; x=1787933484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knkJrTiDE4SRc4qBJ0Ar/hCVAjYZAE9e1hRiGXLNN2Y=;
        b=V6gbQ3l1dkk1RtQ76g7lSI5tu5bSAHIySYpj+n2xMZEIbz2HWZxvOLoAqTid85uJV2
         hfHCqQGg4b6eyMrjxmcPa/Z9NSa1Aj65YAkgsD1IrUrSvC0NtGdyKA7lp2g8mp6zmLuf
         pOuWDXPXDpeelGk7CD4wnkaMYW4y5hbuordM0DkDQtbCV26qXpNs1xYwYNO51R2yKJyf
         qR4qrHUwIZ35s772ILEyEngCcaCT+qZ+l5fQoQMO97QPr9vUKHNT9SaVG8fZeDbHi9Lx
         DY8wWMo2zSPk1+J9whC5TpEmXYDgq4bd42oQeTTaSCaxnKfGOkpQH9demsUaVV85smsi
         RxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328684; x=1787933484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=knkJrTiDE4SRc4qBJ0Ar/hCVAjYZAE9e1hRiGXLNN2Y=;
        b=mJ53zL3e8uBmnr8dG5Kuvqojx8nE0UOBqwQQrlTb0zU2WP4+kcbiG6MsaLOHFllOA9
         Dl/GBZTTkD52oW+dnhpOmSJouCgpyqL/je9hmV6sS3NRGDKlzsVF9/mJIXzMnE2FsrqI
         f6abnOCG/fCVvsZT+k6RSPi7v3XLqlF1VMno0PAnAvLRdFRYjuLyG35tKR3RTyUn6iNz
         Yn93ShjWCsvyp+91fuzNyLg9Yl/U9zEiRj6RPz0lO6i8ff6ilx5aJjqGjRI8o1Ci4UZN
         PyoJh4U71Y8SISAxnOcnJoWStlSxzXV1xwELtc1X4MrwOuNMVgoQ3IGt7wJYjGnlwexS
         nTyQ==
X-Forwarded-Encrypted: i=1; AHgh+RqfwHY7Al62yyuhikbzWgQT8FymZbjLKYBAQ30f8PYBvyGLz3NgWJcIJ55D7P4MxBgK03Zs3pvLn9A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy530SPbosvEaKVq3VgyovQ+WcjLhwLg6uNjp7F3GUOYx8ZU7cE
	BQEnlQ0Z7DnD2qIGlKATCBlUu6Ejd/0M2BmPm+Y2YbtuPPF7vAueHZuRl5p5ncVYk/c2CMzyq7P
	9uoGwzV5oEJov1DakPfDEibP8XG6oez9uXzsHwWJUdaWB5yfSunaJKYdekAR8O1M=
X-Gm-Gg: AR+sD12Qw7YuknJ3UGLfbSfJFi614HJDmVGqenqyLQuwv4pPIWLQj3PhaLDKhcy5diq
	hgMo7qndAEE42xFj5myz3dyw+rHyetUph9fKcyLJArp/p3wh2VLDdg0Z7tRKPQrOxRzeH9r0dS+
	HewdkqKfSh20KwyRuE/rkL5G07BaVIa3nAlxTu8lj48I17KQE7ScmX5aEKg0C9BSAENaW+zXHuJ
	aUP1bQ/+rH7skzciUV5hfJrEt2gF5IeL47QUEdU6GeLkRi/s1i1DyGKSMM4bAkCqFBXiVv0bRo0
	VdXWJeUPdpb7d0/k4pr2OD0TqHkiw7QiA69n+Hh14dgeGbV2XNRcAvabs8EacxdBqh4w6WlLzmK
	BoTJ1bXM3jB3ifg5IpNZsWHhewT76c5ilTLyYE0T+m/oF5lhKgIkuWZ8GJzMvT4mgdndxjbaLqc
	Fekz4Aw5SfrL5m9lVNCEAK5Rw=
X-Received: by 2002:a05:6808:13ca:b0:4aa:cad:cb4d with SMTP id 5614622812f47-4b2ef40c7e8mr7487879b6e.19.1787328683889;
        Fri, 21 Aug 2026 09:11:23 -0700 (PDT)
X-Received: by 2002:a05:6808:13ca:b0:4aa:cad:cb4d with SMTP id 5614622812f47-4b2ef40c7e8mr7487786b6e.19.1787328683448;
        Fri, 21 Aug 2026 09:11:23 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:11:22 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:39:07 +0530
Subject: [PATCH v3 14/15] dt-bindings: arm: qcom: Document Kuno IDP board
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-14-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=2248;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=mcaRPD1yVE1lNbFj9arsqohiAw2BWUacERpzcyqjwvI=;
 b=Hxd1KRhg3fuPoN/wzOapNCFMOpVN0UkreJGyf7jijbcGmh57K1Z7/71AU6X9faB+nSPnaT1+h
 8mT6dYe/TeVBYZ8bww9LHWpu5Jr6CksRvJkR49o+XgXXPxgcb2rDP9x
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNyBTYWx0ZWRfX7yQA8EUAAcyS
 ZicH01m4rQYIXPCnliLcrPrENlHqhho0qvtcwZYc1fBTOaF5ofoB7cKl+hcppQWpba2utTGLu/m
 fC5MpwmLlRJCrSk+tHEkYEAVMXCnU2s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNyBTYWx0ZWRfX6R405LAOUwHa
 qtRr2Zw6BA4bdfPKSISyFdW5eq+AIbqtmrn/UZNVVjplc26UUrgpNCIKXcyaqzv2qe6hukKpLL1
 oM4/aq98akweEqP33DGbSAUG73WJUjCTKZ5R5jmAjrq9vKj1eMmuoCAfNeSr434lkWrutP7ByRw
 cL9eCivKD/lS5hNDp2ep2SfNnOjIpG7ICfWihRjz+Z5vzUxw/LmFLKUZrJ7SRazpJOGvXHfYMI8
 fju5ngT0g5SbD4collOrROp5UkYwDUy2v3/t3VSNP5dzpVp7XrzuvQDUbkxYMVV9Wx5H0Szoi0j
 bIsMxQmK5yEeUrblBNfUk6tBVktvaOJ6HoIyYDFDG981/gtjiRL75mnKkqMCcI45QjiGUgVdiPK
 3gmWHuX24dwmvwieSWgDmv99oMN6GBLYilvCUUs9Jdbd0kzcELm8vVA7TLfE3KeMG1nuth8yx3Y
 hijLEoDSVlqvnq9VeBg==
X-Authority-Analysis: v=2.4 cv=ApHeGu9P c=1 sm=1 tr=0 ts=6a8878ac cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vXfy1ps2I0IJequeNBIA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: eVxU6nfBS1_WVpiCF0j7EHbCPMd29TFq
X-Proofpoint-ORIG-GUID: eVxU6nfBS1_WVpiCF0j7EHbCPMd29TFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210127

Document the Qualcomm Kuno IDP board and register the "kuno"
codename in the SoC naming convention schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
 Documentation/devicetree/bindings/arm/qcom.yaml     | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index e7160b63d814..179aadc86a9f 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -30,7 +30,7 @@ select:
       contains:
         oneOf:
           - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-          - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
+          - pattern: "^qcom,.*(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
   required:
     - compatible
 
@@ -42,7 +42,7 @@ properties:
         - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
         - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
         - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-        - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.+$"
+        - pattern: "^qcom,(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra)-.+$"
 
         # Legacy namings - variations of existing patterns/compatibles are OK,
         # but do not add completely new entries to these:
diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..ca02a2f0396f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -175,6 +175,11 @@ properties:
               - qcom,kaanapali-qrd
           - const: qcom,kaanapali
 
+      - items:
+          - enum:
+              - qcom,kuno-idp
+          - const: qcom,kuno
+
       - items:
           - enum:
               - qcom,mahua-crd

-- 
2.43.0

