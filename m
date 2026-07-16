Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B8D78F2B
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 04:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784174891; cv=none; b=bCAySKMkHr4alL8neS17BwVMXs0amcNNL1/9Li1LvnPOjUXbTAQ+DuqQpUKRvHGjhmz2211yLZ9C+wX7FYcLOAQpj7zyYWmeAhD1U9AIngIENkefSCwOSa/PjP3/8r1ZM8sgW8VRNZNTcjTlhYRLCkbxnXC9ZX4CBRkx/lQsoVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784174891; c=relaxed/simple;
	bh=qF4D0ehqJD4Hk8KtIARlnaR0gTLZFdEcrxPwtkwtsgA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SdE8p1O0iLvgyvlh2hhBipqfsVD3icPrkXZJhx86S5yZq53RFJNe8TNZ5jPgH3n/jKlFqMFOYenishjtb1VoilRKDMvRO1+gvb9ss7jotid2PvV0ohiHTT2gA3raXWLnOhoFBALZwNIPI5WkQkGxyf9WwFG/uRH/yZ2JHUkrdZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AcBbn/RU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+JxGwHW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AcBbn/RU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+JxGwHW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wojh1754472
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 04:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=scPxfUsXjJHWYm0pTnIWTb
	7W4QeFQK6ovy2iE3Yp0EI=; b=AcBbn/RUirc6zmUCPsGyPVZdQCUeOvUCADwkT/
	GxJDdUqk42x5x+Wh0GscYCmJXi2AuMV+bhGN8zwbCPFRuNzvlbItIyH3tKI1bvj3
	tpPTBJvYCMrJgfDWIHRZOoOZ3bLNXsr9CEQqZ9cO2aGXCs0AXYalwrAltMoMK0Go
	RVburkAH1h+7nv+v21C9gGKWBU3jbHMgJlJb80hWlMQyqZsb1tPKHfLsJV/+hAlA
	joDVBRKvPOQ/lFB0YDnYHLoBSW2lutryPZz3J0jESmBtyMSX35lLAdxU7zNnJoee
	cSoHoiwHtoiMPjrAq99DBWq8em+TT+cKEwC6ykktG5ntCGHg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe855bvcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 04:08:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso7479581a91.3
        for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 21:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784174888; x=1784779688; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=scPxfUsXjJHWYm0pTnIWTb7W4QeFQK6ovy2iE3Yp0EI=;
        b=a+JxGwHW3b4stPFwK4XnC3VbNuDZPZuxzwDLKrw+kP3KWY098do4qccoNrHjlS/aZA
         oHHAXB7KefEZ9JXqLQOe6aPMsR+07U7ZEjPu3od46cgXFzMuIl/WvqDKhAZmSUEjNURD
         nxtnD5cGCV6xX623TRdzKiAFwhuNDKy6YLgOpyuXFAkVgDkMB/MUDavRz4/sccCP5BC3
         ZK9ueehQVN4LtFZwoiktuoGwQqR70qnoS23NmHGpU9cH0ocSqvkt+5N6eAbl/N0QbIYW
         wxVAHqhX10HAZzsaQeyJkdt5NFYAUhoBm0xXAY9AOyAFufyZ9CfqFissa5Et8oCVdUMR
         yjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784174888; x=1784779688;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=scPxfUsXjJHWYm0pTnIWTb7W4QeFQK6ovy2iE3Yp0EI=;
        b=YFK6FN6C1Yy/FyjKWuA/m0q4CsKH3DOaxHY3vw6XN2QCRXWLheolvHi8egfZBGi1kO
         1Em6xxYlQTS7Fs5P3Zrm0z8Z9Zufa+IVbY64Bp2wHrXMAyBxM9IGhOUUq8YbqlGOAoBl
         9W56IToGz76cF/ejPK9fya5m9aUfOnRt/tZW5Dcsl7nazpGCAxjpO26swscnPaBajoKG
         yRn6gW+/B164uOWe+wXh1KQdHCaS3CJBQKEi81fHECts3yCAiQ9pq0VfrhGUnPMi8/+P
         E7Y/YK3qdPAfgRC2WzTrrJvcF9zfzlymOyPJt1hpQZ0Jt8lRp0rNLg5M8E5p+qQNYvsR
         OWtw==
X-Forwarded-Encrypted: i=1; AHgh+RrEZH3P+lq1Mmp9jnHO5gyp4WuOV0ZEwidFv0jv9PsHHEt45efXlpRo9tBdo/OG8rPOVb/07ENTS7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YztEtZOdzQGtG4npRacBhvG92QyHoLJJc+KctlYpy+l66F/nrwl
	+xJnZQI564xKV6peKuLpsFTKbKsrW+WzEBvilbyWJ3JGXgM73HmIG7ajfjgjXV1ceFMab9eDRTC
	9X9/c3ch0eOlCZrhZHF81eJzPkQzL8Amg/e5kEPezzJcriQgBx+p/WHMi8IGzF/4=
X-Gm-Gg: AfdE7cm8+UvpCj2LTuZEmz95Kc8Cqpkykr/zMOKMK7CaKRnKPrHne8ctScHZKSy3xtn
	/qNwXHw42pCoQflARqg1lxHhTHlxLNAOfbeKLR3t1+rkgi7Z0ZEvIQLPWOCwUCxALa8Italq+g4
	xGW8bUS4Qu/zOTAEX0sYOI7wxQ/HBhR8eaCmbXFJABW17jd2phx4qWh5mrbmRs3TmmDeNPh4DYW
	fKCrV1m9UQ5HbhL6FoSxiIZT3H/raNBvRBuDHlJDB2GKoFZ/NFh6tYfBEg0BVFKWjkU5ibqZlLv
	yQ22M8KumSGGGOW+Li5IYmQwfZGup4Tnu6lG/mpm+SYVAPAKk7HRCl1I3rjTOqmrkf+CKuI/ZTM
	A6ZORqjLYHCFNXAvg4j9PngGyZgf4efw=
X-Received: by 2002:a17:90b:58c5:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-38e17e44165mr9687001a91.21.1784174888440;
        Wed, 15 Jul 2026 21:08:08 -0700 (PDT)
X-Received: by 2002:a17:90b:58c5:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-38e17e44165mr9686964a91.21.1784174887989;
        Wed, 15 Jul 2026 21:08:07 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6a4779sm7623907eec.17.2026.07.15.21.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 21:08:07 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v2 0/2] clk: qcom: Add video clock controller support for
 Qualcomm Maili SoC
Date: Thu, 16 Jul 2026 09:37:58 +0530
Message-Id: <20260716-maili_videocc-v2-0-7ed5ab140770@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB5ZWGoC/3WPzWrDMBCEX8XoXIWVIsuWT32PEoJ+1s1S22osR
 zQEv3tkh9JTLwuzMN/MPFjCmTCxrnqwGTMlilMR8q1i/mKnT+QUimYSpIYGGj5aGuicKWD0ngc
 HQSMa5V3Diud7xp5+dt7H6aVnvN4Kdnk9/6glZGNq8cukiRayw9kP0X9x36B0qj5CaKHLcoM7m
 5D7OI60dJVrWzBGGxShsbURCL0yISitbB1AuaPvQVon2FbjQmmJ831fmcXe459BWXDg2EMrWw+
 u1/geUzpcb3bYgg/lsNO6rk/36SyEOAEAAA==
X-Change-ID: 20260707-maili_videocc-db0d6ee94cb7
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 5B2SFeyGL4JDtcVVF0Va51eACY59G10K
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6a585929 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zXpIYuPf6sbHbxCr7fwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAzOCBTYWx0ZWRfX8E4uG/EGa6m8
 repq+yYWpiXdDPaikFIXweG4Ckqii7xc5so9qv8ECqEwe+aLeJrRhDSY7sD1lZpaOq6cyt1iEhb
 W7P4TXKQaLmzenwwb6DAVKrM+sq23AxqQt7vCv9rSS+5dR3/SBlfo/lHy8T5+V5vbVSRihNWhRA
 loa43bDW/PZAPb0iKI1ql8UR7E0QYzhHU2O/mOChLw5VKg6Gv3hlKUeeFSqJlb4zoAyjuK6SuRv
 ZLrOT9hCiK+0n3WaJB8/8jvCdQxoltYfQ6WwTawQBcE8FK+nnfhYHXF83RJPv/HGyd82+7Qkzr1
 BZcPmyIbPty7HfLlODU6UM/BjUR/BNHYaV6ZVztX75lwPqwrGGM9S4nKh/TDSS7UTPNfCEr/Ugy
 j+igul3rvIcuB6EE015Ra7Y6NIdxM7iO+Acu8ID2B6hQCGe8Ij4W9XIp4JdCbFZDf6pmWO/H/7u
 D3y/ZochwRwWOa8Cuzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAzOCBTYWx0ZWRfX0C2+0GzQBVK8
 k7uyVQ0FQup9W99QNKTbz1+4V2PvNGaUmnMx8ieMvDwMUN8ZUoGFcPDlp9+4BQ6TUOKgv/KbnBh
 rALEFab07xdfKQFdQ1djLunIu28m08Q=
X-Proofpoint-ORIG-GUID: 5B2SFeyGL4JDtcVVF0Va51eACY59G10K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160038

This series adds support for the video clock controller (videocc)
required by the upcoming Qualcomm Maili SoC.

This series is dependent on Maili GCC clock series:
https://lore.kernel.org/all/20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com/

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v2:
- Rebased on latest linux-next
- Dropped the explicit compatible check for required-opps in bindings,
  as it is already handled by default in the latest linux-next. [Krzysztof]
- Added R-By tag received on v1
- Link to v1: https://lore.kernel.org/r/20260707-maili_videocc-v1-0-ef0828c0bf6e@oss.qualcomm.com

---
Jagadeesh Kona (2):
      dt-bindings: clock: qcom: Add Qualcomm Maili video clock controller
      clk: qcom: Add support for videocc driver on Qualcomm Maili SoC

 .../bindings/clock/qcom,sm8450-videocc.yaml        |   2 +
 drivers/clk/qcom/Kconfig                           |  10 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/videocc-maili.c                   | 660 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,maili-videocc.h     |  49 ++
 5 files changed, 722 insertions(+)
---
base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
change-id: 20260707-maili_videocc-db0d6ee94cb7
prerequisite-change-id: 20260617-maili_initial_clock-c7e2b4530d80:v2
prerequisite-patch-id: cb2499a822715bf6d411ea000e525e5feab52e7f
prerequisite-patch-id: 4280283ee9f782a5ba46e4419ab0b7186add0211
prerequisite-patch-id: 3e9a75794efb1633818ffe387d1f4e5048c361a4
prerequisite-patch-id: 9a218f161a75924b8cc3fbae44007d0da7739d60
prerequisite-patch-id: 7e5ac7db1fba3258b45b689b11d0ca93d65aa38a

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

