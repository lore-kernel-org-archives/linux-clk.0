Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64095393DF9
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 20:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772139295; cv=none; b=DI/ak+A5rL8Ryg2ERRXVIQTmx1SO0iKSCUYWE31DuVKhlil+nm/jX0YR8M+s+JHckQMutFKCPJ7NzDBdj9RvPoiIkZt5WqTm9lHCLaB1WtzJPizjBfURi9kkEMYXHM3TKNKDL/c/VaY+H4gU2C8SRVZKzT5SIh01FjdQ6StfMiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772139295; c=relaxed/simple;
	bh=m4qUT2DcN9o16RFl+wDC6vakDNliRu9mxMyCMFrfeOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tRTehh2HLAqk4RsFoXdv64hTQjbBXFNMIgt21ALyRRdmQSUdgudOEVBJ0GpBIUiUFZXuGQvZoFK+t49kw9k1INQiY8eFqfulq3o9rblg9XJVyl32/lCLExbrFUbPHHCIxCqSh09kOHJZTYt43kbKPYmrXqGWc6K1KzJf8pKfLRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=arCW81zt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jZQrQWWk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="arCW81zt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jZQrQWWk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QHEcLc1825461
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 20:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NiVdBMKlsd0
	T91NmV2dMeXxvCyBTnTMnUqZzwzi27wQ=; b=arCW81ztO8XdguZ7sVZT2UTZBH8
	oKxkge09e147AErzu252TJpzxNo2cguCOhC9u/ZU0+wiZfLhuneXJxeWaL8okpB4
	QnMgI6KdPWdYs2CdMZmSFN4eOBnEfE8u7qyp6XDe7A2eMDxJfbpiDeu260veQwRf
	p+ffSLJ2VQJYz3FEYEKu9FhoIaJM2LLzCB+uOIboDbNeCzbHcWMNMDnjFWIfJVwy
	uMprCGzut9nJYxliVfwaOi5yi0OcWrBJu16E6SMhj/7/9vO+nFBRzd/bahU73jQr
	GXKCQGbs0xHJK85cJNGfrtmgDszp6FhjLk4d16678AE6SBbM/L7hhI4Rgng==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjk2v2h63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 20:54:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-506ab115571so70479221cf.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 12:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772139292; x=1772744092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NiVdBMKlsd0T91NmV2dMeXxvCyBTnTMnUqZzwzi27wQ=;
        b=jZQrQWWkm7GDvqOAiSvxJGy+zc9+k8sB3TW6Jd0iN+kMj9f7Ry1ywPNhPace3SQKyu
         D9CS6KvD0mUUq9Eze/TWgrqNuk/FC9YfsvmA0iTlVgtFOFuoxuF8AAAFiIfnkoibFWRR
         8++PHzBogLMdxUgmEvb3b26O0s7bSbyhg5WAP3YTrq7XJID1ex516JtDey0IbIA5rXRA
         UbXIua067jiIIT2j9H6ypN6LBFefb41Wygi1V9lCwkbd0GCXbnPejWsWZcQaepdMayln
         NHpSRqrM7ple0FUg9jfLhvQbp97ExS5YzkBxvzm1YqOGPnxx644zPYxPTiH9oLtfgYXS
         c31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772139292; x=1772744092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NiVdBMKlsd0T91NmV2dMeXxvCyBTnTMnUqZzwzi27wQ=;
        b=vFSVK5AwRaW5qCmZvGeq9Tob51cSyVZjpzZzYhASWwAxl1Y8RQEuXqfgHlujoqUZ2R
         gLRhsqpwwjs1A5WzP67vM7uLI0WaruowpvBPeXBLkj9kVLZF+JFBi4WtVZAHG8kdSY/X
         340QEW/TprcAymS9G8u3ItUF4TFHdu8negK8vgOsHwoG5uqOoEu2MAgi83uxJRkkFOTm
         iXzAo7UjxJgRg7Jnmyo/C+W+a7IS8rHfYqHWkxbC3trkCSnOXeLamwhP5G4Z8nrOkQHH
         YzJkkca719Exfe5SzmUo82rN7oIXVmy3RZvq8jdeTaAjbfD5FYRAIbtIbaDPbahKtBaw
         5hng==
X-Forwarded-Encrypted: i=1; AJvYcCXjoqTOAXgildy5k1O8mXBNit+I4G6k+n5DUanGJAZbCwHcKD6kzKoBEQnhRzGOhJb8p2gOcr9eLWE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ODNbl9bQtgVvocuQv/Tvyix5n3mSC9w7sRqoqcy4dNCV8Z5I
	V/oWWkgRzmWI0N7faxahlD0lJk+XrWNvDfDkrybOKFqvyDKeCECfAWTC7FIkryYJlU5OWkgfc/Z
	ncGrdTRVyiqgZrBFJWbHtL721ZYdgN0YI1PBXESvjc8rkToLXH9NhJ1t81EPdN4w=
X-Gm-Gg: ATEYQzx0rE83Q5Erm2mOJ3BA4oQUrl8hEEsUJtbxfmQU6+p9n3Cm5j98vS4IfMszemK
	/dBl1VkQgxHL3UhynoIcnv71HvczdnxYWc9QVPEEJgzyy/qog7vr3/6DQ41UdvwsQmkBuaz2XJ0
	EfqZBb8t0s6zUOy8fcMU9EXWTAk9Zz2EYtDfsKfijh/TnGon9l42emgETbaZ0jVcu99j3qdjKj4
	RHe8sQkhzOrbKpEYBaFSVvqbYXFF0CJ0ZtEsmmgJKrkwiXKrl57/EZ5hP1WJVqdl3HsP2U7et4j
	ssJm/xFUPAU9RK5Lp/8E26nMdV5xY+WsD+yyDJ2tAjhOy/sE2uJsbwyg2cOkD6H5HB0H9mCOboa
	zmkaqRyhqLrOJICauKYhmRqrWhptTB83Q1z95Jw==
X-Received: by 2002:a05:620a:489a:b0:8ca:4438:b8ed with SMTP id af79cd13be357-8cbc8e08b89mr50388685a.63.1772139292609;
        Thu, 26 Feb 2026 12:54:52 -0800 (PST)
X-Received: by 2002:a05:620a:489a:b0:8ca:4438:b8ed with SMTP id af79cd13be357-8cbc8e08b89mr50386885a.63.1772139292176;
        Thu, 26 Feb 2026 12:54:52 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4a121sm60248025e9.8.2026.02.26.12.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 12:54:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, GyoungBo Min <mingyoungbo@coasia.com>,
        Kyunghwan Kim <kenkim@coasia.com>, Ravi Patel <ravi.patel@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] clk: samsung: Use %pe format to simplify
Date: Thu, 26 Feb 2026 21:54:47 +0100
Message-ID: <20260226205445.336839-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260226205445.336839-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260226205445.336839-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=936; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=m4qUT2DcN9o16RFl+wDC6vakDNliRu9mxMyCMFrfeOQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpoLMWPVamuOVoJEfriNBluk+cfq8Idwl3VDpnN
 GK8BwRStvyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaaCzFgAKCRDBN2bmhouD
 10a7D/49iXsP37Kn/qA5ewTJyjKGRptD2ATX/H4t2w9tRGCaUdY8qd4CM6VqBaPngK9irGYAYP2
 69Wppp4iFmMaiLekQEQ5zPS3BuHlxW2+ATKDIq9TN28EbuC87JURDH3Mp7Acx9StzG50b4r7vAD
 RhiquPenqlNxaMRusc+NbjQ94LNNJndOizSqWamBbruxtIZTwOm7mXEubtgqQAiNkMRhEeFV3xy
 +gelNyuHitXK/34C4ZxnPIRCoxwnguVgytGFflRNCWEmPV70XoNa1W/e1eNPLWm2z11c1jd84n1
 3I10LaIPl3/bnl/AXlMtU79cosODXNb66xbHXGh0ICpCWfOEmj9a2N3BY6maSGQjLHHFiAtPxYt
 MhI7F1AWPyD1f6qpQ1asugQcR6IvH/o14cYIRSpFLIb9HZ6J5SfFlN7U7j3T62meHZbOSiTFAA4
 R9mkfMxRfIBhj3mUx3Vg5IpqrwhZ5OHP2+ARN83rouo/OkQzg65d0p6sM6Ghr5MmrgHten9oqjB
 YZg963JSqt/inMisUJ30U3L0TNDUC5kdjUGCuURQ8zVvIb4jFJdkujlVWsjQExfWlIDnov8MKkj
 YJ23IlKrK2EXhsf0AEXWdb98RnHTrcGmzEs7wNuh/RI+OSBlvqSHKTGGGNbWZharnT1qhl/FqsP U5GMrFbU5/M+PXg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: T8V0dVE61cWiGvKm_x2bho26EMR1fGP4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4OSBTYWx0ZWRfXxIhjyZ8VJ/Ue
 6Kgj4u5ibC1vFPA7Sq3WZxXwwQiujhSR5VObAuqD4+ZMbmSI+dFnPRIrmuzhdQaoCXY7DL6OnjQ
 q9tJpGGu4q7ydNsNI8cCJNMpZzgeY3VRUIomBuYIDTZBCdgwJbm2J95CRZpV2xmtFUzmYgpqcdw
 OBePeF9VGqADtw7NGlkvNSUXgzJPSi+f+bwZ6WJKnNyaoN8t+NnHjuWy/uUxSizAWO68ccb29eQ
 EnbR1bMd5OJOc2vWDN7GtoeBHhEY0K+3e04whDtP0vOPQnMy2StlbU5OaCS3X+KGB1S9kd0j8jy
 TPpZkxyal62hGWVt/V9EBNzaovwIEudyzLKDhOlPlTMvZRTI8uimqWciG3R4Wmi0hj3XuItagjN
 FRdbDR5Yg3hM5PJU4pO/WSkSOWqbwxL/2VGNfutwg5HTc9BEvyDkHd+jGus6yjMrgCHcHuZcx1r
 T99HyA01+9QdznixI7Q==
X-Authority-Analysis: v=2.4 cv=PO8COPqC c=1 sm=1 tr=0 ts=69a0b31d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=PZc8IMUpVCTjZOrGUMYA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: T8V0dVE61cWiGvKm_x2bho26EMR1fGP4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260189

Make code printing pointer error value a bit simpler and fix coccinelle
suggestion:

  clk.c:363:16-23: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/samsung/clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 94b2bccc7d02..9d182f8c5395 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -359,8 +359,8 @@ void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
 				ctx->reg_base + list->offset, list->bit_idx,
 				list->gate_flags, &ctx->lock);
 		if (IS_ERR(clk_hw)) {
-			pr_err("%s: failed to register clock %s: %ld\n", __func__,
-				list->name, PTR_ERR(clk_hw));
+			pr_err("%s: failed to register clock %s: %pe\n", __func__,
+				list->name, clk_hw);
 			continue;
 		}
 
-- 
2.51.0

