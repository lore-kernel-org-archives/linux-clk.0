Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A915221C4
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 18:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788547880; cv=none; b=berFe4IZfXl7/4FfmqtDHY5uBS0hWgNOsn4LyhtmCOXNTrVQlQyZUuWOgISrUXV41euQ6su2HvhGc4EeXht/X1IkVQL4iVDGoODd4WMc53JMIKm/eRsLXtFLESv64v0tU0uFhkw9IQK0Ihs671Cl60MUEkzhyb61Ssy8itenPHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788547880; c=relaxed/simple;
	bh=ANtqbgCd+Qn4OZkETZWDUVmcawqHc5YlKvgeXREa9l8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j7qeA6ESHMCzBHrU7ql+VIta9XQImtxhYXSt0hcLteEcD/+yniXt+zkJlBCZZkVsvNTavYQxDlQb1F8kAEIU4/hyuLTS+6gMSHCvhepPyZGnDGXngy9Y3DKRPIKmFeusyNkxopj+MoTfoxAzwoijgug5ky58IcjBF3n+kwEpH98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cRL+Q45F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PnnIm/gc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cRL+Q45F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PnnIm/gc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HHmmL3663134
	for <linux-clk@vger.kernel.org>; Fri, 4 Sep 2026 18:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pRKYnRDxm0qqvtNyh5/LTfsvz3GZJFe8P+VRq9eSgLc=; b=cRL+Q45FdSXEgPKc
	Wh1NUXiPTZI7Ik6+OR7rRy+MobUJYgM7+Q/GxuKN9QlclIC6pzph0vEyaJYd2yih
	oKtbxQ/tDh1moewieoHiBKksVXKF5vbw9b+snTgd9trPRuaBJxdz3RHrocqvejVH
	mEtKfJSkR1JAjIR/7MwXvnLLugU0o9YA5S/TLJGr260St3dpMlobBofWE8fRKWdI
	3/bwI0ywwp+2o9XWykssU6RYaheamwEZUfylpxMQR99KOgQ98am/ZJpvk/aPRFV4
	H6oEI1xgY6dY5Jk3ga/kBe6Y5FmATfg4RUb0uxsCNysoULqhqs5bQeKcExZQbZuA
	ckywHQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg00y966h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 18:51:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso2653770a91.3
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 11:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788547877; x=1789152677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRKYnRDxm0qqvtNyh5/LTfsvz3GZJFe8P+VRq9eSgLc=;
        b=PnnIm/gccZreBTFlO/b+HiW2jQ0RKxTJAjwMb5uQvzyEsrzLGHARgA7VlH01rAGmHM
         wEC60yGQT6qqUWiLl0UBzTsV/33N3DnhKN2VnOXrrxQ6GOibC2Z03Is2nhpcz3XfyY9K
         e6bufQnh7jw4tHWmh6Kjt68TPavMmQLjvHNRFiIBlnfxLSlt8bIEYTCV819KPpVbMr1B
         9/A2lFJs2TILjWgWomMZ4Rw5VFa7XUSbQH6/5+lpJIBgne2OqAQnTXiBGX1bgoN/FSdF
         ExZVBvk5UbJN0zq/+2i0ycYfSjYVoyI5xjNA0IMGZpcMNDfKYM1+/nFb5dZWrxGJOwmc
         qGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788547877; x=1789152677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pRKYnRDxm0qqvtNyh5/LTfsvz3GZJFe8P+VRq9eSgLc=;
        b=etvXUb6UDxgQaVT5IyAF96o2CHp378XBlmtJoJzGADxZBf1EVxSV9RJbuVKC/Xxipl
         Wk4HSAdX7W6rVRTsPylfaHUNFBoe7SshxOfsWNCWafefADaw6eoXmfngwSQ+M62CgjTr
         eRrIQYtQdXn6N4vl6Fyrm5eZ0x43rmU5ZPOrZLzgRt0pzQ7LdjPB8SuM9zddYI9IYQ3k
         sTwOXGXZlIP5xfr/MZ613mZO8V2au5jKGX4yCLEAYE3SZTE4PWMd+F6rKO9eGJpbqBjy
         BrU2xyIF/JDWmtVGsenfQcK4FOV9ywhtLlCJ5aHNX6KRcuU7jFxS6SHgpi0Ew5I45lUd
         zzVA==
X-Forwarded-Encrypted: i=1; AKwUvBwKTZBbE87WZiVvirUI9LHS54/IX1wfq8XzxvSYlyLZgU9uHUN+E7SO/cSqUxs0EdhG+caAgULO2FU=@vger.kernel.org
X-Gm-Message-State: AFuF++kgD3O70cQ9bggR091U2aqPeqP70Baw4usoZ97P7jGtvrpxz9hf
	dCxvgYBfpC9BiGH7xk3HIx5D0N4ofgfIahoZRlROcfh6M1jnUp34lZvwEZRkw0THQeLRUeb0alb
	P3WY3LzJPqOy7K4XbSmx0LU2/ehjW/BY1vBtffowuH9PDLfP2oS5JZRUtML1E2po=
X-Gm-Gg: AYBFou2hXEXjowdntTt7je3FnVh/EQy3qcsSxsE/VeZ2dhwSKUwo+NWLQqTiYXjwB8i
	EJpf53W0+PXXzPDBQwJBQRZm5f1WTyRxoJsJBHzJml8VyaDE8J1BKsujAY7BMs2T9SUIGZpRc7W
	IeZ8JIx/QB/WU62oCjthWFWteiJRroPHC1mcjPQ2mVU8y82lnRSFXnBs/6XA+vEvqIP9rZ51yzO
	6TNHAQE/1BMLzcgrA9HR7qgjmVENmOdQqIfcB+zFS+eyTC8wMGPJj51VMndlMqh4pmcYN4ahL1G
	13G2/klCtOuPhxbGqYxsMLfHwKPNyN2DK0o6Punuh6tOEpy/56P5gioENS5iulCECt8uFYfY2oL
	7MX8CTebp9ytrZ+qAQuB7U+3f8ImAfjA=
X-Received: by 2002:a17:90b:51c7:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39b2609f34bmr13448759a91.1.1788547876994;
        Fri, 04 Sep 2026 11:51:16 -0700 (PDT)
X-Received: by 2002:a17:90b:51c7:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39b2609f34bmr13448702a91.1.1788547876563;
        Fri, 04 Sep 2026 11:51:16 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm8682644eec.24.2026.09.04.11.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:51:16 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 00:20:45 +0530
Subject: [PATCH 4/4] clk: qcom: gcc-glymur: use shared ops for GCC UFS RCGs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-glymur-ufs-clk-changes-v1-4-cdff2c67a8c2@oss.qualcomm.com>
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: uHKlIuHJ-GxKX5VJehoDsr0twzfnX2IT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfXwls7luyVhMs5
 g6W+10cqRoXYYYoCP4n9iDAVZyKgMzjjTjgpVzX3MB/XPLF048T0KYxtQEMp/Oy9Iuac3zPGfZf
 U7E9ClupNynFS6w7/2tIiowy1DXHbSPMsNcQomeU1ecZO2RjMZuebAow1WZt66xXPIL8A8A5WHt
 ai0XlhelQDmNQRl8gWiDFWDqgi+fq7MadiBRRNY1L21rjuBQ3HDLki+Oz0A2M1uCCubswTIUCZ/
 K7I0gh6Zghqn0UJSYMCtpkR03RQLjcPJpgPTZ3yzlCC8Ma7emjCmEG34BrpzctkBuObolsllA+q
 WtbrsX4Rm0tY+h9HUjeMl6lklptNU0tyqyqonceFPHtR1pbdTFPl7v5y/E0UxJ/7Hub2gesKwte
 SRW0jyH2K14YbQ8myNw9echyK9xEI1bpfUQBTTyqFoXzMYJowahMfPwT2oSm0iS8Y11gDX9JpMI
 ivtzkPXRjwyS+c4WLjA==
X-Authority-Analysis: v=2.4 cv=TsPWQjXh c=1 sm=1 tr=0 ts=6a9b1325 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=bkzknT1l8MNr9lhMUYwA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfX0ynrfSCB0kZx
 a5D0bzcUZ5D4BW6PAlBHnTOvn2Cq7XWLu1ouRg0DrrvaHgMts+BHW2xV7llck+G1cW95YTX0MNN
 DwIVW49h/opqo+63MJ892s7dBsuUCdk=
X-Proofpoint-GUID: uHKlIuHJ-GxKX5VJehoDsr0twzfnX2IT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040172

Switch GCC UFS RCGs to shared ops so that they are safely parked at XO
during clk registration.

This ensures the RCGs are connected to a valid running source clk before
the UFS GDSC is enabled, which is a requirement for the UFS GDSC power-on
sequence.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index a47a2c6b961ba01edc69be91e299a190f4662c3e..1957c847568afe3769ebf00a8cfeecc8b0a88bac 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -2327,7 +2327,7 @@ static struct clk_rcg2 gcc_ufs_phy_axi_clk_src = {
 		.parent_data = gcc_parent_data_6,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_no_init_park_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -2349,7 +2349,7 @@ static struct clk_rcg2 gcc_ufs_phy_ice_core_clk_src = {
 		.parent_data = gcc_parent_data_6,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_no_init_park_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -2364,7 +2364,7 @@ static struct clk_rcg2 gcc_ufs_phy_phy_aux_clk_src = {
 		.parent_data = gcc_parent_data_5,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_no_init_park_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -2379,7 +2379,7 @@ static struct clk_rcg2 gcc_ufs_phy_unipro_core_clk_src = {
 		.parent_data = gcc_parent_data_6,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_no_init_park_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 

-- 
2.34.1

