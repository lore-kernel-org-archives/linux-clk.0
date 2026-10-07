Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F8D3AB5DE
	for <linux-clk@vger.kernel.org>; Wed,  7 Oct 2026 06:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355863; cv=none; b=EEkQbtxDUkDHGDL/XdTXFK95JVexZy0mbr3WorRJtb2Bljs2/gYKnkLMVd+eoX0ExNJp3D79hZZT65mousbc53k1ElwWrLPDCXz1FzfGjh8BvtCLXAN/5i1O836njoj7bDmY6YzsnMyRqy+GPN0J3zvF0Ba2DIH4PLikcS0SJ/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355863; c=relaxed/simple;
	bh=aqwYlbBZfPmAovG9tQvJQ34ckDn3s8ZtxB+c4NH+OBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=En84qcSvOqK+kxS5Kmg3+TYYkO3PJcUP55p184JcJ34/H4fCz1E7X3gAhdZb+2L3XQQjdngBZjt247+ha97bcFhauVKNQhziJgYWAOGW5Sv6QGNRA+f6I3DPNTIrP0tHWiP8AjYvXUHi92cgHKcpkLugN97snECo9Hu8Fg+szH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ASLcHgRR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cg7pMHTG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ASLcHgRR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cg7pMHTG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974VEbm1897773
	for <linux-clk@vger.kernel.org>; Wed, 7 Oct 2026 06:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	52nzYadmue4RW4uwDkTflPSkr2BZLVWcOLb+4ASjXtk=; b=ASLcHgRRptef5lgR
	RwEp8AqhDOPJ9G3CrS73dkAPuI/kz0Zo1FczV9FCv/HqPaht+22y+lX8CXzxdMlT
	wPMmLVodl1X8GhVMQrofDQnMSMMUiWpX2IRT2ReamK8YQH7KdcUpLt3fEwaTnbur
	y+43ufPhmMEfTu2/sovHUqfkfee1O4Vq1pDUW3OqzvlkZqEFJ9LErV2COifmIRid
	QgzcjWdBNM8FbkXWIbXUsKqqXzi4BX49ZZEQryGCTIrVLv4lo0OLNpn58kcmvAnp
	UiLlTauM232+LsE40rxmMQVvuhpo4yk/SxlkoRlWu6N8f85ZCjdZz/Kej0tCKHOZ
	V1doQw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53ask7xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 07 Oct 2026 06:51:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34d62bb27a1so15786974eec.0
        for <linux-clk@vger.kernel.org>; Tue, 06 Oct 2026 23:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791355860; x=1791960660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52nzYadmue4RW4uwDkTflPSkr2BZLVWcOLb+4ASjXtk=;
        b=Cg7pMHTGZRmYjOcfaEvDUjtUll+SS36QFaU37OndegXk3MxVlM8bSp/EBdHtqwSwWO
         lkr8BF79tVbq4KZmwoZpG2EiwVG7TBhEIh2DTBugaJ6i1/zbI4kJ1whmNXjIc0uGA7eF
         A+Pdloulmyl1xtnFKxjEjEnqYjlPiaSz9wjHFD2ejT3YKeFXYSAArt6kqdB7UTKgxOhV
         04cXgbqRjeHanzTccntmjCCD0JRb7v5/d4tIr80nPARNJ+geKMOKn+TKpVhf4Dno6hSp
         tPTNOougKuNKiA8ILO8IEcFTxIwZZLw58QJQPMSDz8+1vjn+KRpsV9YG8LgpCqNuiz6u
         LcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791355860; x=1791960660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52nzYadmue4RW4uwDkTflPSkr2BZLVWcOLb+4ASjXtk=;
        b=HW151161jNBcmvkcOxnoPztUFlzdH75TLGOuSQqQRjoLAAApslaCL4GdswKfyfw23m
         CQkYmEhQa/5kuaBd+zBuhZJdRDARWvmsXy71H9m5Tmk+oGogXX8g/B+4D7vCajuAoE80
         qx9sai2NA2ys20i+gmkNRP2NDha96n7POk+k8HfAZed9Uvb5bngd6qTZq539sNqwAxyG
         z7vNN9mE/hVc1s0SvKA+lMde2Z5Vvchf8i4DGPmXfZrQ8g6OCIh9VgoEyVNqHKLdHO82
         PEWOplkYcL4lHudXqGF4KUTcrW+EDwJbKKCIQb6eTPr+EZPJL6CDp2KZyWMPE0lb3iXQ
         QC/w==
X-Forwarded-Encrypted: i=1; AKwUvBz0UkFth6O0pGSahMBfwWNMJsYuT1FzYC/+IGmJMcbZruX8T4gSCPcewqG1ho7IJtpRsjJD68eD7us=@vger.kernel.org
X-Gm-Message-State: AFuF++nOU/wOSkp6realu4U9+Fyx5suvTvou0WBKyj/ee6N34wyjrOEy
	W8eiz1daonnKItO+6mQg1HGNL4+9rZaY4muJhBv5VvjHCHsnZeXfewv1QYXT5bqeIQcSxilcgBl
	8Cvn1u1dh0aKZTJAhs+/PiDUd8SpoL+59OxUpl+Y9wgTUXI//V+GHJPia6quudaM=
X-Gm-Gg: AYBFou226aeGgMYpiKJhtgXuP5oKgEQL9oMJdwjbRtvQ390eusqdpmd8Z7CbwOKZn1g
	5jpdq+ME/gU0lxexWDNCL42G327MWCN+HdT7YpuDD78yngtGq0GF+8x24X3V4AXjgXkhgZ6OJGy
	bNR9Xnp9wFQXspWS5Z7L3gKjkYXDIBm+C4hL/sxTkA9Q2GBRmruxnlwmVE+wyq6DgybCU8bwAVk
	Opc7PN2p1+zEksDLhY2+JMMkf2b3XrXDPL+JBMLPZ6tSXkDdpadIHNM/4Cwqt+HpA/1B6vlf32Y
	QnZi8WR4iXTSdwvnyycMdrVQJwZRs9e8+Yh5ULvHbmO6KLdEnQzxmVm6z/WuLoV/AnDToMQ/28p
	u6x4II/i6C3JlarEq63NpVI+Gk30BClfSatDwpNpptwOxRSEYtKTGKwmPI8HmJvTgwIkq1TWnly
	I+zDcyBxHlSIMAr2P1b36WLVOEovP4CUvrSis=
X-Received: by 2002:a05:7022:28d:10b0:144:f47b:58b0 with SMTP id a92af1059eb24-1620ab90a5cmr1315396c88.47.1791355859857;
        Tue, 06 Oct 2026 23:50:59 -0700 (PDT)
X-Received: by 2002:a05:7022:28d:10b0:144:f47b:58b0 with SMTP id a92af1059eb24-1620ab90a5cmr1315366c88.47.1791355859178;
        Tue, 06 Oct 2026 23:50:59 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm7374730c88.2.2026.10.06.23.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:50:58 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 12:20:44 +0530
Subject: [PATCH 1/4] interconnect: icc-clk: support N:1 master-to-slave
 topology
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-ipq9650_apss_clk-v1-1-fd4c2b3cbdea@oss.qualcomm.com>
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
In-Reply-To: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: DawakEkJaJQhH-Ek6PnlDGYlDfDeMGHj
X-Proofpoint-GUID: DawakEkJaJQhH-Ek6PnlDGYlDfDeMGHj
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac5ebd5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Wq9wk9AxASzClJd40FsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyNyBTYWx0ZWRfX8TOpAlpa8Z//
 Z8tuVF7G7gXbQa5mno548ti9ng6Xmony5h5rJ2ilYvCOjgWpY32gO1BKG5aKifYIf2ixc7unFs4
 oDPwv8w1NHpty3ItMITWLEBaxQD0XbgmH1vQJK9wsWtM/DhD2pp1Qc8jl8WwF7xOcmn2TGUZiSQ
 TvR1rV3Btmz/4EavhIGjYWLEVunb1T/ZZWU8VlsqanjwAjZNUFEDYUS0pT7JIFSvSmfXmBSNNGo
 0sggrXrvw5d1jPFONnc9uxyL09BKDZfqEF+GB0STlFUGbc5gCx5+gnd8/9g8LwKY/ykDd3pV3OK
 JP7cZaJt6qlcjidHu6fhStABvaA1g55rej6r6PO801o4OtUMtzlOUJ9qnBbFs0bAf4fBS3LZ7AB
 /MeCzFM5vY9QXv9q0NIZg1L68psTp8CIoKrYpd/9Sw4tthk09queoiOiwIbDGuOhuOP/oMyLv53
 CHrsl/Cet+e/7NzG4ww==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyNyBTYWx0ZWRfX2ReAiyzV9XwZ
 3VXu/Tr5z9kV2VCDBgi6BXycxxG+rgPcFeKHen46+iritIW+fODOoyhySyeTOWtwmqWuZVc/DZ2
 8VL+x1Svyeq4ghRlek5Hh3tUx4OjB0g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070027

icc_clk_register() assumes each icc_clk_data entry describes a unique
master/slave pair and creates both nodes for every entry. When several
masters share the same slave_id, the shared slave node is created and
added again on each later entry. icc_node_create() returns the existing
node, so icc_node_add() hits WARN_ON(node->provider):

  WARNING: drivers/interconnect/core.c:1103 at icc_node_add+0x10c/0x120
  Call trace:
   icc_node_add+0x10c/0x120 (P)
   icc_clk_register+0x1a4/0x214
   devm_icc_clk_register+0x18/0x80
   qcom_cc_really_probe+0x4c8/0x514
   apss_ipq9650_probe+0xc0/0x108

This topology is needed on IPQ9650, where the silver and gold CPU
clusters both vote on the single L3 clock through a shared SLAVE_L3
node.

The onecell table is also filled in registration order, so xlate only
works when the node IDs happen to match that order. Size the table by
the highest node ID, index it by ID, and skip slave creation when the
node is already registered.

icc_clk_set() also passes only the requesting node's bandwidth to
clk_set_rate(), so the last writer wins. A low vote from one master can
then lower the clock below what another master asked for. Before setting
the rate, take the highest peak bandwidth across all nodes that share
the clock.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/interconnect/icc-clk.c | 45 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/interconnect/icc-clk.c b/drivers/interconnect/icc-clk.c
index 93c030608d3e..567d071fade8 100644
--- a/drivers/interconnect/icc-clk.c
+++ b/drivers/interconnect/icc-clk.c
@@ -24,7 +24,10 @@ struct icc_clk_provider {
 
 static int icc_clk_set(struct icc_node *src, struct icc_node *dst)
 {
+	unsigned long rate = icc_units_to_bps(src->peak_bw);
+	struct icc_provider *provider = src->provider;
 	struct icc_clk_node *qn = src->data;
+	struct icc_node *node;
 	int ret;
 
 	if (!qn || !qn->clk)
@@ -45,7 +48,21 @@ static int icc_clk_set(struct icc_node *src, struct icc_node *dst)
 		qn->enabled = true;
 	}
 
-	return clk_set_rate(qn->clk, icc_units_to_bps(src->peak_bw));
+	/*
+	 * Multiple master nodes can share the same underlying clock (N:1
+	 * topology, e.g. several CPU clusters voting on one L3 clock).
+	 * Aggregate the peak bandwidth across all of them before setting
+	 * the rate, otherwise the last caller wins and can undervote what
+	 * another master already asked for.
+	 */
+	list_for_each_entry(node, &provider->nodes, node_list) {
+		struct icc_clk_node *n = node->data;
+
+		if (n && clk_is_match(n->clk, qn->clk))
+			rate = max(rate, icc_units_to_bps(node->peak_bw));
+	}
+
+	return clk_set_rate(qn->clk, rate);
 }
 
 static int icc_clk_get_bw(struct icc_node *node, u32 *avg, u32 *peak)
@@ -82,12 +99,17 @@ struct icc_provider *icc_clk_register(struct device *dev,
 	struct icc_provider *provider;
 	struct icc_onecell_data *onecell;
 	struct icc_node *node;
-	int ret, i, j;
+	unsigned int max_id = 0;
+	int ret, i;
 
-	onecell = devm_kzalloc(dev, struct_size(onecell, nodes, 2 * num_clocks), GFP_KERNEL);
+	/* Find the highest node ID to size the xlate lookup table */
+	for (i = 0; i < num_clocks; i++)
+		max_id = max(max_id, max(data[i].master_id, data[i].slave_id));
+
+	onecell = devm_kzalloc(dev, struct_size(onecell, nodes, max_id + 1), GFP_KERNEL);
 	if (!onecell)
 		return ERR_PTR(-ENOMEM);
-	onecell->num_nodes = 2 * num_clocks;
+	onecell->num_nodes = max_id + 1;
 
 	qp = devm_kzalloc(dev, struct_size(qp, clocks, num_clocks), GFP_KERNEL);
 	if (!qp)
@@ -106,7 +128,7 @@ struct icc_provider *icc_clk_register(struct device *dev,
 
 	icc_provider_init(provider);
 
-	for (i = 0, j = 0; i < num_clocks; i++) {
+	for (i = 0; i < num_clocks; i++) {
 		qp->clocks[i].clk = data[i].clk;
 
 		node = icc_node_create(first_id + data[i].master_id);
@@ -126,7 +148,16 @@ struct icc_provider *icc_clk_register(struct device *dev,
 		icc_node_add(node, provider);
 		/* link to the next node, slave */
 		icc_link_create(node, first_id + data[i].slave_id);
-		onecell->nodes[j++] = node;
+		onecell->nodes[data[i].master_id] = node;
+
+		/*
+		 * Slave node may already be registered by an earlier
+		 * master in an N:1 topology (multiple masters sharing
+		 * the same slave, e.g. several CPU clusters voting on
+		 * one L3 clock).
+		 */
+		if (onecell->nodes[data[i].slave_id])
+			continue;
 
 		node = icc_node_create(first_id + data[i].slave_id);
 		if (IS_ERR(node)) {
@@ -143,7 +174,7 @@ struct icc_provider *icc_clk_register(struct device *dev,
 
 		/* no data for slave node */
 		icc_node_add(node, provider);
-		onecell->nodes[j++] = node;
+		onecell->nodes[data[i].slave_id] = node;
 	}
 
 	ret = icc_provider_register(provider);

-- 
2.34.1

