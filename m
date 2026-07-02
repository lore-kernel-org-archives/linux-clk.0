Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9358334F270
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 18:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017198; cv=none; b=nvb5fPB7g5G5FBOspxm12D9SX/HDWiOO66/W7Vvta8zLrND3AyfFbySbOuuVSx4VocjXfGKBT9hPsOzvg2nLZ4i6+gHCn3Cu7gbMdS/nL3pDKkGm/3Fz5Hv/B29FrNSEalvXgi/sLGQYqCKHgFxUQ+LGcRmDQGgzdpGOV7F9DCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017198; c=relaxed/simple;
	bh=ODq7eDWthtMnI0q0/3/kj+6Glk7zuFnIIQAuCpzOJks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t+0c1GM42xpnahghHE/AUJ3JaHaAwG1zyrNdJONF+MQr04RM60Fd7RIuBx6Lb/c6OTnF/55k2rrYD8xN4UbYyOnJEmrqEmI9DTOi8CF0HQZC4Txh+uqToYjm7kCE8AFMLxg9cDaKhRbTlSQhlyz7VARJV45Xfu3Ep5sS8TrV/Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cL2MWViu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=efDapdxY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cL2MWViu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="efDapdxY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662FUhOk866477
	for <linux-clk@vger.kernel.org>; Thu, 2 Jul 2026 18:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MsoFpbnBWZlSJf0cOm4UWGA/xqUOJNFG8rZDk3ZD1/M=; b=cL2MWViusapTSdHe
	PHNWTaY0wgskVoPgsZODtTM6gnPMdw9Ho5HPzaWF/UAeD+Nx8wq9JDNvwNH3FkaN
	6UdnhRT/3Ko/3Qg5/Odck1uB7b+iNitcMFZTMD/GrRoQrC0ScgCQ9nnZfHc2Zro9
	7CTYiFWwUuQOu3SRi8DJCLuJx84W6O60S0r300zJn6A7T0WS/bYvUBsxkhldPS/A
	VvXCOxT9XjOXtBKCImeNxX864rf9LOYFt6iugBJIkAVe74l/LfH7hYizpEnXUMts
	1OKxUaeYSoaqCj33RpSEEorwaBDKe9rxxQZNB6It1bKhmVQs1bYMhD0mqPDyK0Nv
	4IwBsg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpngrcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 18:33:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so3185232a12.0
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 11:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017195; x=1783621995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsoFpbnBWZlSJf0cOm4UWGA/xqUOJNFG8rZDk3ZD1/M=;
        b=efDapdxYu8zsDpigSSkdiodPD8h02Z29UljOljewBlhK2g8mfEuIZDiSowsTKweRwd
         Bz0adXddTb9RSYD7lFevjREFTB/liGPo2koA54pm+xfEM4kQW/OC7LFScoY4Qin3vnwT
         zdw0bnFGVjX5RLOBJFIzI49IRoGpT5bFkxmSba9YC+cwKRAfJUi8l57dPdTDWhKrlCHh
         5NQAy9dOkBvCEpPZpjwWmBVP/3fMO/b8wKONoxyQ84O7GWVmiX4l8dkWuIxN+WKPFSa0
         J2drSkQ+O+B4JgkALpUe2WmzEgNAj7LEhsHN9cJWxS9wJyEyOg7qqR3UzPcuQJWuRchv
         QHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017195; x=1783621995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MsoFpbnBWZlSJf0cOm4UWGA/xqUOJNFG8rZDk3ZD1/M=;
        b=e3rYf/IcSpgSFq+WKrxe2jebOaxt/IlB/3I6BH/XhorLj5yJ41/EHRIksv9FcGXmku
         r5V3Q0OOmZ7XhpmuNkKojswmtZc/eo7n8HmGwTSv3iZ42U7x9nqRDhYJbKntoazpjpI+
         Uhn313oZE51j71VYBYPm5RFw7mRFNkNqHV0tcSHxaB5YHu/Yly9q78LhRSwLMJdbCnkg
         i/s/UbM8km79ClCW6XsqcKH63/fP2FHSnKWlwaXNyD9OW4VsERAIfQPIW+eYobHeXrvx
         jjqr/KvNpNM6Hx9ymW+RLENzCVYgM34c0YmH7jKmnBmPwzkwr9weB+OrpGrIXEx2CB5X
         Xpig==
X-Forwarded-Encrypted: i=1; AFNElJ+lEz9fe/kNGwcF8lpi+ti0s+2kNLs6TuLCY45qQEhp1CtQsBGU542iXLGMaAzc11M93Xw0fmvUNkI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXLr6iTw1BWkk78fwWrdBwK9Pb44MgyAcWdxyexBUlpdyXL33w
	eiBe1Opavm9Sm2B2cf/bjP/l0Jdb8srRq2exXaeB13EDZaLZ8nfToHuzglv6a71ParAEwof7k99
	O8etvYcbcWmDiL+0RvhpG72jM4Ni8b5gxof4QMPqlL7IMcGGkyr7VxIPxEQ1N5DI=
X-Gm-Gg: AfdE7cmqGsmpWHMX0Kvv6iD/AWBsZtxRSUDXGc01HlOaX4TyTPFGghZowKfUCGq0oE4
	UtBRToernVuoAZjRsbCwdUPBAX94TsBWxXo72eUy6IWnlliJ6Fti6kqHR5I9vwy98Oq+6k7VFcz
	3LuqS5Zg/foICLC1WHGQCZUMDb12nU7Vubatg/vEgGTZRGXITH9Cy7dEBCwHuXc9gS1EA7dBHQ8
	S3MxvDwxvLaL77md+628dXBo2w/IZKS7YXX6D0LvXVliLwfjaXM0/UJlPyyavaXgoTnPmw0w+Tu
	7/xyzG4bP3z32jjCrqjBDXzjPH9HX22aw/lLbtYoshxR1Ff5rso3EaciVw/Gtcxf7rnjcs4YEK6
	1C9F+5BCbnTnNvEqRgJonWxwmkHBQy+o5bYUzaR3xxg==
X-Received: by 2002:a05:6a20:da0d:b0:3bd:203b:982b with SMTP id adf61e73a8af0-3bfed24f1ecmr9309464637.16.1783017195597;
        Thu, 02 Jul 2026 11:33:15 -0700 (PDT)
X-Received: by 2002:a05:6a20:da0d:b0:3bd:203b:982b with SMTP id adf61e73a8af0-3bfed24f1ecmr9309415637.16.1783017195161;
        Thu, 02 Jul 2026 11:33:15 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:14 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:26 +0530
Subject: [PATCH v5 04/19] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-4-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 58cK6E_vHLTL5TTC2wO8evqEaoePwdrz
X-Proofpoint-ORIG-GUID: 58cK6E_vHLTL5TTC2wO8evqEaoePwdrz
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a46aeec cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zFVXnba82tZ0OxNrzBkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX25Ygpktpt+zA
 r0bWLxzjMicSwIiuhRVzt3PgEM5AME6O4x/lYXVrc00NW7DcTeNEuRPX/dkqTvg5V2nf5cxU9f4
 7oYcpvxlQMdP6KaMoK2H7xuD9OMxxtI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfXzkoXQY2U9aCR
 u5HaprZ29UkZmxkgo0wrq0yYlTMRjHug3ruo6hnHfmNypIR7VG8t7SP+nsmiWoworu7ohQIWijI
 wBI28mUGY5zZyX5XOVKoSb66hhEvzwDQEsKAuWYcv297VcLmG5W2MxVY3+bv7/1YXjte/0LZCKB
 pPdLEgyQxIq95wy0y+veyoJqFnHWRuA+foPTtvlQl0YEN1DlTE6WIWjfcugplU6lKCF4APT0MAB
 tyLcIY9ZVwe2sxD3FHpp2WwEodljcNOwPFBLY1watYghlobdY+1mt8hYFYrESiXhFxXqn6n57sd
 oihwq/5IcxUADDzo1SgSqNDFc7gTQEuIRbLfADjIlZDnmJucwpCiflhAjQKGw7A5gvIT/dd0Rta
 sG+x/ijvHNMppEi676/jN2Pdhu3evdCnec5DBehzgkae7WbJOcE4OnVhS5aoV6b2Onc8UlArWNO
 RObBNMnQHv5YRwyyGdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020195

The Qualcomm Shikra Display clock controller has clocks same as QCM2290.
Hence, add support to use the QCM2290 DISPCC compatible as fallback for
Shikra DISPCC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index fe49d7fcbd4985adf340945c4b907758abf7ea10..54d56bac66d8b40d1457f2cd1797b19cc9133686 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -17,7 +17,13 @@ description: |
 
 properties:
   compatible:
-    const: qcom,qcm2290-dispcc
+    oneOf:
+      - items:
+          - enum:
+              - qcom,shikra-dispcc
+          - const: qcom,qcm2290-dispcc
+      - enum:
+          - qcom,qcm2290-dispcc
 
   clocks:
     items:

-- 
2.34.1

