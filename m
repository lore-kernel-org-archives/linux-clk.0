Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0274C6EE1
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328677; cv=none; b=WxTDJvqWwBxc+YjIbOQ6NT1uLf9/AM8+Ly80Gw2sS5ahz3wQ+/I5M7/tTGoveDh+c4VBDNtcCJ9vR/X59WRUMJGwJ0xGsNwnaEonGhLN81SzS9kVsFxdk2/gWlPjOJj653Onp9yHrHh/9keMuCRNzYcn/M5mhjVC+7WC4J2SIw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328677; c=relaxed/simple;
	bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ThGGvFWEuqBXF1xIFS/cNSy0MaAn4GjhROF6b5f2TV4mo/OpVhbl1bio7dOP5hPyrhoRhDqXD4QShJFwNNkIOPzycoceSeaoHt116PnOs3gJzGBCf4b9Tlqisog3+xhBYDRPafLwJjzwJ4F7nzknt07RPo6eZeb4kioKUIE+OmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9XAmLb2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cDZBAIUB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9XAmLb2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cDZBAIUB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmJxl2322939
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=; b=d9XAmLb2d3tEemEY
	/SV0V+IgeXry0mDhpnxfXqW1JuUmV9keyxYmh2XiCUi7KJ1FHXQcEfrPWSo0cwv7
	3vu+37Q2Vzu5+aZnKCitDbG2XLn7Mu9tONdEPOv8C/NARtsoc6Sp5UclXYAKep+B
	Hhp/D+/Z5TpHpiBNJf58LQMV37uLM5NKNFx/PMKRAMETckK7W/JuYzELNhatVZsJ
	QSvk7ofCY16GqUI323X4Dlpeu0n34jtuj4ezj3RbQuj7L2XLxaDEy70Z1pMWB0x0
	C1kHPl7BWWggG9Fhf9PVozA/NZay7YJ/atuBya/jXZXKuwLQ+B7BlrrGvgovpYAB
	dvx+pA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fbwak1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:11:15 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b28d7ffab0so1852831b6e.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 09:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328674; x=1787933474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=cDZBAIUBgqxl4HxOqUuLwg8GfBYw2hWub2BwpvMWVMr6jRJKQViVXctVUaF6+bXusE
         B+++cTuJqx+UQXRoaCA+QksMNtq89OePM+ilox8t5wcBUpxMMYE4czESAVW/owBoLU9u
         wVDPQc8csS0eGOqPsUEw/dGH+fHdgGOZUV/XYru+b6aPvUeolW8VPU0Y1zj1dV/EKfU2
         ZWYk2+xmSvjaTWPmfphV2B4xdYLw+zI9NK3R2A6ZY5aaU7H4VUDZJsSRLPYzliAQYzQj
         XaVTo0Sy/QzzOu7PcVaECvvZbsssas7sshpdhv0chOmbJyL0S+aQqjyb24sKFI/6lRpy
         yIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328674; x=1787933474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=Ylv2wyEJCIyq+PzK9ZFInCYJTdanPFimqxik9FiEJQ4+28BZTJDKCAtO/b9zX0cREt
         NFXQ8Fq0sS6x/6ZCEg3nionZtK/hIz+CumV4HGxm/dyjo0/EUzRAI+lIAYUHbvoVjJ9Z
         i6ieE/GSjU1qLPj71OuSM/W9O6cwFrVkle32FSNXM/og3VZPcuB93feq0yLVH8U8dyLF
         rmFNE18qp/C5YiJYhpderbPZkqH2dbOZ7nViDoFWPXXGwY5GBRT3FmK3M/ipsOIQywGK
         Yci96CavwUJOUJygv8Mu00/8KDCxu6Bwo+5CL0lRQZJ6O24Rghx57cpjvE7QQnF9tlFP
         66+A==
X-Forwarded-Encrypted: i=1; AHgh+Ro5V8C1ov7VedZIxxChis6NkSjZi0TQCnuLwdI5KWej2jJW/H5eXA4uLOSV0khON5UkQU1BrNrdr8g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw6TcyvIhY06ywwHVTm2Nsg+75bwdLjwkJG9BxQcbJDd8aviOZ
	9/Jd+jNg3IoVzNbF9KYO63PuAYP55ygUb0WHKHhinqQRJ2lf63vVJVUU5+GMGNWkVw8ng3oY106
	ioE5RXXIX3RJamlSW5+Jezr/ebQhpv+L+QLU/oghyZXRY4VFuxWSx9p3WCuPKtkA=
X-Gm-Gg: AR+sD12zq567ZTNejGNxqJ+1KHdWaSzfXv3t/tB1bVv9X3W7i5pd3iVFe4wyvQRWwKD
	MTRokgq1lha+grfVIhYTpUnxf7vR9WkFZSSEvv7RE+YnGPh8sEXUllO3nXgV/C2lH6uRCA5iIiN
	36zSMNEjQ/1VBXOauDX/1VbLCyPH6bjB0Z/dTzmJTPQ7B9LSpkvSk360NwqLcNf0fk9geEXqnBt
	keoPpBAwH8Cp9zTAdrMRsDVDkGX/auhEG5tKoXzSaO6J8mYZtFwfggQ4OUdhMY/oEPFtyj3Df70
	8p+0UyiWNzCd27Gh0vLa0dTx6kx1qZpCE0D8tHhL6lBOa21FYKCjqLG+u6lWVfokbujv9jR8fGc
	WM9rWMbWYV+nE1gTQDi2gPA3NHxJUpZJU6KE/X/+4+b9HvlKYiPLbOlJ6YYwXGXt2syWHAxw5Mz
	KYoEbcoAOP5694rOAs/Y/lCFc=
X-Received: by 2002:a05:6808:d46:b0:4a3:26e5:cc02 with SMTP id 5614622812f47-4b2ef33a94amr7457114b6e.10.1787328674346;
        Fri, 21 Aug 2026 09:11:14 -0700 (PDT)
X-Received: by 2002:a05:6808:d46:b0:4a3:26e5:cc02 with SMTP id 5614622812f47-4b2ef33a94amr7457022b6e.10.1787328673861;
        Fri, 21 Aug 2026 09:11:13 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:11:13 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:39:06 +0530
Subject: [PATCH v3 13/15] dt-bindings: firmware: qcom,scm: Document SCM on
 Kuno SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-13-196e2b306368@oss.qualcomm.com>
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
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=871;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
 b=Ag3di3btT/XFPjezWsEE6sVb9FnCj3hpe8zj0J0Q0SOouAab1EOy4dpmgGa+2+2q7vu1xOsD6
 WyI4wCSjoG1D/AfPoIgDEjP9SKXjtAhxL2dv3aPIUrCAfJUfwsb3ZKm
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX9g57hBpwLZ62
 sprEhDjs/NUKeY7zf1/VpQDspDGM1EYp92SJFHogf4MlQ1DBgVG0T1I+qeyv50X9cDKkF5zPpS7
 M/hs1xODSrIhVF0kT+IfhzxlJmMaDrE=
X-Proofpoint-ORIG-GUID: CCJ0QkNt6ep0ziT9AM4bfpxrHVVkO1Rw
X-Authority-Analysis: v=2.4 cv=L9AtheT8 c=1 sm=1 tr=0 ts=6a8878a3 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=M4Tw70yJP9P6qS8g1QAA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX86+IwVvXE+IZ
 GjvOYwXLSNy5VzcmzYAUdzNs0IPIBs7M85dU5NaJTqlsPYgwdfJSN/0N9gr3ajZbFruS63WrOcy
 epGfagoxfoq3mJ8H7xEoN1JO4enAcZHFcozjxqLWeVxN43LlHUNU971ZLO0NJPURbKRRADdz8Rx
 WBcCwSeYNCoG5uRXx1p8QV+H1tbFuOIO5t9qyj+gxwmJYW0xU+w0COMMoQQPOXWWQwlOE2PX/Ri
 JMZnwH/tmjosmngNP9ck7eXRpJ8vHgvKbtHhxGqeTah8FhlZu7xegSesqdLN97TERmvbnihQpyc
 2SrSKFWxAZOjwpFI+U4VQ7EyR180kgiFimQCdLX3y4J2JkQW9MFcv5KtDo6RxRSC/yqfaODEInd
 Edspiuga/yNRWtJ54MrSfMZDhUJPItWAj/ebM23NKY2Z3umh7atK3YAxS2OpWlwH1DQim4WmoMx
 eexNQcfF44M7WKc0rig==
X-Proofpoint-GUID: CCJ0QkNt6ep0ziT9AM4bfpxrHVVkO1Rw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126

Document the SCM firmware interface found on the Qualcomm Kuno SoC.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f718..ecee5aef65a7 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,scm-ipq9574
           - qcom,scm-ipq9650
           - qcom,scm-kaanapali
+          - qcom,scm-kuno
           - qcom,scm-maili
           - qcom,scm-mdm9607
           - qcom,scm-milos

-- 
2.43.0

