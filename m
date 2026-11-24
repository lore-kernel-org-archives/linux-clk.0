Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550525;
	b=g5jF64MbRhIxuQHG6IPU2dQIRQvXR2k/5fiEUiVcm3HKX/V1G3X3zFurnx7j2+n5J4DW
	 7wCaNhBLHjNMMWRQm/j46WYkzPMTVdbupq2B6KMKkW57OBy+K48jtuoMgW4DP9Ofz78lX
	 cw59zwkWlg1nN5lG/8JaY1vA0uQJ+QHL4SelkNf+QqXPbINJfyaLgswh1x0HsKCOhViIN
	 VUhZJfxBkrun+51DnuDL+LV+rmc1kUl/KdGRjysL/KLOOEat/XFWXB5TI+qHWpuwHLtXe
	 skui6QdGv6ueI74baOdXsI3PhB3S3mae1g+CNl1W/IT/XpT3Htszd9RpzAne87mE0rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FtmV9bs0cFqtHg47ZwF2IMxTNlXPSULtGT+At/0DArw=;
	b=Lj8qQUnZhlmQWtu31X5+7bqBPdhttYRaZWLeU+cGMSWq7mHTfsguGBV4OrP+/u9Q6SM/
	 IGariWxNAJXQKzmbfdojSinO9zqaRjFC/heyg+A4+fkOXwHo4zpbFNJC2ftPqzFRfRhKv
	 5O4ALFj5rH/kPm5t3kauFwHnc4cY982Uxmgeg7b7SE5/W1VQUCwW6qPIyoT1D7IUODDDt
	 PrQNfnxRXjMD2Aw1r5bhKMFrSJ+jUQUT0nJZWgdmcC+NyxkLWfStxn/nTq+0M1oS5ZoxU
	 L9Fybal7GWcbF7m/jRpCFoa50AOjbb+hMJyRe733IjR2d4Dm0FAuoRluppgFyFMB8mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VqfIHpcb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTpQmsGo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18D5606A326
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B18D5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VqfIHpcb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTpQmsGo
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXrS53701507
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FtmV9bs0cFqtHg47ZwF2IMxTNlXPSULtGT+At/0DArw=; b=VqfIHpcbNglohcJe
	+f30YZEoEPZsYvtlB+J+XcU8l4TlGiohCVjhFOVMGiQjq+wd9JkJKN8aSN7oOmBI
	vSFuPQ9d3LqoDFAKaTHuVngKngMXu5Yh5/gIDM9zAzRidyEfzWEfnsZCJm1c7vjP
	uVaI7nugv98ZDc9e7jqmRUZsz8OCx+Pz739FaGlOXmKgu8dXK1v8gh+diYBdGg3k
	1U9Fw4jGu4e9tnxDIj8ZDXJ2dYgHB5+ATX2zqO3O3Eue964iU5eZnkKeCsdLfNYN
	jHOK4zqFXbMtMzDKvhCeTnqFAaq/wsHxgkaDHB/mTGVwHW4o7npMdTi+jg18M741
	4hTWbw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5ad7t55h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:02:03 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c9e0f047a6so199550e0c.3
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 12:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550523; x=1796155323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FtmV9bs0cFqtHg47ZwF2IMxTNlXPSULtGT+At/0DArw=;
        b=MTpQmsGoRJA221pC9TgR2JVmRe0Cpdav3z7YDYiGB61BEZyUAWr1Wd5Ll8M9eg2978
         vI8C/6M6gfs9de70fyixTTWwSJgXPRt8LuzDz4RBTZCe98bIWHZSbx9BBl7eSSXGwSj0
         ePkWyid2+iHYPM5khVSa0dnwdbg2aE13hU4QnEwAIPGbuF0IU87CcIeDEsFb5ib0Vbf0
         QJxuIIAAMvLARySYnlmFrpQ7NqL03d8P8+Yub6u9q5OcEGHZ26TGyTtYZYbwzTkAKHrm
         RJ/EEzxQdEs98qkQNNDxraO5PSK7xcDl5py8zqjWHUlrdrF4cYNKrymFadJGeqRGnDmn
         X4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550523; x=1796155323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FtmV9bs0cFqtHg47ZwF2IMxTNlXPSULtGT+At/0DArw=;
        b=ZxcNkC1TiPI9anhMU4huDQj8qQupGQ75+ESiePH2W8Y/g0GvHPMFEPYMOxvX6OCqO2
         buyv+8uKlx/vkQBqvfG7uSViW5IOKfbhpR6soXvC8BPm3CFDPamix8V0MV1eKnTfYVW3
         MDBbwZjkND5QT3U/Kbbs0DbzKM3cvlsN4C/PbnwFDvoTcxotneskagFKGpr11z/zMSqM
         4iWZoXlApDlGR8Mc78bSDuc4bXMMYfyjskZOJqcM103As5cm32pFaXxwaA7/fwDhDr5y
         XbMuVa6INbRuDt553IAcDfF1DQJH0P9Ljruz8ZU9O4utVsy5EmKReJt37MaIZEWQEP6l
         TiRg==
X-Forwarded-Encrypted: i=1; AL+hErFABbGsskf5fGxbC36DVH24fxy1D1DK+tIpnUtx8+tZUG3GhISOvOlhh6vOpAlSn6yuqyuXkMkv6Dk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cyV+s3MEfT+ckhCwkXjKduIM4BPuhe3jOygq6D0k1Tz19r9C2
	Ue5v9VRw1Nf4CFUxViNcF9NCQlvthWYj1aB3rZR0EHkNizuUHPIJLsBNWB2mZrYCw2G35kTThcP
	bOERUI2jLJNsQhwAMrj8GpBSlxKlfx94Rb4ZwncMjG2AWsA53aOeuJgD3lIxiIUw=
X-Gm-Gg: AZFdTZcDvyTFe/mneN1bGIq3asz0sVK6f17ISNeRFZjYM6m1YKqkdL7IMTVxeWT1iZf
	9oqGj9KOErTus5RxR/uyy0DKKhXZy+VeeAkj9oYzOIHjn0iQIY7qbcm7vrSnIJI8oHnnYr5Wy0Q
	iZAiv5tq0M4NKl4F07gEn4zcewAZmxamBms84+7sa8VWGpxtSgpvcy7OGpWWh0pzknMZE4XCLB3
	k/BzsjffZY0vy9Nb4bwql5pxQN0WiYdWuWu/M6hVCChjlMFU42rVygsrCtQJHxxac1a0W2aw+/K
	dlPVR3P3wN+qwcqAE0nnlIO2KvnWZHQDD2sLms/gf+Nqrg6LqRejugbm18FxnmO/luEW+SIAq8H
	hV+aH8mgt/16YPiVBpEYTbAbSWJc77DLudpr0Vtv8ZuD/I5Bvt8JLm9mtLIe+KTowyZcAtLGKfP
	xXCRUgKCE=
X-Received: by 2002:a05:6122:8495:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5ee8ad0e69dmr9109341e0c.0.1795550522783;
        Tue, 24 Nov 2026 12:02:02 -0800 (PST)
X-Received: by 2002:a05:6122:8495:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5ee8ad0e69dmr9109244e0c.0.1795550522029;
        Tue, 24 Nov 2026 12:02:02 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:02:01 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:36 +0100
Subject: [PATCH RFC DNM 07/15] thunderbolt: nhi: Process ring completions
 in the threaded IRQ
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-7-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=12238;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=zgzptO0juMnTmorwZhzOmgRYMBKkjbmea5NgUUDM9G4=;
 b=D5OazM962VNDUGn8keXJVLrzPjXgSrBnM72E6d7VZpMWadRJ/sqMyEcNps+6rumycMMRC9Zjh
 8r5R8g1SxcvBQ2aitJr+dquh/+YWQth+HrHTtrpLvFLb82L157ZKvFw
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX6lzLF0GX7/YM
 u+xS7ueXceV/OOzLdTLJgq6PYM5OqA18pDrrBOT25GxrN78vv1M8gr29y5qh4Iwl0SaTfW8h+PZ
 4CTim0SZIuXQvxGWwYmAUKqNxrougUE=
X-Authority-Analysis: v=2.4 cv=cI51IVeN c=1 sm=1 tr=0 ts=6b05ed3b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=XR_tCNlNi9ieylQGNmwA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXyelIFyGL81ok
 9BJJiOyTYtSwY7rlQtC0F+5qnnwkzZIl9EjAAvazkTubY6HoVLX7zc6nTAxBzykx9Ch/lvt8bpn
 tRki3Isx5vbD2MS3xSkw8OSBhNigxsqdY1jdEVUhbRKc57AdO+jIc374r8xm33CMFh/lrmhPWCB
 /klGX28PZJzi15axEmCMmhDGXdc2rv5V12z8qAoDBzJa9XvL0dZmtqIr+6Io9bWdzM9Fw7jgSV4
 mYhWO2s1xuWhSO+5UNpg6atGoyT4vSSljZehPhxvfcf7JZ0tnKEr5U2cA5vibvPz00Qel+/iRbJ
 CX2omy3HqHpTb3aaBMdM55r5dfCmcyNQ3f3D3oUVyHzsVp++/S6HvgT2QvuETvM8+CAWCRMDjms
 SZQbH3xWBDMz/cHWkN2y/76a8SsjCjieFmrhBICFBbwmDZt52wLQbXTyFkCbgdxCpUijUarcAQA
 XV93o2EOp2vovVVhe3w==
X-Proofpoint-ORIG-GUID: hGIY4g8CBXoN0Yy3i3VMJapuJ8DLS6mh
X-Proofpoint-GUID: hGIY4g8CBXoN0Yy3i3VMJapuJ8DLS6mh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240078

The Qualcomm USB4 router uses a shared IRQ for all NHI rings.
Scheduling a work item from its threaded handler adds another delay
before completed RX frames are consumed and replacement buffers are
posted.

Process completed descriptors directly from the threaded IRQ instead.
Harvest all completed frames while holding the NHI and ring locks,
replenish RX rings immediately, then invoke frame callbacks after
dropping the locks. Preserve the existing polling-ring path, which must
continue to mask the interrupt and start polling instead.

This removes the workqueue round trip from the common IRQ path without
calling ring consumers under NHI locking. Since the callbacks no longer
run only from ring->work, have tb_ring_stop() and tb_ring_free()
synchronize with the ring interrupt, so they keep returning only after
all callbacks of the ring have finished.

Switch the single MSI fallback of the PCI glue over to the same threaded
handler, which allows dropping nhi_interrupt_work() and the work item
that backed it.

Based on related work by Wesley Cheng.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/nhi.c   | 133 +++++++++++++++++++++++++++++++++++---------
 drivers/thunderbolt/nhi.h   |   2 +-
 drivers/thunderbolt/pci.c   |  15 ++---
 include/linux/thunderbolt.h |   8 +--
 4 files changed, 115 insertions(+), 43 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index e48521482c021c7f5f73349ce16519d6088d3250..bcc2b959e3b1a6b014c13a4938ed6f68cb0d0fd8 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -310,6 +310,41 @@ static void ring_write_descriptors(struct tb_ring *ring, bool notify)
 		__ring_notify(ring);
 }
 
+/*
+ * ring_harvest() - collect completed frames
+ * @ring: Ring to collect the frames from
+ * @done: List to move the completed frames to
+ *
+ * Moves all completed frames from the ring buffer to @done and writes new
+ * frames to the ring buffer.
+ *
+ * ring->lock is held.
+ */
+static void ring_harvest(struct tb_ring *ring, struct list_head *done)
+{
+	struct ring_frame *frame;
+
+	lockdep_assert_held(&ring->lock);
+
+	while (!ring_empty(ring)) {
+		if (!(ring->descriptors[ring->tail].flags
+				& RING_DESC_COMPLETED))
+			break;
+		frame = list_first_entry(&ring->in_flight, typeof(*frame),
+					 list);
+		list_move_tail(&frame->list, done);
+		if (!ring->is_tx) {
+			frame->size = ring->descriptors[ring->tail].length;
+			frame->eof = ring->descriptors[ring->tail].eof;
+			frame->sof = ring->descriptors[ring->tail].sof;
+			frame->flags = ring->descriptors[ring->tail].flags;
+		}
+		frame->ring = ring;
+		ring->tail = (ring->tail + 1) % ring->size;
+	}
+	ring_write_descriptors(ring, true);
+}
+
 /*
  * ring_work() - progress completed frames
  *
@@ -337,22 +372,7 @@ static void ring_work(struct work_struct *work)
 		goto invoke_callback;
 	}
 
-	while (!ring_empty(ring)) {
-		if (!(ring->descriptors[ring->tail].flags
-				& RING_DESC_COMPLETED))
-			break;
-		frame = list_first_entry(&ring->in_flight, typeof(*frame),
-					 list);
-		list_move_tail(&frame->list, &done);
-		if (!ring->is_tx) {
-			frame->size = ring->descriptors[ring->tail].length;
-			frame->eof = ring->descriptors[ring->tail].eof;
-			frame->sof = ring->descriptors[ring->tail].sof;
-			frame->flags = ring->descriptors[ring->tail].flags;
-		}
-		ring->tail = (ring->tail + 1) % ring->size;
-	}
-	ring_write_descriptors(ring, true);
+	ring_harvest(ring, &done);
 
 invoke_callback:
 	/* allow callbacks to schedule new work */
@@ -371,6 +391,35 @@ static void ring_work(struct work_struct *work)
 	wake_up(&ring->wait);
 }
 
+/*
+ * ring_process_completions() - invoke the callbacks of completed frames
+ * @done: Frames collected by ring_harvest(), possibly from several rings
+ *
+ * The frames of each ring are contiguous in @done. Like ring_work(), wake
+ * up the waiters of a ring once the callbacks of all its frames have run.
+ */
+static void ring_process_completions(struct list_head *done)
+{
+	struct ring_frame *frame;
+	struct tb_ring *ring;
+
+	while (!list_empty(done)) {
+		frame = list_first_entry(done, typeof(*frame), list);
+		ring = frame->ring;
+		/*
+		 * The callback may reenqueue or delete frame.
+		 * Do not hold on to it.
+		 */
+		list_del_init(&frame->list);
+		if (frame->callback)
+			frame->callback(ring, frame, false);
+
+		if (list_empty(done) ||
+		    list_first_entry(done, typeof(*frame), list)->ring != ring)
+			wake_up(&ring->wait);
+	}
+}
+
 int __tb_ring_enqueue(struct tb_ring *ring, struct ring_frame *frame, bool more)
 {
 	unsigned long flags;
@@ -819,6 +868,19 @@ static bool tb_ring_empty(struct tb_ring *ring)
 	return list_empty(&ring->in_flight);
 }
 
+/*
+ * ring_sync_irq() - wait for the interrupt handler of a ring
+ *
+ * nhi_msi_thread() invokes the callbacks of the frames it has harvested
+ * after dropping the locks, so make sure it has finished with any frames
+ * of a ring that has been stopped or dissociated from the NHI.
+ */
+static void ring_sync_irq(struct tb_ring *ring)
+{
+	if (ring->irq > 0)
+		synchronize_irq(ring->irq);
+}
+
 /**
  * tb_ring_flush() - Waits for a ring to be empty
  * @ring: Ring to wait
@@ -881,6 +943,8 @@ void tb_ring_stop(struct tb_ring *ring)
 	spin_unlock(&ring->lock);
 	spin_unlock_irq(&ring->nhi->lock);
 
+	ring_sync_irq(ring);
+
 	/*
 	 * schedule ring->work to invoke callbacks on all remaining frames.
 	 */
@@ -906,7 +970,7 @@ void tb_ring_free(struct tb_ring *ring)
 	spin_lock_irq(&ring->nhi->lock);
 	/*
 	 * Dissociate the ring from the NHI. This also ensures that
-	 * nhi_interrupt_work cannot reschedule ring->work.
+	 * nhi_msi_thread() cannot harvest its frames anymore.
 	 */
 	if (ring->is_tx)
 		ring->nhi->tx_rings[ring->hop] = NULL;
@@ -919,6 +983,8 @@ void tb_ring_free(struct tb_ring *ring)
 	}
 	spin_unlock_irq(&ring->nhi->lock);
 
+	ring_sync_irq(ring);
+
 	if (nhi->ops->release_ring_irq)
 		nhi->ops->release_ring_irq(ring);
 
@@ -935,8 +1001,8 @@ void tb_ring_free(struct tb_ring *ring)
 
 	/*
 	 * ring->work can no longer be scheduled (it is scheduled only
-	 * by nhi_interrupt_work, ring_stop and ring_msix). Wait for it
-	 * to finish before freeing the ring.
+	 * by ring_stop and ring_msix). Wait for it to finish before
+	 * freeing the ring.
 	 */
 	flush_work(&ring->work);
 	lockdep_unregister_key(&ring->lock_key);
@@ -1022,16 +1088,18 @@ enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi)
 	return (enum nhi_fw_mode)val;
 }
 
-void nhi_interrupt_work(struct work_struct *work)
+irqreturn_t nhi_msi_thread(int irq, void *data)
 {
-	struct tb_nhi *nhi = container_of(work, typeof(*nhi), interrupt_work);
+	struct tb_nhi *nhi = data;
+	LIST_HEAD(completed_frames);
+	unsigned long flags;
 	int value = 0; /* Suppress uninitialized usage warning. */
 	int bit;
 	int hop = -1;
 	int type = 0; /* current interrupt type 0: TX, 1: RX, 2: RX overflow */
 	struct tb_ring *ring;
 
-	spin_lock_irq(&nhi->lock);
+	spin_lock_irqsave(&nhi->lock, flags);
 
 	/*
 	 * Starting at REG_RING_NOTIFY_BASE there are three status bitfields
@@ -1073,17 +1141,28 @@ void nhi_interrupt_work(struct work_struct *work)
 		}
 
 		spin_lock(&ring->lock);
-		__ring_interrupt(ring);
+		/*
+		 * Harvest the completions right away instead of deferring
+		 * to ring->work, so that the RX buffers are reposted without
+		 * another scheduling delay during a burst.
+		 */
+		if (ring->start_poll)
+			__ring_interrupt(ring);
+		else if (ring->running)
+			ring_harvest(ring, &completed_frames);
 		spin_unlock(&ring->lock);
 	}
-	spin_unlock_irq(&nhi->lock);
+	spin_unlock_irqrestore(&nhi->lock, flags);
+
+	if (!list_empty(&completed_frames))
+		ring_process_completions(&completed_frames);
+
+	return IRQ_HANDLED;
 }
 
 irqreturn_t nhi_msi(int irq, void *data)
 {
-	struct tb_nhi *nhi = data;
-	schedule_work(&nhi->interrupt_work);
-	return IRQ_HANDLED;
+	return IRQ_WAKE_THREAD;
 }
 
 static int __nhi_suspend_noirq(struct device *dev, bool wakeup)
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 88af9ab9fde7afc8af6da412b668663e67380e53..71f750451aacae6ca2f8cb37bd8ae7fc5a029818 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -31,8 +31,8 @@ int nhi_mailbox_cmd(struct tb_nhi *nhi, enum nhi_mailbox_cmd cmd, u32 data);
 enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi);
 void nhi_enable_int_throttling(struct tb_nhi *nhi);
 void nhi_disable_interrupts(struct tb_nhi *nhi);
-void nhi_interrupt_work(struct work_struct *work);
 irqreturn_t nhi_msi(int irq, void *data);
+irqreturn_t nhi_msi_thread(int irq, void *data);
 irqreturn_t ring_msix(int irq, void *data);
 int nhi_probe(struct tb_nhi *nhi);
 void nhi_shutdown(struct tb_nhi *nhi);
diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index 9fe2ef43d8ac8ac867c6e37d7a77518ad2221ed9..6388f77c67ac6d51831667abbffcfb8f52881af6 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -206,14 +206,13 @@ static int nhi_pci_init_msi(struct tb_nhi *nhi)
 		if (nvec < 0)
 			return nvec;
 
-		INIT_WORK(&nhi->interrupt_work, nhi_interrupt_work);
-
 		irq = pci_irq_vector(pdev, 0);
 		if (irq < 0)
 			return irq;
 
-		res = devm_request_irq(&pdev->dev, irq, nhi_msi,
-				       IRQF_NO_SUSPEND, "thunderbolt", nhi);
+		res = devm_request_threaded_irq(&pdev->dev, irq, nhi_msi,
+						nhi_msi_thread,
+						IRQF_NO_SUSPEND, "thunderbolt", nhi);
 		if (res)
 			return res;
 	}
@@ -311,14 +310,8 @@ static void nhi_pci_release_irq(struct tb_nhi *nhi)
 	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
 	struct pci_dev *pdev = to_pci_dev(nhi->dev);
 
-	/*
-	 * We have to release the irq before calling flush_work. Otherwise an
-	 * already executing IRQ handler could call schedule_work again.
-	 */
-	if (!pdev->msix_enabled) {
+	if (!pdev->msix_enabled)
 		devm_free_irq(nhi->dev, pdev->irq, nhi);
-		flush_work(&nhi->interrupt_work);
-	}
 	ida_destroy(&nhi_pci->msix_ida);
 }
 
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 57502da290805ed6ba627578da060afe290d4137..4faec9246d175d08063b7881ed1d379b9a7bdafd 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -501,7 +501,8 @@ void tb_service_properties_changed(struct tb_service *svc);
 /**
  * struct tb_nhi - thunderbolt native host interface
  * @lock: Must be held during ring creation/destruction. Is acquired by
- *	  interrupt_work when dispatching interrupts to individual rings.
+ *	  the interrupt thread when dispatching interrupts to individual
+ *	  rings.
  * @dev: Device associated with this NHI instance
  * @ops: NHI specific optional ops
  * @iobase: MMIO space of the NHI
@@ -511,8 +512,6 @@ void tb_service_properties_changed(struct tb_service *svc);
  * @going_away: The host controller device is about to disappear so when
  *		this flag is set, avoid touching the hardware anymore.
  * @iommu_dma_protection: An IOMMU will isolate external-facing ports.
- * @interrupt_work: Work scheduled to handle ring interrupt when no
- *		    MSI-X is used.
  * @hop_count: Number of rings (end point hops) supported by NHI.
  * @quirks: NHI specific quirks if any
  * @domain_released: Completed when domain has been fully released
@@ -532,7 +531,6 @@ struct tb_nhi {
 	u32 *interrupt_mask;
 	bool going_away;
 	bool iommu_dma_protection;
-	struct work_struct interrupt_work;
 	u32 hop_count;
 	unsigned long quirks;
 	struct completion domain_released;
@@ -639,11 +637,13 @@ enum ring_desc_flags {
  * @flags: Flags for the frame (see &enum ring_desc_flags)
  * @eof: End of frame protocol defined field
  * @sof: Start of frame protocol defined field
+ * @ring: Ring the frame was completed on
  */
 struct ring_frame {
 	dma_addr_t buffer_phy;
 	ring_cb callback;
 	struct list_head list;
+	struct tb_ring *ring;
 	u32 size:12;
 	u32 flags:12;
 	u32 eof:4;

-- 
2.55.0

