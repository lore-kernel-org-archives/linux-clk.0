Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CD23AEF28
	for <linux-clk@vger.kernel.org>; Sun,  9 Aug 2026 07:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260554; cv=none; b=BLUsKMCMs2x0qC/7sZp0UXYDFWnqR7nSqzQXS8TXBfAof5jprfUu+nV+2S3GPNPqD/Onj/+V/VBP7z08VW7QOTAAsTNsMH7ftD7XW36E/ZkSoMbckz/SHFIcwqpDmFbw/ngSQIGNlA7/Xf9zI/+JbEn/lIE9vQShWYWm2RWqp8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260554; c=relaxed/simple;
	bh=yDpptoQ318yeiKfxnWYGidGQj1zxMMuKvU/iB4nvzIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dbruNY6Wf5Eih+dCgUQWrWU9av9iOzKpIZVBGg4Mro7ICWcu/tTtoFUzZFalcmsHnXrX2B8WSNV+6Rq5vhl02cEffcmaeBji6r8/70dhV0i8bubmAgjE29u/sIuaKHyxHB4FYVWdqYBh6lZVQekyTpk7p2kG3whzM/K2mOQ22X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ctJwLSET; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OPi02dT4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctJwLSET";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OPi02dT4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6795c3Mb2453950
	for <linux-clk@vger.kernel.org>; Sun, 9 Aug 2026 07:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aXPd+43Dh8ydYhJdKmNR5tHhtLLvvzjeXJ3yyeszk8k=; b=ctJwLSETjF7l86tS
	pbvFkFId+/0N/cqd+m7hp3/Ggv6/aLKx03hnTwJDaZsk1tDr/geyZmDg73hfFLbA
	mpm9eZNh6iIZf2PrZPOkzaJDNd7hhVOS1KjONrFWGUil6L1c7gs8yku4J7zR0VFX
	bIUR5JvrYzWK1gOTOOFhcXsayHX2pWdezknqvRM1R48/wdRK2ZITB9Y2LWCIdeAl
	Oy2puPinlKPNTOAm/EZFy33bS5AMUdgf1k6rBSNAI8rOAk4nUoKzo/hUf8hOlhqe
	cKHEmnfyl4W+3rhGDmaJybu4FjDs9qc7vzOIWisQIk9exyAe3SLlLiLbBHGrMh4I
	L4z7wQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwudqjjw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 09 Aug 2026 07:29:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso1156329a91.3
        for <linux-clk@vger.kernel.org>; Sun, 09 Aug 2026 00:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786260551; x=1786865351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aXPd+43Dh8ydYhJdKmNR5tHhtLLvvzjeXJ3yyeszk8k=;
        b=OPi02dT4hR2UdSbQx7R4ZMq6Bgi944kmCq/VHsAOFv0Pqew2xu6gs1qRm565ljJZZ4
         LtnhTivfgbkgKnrzqcHf2fRmyssxDFHZX16nZBjX3cVCziWrwKm+rw8jsWq+iG9bdLJr
         MsOEhKVe6nqXCOuuz0tyHwClmyg4LGxEJjEfEa0z1hWZ9Ysa+IMN4TVHinQIOrtls+PI
         6bETzGEWq9+VF4WgZPIPBwp3Oru7LYTrbNreK+XuBn/kg3fcgO3da5QPU1SqdXah0d7t
         o2SPirp+J997j5TvTD6n++b6mQ9sqzHm/oKDCjqCiH3HcXCG+e2GC61wEhiPFdwsbtvP
         MpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786260551; x=1786865351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aXPd+43Dh8ydYhJdKmNR5tHhtLLvvzjeXJ3yyeszk8k=;
        b=fgGQ3ECTkmEhEksg63euyahT4EQpghCdE0pP21Qxc5z0txyzJaBLtVCB285stIma8l
         XgSEj3ZAjc4PmZkkzQSB4zZZV04s0b34hE+DNdF7ueOF/2x+BlKk+wZWf7belLdhOlbK
         Nf/csFao3XRbTSrRumLaF6QGxoZ8LeHnlTh2nwn5naBKiqHFgBbSfBTvXO7yOWSkoG2H
         +Mb8/vkvbCS7BPLcEd3rMgWAUf/2DwPL53izLm/U06VBMcJqRmge8yQDYS9imlQM+qX7
         NyjuX2lHxZxYTvcTwYvjDPF7wQ6A2qMhS/M69ABrDCEbfkWZjYQvzjhXA6mEjo9krw7l
         gYFg==
X-Forwarded-Encrypted: i=1; AHgh+RpyRiP+H62ufcmHY5a3KBcpL01O03lPfPCwQegpAqY3AfWdoHZMM/FXdr9dN2LEtoyCzV5HneltJ14=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGodDPMluHfOD/CwF/20eJUGo0nodVQysEn/8qS6V1sS79/zaH
	Yx6MPm046HX13d/q+qd6EJtBbvsTJr9WdLynKhtsV+EoZGxi4IHelUhgP0i+yR9tBWpiiknVqny
	DbG0xEg3ZqVWX0wQSLZlUKCmTHrHcm/q36FqWc4/GFD2+QIjbfJz8XDG6NUz3PMQ=
X-Gm-Gg: AR+sD101T0Dt2k0ETNVkkpTCKOUK/1b+n7YNTQvBFOPZOt7I9hLQ/YgyN7W7CNflJXL
	/zLD+317okza2+butO+Be0qWXtmc18myAV08GpC+zUmzf3OpJSMLi4+sQs6+TRv2ZL/LuWQ7t+c
	gkHT6m5ikbK1YPSHMu9TAXHQSql6T1h7Ro5dXEnkNV4SO6Ay2/MHKNPB8NlbcQDPcrjfVxZmsOL
	yMtGnXkllLFXTkqm4Le2sRSRTHJT8ywQwysYD3Pqq8sUc8a99jDhiLFHY8fchTB3CYFF+MP4fZ4
	TxJT1KUutc+9WRexk6zBEHgGGe9nEZpYZDMyShYvkdAzMwgAlo1bWRpIj5GV2bO2eJP9ocVMPEp
	JozTFCeR+QD2oZ91M55vUUnDwM7Xy3aIUWjepTXAm7L7P2NgGM6kU6DK69N1MYsD3Y+x3wJ8t+k
	hq/n4rmYRly4eSO9Yy4SzzrsY=
X-Received: by 2002:a17:90b:57cd:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-392823c808fmr10796671a91.14.1786260551114;
        Sun, 09 Aug 2026 00:29:11 -0700 (PDT)
X-Received: by 2002:a17:90b:57cd:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-392823c808fmr10796652a91.14.1786260550644;
        Sun, 09 Aug 2026 00:29:10 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm22655630c88.6.2026.08.09.00.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 00:29:10 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 12:57:13 +0530
Subject: [PATCH 14/15] dt-bindings: arm: qcom: Document Kuno IDP board
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-kuno-soc-support-v1-14-5e0ede4a0c72@oss.qualcomm.com>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
In-Reply-To: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786260433; l=1098;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=yDpptoQ318yeiKfxnWYGidGQj1zxMMuKvU/iB4nvzIM=;
 b=ETosO0NaDHsTNsvQjh+VYCy2Raw6ZBUH00eLt9FfB9gT94ah2j8+qp8WWnxesCJ18renWtQoc
 pC1IdC9taG6DqoPET3Djr3vAVJoKDkfpUtJEFWxtKZETGDyNy+iMvrA
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX2jwIRJnkxF/G
 eFtkByqQzHurSYqSnIcbm4e5SrOEYPVFRoFlbojxUTSNqo2enVQo6L6e2oD/jP3A7038JnBCt8r
 xJjecCO08HTV0HL0+fY+FjcHq7r+554=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfXxg8ENMBvy2+0
 7bWYCriJLM3p30EWOE0um+GQs6QvZSJleKJc5DlEo244oevsFNYWm31H+1/cYxa6atqw3uaoxgQ
 0TbHKPsYfgBLiWzk7OE1Oeoe4inOHFUmDTXG9FHswaMlYgdyFLRXY01H4hyIU4UxCeLdZvffA/6
 q5MkwL/UaVkIXWrMkn7+K0eVUKDab1PT2SV031vTO6niNM+/1FCG3hybv3KqTJMo+OQBGzVySMe
 06c/YcGq5mf14HtOm8CJtgohQrc80yvyfK265SAurVHZEIsOAMy2zht1Eidxa/aYs4XRN3EHe8p
 RxGNlbQpFVMgyOBGFBnUAAI/DwO3g51G1rQxCrkou5RWBl5TlBsm7HrfiK9B2BUVYaF+2ZOJVGj
 3D5s1qyDPMKSyuoSUyO1yy3DMyY1lVdqo+X/JcHDg8vu+yqO8EX77lKpWlKc5xmFldQR3A1iZdS
 ctkGjc4fvzD/sbwb/2g==
X-Authority-Analysis: v=2.4 cv=BNCDalQG c=1 sm=1 tr=0 ts=6a782c47 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RWDngw_kE3xeK5VWhnQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: YLeUlqjPrFQJFNR8XwyH6jp8EF31PQBq
X-Proofpoint-GUID: YLeUlqjPrFQJFNR8XwyH6jp8EF31PQBq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090063

Document the Qualcomm Kuno IDP board and allow the legacy qcom,msm-id
and qcom,board-id properties for the qcom,kuno SoC.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c7c9a9279684..f87ff5d923f8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -174,6 +174,11 @@ properties:
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
@@ -1322,6 +1327,7 @@ allOf:
               - qcom,apq8026
               - qcom,apq8094
               - qcom,apq8096
+              - qcom,kuno
               - qcom,msm8917
               - qcom,msm8937
               - qcom,msm8939

-- 
2.43.0

