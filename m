Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436A62F4A0E
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 17:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764266292; cv=none; b=I40wF1TbRYLi/lIFBmYgf6GbjDOE9hcmyV3S+nL26xd/gPD6YaRXnfx3Y/O5lTMASXW3MM4bSaMBjbpSzCzZvX3tKFNUj73KeOu3yYBvx9cnZN4CfFjDSo6LAdVuLN4kvMmvxyNetYtCftnQOumPLqCllrtPbyszn0COyCSX20g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764266292; c=relaxed/simple;
	bh=furyDZlmLc3xCTAePhEJDZM34ZMnN5QvUae2oONszpk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t/gzvCdVkDX0PSquTEL1G2qbOwgh+2r8QZgRqN0Mcj6ieNGRqeM/YOIrHDLCioL3Qaw8EjQUaWPA2xqwyZGZf9tQk2rxztNeo8eVehL6Qf3wbzUxfR+8oZnwzdT064lZ0toUBZggRV1awB629pbLjlWfXxcMIzKtWxoZHNCWabQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OQa1FdJx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wjz//aVV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OQa1FdJx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wjz//aVV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARBWaw9725008
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 17:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6qfQ0xhMaDEiBsdpx9O2N7
	A7GMeP6biSSr7Ux58azGk=; b=OQa1FdJx422vxuFB90BRbeCXc69mcyYgCwHmaM
	GF+JqjPuvAHgBWeb7iH8fixDE/Mw2MrzP/Mim7UxAT/RLCs+hMB0cxKPE6YUN83R
	FlWncmQTDLn3LVNF9OJGzuTwLLRyhTHeG6SNAq+7IHn82BKULFb3HnOLi2bLaBvM
	NnqW+0uWrk9jElS2AZ/vbVqxdrOzYgRhKuONlMV/xC6BOVTUbCRV9Tg7FcceJFsR
	fX9DP/LGIEClzqvYEGWew5E/LxrPGD/BIRZZ6Skz5A4v8nqT/17jJGmYduOYg7n3
	+TwDPvDqax2Iyk/ARl8gDDxVVkZDh/Is2bdis149qstPbkBQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apnud8vbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 17:58:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297fbfb4e53so16506475ad.1
        for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 09:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764266288; x=1764871088; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6qfQ0xhMaDEiBsdpx9O2N7A7GMeP6biSSr7Ux58azGk=;
        b=Wjz//aVVCnFdhl7NPXxmnbLhkkn4ivsoj+vXiPA805ysP6BDmmqBh84HOZdLamLyFD
         nW8/1Jkq4s8Oy9TljeMbMDsbt9ifOU7uD8bySRCwtvPT2Vqlg0Eq7L54UtMcTJMfWIYb
         pD5r4EeAWHn+ykM+Weqr6MLdEmB7cawwG6zbSMm9mvYbsizyRo69z69U/Tv/1W2ce45Y
         e3VcdiMDTQn385IJDFVJau9FjeJln7+wNf+dQnGFQWhr66GxjJswVQZeZ/VEqifVSk35
         MhkQn9pg3629xwZPGzbi+LoM6hNPFFQq+QLRUE02VmgWYYS1H9MPgQ9pyyW16to6Ffze
         BJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764266288; x=1764871088;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qfQ0xhMaDEiBsdpx9O2N7A7GMeP6biSSr7Ux58azGk=;
        b=trtq55mUG9Tar9K5X8cTinsVH1R189qOvOPZHlova8n6o/evNsujOcqiMXBW+qDaNf
         w1fsuC9S+Bt88+vhIfwwRknWgoc7HDhBnE2Eb1b5dWuWWi15DQihyPVFUXwCPV0tnIjf
         nIKnE2q3xqJanGDUNlYS2Q5uljfZftDhI/RInd9gNpvk8sfM7nqLV0UxlneRMhcrspNC
         z/J8gejACsUcgFnDzKQ5wPFPhG9JG8tdWLD1fpr6c+Ugfsqptorqm+aB5jh/eJvgtQF8
         ACmHTeFlIksLkJDRU52UZnaWKPSnAdxwRQYrE3Ssq2/pAwhGtEihqnZbycD/ok51+g05
         C35Q==
X-Forwarded-Encrypted: i=1; AJvYcCWy1K5362HrPECQHjVed1VLNjX3aKgqX5nWqTDCJqCsXE/8d3ra7wQCPi24wlA31kO2aE6lZfqI2HM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpcJmwLg4NzrhIJASI5E2j5Qgx6mJDwIpQKRb+JOp/cVq/Ak/E
	QPHIs1vYowg/culxkX82qjJx4aB8E/H81pRvFA2E/+NAOIbsIYSkusifcsau5/uOO2HHepDRRCe
	Px8XgeN4RlXLB5T0BP3HNKbKknkcu8IZeF7bHHg4tln/Qlb1kyaET1K6NVz+ape4=
X-Gm-Gg: ASbGncvRcBnuSDK/ySQ2qKalOmNOOK2gSnexwKFcFjIOJWd7p5QiogwbrHhx7w3Rjrj
	nWNpA1sfzeZ1r9dPhDvqhXf8Cqs42Npg39FfTw5OnV08I5eymdYsZ5ic+LASyr3n5XjX9K9fO3t
	nIZX5CHuxhl+uuQ6X39wwQpNAaVnzHJ144eDfEYgW8h5Zxj/evqaNN/MIdB1zpAFthxPiSSQSJt
	aZYNoe9fPnadogjJhkGs21tsCvLFcYDKMXtHfP8qVCBWRoiEb1QlRdr0oetIEPtDlxz+OBfDbY8
	KBKA5Xp+U7js7wrnhLNHGB/SSgnakpmqTiS1d7rQvPecj+BLpFE8Ve5ch1jWAjrblO806hCnkPu
	H4K/dEmZ8ufR89I2v7J8FU6+EVHICgz5ZDSRpLkoG
X-Received: by 2002:a17:902:da82:b0:269:82a5:f9e9 with SMTP id d9443c01a7336-29bab148972mr132276135ad.29.1764266287972;
        Thu, 27 Nov 2025 09:58:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzJeN91LKau7SoWOtLpVjxnPCY44Cl2b5fLY8v/1Q6yZRgBXgSa5jCAeyFPktaMjvh9Rt0Gg==
X-Received: by 2002:a17:902:da82:b0:269:82a5:f9e9 with SMTP id d9443c01a7336-29bab148972mr132275945ad.29.1764266287481;
        Thu, 27 Nov 2025 09:58:07 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce445927sm23785535ad.37.2025.11.27.09.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 09:58:07 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v2 0/8] clk: qcom: gcc: Update the SDCC RCGs to use
 shared_floor_ops
Date: Thu, 27 Nov 2025 23:27:35 +0530
Message-Id: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA+RKGkC/3WNwQqDMBBEf0VybiSJWm1P/Y8iIptNDahrs620S
 P69qdBjLwNvYN5sgjF4ZHHONhFw9expTmAOmYChn28ovU0sjDKV1qaSbAE6HvqAtnMjUehoYVk
 bA4DgsG5qkbZLQOdfu/faJh48Pyi895tVf9uf8fjHuGqp5EkVTVko69CWF2LO789+BJqmPIVoY
 4wfgxS1Z8EAAAA=
X-Change-ID: 20251125-sdcc_shared_floor_ops-722ccecfe787
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: Mcltz2ZB4QV0rcJMznCRVqUrWxA3n3Nk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEzNCBTYWx0ZWRfX7QehdBwn+gI7
 G42jSyUSTZF8hjYkAtjIOSc6IOUN8LEoNcoi0MmbOrrx9IphKrQO0orSFIPLTvEdlI9QpNVWxv3
 +PDIdNeZI2mPGB0IdxbR6fj5KTZfVSbQLbI5qJ86Yi2LQ4jbIScksXiBG/TpAF5CWSe1Y4ynqbg
 oZy+BfN1Kix5kNcdV3m4/tJ0WOD3W8Ic8HE6dOY/u5URBb5Z7Uvd1aK20O696Nc8vyJqxJGKulB
 xxUyQP6vl1pbLRWiEnDpUQjUFZ1e5QNftfccTdO9g4H9zChihiDq0VyF6pSfGDGccZxFtKet1kl
 Aw7/9pa3GJuqi5WHjiKcVVkH05s7CHUoDrRsy5A6kiIugkm4ls2mPcoNDHE1Qj6xjcIogIvq7bi
 ae2pZ/VObT7li5ptP3rhe11NpisWqw==
X-Proofpoint-ORIG-GUID: Mcltz2ZB4QV0rcJMznCRVqUrWxA3n3Nk
X-Authority-Analysis: v=2.4 cv=MKNtWcZl c=1 sm=1 tr=0 ts=69289131 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pguQOEV48Il3LvxSDVQA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270134

This series updates the clock ops to clk_rcg2_shared_floor_ops
for the SDCC RCGs on SM8450, SM8750, SM4450, SDX75, Milos,
X1E80100, QDU1000 and GLYMUR chipsets.

This change is required to ensure RCG is safely parked during
disable and new parent configuration is programmed in hardware
only when new parent is enabled, to avoid cases where RCG
configuration fails to update and overclocking issues.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v2:
- Added patches 6,7,8 to use shared_floor_ops for SDCC RCGs on X1E80100,
  QDU1000 and GLYMUR chipsets also.
- picked the R-By tags received on v1.
- Link to v1: https://lore.kernel.org/r/20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com

---
Jagadeesh Kona (8):
      clk: qcom: gcc-sm8450: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-sm8750: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-sm4450: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-sdx75: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-milos: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-x1e80100: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-qdu1000: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-glymur: Update the SDCC RCGs to use shared_floor_ops

 drivers/clk/qcom/gcc-glymur.c   | 4 ++--
 drivers/clk/qcom/gcc-milos.c    | 6 +++---
 drivers/clk/qcom/gcc-qdu1000.c  | 4 ++--
 drivers/clk/qcom/gcc-sdx75.c    | 4 ++--
 drivers/clk/qcom/gcc-sm4450.c   | 6 +++---
 drivers/clk/qcom/gcc-sm8450.c   | 4 ++--
 drivers/clk/qcom/gcc-sm8750.c   | 4 ++--
 drivers/clk/qcom/gcc-x1e80100.c | 4 ++--
 8 files changed, 18 insertions(+), 18 deletions(-)
---
base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
change-id: 20251125-sdcc_shared_floor_ops-722ccecfe787

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

