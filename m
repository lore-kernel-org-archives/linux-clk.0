Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0161841BA81
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 06:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526122; cv=none; b=BhSIZttg0WybQDOAAx0CEvsevZmOXA9IQ9FLiv53ISTgqqcS78D9ytTMH5fQ001GjaK5S6O9YnS15CMPT6sg2EIA6V0NzzQeek/rNjJHcKLJ9ElawwSeg8FeoKt3G7d/gZQ6v0CzuTiXHIjqGpW6cGhDEY2ze+cxlOgNjTopXCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526122; c=relaxed/simple;
	bh=bDo5V1i9/RWDoQwxQteEZEwD4Ri1WKSOwqyfFQS4C/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gHUxrwAs3atD6c2RHtQlPQgRi/O0Qi6ElMD9ZOtlB+tkeKgibcD9RGyAaSlInqk1HczPMxzfWGnjoRpfL37Bw+RLtIAX7fdixQfRF53qj10AmPfkyEqa6X7QKeF4WDNmEPKeU7jT3HMuiAx2auHWdu9zexMjbOknGCUJxswuMUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwId+N9J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bekhIYBo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwId+N9J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bekhIYBo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HCE3593957
	for <linux-clk@vger.kernel.org>; Fri, 9 Oct 2026 06:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iArE7Nqfazy58+toWHiMvr
	1jpYAwQqNWDVhTADvn7A8=; b=NwId+N9J7yHsG68MqHb0RK1V5NCl6gkdleS+qq
	FbM4QXl5Z9iZVXSumAhDBKuIvPy/yDStjstuBal/vFzkIF72jaWzcHhd0ftK/2Ky
	n5o2sx4AFV/42yoxeoD77bGaKEwQb5LxyO+10ADOOTZ23mHVbqGmgMp+eCK47SvY
	P+xKpYMRm9IczESWw/rGrlBI+ZyJM9YMlMfXCfk2xJHQehT1N6IqqQMRjI0GArwP
	/MzNp0YJEhkP/vFaDuxdalKMRn6SWSHlSHHJPcF98CQZAi7ZRN8OjvmTmlZl0E11
	tVIBLMTiGgztkOv8wvDIJzUxUK5UGx3xVD/KFhdoJWBjo/cg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj3cc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 06:08:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4fc935a11so3922604a12.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Oct 2026 23:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791526119; x=1792130919; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iArE7Nqfazy58+toWHiMvr1jpYAwQqNWDVhTADvn7A8=;
        b=bekhIYBoB/9pylM356xkcBTHIrYVTlo30VQo8blFPAEL2kgqc4M+OGimCc9myS0H1X
         0Z1H9YDyMNlMbehrY4KcgylSzx0eeXhhRrzAye0Tdm172QkTGyNcu6i0aYxk1BzdqlAG
         PeYrpKDhD5dcBWYI/0AWY/f2Tu/ujooyD+rEhfFuinioxdWIKDI4AQVRfQHsyd4rmmYU
         XlXGME0zb/fLAdB7UaZvJfhCR57oWi8SCy9UGDFMQCPEECrSKOtRTvrDuJoEa1mPh7IR
         fwr5zyP4wsWU1e+ETboS4q+Cf2Bszo5VfK+6IUhlJOzH3ct8r7GUIzA67itJQEVFyRtm
         ivKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526119; x=1792130919;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iArE7Nqfazy58+toWHiMvr1jpYAwQqNWDVhTADvn7A8=;
        b=xync+u0+xbX+FEf+Lq3CJ6ANb+NEXJUChrMG4KfnNro2fo15rr/KMSmCiblWgV70bL
         Ciq3Ai2iLfdW2QqD02v0dhV+kcaKV8wFw8skvzBngjm9od6fuy06FRh0fSndebeNFx0K
         aj+xUCfFK3JffYg9TCkD2SFOz5COFboc1gcXhalaPW7Pcd75GtE0CTWzlYk7VvLrr4Bm
         DQVx5Da1UEC1Zy4Gdonx+dt6ei4XV3P8fdhVWnRkEmga3NL9pPjgODvQnUR6eycktu35
         RDo5Ko4BktuDBVUmXWEQVrq4mnkFX5Zf9umbmn5djLmx+koLNqQkCU0bCJQn+R1uAYWC
         OAvQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9cl7LV4ChWIkOkuuT2uB6D50UfOgHrQzeyiUqv+aow5Qbfv4QiIyWFh/SyCkL7K5JYeN4Fg0obVc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIW5356AUWznmnc+rJ+lzFMg6q4+hNvYZihOoaqAYOkxTsEbxi+
	VlrdcWdZvzt58b/YsUVRdGlqnaVU3AIT4BAvu9RPi28RVN1pZeI4rnGAn2gzux2ahVFvOIyFZX9
	tsbUicBYokfOE9VFTMdrNkieFnMWq94WapCYFRv+yReO2+ijyXmldxThCya8MojA=
X-Gm-Gg: AYBFou3J1vK3l/0p6IM3AZXhqZaMAoS+mGiHSJF49VWDV6HmW6wXNwvEn2aQs+kzHik
	XRBVUYSviA4qT0s3bfdrncj+7Tx+1rKMf2XIruB0bcx8YkyFJS7vSR7ADmC6OxsdY2Nzs/L0Qn/
	uImGxzDU+KKA+h0REcCWKkGE6fUe4FtNMhdBpzo2WCl34UVXzucXD/XVinGP/hC5qO72MVlrAx/
	EtwA3Bv1ho6Mt5qaWFpIdD80qXNhnyk0nHSJyYf6PIsnTTfX3PVY3Ny7HtzK3Uxp4QVslweV5gZ
	v7j+YWzylH6hMw5N4kdf3uRoKkToYXggwyomnqazfN/GWZcNeFPU8qVQ07KtsViNOJP+1U7jKDh
	JW9WkJY+QVsWwpM3e5v3G7O+Dia6z8g==
X-Received: by 2002:a17:902:f54f:b0:2e2:e5b2:6451 with SMTP id d9443c01a7336-2e842cd23bcmr8021135ad.36.1791526119309;
        Thu, 08 Oct 2026 23:08:39 -0700 (PDT)
X-Received: by 2002:a17:902:f54f:b0:2e2:e5b2:6451 with SMTP id d9443c01a7336-2e842cd23bcmr8020905ad.36.1791526118834;
        Thu, 08 Oct 2026 23:08:38 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8e11sm4010915ad.57.2026.10.08.23.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 23:08:38 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 11:38:29 +0530
Subject: [PATCH v2] clk: qcom: negcc-nord: Add frequencies for
 ne_gcc_sdcc4_apps_clk_src
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-nord-sdcc-clk-v2-1-e00ecfa321c3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANyEyGoC/3WMQQ6CMBBFr0Jm7ZBOoSW68h6GBbRFGoFqRxsN4
 e5W9m5+8n7y3grsoncMp2KF6JJnH5YM8lCAGbvl6tDbzCCF1CTEEZcQLbI1Bs10Q+plNdSur6l
 pIDv36Ab/3nuXNvPo+RniZ88n+r3/SomQUFeVokGqjrQ6B+by8eomE+a5zAPttm1f/jVuQLEAA
 AA=
X-Change-ID: 20261009-nord-sdcc-clk-1b23f4eb4177
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfX0QJLDul2MTRU
 o85T3FxJJ4kn75z6l8Jauf1Z6o4mJ2Z+s9U8iKJgcPHc1uv1EpXuwp16DOQfVGkVzV4xRecnNK0
 /4Bt9u9EkdfOEYf23bBuFqTZL4wV+GEWX7H3GpGKinDwfyRMhwhKeHUVAvBGfxMiz1hi+fDq8/7
 JGXnwXh6OT9MTN6OKF/xV8lLhcEBTsUO7yUhZ/gS2CbTIjeCusvAdVddZar2XLKQ2bKfotls8HN
 0mFihGGUKD78TRjhk2YPkPtaRa/+5NSY42vSYQNfUnh/DzzJYPwtndp7en/RxolHoRsoQSmR2i8
 EsGOHCDVg5Cx8qlWxsUe1hWheTcZODkgrwYuqM3mi4FiO8sfQIVj0ZbZGpRxPg5UbwaPnoB7Zc/
 kevB/u317UJHCQlJlrVoRMZ0HEBgl62FN+asBMnpilwIdH3Jsh4gLQzQA/qsFEDxR2EduR0Obir
 tsTApD3TBl+cW54nFVw==
X-Proofpoint-GUID: jZ82HilhhTy0o-9lmCkYdfTaZsenIm5y
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac884e8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=E7-qh2Fnl_Ea1JZtUYsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: jZ82HilhhTy0o-9lmCkYdfTaZsenIm5y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfX8XZenIE88MOc
 otEHzWgoX7TVcI7zXA11JkyTmTsfUv0ttl+OGujGDDreN2qtSgvZlFPNJoodU9dVFktMFgQNhsL
 pBMmsaoeat88O6nqUolmH/jcGhqDa3E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090024

Add the frequency table entries for ne_gcc_sdcc4_apps_clk_src to support
the additional clock rates required on the Nord platform.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v2:
- Updated few frequency table entries to align with pre-div reg width [Sashiko AI review].
- Picked R-By tags received on v1.
- Link to v1: https://lore.kernel.org/r/20261009-nord-sdcc-clk-v1-1-63351f25a165@oss.qualcomm.com
---
 drivers/clk/qcom/negcc-nord.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 68ce4d6278baa5888b277fb34a135d7e5beb789a..0e33737475d98f1c37853a5e234831d03dd50aec 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -436,6 +436,11 @@ static struct clk_rcg2 ne_gcc_qupv3_wrap2_s6_clk_src = {
 };
 
 static const struct freq_tbl ftbl_ne_gcc_sdcc4_apps_clk_src[] = {
+	F(144000, P_BI_TCXO, 16, 3, 25),
+	F(400000, P_BI_TCXO, 12, 1, 4),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(20000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 1, 5),
+	F(25000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 1, 4),
 	F(37500000, P_NE_GCC_GPLL0_OUT_MAIN, 16, 0, 0),
 	F(50000000, P_NE_GCC_GPLL0_OUT_MAIN, 12, 0, 0),
 	F(100000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),

---
base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
change-id: 20261009-nord-sdcc-clk-1b23f4eb4177

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

