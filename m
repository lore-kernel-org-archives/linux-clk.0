Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B043A6B90
	for <linux-clk@vger.kernel.org>; Tue,  5 May 2026 15:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777994959; cv=none; b=m6BhCJTEchScbLi4PJmhn6b3x3//ez5K8mzwqrzr7Vvm1AYgObWhK9EA/XqEQmCUWyYBgmVlyZ1icvKsxuaZEfrNF9o67NB082xYCp5HMhsIrZBRZwZrw0pAebj9EKlANmBP72HJ3PLoASYBFSOtBgucQ5dSEhKNSLF6I0qqwQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777994959; c=relaxed/simple;
	bh=nHnStKl3uJBuouJWIi0baZMrwQ9zRSm8k8wt5bYzhqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LCnGT/FWZaI9ru+UReYflauYoIqcJq9oBvxYUnYj0QoPtkt1k3UOzo0zandlOaPs882D5WekB9V6H+fgBh3Ueo/0oxmnPJ7/ZS9/8v3ra9tGWHMMwdxEVP2HWzeO0qB5qAG0oNKeLZT7F0f30uKz0FCqWg3WaqypkWbvvRYq12c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iz/vDIxv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EvbaVyOV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iz/vDIxv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EvbaVyOV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645B6bXL3091544
	for <linux-clk@vger.kernel.org>; Tue, 5 May 2026 15:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tN4fIreF7QkVH40MlowXeuD1uw/trVOC0mA
	/BRremrs=; b=iz/vDIxvqM9iGViQ1PAlpOWLUy4lPCkaXq4hLEZJKVrncAWgZ6M
	ImAtZwuXwod4JOuw9zcRGEcaJrroMAB2CrKVSZB9/mEa6UYSFrYYACRKbTDUhcOf
	bq7DwpdvCcHBlWcG3qt3mLXlhGzLdL+0LJFl/aUGRs1U94poddbsKGDcld4aRtP+
	OG/Wmo0+esIPTP1iHLfP1KQptu7EUo4HGLKf7U+Dv4oomTdVgAshuM+nmydbXIgP
	rUV8S5kf6UbC7jBoY1wCq8gP/jdGpMK08EbfipAQybU9CCHDbqdk7lFx+twQCkSc
	DN1hGY1N00z4475s0ToQChoHB8OoONC7r4g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyfct0yk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 15:29:17 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-948b41f95deso8518134241.0
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 08:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777994956; x=1778599756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tN4fIreF7QkVH40MlowXeuD1uw/trVOC0mA/BRremrs=;
        b=EvbaVyOV7BGuVjvmaxd/wkHdgw7koVNuOd1hhtNegWTaVnPfo/Oj2S+ltgwQXRMP4Z
         f7fILd5i7MzI8XQzlN+og+9JZDzClcLSQlX4eaAa/ITwMimyMvYpsOz5Dr53taCbwwoY
         dm4Ye5qeXtGtgQ4FmoG2XgjqKARMXJ7wF1kKdB5OAvAT9InsYWq8VTDETqDARoa7X7+Y
         DBEccXEo9XpsmLyNMrW48t9mwK+Y7VxwWtNcEO5OJ9X6LDwcCNG4cOcCRRiV52CKjtEC
         8pKutPdeo8NpFp4D8OAKY5d4Baz7/pl3jyX113f8H/5GcyHgQI5q2GGMZAuN7nt5jObF
         hhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777994956; x=1778599756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tN4fIreF7QkVH40MlowXeuD1uw/trVOC0mA/BRremrs=;
        b=onQkInxPSerwEhyNz0yUfUV8bPvmhaCU9jdR3haMy14Q7XPIXXzOHc9nuvln+R15Hc
         MbR7ZBIbMpv3H9Cg92i5oUqdbQTZvq2oRJj2qUw9JnTkb0VjZyGPPrimJvjSA1Ta/uUc
         yFJLX8fOqVgoD+FlijpheBJ0y2dmTWesx1HE5K/iR8DaxJDcd8O53mlCuqiaL0E67P+m
         M8xoX6E8KSxpBNBceajdimyI9858fT+WDerxV7gHPV2FQvAvOmwg6LsmdTehHb8JMNrW
         LPoIHdRnWYf2dQWFoSCKe9I97hR1+TxqlFufQU8N6fB0brTqRaqgmkv6Hg//rOnft5VZ
         CyrQ==
X-Forwarded-Encrypted: i=1; AFNElJ+d/PopEYHpPuFDp0nR734IwyH+WmjMvJT8gtAuRVTo3ePPPFK0zr1ZhLzgjX+GB6A/wMeid8rbIiw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0DXVq6wt/39S/899/CqixqOHEd26YbdFFIAxJquZ49BL9exPb
	WNM71fTKSQ407WjecwaAR+G5us+ryo6Cq054U/kJzG31FFtcT5GRPpqbjRcA57woys2nKPjLo2S
	uWwboMwTNsy7jbhCw+Jgu3a9tASvMHbev7xLLf2m+mWScMx+nKjmYY+8zRikbQ34=
X-Gm-Gg: AeBDiesjwbx4dlA1JpkI3MMeRvtCnJMIkIEIrHqRa5dmZ+0CSPtCnBdNEg1eqG7lzp5
	nVHL4Pu6FdF70zCd+KB6t+GstD2cgfJtISmESSufDEhcsJ7LoQ2L13BW6nC1bZlkP/f8tHMZNyD
	BV3dK9af/JosM+IkzSPNvaR+kV7Fh98a8eEWO4VeatMeNIjTxcub05O7/cskrt0QchVH08Kc6m5
	0wwA83X13433FBf8Q6nhYhMetka4hftqGrxTh9/yjDFATEcIZeOxBXU3v58zuFqVsMNHxFMBFV6
	aGphOJHoJ25u9jtjuB6OjVzVC8wbOkE0gC/T9qLoYRLlT8Np5HFTL7z6R3j9pYLEsNZh5raT84k
	rs9GYHTCLFZiL1bU+zj1AB7i/rIV1lmvSs3wEUSb9Y2t4RDI=
X-Received: by 2002:a05:6102:c8e:b0:62f:c97f:aed1 with SMTP id ada2fe7eead31-62fc97fb58bmr1322547137.26.1777994955945;
        Tue, 05 May 2026 08:29:15 -0700 (PDT)
X-Received: by 2002:a05:6102:c8e:b0:62f:c97f:aed1 with SMTP id ada2fe7eead31-62fc97fb58bmr1322484137.26.1777994955414;
        Tue, 05 May 2026 08:29:15 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052483166sm5469103f8f.7.2026.05.05.08.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 08:29:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
Subject: [RFT PATCH] clk: qcom: dispcc-x1e80100: Fix (possibly) dumping regmap
Date: Tue,  5 May 2026 17:29:09 +0200
Message-ID: <20260505152908.302097-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=nHnStKl3uJBuouJWIi0baZMrwQ9zRSm8k8wt5bYzhqg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+gzE38I1YaUUW1VMQGQgFWTaZr7Yxpmp0PPhR
 59OF3l5V9WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafoMxAAKCRDBN2bmhouD
 19q+D/9xqUJPUdhd5zd+J0k12oWzx1QR4nReESffrx1EDErTSGQRGS5xPoEh8jmZ0psw5yQoZDg
 qnWI/iRHuCy/TM2Pv0/mszp6dUhgGOvQduuZtrcnWyhYE1GKgWwwGF5ZN3rXTsc70bUdbGLkliU
 SRtov1DVtL5LrlF09uiqZ3ImQniF3+w4GpobgdtZ+1lGMGzXSOjIgHznnkG8o8XIDmMIaIGm0mP
 usXIoTnF/20tVWHnY0IayPpZ/lDpyxv+2rYXnJJh+N4dcvT84Lcn92wXmr4NyfMmYKlgsLh0TvG
 M9/IPWVkIT7DqyXHfwlLeQKb/jEZ2pm5lgUK+VvU6TizXXRF0VVI+V03P3tR8Qk6VMsTJqD3mS2
 zKUdrj7337tlwV6AIWWHO2X2mAyGqyksYXy6qo3NT0UD7Xwi4vU3FyDIbCykYa33xeo+IqKnhCo
 lkk+yFgOntkaqym84T2h0eLFhzC5uN6QnAe33jWIqgHlocTuxlrYyBm8QQvsfKmOXzHHhHgRsgS
 0ujMq4/jSI0nQxt+8kImw+IIISX6t0Ej6sK+q6J/Pm1kvKFIGKhHoQQP+qdUJAk5UvwPV3gFfH9
 7CHDVU3XMZEX4urURCyNQBhG8oj7m5tlhFrRgUf5YIwnBNbe2xY9m6KHgR+WnGs/n+rdzQYr5La 7GvzKz8FizsUX7w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cAZIGBd-V-59-EsutU7W_O0760zFN9u3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE0OCBTYWx0ZWRfX8KfyBygVz7+o
 OYPoNPi3WGX1gG0C1dnCH94tbR5d9NG8fzgQ6DSPQWUIBNXwRo3c5zbmfcebJl/NE0V+uMzeSIs
 f6g2UGA7UfNVrIvsYVQBYrpzWxW3i/M9CVHoU4R37P33JJnRknUecb1Oshn391sEOrgWxf7WDX0
 iqHY2g9PgG/8ReR8Hr1ShRJL+oz98MpTT2Y1TuWFPY8Gpj8sxG3kBo+WsPyzCTYMpTl+xGKsCLj
 Ye6x6z562eQVuMOcKQmPfa0dVmUltTuzsKn9P79paNpdgluNBzKQBowAh6dyGMDDYXd494GPa9G
 MmGo7neYiPar1R2V1PvIixYhyUGF7gR7AIAqe0PRT/xhEmeS08RGrm5F/M3TMDrj+pzz0aBqXDb
 22QYL4ulPIKn2LynH09CoDaPxPrMbZuHz6sjX9Y+9vpzJAIb3hy1Vxm0MFM47I41wUuOmcrSxDQ
 NOZRPwKUygjfglRqvug==
X-Proofpoint-ORIG-GUID: cAZIGBd-V-59-EsutU7W_O0760zFN9u3
X-Authority-Analysis: v=2.4 cv=NtXhtcdJ c=1 sm=1 tr=0 ts=69fa0ccd cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8 a=vgyWbCOFeP7allhJYfgA:9
 a=1WsBpfsz9X-RYQiigVTh:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050148

Reading few registers at the end of the block (e.g. 0x10000, 0x10004)
might result in synchronous external abort, so limit the regmap to the
last readable register which allows dumping the regs for debugging.

Reported-by: Daniel J Blueman <daniel@quora.org>
Closes: https://lore.kernel.org/r/CAMVG2su+V5fcZ9LOC0Qm3bpfnhpbmQdJackc7-RvfztDL_dajw@mail.gmail.com/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Not really tested, just idea based on sm8750 and datasheet/manual.

 drivers/clk/qcom/dispcc-x1e80100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-x1e80100.c b/drivers/clk/qcom/dispcc-x1e80100.c
index aa7fd43969f9..575ba90d2070 100644
--- a/drivers/clk/qcom/dispcc-x1e80100.c
+++ b/drivers/clk/qcom/dispcc-x1e80100.c
@@ -1634,7 +1634,7 @@ static const struct regmap_config disp_cc_x1e80100_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.max_register = 0x11008,
+	.max_register = 0xf004, /* 0x10000, 0x10004 and maybe others are for TZ */
 	.fast_io = true,
 };
 
-- 
2.51.0

