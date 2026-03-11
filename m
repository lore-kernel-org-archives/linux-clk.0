Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B873C65F8
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 09:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222399; cv=none; b=XPhbzvHHPQMsisHhqkHijPWxL6l1H/P9ZbzTzJ6P8GZ8iJ4DkGfS6+WAhxW/6lMDXr02rA/Rkie1StpzfnjiHvIt9wpiGmZSwuY/V9r+AZh6Rqwj8nJ2qtduO5KAYgQISREaaCGTynyPbPD7NXBSMHGSQviQUelDbAqoHNca4pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222399; c=relaxed/simple;
	bh=D4FTk1Dc6ZZyZyyYwyYFZQ/PqkaMYdH1kar/R97d2u4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hsctv7n9xOXxSQ+qaMBuvm5fMcm6Wg263QTeMYzGrVcjx2jvxrsG/3HqmXbaoq6Z3eVgvkmHB9MZ9OFtnR6+bu4rMYgDw+gOx5+lNLyE1SjvHA9CzR1Cad7/P4yUv81c9fAu1EcVQuSZe0x4wjwLGxw7DcvHznAjekrcFvI8EC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LE0H3ja4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MKH8pyau; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LE0H3ja4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MKH8pyau"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B6ZiQ31439630
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 09:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n9S9Oesm5sQiwmkIMcRlV+iU3KxqxzSjhKdwL2L+zBI=; b=LE0H3ja4bH0H7vP0
	r4EAfLW0IdOHoNjJ1P7XcijpEqt9reMhI+unoAXLpZ6rIvWAlDlSRBjBwBKcgKaP
	MPiJGzbXdiU6Xw8akUzRAtkMNAu6orcCop9zEp937juBCN2ziFbiEKWZDjmxe9vv
	KtnMu3T5xXbxmodeRMfZ3iajiK6lLEhqY0V6VOUweaD546MLjzWDZepcQ3wKHrRD
	BYKopEBYyxv6DrupXAwqSOZzVAS2TUXlL6KmXlyFDqLNmdGO8JCR8UQ37zA9HnX3
	Oq2LvTStn7NSC6/udCYRsZEEBF4230pPVj0LsMX9HEIOjDISFLhEmb1L35u84UF4
	O8Mvnw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu38ygpce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 09:46:35 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8298c733f52so424964b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 02:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773222395; x=1773827195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9S9Oesm5sQiwmkIMcRlV+iU3KxqxzSjhKdwL2L+zBI=;
        b=MKH8pyaukgKUuMoKzZBgJe6X7f4JCOwbd0Uyc5uMQKrqCx/PVjgQ7wLvBrpYtZKPbW
         xJargAOEfQ/3hrxBb5YvyrwyGXLXcWcQc+pDs2Y+JlpRZTbFY7VOyQnb9zA02vwEBVZ9
         bqTA9xfkhOkwrF4bWTxTq24asBnpPRjle4PiAmgoC6+JwKHZC/GaDk/p2iHNEWucJ7Eg
         bpApJdRvQK+3mOj9XRVLNoKGzCQJEMdFe2bCOF+nov67GEvWe7w6YPkCewg9WtPODzTy
         GfDCympusQkYiboRGTQkqNcgHt8ksVA3eNHwW25Qacn7mWYgbSwrJw13gHTLrZXIDcD9
         BsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222395; x=1773827195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n9S9Oesm5sQiwmkIMcRlV+iU3KxqxzSjhKdwL2L+zBI=;
        b=f+FzeZYMcqXQ+K3F2+Zd2RZtgP9NxYD/aXRUj2j7nOHBcJeBK+h+Y62h3YBEN23dwG
         9pG0pzVgrRqYrlSdvp/0vw+Efu/m19H/azljS0f87RLz3u3ce+LcZ1AXK2UdpuUb348u
         RnO371CFTUh3kdvmNUYZwtmQdBbzmp+1NkIr7oCZEpVTM9Mu6R+0+9GOx4+Lhr5k3fW2
         zzIqfCpWcJQ9X3+Yc6jprXAVFgf/LZzZK1ZPLEy3BhXzfu8idJxz0HiU7N1otIB8Vmrn
         bjxC1z8yZBQcppZp0581INuAmorM7ld7eZLwHZYmeYgnNrGyPua4rUtV2lT09REmtPoR
         G6dw==
X-Forwarded-Encrypted: i=1; AJvYcCWTDpOuDDHY8zp1av43XoQGVs8FEtglBBxpOGynnX4vxzywj/a+sh40xKd6/HLULNG7jwbWUfdFqhY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRDWLnAJqWe+HiDwYIK3yyaPE0hCMRm5n0xqITwKQa9iFaJKsO
	Q+V+lCQYb0LMuSFQCiGZrf2/1m+iIaOhqmOkslRFPdYvqUGbLKBkv8EUjSpOg30AQgTKi/kR3hV
	nKuEDEK75AsY7iG/1qfu0SmkS4Mf0X4UO+e748ndF0Mr0rCpT5Knbg9XnvVJVgW4=
X-Gm-Gg: ATEYQzyZI871jgfd7CsiSskIr5Yu7nc2CNI7QFJs8wy1a8NxnwFVRwSlZwteYqtxvPh
	O/KlDGJApZwPYIHEa6grTWa575XTqXnveP1Tq0rCeAaPsjM0T8wumiSv5d7G/jGHQdVDA7gc2X+
	+PrP7nDh/S6uJfrIyfcnM5ZFo1zq1luoJmrudlEI0SHkGlvoo/952im6wUb8+8nwKP2TPXOuBxq
	p47ydjNpchxnb8hBk1IZ/x82h7nH0OBmR1hXh/kKROdIO3OBh91bvDVqLaOk1TnTlAWNVjW0fE3
	OU9ZXd8TF2gaytAI8AGxdfiACddb+kneGphZPLuIpvZRbMG0wJfwDwgK/qgES7sv3OkM/HzRT2B
	NJAjwpY/w10OqSEaFRh8Q3yjk++UF0S1kMDe822mhIwuIDcLkL/iaaJAlKdIy9lKf8tIsytN7v1
	u/2ox+/eKVo9Agir2KTCAQox3s1Dp5rLePfaKj10qk4VBH8DpXPoRinrKB
X-Received: by 2002:a05:6a00:1a90:b0:823:1bc7:ffd8 with SMTP id d2e1a72fcca58-829f79ae018mr1595235b3a.9.1773222394454;
        Wed, 11 Mar 2026 02:46:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a90:b0:823:1bc7:ffd8 with SMTP id d2e1a72fcca58-829f79ae018mr1595212b3a.9.1773222393938;
        Wed, 11 Mar 2026 02:46:33 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6df5ff0sm1677403b3a.21.2026.03.11.02.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:46:33 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:15:49 +0530
Subject: [PATCH 7/9] dt-bindings: firmware: qcom,scm: Document ipq5210 SCM
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ipq5210_boot_to_shell-v1-7-fe857d68d698@oss.qualcomm.com>
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773222347; l=853;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=D4FTk1Dc6ZZyZyyYwyYFZQ/PqkaMYdH1kar/R97d2u4=;
 b=QebNZs3WsL0Br+pxni1jb4Njj6XELEcpcYhGX9Et/T0vK8D0o74pZoru2uSLhEMn4P/UNRjyH
 Tl5Cm9eQ2N6BlxfEbn/07H5Pgwe4vWrVxtfvJdL7WsgBmazFGCDi55Q
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4MSBTYWx0ZWRfX1fwjR2AHgSR/
 dJPW9maknDu5qQ72FMY2YzUFMe6GSyh8Okhub3BCaDsAf29GVC0NlktK87mnCrHDKaK6kZB7Ok9
 jXGQrujAkIdTCa1IMQP75WyN9v2r+3UTHU4DnNLYpI6MpXOvsD2cazRR0hp5JHieB3NhHDdVrWj
 wepkD8LcBWZ3TY6nCWtTm2mywptkhc6zufW7GfS44BlfcuEmuLYoW83QVV1tAl+/oRU2TiK2nDy
 IyDKBCh0+/rYCgMtBa4+8ptrAaEMnWnMfD5xCQ4vdNCX6djywToX1XwkRpEG0JHxOZ3DmQPb0xU
 sSPtjIGzGZl/jZlbwC+WfsObYHQb87uw58hG4Rt2zC3Ry6ST0z4rWGxFkJqWEArcG5ymNDahspJ
 0WsSYlP0Y10guALxgamoKKyYX7Oa+Xd0Fw8BTgBRZDuQ8pWm8cpK6m59hvfGocd8uOQb2b8oMkD
 ZVHSKrLAu5k5Ek8KT9A==
X-Proofpoint-GUID: Th7ae8GG4xe9fFQ-_XdJG9AVYqFw2V9L
X-Proofpoint-ORIG-GUID: Th7ae8GG4xe9fFQ-_XdJG9AVYqFw2V9L
X-Authority-Analysis: v=2.4 cv=Cq+ys34D c=1 sm=1 tr=0 ts=69b139fb cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ND75c01xaBhBG1K22twA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110081

Document the scm compatible for ipq5210 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index d66459f1d84e4d99c7f72415d08bfdaf1d701948..6d9b71a9b9b3fefd1951b963f34942243aa48ccb 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,scm-glymur
           - qcom,scm-ipq4019
           - qcom,scm-ipq5018
+          - qcom,scm-ipq5210
           - qcom,scm-ipq5332
           - qcom,scm-ipq5424
           - qcom,scm-ipq6018

-- 
2.34.1

