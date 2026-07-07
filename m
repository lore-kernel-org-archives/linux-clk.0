Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9903243C7BA
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 18:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783448044; cv=none; b=O9j+Ztig2Onk+P1VJECvMfRvy2BDYdsaDRCMmerrA6KgeVlE7hpVSzCxxgO2gAsqmU3jq8oOi8DIrMXqOV/rcKWsYk5Q9SQ6CooT9PjIe7y6+QRKT2DNOF20QzbCqPFOWHPx5yn/RQpXTkDBdW/7rOvTaNIxPDAYrIukMP1Kbc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783448044; c=relaxed/simple;
	bh=BGy/5gEdVT+7XTzhpb4+IvxeTSPEkTOt6XHz/Hi6cY0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L1MyHKgNS34iBIOQn5YQctT1VFBNQ1hxP7Ry6StlgiGEz29gkaWV3R9a/9gFcI3HJMBnTlS1CHHXZyhAI4Wp6d+c2KBZCVSW2E/Tw2yxYiJiJZXbETWJbUx+fR1atmYuQrx4O6F08WMOY+ZL27/yfhTY0xlZd/bmTb0oACjGSK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jc8dBups; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H0sm6gst; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jc8dBups";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H0sm6gst"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FTGOC018069
	for <linux-clk@vger.kernel.org>; Tue, 7 Jul 2026 18:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1+OqwGRz2H4vukNpCJikeL
	pVYIsHXk9ZwelFw2XK69s=; b=Jc8dBupsMS+EmxX9AK5aMZWOo6OTpKOClntIWC
	Srw3SfH6BgyBOPJB4YM7Aa06Jd4ASCse5VGYMJpb5Odu97dFDYhcqAh2zRP2TfGZ
	U7xqRQrW62/MDYQx7+dRHDWW2RC+9vKZLuIunQfjgsPgs4WWI+8ChpqoEcLsshsj
	z+90EmrIhS0LKhD7ZRIebHFnHqGlhJpet9wdR+Di7DpybDN5gThSvids6ICEU02X
	f/VDyQatSb5uLAizU0EPSe4+KNHMmVZ8u7E+vTlNLI+FSz0iq6E95bxXytzjt1kw
	F4Vlza7MSZGriVHjTm6IC10icdOEmQGyf4CUDeWB6mA8xtDg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep2nkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 18:14:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38869800848so1010500a91.0
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 11:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783448042; x=1784052842; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1+OqwGRz2H4vukNpCJikeLpVYIsHXk9ZwelFw2XK69s=;
        b=H0sm6gst998Z40C5HA8+RdJ7D85gJriq/PHTXb5NKk3BIeAfGFUisDwbSU53qzpOkq
         A2aTiKL7iaBTHSB35nLI+f10zzJ/51FEUdy2rRx49cxbNEltEDsIvw/uiIdqfch3jNJ5
         L4frUBjU6Kx52/fOwbQPhrpXr/phsZNaso7GZOi3TbW4U10LG4ob0GiBlS9+uV5uvo1R
         lv+shFKxfJpkL2X66k+wz3t7ylU/3MZ3y2x2GYeWd/56DMI3jweX/xOuLzk9sU+omoyP
         CqpXSxxfuPxCgUn6A5Z4Ye5bfBKYBofu3f2oRDB4gO8HRymFj4ebE3sma3T6tD2Xoqyi
         7Y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783448042; x=1784052842;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1+OqwGRz2H4vukNpCJikeLpVYIsHXk9ZwelFw2XK69s=;
        b=pzLD2eq4gNoUVFAqg65NMrxKTWcCZzd5+WkQ2cHkBMdU3D3s8e4vmmwa/DIKId4VOv
         z86zt+oYjm7GkDUadSIDT86m1zQ1mcHPWdx98tQv/9FPi1xEbjk9OObblPZr8tEt38ud
         7waCNSY2nP3S/8Kby5QcBCrD77vj4b6jMjHQv0f8CkPkVeGnHN3DYUt8yzucq+kFq5oD
         JX6HpF2qv9HDTGNSc6rAYwRjxKPh2OUTvwlGU/WcluyESk78UctzCkhNXIxIHo4G3eLb
         bfAgYS77KEl88/wZqvzu1c8Rd/TeeAW3YXZ8wwV+UgKR0kXcsZgSesgW7VO5oG0MOqKs
         dWYg==
X-Forwarded-Encrypted: i=1; AHgh+Rqn9RSPauLvZXqyaZPA8/HPvFjcn1+3bkdYkG51+HJ1nTv3JSZ63OZAfZ6aK+RbmlXAO/0wrbesQ9s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyROQqHqVfZhI8hgfgS0xc4ojgWvpsCquW0NrhqnLAo/cKMJdyI
	vA6aBHUPiCrccL4Liz5wYbNkdnT0qTSJGlmdYEEcgW/qgRUrTJvSCqqDrNj/bBmCBujse0NWe8w
	L9O9mDaczP/tQEwxniZMHsATNuPHAjrHlhMnEKDBq0YhaHMVS1nABoDIaUkS59og=
X-Gm-Gg: AfdE7cn5zKBJulTVVPswB2m7SeI/XuUZGk8w4K9S10N6wOzmLpI/A8HxWGw2NfTQFIC
	6KpP2QtikFEtJWacRxNJbmWstocOHxW0tsDj+wOfXHYZ5WQa9//K/yJMxjkAvYoXe6o4cC/CZIa
	r9SOde+R1hcl1zrZwh1sOLUZfJns2JVbT41pFZEaZ93SxEB7YcQJvFbWQ0Fee3okf8ZfMT2q0Pn
	Ev/eF/K4AEMy1v3hPPDq16+8/H7gnQjZRon86/SBsihWB+kiIikXJPgd8UjjGHaSScOJnIaFDOA
	W3txh1866MG/r3rtCh9I+uuo3cv5qMQsTKXQRrP4sUJglbW4Ifx6wQFnO3LozcTkHRusKKU74ic
	0zwpMqnuutRSjEG5p4g+08KhkfGNf8qQfkfE9pl4Lrg==
X-Received: by 2002:a17:90b:3c45:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-38755f379admr6287851a91.15.1783448042207;
        Tue, 07 Jul 2026 11:14:02 -0700 (PDT)
X-Received: by 2002:a17:90b:3c45:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-38755f379admr6287805a91.15.1783448041698;
        Tue, 07 Jul 2026 11:14:01 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm15731521eec.29.2026.07.07.11.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 11:14:01 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: Add video clock controller support for
 Qualcomm Maili SoC
Date: Tue, 07 Jul 2026 23:43:09 +0530
Message-Id: <20260707-maili_videocc-v1-0-ef0828c0bf6e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALVBTWoC/0XMWwqDMBCF4a1InhvIGE2iWykiyWTaDvXSqpWCu
 PdapfTxP3C+RYw0MI2iTBYx0Mwj990WcEoE3nx3Jclxa5Gq1CirrGw9N1zPHKlHlDGoaIiKDIM
 V2+cx0IXfu3eujh7o+drY6Rj/apnspoGfyR1P7Jsamx7vEi2lIcu1ik6VM3zx4EeS2LctT2WSo
 9UYi4tyUCBglpG2mnT0IRinwQWIBB5SUa3rBxaYlcbmAAAA
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
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: syFwBw3vkNN62lVP7woCiIAjkJTTfgq9
X-Proofpoint-ORIG-GUID: syFwBw3vkNN62lVP7woCiIAjkJTTfgq9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE3OSBTYWx0ZWRfX4J5i1dkMPt+F
 DRmHiHgu28iHZ7nx++DbXrZwZVg9QUpf2adB+KDg4gvI1Nob8ckcCrfZryustS0m5mG0FVse77s
 lBZGE1FlKBMtyIoBfs0Jx9qm+8YNKaspiY1gQJkoqFgsIe3E2XYL4biIUZfZ+DuyOKt9X6wkzEg
 +XGNvWZ46wQeHb79nsBtbl2WnNdwwEgK1kXjrWmPoHjNAknT+TwesCmmvpy7rssGuUHA2/ul8NV
 6Hb3vxVx3hNxBpYCdI4ZD9ghvT52Bk0j/eFd64Csi9mifltSBPgKUmItv7WBzN4fg8WUoCNIFfH
 NhBxa79lLFTM1gRtz8c2zh3kiFPZ344+G4VM/OdTfTRZqNl76iWdvVaFbM/RQMUKqnqjQG2b60j
 wcrcBviTCNKySA8DS2+8nhG5L/I1t7/Sp+K3C7lV6RCWAVMA05XYvbvtXpJsYeN0Yv0eUpCB2ZM
 E97tGBIcIGwkmaDPxHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE3OSBTYWx0ZWRfXx/Ni7/n7RuMr
 FZy9iguT3z0rXg2G1TmRqZJ98+cLxtqJ/DhEfjodNdR6VUsEMse9QfxNGBmUp/jpXjD8KwRSj0h
 nXfdTtBabmw3UGEiqjgTbI79zFKY95k=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4d41ea cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zXpIYuPf6sbHbxCr7fwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070179

This series adds support for the video clock controller (videocc)
required by the upcoming Qualcomm Maili SoC.

This series is dependent on Maili GCC clock series:
https://lore.kernel.org/all/20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com/

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Jagadeesh Kona (2):
      dt-bindings: clock: qcom: Add Qualcomm Maili video clock controller
      clk: qcom: Add support for videocc driver on Qualcomm Maili SoC

 .../bindings/clock/qcom,sm8450-videocc.yaml        |   3 +
 drivers/clk/qcom/Kconfig                           |  10 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/videocc-maili.c                   | 660 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,maili-videocc.h     |  49 ++
 5 files changed, 723 insertions(+)
---
base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
change-id: 20260707-maili_videocc-db0d6ee94cb7
prerequisite-change-id: 20260617-maili_initial_clock-c7e2b4530d80:v1
prerequisite-patch-id: cb2499a822715bf6d411ea000e525e5feab52e7f
prerequisite-patch-id: 4280283ee9f782a5ba46e4419ab0b7186add0211
prerequisite-patch-id: df7cc303a60331fa30c828cf5c68d76a1b0819e9
prerequisite-patch-id: 9139ea0ed0cb5e61cd45ac1e490596102e57a38c
prerequisite-patch-id: 7e5ac7db1fba3258b45b689b11d0ca93d65aa38a

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

