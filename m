Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B7C332614
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 17:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853102; cv=none; b=Ghad/1l60dwGYdQ7H+uEHIBz2pa5Uftwg6KQV31O1e2lyRkGkNOQ25Z855sipKf+Bi4fVh6IklU6wwf1d30crR2VF32J4pe3ZVLF0NksJQDckB91bjIeXA51/UGBRZIPbToVdCppvgOnxiQ/faNo1Wj09Fk+rRDopjuhaniCrSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853102; c=relaxed/simple;
	bh=ZHsN8zM/JbhignLDIxWKpOEJ0dJLsvtVmGGylPc0eUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pKvHsCZ9YVXZfyzK9tm0wM5HcjKjyp7xn2yPN5fopQCsleSogSG+FexCUlIGFQkA68CDpSrU4OTciSju7rBf0lZTtdBqbhjo9RpZbM4TWnzRtQ8EdbxMT3K2hTewEuivaqGmDFo+HqKZNk8w5DH5tCqBdcTMJJBuzLXLkIJ3iPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zu220O01; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dzJvujbq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zu220O01";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dzJvujbq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXefG4178386
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 17:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=; b=Zu220O01n5yJNHX5
	ySNhJyILhSpvi7mx53R3ja2RAMxFAAyh0WET2xjnoMBnNZMZziK09Rnwvvsypy/o
	DCqfCeKDCb21BWS1Fknfyk6WtYfTaS6YG1+yy9nIBdlxKbnqTPteYujtBBaaAiQu
	e6x7PwmPYrQVWGuxq6gHdb4tJgrphRNfzjfH4CaPB7pPDMI0pjn3+KyyvTj204bX
	u+9y805bwL1jRuMLN801CmC7mbeWdD9D9qYbDKadhPvEZ0oXcHPdgU9esRbg4rHX
	Ovb8ABQX1r6DRL2/sgDS2GOqzLUe3K1rc/mDtIRqoaCud4eCP+UhO2g/i8/Wgl/K
	PW/qHw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaphw11wm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 17:51:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so291868a91.1
        for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 10:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853097; x=1788457897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=;
        b=dzJvujbqdzwS55WcHY2s51v7dMiMuA4zTgHrHwedQEbpZRlyFtC7dsi11p0OQDh6P7
         TIUjHHbDUHGflej5lhgv5DYNYJvjSzfxFDf3DXIQRRDCdliUMoRMl4El2V65fNQ7Y8aQ
         5Hh8N75UqxR3YteLXeaX7Y1XKt6PCqy0REMb6S2RGUyaZ4gUKvpOE3xrmiYZQszM8eu4
         euM9F0h2qOyjXNDeghrb5rwXwAZy3VbGUGGf3tMET41HB01T5f5EhmoBIY2YsRTU12yj
         +1qZjcgR/ckuFqS0SI26yf/Z/Qg+HM4axyV8AWm9ycSjGkxbhFUCicH1JJ/3E1WaMJoZ
         mJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853097; x=1788457897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=;
        b=LLRlG/DnmRE67Kta8QcWQZHVPpidFuH9QRIwyaZPEQ++Ku8mupB8feVaYeXFT/UrCd
         kVICQ/IaU8+iiX05vJMerf1PMtFllZhHdGFnBRX5LUiBu8d9n3Gep9hCtmy3AqOeZOBw
         739N1DSkgj/tcD49devYfz6ncWDGQ+BdzbXoBju0vJZNFg5pB3eLdHIuLnfjqfA890T8
         yFvLeupoei7XovyAf/887yOwjndqlZHAxbswbx6FNhJOZcVt0w54Jn55gKmjwhC4b7Dj
         wih/noVKD0dh0oIlRv0NPDkVKWtTKwalCfQFZki4t90RXsrGpcy1NcQoitG5IfPKIRXl
         6+cg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6UpSkYoUhYLb9rOEK9LRVlKeJwlH/DKboioVHjj8g8o9gCFyKHltn6LBH7q30oI58tK0RLTRMlp0=@vger.kernel.org
X-Gm-Message-State: AFuF++nOZxt+5hCYRYgjEYs561iCecLIDOj8Jo1pUVB9XepYH0enyK9o
	rJUp1xIzjbwQkFoEIYmry+k1ZV+hKzakd/64EUJNioWf4hCZUnYWCWIAdv4CpdlykzGERableK3
	EmbyGjVJPdyvnp1h6c8baLkXmG+wrlAGnQfxxhqct7XdYFS94McTWTmcoJxjOdQE=
X-Gm-Gg: AR+sD13GIhcEf5KoEjB12dbAziIJfEbNe1DCxdaqvqnT890CXxDHTq6ybU5+o6p9Hpy
	oCnnMePcEge23aADFkA0MDVoPkhlvFPmBTmO6C7Dis8LMn8i00aPxgb//Mib2z6NgesdlKGHnDb
	9nr27bqXce0wiIqkob8ZmEXbAw8slAV+YTYheI0QOXYk9+cPWEqeiad5V4vdaEccCD+5gGYxlxA
	eV+P/L8GUZonE04Y1jfcKXiW+2s5/y2mpfEweSjp9/bALTaku5IRxrN+U/shvmGJgym6cTojk17
	j4sbGpkTlWDSnftWRY6j4mdxU1/WB4Af9MsVwye6LDwnz4QLCDsFKvNnB70YHYmqYEasRzzJwCp
	kekmJ6qP+/CRmVcAB4Pa8iv6v3PCFV//OcBWJJFEjTimNJ2w1A30DlZ8ctJVG2yYNZhJ6SzNC36
	XISCTYgSDLTId4IPINzO4ZOSM=
X-Received: by 2002:a17:90b:5443:b0:396:4cbf:45bc with SMTP id 98e67ed59e1d1-396d100313fmr1670019a91.16.1787853095939;
        Thu, 27 Aug 2026 10:51:35 -0700 (PDT)
X-Received: by 2002:a17:90b:5443:b0:396:4cbf:45bc with SMTP id 98e67ed59e1d1-396d100313fmr1669920a91.16.1787853095439;
        Thu, 27 Aug 2026 10:51:35 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:51:35 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:05 +0530
Subject: [PATCH v5 02/15] dt-bindings: power: rpmpd: Document Kuno RPMh
 power domains
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-2-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=871;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=ZHsN8zM/JbhignLDIxWKpOEJ0dJLsvtVmGGylPc0eUU=;
 b=vzpCJkMB6+PuXviINwNp3FHtz7nk5WS01Bo1zaRtxjr+lSRFC5WQzJQ1BawfNs62WmAgjGZz3
 7ciUxDb3xWuBXJwtYwyZR+4oRn74aMGz3NiBwSWu57vDqmcxYmMWTid
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: u_bYzyACv7T9Q0xDcZZEApcMleTsGLwu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX+tX/MvqIbr9P
 5ncAxqgRPNJI0MwVYbuz3JALvXUbk941vQA/iWGrC4ncldi9sdl8fSfMr6wxeIihsJlkHA/bvky
 XEQI2giifZ3tGRCYO9tjfDRlFEiCGF8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX3mBBbqechMZu
 aPRFhz/FuNrIsBTfbzK5wkI79n8H4LppTK1rxuhm/KqWhRuxnX4WvrV4oPNXuhLRfViER0/EOcf
 NjuuOPSc3g8e/mYJtNtlMiU6Am3qQOzYYcrs1Cad/WEZ0JQfvt3/MF76g2fQHac6FT/otTS8nXk
 36/Sz5jR1keXuD+HciiY8tK3AhcwNWEj2iVqnLW6TZMYbMiqHODvhI7ynUHtslxQ0UN0dWQHdXG
 c15Zgo/hzQCpChwbqWtvJQegcuJic5cAmczl/aBq5BRkbJCVGdjiAVesALsS18BPMjyvGRy81aH
 ppPS3M1xctfylMaW/U+BtYj8JXhQOQqVfZPDusvzMaVMBjPY2LrMfl4eOItCCKOxpHs2cNF60UK
 D/Qn3iEFhWTvec2K6xCYEWENcTsVq0dpSO2c9hiUA1reoyBQOtIxYIP840fWqf4Fn089TPWsPpj
 YhIfrnuVSb8dDivTV/g==
X-Proofpoint-ORIG-GUID: u_bYzyACv7T9Q0xDcZZEApcMleTsGLwu
X-Authority-Analysis: v=2.4 cv=E8b9Y6dl c=1 sm=1 tr=0 ts=6a90792a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=lHgBgSUrZIjjmBdF2hoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151

Document the RPMh power domains for the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55062..7fc3927efa27 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,glymur-rpmhpd
           - qcom,hawi-rpmhpd
           - qcom,kaanapali-rpmhpd
+          - qcom,kuno-rpmhpd
           - qcom,mdm9607-rpmpd
           - qcom,milos-rpmhpd
           - qcom,msm8226-rpmpd

-- 
2.43.0

