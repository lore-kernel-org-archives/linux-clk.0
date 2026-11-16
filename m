Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801671;
	b=jU/t8oGRhb0Jc1jfmEpBoTex8ODzGVA/a6sxYtxawWlUBJePNFpL+7Yre3q7AOBhtWkt
	 pwtC9OGznvHzEYoZZSxJ4xKLWHA7zpaVje0ntfQFtbthGWX6/gSIxDh9Rc8XaVFSiQPJf
	 yICmM32ch4h9K5y+u1uhtKgj9F5JF+UGJ+G2H1dVVIJrdKcGrbL6CsOH6FDrbtKpIHNFz
	 6Q5b2zuYtymt7IXb/Z1lIQlfb0qUgO/afhVp/IuWYg/ObTMny/5TyAwcID9bs3ltsH9BV
	 RXtJxIP7j3jeZ4K9cJ4scF7UMWZ1YHRZ75w24jqTlSkl0xNJkTn8yMKWQ3pX8j54mGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801671;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=F96P+Jy5JpUY/RT00ImzCXg9xo0XZZYVUIrnEdm6pIc=;
	b=FwKdj5QdtbayavJztNxoxaDOMNfW2Al0VEosszL99fR0jDsznUqQ0dZoCnu1gkqlg90j
	 IrbZPXO8eKBeNauPUoZXEA1VgVt/gsPToFnUjv0FzpDMqVihVB4KHH8JQVBftSRhfuqaR
	 XCRbRHeCEtz92gWGzWzoO/TuP6/g7ELe4Km/QSxw7gnxknxJYHibPHp6c2iG/z/ZKl37a
	 XTh3qr1bdQ4smXHJznj9yfqLX8yIIx2jiR8whGhq/CBoNRCyF4GKEZvm597BmuZZQsLkC
	 JdozLzSHH2q+NVd9XDslwVLVGY2H6KKzDlt+6goSa5pwk6Wmh3ILiricc5ToUzWBn+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NyxiFn33;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1F1606A31F;
	Mon, 16 Nov 2026 04:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB1F1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NyxiFn33
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1L0R93890803;
	Mon, 16 Nov 2026 04:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F96P+Jy5JpU
	Y/RT00ImzCXg9xo0XZZYVUIrnEdm6pIc=; b=NyxiFn330X4Rdc6iUcsiZy7Pt/W
	jpww771bayi+2w5vIjEf1nwTK3R0dTE3wIIuxonm5DcIh/VGws8HJx9w30aDmyXO
	s9a1HG07HAPgMS0kIYuH9wYwDzeuma7Sx9yqtEK+6nKWz9AyqT2zjuigWX55nd6E
	au5KLkzdefxObl9pKoKW7jfoabABma3Zj+wi0YLEl+lKwJi868UtPosiDSO/rIum
	R6eSAQPfwZuNz/5/DjinwWnAdwmxYtVGpoj4qjwtaWmA3FANoWTS4xwN6kcY2CMh
	X4ojyaMy4wqOoQjxvSm/hvGVdfzgasaJaeR75R8k++ImLNwURgs2PNQTG3g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqmrka-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 04:00:54 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG40qtH1809013;
	Mon, 16 Nov 2026 04:00:52 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AG40pkQ1808995
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 04:00:51 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id EFB8D248F2; Mon, 16 Nov 2026 09:30:50 +0530 (+0530)
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
Subject: [PATCH v2 3/5] mailbox: add direct synchronous transmit API
Date: Mon, 16 Nov 2026 09:30:47 +0530
Message-ID: <20261116040049.1795610-4-anup.patel@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6afa7ff6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=nKEBvsoTdOMN9E_m02oA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxNSBTYWx0ZWRfX58IE3W+Et3b+
 z3osA3UhWwhqyh4vZMiSNnqhYvJsP1xcOQxfQajV8a003Dxp58ToH/3wNN4c4c0zUv8zlfQ9HDg
 wydcycTfEKj1cRFT/fpIP2Bq6Yrxj+A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxNSBTYWx0ZWRfX8Zx1KfCwmZmC
 /KISuiw4Xkl3SqjQ1ZlwtqjS8GTN6Luti/Vhb310SxX9f9OYA47pRb5lj3ppUZbD5JtqZeqBvs4
 Vn3Pr7tijLmdhVHW9OemKsFCRVrz7qRNx1CpfyMQE5MMyz01LLd+pesq0CrPBLxFFr3MVTCTAhv
 dogf0N1TaW6OidWYYpNOZAMtW4JsGgc/cNx+zleIA4Md2w1k8c7o/j8hfscOMV1FI9eNMfMMFPc
 h49VWiVnSdTDFGF6ml+oksrYdrVswLp4DSxlVoEqNlIzr3J733E0kvue/q02iFNX8wL2jaJfTA0
 ChqXLzP0BUgCM+pHkSMT2zZSupSeB+g4tvtuQ9L66Q/PTaz1WNy+2Qo/0IhWXG+YQ0dvEzXBHKI
 yHbI6MXyVBuXdGf9bI1EF7XZWUg6wpah00ko1oMbQBHLxpSyOrXdGW5Js6iBlhF1G35PbMfKcMt
 /fzFdSo1MmaoHTTqN2w==
X-Proofpoint-GUID: jrhF0mtgdw_JyAucWXs4WD-JGfbL4pBI
X-Proofpoint-ORIG-GUID: jrhF0mtgdw_JyAucWXs4WD-JGfbL4pBI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160015

From: Jassi Brar <jassisinghbrar@gmail.com>

The mailbox framework only models queued transfers.
tx_block=true sleeps, while tx_block=false goes through the
single-request queue and txdone state machine. Controllers
that complete synchronously in the caller's context therefore
cannot return a reliable per-call result when multiple CPUs
use the same channel.

Add an opt-in per-channel direct transmit mode. A controller
advertises MBOX_CHAN_CAP_SYNC_ATOMIC and/or
MBOX_CHAN_CAP_SYNC_SLEEPABLE and implements the corresponding
send_data_sync* operation.  The new mbox_send_message_sync*
client APIs bypass the queue, active_req, and txdone state
machine entirely and return the controller's result to the
caller. The framework imposes no per-channel lock on this
path; the controller owns serialization of its own resources
and the client owns serialization against free and unbind.

Direct channels reject mbox_send_message() and mbox_flush(),
warn on txdone misuse, and report zero TX slots.
Registration validates the capability and operation combination.
Existing controllers and clients keep zero sync_caps and
are unchanged.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Jassi Brar <jassisinghbrar@gmail.com>
---
 drivers/mailbox/mailbox.c          | 144 ++++++++++++++++++++++++++++-
 include/linux/mailbox_client.h     |   9 +-
 include/linux/mailbox_controller.h |  38 ++++++++
 3 files changed, 184 insertions(+), 7 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index efacd24a085d..0cc7d2eed7cf 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -11,6 +11,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/kernel.h>
 #include <linux/mailbox_client.h>
 #include <linux/mailbox_controller.h>
 #include <linux/module.h>
@@ -162,10 +163,14 @@ EXPORT_SYMBOL_GPL(mbox_chan_received_data);
  *
  * The controller that has IRQ for TX ACK calls this atomic API
  * to tick the TX state machine. It works only if txdone_irq
- * is set by the controller.
+ * is set by the controller.  Direct channels do not use the queued
+ * state machine, so calling this on one is a bug and is ignored.
  */
 void mbox_chan_txdone(struct mbox_chan *chan, int r)
 {
+	if (WARN_ON_ONCE(mbox_chan_is_sync(chan)))
+		return;
+
 	if (unlikely(!(chan->txdone_method & MBOX_TXDONE_BY_IRQ))) {
 		dev_err(chan->mbox->dev,
 		       "Controller can't run the TX ticker\n");
@@ -183,10 +188,15 @@ EXPORT_SYMBOL_GPL(mbox_chan_txdone);
  *
  * The client/protocol had received some 'ACK' packet and it notifies
  * the API that the last packet was sent successfully. This only works
- * if the controller can't sense TX-Done.
+ * if the controller can't sense TX-Done.  Direct channels return the
+ * per-call result from mbox_send_message_sync(), so calling this on one
+ * is a bug and is ignored.
  */
 void mbox_client_txdone(struct mbox_chan *chan, int r)
 {
+	if (WARN_ON_ONCE(mbox_chan_is_sync(chan)))
+		return;
+
 	if (unlikely(!(chan->txdone_method & MBOX_TXDONE_BY_ACK))) {
 		dev_err(chan->mbox->dev, "Client can't run the TX ticker\n");
 		return;
@@ -228,7 +238,8 @@ EXPORT_SYMBOL_GPL(mbox_client_peek_data);
  * mbox_send_message() before the channel's TX queue is full. This helps
  * clients avoid the -ENOBUFS error without needing to increase
  * MBOX_TX_QUEUE_LEN.
- * This can be called from atomic context.
+ * This can be called from atomic context.  Direct channels have no TX
+ * queue and always report zero slots.
  *
  * Return: Number of available slots in the channel's TX queue.
  */
@@ -236,6 +247,9 @@ unsigned int mbox_chan_tx_slots_available(struct mbox_chan *chan)
 {
 	unsigned int ret;
 
+	if (mbox_chan_is_sync(chan))
+		return 0;
+
 	guard(spinlock_irqsave)(&chan->lock);
 	ret = MBOX_TX_QUEUE_LEN - chan->msg_count;
 
@@ -266,6 +280,9 @@ EXPORT_SYMBOL_GPL(mbox_chan_tx_slots_available);
  * access to a channel if multi-threads are to send messages through the
  * same channel, i.e. caller should not call this function until any
  * previous call returns.
+ *  A direct channel (see MBOX_CHAN_CAP_SYNC_*) does not use this queued
+ * path; use mbox_send_message_sync() or
+ * mbox_send_message_sync_sleepable() instead.
  *
  * Return: Non-negative integer for successful submission (non-blocking mode)
  *	or transmission over chan (blocking mode).
@@ -278,6 +295,9 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 	if (!chan || !chan->cl || mssg == MBOX_NO_MSG)
 		return -EINVAL;
 
+	if (mbox_chan_is_sync(chan))
+		return -EOPNOTSUPP;
+
 	t = add_to_rbuf(chan, mssg);
 	if (t < 0) {
 		dev_err(chan->mbox->dev, "Try increasing MBOX_TX_QUEUE_LEN\n");
@@ -308,6 +328,78 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 }
 EXPORT_SYMBOL_GPL(mbox_send_message);
 
+/**
+ * mbox_send_message_sync - directly transmit a message from atomic context
+ * @chan: Mailbox channel assigned to this client.
+ * @mssg: Client specific message typecasted.
+ *
+ * Directly invoke the controller's atomic-safe synchronous transmit
+ * operation.  The operation runs in the caller's context, without
+ * chan->lock and without touching the queued state machine, and returns
+ * the controller's per-call result.  This function does not sleep and may
+ * be called from any context in which the controller's send_data_sync()
+ * operation is safe, including hardirq context.
+ *
+ * The message buffer must remain valid until this function returns; the
+ * controller must not retain it afterwards.  The caller is responsible for
+ * serializing this call against mbox_free_channel() and driver removal.
+ *
+ * Return: 0 on success, -EINVAL for invalid arguments, -EOPNOTSUPP if the
+ * channel does not support atomic-safe direct transmit, or another
+ * negative errno from the controller.
+ */
+int mbox_send_message_sync(struct mbox_chan *chan, void *mssg)
+{
+	if (!chan || !READ_ONCE(chan->cl) || mssg == MBOX_NO_MSG)
+		return -EINVAL;
+
+	lockdep_assert_not_held(&chan->lock);
+
+	if (!(chan->sync_caps & MBOX_CHAN_CAP_SYNC_ATOMIC) ||
+	    !chan->mbox->ops->send_data_sync)
+		return -EOPNOTSUPP;
+
+	return chan->mbox->ops->send_data_sync(chan, mssg);
+}
+EXPORT_SYMBOL_GPL(mbox_send_message_sync);
+
+/**
+ * mbox_send_message_sync_sleepable - directly transmit from sleepable context
+ * @chan: Mailbox channel assigned to this client.
+ * @mssg: Client specific message typecasted.
+ *
+ * Directly invoke a synchronous transmit operation that may sleep.  If the
+ * channel implements send_data_sync_sleepable(), that operation is used;
+ * otherwise the atomic-safe send_data_sync() is used as a fallback.  This
+ * function may sleep and must only be called from sleepable context.
+ *
+ * The message buffer and free/unbind rules are the same as for
+ * mbox_send_message_sync().
+ *
+ * Return: 0 on success, -EINVAL for invalid arguments, -EOPNOTSUPP if the
+ * channel does not support direct transmit, or another negative errno from
+ * the controller.
+ */
+int mbox_send_message_sync_sleepable(struct mbox_chan *chan, void *mssg)
+{
+	if (!chan || !READ_ONCE(chan->cl) || mssg == MBOX_NO_MSG)
+		return -EINVAL;
+
+	lockdep_assert_not_held(&chan->lock);
+	might_sleep();
+
+	if ((chan->sync_caps & MBOX_CHAN_CAP_SYNC_SLEEPABLE) &&
+	    chan->mbox->ops->send_data_sync_sleepable)
+		return chan->mbox->ops->send_data_sync_sleepable(chan, mssg);
+
+	if ((chan->sync_caps & MBOX_CHAN_CAP_SYNC_ATOMIC) &&
+	    chan->mbox->ops->send_data_sync)
+		return chan->mbox->ops->send_data_sync(chan, mssg);
+
+	return -EOPNOTSUPP;
+}
+EXPORT_SYMBOL_GPL(mbox_send_message_sync_sleepable);
+
 /**
  * mbox_flush - flush a mailbox channel
  * @chan: mailbox channel to flush
@@ -319,6 +411,8 @@ EXPORT_SYMBOL_GPL(mbox_send_message);
  * call the mbox_flush() function at any time after mbox_send_message() to
  * flush the transmission. After the function returns success, the mailbox
  * transmission is guaranteed to have completed.
+ * Direct channels have no framework transmission to flush, so this function
+ * returns -EOPNOTSUPP for them.
  *
  * Returns: 0 on success or a negative error code on failure.
  */
@@ -326,6 +420,9 @@ int mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 {
 	int ret;
 
+	if (mbox_chan_is_sync(chan))
+		return -EOPNOTSUPP;
+
 	if (!chan->mbox->ops->flush)
 		return -ENOTSUPP;
 
@@ -343,7 +440,8 @@ static void mbox_clean_and_put_channel(struct mbox_chan *chan)
 	scoped_guard(spinlock_irqsave, &chan->lock) {
 		chan->cl = NULL;
 		chan->active_req = MBOX_NO_MSG;
-		if (chan->txdone_method == MBOX_TXDONE_BY_ACK)
+		if (!mbox_chan_is_sync(chan) &&
+		    chan->txdone_method == MBOX_TXDONE_BY_ACK)
 			chan->txdone_method = MBOX_TXDONE_BY_POLL;
 	}
 
@@ -367,7 +465,8 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 		chan->cl = cl;
 		init_completion(&chan->tx_complete);
 
-		if (chan->txdone_method	== MBOX_TXDONE_BY_POLL && cl->knows_txdone)
+		if (chan->txdone_method == MBOX_TXDONE_BY_POLL &&
+		    !mbox_chan_is_sync(chan) && cl->knows_txdone)
 			chan->txdone_method = MBOX_TXDONE_BY_ACK;
 	}
 
@@ -543,6 +642,41 @@ int mbox_controller_register(struct mbox_controller *mbox)
 	if (!mbox || !mbox->dev || !mbox->ops || !mbox->chans || !mbox->num_chans)
 		return -EINVAL;
 
+	for (i = 0; i < mbox->num_chans; i++) {
+		struct mbox_chan *chan = &mbox->chans[i];
+
+		if (chan->sync_caps & ~(MBOX_CHAN_CAP_SYNC_ATOMIC |
+					MBOX_CHAN_CAP_SYNC_SLEEPABLE)) {
+			dev_err(mbox->dev,
+				"channel %d has unknown sync capabilities 0x%x\n",
+				i, chan->sync_caps);
+			return -EINVAL;
+		}
+
+		if ((chan->sync_caps & MBOX_CHAN_CAP_SYNC_ATOMIC) &&
+		    !mbox->ops->send_data_sync) {
+			dev_err(mbox->dev,
+				"channel %d advertises atomic sync without send_data_sync\n",
+				i);
+			return -EINVAL;
+		}
+
+		if ((chan->sync_caps & MBOX_CHAN_CAP_SYNC_SLEEPABLE) &&
+		    !mbox->ops->send_data_sync_sleepable) {
+			dev_err(mbox->dev,
+				"channel %d advertises sleepable sync without send_data_sync_sleepable\n",
+				i);
+			return -EINVAL;
+		}
+
+		if (!mbox_chan_is_sync(chan) && !mbox->ops->send_data) {
+			dev_err(mbox->dev,
+				"queued channel %d has no send_data operation\n",
+				i);
+			return -EINVAL;
+		}
+	}
+
 	if (mbox->txdone_irq)
 		txdone = MBOX_TXDONE_BY_IRQ;
 	else if (mbox->txdone_poll)
diff --git a/include/linux/mailbox_client.h b/include/linux/mailbox_client.h
index e5997120f45c..49b778aa4b9a 100644
--- a/include/linux/mailbox_client.h
+++ b/include/linux/mailbox_client.h
@@ -16,11 +16,13 @@ struct mbox_chan;
  * struct mbox_client - User of a mailbox
  * @dev:		The client device
  * @tx_block:		If the mbox_send_message should block until data is
- *			transmitted.
- * @tx_tout:		Max block period in ms before TX is assumed failure
+ *			transmitted.  Ignored on direct channels.
+ * @tx_tout:		Max block period in ms before TX is assumed failure.
+ *			Ignored on direct channels.
  * @knows_txdone:	If the client could run the TX state machine. Usually
  *			if the client receives some ACK packet for transmission.
  *			Unused if the controller already has TX_Done/RTR IRQ.
+ *			Ignored on direct channels.
  * @rx_callback:	Atomic callback to provide client the data received
  * @tx_prepare: 	Atomic callback to ask client to prepare the payload
  *			before initiating the transmission if required.
@@ -42,6 +44,9 @@ struct mbox_chan *mbox_request_channel_byname(struct mbox_client *cl,
 					      const char *name);
 struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index);
 int mbox_send_message(struct mbox_chan *chan, void *mssg);
+int __must_check mbox_send_message_sync(struct mbox_chan *chan, void *mssg);
+int __must_check mbox_send_message_sync_sleepable(struct mbox_chan *chan,
+						  void *mssg);
 int mbox_flush(struct mbox_chan *chan, unsigned long timeout);
 void mbox_client_txdone(struct mbox_chan *chan, int r); /* atomic */
 bool mbox_client_peek_data(struct mbox_chan *chan); /* atomic */
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 26a238a6f941..34724bfc683d 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -19,6 +19,16 @@ struct mbox_chan;
 #define MBOX_TXDONE_BY_POLL	BIT(1) /* controller can read status of last TX */
 #define MBOX_TXDONE_BY_ACK	BIT(2) /* S/W ACK received by Client ticks the TX */
 
+/*
+ * Per-channel direct synchronous transmit capabilities.  A channel with any
+ * of these bits set is a direct channel: mbox_send_message() and mbox_flush()
+ * are rejected on it and the matching direct operation is the only transmit
+ * path.  The bits are set by the controller before registration and are
+ * immutable afterwards.
+ */
+#define MBOX_CHAN_CAP_SYNC_ATOMIC	BIT(0) /* may not sleep */
+#define MBOX_CHAN_CAP_SYNC_SLEEPABLE	BIT(1) /* may sleep */
+
 /**
  * struct mbox_chan_ops - methods to control mailbox channels
  * @send_data:	The API asks the MBOX controller driver, in atomic
@@ -50,6 +60,18 @@ struct mbox_chan;
  *		  Used only if txdone_poll:=true && txdone_irq:=false
  * @peek_data: Atomic check for any received data. Return true if controller
  *		  has some data to push to the client. False otherwise.
+ * @send_data_sync: Optional direct synchronous transmit. It is called from
+ *		  the client's context without chan->lock and must complete the
+ *		  transfer before returning. It must not sleep, must not call the
+ *		  txdone or mailbox transmit APIs recursively, and must not retain
+ *		  @data. It may be called concurrently on the same channel from
+ *		  multiple CPUs; the controller must protect its own resources and
+ *		  may return -EBUSY when a call cannot be served concurrently.
+ *		  Requires MBOX_CHAN_CAP_SYNC_ATOMIC on the channel.
+ * @send_data_sync_sleepable: Optional sleepable variant of @send_data_sync.
+ *		  It has the same direct semantics but may sleep and may therefore
+ *		  only be called from sleepable context. Requires
+ *		  MBOX_CHAN_CAP_SYNC_SLEEPABLE on the channel.
  */
 struct mbox_chan_ops {
 	int (*send_data)(struct mbox_chan *chan, void *data);
@@ -58,6 +80,14 @@ struct mbox_chan_ops {
 	void (*shutdown)(struct mbox_chan *chan);
 	bool (*last_tx_done)(struct mbox_chan *chan);
 	bool (*peek_data)(struct mbox_chan *chan);
+
+	/*
+	 * Optional direct synchronous transmit operations.  Keep these at the
+	 * end so positional initializers for the queued operations remain
+	 * valid.
+	 */
+	int (*send_data_sync)(struct mbox_chan *chan, void *data);
+	int (*send_data_sync_sleepable)(struct mbox_chan *chan, void *data);
 };
 
 /**
@@ -127,6 +157,8 @@ struct mbox_controller {
  * @msg_data:		Hook for data packet
  * @lock:		Serialise access to the channel
  * @con_priv:		Hook for controller driver to attach private data
+ * @sync_caps:		Per-channel direct transmit capabilities, immutable
+ *			after registration.  Zero means a queued channel.
  */
 struct mbox_chan {
 	struct mbox_controller *mbox;
@@ -139,8 +171,14 @@ struct mbox_chan {
 	void *msg_data[MBOX_TX_QUEUE_LEN];
 	spinlock_t lock; /* Serialise access to the channel */
 	void *con_priv;
+	unsigned int sync_caps;	/* MBOX_CHAN_CAP_SYNC_* */
 };
 
+static inline bool mbox_chan_is_sync(const struct mbox_chan *chan)
+{
+	return chan->sync_caps != 0;
+}
+
 int mbox_controller_register(struct mbox_controller *mbox); /* can sleep */
 void mbox_controller_unregister(struct mbox_controller *mbox); /* can sleep */
 void mbox_chan_received_data(struct mbox_chan *chan, void *data); /* atomic */
-- 
2.43.0

