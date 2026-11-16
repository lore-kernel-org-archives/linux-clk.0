Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801672;
	b=i6y99AYJpPSDZckkmQ5WO4p+2YuY9xUp7KhTgF70ALcRFNoAx6ZsL4/kV1g8ssWb2Gk6
	 hmclQkh8LtUSZd8lxvhlgJl2PITEyoqMKaqODdstBDIbqhuebMk+iLlC+AagMJs7pOFGV
	 SeF0/paGz7ifnfbz0sGPcd8lRzA9uVv5MvHEKdF0AOWZYIse/g3G24eknaRox1BZljDAv
	 PP6PA363IbeDFE8aRc4tqtdwT7GTHMmPYj15bPDoYY2KG85nT0irph3R/wz9B9ByiJMOU
	 K9V18Jhiz2UxyrptZgA4w+N/+3krZdTw2TXyNhX0GJKufNJy+/HJ14x2K4rPiLIFCZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801672;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QcDyiOSlokKyjjnIu8ukWFiBePuWZqgFytOJsb5n/ok=;
	b=QHvACkD0gRfAXVnV2fdBldCY8y0PypHEdRVVDYy6twKHAiikH82hhLOBw3fA9+VGVixS
	 koHMEdoL1zmz3a6WlMrPzGLzLqMEDe7sT6J38chr7c4w278KQdKqRxNmopa7jk2uyFIKE
	 gnLL0mlh9XVIQwe9rzNc6/IT4vs8wl+SkZfk9OFBVuQx51IqNFNDozVPoHBU8fD3VENW6
	 Pd1aQFtW+GnfAigdotpEMocfRx/Q0oJcsGGwQ44Oo7Ih3ZHA++ccmh6TBD5LJmiGNBr9o
	 DYmM2b6+vUfB4m/FLYOcgtAjhq4YK9KltoOWJ490zpV7CfOvWSi+eUp4I7mVYqUoA2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=peejiJdB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A10606A32C;
	Mon, 16 Nov 2026 04:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51A10606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=peejiJdB
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1L0RX3787251;
	Mon, 16 Nov 2026 04:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QcDyiOSlokKyjjnIu8ukWFiBePuWZqgFytO
	Jsb5n/ok=; b=peejiJdBm96CKNl28bfXweC02H0MlYwBQKJ3vM4gdyLxnAS9j42
	1ZUQgiRL06BuaXatj8bv90kyUUwmZh5LnN4HwAsW1jvjKRpwDf0IYuCxEOvCkxfg
	1QymPxcuTvq4KTbkKfE2kLkFNgMwU2NMqigDP5t7bv/XLZzdnw8DVNPJ+e5VFD4s
	JApXAC6uWI8WCoJfp/mndNw7BTSmEVsIFyFwvWYXETLnrm8iGnepA61I/Ppixjoj
	WYb5HzSr06aBXRcySg9rm7VLKVUx7zR9hgeWlG5mbypTfsn0Dalo1n1puCQQe9J7
	qR7BPiBH9flEytrR5TW+QySsi/smmpyrpig==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkwcjq0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 04:00:54 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG40qcK4139887;
	Mon, 16 Nov 2026 04:00:52 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AG40pdQ4139874
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 04:00:51 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id E5913222D9; Mon, 16 Nov 2026 09:30:50 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Rahul Pathak <rahul@summations.net>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sunil V L <sunilvl@oss.qualcomm.com>,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
        Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v2 0/5] Parallel message send using SBI MPXY
Date: Mon, 16 Nov 2026 09:30:44 +0530
Message-ID: <20261116040049.1795610-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxNSBTYWx0ZWRfX8Ybkgchzc+No
 4P/mS8NPifM3RsgCcTe6iBVZeLCcXWQT6mW7Lo1BhQbQKgrYGL+dUm6f0lJPni0t5an4nE+NxUP
 K51CyaOenbYooKnkWLCVAVgx0eVPmEIV+FqQZyj/J+YjOk1SWPpIGuvV9oVy4PO3SekOq9/IAu1
 eVUk4Lr6FuAsPOyey1HV4PhAycmEV0+whrOGIQGf/U8haBgBB+Jfvh7FpNbJkniA+T4gKIfEOAn
 faVBJ2CmxUDr6S0c13RGZcA5VZqLvP9tkrlXQJ+SWp+XlePbYjOFe5IMP5UJIayTFB8LyzsgTBa
 OQ4tspdQp4p6Ij3wQ6JxB5LqN2m99QNcbeg8i4ugtvAmOPsYPwpOO5LDV0TewtDQwnd64YaNof5
 iXtMvGu6GVf73B8BUIVaoP/5M5nyPNX7eP5quQNS07kKaV/tIR2889Bl7Q2ufXhAZpiUvKoK87t
 QJRVruow0NguESav7PQ==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6afa7ff6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=v1LW-1MmbVdIZeTtpKQA:9
X-Proofpoint-GUID: 7AbmNaH6QRDq9idT8PUxTXF__lffhWv4
X-Proofpoint-ORIG-GUID: 7AbmNaH6QRDq9idT8PUxTXF__lffhWv4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxNSBTYWx0ZWRfX/7xiyUro6dtx
 nprh7IAdKiow4bAujXA8yua/jRdzNl8yAmsp333IbvYjDPpeLi71lcNoATp73yvlknZT7S10WlI
 xdOjw1hCHSM8ofeFDoajMjtotqiDVw0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160015

This series primarily extends mailbox framework and SBI MPXY mailbox
driver to allow sending messages in-parallel from multiple CPUs. It
also serves as perparatory series for the upcoming RISC-V ACPI EINJ
support and RISC-V TEE support.

These patches can also be found in the riscv_mpxy_imp_v2 branch at:
https://github.com/avpatel/linux.git

Changes since v1:
 - Rebase on Linux-7.4-rc2
 - Replace PATCH2 to factor-out per-hart MPXY shared-memory acquisition
   with a new patch to Use irqsave to prevent interrupt when accessing
   MPXY shared memory
 - Adopt Jassi's implementation of mbox_send_message_sync() from:
   https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git/log/?h=jsb/rfc-synch-xfer

Anup Patel (2):
  RISC-V: Move common MPXY helper routines to arch/riscv
  RISC-V: Use irqsave to prevent interrupt when accessing MPXY shared
    memory

Jassi Brar (3):
  mailbox: add direct synchronous transmit API
  mailbox: document direct synchronous transmit
  mailbox: convert RISC-V SBI MPXY to direct transmit

 Documentation/driver-api/mailbox.rst          | 350 ++++++++++++++-
 arch/riscv/include/asm/sbi.h                  |  86 +++-
 arch/riscv/kernel/Makefile                    |   2 +-
 arch/riscv/kernel/sbi_mpxy.c                  | 340 ++++++++++++++
 drivers/clk/clk-rpmi.c                        |   3 -
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c       |   3 -
 drivers/mailbox/mailbox.c                     | 144 +++++-
 drivers/mailbox/riscv-sbi-mpxy-mbox.c         | 415 +++---------------
 .../pmdomain/riscv/riscv-rpmi-device-power.c  |   3 -
 include/linux/mailbox/riscv-rpmi-message.h    |  17 +-
 include/linux/mailbox_client.h                |   9 +-
 include/linux/mailbox_controller.h            |  38 ++
 12 files changed, 1006 insertions(+), 404 deletions(-)
 create mode 100644 arch/riscv/kernel/sbi_mpxy.c

-- 
2.43.0

