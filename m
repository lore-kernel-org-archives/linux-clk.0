Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBE232D0F0
	for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 13:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769175457; cv=none; b=KJjG6AMxFvAz5h9m9jxOgIp65HSzae1MdnSOC1rUdSkPi+1xF1BCeUhqaxvn2DK4oxqMeem9X42DsMsG9GtQE8KCYNrMN8qpZ921jDo2Q2m3BwtTwEnuCejccaXGC2ebXmgi+6P15+PQml+WWU/IcGevVS9f2NYLfVJKWlcge10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769175457; c=relaxed/simple;
	bh=TXhrdFbeddVzdxJSPpc0JsHd7W0RNI6taFa1JQtw2Yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fsRIbKHUuhqzhoVzve7siBT07/GJjxV0KLV7Mdaibvlj1eGhIrQHsLOswueuXQtfmAwHRLyMC18FZ+UokwPfV+MyRfQypI0+BmE/jT+IgUQ/9o8vTNHDAPjm1SbYTDBs3n5IucPKxWtQdy15bDhK2ZD/L+VocN6hrpaEdBncKoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXFdAm77; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ABdmMn94; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXFdAm77";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ABdmMn94"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NBNxc83704908
	for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 13:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2iv5v7qMHW5GfC/WnNxMH1dhiF2D/1Y3QmH5tjUTyJo=; b=hXFdAm777E1hsU/L
	8oYdj3WHVRQ6m3iUEQUJwoTKiX+/A3GDVf4AETSNeSV4fduBUkNm8eFi6LIkOtuK
	IRs2G4GAFbOed7kuPVqx4r8hQ/IyPDTb+/qNWxB5FODgFL/hiEIiCh+ysUUT2LT+
	KO72KFaf1oGNEAL2UDqHbMg4mzNIlFJSXCZ+QFZG/TsJ3pD716h+eLTQSfBfmWSr
	KzRtZ5Q3qeeDBDu8OKx3IMCPp6xvWnQJAZbMICEP2AYBB8B/ElYgBzswbad3ASWG
	W0udjasaZgrdDTqQIi9CTvE1I+SC1Cj4iNM42a6Mvyv2nIuwJlH8COjaBpCfpwmE
	/vTLjw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buuayu3x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 13:37:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52f07fbd0so876758385a.2
        for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 05:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769175454; x=1769780254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2iv5v7qMHW5GfC/WnNxMH1dhiF2D/1Y3QmH5tjUTyJo=;
        b=ABdmMn94gidjzvnyuFgzRH+yBlsGwrsnQYo5JLYhDITVLpemc0J5cDbFmdpPXM8lp3
         QzRkdasZYFA3gIM+rqGJT5JSodS0y3pkjiAzOVgFdMr2rCCnh+V/cheNic3WcGcarAz7
         uz0RC5XehrJZUmxB5yqf0dyUwHpnHD73pUX05FdbXXggFG7hTrE1+CoQvGdYYU+FCXd2
         Gwk+x2hyV5Xw0Im79/RCSGFW0vctpXpCImtBKwg+/keUmQXoVLUqSs6XoSddU8ZcQJ80
         pG8FcoXY7CGlM2k+V5QB+7f0jp3sBeNcKblnpRwoWVuwNJpKTQBR07+moHAasjD0Q0/C
         tQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769175454; x=1769780254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2iv5v7qMHW5GfC/WnNxMH1dhiF2D/1Y3QmH5tjUTyJo=;
        b=rsiUOypOt6BMZA8I24xzzFbVNH8j+1lo6gyG3cFSHQl/7d+xmg7mrToeqozlVT9zqx
         5C7F9U5hGu60rxyzw+iOgvUWM46CaSCDn2MlVeouxm3QiNoU6LiG5e0ZqIOHPzS5GsN4
         cW4YlqAOcdagC76dCqBIBlFljlBVTcjtQI+yTYPpUaLZ8YgkExyw7NMN9rzPVoh2XnM4
         QwZ8t34ecwddYJB9bL6pnZFtlt0MIcJBEK3s7yVPlP5aIg+Z30kbhjM4VprGBzGPg1ci
         EAkh4mARQ/A/dsStYEvCNctvOQCNzWsMt8bkIgBJ0kxPI3xV1z+bePIk4DAbUnAdaYSJ
         UEyA==
X-Forwarded-Encrypted: i=1; AJvYcCV7yRplWvSg4hrnBvDAvFYuf6gG1qrYq2DyetTRFF6uzOsM3Nlop2xh69CZFtdXNCSVQAhjwpd2NVI=@vger.kernel.org
X-Gm-Message-State: AOJu0YznlAAlgT7yTHZ9Yy8nbw/3+w0hyDwBF/lwZS79CYv1652RSvKm
	DAZhTUhSIAYV2ZhFZ7F7BoAFNX2k641MJm47OTGW/UK9PIYWqd7V+vD3Mnh3Q4oTUyzGEqH+LSe
	h3WmPYkZNQp7AAqgUaAnNaLVDLw4QE8ZOkIBr4O2B2BRbprUHhUAuUMYIjXcyz4c=
X-Gm-Gg: AZuq6aKm9cJymvZKPKq+Nd2j6LdQNIsu9jYBaXV16Gi4mHRP6iZRTqh47QiPx2bBIfe
	01nhjsMgitQm8v6cG70i/hDmtC6Yu7M9uf2GedTbSIA3lvhuDbk1EUm3Qf5O1qszNerdhRTWTXm
	ijXv4l6QUAEJNC9oYAnwZanm3T3r5UXt3XW0IueW1r+NO+HTjRl7Jk3K09JymjWYGxrcvufrg1p
	v/uHcgH6fvijEuXCKH3c6dwSadXs8JlwPnQzPNSBWgMEnvEWR2ZVVFhvczv1NQRhOB0E/RMDkJK
	ZSbU7yDaOAI3MN1WU/aVTVOtu4izMtoe3mq0rZVV3OD5XaUVz4g+vcJyuVWXxl9MpLK88T8+ppf
	ym1O0g10c3beS637AAw==
X-Received: by 2002:a05:620a:7106:b0:8b6:164e:e0c with SMTP id af79cd13be357-8c6e2d91b4amr385865585a.25.1769175453967;
        Fri, 23 Jan 2026 05:37:33 -0800 (PST)
X-Received: by 2002:a05:620a:7106:b0:8b6:164e:e0c with SMTP id af79cd13be357-8c6e2d91b4amr385862185a.25.1769175453398;
        Fri, 23 Jan 2026 05:37:33 -0800 (PST)
Received: from hackbox.lan ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e7156dsm6649882f8f.20.2026.01.23.05.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 05:37:32 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 15:37:15 +0200
Subject: [PATCH 3/4] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for Eliza
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-eliza-clocks-v1-3-664f1931f8c7@oss.qualcomm.com>
References: <20260123-eliza-clocks-v1-0-664f1931f8c7@oss.qualcomm.com>
In-Reply-To: <20260123-eliza-clocks-v1-0-664f1931f8c7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=801;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=bCIXMNVOJjQxQPQTzx/P3Zuxeig/F3AxRLL0jD2jhYU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpc3mUT5+R1DWT9zSYDO4dz9cfdNyjJVE55QowH
 90hpJF77JeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaXN5lAAKCRAbX0TJAJUV
 VjmrEAC1j14lVS0EFz1H9gp2NIXjM2/by1tuUuszEYngrDRiNNTby1EGFEU+fcUjiIhOeDvfVZE
 QNuNZLDm9aBLDoQN6NW2ff+80DF2YPVS2qFJ6y/jdREJYzR1JLWzxpLLFrqNBUUHF6EX7FKD6iw
 XjsFCwKukyMDclG3xpg1j3kNjAVseKkdlJRVxWxTDB7Rfv8d+/ma8AYZYoLQTVpDXztZnbeMf7X
 t0K9AMTbYBb03D2lmGASw5g0DW5Fgi3Uk184dUPQEDBxa2w0NK1rc2ntKJAyILeqGMGstnZdqRd
 2S63hLJkGOn3uWkzQbNmKJN/HFQX7y5/rldszv/lINPod9mh+w6KrbzDx77yzOx9+tWiUxjdTGN
 B0NJToYD5EPbrYVd9joH1Hj1EqVgOikNPv1RkCt9rrQJ/Y/jJmDYMR4vX8D0UtBuTDEevCFgfvj
 uCqjJKgD7da1edeGmDS88yloxt/QBDROn+5eXfu8qB6lMbUCSQDhJ/lCmB8xNMoQpc5uEU771o3
 bdTaJmRP0nj2FA+VtrrvyRR8eVgGaqlghR1pbjt4nQiBwsbJgRjPLN7XVQEpM8feL+9BmSAzGG+
 npZ5CRhbQGQF+38Y3Pe/3v39DHSGSVYS/2+EM1vNIHmJGoFcAH8+xxyR+l1ub97/mIpCy02yw8O
 yx5easrp6sdgmDg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=GP4F0+NK c=1 sm=1 tr=0 ts=6973799f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PJhJesWDv2iQC9CHGcgA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: hcDxLD-nEvy2puUyEsCnemOu5y1U2P23
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDExMiBTYWx0ZWRfX2eaD9Ot0PKqm
 6NhiAOCUs13mc7BRH9UFDW8S/ntMeH2M97EXhexKa+jWBp7FB19s4M5d5mcGns+sJW/NOYkuv6v
 XdkgFsHR2JNLDwKlvCGc/v29+XIFJk+hob4tfgGDVOtlpcdjhHVj5qsf/VMsJP73Qt83YKgqzRN
 t8FXURfhOyVN8e19K/zY3T7vnKQdIsCAxUO8xXoMjqTfTZyodvZWkzcmCJwBXODk7DA2PUoxQfS
 JwySxG3eP3PF2enbiHekiFgmD3bSoY/oCbww9ANdQM0oHsz1JBWivZpHWuXXM69ICLVcgk57L2o
 BbhEkfEJCs1rKTAC6UKADXqkw6uO1oP4WGTEYqOauCkUNj+6tZ/cxwPJZLZBcGl0e9tkCshy5qI
 XO7Nc7qYtKLIbide+9bvBtZgz+LDF7BkX2flOdbbNqcIQvlYmttlir2bhB87GMnbtcawQHhsbFm
 lvvYpokm6LHpIMowjfA==
X-Proofpoint-GUID: hcDxLD-nEvy2puUyEsCnemOu5y1U2P23
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230112

From: Taniya Das <taniya.das@oss.qualcomm.com>

Update the documentation for RPMH clock controller for Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 3f5f1336262e..9690169baa46 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-rpmh-clk
       - qcom,glymur-rpmh-clk
       - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk

-- 
2.48.1

