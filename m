Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C4D5505D0
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 17:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170448; cv=none; b=TOAf60tVpDqIlzfBx0/zHcJy7iTNepm2OZHk7Ent0j8OhAYFjiwSFL/EbhztNqBo4ggYrhwAB9+1UVXQYf/kYEHA5p70XHeckf0zRuGQGkJRrLwcsDSB9piDPS/zq3fEHeufH0hmIspPCqU97ArRJhcaq6WOz5jy83tkLRz4NmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170448; c=relaxed/simple;
	bh=0KwjSoWukgYqAq90gzgdo8eC+3oMOgU4b4WGUOqDh40=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EUjE3jEjzIhV/yQYha8bzzPcbhTppuJsIyscaeYPUOs9GJHFKZfK6O931dHBPmfVAweR49aYEG9n5xs8WiCpW1P5hE51Ks8os1NmawAsnw5JpONg3zS44306oxmg7x+2VD0VJKEHguwVBy1e73QMru11n4tf7TbAIQFCduC1jTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NWvzoSh1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jVwyF8Hu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NWvzoSh1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jVwyF8Hu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5anW1613241
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 17:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ImWkS2heDc2
	Mx/x5aRQGs9bDAjmLZqH7xoOSJfYrzZo=; b=NWvzoSh1p62XSEgmMB/HEKXEtO6
	sAe/MuUxPyfdVmDwHf2dzxakqobVi0zjc7rvkIqR3Jn7LyFEwCrLARGRqGvyj5uN
	mSpdGzrpf69drK4dTgN3eFcFQ6WtrHqBjjLbt2Gd4CCDAEti/4iQxc+cGePfqILP
	DC4No4Zj85+aCgJo4n9ipVj6Ri4bThQRCPJPZk6KcNoggudGkSr3UuVN8Z9YVyAb
	tXQ+DhDPbdG6JFY9bGhVjOE/ExIxI8CgOkrdrHbv/2D/0P7kWcAfxNm5LQ8TaqHe
	OPXOmZ5G+o+dkj4dpyTWEFeexsMSPcokf9O9RpT2lF44rhKt5B8P7Ff5kkQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbk3v19f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 17:07:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb98809caso23097685a.1
        for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 10:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792170444; x=1792775244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ImWkS2heDc2Mx/x5aRQGs9bDAjmLZqH7xoOSJfYrzZo=;
        b=jVwyF8HuYFFwSpvDUQ9MHOqWYqZzt7CI2rlFuiOPpuThK51SmNu2AToEW9qoAdjBOY
         q+PN4SMYspTxia7MgtcKjjuHAujgsEeoK5VAaDgU/UHYhShLoT4FSLxeniSvr/t30PUb
         PiXQjVvtwwh4pzqOV3sWcJEXpu/ak8Od+8DXncy/oOW93zALDYQ1YztIC+jD9fALHczB
         OCsodbavBB41rDkTRlgXW45OraY/+FJnmm23xSD0dyZSE2Wyh2MKwIVhXffUMNNxcNW4
         2YW3gyu5NEUsdqVVgnYxNzdrePqAFRqwwTvPXmNvZo1qK/6rWF+QTKx6pM4yXdyWw7gG
         AqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792170444; x=1792775244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ImWkS2heDc2Mx/x5aRQGs9bDAjmLZqH7xoOSJfYrzZo=;
        b=PK6Hsp7haCZ5GrBQtfgRaq0C/qXRGT+yMVF/pTkoqJicsfdFFE8Q1Gx8yTGsTTfyjX
         k8+gKEdl8ATtf0l1gxZYjwMhM+O49cUAXlnvlvNzRoNIwG12X8YqBWFdvFSE98wlnswE
         5XDFXJGsJM1lCtkpcoeJLDp9klLvmoIWwMq3GlGR4tumXLkEVtwcbhsyhId3Y4cpP0Tv
         dIiOvo/qyiuOALErHlcgEN6OHX77F12Fm+fOcF69FFAcmqgQMXD+A95s2W1Tu+374L9t
         KLrnD17fTtdBm94xjWN//QEt6kvsgr/DLTVZyDeXyOUmqRgVy4dxWOxadLQHOIRRnjwg
         /e4g==
X-Forwarded-Encrypted: i=1; AKwUvBw3MwJPRIiz3AdeIFEIiEjpKj648asVyDrAnXwlX2wdtsBHgAZDknsoYbVj/PY/RoRHZjaAGlVwVh8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQdAF6n2wkntLjU8HPzsBA2LcmNfZy2z38Gf09TmlS+1zNBCVi
	J5YL+xk4oQuXtrMl7RVeKGX646lbLoZIz97WDT0KIvRuJhQrPoKzfaRACL2pqdmThu364kRWPY6
	3u1PJAYNVH+IQba6aRcujRr8ldbvtmvjWeDo8X/IM/qGMD3J5Ko3P8r2DrOKPYo0=
X-Gm-Gg: AYBFou2g7Qh0S63V02gUozyHy7sIp+dcL+Ve1GWLHgyK/w6kQa+6CqxFtJ2tidlyjnU
	9twvSXpwb7WPyrTsXrTCfn3jjx3wwFRGty03FVte2OLBunVQBuRcEmeyozpM0OpdX5FuEw29FN0
	6Y+nLnbJsxCeunutKePO7g5RyF6Bg61zYVFmSDy5aaLKLoRRNT6GSDbnE+lu6YnpNP5dLRWKe6+
	QmwkEBqxSQNgpHTnbEO8TWBje5cduc4w09p/TQY6BiG5T+PN+AGZBTg16YswZmN86XqB5sufEV9
	BEsFQgXb8X2nKDOdS206WCfUXRxUeglRRmrNeVIYurRO7Q6p087q2jp1YQ+3Bw9+QIM2+DM0NI5
	YFj+w1Lv52nHToY7/4vkxN44l
X-Received: by 2002:a05:620a:8811:b0:93e:6ee0:c074 with SMTP id af79cd13be357-93f29ce767bmr84845785a.38.1792170444161;
        Fri, 16 Oct 2026 10:07:24 -0700 (PDT)
X-Received: by 2002:a05:620a:8811:b0:93e:6ee0:c074 with SMTP id af79cd13be357-93f29ce767bmr84841885a.38.1792170443651;
        Fri, 16 Oct 2026 10:07:23 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5b2dsm6630571f8f.31.2026.10.16.10.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:07:20 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, atanas.filipov@oss.qualcomm.com
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8250: add camcc interconnect cells
Date: Fri, 16 Oct 2026 20:07:01 +0300
Message-Id: <20261016170701.1504338-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fLpWvPGbkfGZ0rdh0DeYDz7XjZF3Txv5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA2OCBTYWx0ZWRfX9PT6OHlCkA7h
 Y7m6TQHrU42tO4OKaZHP4d2Ig9e92Jw0PAeLPtFwZYwKYhcsB8zoHuBTtv+yn0L+t8uMEUzWdAh
 GfkG2n4bAAwPmxjBgHh3pk8TvyvjRZU=
X-Authority-Analysis: v=2.4 cv=BZdNQbt2 c=1 sm=1 tr=0 ts=6ad259cd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=UCxR3cWr3m5Lf22CgesA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA2OCBTYWx0ZWRfX+Az+00jH/AJD
 EKYfsh/f6loc5xJFUcbbuNTZCUXt3w7rGFLm1S01HvVDbUq08qH+8Oi1x63L4/QhEm5SFGfBIxA
 9oT/XqchiJDtGP9xeotS90lNxNqf6N3IwNJQzoHdvPH+LrP0lT+7BtmlQNgMVcyQ4dhbm+VJlYu
 OHrDPczkR86LGOrPlza/KCfCu27wk0/3Gddvq+kIqL+gjPJGYDrK1Z2V1SKApkoujmrTCDh2B90
 wvGexInX28DjtYFoAkJN3SgS8VoIh3T/rMdHdhslhDlYP+DPLvWskYRpOPlRTUZWjuZ3RgWBYm/
 EUWmZCRORR5ZJRQQwpdYExIAznXS4/U0i347hVHncFlc+pL4QhohCUc+JXSthAP3gU4M7w83w/b
 ng2OSsc9hf9nfDTerXOG0gsrOOnHxstu9xze9fXhG7rmhmlgjJHOJPm0gk1diNvnN5M3y0cTnIG
 d9lLUORg4JbiCe1KAXQ==
X-Proofpoint-ORIG-GUID: fLpWvPGbkfGZ0rdh0DeYDz7XjZF3Txv5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160068

Add #interconnect-cells to the camera clock controller so camera
consumers can request camera NoC AXI bandwidth through the
interconnect framework.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f975c2183269a..e923c74dc1435 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4675,6 +4675,7 @@ camcc: clock-controller@ad00000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			#interconnect-cells = <1>;
 		};
 
 		mdss: display-subsystem@ae00000 {
-- 
2.34.1

