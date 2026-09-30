Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7ED4D9575;
	Wed, 30 Sep 2026 15:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780816; cv=none; b=LJL0hurJOM1yVwPEOEX9NUJFGe2MVRf5NCG+H8se61VIzaF0FuWCWmtTk3Hwk7iwRHUBNfaN6gtNe3j4nuf6ltSa5oyi8AeN8Gd+w2OKaKSuOB4dyT7w1afqmVO/YQz9eH3gpo9n2h1RkM1aswDw38/JTG8iPUvvCarkIJqHgKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780816; c=relaxed/simple;
	bh=g76pyboO0C4RBOQ3P2rUuSOWyOdC6YvzZtaucX0fl4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YQd7P5jg5BLmYvaxvnAJll+kYBV3+OCd8Zf8oqK5fZNXdbySlgrMRv+zm6sFsCMCqR/ScokL6ZiGfowTbvcfakXjaTzsNsAxald6/8GnDSXqL1C5X2Jpml0r8MosITmhBnuPnUXYoU5W0vfAAUDf/naIrbFziX5KYDCWEmCfIpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dPFDWEIN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dPFDWEIN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UEvEev273373;
	Wed, 30 Sep 2026 15:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DAl1khxKLlKTN4Vvtu6J7wGLshT6/GMxMc6
	ex3KF3tk=; b=dPFDWEINqiEdd2zVWx2bp2xMtj0/sDL1ktbp6ScrNEBbMPdOasg
	f1mfpO/fqaTjZY736UZWOyrqxz8mxA02+Dl4ItO1noGgl1F0nuTFb/B+9hqwSErM
	lJS0Tqlzedx08l18Q1PnDR1IaX0GCNEuP+0gzXiQXduE7BWmT2KbreimRkoYEGoA
	x4WBWIWWWvgY9kmAuN3v5Rhvxuz4qWag0PKPo94FrlOD7Wg7Ss6yCvivWw55ZUOS
	pEAMll7PU6wEj8CEeB61NZwZxerbzaW5QbDKX/UXNPLgQW9tT6hgJ+xjOjILzWII
	JluPqEVR9fiBWQbpmnMdMs97eazGqkcd0vw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h14n201ma-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 15:06:23 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68UF2KoH1902865;
	Wed, 30 Sep 2026 15:02:20 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 68UF2Jc71902838
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 15:02:19 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 42A5B22151; Wed, 30 Sep 2026 20:32:19 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Rahul Pathak <rahul@summations.net>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>,
        Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 0/4] Parallel message send using SBI MPXY
Date: Wed, 30 Sep 2026 20:32:09 +0530
Message-ID: <20260930150213.799245-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6abd256f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8 a=v1LW-1MmbVdIZeTtpKQA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2MCBTYWx0ZWRfX2TdcuMAf9mtF
 Gpt7/9p50PmgFBVJ+/xnX0aVTipK6NVVesh9MdTzzpVpXa5ezABLNcu1aKE9ImpVBnWi6pMpqLr
 ofinFcVFxRXAvfbB9wYDwSF3Wj57SPs=
X-Proofpoint-GUID: ga7lEutmpDqU94jfNJG4J7kTUhLrsflB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2MCBTYWx0ZWRfX6oIAOveFQwPJ
 yotaerQAH9rG65/3hdBeulA8lUMrzjwTsobIki+aXmrp1ZUCiPigY0/EZm/Lw+WY3QZ5YkLMEUA
 l+j3sAxyJ/rWnhdQtFFrK/jfkXMck2aDQnt07KgkaI/Jo6ylXNRi4u/yOaGhG4ccJpUIDU1b62s
 qQq5tZTeP3GZOKHBmk2zmUpjvyAto2bz0g3CvLOsyxVuxJbwC1yZ+p4XR7G9rYK7HGyTDdUWslT
 Zh83KnDWaL2VskXQn8RutB/PCDrpxCoq8Ka6C2Bq/1lDsZZlrWBhEfH5GrRsDhOfk6VNzNYVtjf
 DybtNb8AB8Q6i+IhXKiTCxyXxhS2EidPyI8PSmgT7QUpuI+1XYuPVzl3wR/BltIhwWNZZ7pr3uo
 VFbLIcMULh+9h4/jT7ft7hC/YCQFFqXm4SZUMLaOIXRDf3z8L35wmBQzab9fiSkHScAuenfzLZO
 9D/A3PEmCdSE/eUHPrQ==
X-Proofpoint-ORIG-GUID: u9C9WKVBg4YBSX4js2tkOSH3SThBGCkZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300060

This series primarily extends mailbox framework and SBI MPXY mailbox
driver to allow sending messages in-parallel from multiple CPUs. It
also serves as perparatory series for the upcoming RISC-V ACPI EINJ
support and RISC-V TEE support.

These patches can also be found in the riscv_mpxy_imp_v1 branch at:
https://github.com/avpatel/linux.git

Amirreza Zarrabi (2):
  RISC-V: Factor-out per-hart MPXY shared-memory acquisition
  mailbox: add direct synchronous send support

Anup Patel (2):
  RISC-V: Move common MPXY helper routines to arch/riscv
  mailbox: riscv-sbi-mpxy: Move to send_data_sync() for sending messages

 arch/riscv/include/asm/sbi.h               |  84 +++-
 arch/riscv/kernel/Makefile                 |   2 +-
 arch/riscv/kernel/sbi_mpxy.c               | 381 +++++++++++++++++++
 drivers/clk/clk-rpmi.c                     |   2 +-
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c    |   2 +-
 drivers/mailbox/mailbox.c                  |  72 +++-
 drivers/mailbox/riscv-sbi-mpxy-mbox.c      | 423 +++------------------
 include/linux/mailbox/riscv-rpmi-message.h |  18 +-
 include/linux/mailbox_client.h             |   3 +
 include/linux/mailbox_controller.h         |  10 +
 10 files changed, 605 insertions(+), 392 deletions(-)
 create mode 100644 arch/riscv/kernel/sbi_mpxy.c

-- 
2.43.0

