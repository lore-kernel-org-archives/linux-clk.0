Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF1536E48B;
	Wed, 30 Sep 2026 15:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780817; cv=none; b=IKcKALrhkdJtvV/kAKgqSw5GBpNxnNzDaoPKAH1yZdQ/T/Biciz5B0H4q3ejQv2E2pS4ToV7nWs1i2NSnqz+5FW11gG3NuZfh0wJ/C8J+MFNMDEC6OjwaZ3GlxoRzKW4mk5h2hRcRUOLR0I10SgTHe/SkDhIGjoPEpNVIhjIdqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780817; c=relaxed/simple;
	bh=EDP8zN6bSiMPGl5DLcamQmvJXb+Q646G7fC9Y+W99Fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dale0Iogn8ZqelPMfpCcnSZ4PTdaVltSN1s0WMiTRWRqPuMaGLAvf/vjamADbUbNnv8uAJr1aaYIIqnYIz3x0sP31ecdik5CE7ZIZql6u5NVXedWVVPFPnR6GvqcW+qqSOqgWiB4xmSPs6K6aqEZIiFDd5c3Es4Y+qtJ559Yl6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=npri/rJM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="npri/rJM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE0CZ83283843;
	Wed, 30 Sep 2026 15:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FHZfms6o5nC
	KnfQH/x39bm+Ap7XWn4YKrMCndSdE08s=; b=npri/rJMSA5BeZ/lg1Y7QXZ74TR
	Ey56YIEXNj9ghTtp3gZkiQMQHtX4qv+C1SG3bmA3E4a2bFWm1fWjC9Tomyu5Obrx
	uxs5pS8OCjBSTmWPHZo2tbL78RK/CRBk6hy8sPm9RgpkGeu62McTQyFQRxr4Oa8G
	N1crSTfTxwuCJIIrFcjw/mP8AyiM0LZw2wS/oMlTOlbAIfRJqLv2FHzavzZ6ZIul
	QVNc7tEyvSdEtEMiBwjm8mzSfDAPXn6EDyTKBZ+yeO84eW4XRiIWuNUpnIPNFpK+
	YlexRN2ODl99hzSOkc59A9mEUBkulRfHi6pt8MpUdB3F7f3zqlfb3aWUYWw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0tkn2w5e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 15:06:23 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68UF2K3K1902881;
	Wed, 30 Sep 2026 15:02:20 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 68UF2JRI1902839
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 15:02:20 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 4D027248ED; Wed, 30 Sep 2026 20:32:19 +0530 (+0530)
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
Subject: [PATCH 3/4] mailbox: add direct synchronous send support
Date: Wed, 30 Sep 2026 20:32:12 +0530
Message-ID: <20260930150213.799245-4-anup.patel@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=CKy/zhrD c=1 sm=1 tr=0 ts=6abd2570 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=Rc0M7loQF3ww-NHgSoYA:9
X-Proofpoint-ORIG-GUID: pqFsxjs7q-Ca9wbLkrfJn2eH_Fz0prZw
X-Proofpoint-GUID: As7QxTdF35noUa5xdaTGgZW6pe1ybkB-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2MCBTYWx0ZWRfX1doe7+rRA/BW
 R538p1R9wgU13ZfTOSCPVdKDliF5UqgI670BRW2qBzIF3x9fTvN4Mj7k+AmyFU+FfXUvWkW6yw0
 RBMVMzEcNDxMc+DNk1vvhVOKCpWtJhJqReC3qX1RuDqFx6jPmdhYtwCNgkMPNW7L7r8et0jcXZ7
 q+W4G7w3Rgz2Q3+/EWEGPVmphnrcz6qxZTZCHm3CfRbRyvegEae5smgr/5mxWpcTi8+FOjjXkHB
 OnxopsUs/jysf6hpez5ZW1uPLoZG/Ilv9SMpNmzUW8xmkdER+h+NNqo55uZfmG510hEfbJTt0u7
 +W7qEE8EtWNX++yABGcQhqDQ7uQrgvWml2hHrpnl6yi5pdy3VgBXdb0Lftr7WmKkCQfjtrQfbeh
 VGIhVUAmyj+jZt1R/z0wQyf+s+uINXpjXVkJd/vO0/WwdhpB7xN9FK0JhX7MCbrytAWIwgx3HUD
 IGHHANqNzOAa2T82f2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2MCBTYWx0ZWRfX6AiKgGO2ieWP
 9dd5wabScbNmNkKJWaojWTVlSqYWLI5OyqpsPPTqrpk/WdrNJUfGfxTSgIQkmpzMZkom5oDVMNv
 sRh91oQO9aCUgECD35VshIinqgkbe+s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300060

From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Some mailbox controllers can complete a transaction entirely within
the calling context, without going through the queued TX state
machine or a TX-done interrupt. Add a synchronous send path so their
clients can request one and wait for the result directly.

Controllers advertise support via the new send_data_sync() op and
clients opt in by setting tx_sync when requesting the channel.

Channels bound this way must not call mbox_chan_txdone() or
mbox_client_txdone(), and mbox_send_message() and mbox_flush() now
reject them, since only mbox_send_message_sync() is a valid
transmit path. The client remains responsible for serializing calls
to mbox_send_message_sync() against mbox_free_channel().

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 drivers/mailbox/mailbox.c          | 72 +++++++++++++++++++++++++++++-
 include/linux/mailbox_client.h     |  3 ++
 include/linux/mailbox_controller.h | 10 +++++
 3 files changed, 83 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index efacd24a085d..c640b19de608 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -166,6 +166,12 @@ EXPORT_SYMBOL_GPL(mbox_chan_received_data);
  */
 void mbox_chan_txdone(struct mbox_chan *chan, int r)
 {
+	if (unlikely(chan->txdone_method & MBOX_TXDONE_BY_RETURN)) {
+		dev_err(chan->mbox->dev,
+			"TX-done notification on direct synchronous channel\n");
+		return;
+	}
+
 	if (unlikely(!(chan->txdone_method & MBOX_TXDONE_BY_IRQ))) {
 		dev_err(chan->mbox->dev,
 		       "Controller can't run the TX ticker\n");
@@ -187,6 +193,12 @@ EXPORT_SYMBOL_GPL(mbox_chan_txdone);
  */
 void mbox_client_txdone(struct mbox_chan *chan, int r)
 {
+	if (unlikely(chan->txdone_method & MBOX_TXDONE_BY_RETURN)) {
+		dev_err(chan->mbox->dev,
+			"TX-done notification on direct synchronous channel\n");
+		return;
+	}
+
 	if (unlikely(!(chan->txdone_method & MBOX_TXDONE_BY_ACK))) {
 		dev_err(chan->mbox->dev, "Client can't run the TX ticker\n");
 		return;
@@ -278,6 +290,9 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 	if (!chan || !chan->cl || mssg == MBOX_NO_MSG)
 		return -EINVAL;
 
+	if (chan->txdone_method & MBOX_TXDONE_BY_RETURN)
+		return -EOPNOTSUPP;
+
 	t = add_to_rbuf(chan, mssg);
 	if (t < 0) {
 		dev_err(chan->mbox->dev, "Try increasing MBOX_TX_QUEUE_LEN\n");
@@ -308,6 +323,43 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 }
 EXPORT_SYMBOL_GPL(mbox_send_message);
 
+/**
+ * mbox_send_message_sync - Send data and wait for transaction completion
+ * @chan: Mailbox channel assigned to this client
+ * @mssg: Client specific message typecasted
+ *
+ * For a channel bound with tx_sync, ask the controller to transmit @mssg and
+ * only return on completion. This function may sleep and must not be called
+ * from atomic context. @mssg must remain valid until this function returns.
+ *
+ * The direct synchronous path does not queue @mssg, does not use active_req,
+ * and does not use a TX-done notification. The client must serialize this
+ * function against mbox_free_channel().
+ *
+ * Return: 0 on success or a negative error code.
+ */
+int mbox_send_message_sync(struct mbox_chan *chan, void *mssg)
+{
+	int ret;
+
+	if (!chan || !chan->cl || mssg == MBOX_NO_MSG)
+		return -EINVAL;
+
+	if (!(chan->txdone_method & MBOX_TXDONE_BY_RETURN))
+		return -EOPNOTSUPP;
+
+	if (chan->cl->tx_prepare)
+		chan->cl->tx_prepare(chan->cl, mssg);
+	/* Try to submit a message to the MBOX controller synchonously */
+	ret = chan->mbox->ops->send_data_sync(chan, mssg);
+
+	if (chan->cl->tx_done)
+		chan->cl->tx_done(chan->cl, mssg, ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mbox_send_message_sync);
+
 /**
  * mbox_flush - flush a mailbox channel
  * @chan: mailbox channel to flush
@@ -326,8 +378,11 @@ int mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 {
 	int ret;
 
+	if (chan->txdone_method & MBOX_TXDONE_BY_RETURN)
+		return -EOPNOTSUPP;
+
 	if (!chan->mbox->ops->flush)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	ret = chan->mbox->ops->flush(chan, timeout);
 	if (ret < 0)
@@ -343,7 +398,9 @@ static void mbox_clean_and_put_channel(struct mbox_chan *chan)
 	scoped_guard(spinlock_irqsave, &chan->lock) {
 		chan->cl = NULL;
 		chan->active_req = MBOX_NO_MSG;
-		if (chan->txdone_method == MBOX_TXDONE_BY_ACK)
+		if (chan->txdone_method & MBOX_TXDONE_BY_RETURN)
+			chan->txdone_method &= ~MBOX_TXDONE_BY_RETURN;
+		else if (chan->txdone_method == MBOX_TXDONE_BY_ACK)
 			chan->txdone_method = MBOX_TXDONE_BY_POLL;
 	}
 
@@ -355,6 +412,14 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 	struct device *dev = cl->dev;
 	int ret;
 
+	if (cl->tx_sync) {
+		if (!chan->mbox->ops->send_data_sync)
+			return -EOPNOTSUPP;
+
+		if (cl->tx_block || cl->tx_tout || cl->knows_txdone)
+			return -EINVAL;
+	}
+
 	if (chan->cl || !try_module_get(chan->mbox->dev->driver->owner)) {
 		dev_err(dev, "%s: mailbox not free\n", __func__);
 		return -EBUSY;
@@ -380,6 +445,9 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 		}
 	}
 
+	if (cl->tx_sync)
+		chan->txdone_method |= MBOX_TXDONE_BY_RETURN;
+
 	return 0;
 }
 
diff --git a/include/linux/mailbox_client.h b/include/linux/mailbox_client.h
index e5997120f45c..32b1d5ad3bfa 100644
--- a/include/linux/mailbox_client.h
+++ b/include/linux/mailbox_client.h
@@ -21,6 +21,7 @@ struct mbox_chan;
  * @knows_txdone:	If the client could run the TX state machine. Usually
  *			if the client receives some ACK packet for transmission.
  *			Unused if the controller already has TX_Done/RTR IRQ.
+ * @tx_sync:		Bind the channel for mbox_send_message_sync().
  * @rx_callback:	Atomic callback to provide client the data received
  * @tx_prepare: 	Atomic callback to ask client to prepare the payload
  *			before initiating the transmission if required.
@@ -31,6 +32,7 @@ struct mbox_client {
 	bool tx_block;
 	unsigned long tx_tout;
 	bool knows_txdone;
+	bool tx_sync;
 
 	void (*rx_callback)(struct mbox_client *cl, void *mssg);
 	void (*tx_prepare)(struct mbox_client *cl, void *mssg);
@@ -42,6 +44,7 @@ struct mbox_chan *mbox_request_channel_byname(struct mbox_client *cl,
 					      const char *name);
 struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index);
 int mbox_send_message(struct mbox_chan *chan, void *mssg);
+int mbox_send_message_sync(struct mbox_chan *chan, void *mssg);
 int mbox_flush(struct mbox_chan *chan, unsigned long timeout);
 void mbox_client_txdone(struct mbox_chan *chan, int r); /* atomic */
 bool mbox_client_peek_data(struct mbox_chan *chan); /* atomic */
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 26a238a6f941..c7dc098324ef 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -18,6 +18,7 @@ struct mbox_chan;
 #define MBOX_TXDONE_BY_IRQ	BIT(0) /* controller has remote RTR irq */
 #define MBOX_TXDONE_BY_POLL	BIT(1) /* controller can read status of last TX */
 #define MBOX_TXDONE_BY_ACK	BIT(2) /* S/W ACK received by Client ticks the TX */
+#define MBOX_TXDONE_BY_RETURN	BIT(3) /* TX completes by function return */
 
 /**
  * struct mbox_chan_ops - methods to control mailbox channels
@@ -28,6 +29,14 @@ struct mbox_chan;
  *		transmission of data is reported by the controller via
  *		mbox_chan_txdone (if it has some TX ACK irq). It must not
  *		sleep.
+ * @send_data_sync: The API asks the MBOX controller driver, in non-atomic
+ *		context, to transmit a message on the bus and wait for the
+ *		transaction to complete. It returns 0 if the transaction
+ *		completed successfully or a negative error code otherwise.
+ *		The controller must not call mbox_chan_txdone() or
+ *		mbox_client_txdone() for this operation. Concurrent calls for one
+ *		controller must support them, serialize them internally, or
+ *		return -EBUSY for a conflicting transaction.
  * @flush:	Called when a client requests transmissions to be blocking but
  *		the context doesn't allow sleeping. Typically the controller
  *		will implement a busy loop waiting for the data to flush out.
@@ -53,6 +62,7 @@ struct mbox_chan;
  */
 struct mbox_chan_ops {
 	int (*send_data)(struct mbox_chan *chan, void *data);
+	int (*send_data_sync)(struct mbox_chan *chan, void *data);
 	int (*flush)(struct mbox_chan *chan, unsigned long timeout);
 	int (*startup)(struct mbox_chan *chan);
 	void (*shutdown)(struct mbox_chan *chan);
-- 
2.43.0

