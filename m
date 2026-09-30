Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2CD4C33CC;
	Wed, 30 Sep 2026 15:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781710; cv=none; b=c8lqbF3d4d5fhVPc6pc2s8fr4uL6N6YLSrtRdq4FA6L0WPOZRPF3oOfXgTOSL8Mb2hwwaz2RUS6gl2q93/3P4e2axB5BbezyIPTHZGrmexJM8WWLgjcETqFrzn9xmMAWx85nyRR63vqZhOmX6/aXvN9QzyI/E4/flZ+Z6fBzOjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781710; c=relaxed/simple;
	bh=Ffg6hV0qD6wniRmItNTGUkqF8TMulV6K0vEnsDVUw5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C+VWjFTZ6gIFdskYbaE9YXb83gckB85a/mrsff9GU+CgsTzgYXaO8tDWlyGnUtRr+dJA7ErlKJ02C2BDojcEcZoF31e5HeknIEJ+FcnYPGern0OavtMst+dmkdoJF8QcQjQce9WisF1t1nw/Q5RwJo6lzo1Lc6+qdRpMwtisPFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HSwJjS3u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HSwJjS3u"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxuB63668587;
	Wed, 30 Sep 2026 15:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KoebPdZumrJ
	+t+P7VrpyqkLGk5RloNTpjCXrgw76pzs=; b=HSwJjS3urkpSo94w4FSoKMpz4dW
	GCIAlTV6t54Cpma083bxZe1qCb6yViSEIAaiKS3l7xtN8bPO2G8k1UXudEnNMy7O
	Uu8lDx2YpjO/ND3BJ8RRZLSl5KbrDYLT/72UgmV7lfLqkYExkv4uSfvI/+FnAMMP
	HBWATaABBjqwW+hWI2UCpS5Z7MYCZHyNjnR7zvfK5NEDkrwzEPacT5U0W/wKsSJe
	8EWBS1SYPgrIeAgUw8I/pTgPCilwlRJ5W75GcpQkAduqQZ6QlarTRto2VbmV2jgW
	QH/2vgs1YJ2bCGUfgBZ48sQdogLRgb2bo54oqn/dAc8XinsVfrGj5feMyYg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rj2uj1b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 15:21:22 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68UF2KYH1902864;
	Wed, 30 Sep 2026 15:02:20 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 68UF2Jp91902836
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 15:02:19 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 494B323334; Wed, 30 Sep 2026 20:32:19 +0530 (+0530)
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
Subject: [PATCH 2/4] RISC-V: Factor-out per-hart MPXY shared-memory acquisition
Date: Wed, 30 Sep 2026 20:32:11 +0530
Message-ID: <20260930150213.799245-3-anup.patel@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 9W7OtKleHLC8GrBnER8Pc5XweUARe7Ul
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2MSBTYWx0ZWRfXxepiJYH9Ujwo
 ISTOKrdYtAWT6XL+uBdXLGZPEqV0OGtRIPUCjjPGqIFppqQbqzwGWN3oJ3oFPqzqqHZOFDROgIb
 3Dlouc/LZUdfoxPzCjwBdIzC07MjvAgCyDkjwUY09f3xprKsmDrIbsMMEHKvUsh6Tc/lzcBLZI4
 W5YhFPh4TeGpWbaihZK6vymac8l4mgfsdHd4s9e6Q1JxsNGRq/Bes2mXwN2i4HCNut6gmgwt/7h
 jw1jZpf0rCXV8KcdDmUXir35u8hOw2XJZtUsm6xZS1ib6RAwmzkMSJuqKxPpB8JkQ7TYcYABB4U
 Zula48K3vNipi/dxoD6LdS3OctLOkuxGVGU7z2jUvuDFEHej3oO6COu8eRNBK6QCDRzxgt0lZw4
 Wfs6pis0N3pAfaG+l2ZwYyDCCEpGo/JNYfjF8bSTDdTINnndrsfapWWJFfeV76YUaZ+VMJr1Q6K
 NOr+1PzLnTExhE0NU8Q==
X-Proofpoint-GUID: uv-uKGRPoWwmIh4zDb9dt9ZRppQAT4HO
X-Authority-Analysis: v=2.4 cv=Ypya1IYX c=1 sm=1 tr=0 ts=6abd28f3 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=cr3hh7Z65q3g749AKskA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2MSBTYWx0ZWRfXyVADw42t/u8W
 s1DA3HolzvcODahl4zqmLxRy8PWrZUUILKEExxIhAt48OK7gmtnpTx/DCgXGTu0buR3Z1VrXb14
 kre79ljlID7tLEw+SVb8ECLo8O1QZjw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300061

From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Most of the SBI MPXY functions need to access MPXY shared-memory so
they have to acquire underlying host CPU before accessing the MPXY
shared-memory and release the host CPU after the work is done.

Factor-out the above mentioned per-hart MPXY shared-memory and host
CPU acquisition into mpxy_local_get()/put() functions.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 arch/riscv/kernel/sbi_mpxy.c | 159 ++++++++++++++++++++++-------------
 1 file changed, 100 insertions(+), 59 deletions(-)

diff --git a/arch/riscv/kernel/sbi_mpxy.c b/arch/riscv/kernel/sbi_mpxy.c
index 17a2cee21311..b2b34991fd42 100644
--- a/arch/riscv/kernel/sbi_mpxy.c
+++ b/arch/riscv/kernel/sbi_mpxy.c
@@ -40,6 +40,26 @@ static DEFINE_PER_CPU(struct mpxy_local, mpxy_local);
 static unsigned long mpxy_shmem_size;
 static bool mpxy_shmem_init_done;
 
+static int mpxy_local_get(struct mpxy_local **out)
+{
+	struct mpxy_local *mpxy;
+
+	get_cpu();
+	mpxy = this_cpu_ptr(&mpxy_local);
+	if (!mpxy->shmem_active) {
+		put_cpu();
+		return -ENODEV;
+	}
+
+	*out = mpxy;
+	return 0;
+}
+
+static void mpxy_local_put(void)
+{
+	put_cpu();
+}
+
 unsigned long sbi_mpxy_shmem_size(void)
 {
 	if (!mpxy_shmem_init_done)
@@ -50,53 +70,61 @@ EXPORT_SYMBOL_GPL(sbi_mpxy_shmem_size);
 
 int sbi_mpxy_get_channel_count(u32 *channel_count)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
-	struct sbi_mpxy_channel_ids_data *sdata = mpxy->shmem;
+	struct sbi_mpxy_channel_ids_data *sdata;
+	struct mpxy_local *mpxy;
 	u32 remaining, returned;
 	struct sbiret sret;
+	int rc = 0;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!channel_count)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_local_get(&mpxy);
+	if (rc)
+		return rc;
+	sdata = mpxy->shmem;
 
 	/* Get the remaining and returned fields to calculate total */
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL_IDS,
 			 0, 0, 0, 0, 0, 0);
-	if (sret.error)
-		goto err_put_cpu;
+	if (sret.error) {
+		rc = sbi_err_map_linux_errno(sret.error);
+		goto out;
+	}
 
 	remaining = le32_to_cpu(sdata->remaining);
 	returned = le32_to_cpu(sdata->returned);
 	*channel_count = remaining + returned;
 
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_local_put();
+	return rc;
 }
 EXPORT_SYMBOL_GPL(sbi_mpxy_get_channel_count);
 
 int sbi_mpxy_get_channel_ids(u32 channel_count, u32 *channel_ids)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
-	struct sbi_mpxy_channel_ids_data *sdata = mpxy->shmem;
 	u32 remaining, returned, count, start_index = 0;
+	struct sbi_mpxy_channel_ids_data *sdata;
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
+	int rc = 0;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!channel_count || !channel_ids)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_local_get(&mpxy);
+	if (rc)
+		return rc;
+	sdata = mpxy->shmem;
 
 	do {
 		sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL_IDS,
 				 start_index, 0, 0, 0, 0, 0);
-		if (sret.error)
-			goto err_put_cpu;
+		if (sret.error) {
+			rc = sbi_err_map_linux_errno(sret.error);
+			goto out;
+		}
 
 		remaining = le32_to_cpu(sdata->remaining);
 		returned = le32_to_cpu(sdata->returned);
@@ -107,56 +135,60 @@ int sbi_mpxy_get_channel_ids(u32 channel_count, u32 *channel_ids)
 		start_index += count;
 	} while (remaining && start_index < channel_count);
 
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_local_put();
+	return rc;
 }
 EXPORT_SYMBOL_GPL(sbi_mpxy_get_channel_ids);
 
 int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
 			u32 *attrs_buf)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
+	int rc = 0;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!attr_count || !attrs_buf)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_local_get(&mpxy);
+	if (rc)
+		return rc;
 
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_READ_ATTRS,
 			 channel_id, base_attrid, attr_count, 0, 0, 0);
-	if (sret.error)
-		goto err_put_cpu;
+	if (sret.error) {
+		rc = sbi_err_map_linux_errno(sret.error);
+		goto out;
+	}
 
 	memcpy_from_le32(attrs_buf, (__le32 *)mpxy->shmem, attr_count);
 
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_local_put();
+	return rc;
 }
 EXPORT_SYMBOL_GPL(sbi_mpxy_read_attrs);
 
 int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
 			 u32 *attrs_buf)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
+	int rc = 0;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!attr_count || !attrs_buf)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_local_get(&mpxy);
+	if (rc)
+		return rc;
 
 	memcpy_to_le32((__le32 *)mpxy->shmem, attrs_buf, attr_count);
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_WRITE_ATTRS,
 			 channel_id, base_attrid, attr_count, 0, 0, 0);
 
-	put_cpu();
+	mpxy_local_put();
 	return sbi_err_map_linux_errno(sret.error);
 }
 EXPORT_SYMBOL_GPL(sbi_mpxy_write_attrs);
@@ -166,16 +198,17 @@ int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
 				    void *rx, unsigned long max_rx_len,
 				    unsigned long *rx_len)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	unsigned long rx_bytes;
 	struct sbiret sret;
+	int rc = 0;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!tx && tx_len)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_local_get(&mpxy);
+	if (rc)
+		return rc;
 
 	/* Message protocols allowed to have no data in messages */
 	if (tx_len)
@@ -186,8 +219,8 @@ int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
 	if (rx && !sret.error) {
 		rx_bytes = sret.value;
 		if (rx_bytes > max_rx_len) {
-			put_cpu();
-			return -ENOSPC;
+			rc = -ENOSPC;
+			goto out;
 		}
 
 		memcpy(rx, mpxy->shmem, rx_bytes);
@@ -195,23 +228,26 @@ int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
 			*rx_len = rx_bytes;
 	}
 
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+	rc = sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_local_put();
+	return rc;
 }
 EXPORT_SYMBOL_GPL(sbi_mpxy_send_message_with_resp);
 
 int sbi_mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
 				       void *tx, unsigned long tx_len)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
+	int rc = 0;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!tx && tx_len)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_local_get(&mpxy);
+	if (rc)
+		return rc;
 
 	/* Message protocols allowed to have no data in messages */
 	if (tx_len)
@@ -220,8 +256,9 @@ int sbi_mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_SEND_MSG_WITHOUT_RESP,
 			 channel_id, msg_id, tx_len, 0, 0, 0);
 
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+	rc = sbi_err_map_linux_errno(sret.error);
+	mpxy_local_put();
+	return rc;
 }
 EXPORT_SYMBOL_GPL(sbi_mpxy_send_message_without_resp);
 
@@ -229,32 +266,36 @@ int sbi_mpxy_get_notifications(u32 channel_id,
 			       struct sbi_mpxy_notification_data *notif_data,
 			       unsigned long *events_data_len)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
+	int rc = 0;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!notif_data || !events_data_len)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_local_get(&mpxy);
+	if (rc)
+		return rc;
 
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS,
 			 channel_id, 0, 0, 0, 0, 0);
-	if (sret.error)
-		goto err_put_cpu;
+	if (sret.error) {
+		rc = sbi_err_map_linux_errno(sret.error);
+		goto out;
+	}
 	if (sret.value < 0 || mpxy_shmem_size < sizeof(*notif_data) ||
 	    sret.value > mpxy_shmem_size - sizeof(*notif_data)) {
-		put_cpu();
-		return -EOVERFLOW;
+		rc = -EOVERFLOW;
+		goto out;
 	}
 
 	memcpy(notif_data, mpxy->shmem, sret.value + sizeof(*notif_data));
 	*events_data_len = sret.value;
 
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+	rc = sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_local_put();
+	return rc;
 }
 EXPORT_SYMBOL_GPL(sbi_mpxy_get_notifications);
 
-- 
2.43.0

