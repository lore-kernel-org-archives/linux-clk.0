Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527034;
	b=HCLyVJEmFxt4dL+lH8U2Mc2XahwgUhTcPaXTDAaIzWB6fI1NlRK5sNwuS5M8UoFXABE0
	 Z98utw8srHwALlne4frYelWIbJKS0t4GHIJuPZ4BAAAL8l7y4zw8FzhU5N/DFxh0/nv5U
	 1ItRfHMxVyY1QbuJ2RqAPIlkX6KquNzPEEY4c9jJ37kt2wCtVzj3sQAfuPHATzuIUJALV
	 l1ooHf9pHMGwiHP0g5NTNXc6PJytZk1NsxWmt/18dtOvkveO7kT76n+iccdNEKxbLU20L
	 ul1hRAKcfegf8mDsgt5ETCnznMLv5Vw2O9MMsQpJULbCu6RuI6OE9TVYDBmWAU9aJwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527034;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LkTmPmwoE9TvZheDgfVIeiBbBVqnSljafHMjO7Tou00=;
	b=t17xFETBl0750PczL19j8rdHeOYwZonkZrbCpWYewSJkfgL8OpufzLwBVTHxKZMc30Pu
	 ijk9Zin1OU/Jv3iFMcORGjwRKKq6qxHB76+Pi1DSJ4mB8laZguKVGbDga1ypkofC7gBW4
	 NuwSub5Bse3mY3Wi25Wlv6GvtbHxO9jYkoPZEWGiU8wBj0Adywv39LSe/qXXfe4Nv0St3
	 kCDYEZcEhKvfbwv/dUodNFMr3qlpmkYQOh3CXsXjge8u6yWIHz+SaPeG0sqoOpQUu3B+v
	 GJl6eKkliRaQd64ijCb30n12UmYyPe8IJ2kvft52aUR0WTj5UuIFceeGNgyFyJ7xkFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RQK7mGxi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="W/npoRZ1";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2D1606A32C
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 13:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B2D1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RQK7mGxi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W/npoRZ1
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuI1o3541787
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 13:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkTmPmwoE9TvZheDgfVIeiBbBVqnSljafHMjO7Tou00=; b=RQK7mGxi01Zl0xYj
	tvNOj++EndxGDQcCEX5ecs4H7w+1isHh+p0G1PcgdXKGEb6yj57e2t5ehyz+Hj+E
	49UWkUN1ScizDM2m8tjqZI0uClA4Sx/oB84+lJCRnNmVRi3ll9BK7GIDtWTZklnX
	by+5xKo3gWYPfGtw2r9WJ3y74ZERNho0phXMEH1F115h8TcOHMmv4ZtWFWz/jJc7
	yLnU9Se5G8iCg/XWZjvHlHBsIpyZ+HPXN13IHveab7n1dlHn4vkMdIC7bM6FksxI
	QI9YGCswpkpbOFBt/BWPejuSWQ43xEpI1mznyhG9Y7L9fChhyZPZ023ZNKBXbcvU
	XuZ/Xw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rh9vwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 13:30:33 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b0d1cf5ff4so3291447b3.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 05:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795527032; x=1796131832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkTmPmwoE9TvZheDgfVIeiBbBVqnSljafHMjO7Tou00=;
        b=W/npoRZ1WhnPAG4SdE/SByRngP5MOZbGyePKY/L9d94eADb1UYBZgsZcHXxTTtOPrR
         +mm6iKFmvHqvbInlk+LZAYef1R6HbbyoSj5T5mOW5F3e7aDT7iBjrSIuZ74qMoRlpREM
         sh1CAXMiR1WuKpQP+K9MfbbgAZiJdxxyrVeJqkv2JWtyGpQAjqSXjoZMuUTi2kxEakHI
         VqLYTHAMtigHNkgK30pNCnEGyC4OXGMrqduQXGiTGZZRGnZT8qZlfLxHrD+43HvIzno6
         zo4hgWjfccHzeZEbj0Onw4Yr6FYekYqVtuvyQfMnxuX4Iios8+uHc58kC9nTgxGeJ8Wl
         ccwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527032; x=1796131832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkTmPmwoE9TvZheDgfVIeiBbBVqnSljafHMjO7Tou00=;
        b=EuV7u0yrqLYhx6Yjudz0YyIVEh69WW7XTj3iKOIFXu2PDTq5P8+Vwm8bnNHiXUnWCn
         KsC6UD1Sq4pzGAMnzUPxfRFCRHaffNvQSe4eU/ILsbEN3839rA+weGQYDdo8MPno9IjF
         6w6rvpPXyvdsAa/rMiPIiXypUT94rBSrJ5skyXQeXvggKbdbTzv0DQVGLxi0QBguRofz
         5Ei8HVUqtTrr2IK6xKban+eC/994VERkweWD13hB/JIvDJvJxao1+du8PxmYd4a1rutL
         Jd1gKkzdUbFNBfivI9ake07jQm6lQuOLAk5kLIDzmNE5hb9YLpZyhXjB1JsqOPSQqVBz
         hHgA==
X-Forwarded-Encrypted: i=1; AL+hErG9LjheSNtNO3bhpX+eXDXcJ4Q5Zfs6XAFc92Mu0BexqCDavAE328KQPY/7FJaBiDigEmVgdmffCnM=@vger.kernel.org
X-Gm-Message-State: APuU4Z973ii6LyjIGWbJP4vj/OdSmkrfHeCdxW6XCNBNudpVJpaIAITm
	n9c/eHBKg0bS77uAVAC6JTng5Tv7T1bkzK/D1YwcSr1JWblAnp4vMtt+uvVOiiF4F7WIXdntwAV
	3Vwle1bt20HuuzHYUMwd2SIDjA5yvU3ZTIBYVp0r/+NdHvd1Ypk16Q6cziDQngyQ=
X-Gm-Gg: AZFdTZdn1E7cCOmBiPeuRJ0o/bMWfmqmVcSNNnLYRXeSdgpGqn0v9PbfnqK2IUa22i7
	I6MZYgL59NbgOOfl325+O0wVXhBUu+ZfdG2tOpR4RrsxTztJnxMLQvtounpIFUD00xW6mUljWDI
	Hq00yb9QaboHbwcI7bG5bQn2HZpYxDX1FwUs884nkZ4NJTvjeMGLt9MBNMmCMTcWeZWLmIX8ZOY
	tDh88JnrXjkjAFV3DM0qoZoWDS+AzUfiO52ml3zVOKDadMe1l5Tk6fb/rI4h5Ou8hWtSslbEx36
	kEf+1kJrm9MFzNF7XBPlbbS4AqkFgdnTczbQ6XKgm796GffZTC02nH8j2mYmR3rMWpyeV8FGo/z
	OS55IkNpoxcnSZJe+3Dfci/UM4tsMlurmCSrvulKenfq2I9QMdFr6NL+GxMDgbwx7HvN/soL81L
	qGFGZMhCE=
X-Received: by 2002:a05:690c:a20e:10b0:8b5:3352:774d with SMTP id 00721157ae682-8b5335277c0mr53453727b3.0.1795527031906;
        Tue, 24 Nov 2026 05:30:31 -0800 (PST)
X-Received: by 2002:a05:690c:a20e:10b0:8b5:3352:774d with SMTP id 00721157ae682-8b5335277c0mr53453437b3.0.1795527031174;
        Tue, 24 Nov 2026 05:30:31 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:a546:3db2:3be0:87d9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b1ed8b6a05sm11659080f8f.43.2026.11.24.05.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:30:30 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:30:18 +0100
Subject: [PATCH 3/3] clk: qcom: gcc-sc8280xp: Keep USB4 uC memory powered
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-8280_usb4_clks-v1-3-be083a711eb4@oss.qualcomm.com>
References: <20261124-topic-8280_usb4_clks-v1-0-be083a711eb4@oss.qualcomm.com>
In-Reply-To: <20261124-topic-8280_usb4_clks-v1-0-be083a711eb4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795527022; l=1334;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=CxLKX6YJtdQ2X0/H7/YrcqnD2wFzAKxM4o71EKxBqpU=;
 b=go1HBHtGZBp1WY8Mn7YI1qy/1ZPfk9jG9b8Dj4RgPJydxDIl/B7N7szYh6RHXMy5G9/tG5dFx
 I9eQ0T0fS0MDjVbq2W2lPGWl4iBLdJtPQXltcCIBjLrpvMFHMtpVQ3C
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b059179 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=e0QnMNc9jRWkZ8z8M0MA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MiBTYWx0ZWRfXxhdVrgbZSDzl
 eXlyn/1wXIx4iEudXl+uxp0fGOsWWjVPGvH91ZAWH8G2lV3byQpnsNJlqcl1Ps15QqTiX9ZiCmR
 KtNN2DeYLGY8i/F7fq32Se0aZcJ9OAk=
X-Proofpoint-GUID: WARwsxAZzcp-70q174M3NYdeIbKR9yFT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MiBTYWx0ZWRfX9A1vuNs3qhRX
 H2Qv4z244xeNEhECfjT7UHuYBllFSt+gCvsX2Yl75P5JKPNza/0KQqJl+nu2OFE0IdjdwTDp3qn
 hWH9pDezc9oMOvE1fc14T5Nwnz1Kq55UdRL+w64BV+w+8TPdy5nJyX17F+bfcMo3kNnfVtBdj7U
 qijiBuPEsK08dL/EgNXycxVauOvoXEWg6gDyxc6TqAQlrjBm5tvxiBn98aHzoj1SVfyfX7FD+2D
 z2Uoh2WB3szjd4U5x8Av9E78nN/TNMUaBrnTmngjuclkVZJaBAjoLpvcsp+EV6wsyOkzbZps3Ol
 DG7/AHq1cJloptUiaO96eXFbw6JIHFDtiwrBpknB0UxKWHJxENzBP3DJAWXoPxXUA/m3MP9mCcQ
 56UIi6s77mcGRQokMvy4OjEuDBy0Hfrc4ESQgJ3ft0h+J/LRJJYcWWdsY+QIYo4HkGNpUATc2KZ
 Txpld8blIRu4tQnxvWw==
X-Proofpoint-ORIG-GUID: WARwsxAZzcp-70q174M3NYdeIbKR9yFT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240052

On SC8280XP, the USB4 uC's RAM contents may not be retained correctly
by default. Set the corresponding signals to force it.

Fixes: d65d005f9a6c ("clk: qcom: add sc8280xp GCC driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sc8280xp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
index 077dd28610dc7b2a43c358a99317435c42ded970..2191e27626efb204cf171db4575b55fb2a2f97c5 100644
--- a/drivers/clk/qcom/gcc-sc8280xp.c
+++ b/drivers/clk/qcom/gcc-sc8280xp.c
@@ -7541,11 +7541,18 @@ static const u32 gcc_sc8280xp_critical_cbcrs[] = {
 	0xbb028, /* GCC_DISP1_XO_CLK */
 };
 
+static void clk_sc8280xp_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	qcom_branch_set_force_mem_core(regmap, gcc_usb4_sys_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_usb4_1_sys_clk, true);
+}
+
 static const struct qcom_cc_driver_data gcc_sc8280xp_driver_data = {
 	.clk_cbcrs = gcc_sc8280xp_critical_cbcrs,
 	.num_clk_cbcrs = ARRAY_SIZE(gcc_sc8280xp_critical_cbcrs),
 	.dfs_rcgs = gcc_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = clk_sc8280xp_regs_configure,
 };
 
 static const struct qcom_cc_desc gcc_sc8280xp_desc = {

-- 
2.55.0

