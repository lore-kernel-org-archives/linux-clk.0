Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C0930146E
	for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 18:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758652728; cv=none; b=TDtqG41GGjL84EiP+UuStBmA2yXh63n5rjoRHlm/P2dEacMZg0AFN7wM/h1NEWk/UTMzDB9CtHwU3xwKwFA1cdszFa2LrKmhs08eiCbjDEB37nxazpfXFNJLpxmJScmqGc4yt5PF3BUtbzPeDQu7+Q42UzjvLC3kLB1oXDyB2Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758652728; c=relaxed/simple;
	bh=Sb5UShRUU4nS9qa42rFaj2iOMPPLKIv2ZgL3lYceuN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Y14RKZsmz1GYUBdY2m20h+xgxsD6PiKIt+deoNx/dqpstbOGSD2UKxjVaIO9lAcG8mXmKOCzCZLYqvWuEp2k483wDsg3MZ2ZIrXQg28VS0SN2U2+Qi4qCAto1v57XMk02odiwmvYSgwAF4O4VBtP2V4UadpG9N4Ohfs8bIrlmfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZ3u91zt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZ3u91zt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NEpS8W014326
	for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 18:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PpmjLuxmp2spV4egFFC5nK
	8iX/6rY6ZR0GuyNkpgIV4=; b=SZ3u91ztvNpz+R1YNO7mLrhDlqdqTztThSWvnW
	Zwp/hdsMOyENPeQgmPSRjNOu/fVSkE5+kOZJsOxzQbkZL6H9YM3u0ot2y9TqwaBF
	hFKrgtdO+YyPTbIQZoWlAgnst6MeYKElq/dQrxiTtc4TN0VBVw//e63elRDd75fp
	+RXMoJEM/NsKKuElU1FHA6HNo8g8Tur2kpvwPxGg8IRZ5rfEOq4NkFyewXTXxgAl
	jeiXWPucxlvD73S8Jkm7su9hzkflGyUU/bGZDqWC6mx7dBAtVE4WZEoK+x6JM8Pv
	I9yDqOdg50unPdDLZNIG+6nz2ylfnIYMuSdlrCqB5kMisWlQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp08qvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 18:38:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b5531279991so5343570a12.3
        for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 11:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758652723; x=1759257523;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PpmjLuxmp2spV4egFFC5nK8iX/6rY6ZR0GuyNkpgIV4=;
        b=XYd36RanGbOdwUWwCQb+PR1qX0kJqNM4OS+yJvMnlus8ZDb11BORIvfI1sGX+/oGew
         fm/PTnkMVa0ZvojuvFsyE4Dr0s4+PssouQZSa2FViHTDgyWvCKUD2IcLpX8qc263kgI+
         K2qiJ7N2oC/KD7y+WQ5g21fsxeBp2BMhr1pVgAlKQdol1Hfgasg1ymBLDBE8h5gIIzrP
         SVf3t+hjW1WEiIQwthmeWmyc8LBZ/CWL12hh7w/GM5E/GHQ60nqdmfdXmaHuilGX1uCY
         Er8EoIU+/roygp5mxsGyJHNlVYN0mfo88GpMOLGgMD/ATv53RvoDLm8+notPIulQ54v3
         R54Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnMj6tIdIKm4KFwMvWNEpbeJcmVJeEwFV6g/iZ2iM3N8RVvXniRGeBOONeSJTTPRe3gbYoVop6uTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmZ0jHLv7HD0chtaO65B8Q5baYjK7JEcz1IEduBokFN6XxcOMl
	fogwsSohELUT3Bp2CJHAymxQy8DMfKpsNZSeu6L2yVdNtK/2nKXCXJpSXlmCO1xgZ5cKx943RW4
	O3S/8gTsYGh0+gThJA2M+n6DrqCGYLga2NWlR7XJfsh52dky4XOROtDa4bgZkevQ=
X-Gm-Gg: ASbGnct4hkn34K5VGiDdSHLZ4n5JdfXrdJhWsuErem+Vf1zkyqY7QU+3z5brXHRPy7J
	TDUDTHnNHZQVGsRByJQG1LOB8ksMEIgHroL++5WHpUzZ546jcuvsu4YuCjM+UX//LT3PVlzr2KJ
	BE8n/GjpD2Z1miRSxE1wXe7zKVo6R19P0oXkUIexLSN7zxWTPvqQQ8MgJpnsXz/CjW//bfm4fj2
	1kCFl/TFOeFjZ0tNnV1ixXFDao5VCGBsJRjZ87p1rXgSyqexj6yUQbef+AF4R3fl/2BZvmaQi+N
	g0xKj0G9jbwze3AcBefdAl+tiEPN8DC3/lAdwvX7AAOYiO2DMSYPrgRaY+jZT1Mb
X-Received: by 2002:a05:6a21:33a0:b0:279:e1df:e62e with SMTP id adf61e73a8af0-2cfe89904fcmr5312532637.33.1758652723488;
        Tue, 23 Sep 2025 11:38:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXVKYMbhJ7Op4WfVtc3IOETl6QNgVCQ3ov1ovGOrF2/AQJsnpr3zbM9dR3JuHZMktYi88O6Q==
X-Received: by 2002:a05:6a21:33a0:b0:279:e1df:e62e with SMTP id adf61e73a8af0-2cfe89904fcmr5312505637.33.1758652723091;
        Tue, 23 Sep 2025 11:38:43 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77dbc8e7cc4sm14722384b3a.29.2025.09.23.11.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 11:38:42 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 00:08:30 +0530
Subject: [PATCH] clk: qcom: gcc-sm8750: Add a new frequency for sdcc2 clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-sm8750_gcc_sdcc2_frequency-v1-1-541fd321125f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACXp0mgC/x3MwQqDMAwA0F+RnC10FZnuV0SKSVOXg91sUDbEf
 7d4fJd3gHIWVnhVB2TeReWTCh51BfSe0sxGQjE461rbu8bo0j1b62cir4HI+Zh53TjR3wTGGBA
 n7LCBEnwzR/nd+TCe5wWzky54bAAAAA==
X-Change-ID: 20250923-sm8750_gcc_sdcc2_frequency-debfdbbab8b3
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d2e935 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=CSdScD5nXC4I9MN_FnYA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: GfmpcWcoSgq33GNd7C3LTY1wIHpH7vuv
X-Proofpoint-ORIG-GUID: GfmpcWcoSgq33GNd7C3LTY1wIHpH7vuv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX4Uza5GS4ory3
 ir5haXwHtndB9tcDygWQw/cka48KB9IGtPGUhUwocbj9pO7rKTufp6xNB9wWhLentXTQXJAQp33
 6cy80COnkZhlAxkoqlnCc/LN9AoX2E7X+v8/5mHWBIi3Cqplex1q+zB+BXyOStZVJbyJ+JMNSYP
 C691NzZRzLruRTO1nljUs1kCADSOkRtEDjHSrZTjlIHr1kb2i5dKoazpuHMPwXnzPuTSWjUQdZq
 Z6UE0TJyTDXwwoW9SHAn3+nriIh+ctzLWWt6gr5xKT4P3TCh07ASFYe2sfxxmBpgbYHWehMm/++
 QD89DJn3yjd5ac3ISQOBAMYKZ7SKwZutdfJOPoGs2ms160g4vZUeXNAj2TrW7sSXzwsXBP2opx6
 Ph869vT/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_04,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

The SD card support requires a 37.5MHz clock; add it to the frequency
list for the storage SW driver to be able to request for the frequency.

Fixes: 3267c774f3ff ("clk: qcom: Add support for GCC on SM8750")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8750.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
index 8092dd6b37b56f4fd786e33d4f0e8aabcd6ecdfe..def86b71a3da534f07844f01ecb73b424db3bddc 100644
--- a/drivers/clk/qcom/gcc-sm8750.c
+++ b/drivers/clk/qcom/gcc-sm8750.c
@@ -1012,6 +1012,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s7_clk_src = {
 static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
 	F(400000, P_BI_TCXO, 12, 1, 4),
 	F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
+	F(37500000, P_GCC_GPLL0_OUT_EVEN, 8, 0, 0),
 	F(50000000, P_GCC_GPLL0_OUT_EVEN, 6, 0, 0),
 	F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
 	F(202000000, P_GCC_GPLL9_OUT_MAIN, 4, 0, 0),

---
base-commit: ce7f1a983b074f6cf8609068088ca3182c569ee4
change-id: 20250923-sm8750_gcc_sdcc2_frequency-debfdbbab8b3

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

