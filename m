Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8AD2248B8
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 04:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764130566; cv=none; b=dlCl+PMUv8XSGBUB9OHs4FV1qiUy5i9iWf10weC7KS6dOzSfIZurhlxgetN4A2/faA2LgNL74t2rZsPrmjTynEOT6nvHkU9tNAG+BIa3DHFGEflm+XGA5ccgFD0ftSowt6lx2GtTFEEjahYclItVb+U+sYFYqQ9GZ8JCgnaRDuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764130566; c=relaxed/simple;
	bh=PiGNHUw9XMrK30QdDmuUWjmkKzuZ05XoeRwTVilrQmI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SvVMRliP7LEyuU0wf0812n6yksvTmgFs6JGQxeKKhEJenCddnHzipSyDt31eUQ5RV4e00aE0G8mHE8ifad13PEPZ3LqMdMHal9tVmBDU6Dc6XMXirFLROYYhZHaCuSE9hLlIN9MMaBpo8DJqHJXJUxcxc75Gnj4z6kUXZh5eBck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fBgNYPVo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gGXjv86p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBgNYPVo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gGXjv86p"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APNMnlk4049271
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 04:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZeDgF8LwHhTMSDMaF3nHNi
	djlnubsXwQ1NaMfVo0yTY=; b=fBgNYPVokiceo87dEGCIQ4AeJ8vJP8VDp3n8ll
	+oqwiyAGfIXZdhtfeS96tPxS80WkuyaEThlN6nsTTeZmu0Khtubpyq5My/lIB8us
	sY4+96X9pM+bgayu849VqVPIAWUAOLpZWF/pSCKhfyVHb5YzXFmiGnYe9mJfBGKX
	+IW+POkDJG5nrqFZOmY8gea8hURgaGdF8VPXfE4JSSeS0YP0ILZ6YElS4mJ29sxA
	Mt8P+Yrnwoa32oMNt77gs3UprTSV3qPytEBdMmIBl+NAId8BMLxNCQApn3AuvORE
	3A7JfCV6mL33Fox414Qk9fuHjIav0VGxMjLSQnACUXW/22ww==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anp2ngkds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 04:16:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2956a694b47so91231005ad.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 20:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764130563; x=1764735363; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZeDgF8LwHhTMSDMaF3nHNidjlnubsXwQ1NaMfVo0yTY=;
        b=gGXjv86py1m38QsYTSP+bC1S1QlIhpIxVHT8eT6rfnpgsuV9a47mteqx/OM1GhtUCJ
         qu4EOQI34XpfrfnuI8QTCG1Wn7z0BMInbvlXQUdHnZ+u0Lg0kOB/boTCL6m0Ndwp4OQy
         hM08kp3MLHvkCTaMnIbaLDUxeUUEf/44DGkE/gOBN6xU+IN6n8eaRoAhQ1D0tHcgxLJZ
         XHnoGmAlD6OIdK18j/ESmSFk+WPulZnVhN/3Qn0M4Qb03E6wRDA7wNtN1daJDOf/OxJc
         qnu0hwMEw4kp0UnULxUbnE3RDtXXf+U+dusng2I+ss64/BpCrWUDQMmL2WoZhUdPpCz0
         XBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764130563; x=1764735363;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZeDgF8LwHhTMSDMaF3nHNidjlnubsXwQ1NaMfVo0yTY=;
        b=XkmOKMtWHyIBjmg44i+2hDmnxZs0dlHeX733qpmki6k16RpXNXZDao+6/lADN+PjGL
         Pljiziwb3vJgjMyFaCE4oO9AiQUcoWjmVDXXjzRMuJir5WesN36hgb6nxYNlwg63wHyE
         73remZ55scr0NnuZZ5ux+zRAHGEQBbbLO86CYjindAnoOtxa+WQO1INvL5FVwScTxkXM
         HRbeg2z1bbO7Z6yLewvfRe5aU4lD9GF/k+FIRje0X5qdu79Dxzt6vkG0xU5kXAlfgYpD
         JTb9gOZb7S/gRLwMqhJuk6EwVD3m/a76EHBm+BBvv5axJ5uOxj9Ry1vNCBOLJcHdrJhH
         15Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXnFCl1fVTe9J5g/Paq+93lNjyBXPgc6zazGMkeg4vKUkF3HuYA1W0xBl6L/EOSh78/S6TWabqpoWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtC1Q7pcjgVo6/TCnQU+2w5ihI0gzRoexPPe/4ssHIAy8heBba
	tpPNBu6AC/2VCKI+619GCmQmcvcdUArWBcv0P4Xhar6pHoCyUTvbl8a2h4sAZu/okPtiT6z67HT
	NhY/il+CdiDN13RnC1oTl5YDvo291jwWc+5qln9TDXW7OQrxjotD7XSLpTP3z5SE=
X-Gm-Gg: ASbGncvOCEfSyuLSqJoQatobow7MufGdhSsQjd1cfKoNMvgS//N+7g9NBjfwfKcpDMi
	0bOHZ4dsC/SVtacAXVsbu+NGNMRDDO4Wg8xbMJIk/QCIMTkDw0uYoC3cncobR2UNhrmYYzHweVV
	Nua35KJ23ka6mq3mRIEQLxtG0cvIEMNgvsJjkh1g0bKyUkM+Td2S30PB1Ek2VdheM/Yg9o+b//0
	qcqysWorHPvujs1Z9LnMjBRWJTZQtslZLY/If3b2893l/OnKAIHhjqRpvCxBCd+FzoR1FvgZNOA
	I6aqw0AaHzzArxC1yCpVs6ThHS6thn/OOr+C20g0vSBm0z1LEW9riLcQm10XiBDTvpdRYZhUo7d
	b0b8G5/kWejhodbEaGEaTtfDBtIHkzbQiIHGVOWsg
X-Received: by 2002:a17:903:1965:b0:298:d056:612d with SMTP id d9443c01a7336-29baae4ee80mr43384865ad.9.1764130562600;
        Tue, 25 Nov 2025 20:16:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0zO21EUR7igpUZqkVWR24CzZOQQzxtJYJt8DHVxe80Uzq7+xMftvrJCtrB1dwHIFlIRFekQ==
X-Received: by 2002:a17:903:1965:b0:298:d056:612d with SMTP id d9443c01a7336-29baae4ee80mr43384545ad.9.1764130561943;
        Tue, 25 Nov 2025 20:16:01 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b1075basm179300125ad.21.2025.11.25.20.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 20:16:01 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 0/5] clk: qcom: gcc: Update the SDCC RCGs to use
 shared_floor_ops
Date: Wed, 26 Nov 2025 09:45:49 +0530
Message-Id: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPV+JmkC/x3MQQqAMAwAwa9IzhZsQCp+RaRImmpArCQggvh3i
 8c57D5grMIGY/OA8iUm5ajwbQO0LcfKTlI1YIe999g7S0TRtkU5xbyXorGc5gIiEVPmMASo7am
 c5f6/0/y+HwwHjqxnAAAA
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
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=KerfcAYD c=1 sm=1 tr=0 ts=69267f03 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Rgt11g4jKVTE6uy0-YEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ruc7QyHCvNwFjiN0jBiDoFHaiBfO6xEt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAzMiBTYWx0ZWRfX5y5k4SZlcC1u
 KYNCi90BgUMbJQzm65y30nTOQfn2BkOMm/9wUSh8MY/bHruRuXL2a8NmJFXXpMfhSWZwLiMH4LM
 1uSj+ahYYdef9M9aeRRUsc3yuysv8FfHjvXwlXpg0FHp1a8WyqbqWunmerbWqhgTBMnIYYANm8y
 Rzf49+aCY0HFJ00nRFTATnZpYbdiVuw5JRDUKFEJn501BDRfj2EMx14gB5+kq/twXSwMaYNRNHG
 BgOLzrtPBtihXap+1wiq170UKtWPkhDmPEQ3uFCXqQXnACV9+Yyb/FES9lAlQckoUNHLI6+YZlB
 oHHyoZ/soNxj37E9E6VOCmOm2EkHRXn7T0aZPMDhU7c0EElzayL7gofz/9V4K18K5ccyE46S8FK
 Y1yd39iTOl/AB5o0M39tDWOBSF2Bmw==
X-Proofpoint-ORIG-GUID: ruc7QyHCvNwFjiN0jBiDoFHaiBfO6xEt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260032

This series updates the clock ops to clk_rcg2_shared_floor_ops
for the SDCC RCGs on SM8450, SM8750, SM4450, SDX75 and Milos
chipsets.

This change is required to ensure RCG is safely parked during
disable and new parent configuration is programmed in hardware
only when new parent is enabled, to avoid cases where RCG
configuration fails to update and overclocking issues.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Jagadeesh Kona (5):
      clk: qcom: gcc-sm8450: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-sm8750: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-sm4450: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-sdx75: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-milos: Update the SDCC RCGs to use shared_floor_ops

 drivers/clk/qcom/gcc-milos.c  | 6 +++---
 drivers/clk/qcom/gcc-sdx75.c  | 4 ++--
 drivers/clk/qcom/gcc-sm4450.c | 6 +++---
 drivers/clk/qcom/gcc-sm8450.c | 4 ++--
 drivers/clk/qcom/gcc-sm8750.c | 4 ++--
 5 files changed, 12 insertions(+), 12 deletions(-)
---
base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
change-id: 20251125-sdcc_shared_floor_ops-722ccecfe787

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

