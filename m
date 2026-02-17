Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96163356A30
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 13:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333259; cv=none; b=dBinCQW5l/CA9aQnE5sgHbRJ9dDPw8zhq0tbedG978ZaO64iA5nLr/hUFoI8M0TTD7HJASseGlb8fI1p8VgmUXWlxVZlQvZlTbwH2S1lOtAdIeVxWB4E7gdyEizk8jf1OjVmshZBCsBs8AMUzTDDMNH//YXc0VBQokT8Qa5ZtBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333259; c=relaxed/simple;
	bh=Umc4lJBE6iLRSvAa0gHSqwFC3beNVviVpyNP0jlUhXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DE/grQuPeufwUFUnLfqJvIz9coHgrMBpIBWW/rYnXOAmm1BeiQsJYMzW0bSp9REfNgd8XDcnRy+mLImEfNLrkEHHQw/5BhLNV35lEdlUkFbUtzZBwxWxlT3KvAJzYdZgF+C4NDq7UccYkdnwSWQ0HHubcvO77fFG4u0372nhWtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D+NCCHbd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VUVvn4ef; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D+NCCHbd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VUVvn4ef"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBCvlx006270
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 13:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=G4Pl2a+TrddTUBSj4hdHEK72CiVUyehsyV0
	LvzYlDXA=; b=D+NCCHbdYcYVbcA6qS3As/FiXN2dnBOtRhr/zelj0KGWYOu2orZ
	YigCQAWOkKKRw0AzBtM4A81Pg82a17T8bXw3SBel08B9bFK6R8NV6KgqEr/KqOTL
	f5qi6YvQRkcO5dhGEpSXgE/Frr3Szi7g9dac4KLaoNkB+209A9mUo1VAyt/vnEfe
	o4QvcO6u9xQv8bys4A8L3IFYG9zwrwwpylDyWmwB6XKLZPdYO6EtJBRrp5pQZIWQ
	IXeY57P2FSMAXl0C11Ac/0Ef4ECjc9VfPbkq3N1jOcVGhb0WBh7tqEHlWsl8PZcE
	jKLo9BuAFwmFteBXySOYPPltI+LwDi35J6g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc5khaknu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 13:00:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70d16d5a9so2260745985a.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 05:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333257; x=1771938057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G4Pl2a+TrddTUBSj4hdHEK72CiVUyehsyV0LvzYlDXA=;
        b=VUVvn4efmuB/SAa8WoeOq8lyDm3fSIhyNWG85QhAcfC2PQs+v0qmOaAxhoC/UOidOS
         JYbuZElJUOX7M1yO8qacLWZi6G/x22tro6GwYyUhcFAR+4uEPdZGowF1DJ/gU6npH1aa
         62POtGhlrDxQxvT1vGtr5OyrjiWJ/qlQV4HKcgX9jsCCPH089UDyIdY2fshcfmUWWV6r
         3ZKEFvAm+k0+QwMI67WFR+lzaZHYJ5LHuq2oFePGCOqiuU+m0AF6oWxDLLa6dB254eqy
         fmpAY8LJqRc6PodN/kQfwiId6lvDOWWYyAOp2IeitKjpuViPUZB3himRkYGhlKtwH8wd
         PTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333257; x=1771938057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4Pl2a+TrddTUBSj4hdHEK72CiVUyehsyV0LvzYlDXA=;
        b=YO3FvrKXHloxyFvmlyHKJxqkRxvb3nbrXgRHqYCr1QnOBtjDM5Upu7KT1Uzmy1DcBF
         r4UKeG6CqDzmSyYdnoJQ4OYRxQpxEtVOB+y8devvlBZ/9aPyuUAEZDnhAuaqLXaL7cXs
         fgXiOUSkqQoxYEBlyAJpZTAc7Qwcf1qIP2+icQcUqS/uroT5ehvrJ4ORoe+8S2PsGu9O
         2tnkSTyPmSSr9vWOAqNzqM1kFh0cp+614zdPjOb+xeQl7GwVLLfAXPvUCTiesEtUMpLb
         b29KoK2Yay2jPGN7c0wzXsB1ASeWSdtmaCbHjZQ1Dw0GIyToKEpj4mZG02Et347EvVCo
         CFag==
X-Forwarded-Encrypted: i=1; AJvYcCVinykfj0uRnt7T6+x1GeD28ZPwrzTRqnXCXISSrZcH+95C7fwCLeEV/3aKpFEnCJ5f4R/Vh9NMELw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2U3Ad7jBXsvU32EZZ1rXde5yDUS9tBWr7F/rDG3hVR6rgo8Rs
	A9nMa4xNDMLZVaRxYtSbSf893E+b+cmfybQTmnjlF413dFdT5uCGa3te/PQReW3zaE6SWDY6b6i
	+iU6sbWQHD42orcpMpFglenIZuTgGc6aM1gWZGrmbLg1BE/0wYim6fFIRY0WBAAo=
X-Gm-Gg: AZuq6aLWoH6sZdKNTJIUJcjbWBqneodkaJ8IMMKBSSRGUTlFztqzBECxQH5id4SJ1ex
	QhE1DM97+SsUrFkOKDlzfYQxEoPqDg14mGha75pr8HiUskJD1FiCJy9ZGsG18BJLjA9JztvpaAj
	yAS0rvF33o3D610BCYbPyh7++NHOdD9dZlwYPh7E/CmYefJbx6gF26MImEqpL/fy4SPFgNrbSuP
	nzAr7a3wSa7hgGtJf/FppFZ+kTQsvIwSic2MZUfyC1mTcxkvZkHaQrsZIPsVL+LyB4sJVPp6AGY
	i0y6S80z4tqOL1d6R5baCICG8OiFAfhbMxEXwPBtCd2ixPf1EkO4le3jWZj3UQ2ETl5e13JasYy
	tH7oda6RUm4/oo5ZTRikunHBePnRBOylKY2On8w==
X-Received: by 2002:a05:620a:4096:b0:8a3:cd9e:e404 with SMTP id af79cd13be357-8cb4c01e2b0mr1489888785a.68.1771333256527;
        Tue, 17 Feb 2026 05:00:56 -0800 (PST)
X-Received: by 2002:a05:620a:4096:b0:8a3:cd9e:e404 with SMTP id af79cd13be357-8cb4c01e2b0mr1489846985a.68.1771333254202;
        Tue, 17 Feb 2026 05:00:54 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac7d91sm35009268f8f.26.2026.02.17.05.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 05:00:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom,glymur-dispcc: De-acronymize SoC name
Date: Tue, 17 Feb 2026 14:00:48 +0100
Message-ID: <20260217130047.281813-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Umc4lJBE6iLRSvAa0gHSqwFC3beNVviVpyNP0jlUhXk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplGZ/AwrmrAYNmt0vxWk7ycUPw8XkRaqgeXuCH
 8ukAsLlPVuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZRmfwAKCRDBN2bmhouD
 13TdD/0c5nVKtwPnS/jATjU6ITNG1HVfMoXKkbQd5O/J+a3MzA3VLvxVCSx0OYr4CYEe9fxfW6r
 uI1NhsIMEWocOOQrZZOM4CxLRrA0M5X5wtLxxSXVvxa29qfbIgRYtLNCgSBGkb6bOK7jBgYHCsh
 3zBtv7wG/RPWX77U9tFdtmpK4zX2Ts4m7mD3w8wOuwFHASneasXnk8pWu5sm8vEoWd7PPfm47Be
 c0EjlsQhsTeXLKO5p9/3nMCk+1Mkr3Xl3rT8m+GiSzn9/msvp30QQbTIIO6AZZr0CfMMpwn/uFl
 f36/iBYNCJ6CzDS2cyBbnpHdkvgvdK6Tyan8ej6ihGXC3+ng/Bcrz+lpmuljjuPDfxUTuO6yUqN
 iaVhBWwVtqrRLoNtY1fAfh76GaOCukg6cVtKkZ/EAf/moGrzbVHkilfcnOd+uDBwDiS8cOoMvZ1
 LTM40kB8mEsNQc6qE8AoFqscXIZwve4m5ec9iPf1+ru1gvp9Gov5s2f4JuPLBBZiwvHsfMi9JCM
 t4sMiLyeXnrGQ/KjJ9/GD9jDTWAZv+Mh6PVCfG2Am7KsKuTqg9OM+SVW/MCEzFHJsEjApX/gC1Z
 ZzCkXMO7SSiRIhRwacbpMhsc2h2mXwTg8/68tXqvjEudpMPWjnM/FBbO/0zSa7BmwyuoieBSHG3 PzjjFup2eoSgKFA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Coyys34D c=1 sm=1 tr=0 ts=6994668a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=UdcbsA6SMs_yTIfmLdIA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: PQgFm9GQEn1j9n_vFqKXQxsrDdZ9nX8f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfXw3YRGeiEZHxl
 PBJbwo43duk0zNW04Nb51t7CjFVoE54VeHCM5YGbaTjofO3CTXs8l3vvS5IJcq2Ugd4jwnEMXSk
 8qrojHtcbwhTf1O0X1Q4ipQOUaP6hgA5wdt0vkqelLe44aIPrzLsY9KrlZ+4m6LY/XlxEtsg5o8
 hd3RgEQFcQwav2h/cvmKotHwFw5J3WwV5hn8Kq/zY+om7OfUgKwFq+t0xy6PFzMKqPaoIF10j60
 6QT7TFknUVsXrcAjbeWCXxU4Nb3UamDA0w5bWeL1SVSEBWdBu/s6qspd+QbgUD8shVzDXuXJukx
 gp0CN7PsxYlYXGI357a2oq4F599iJ9zmQlD3qa0NSO+0oJth212qZVzWMWWi3VHFaZoR9Dn6r/S
 wnOLHgdhtFN56mQCJcJsAXxIzRzoS7pC/EK03avgQJMJexr65JMuqoGVgT9rJIt6lbhJB6Qy9hR
 M7zyTEORyFfa/MlR+KQ==
X-Proofpoint-ORIG-GUID: PQgFm9GQEn1j9n_vFqKXQxsrDdZ9nX8f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170106

Glymur is a codename of Qualcomm SoC, not an acronym.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
Split from previous patchset, because I messed up commands and combined
wrong patches together.
---
 .../devicetree/bindings/clock/qcom,glymur-dispcc.yaml         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml
index 45f027c70e03..9de4ba71f1d9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml
@@ -4,14 +4,14 @@
 $id: http://devicetree.org/schemas/clock/qcom,glymur-dispcc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Display Clock & Reset Controller on GLYMUR
+title: Qualcomm Display Clock & Reset Controller on Glymur SoC
 
 maintainers:
   - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm display clock control module which supports the clocks, resets and
-  power domains for the MDSS instances on GLYMUR SoC.
+  power domains for the MDSS instances on Glymur SoC.
 
   See also:
     include/dt-bindings/clock/qcom,dispcc-glymur.h
-- 
2.51.0

