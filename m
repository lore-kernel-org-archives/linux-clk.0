Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFF15012AB;
	Wed, 30 Sep 2026 15:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780578; cv=none; b=namgDdLbx/Zm6F6THBjOb4rGm6TrOh/SQ4zlxodgFVuHcCZc9owd8f1Rrql1IHI7SBA6xELCL7+Yf8PIBJOc5xl5PyAr0S+pwwdTCkr3FfMH14BUC+Jznmi97ucIxLgbYO4I7KfCNycxFhzyKFKwlWoKSWltBLL85hdMC0CBH64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780578; c=relaxed/simple;
	bh=fJwr4doyghqEvQfFXooTwG1nNnlQlWS2Q43RQdMctXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QonxuJNhUkWlb2PW7RfGRmh9v98lrffzEkSo13iC4O3PYSmmaYdFZgUuQDXMMoBQGjby9a2LyIttDwsnH7kJv/Q9dKGEvxvyuU/16r7i2OLVhzQuw+yzlXMU7lWYa9GTmhH9hOseXMRuVZTaX97tLgI+owAszThCwLpjj95LUJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k3i2iIU2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k3i2iIU2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxtlU3930122;
	Wed, 30 Sep 2026 15:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OOJTMrp0oe/
	RJ8nFNolcME7lyjvWCqUOinISrk7Tauw=; b=k3i2iIU2W3MeJZtobYrsRYeoaIp
	nh7IAOPphdfDJI3nnU/zgOTYKPDD0UZzwZp+5FhMcNag7BLrkKxoAbvOC+6DuNSU
	gSz0BSmLNLWabPe7+zP4EdYk6grnmAIlG/2hd7spUVD5VW4Iq9yFDx2tyjKLMQmx
	2ovr9JCpumFPIfTzP6ubX+cOIZcLK4ebCUlON7H9C8DR3JoRpFIzz+O5oOptAwl3
	gsW9Slxqdt0yh7BVKf8pO0/RVtN5TRCrAMBBUUHgre8nCRz0wAL8JtxLKG3f/Nev
	yleI+fsI9Qr5VmWAJYQML2QdwAz69fJB1TCJ3cUdGJYt5XnRv7YWfuuNKpg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0w14282j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 15:02:22 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68UF2Kd01902867;
	Wed, 30 Sep 2026 15:02:20 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 68UF2JJK1902841
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 15:02:19 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 458B522BE5; Wed, 30 Sep 2026 20:32:19 +0530 (+0530)
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
        linux-clk@vger.kernel.org, Anup Patel <anup.patel@oss.qualcomm.com>,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH 1/4] RISC-V: Move common MPXY helper routines to arch/riscv
Date: Wed, 30 Sep 2026 20:32:10 +0530
Message-ID: <20260930150213.799245-2-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930150213.799245-1-anup.patel@oss.qualcomm.com>
References: <20260930150213.799245-1-anup.patel@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX67DaaUf8ewIr
 5I7kaZoYOrGrG4EMnJU7cONA5cB549wTiUp25n5Vdt0ShXD364zVNB8C+pj9cSnbFcx+LCy+CVK
 u7lqCfn4gWOmmfZC/7TZLT1Hvz5rEow=
X-Proofpoint-GUID: KsgKVTu0ALOhKmHwn3adoCH-IitzjhNP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX8R7RvHQYcAxr
 15NcTE8RAczRBfC7vFXZt0R3ncnJvYX6sHfacHfBcKRXHDJ7ZCyas2E+hygy0m9n39ZDVvwYaqh
 akamQHGgupYnKC66UaIWrA8eCulvqI+0p3t8F9ioHXmLkun1YUCa009EV7qVzDdWbeTcTyIaTE3
 ZG3mdO7nc7u49hn6Jiu/CQ10RaZICDKbcUF/QUde12FuQom0E2tc0b+8Y7a7Hh1GHX6ZeOEt8Cu
 8ik1EE8iAjhT1dX++FxBox8VftezF31nILP4RQ+MRMSM6Gh4e6hG4MKffT5T7njL6dfCz51NxS1
 hTTRyDOqCPvGdA1//Ofh7+bNJo1VSURIwo3SOIMSENFmURRfkpHkE42PxqODnuKmfrrBT+eitNF
 ru0vjVsv2GYEzTbsIRmpgtBEPUHVBcjgjsnKwrmiBK+H+3b2TeM+FDwB1fWtwcXCDeaXDnTeEHF
 sVzIMLzmQDff9oAwdyw==
X-Authority-Analysis: v=2.4 cv=J8Q/fwnS c=1 sm=1 tr=0 ts=6abd247f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=ndT2cITx6XjDZpHkP44A:9
X-Proofpoint-ORIG-GUID: lm5H0A_ZNXXpkW6tPiZulKxJZ47dmYzN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1011
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300059

There are upcoming kernel changes (such as RISC-V EINJ FFH support)
where the MPXY channel_id is known but the Linux mailbox channel
instance is not available. For such cases, the kernel will directly
do SBI MPXY calls bypassing the Linux mailbox framework and share
the MPXY shared memory with the Linux SBI MPXY mailbox driver.

To support the above, move the common MPXY helper routines and
MPXY shared memory management from Linux SBI MPXY mailbox driver
to arch/riscv.

Co-developed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 arch/riscv/include/asm/sbi.h          |  84 +++++-
 arch/riscv/kernel/Makefile            |   2 +-
 arch/riscv/kernel/sbi_mpxy.c          | 340 +++++++++++++++++++++++
 drivers/mailbox/riscv-sbi-mpxy-mbox.c | 386 +++-----------------------
 4 files changed, 458 insertions(+), 354 deletions(-)
 create mode 100644 arch/riscv/kernel/sbi_mpxy.c

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 5725e0ca4dda..c41e1af31a45 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -624,6 +624,37 @@ static inline int sbi_fwft_set_online_cpus(u32 feature, unsigned long value,
 	return sbi_fwft_set_cpumask(cpu_online_mask, feature, value, flags);
 }
 
+/* SBI MPXY notification data in shared memory */
+struct sbi_mpxy_notification_data {
+	/* Remaining number of notification events */
+	__le32 remaining;
+	/* Number of notification events returned */
+	__le32 returned;
+	/* Number of notification events lost */
+	__le32 lost;
+	/* Reserved for future use */
+	__le32 reserved;
+	/* Returned channel id array */
+	u8 events_data[];
+};
+
+unsigned long sbi_mpxy_shmem_size(void);
+int sbi_mpxy_get_channel_count(u32 *channel_count);
+int sbi_mpxy_get_channel_ids(u32 channel_count, u32 *channel_ids);
+int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
+			u32 *attrs_buf);
+int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
+			 u32 *attrs_buf);
+int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
+				    void *tx, unsigned long tx_len,
+				    void *rx, unsigned long max_rx_len,
+				    unsigned long *rx_len);
+int sbi_mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
+				       void *tx, unsigned long tx_len);
+int sbi_mpxy_get_notifications(u32 channel_id,
+			       struct sbi_mpxy_notification_data *notif_data,
+			       unsigned long *events_data_len);
+
 /* Check if current SBI specification version is 0.1 or not */
 static inline int sbi_spec_is_0_1(void)
 {
@@ -685,7 +716,58 @@ int sbi_debug_console_read(char *bytes, unsigned int num_bytes);
 
 #else /* CONFIG_RISCV_SBI */
 static inline int sbi_remote_fence_i(const struct cpumask *cpu_mask) { return -1; }
-static inline void sbi_init(void) {}
+static inline void sbi_init(void)
+{
+}
+
+static inline unsigned long sbi_mpxy_shmem_size(void)
+{
+	return 0;
+}
+
+static inline int sbi_mpxy_get_channel_count(u32 *channel_count)
+{
+	return -ENODEV;
+}
+
+static inline int sbi_mpxy_get_channel_ids(u32 channel_count, u32 *channel_ids)
+{
+	return -ENODEV;
+}
+
+int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
+			u32 *attrs_buf)
+{
+	return -ENODEV;
+}
+
+int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
+			 u32 *attrs_buf)
+{
+	return -ENODEV;
+}
+
+int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
+				    void *tx, unsigned long tx_len,
+				    void *rx, unsigned long max_rx_len,
+				    unsigned long *rx_len)
+{
+	return -ENODEV;
+}
+
+int sbi_mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
+				       void *tx, unsigned long tx_len)
+{
+	return -ENODEV;
+}
+
+int sbi_mpxy_get_notifications(u32 channel_id,
+			       struct sbi_mpxy_notification_data *notif_data,
+			       unsigned long *events_data_len)
+{
+	return -ENODEV;
+}
+
 #endif /* CONFIG_RISCV_SBI */
 
 unsigned long riscv_get_mvendorid(void);
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 9bcce9cad256..053d4353d40e 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -101,7 +101,7 @@ obj-$(CONFIG_DYNAMIC_FTRACE)	+= mcount-dyn.o
 
 obj-$(CONFIG_PERF_EVENTS)	+= perf_callchain.o
 obj-$(CONFIG_HAVE_PERF_REGS)	+= perf_regs.o
-obj-$(CONFIG_RISCV_SBI)		+= sbi.o sbi_ecall.o
+obj-$(CONFIG_RISCV_SBI)		+= sbi.o sbi_ecall.o sbi_mpxy.o
 ifeq ($(CONFIG_RISCV_SBI), y)
 obj-$(CONFIG_SMP)		+= sbi-ipi.o
 obj-$(CONFIG_SMP) += cpu_ops_sbi.o
diff --git a/arch/riscv/kernel/sbi_mpxy.c b/arch/riscv/kernel/sbi_mpxy.c
new file mode 100644
index 000000000000..17a2cee21311
--- /dev/null
+++ b/arch/riscv/kernel/sbi_mpxy.c
@@ -0,0 +1,340 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Common SBI MPXY access library.
+ *
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#define pr_fmt(fmt) "riscv: " fmt
+#include <linux/cpu.h>
+#include <linux/init.h>
+#include <linux/mm.h>
+#include <linux/percpu.h>
+#include <linux/printk.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <asm/byteorder.h>
+#include <asm/sbi.h>
+
+/* SBI MPXY channel IDs data in shared memory */
+struct sbi_mpxy_channel_ids_data {
+	/* Remaining number of channel ids */
+	__le32 remaining;
+	/* Returned channel ids in current function call */
+	__le32 returned;
+	/* Returned channel id array */
+	__le32 channel_array[];
+};
+
+/* MPXY Per-CPU or local context */
+struct mpxy_local {
+	/* Shared memory base address */
+	void *shmem;
+	/* Shared memory physical address */
+	phys_addr_t shmem_phys_addr;
+	/* Flag representing whether shared memory is active or not */
+	bool shmem_active;
+};
+
+static DEFINE_PER_CPU(struct mpxy_local, mpxy_local);
+static unsigned long mpxy_shmem_size;
+static bool mpxy_shmem_init_done;
+
+unsigned long sbi_mpxy_shmem_size(void)
+{
+	if (!mpxy_shmem_init_done)
+		return 0;
+	return mpxy_shmem_size;
+}
+EXPORT_SYMBOL_GPL(sbi_mpxy_shmem_size);
+
+int sbi_mpxy_get_channel_count(u32 *channel_count)
+{
+	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct sbi_mpxy_channel_ids_data *sdata = mpxy->shmem;
+	u32 remaining, returned;
+	struct sbiret sret;
+
+	if (!mpxy->shmem_active)
+		return -ENODEV;
+	if (!channel_count)
+		return -EINVAL;
+
+	get_cpu();
+
+	/* Get the remaining and returned fields to calculate total */
+	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL_IDS,
+			 0, 0, 0, 0, 0, 0);
+	if (sret.error)
+		goto err_put_cpu;
+
+	remaining = le32_to_cpu(sdata->remaining);
+	returned = le32_to_cpu(sdata->returned);
+	*channel_count = remaining + returned;
+
+err_put_cpu:
+	put_cpu();
+	return sbi_err_map_linux_errno(sret.error);
+}
+EXPORT_SYMBOL_GPL(sbi_mpxy_get_channel_count);
+
+int sbi_mpxy_get_channel_ids(u32 channel_count, u32 *channel_ids)
+{
+	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct sbi_mpxy_channel_ids_data *sdata = mpxy->shmem;
+	u32 remaining, returned, count, start_index = 0;
+	struct sbiret sret;
+
+	if (!mpxy->shmem_active)
+		return -ENODEV;
+	if (!channel_count || !channel_ids)
+		return -EINVAL;
+
+	get_cpu();
+
+	do {
+		sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL_IDS,
+				 start_index, 0, 0, 0, 0, 0);
+		if (sret.error)
+			goto err_put_cpu;
+
+		remaining = le32_to_cpu(sdata->remaining);
+		returned = le32_to_cpu(sdata->returned);
+
+		count = returned < (channel_count - start_index) ?
+			returned : (channel_count - start_index);
+		memcpy_from_le32(&channel_ids[start_index], sdata->channel_array, count);
+		start_index += count;
+	} while (remaining && start_index < channel_count);
+
+err_put_cpu:
+	put_cpu();
+	return sbi_err_map_linux_errno(sret.error);
+}
+EXPORT_SYMBOL_GPL(sbi_mpxy_get_channel_ids);
+
+int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
+			u32 *attrs_buf)
+{
+	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct sbiret sret;
+
+	if (!mpxy->shmem_active)
+		return -ENODEV;
+	if (!attr_count || !attrs_buf)
+		return -EINVAL;
+
+	get_cpu();
+
+	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_READ_ATTRS,
+			 channel_id, base_attrid, attr_count, 0, 0, 0);
+	if (sret.error)
+		goto err_put_cpu;
+
+	memcpy_from_le32(attrs_buf, (__le32 *)mpxy->shmem, attr_count);
+
+err_put_cpu:
+	put_cpu();
+	return sbi_err_map_linux_errno(sret.error);
+}
+EXPORT_SYMBOL_GPL(sbi_mpxy_read_attrs);
+
+int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
+			 u32 *attrs_buf)
+{
+	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct sbiret sret;
+
+	if (!mpxy->shmem_active)
+		return -ENODEV;
+	if (!attr_count || !attrs_buf)
+		return -EINVAL;
+
+	get_cpu();
+
+	memcpy_to_le32((__le32 *)mpxy->shmem, attrs_buf, attr_count);
+	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_WRITE_ATTRS,
+			 channel_id, base_attrid, attr_count, 0, 0, 0);
+
+	put_cpu();
+	return sbi_err_map_linux_errno(sret.error);
+}
+EXPORT_SYMBOL_GPL(sbi_mpxy_write_attrs);
+
+int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
+				    void *tx, unsigned long tx_len,
+				    void *rx, unsigned long max_rx_len,
+				    unsigned long *rx_len)
+{
+	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	unsigned long rx_bytes;
+	struct sbiret sret;
+
+	if (!mpxy->shmem_active)
+		return -ENODEV;
+	if (!tx && tx_len)
+		return -EINVAL;
+
+	get_cpu();
+
+	/* Message protocols allowed to have no data in messages */
+	if (tx_len)
+		memcpy(mpxy->shmem, tx, tx_len);
+
+	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_SEND_MSG_WITH_RESP,
+			 channel_id, msg_id, tx_len, 0, 0, 0);
+	if (rx && !sret.error) {
+		rx_bytes = sret.value;
+		if (rx_bytes > max_rx_len) {
+			put_cpu();
+			return -ENOSPC;
+		}
+
+		memcpy(rx, mpxy->shmem, rx_bytes);
+		if (rx_len)
+			*rx_len = rx_bytes;
+	}
+
+	put_cpu();
+	return sbi_err_map_linux_errno(sret.error);
+}
+EXPORT_SYMBOL_GPL(sbi_mpxy_send_message_with_resp);
+
+int sbi_mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
+				       void *tx, unsigned long tx_len)
+{
+	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct sbiret sret;
+
+	if (!mpxy->shmem_active)
+		return -ENODEV;
+	if (!tx && tx_len)
+		return -EINVAL;
+
+	get_cpu();
+
+	/* Message protocols allowed to have no data in messages */
+	if (tx_len)
+		memcpy(mpxy->shmem, tx, tx_len);
+
+	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_SEND_MSG_WITHOUT_RESP,
+			 channel_id, msg_id, tx_len, 0, 0, 0);
+
+	put_cpu();
+	return sbi_err_map_linux_errno(sret.error);
+}
+EXPORT_SYMBOL_GPL(sbi_mpxy_send_message_without_resp);
+
+int sbi_mpxy_get_notifications(u32 channel_id,
+			       struct sbi_mpxy_notification_data *notif_data,
+			       unsigned long *events_data_len)
+{
+	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct sbiret sret;
+
+	if (!mpxy->shmem_active)
+		return -ENODEV;
+	if (!notif_data || !events_data_len)
+		return -EINVAL;
+
+	get_cpu();
+
+	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS,
+			 channel_id, 0, 0, 0, 0, 0);
+	if (sret.error)
+		goto err_put_cpu;
+	if (sret.value < 0 || mpxy_shmem_size < sizeof(*notif_data) ||
+	    sret.value > mpxy_shmem_size - sizeof(*notif_data)) {
+		put_cpu();
+		return -EOVERFLOW;
+	}
+
+	memcpy(notif_data, mpxy->shmem, sret.value + sizeof(*notif_data));
+	*events_data_len = sret.value;
+
+err_put_cpu:
+	put_cpu();
+	return sbi_err_map_linux_errno(sret.error);
+}
+EXPORT_SYMBOL_GPL(sbi_mpxy_get_notifications);
+
+static int mpxy_get_shmem_size(unsigned long *shmem_size)
+{
+	struct sbiret sret;
+
+	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_SHMEM_SIZE,
+			 0, 0, 0, 0, 0, 0);
+	if (sret.error)
+		return sbi_err_map_linux_errno(sret.error);
+	if (shmem_size)
+		*shmem_size = sret.value;
+	return 0;
+}
+
+static int mpxy_setup_shmem(unsigned int cpu)
+{
+	struct page *shmem_page;
+	struct mpxy_local *mpxy;
+	struct sbiret sret;
+
+	mpxy = per_cpu_ptr(&mpxy_local, cpu);
+	if (mpxy->shmem_active)
+		return 0;
+
+	shmem_page = alloc_pages(GFP_KERNEL | __GFP_ZERO, get_order(mpxy_shmem_size));
+	if (!shmem_page)
+		return -ENOMEM;
+
+	/*
+	 * Linux setup of shmem is done in mpxy OVERWRITE mode.
+	 * flags[1:0] = 00b
+	 */
+	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_SET_SHMEM,
+			 page_to_phys(shmem_page), 0, 0, 0, 0, 0);
+	if (sret.error) {
+		free_pages((unsigned long)page_to_virt(shmem_page),
+			   get_order(mpxy_shmem_size));
+		return sbi_err_map_linux_errno(sret.error);
+	}
+
+	mpxy->shmem = page_to_virt(shmem_page);
+	mpxy->shmem_phys_addr = page_to_phys(shmem_page);
+	mpxy->shmem_active = true;
+
+	return 0;
+}
+
+static int __init sbi_mpxy_init(void)
+{
+	int rc;
+
+	/* Skip quietly when MPXY extension is not supported. */
+	if (sbi_spec_version < sbi_mk_version(3, 0) ||
+	    !sbi_probe_extension(SBI_EXT_MPXY))
+		return 0;
+	pr_info("SBI MPXY extension detected\n");
+
+	/* Find-out shared memory size */
+	rc = mpxy_get_shmem_size(&mpxy_shmem_size);
+	if (rc) {
+		pr_err("failed to get MPXY shared memory size\n");
+		return rc;
+	}
+
+	/*
+	 * Setup MPXY shared memory on each CPU
+	 *
+	 * Note: Don't cleanup MPXY shared memory upon CPU power-down
+	 * because the RPMI System MSI irqchip driver needs it to be
+	 * available when migrating IRQs in CPU power-down path.
+	 */
+	rc = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/sbi-mpxy-shmem",
+			       mpxy_setup_shmem, NULL);
+	if (rc < 0)
+		return rc;
+
+	/* Mark as MPXY shared memory initialization done */
+	mpxy_shmem_init_done = true;
+	return 0;
+}
+arch_initcall(sbi_mpxy_init);
diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index ea69c6b6b4f9..cba95b8406ee 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -17,7 +17,6 @@
 #include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/of_irq.h>
-#include <linux/percpu.h>
 #include <linux/platform_device.h>
 #include <linux/smp.h>
 #include <linux/string.h>
@@ -85,295 +84,6 @@ struct sbi_mpxy_rpmi_channel_attrs {
 	u32 impl_version;
 };
 
-/* SBI MPXY channel IDs data in shared memory */
-struct sbi_mpxy_channel_ids_data {
-	/* Remaining number of channel ids */
-	__le32 remaining;
-	/* Returned channel ids in current function call */
-	__le32 returned;
-	/* Returned channel id array */
-	__le32 channel_array[];
-};
-
-/* SBI MPXY notification data in shared memory */
-struct sbi_mpxy_notification_data {
-	/* Remaining number of notification events */
-	__le32 remaining;
-	/* Number of notification events returned */
-	__le32 returned;
-	/* Number of notification events lost */
-	__le32 lost;
-	/* Reserved for future use */
-	__le32 reserved;
-	/* Returned channel id array */
-	u8 events_data[];
-};
-
-/* ====== MPXY data structures & helper routines ====== */
-
-/* MPXY Per-CPU or local context */
-struct mpxy_local {
-	/* Shared memory base address */
-	void *shmem;
-	/* Shared memory physical address */
-	phys_addr_t shmem_phys_addr;
-	/* Flag representing whether shared memory is active or not */
-	bool shmem_active;
-};
-
-static DEFINE_PER_CPU(struct mpxy_local, mpxy_local);
-static unsigned long mpxy_shmem_size;
-static bool mpxy_shmem_init_done;
-
-static int mpxy_get_channel_count(u32 *channel_count)
-{
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
-	struct sbi_mpxy_channel_ids_data *sdata = mpxy->shmem;
-	u32 remaining, returned;
-	struct sbiret sret;
-
-	if (!mpxy->shmem_active)
-		return -ENODEV;
-	if (!channel_count)
-		return -EINVAL;
-
-	get_cpu();
-
-	/* Get the remaining and returned fields to calculate total */
-	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL_IDS,
-			 0, 0, 0, 0, 0, 0);
-	if (sret.error)
-		goto err_put_cpu;
-
-	remaining = le32_to_cpu(sdata->remaining);
-	returned = le32_to_cpu(sdata->returned);
-	*channel_count = remaining + returned;
-
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
-}
-
-static int mpxy_get_channel_ids(u32 channel_count, u32 *channel_ids)
-{
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
-	struct sbi_mpxy_channel_ids_data *sdata = mpxy->shmem;
-	u32 remaining, returned, count, start_index = 0;
-	struct sbiret sret;
-
-	if (!mpxy->shmem_active)
-		return -ENODEV;
-	if (!channel_count || !channel_ids)
-		return -EINVAL;
-
-	get_cpu();
-
-	do {
-		sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL_IDS,
-				 start_index, 0, 0, 0, 0, 0);
-		if (sret.error)
-			goto err_put_cpu;
-
-		remaining = le32_to_cpu(sdata->remaining);
-		returned = le32_to_cpu(sdata->returned);
-
-		count = returned < (channel_count - start_index) ?
-			returned : (channel_count - start_index);
-		memcpy_from_le32(&channel_ids[start_index], sdata->channel_array, count);
-		start_index += count;
-	} while (remaining && start_index < channel_count);
-
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
-}
-
-static int mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
-			   u32 *attrs_buf)
-{
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
-	struct sbiret sret;
-
-	if (!mpxy->shmem_active)
-		return -ENODEV;
-	if (!attr_count || !attrs_buf)
-		return -EINVAL;
-
-	get_cpu();
-
-	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_READ_ATTRS,
-			 channel_id, base_attrid, attr_count, 0, 0, 0);
-	if (sret.error)
-		goto err_put_cpu;
-
-	memcpy_from_le32(attrs_buf, (__le32 *)mpxy->shmem, attr_count);
-
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
-}
-
-static int mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
-			    u32 *attrs_buf)
-{
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
-	struct sbiret sret;
-
-	if (!mpxy->shmem_active)
-		return -ENODEV;
-	if (!attr_count || !attrs_buf)
-		return -EINVAL;
-
-	get_cpu();
-
-	memcpy_to_le32((__le32 *)mpxy->shmem, attrs_buf, attr_count);
-	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_WRITE_ATTRS,
-			 channel_id, base_attrid, attr_count, 0, 0, 0);
-
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
-}
-
-static int mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
-				       void *tx, unsigned long tx_len,
-				       void *rx, unsigned long max_rx_len,
-				       unsigned long *rx_len)
-{
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
-	unsigned long rx_bytes;
-	struct sbiret sret;
-
-	if (!mpxy->shmem_active)
-		return -ENODEV;
-	if (!tx && tx_len)
-		return -EINVAL;
-
-	get_cpu();
-
-	/* Message protocols allowed to have no data in messages */
-	if (tx_len)
-		memcpy(mpxy->shmem, tx, tx_len);
-
-	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_SEND_MSG_WITH_RESP,
-			 channel_id, msg_id, tx_len, 0, 0, 0);
-	if (rx && !sret.error) {
-		rx_bytes = sret.value;
-		if (rx_bytes > max_rx_len) {
-			put_cpu();
-			return -ENOSPC;
-		}
-
-		memcpy(rx, mpxy->shmem, rx_bytes);
-		if (rx_len)
-			*rx_len = rx_bytes;
-	}
-
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
-}
-
-static int mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
-					  void *tx, unsigned long tx_len)
-{
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
-	struct sbiret sret;
-
-	if (!mpxy->shmem_active)
-		return -ENODEV;
-	if (!tx && tx_len)
-		return -EINVAL;
-
-	get_cpu();
-
-	/* Message protocols allowed to have no data in messages */
-	if (tx_len)
-		memcpy(mpxy->shmem, tx, tx_len);
-
-	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_SEND_MSG_WITHOUT_RESP,
-			 channel_id, msg_id, tx_len, 0, 0, 0);
-
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
-}
-
-static int mpxy_get_notifications(u32 channel_id,
-				  struct sbi_mpxy_notification_data *notif_data,
-				  unsigned long *events_data_len)
-{
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
-	struct sbiret sret;
-
-	if (!mpxy->shmem_active)
-		return -ENODEV;
-	if (!notif_data || !events_data_len)
-		return -EINVAL;
-
-	get_cpu();
-
-	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS,
-			 channel_id, 0, 0, 0, 0, 0);
-	if (sret.error)
-		goto err_put_cpu;
-	if (sret.value < 0 || mpxy_shmem_size < sizeof(*notif_data) ||
-	    sret.value > mpxy_shmem_size - sizeof(*notif_data)) {
-		put_cpu();
-		return -EOVERFLOW;
-	}
-
-	memcpy(notif_data, mpxy->shmem, sret.value + sizeof(*notif_data));
-	*events_data_len = sret.value;
-
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
-}
-
-static int mpxy_get_shmem_size(unsigned long *shmem_size)
-{
-	struct sbiret sret;
-
-	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_SHMEM_SIZE,
-			 0, 0, 0, 0, 0, 0);
-	if (sret.error)
-		return sbi_err_map_linux_errno(sret.error);
-	if (shmem_size)
-		*shmem_size = sret.value;
-	return 0;
-}
-
-static int mpxy_setup_shmem(unsigned int cpu)
-{
-	struct page *shmem_page;
-	struct mpxy_local *mpxy;
-	struct sbiret sret;
-
-	mpxy = per_cpu_ptr(&mpxy_local, cpu);
-	if (mpxy->shmem_active)
-		return 0;
-
-	shmem_page = alloc_pages(GFP_KERNEL | __GFP_ZERO, get_order(mpxy_shmem_size));
-	if (!shmem_page)
-		return -ENOMEM;
-
-	/*
-	 * Linux setup of shmem is done in mpxy OVERWRITE mode.
-	 * flags[1:0] = 00b
-	 */
-	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_SET_SHMEM,
-			 page_to_phys(shmem_page), 0, 0, 0, 0, 0);
-	if (sret.error) {
-		free_pages((unsigned long)page_to_virt(shmem_page),
-			   get_order(mpxy_shmem_size));
-		return sbi_err_map_linux_errno(sret.error);
-	}
-
-	mpxy->shmem = page_to_virt(shmem_page);
-	mpxy->shmem_phys_addr = page_to_phys(shmem_page);
-	mpxy->shmem_active = true;
-
-	return 0;
-}
-
 /* ====== MPXY mailbox data structures ====== */
 
 /* MPXY mailbox channel */
@@ -447,13 +157,13 @@ static void mpxy_mbox_send_rpmi_data(struct mpxy_mbox_channel *mchan,
 			msg->error = -EIO;
 			break;
 		}
-		msg->error = mpxy_send_message_with_resp(mchan->channel_id,
-							 msg->data.service_id,
-							 msg->data.request,
-							 msg->data.request_len,
-							 msg->data.response,
-							 msg->data.max_response_len,
-							 &msg->data.out_response_len);
+		msg->error = sbi_mpxy_send_message_with_resp(mchan->channel_id,
+							     msg->data.service_id,
+							     msg->data.request,
+							     msg->data.request_len,
+							     msg->data.response,
+							     msg->data.max_response_len,
+							     &msg->data.out_response_len);
 		break;
 	case RPMI_MBOX_MSG_TYPE_SEND_WITHOUT_RESPONSE:
 		if ((!msg->data.request && msg->data.request_len) ||
@@ -465,10 +175,10 @@ static void mpxy_mbox_send_rpmi_data(struct mpxy_mbox_channel *mchan,
 			msg->error = -EIO;
 			break;
 		}
-		msg->error = mpxy_send_message_without_resp(mchan->channel_id,
-							    msg->data.service_id,
-							    msg->data.request,
-							    msg->data.request_len);
+		msg->error = sbi_mpxy_send_message_without_resp(mchan->channel_id,
+								msg->data.service_id,
+								msg->data.request,
+								msg->data.request_len);
 		break;
 	default:
 		msg->error = -EOPNOTSUPP;
@@ -504,10 +214,10 @@ static void mpxy_mbox_peek_rpmi_data(struct mbox_chan *chan,
 
 static int mpxy_mbox_read_rpmi_attrs(struct mpxy_mbox_channel *mchan)
 {
-	return mpxy_read_attrs(mchan->channel_id,
-			       SBI_MPXY_ATTR_MSGPROTO_ATTR_START,
-			       sizeof(mchan->rpmi_attrs) / sizeof(u32),
-			       (u32 *)&mchan->rpmi_attrs);
+	return sbi_mpxy_read_attrs(mchan->channel_id,
+				   SBI_MPXY_ATTR_MSGPROTO_ATTR_START,
+				   sizeof(mchan->rpmi_attrs) / sizeof(u32),
+				   (u32 *)&mchan->rpmi_attrs);
 }
 
 /* ====== MPXY mailbox callbacks ====== */
@@ -536,7 +246,7 @@ static bool mpxy_mbox_peek_data(struct mbox_chan *chan)
 		return false;
 
 	do {
-		rc = mpxy_get_notifications(mchan->channel_id, notif, &data_len);
+		rc = sbi_mpxy_get_notifications(mchan->channel_id, notif, &data_len);
 		if (rc || !data_len)
 			break;
 
@@ -580,8 +290,8 @@ static int mpxy_mbox_setup_msi(struct mbox_chan *chan,
 
 	/* Enable channel MSI control */
 	mchan->attrs.msi_control = 1;
-	rc = mpxy_write_attrs(mchan->channel_id, SBI_MPXY_ATTR_MSI_CONTROL,
-			      1, &mchan->attrs.msi_control);
+	rc = sbi_mpxy_write_attrs(mchan->channel_id, SBI_MPXY_ATTR_MSI_CONTROL,
+				  1, &mchan->attrs.msi_control);
 	if (rc) {
 		dev_err(dev, "enable MSI control failed for MPXY channel 0x%x\n",
 			mchan->channel_id);
@@ -609,8 +319,8 @@ static void mpxy_mbox_cleanup_msi(struct mbox_chan *chan,
 
 	/* Disable channel MSI control */
 	mchan->attrs.msi_control = 0;
-	rc = mpxy_write_attrs(mchan->channel_id, SBI_MPXY_ATTR_MSI_CONTROL,
-			      1, &mchan->attrs.msi_control);
+	rc = sbi_mpxy_write_attrs(mchan->channel_id, SBI_MPXY_ATTR_MSI_CONTROL,
+				  1, &mchan->attrs.msi_control);
 	if (rc) {
 		dev_err(dev, "disable MSI control failed for MPXY channel 0x%x\n",
 			mchan->channel_id);
@@ -635,8 +345,8 @@ static int mpxy_mbox_setup_events(struct mpxy_mbox_channel *mchan)
 
 	/* Enable channel events state */
 	mchan->attrs.events_state_ctrl = 1;
-	rc = mpxy_write_attrs(mchan->channel_id, SBI_MPXY_ATTR_EVENTS_STATE_CONTROL,
-			      1, &mchan->attrs.events_state_ctrl);
+	rc = sbi_mpxy_write_attrs(mchan->channel_id, SBI_MPXY_ATTR_EVENTS_STATE_CONTROL,
+				  1, &mchan->attrs.events_state_ctrl);
 	if (rc) {
 		dev_err(dev, "enable events state failed for MPXY channel 0x%x\n",
 			mchan->channel_id);
@@ -662,8 +372,8 @@ static void mpxy_mbox_cleanup_events(struct mpxy_mbox_channel *mchan)
 
 	/* Disable channel events state */
 	mchan->attrs.events_state_ctrl = 0;
-	rc = mpxy_write_attrs(mchan->channel_id, SBI_MPXY_ATTR_EVENTS_STATE_CONTROL,
-			      1, &mchan->attrs.events_state_ctrl);
+	rc = sbi_mpxy_write_attrs(mchan->channel_id, SBI_MPXY_ATTR_EVENTS_STATE_CONTROL,
+				  1, &mchan->attrs.events_state_ctrl);
 	if (rc)
 		dev_err(dev, "disable events state failed for MPXY channel 0x%x\n",
 			mchan->channel_id);
@@ -741,8 +451,8 @@ static void mpxy_mbox_msi_write(struct msi_desc *desc, struct msi_msg *msg)
 	minfo->msi_addr_hi = msg->address_hi;
 	minfo->msi_data = msg->data;
 
-	rc = mpxy_write_attrs(mchan->channel_id, SBI_MPXY_ATTR_MSI_ADDR_LO,
-			      sizeof(*minfo) / sizeof(u32), (u32 *)minfo);
+	rc = sbi_mpxy_write_attrs(mchan->channel_id, SBI_MPXY_ATTR_MSI_ADDR_LO,
+				  sizeof(*minfo) / sizeof(u32), (u32 *)minfo);
 	if (rc) {
 		dev_warn(dev, "failed to write MSI info for MPXY channel 0x%x\n",
 			 mchan->channel_id);
@@ -776,7 +486,7 @@ static int mpxy_mbox_populate_channels(struct mpxy_mbox *mbox)
 	int rc;
 
 	/* Find-out of number of channels */
-	rc = mpxy_get_channel_count(&mbox->channel_count);
+	rc = sbi_mpxy_get_channel_count(&mbox->channel_count);
 	if (rc)
 		return dev_err_probe(mbox->dev, rc, "failed to get number of MPXY channels\n");
 	if (!mbox->channel_count)
@@ -786,7 +496,7 @@ static int mpxy_mbox_populate_channels(struct mpxy_mbox *mbox)
 	channel_ids = kzalloc_objs(*channel_ids, mbox->channel_count);
 	if (!channel_ids)
 		return -ENOMEM;
-	rc = mpxy_get_channel_ids(mbox->channel_count, channel_ids);
+	rc = sbi_mpxy_get_channel_ids(mbox->channel_count, channel_ids);
 	if (rc)
 		return dev_err_probe(mbox->dev, rc, "failed to get MPXY channel IDs\n");
 
@@ -800,9 +510,9 @@ static int mpxy_mbox_populate_channels(struct mpxy_mbox *mbox)
 		mchan->mbox = mbox;
 		mchan->channel_id = channel_ids[i];
 
-		rc = mpxy_read_attrs(mchan->channel_id, SBI_MPXY_ATTR_MSG_PROT_ID,
-				     sizeof(mchan->attrs) / sizeof(u32),
-				     (u32 *)&mchan->attrs);
+		rc = sbi_mpxy_read_attrs(mchan->channel_id, SBI_MPXY_ATTR_MSG_PROT_ID,
+					 sizeof(mchan->attrs) / sizeof(u32),
+					 (u32 *)&mchan->attrs);
 		if (rc) {
 			return dev_err_probe(mbox->dev, rc,
 					     "MPXY channel 0x%x read attrs failed\n",
@@ -818,11 +528,11 @@ static int mpxy_mbox_populate_channels(struct mpxy_mbox *mbox)
 			}
 		}
 
-		mchan->notif = devm_kzalloc(mbox->dev, mpxy_shmem_size, GFP_KERNEL);
+		mchan->notif = devm_kzalloc(mbox->dev, sbi_mpxy_shmem_size(), GFP_KERNEL);
 		if (!mchan->notif)
 			return -ENOMEM;
 
-		mchan->max_xfer_len = min(mpxy_shmem_size, mchan->attrs.msg_max_len);
+		mchan->max_xfer_len = min(sbi_mpxy_shmem_size(), mchan->attrs.msg_max_len);
 
 		if ((mchan->attrs.capability & SBI_MPXY_CHAN_CAP_GET_NOTIFICATIONS) &&
 		    (mchan->attrs.capability & SBI_MPXY_CHAN_CAP_EVENTS_STATE))
@@ -847,40 +557,12 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 	int msi_idx, rc;
 	u32 i;
 
-	/*
-	 * Initialize MPXY shared memory only once. This also ensures
-	 * that SBI MPXY mailbox is probed only once.
-	 */
-	if (mpxy_shmem_init_done) {
-		dev_err(dev, "SBI MPXY mailbox already initialized\n");
-		return -EALREADY;
-	}
-
 	/* Probe for SBI MPXY extension */
-	if (sbi_spec_version < sbi_mk_version(1, 0) ||
-	    sbi_probe_extension(SBI_EXT_MPXY) <= 0) {
+	if (!sbi_mpxy_shmem_size()) {
 		dev_info(dev, "SBI MPXY extension not available\n");
 		return -ENODEV;
 	}
 
-	/* Find-out shared memory size */
-	rc = mpxy_get_shmem_size(&mpxy_shmem_size);
-	if (rc)
-		return dev_err_probe(dev, rc, "failed to get MPXY shared memory size\n");
-
-	/*
-	 * Setup MPXY shared memory on each CPU
-	 *
-	 * Note: Don't cleanup MPXY shared memory upon CPU power-down
-	 * because the RPMI System MSI irqchip driver needs it to be
-	 * available when migrating IRQs in CPU power-down path.
-	 */
-	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/sbi-mpxy-shmem",
-			  mpxy_setup_shmem, NULL);
-
-	/* Mark as MPXY shared memory initialization done */
-	mpxy_shmem_init_done = true;
-
 	/* Allocate mailbox instance */
 	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
 	if (!mbox)
-- 
2.43.0

