Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E1D320CAD
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 13:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071332; cv=none; b=bWPoCCYnMUenxLWBUGCMXvrCanV4ACfeWY3tUDvdU7jNRDDUncZYG9PtmECpLom6PVduTehw1Ap3rgiCPDeIm6poQJzaY3dh5D0TaiRK1ehths3Oz8nElVfhKKma2SyrlqO8ZbXpXdoKZWJN7e1pVbBZJ4ilh9usumigrRN71ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071332; c=relaxed/simple;
	bh=p7BPGS1LXtvuUc8w2G9p04MnVlzpfe4Yci0/HvoooT0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c8X7GtZl9AiIZhbAeqYlW35xbikFDRGZZDdw0fKG1YkPMU6DVCpWHKnQIKvkqYtwMb3+j/Zs0Z4blfII4wKgd/O0Fp82D9oxH2rgbhI/b7OgR1ZEWk3eyKDqmAYGtmaoO1IoqKhayou63+H2oDYjLqqQa4MR90Voljozywygbzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BUQEN9I/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmSHyMR1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BUQEN9I/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmSHyMR1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jRql2662617
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 13:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AkNLjViojIdmORaj0ULI3j
	aSXfiWIQ2kdr4Wgh24Tkk=; b=BUQEN9I/OYuMHAn4lw8BpOZnumnaEbzNkS+Unk
	YZ26B4kJdPlDzxy+mew88p/SSQ0Qvk1PywOEHlnf/ioa9ravUM3znnWStSOMTa1a
	Eqrm2FnFq9vuAk7KbtIvHbbLw+DAGbf1GDnq0IcboswlZ0/ouoixb3yvLwnacxmY
	ByOWjZ4YyEGi4qaYoW5WomXxqH/Mgho+XDDyt0XvOO1K9s04XIL6gMWs+9gStz+l
	o/ElFok7aaU6Fldq8OoQyku0wmEpNpQxXSUfcDysI+DS3LpfRr9dtSAnuVDq4RLg
	X+S8ZDxRU7kWEvzlWyv7s8UsseY3VcDpy+pBe3CjhfGtkyjw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda29er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 13:35:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86fa6b15ed3so7403826b3a.1
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 06:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792071329; x=1792676129; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AkNLjViojIdmORaj0ULI3jaSXfiWIQ2kdr4Wgh24Tkk=;
        b=UmSHyMR1EqULHjRF8Byq9L26Gbv2UHCBpARQqzKSodCM+pihd9ANMbP9p/Nbrfdac9
         6H/0sD+WoezqEwLsPuxqFrDQzsPtMjNvQDPILp5WT/kyjD+t08VmfMqIHEBqfmIuckNH
         ysNum1Crot5+Ga329dPAlZDgMRKkxW4Kobzplp40N1wxSCLYKHigNnVJ80F0lcBtNalS
         mnG0lqvT8vXwvvLbSVBdTdK6TyzIkvuVq/YFobtva38oNuc18gGNGjBzvqPCQUIQNPeX
         eBUCxk6VlFbha51WHAAtnYRY9RCpqvs/MLsuOULtfwWwDJTF2+y2IJuaAeihIkjxjz8q
         9aEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071329; x=1792676129;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AkNLjViojIdmORaj0ULI3jaSXfiWIQ2kdr4Wgh24Tkk=;
        b=D2JGHL1OHFW0bw/e9hJvsPCTtA+TYoFSUFm8hKAWuJS+d3WzkyELQOhUi/+p7rR0yL
         VgDh37FFFjYeBS4wvF7PcPUHNo/JgX2dJ+IJ8OjFjGqeC9Ajd77Vc4vTjGvON+m6FU7P
         cz9ZxUe9kX7n/yKsu3ux1xdl9Q42BgPfQXq2cGtTO3SIUUVji+2HMNWdrNfYZ/oIHcYL
         zCh2chcu4Hxr4WcvRC7xdsmqTbtC8/uM7oPxh3dSAqMMq9Nd3cGQxvPV24m+veZUcf+R
         rSm61MnjN/3ycTn2g1o/XFB7ksSzPr9AmkT/hZNqNlr/n8xJr30H6jay0g9Z2bzQ5Us0
         xr9A==
X-Forwarded-Encrypted: i=1; AKwUvBx7J52Md8boKdt4shuljpseKrlb5ocBBhFxFfxGPuGN5xBGuJ6FoS3tw5aQQyMo3z4c0L46wL2zTwo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZHGydTyXu2w3Lj0tiSYTdXU3GffWOkfjRvEHNYJohTcRVAwTq
	5s8XRSfncQ1aGXgftopUawGlEMHhpqz+ZcBm3sVZZK7qLtC/byr35xh78sJtkQCDF1jwjYZUFIy
	KpFivmFFzDWBIFU9KYlZVHZeTZc4jHaSplJ8uwhKZkyWENpjqFqK54dUxGSpzJG8=
X-Gm-Gg: AYBFou3duQUrgoMOG+P3ZgGWA/SDhz6DRGyZSOj2YiBvMMVwWQU7a40OxZvROgaTRkL
	PsqDYICYAc3K/gzbJFSfs34CTMJDykma7puzKGsx7FjntPKFYXvm7+37AMY411zgHfM9h2vP64D
	xFVEHEIQOtC1vAZJ/2SZ3RuZEOvQGDLUy2SCh0cn8vFCNbxq8mrU1tNsdAzMyWtdJWTmES/uW0U
	JCWG2oVEJjReERL08RmIpSpvIeZYxI1/TysCui1kQPzHw/tjJq17A6R0AEZllShSNkGDJnfq8iv
	DVYFfnXl0SFTZ0BEUck7tEwhA8ws7iDilJIamuBDqXvavhSvSREc2e5H60iNrC5W1GD+zJHX1Ga
	OHtC3Zqov7/qrVVU0chKqnnuGXqCQpw==
X-Received: by 2002:a05:6a00:9503:b0:89d:7d72:3433 with SMTP id d2e1a72fcca58-89d7d724361mr5473459b3a.21.1792071329363;
        Thu, 15 Oct 2026 06:35:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:9503:b0:89d:7d72:3433 with SMTP id d2e1a72fcca58-89d7d724361mr5473440b3a.21.1792071328933;
        Thu, 15 Oct 2026 06:35:28 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89ec1705f5dsm476617b3a.53.2026.10.15.06.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:35:28 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 0/4] clk: qcom: Add support for Glymur AV1E clock
 controller
Date: Thu, 15 Oct 2026 19:05:00 +0530
Message-Id: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAITW0GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0Nj3fScytzSIt3EMsPU5GRdc1Mjo5RU81STVDNTJaCegqLUtMwKsHn
 RsbW1ALRlwV1fAAAA
X-Change-ID: 20261013-glymur-av1ecc-7522de7e4e65
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX0/AdSI4MoHKc
 e+CziRoHaTcTt1UMVFXhTdTwWBzJJGWzF/YSUy0zoSidnHzTZ+uu5D9Cr3rqFHKH0bwo1fYdK/K
 I8fJjqEMytz7+i498fVCvqrd606VZP4=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad0d6a2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=JZxBUJHeOsY6iHg-7A4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 61zRWTZ01aVbPF1NUc_Za7Z1RHW6O8sR
X-Proofpoint-ORIG-GUID: 61zRWTZ01aVbPF1NUc_Za7Z1RHW6O8sR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX2Buaz+Z/JLiG
 /dd6uoPJtO6qrZK9lyG1aMcq6boH0VAWzC01R8d3rVOMhXTfxhPT6xjzpbhYAiztYkHauVlnm7h
 ulapNkARpl/rnIVqyBwuCz1FqROM1ngs/iAoSrEwNimJQfHqdSxUz6rNZsKSULLXk9nMuOXu3WC
 HnzDvfzHM2Zhnl+/ypa/2F8KvRSyr2h8a+bi+lPIVReyMvkjVGRJ/QTJskSO8Qa+NV+qnP8OXO6
 Dd5Npu0LxUVuAIig6pG4SoIM17pZsU42PAJeeExpSLSCwilcuAQl7IFfZ3/A6iOYROVsv6dIfo8
 xwSrGzPx3UkBTvFOw3gEjngRPulQsuqqbi28/L9LoOukN3QvVElnmik5c1WlMuPQ5/88lqkL433
 dX5tRixRCFO32UEKnhpf7TWQmfcQbQx96wfCbAHDKE6unvm5JRFOEx3Sd90RKEBPgH91WQwP5do
 ibiYC4yDjIPHdD05g/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150054

Add support for Video AV1 encoder clock controller (AV1ECC)
on Qualcomm Glymur platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Jagadeesh Kona (4):
      clk: qcom: gcc-glymur: Mark GCC AV1E AHB and XO clocks as critical
      dt-bindings: clock: qcom: Add AV1E clock controller on Glymur SoC
      clk: qcom: av1ecc-glymur: Add AV1E clock controller driver
      arm64: dts: qcom: glymur: Add support for AV1E clock controller

 .../bindings/clock/qcom,sm8450-videocc.yaml        |   2 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  16 +
 drivers/clk/qcom/Kconfig                           |  11 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/av1ecc-glymur.c                   | 393 +++++++++++++++++++++
 drivers/clk/qcom/gcc-glymur.c                      |  32 +-
 include/dt-bindings/clock/qcom,glymur-av1ecc.h     |  35 ++
 7 files changed, 460 insertions(+), 30 deletions(-)
---
base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
change-id: 20261013-glymur-av1ecc-7522de7e4e65

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

