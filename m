Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7FE3D7D80
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 11:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558192; cv=none; b=RAu3Dosswd+ffVLXFbSFzqFMwTuHvcp4hjbDTPT8VF61ZyDBEndtZvfJ8S/fiOXBlApKswfDOHqGvYN7VhKrTMU/zF2lbWA4RFiBQjM10MT/LuLCMBRo7eXaqwiCzqJiMQ4Gj8UGYDcnGiDP94gnmjSrXsxP2VwvkCQIKTYa3ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558192; c=relaxed/simple;
	bh=u07xYUjbfEz64933HTdCJ5OvL8I7Dc3c0BGL8LdNwEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YY0Zw0O+XmbKfGC5vbPhPFBmh0eZJeJQMla6n1wjfgC8/X91mTDRiIyi2QvlbLY9V31gzMlImMg2UaWdScwGfn8PeYwNsc59StuZw6Tkc4wbtVE+VgRF+bNeIZ4dsR5h+W3q4Fr7SznyScQ3K1mItDJQRuNdUrZ+0baZaefBTsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QLkgbmE0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UMgd18Wf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QLkgbmE0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UMgd18Wf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92eRc3169108
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 11:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HKkSfrJKmbm+Vi+iWHWqdb
	NB1zQHXRNLQEPOhAgkdvo=; b=QLkgbmE0jC46AHaG5bAe+JZQncpJaWdfjuUBXE
	mjMaELs+RIrHRoiG4mL/ie1ar+qBPsOoLDQGU+Ohu/ZMunqJ5ESuPBleuZjO5N4h
	mkEjw+yVE2DRPwshhS7WgN19CK8aS4esMSvIVAzSbwZQaNin0zAl11k/4/6lKxTR
	LFQTvWRAB1X9C3/gJttML/S0hY0Yhy9huATW8Fa+0gZIS1CM8W7dolpqJV/AWalN
	1HtB7vjL/mjzn6dip1dxMujYB1NJpDZxEmJbN8DtJMGE/DojB0SgDPOUswStmK6t
	G6cbU8CUrjzT9Vq2TIlXID87wsMrbd/0Ny5iK0v3JehpYplg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqpu2rwta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 11:29:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a08ff8451so668265685a.2
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 04:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789558185; x=1790162985; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HKkSfrJKmbm+Vi+iWHWqdbNB1zQHXRNLQEPOhAgkdvo=;
        b=UMgd18Wf7AxX498uNuVDlxBSfdmIiZN+ZsUNgr48IjQDIRBACTm20jFqZcsXdtKAny
         b4nb7PnxrLO1AO6Or/bWk29Kw68pVOMhBuMd0trDMJVFJzJRuXGduRAgIPQIBPl+6KYV
         +LceNPro5JfqR9aBv1z8LLnElDsEAHY6q/GgYO9aR7ghfkY5ElbHiPcQ1VI0y+iNh2e9
         /fzkBwYNL5V3jX4VnfLUxQVQ6G+Cx9OzgKwmmAc7D5FWkS/NJl+pcR90t60G5ds4xFyc
         O1/8DwLY5CcV9kFjlAI1Q2tmP0HCInG1q32FzG/bfYR0j8Pu6S80O3o4QjHueXESJvyS
         2SwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789558185; x=1790162985;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HKkSfrJKmbm+Vi+iWHWqdbNB1zQHXRNLQEPOhAgkdvo=;
        b=f80XV/F80UKW/O7y5ZMWhXOckdPAeEeqdNEdWiDVtuqo6YLW1CgoWb9yEd1gjQwySq
         rJIO5/bV6fOQ60oHAagsWhPTlYe0xsj0foa5bnQNWfrCccUO/9HbG2xh/abO5WWcGJtH
         iaK3kV6doxZDijXOriKap0/VXCCplK/igOpxLSwvziI7E4+GVrt4oohliuOlUtXHsMhB
         NIdvh7yB8jsALpvrHhPPO1Jdy02SusvzFQYUH3TJK0F9d7k2kFzJNkUIHxmKlMgllsRB
         h+ks+tl1cT7AeVrtVgQ3gESDS6aFVVbdSI051RmHXpWtefjLaJpsVls6VS5skUWQ/mPU
         0KmA==
X-Forwarded-Encrypted: i=1; AKwUvBxd+8qG99DNAHzTbFI7mGp4WniwcpXHQwQnJVhMiafT75nav7XZgZt4nkEP2GLFxAE6SU21mkfRiIE=@vger.kernel.org
X-Gm-Message-State: AFuF++myGSGzyajyZkxTl+VrI78mO727vbS897rXkZNfGuyoxWArp9uO
	nbFVEoBa/E3Er7QbhJNWJ5SQgPO4Pg1yKdQW7nOAdR3CnERW9aQjp77Nux9sSKD+wGzEvNOy4IK
	fF6qJupOKPc/3MF+Nf+Ch8OFNeagLbM5xvzO1bgedE4cN4a2ry9MUxOlkHnusp2A=
X-Gm-Gg: AYBFou2BUC1DP7UglYCOV0uPGLGUyvvF2PIO9fCrOXWZwDcHs0KrgpjkEnq37R9FK+l
	5uu/jBYKfHxrDJ70YGWoUoj6KXO4mOBchZzTQPcCkX/EvP22DjT66VqPPHTiT8AktumqyLtjkms
	sxr4ojljBLUAlsLW+b6xwik1LumfzR7fVX5ry8pWp0Je9hT8G9GNO1yIQc7L+zYLK6/9rCqzRi9
	XjAKRNP4eqkpXRNQLWw1w/vQR3j/POi+cL5B9zlczlmT+xkxk+JJB8PDy5o00Aa0I+PM+Dd/nfw
	492yHQyeb5yz2WcUzGHoeY/AdGZbOuOkYsyh3ptS8Q6oeJkHrTyTn2s09Xgry4JVeWNG0lEtn47
	zLnSiwQc=
X-Received: by 2002:a05:620a:f10:b0:93a:18f7:5aa9 with SMTP id af79cd13be357-93bb76e6779mr321771985a.4.1789558184536;
        Wed, 16 Sep 2026 04:29:44 -0700 (PDT)
X-Received: by 2002:a05:620a:f10:b0:93a:18f7:5aa9 with SMTP id af79cd13be357-93bb76e6779mr321765685a.4.1789558184025;
        Wed, 16 Sep 2026 04:29:44 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dba8f4sm68218765e9.13.2026.09.16.04.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 04:29:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:29:30 +0300
Subject: [PATCH] clk: qcom: gcc-ipq5424: Fix TME reset register offsets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-gcc-ipq5424-fix-tme-bcrs-offsets-v1-1-0fa10674908a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJl9qmoC/yXNQQ6CMBCF4auQWTtJ20BFr2JcyDDFUaHQqcaEc
 HerLr/k5f0rKCdhhWO1QuKXqMSpwO4qoOtlGhilLwZnnDcH65Eed1wojjgQocxLU7sag7wxj4w
 dJcUYgnJW5L5xbevN3lkL5W9OXHa/1un8tz67G1P+BmDbPjVv4NONAAAA
X-Change-ID: 20260916-clk-qcom-gcc-ipq5424-fix-tme-bcrs-offsets-ed5288607211
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2120;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=u07xYUjbfEz64933HTdCJ5OvL8I7Dc3c0BGL8LdNwEQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqn2lwE0mGRqoXEzDB5+iLrIMvjxboiQb1sRsA
 chfljAEV7GJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqp9pQAKCRAbX0TJAJUV
 Vt/oEAC/WQy6c52Zevv1eDfxjkTUqRi0gH3FAoZSaCmnMCmNjBDZX941tfll/n0TVz/BLfq72sv
 Yh/qPUyn1y22iKBXhX1ay3UxTP7Rhq1hgZnlI5pp+EE63ApDk2hZzjurY1pn1fv+LQb/vYq0UMJ
 RjWwPROG8HsM1x/pEXY9AI6l/lfF5VRMY2E9/LUK4XCBD1zkpu/LaPKxj8wgCJjVn7p+vR9vS/4
 rJretpeDq9So3ZMU/yo3TxbIYq1rvsp2DW6W3EPO0EXQ24Yg8G+YAuHNGzLYn5MBJ4nD/rgyrap
 neNlLS/w08krtEAxNCWr8P2fxdMqLI3VkSEeqFWHI3ZBwf/gHr1fFmEYRqiPJUc5qSzd5GMhfWn
 A2wWpJQ3wZy0pZXyE+b1C/rXq/S+A5HRpEV/pMJp6WNJdfXn0hoN3LHCRioclvv1QeVrv1Jh7SJ
 PW+AnFrJD5XuO+Mbsq/FqiOlRKo9vBSiSVSNcXLstxloUdaeit/aaLn6bv9v9gJcud+6pU49342
 nMtzHYHQ1KmkZTL057FNENeq2dCN84f5WDC4GmNEDmH9d0EBUXEQm9qMXmIIqS2gkA8EFEmg6AJ
 pI8YpdJdisYgf9cnP+XxDoEg4ShYa1ZmWcx8toTXNTvRvjGvrumeveJJToc7HrtxRmI1C3uqkGy
 u9z6tp2X8GA0r9Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: WojuEk79OGJXxQss75d_-ERUwie1UCPi
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aaa7da9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Xhecoh7arBsju60niasA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: WojuEk79OGJXxQss75d_-ERUwie1UCPi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE1MiBTYWx0ZWRfXz5vgDYyabX7p
 GKGCyYXdMgumooJ7VGNx9zE07ecwe3RtOefjJL3LkVSJc2CONcmtKwqq9rc+lXmpjP+Ysa8DjUS
 JjlHXMBwcINOz98Lp06dZgIY30OkwgXh/UAogU+YP1t3UnVj1xb1onMc2T3dBOcqMUHHdk/5yuR
 NLEPnSYIY/A2mXhIEYVVEuE0XtgE4kHAPVlAGpT2ynn9HmwOUq6XuhVifjSFh1K9pgAlHdUQf5a
 zenlnSbHS5cLZuF+pOdAtFFEY63C9mkUTLwtzzJL7LlkSukuSa1c4qpGhl6y98ttJ0TBUUO+EUm
 ZG7u847tT4yxmc3CMzDlmis9W5uqyWibkWFAwe9hub/LWeoZzfTz8Ix21MeB76JW3l64HCRHoqL
 KjiSaYef0Mid0vclYBSCym/r71RRlE/niDmsPvUprJzK3h4d1JUaLAm1keHOvPlz1f+QRJnkjJ2
 lyNPKCJmX5Ymgrldy6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE1MiBTYWx0ZWRfX8agA9NaXYEZz
 FqnStjobEmKJNol8inDWNLBX/yYg7rZCdoznomAKZYh2K6XzDrsuusQLiz8IzOK3GBGnkqwI7Yo
 /kpVxtlBk50xiU8Lyiei1UZsQ8TjzgU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160152

The GCC_TME_BCR and GCC_TME_SEC_BUS_BCR offsets exceed the regmap maximum
of 0x3f024. Regmap therefore rejects accesses to both registers, leaving
the resets ineffective while the reset operations report success.

The offsets appear to contain typographical errors. Use 0x10000 for
GCC_TME_BCR, matching the offset used on IPQ9574 and the surrounding
register layout. Use 0x1a030 for GCC_TME_SEC_BUS_BCR, placing it in the
same register block as GCC_SEC_CTRL_BCR at 0x1a000.

Fixes: 21b5d5a4a311 ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5424 SoC")
Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
The replacement offsets are inferred from the register layout and the
IPQ9574 driver;

Sricharan, could you please confirm both offsets, particularly 0x1a030
for GCC_TME_SEC_BUS_BCR?
---
 drivers/clk/qcom/gcc-ipq5424.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
index 3ddd4b3aedea..32243e110b27 100644
--- a/drivers/clk/qcom/gcc-ipq5424.c
+++ b/drivers/clk/qcom/gcc-ipq5424.c
@@ -2949,7 +2949,7 @@ static const struct qcom_reset_map gcc_ipq5424_resets[] = {
 	[GCC_QUPV3_SPI0_BCR] = { 0x04000, 0 },
 	[GCC_QUPV3_SPI1_BCR] = { 0x05000, 0 },
 	[GCC_IMEM_BCR] = { 0x0e000, 0 },
-	[GCC_TME_BCR] = { 0x100000, 0 },
+	[GCC_TME_BCR] = { 0x10000, 0 },
 	[GCC_DDRSS_BCR] = { 0x11000, 0 },
 	[GCC_PRNG_BCR] = { 0x13020, 0 },
 	[GCC_BOOT_ROM_BCR] = { 0x13028, 0 },
@@ -2960,7 +2960,7 @@ static const struct qcom_reset_map gcc_ipq5424_resets[] = {
 	[GCC_UNIPHY2_BCR] = { 0x17064, 0 },
 	[GCC_WCSS_BCR] = { 0x18004, 0 },
 	[GCC_SEC_CTRL_BCR] = { 0x1a000, 0 },
-	[GCC_TME_SEC_BUS_BCR] = { 0xa1030, 0 },
+	[GCC_TME_SEC_BUS_BCR] = { 0x1a030, 0 },
 	[GCC_ADSS_BCR] = { 0x1c000, 0 },
 	[GCC_LPASS_BCR] = { 0x27000, 0 },
 	[GCC_PCIE0_BCR] = { 0x28000, 0 },

---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-clk-qcom-gcc-ipq5424-fix-tme-bcrs-offsets-ed5288607211

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

