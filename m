Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697963E5A3D
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 09:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701846; cv=none; b=fpjBSxtrb1Jf0iG1LbrF3AcaEtw+8QcKlmYBlbHysS+TubwF4EeFxTIWU59YlxNXnnquIC6r+UdjobR1506bNV4Mn2spXWFkENqQT4RcCSqTe6f2yOunrmoqRe6E9kHdt4ZAAaUCbX912HpzBBDH2FVVzz+Og12rCUMKXJON7FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701846; c=relaxed/simple;
	bh=2sSrX1lHUIbklYcy6/GSgH+cadQVBFenAtgQ7eJROpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DeBG1QzYRPUKBsaVXM0ya4Pd4IPn9eotMN4/Ck2GSO/77BSoJukr4Z+/dLPnAjt0OJ+JpijDSkB9w4aJ1arOj2AbEEpPU3h+rDhnH2hvcP6nXveXnhKwLWv6EF5GNawEUio4SU4D1HEsVlZowkninOGtgtrN3MqxwsEfKbD0XNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRUCaEyQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CvBC/bZb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRUCaEyQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CvBC/bZb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7tZM6431290
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 09:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=04OH1Ihi9gMbP7KdGAKPOj
	d1WVtj0BRKf+FMYmummD0=; b=DRUCaEyQ2E8kIPcVMeUZ2DsIleIfnFQ5KGbWry
	DQMtAm4vmSCftX3/CBaJd7I9k3IpUUtHxFhErJqM8n0Up/7k9kM4oxjwm8a9OvIJ
	mllFyHAEzSBhA8ekytSSmSaGs5u4xfy1ItfkuG5GVP4gq51VZcBd4W661YxsdmL2
	y+hWZhpAgoyM6pHBUdAqbcPtJereePS5vAF0rbb4gHCsSMr1QJQlSEClBWceRIAt
	pjyqlhMJTEI+pcRpxhU/omArJcZeezizJdzbhedgj1Cyl/AKqTJxaFstG5DzbJ4G
	421OSxT/cFGmwZUcNMKEsasxk2FqYtiIg/5UnlSIhfKTc3pQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb386p9h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 09:37:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36865d109dcso8720739a91.1
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 02:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779701843; x=1780306643; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=04OH1Ihi9gMbP7KdGAKPOjd1WVtj0BRKf+FMYmummD0=;
        b=CvBC/bZbNNcMjKyvumOE2KA4U9wcfTe6U9iEfCxYnEyzJMLvUSCzEUlp6togi2wcgN
         +JdYx6BLnOvTvJAzbsP2LmE7w7fRoIRa4GL0iMW54XvlY6+6uLdpzkKogKDhaMEj97NA
         kVu4pnXBAuA08Y/FWk5eJqsbOuzWPiIq8n8VudMSH78N+N2oxjcLWGiWQxv9FsU+nMP2
         CCm42M2WEcnv3vknDs89qj951d/6lz/ix+PpBHlL2e5Z4SKFOGLpJ+TmduPVgb7SbwSQ
         BbQ0tocbz5mq+LMQaEaAbKMCd3tV92Q5fk9jruRgYtC4FpGzMICsZZW3/QGmYP5vGMZb
         Zrfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701843; x=1780306643;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04OH1Ihi9gMbP7KdGAKPOjd1WVtj0BRKf+FMYmummD0=;
        b=PimPYX3LgzL8lKGQv5cGBcxU3bFUuTCs/RCSStONBBLHxCJfIdVQnjv56kGYjF3qds
         Mqlf1Pk0qm1OrVi/shc+UMwuzOJBS/+tcwMAdf8JxVQWsp3/HUh+vPTDFtqrVa8eAbZ+
         fRFJIMi+z8VgXo3wXxz/OIBLbdZzl4MB11865ebZhavjw4ISU6NkWmJfXNyQd8+gisDa
         DDSIcAoklmMhQxY910Ker2GKvVi05Tt3V33LkFM0SsJUHinSf3PDr1wAXzY7ghaI/apz
         S3Ugk5zt6GtuLWFHycyXagL5IbclckmwsJcMKjGvG8w03mf9Sw4jk5M/tIO+ltm+Y7Hl
         123g==
X-Forwarded-Encrypted: i=1; AFNElJ8sJrhOh5hDRMeuQZOKYitdEmX8r/mGfojA2W890KreKfwePcyIedBeyTFXqoYV+gVm70HVqF/3784=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbcqzsAvlAdwEwnI5riU3VyX7Xwh0Xaruuy4PIs3KdNqCubsUt
	MU8m85aTTtS2ZKjaOpjj59+CQXIyKV1Ft3aWJNhR/a2etO4098n4EkfOW5eh2KF/UATBPuLqxH5
	X3Ti3/9kc9qS6cN4Jr09LmQ9OqbA7iw0bANQpJR5SG3HKGA8mIikIr4ZMiylvCs8=
X-Gm-Gg: Acq92OFfP1gnfOXGx2DQvOrfJiASA3RbqzBRFV3bh8bAUTdZz3ITS1nWgL8/MC8tNkv
	rUdiZjt+05rpqWnQPqwxsTk5p84qKnzROp5ytjGxcjYQ/hzJxMDLS8sQ7cMhpAS4TmGGUtIBNI5
	nfbiuuaQdXVf5Jw1SeO4DiFsNcIfzGiUN9oo/z9Wsxh25nXk3Z4y/uW+aj1YzgMuITHVIFpH36h
	GOFU9ugGSiJ3cNpdOdkGRo3TTxT/zu8l6ZDemYEVWw+gwkFWqqQArIF5XUdmIAPk9yzefS+IZIp
	OpHgbQgFSmNlL/2GQhkzxE//a3RTRjfnkHM2k1IlogD9XtnRlli2y19l/M924btUarZUe9ys59U
	A1xK9AIsYoCmd2gb3hQuLQ1l5FqQO5qYJJINBbTRTeUoeTIpC/EsWDcctl0pkreGGY7gVTP4HNN
	+4IQ5Io+fWdBe4X+OYo8bbZ1WxRmWezzQnfQLSoXgX4RHYK/XQqXNc2DcK
X-Received: by 2002:a05:6a00:e11:b0:82c:dd31:b84a with SMTP id d2e1a72fcca58-8415f6da19fmr11742330b3a.43.1779701843354;
        Mon, 25 May 2026 02:37:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:e11:b0:82c:dd31:b84a with SMTP id d2e1a72fcca58-8415f6da19fmr11742312b3a.43.1779701842884;
        Mon, 25 May 2026 02:37:22 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac99b0sm8873842b3a.4.2026.05.25.02.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:37:22 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 25 May 2026 15:07:17 +0530
Subject: [PATCH] clk: qcom: gcc-ipq5424: drop the CLK_IGNORE_UNUSED flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-ipq5424_drop_clk_ignore_unused-v1-1-7ec63e347f2a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEwYFGoC/yXNTQ7CIBBA4as0s5YEKdSfqzSGtDCtowZwENOk6
 d1FXX6b91bIyIQZzs0KjG/KFEPFfteAuw5hRkG+GpRUnTTKCEpPo5W2nmOy7nG3NIfIaEsoGb0
 4yXHSx0Pbug6hRhLjRMtv0F/+zmW8oXt9q7BtH8Ctsz+CAAAA
X-Change-ID: 20260525-ipq5424_drop_clk_ignore_unused-90bf48733c6e
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: T39EpiDwb9PjoQHcuwjhN1Q_r0WbzqRa
X-Proofpoint-GUID: T39EpiDwb9PjoQHcuwjhN1Q_r0WbzqRa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5OCBTYWx0ZWRfX5l8rbEDWNygr
 0sLPEz8nNP5aWyjCX6iwRrOY2cg8oUm71wvUjH07cx7Ctp+HHZgOy6q0OlnTF3Yrei+83QsaJhE
 aOU2Wbhw0HkdSFJ8ABLND+T3XQc7/a386Y0K0UJ/WmqhIdJR5p2EeX8Bw3Oi5E1Ncpbhj4gFAK7
 X268IU+WxoK30nS2w5ByH5FTPwvg7UV2BIsgh4nU96cdqJek92ilo+9lAI1kLpiyq+Eik0t7zIH
 S6oiNb2ADRQIa0RDXgexitEn9vlIF2d7bB3kfQABrMzT+M0pdMec+DCV0Jj+hoMVeSYmFe8YFXw
 FkS6JPapT0iscv+ryDLM0JXBAazuvgs6Q5EKP/JzRj5rJECo9UH6gDEP1z7FGiARDhlVx3X8V2G
 EACSmSIUTtjcwyp5YSAxYz8DUd8VWS+o5KjJfDGNkkyA2Cm0A0E6zmx1IHJ6h5Zu7j28c0HaD7A
 Xjjss8qjxfk4jurEyOQ==
X-Authority-Analysis: v=2.4 cv=PJY/P/qC c=1 sm=1 tr=0 ts=6a141854 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=xjaQWaglaTHDcvof_gYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250098

Now that Linux has the consumer for the GPLL4, drop the
CLK_INGORE_UNUSED flag.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-ipq5424.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
index 35af6ffeeb85..3ddd4b3aedea 100644
--- a/drivers/clk/qcom/gcc-ipq5424.c
+++ b/drivers/clk/qcom/gcc-ipq5424.c
@@ -139,17 +139,6 @@ static struct clk_alpha_pll gpll4 = {
 			.parent_data = &gcc_parent_data_xo,
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
-			/*
-			 * There are no consumers for this GPLL in kernel yet,
-			 * (will be added soon), so the clock framework
-			 * disables this source. But some of the clocks
-			 * initialized by boot loaders uses this source. So we
-			 * need to keep this clock ON. Add the
-			 * CLK_IGNORE_UNUSED flag so the clock will not be
-			 * disabled. Once the consumer in kernel is added, we
-			 * can get rid of this flag.
-			 */
-			.flags = CLK_IGNORE_UNUSED,
 		},
 	},
 };

---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260525-ipq5424_drop_clk_ignore_unused-90bf48733c6e

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

