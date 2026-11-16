Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801679;
	b=MVJ3VKOxtpCn83ayTKBdJtIX1XnawZuXDtek0/2vAcqT5lVvJf3K1m4cWHwQoy5/z1IS
	 JnxrnAqfzxjn2PDRLfBkf2LifE6wOAR4trpGG3UQiFFDH6LIMOnXA2xdppb1OOSL1spGk
	 ragJw+whoImzg5idptkRW5NzB778roHKrBUZ0AL/BoTlIL9KGYRcXZnoa+cc0qUW/Icfh
	 VduNp/gOPI4K0ba7PpoqDRFoOTOmp7Wg3QPHxv4Zecwa76nWuGOskM1xEzYAMRL/TURv+
	 9EhdbaGNxYBD4j+cWmiosrm+rpL7GSWh6OuHqqkD5vMMoiKxgM3kQYRennQwuOtBFVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801679;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9yZA31c6btJKHGa/2C7MvHZcaBkdtSd+1XmCiJ1/H74=;
	b=NEXwbepULjKjkClvIvTrAdQPavhfLrXMArlkdMxtzo8Upd92EAsSLUdLed7C+DmWFBQ0
	 hx5xm5h+kKZWpDCXlgQB3+d8+ma3y1lOVIC+syw6bx5/72gK7OYnpnkxnseZjn2Wigewl
	 nUvEZKusUWE2h+gkV9OuXniHkDXvLrIEoadVGaFJq8Vpe9EUjLtx/kQqlqb9tzkHiqyxF
	 7om9JFssTlx1gQQAXl/Hyks/yUlyhMQk1PkWHRyQan0j7Sn3PzEH+R/KFpTju34yHxOSS
	 Gdu9mvmU+qFHXpiKuhtb/YgiiJoPJVd2FCkaZ2m/92p/NPUlyOLVdkV0AIsNQ3/92jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=erhYJyUy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF977606A8B1;
	Mon, 16 Nov 2026 04:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF977606A8B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=erhYJyUy
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1LNus801061;
	Mon, 16 Nov 2026 04:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9yZA31c6btJ
	KHGa/2C7MvHZcaBkdtSd+1XmCiJ1/H74=; b=erhYJyUy0UgLYGjnW5bMxe/9fVP
	P1mzWYDDWHOrM9KXZZbhCuFgauvh7zwTMSY+fRpK+edLbISNsjd5JFiF1vEnSbAH
	Thw1sNZPgw6hPm+726zi+NeZp9C3oi45tlio3oF3XqIFAQu5kE7urza5pUTtVBL9
	Zd0OnO6+KBW40ZLBx6f2jdeMZ4yYOcvOIJ4xigIxT6BRS4M3I3yo2/ECGU7Jekgc
	mdX4m1IUXmURe5P+IdH2J6DgXvxmpQhr26cjgCHA4BzevhIjsS2dqx2onh1K3oB8
	yzBAJ0Y+hf9ukPCOFtvOxITMPFIh30xJueLc7GzZazbZLDedtp+cNCldifA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmamk4q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 04:00:59 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG40qrt4139936;
	Mon, 16 Nov 2026 04:00:52 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AG40qfL4139926
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 04:00:52 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 0344C24923; Mon, 16 Nov 2026 09:30:51 +0530 (+0530)
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
Subject: [PATCH v2 5/5] mailbox: convert RISC-V SBI MPXY to direct transmit
Date: Mon, 16 Nov 2026 09:30:49 +0530
Message-ID: <20261116040049.1795610-6-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116040049.1795610-1-anup.patel@oss.qualcomm.com>
References: <20261116040049.1795610-1-anup.patel@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: qzZIfUc9zSkMuZ4G_NThXejjZjBEMzJX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxNSBTYWx0ZWRfX4veVtyWJRy7e
 daOkv2cW3fg2Ox8ENwlzjVkNFWBZFyA+1OB29LD9XuNztXqxcQdl4jqMq/xVLMxgCuNQgwrVfab
 vQ6Xcye72lovn6PhLpzUaHlAkKc3dfM7T2o8DSTrYRsyqV66SrurGHmKwrbwbX+DWpnMnfAYVBq
 iH7XVJ/8j2k60TmK4zZ/XF1/AZU6OM3CEh8DVMjqAC3K/SWB6SmOs3weuL3CLFysKm3+p/Vh45U
 MQd5M0z2S8txwF5H1xE1DNJ88bR39Y2stdZA3VpNDgwk4fQLZ5qlHcBGlNnvGxRxBuO/cED0o1L
 rOF+ODxn+XsIQRi55x29CSi5OGBdgk9vMjpIju/asBPoeal6KG5Et6Umi6H/qrbnZh84fwZTNYO
 F8CQqcgWfZ1iiJpa/x0M6yYi9LHdgfSahMprh1jPbG2cfpvjsMEVT72RzoYozPLcfOlpwPA8+l2
 XvPLW3+QhwSKYeUNI9w==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6afa7ffb cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=z8VkCD2X2rSe2i7w94AA:9
X-Proofpoint-GUID: qzZIfUc9zSkMuZ4G_NThXejjZjBEMzJX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxNSBTYWx0ZWRfX6K0rQDBd+8/6
 Km0NqsWOABXKtuin6NhDgUWqlgSj6tKnXEZ3rC63+CByUzcNiTcOzhTZYrI0ODjrTANCmH8CiSp
 5da+AFMgikFwCfA/BfqtkcKUEEJR/xg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160015

From: Jassi Brar <jassisinghbrar@gmail.com>

The MPXY controller completes RPMI requests synchronously in
the caller's context, and the RPMI clients currently use the
tx_block=false plus knows_txdone retrofit.  That retrofit is
tied to the single active_req slot and reports the wrong result
when two CPUs send on the same channel.

Advertise MBOX_CHAN_CAP_SYNC_ATOMIC for RPMI MPXY channels,
implement send_data_sync() returning msg->error. Switch
rpmi_mbox_send_message() to mbox_send_message_sync() and
drop the mbox_client_txdone() side channel and the obsolete
client flags.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Jassi Brar <jassisinghbrar@gmail.com>
---
 drivers/clk/clk-rpmi.c                        |  3 --
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c       |  3 --
 drivers/mailbox/riscv-sbi-mpxy-mbox.c         | 29 +++++++++++++++++--
 .../pmdomain/riscv/riscv-rpmi-device-power.c  |  3 --
 include/linux/mailbox/riscv-rpmi-message.h    | 17 ++++-------
 5 files changed, 33 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/clk-rpmi.c b/drivers/clk/clk-rpmi.c
index 40c11c373556..32af5b4e4dea 100644
--- a/drivers/clk/clk-rpmi.c
+++ b/drivers/clk/clk-rpmi.c
@@ -526,9 +526,6 @@ static int rpmi_clk_probe(struct platform_device *pdev)
 
 	context->client.dev		= context->dev;
 	context->client.rx_callback	= NULL;
-	context->client.tx_block	= false;
-	context->client.knows_txdone	= true;
-	context->client.tx_tout		= 0;
 
 	context->chan = mbox_request_channel(&context->client, 0);
 	if (IS_ERR(context->chan))
diff --git a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
index 7461d5339ddf..4e76303bd786 100644
--- a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
@@ -223,9 +223,6 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 	/* Setup mailbox client */
 	priv->client.dev		= priv->dev;
 	priv->client.rx_callback	= NULL;
-	priv->client.tx_block		= false;
-	priv->client.knows_txdone	= true;
-	priv->client.tx_tout		= 0;
 
 	/* Request mailbox channel */
 	priv->chan = mbox_request_channel(&priv->client, 0);
diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index 432972195e46..5134a88fa984 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -234,6 +234,24 @@ static int mpxy_mbox_send_data(struct mbox_chan *chan, void *data)
 	return -EOPNOTSUPP;
 }
 
+static int mpxy_mbox_send_data_sync(struct mbox_chan *chan, void *data)
+{
+	struct mpxy_mbox_channel *mchan = chan->con_priv;
+	struct rpmi_mbox_message *msg = data;
+
+	if (mchan->attrs.msg_proto_id != SBI_MPXY_MSGPROTO_RPMI_ID)
+		return -EOPNOTSUPP;
+	if (!msg)
+		return -EINVAL;
+
+	/*
+	 * The MPXY helpers take the per-CPU shared-memory guard and complete
+	 * the SBI call synchronously, so msg->error is this call's result.
+	 */
+	mpxy_mbox_send_rpmi_data(mchan, msg);
+	return msg->error;
+}
+
 static bool mpxy_mbox_peek_data(struct mbox_chan *chan)
 {
 	struct mpxy_mbox_channel *mchan = chan->con_priv;
@@ -424,6 +442,7 @@ static void mpxy_mbox_shutdown(struct mbox_chan *chan)
 
 static const struct mbox_chan_ops mpxy_mbox_ops = {
 	.send_data = mpxy_mbox_send_data,
+	.send_data_sync = mpxy_mbox_send_data_sync,
 	.peek_data = mpxy_mbox_peek_data,
 	.startup = mpxy_mbox_startup,
 	.shutdown = mpxy_mbox_shutdown,
@@ -586,8 +605,14 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 						   mbox->channel_count);
 	if (!mbox->controller.chans)
 		return -ENOMEM;
-	for (i = 0; i < mbox->channel_count; i++)
-		mbox->controller.chans[i].con_priv = &mbox->channels[i];
+	for (i = 0; i < mbox->channel_count; i++) {
+		struct mbox_chan *chan = &mbox->controller.chans[i];
+		struct mpxy_mbox_channel *mchan = &mbox->channels[i];
+
+		chan->con_priv = mchan;
+		if (mchan->attrs.msg_proto_id == SBI_MPXY_MSGPROTO_RPMI_ID)
+			chan->sync_caps = MBOX_CHAN_CAP_SYNC_ATOMIC;
+	}
 
 	/* Setup MSIs for mailbox (if required) */
 	if (mbox->msi_count) {
diff --git a/drivers/pmdomain/riscv/riscv-rpmi-device-power.c b/drivers/pmdomain/riscv/riscv-rpmi-device-power.c
index 86b58ab29ca5..558e3dc0ef5e 100644
--- a/drivers/pmdomain/riscv/riscv-rpmi-device-power.c
+++ b/drivers/pmdomain/riscv/riscv-rpmi-device-power.c
@@ -347,9 +347,6 @@ static int rpmi_pm_domain_probe(struct platform_device *pdev)
 	/* Setup mailbox client */
 	mpxy_ctx->client.dev		= dev;
 	mpxy_ctx->client.rx_callback	= NULL;
-	mpxy_ctx->client.tx_block	= false;
-	mpxy_ctx->client.knows_txdone	= true;
-	mpxy_ctx->client.tx_tout	= 0;
 
 	/* Request mailbox channel */
 	mpxy_ctx->chan = mbox_request_channel(&mpxy_ctx->client, 0);
diff --git a/include/linux/mailbox/riscv-rpmi-message.h b/include/linux/mailbox/riscv-rpmi-message.h
index d5362b5821f9..be7c803292f2 100644
--- a/include/linux/mailbox/riscv-rpmi-message.h
+++ b/include/linux/mailbox/riscv-rpmi-message.h
@@ -238,17 +238,12 @@ static inline void *rpmi_mbox_get_msg_response(struct rpmi_mbox_message *msg)
 static inline int rpmi_mbox_send_message(struct mbox_chan *chan,
 					 struct rpmi_mbox_message *msg)
 {
-	int ret;
-
-	/* Send message for the underlying mailbox channel */
-	ret = mbox_send_message(chan, msg);
-	if (ret < 0)
-		return ret;
-
-	/* Explicitly signal txdone for mailbox channel */
-	ret = msg->error;
-	mbox_client_txdone(chan, ret);
-	return ret;
+	/*
+	 * RPMI mailbox channels complete the request synchronously and return
+	 * the per-call protocol result.  Do not use the queued mailbox state
+	 * machine or its txdone side channel.
+	 */
+	return mbox_send_message_sync(chan, msg);
 }
 
 #endif /* _LINUX_RISCV_RPMI_MESSAGE_H_ */
-- 
2.43.0

