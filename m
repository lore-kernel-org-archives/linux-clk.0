Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801680;
	b=DEEibqSaR3lw/Z//q9spMiP8slyUpj61HhwrMORn9xG3ET/ocr4IdYm+haTPtWeDICGX
	 YMhKbBYwa8xvhDz10OGZ4hFhheoiVM8J3vbvLK0YDoW0mgB3W9/m/paXZe2GZP2ldglGI
	 B7vvsREYUyb7pVh3NnWVKIo2QaDNJw3NyjcmNBFsg0Nt/NBLw3WQCG9W0yKWVABTE+lZu
	 mH/10Yo3CgTRKv47PbCLi/c17tqigFfoTtlQcWSoORB08HAHM68m3vRqpicl0gwDeaGWE
	 xmNGxZEBnRIQU7aucLGHctzRmNC+LosJ0zh1kCceLmmY//5DtoWqHVQA5FtfIAtGv1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801680;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yBlZGqxZmmqBHZK9PXeqyyO15uTxkOk+mAZ9crDI7po=;
	b=1ZHU00uT0lX2bTsCHFR+HZLMLHw70DNEH+v0wVqjYr35OMSOBTY1sJ2D+1MUA8Gjs3nt
	 6zfNf4kUdwa/975n4eXAlYBtMt2uUqi7VOSrol7bom+NkYJxnaWC5JupKkLS2ZbXx/jsZ
	 Tv0pLVY9iY4a94dNq1RHO/3Pmu+cDzygL3bip6WxzeC/vFas1WsDlZ5wT4aJkQrWADjRy
	 O78i0KSlnOVCKydQWLxzTHNtSwWD/yAxaoWQeZYVpx3pnRWddr+uaPlBDzWLYr056GQfk
	 KSG/GlE3H5Z2y8kV8uPXVImphlOWGpVcyEs6Ha7uRkMW2xo9NMPbvU/X89+Dtj9Vauw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gzTHIjgd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C710C606A8AF;
	Mon, 16 Nov 2026 04:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C710C606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gzTHIjgd
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1vCGs349811;
	Mon, 16 Nov 2026 04:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yBlZGqxZmmq
	BHZK9PXeqyyO15uTxkOk+mAZ9crDI7po=; b=gzTHIjgdTT6GSbLmJBbZCNTEj7V
	w8eLgyvp6EZs8dU4rBkw7hQjlMcXImKUuofPV9/ImQ67ScWzc09Naz5SBYkbHEMa
	xFlC9DPisGVHPNWBczAvAI42ro/+0IgGsJScX+m8u1B7v7bojpTE0vodvTOJIBJS
	oEm4Lvf9B7KuGN3utlMbJFf8tgkX8sUOieAHLeDrOfwJlJ6LSe0x/fRjfKwhMwmd
	Rd8JbJKdYAQeIXWxYqXZT4UoZAwKJtCEx3z3jprTvI72UPii4iR7aSUiV1yZbTrT
	dxlqUvs45T413uoER+X4tLNo+ebcA3SpoJJjxOKPaaAzKfRTfa5qxLtAVpA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc0as8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 04:00:54 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG40qf81809012;
	Mon, 16 Nov 2026 04:00:52 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AG40pUa1808993
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 04:00:51 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id F3B2B24922; Mon, 16 Nov 2026 09:30:50 +0530 (+0530)
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
Subject: [PATCH v2 4/5] mailbox: document direct synchronous transmit
Date: Mon, 16 Nov 2026 09:30:48 +0530
Message-ID: <20261116040049.1795610-5-anup.patel@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxNSBTYWx0ZWRfX9MsHyeoQpXog
 bhH9NQ8gjSebtrZ8zSuW2uww8T1lNL1amwOF/uFZgHidLNDtW185WK4U1sV1frjFHP8lZmVc6in
 puf2z+E/xqrN+FGmdCrcng59HYH3YrU=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afa7ff6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=ptEufTgBBeyebgs3zHwA:9
X-Proofpoint-ORIG-GUID: khUrW83L8s-lh2zkZKfFRj67XkaawoMG
X-Proofpoint-GUID: khUrW83L8s-lh2zkZKfFRj67XkaawoMG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxNSBTYWx0ZWRfXyA6UFZyWypPt
 PdIFrBUJG9BJ+r6F8jMIVX1K/fhRaTY3WPj7GaSJ9M2TpDy+yyu1lwnA0sjJ7O9I+/Kw7/XQql6
 N8Q8DBqr+ziu95B2L7ySoBa7V4LqipKOyh2nAE5548Oh2jrh2cfSUkPu0HnhQlKQPz1pdRTiLsH
 YqWeE761OP2Kw9AM8paTOK19J/a1tCcYToNwqMhooCKsac5cQ4QwUkXeFqKZ2BrbbMOFPArS5TD
 deKjndVsgb2VKPGEGYsyNez275+F81NryKdomqRhBKWGkF8xeHM4BR3qfhjfIvdbmJRtiOblqdD
 gH+LHX+RieZ8Zb1r348ovv07KRbdp3ve1UR7Gpo10yNVAO1ZT2uBMORRKRu0hRIaZjuSoj8RQEg
 15031j7Es6e88+Mb1t3XrH8tNE8QYr0qJtSdfiuZVsQ2RWsBMncabcfaq/yT2OnxErWxuqvnAxv
 AJ2CmNB1A1fYFvIRtBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160015

From: Jassi Brar <jassisinghbrar@gmail.com>

Document the three transmit models supported by the mailbox
framework: non-blocking queued, blocking queued, and direct
synchronous.

Describe the controller-side capability advertisement and
operation contracts, including atomic versus sleepable
operations, per-CPU and controller-wide resource protection,
registration validation, and the client-side context,
lifetime, and free/unbind rules.  Add the normative interaction
table for the queued APIs on a direct channel and examples for
atomic-safe and per-CPU controllers.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Jassi Brar <jassisinghbrar@gmail.com>
---
 Documentation/driver-api/mailbox.rst | 350 +++++++++++++++++++++++++--
 1 file changed, 329 insertions(+), 21 deletions(-)

diff --git a/Documentation/driver-api/mailbox.rst b/Documentation/driver-api/mailbox.rst
index d46c60bd5df6..81d471027539 100644
--- a/Documentation/driver-api/mailbox.rst
+++ b/Documentation/driver-api/mailbox.rst
@@ -20,14 +20,28 @@ ever deal at client's protocol level.
 Some of the choices made during implementation are the result of this
 peculiarity of this "common" framework.
 
+The framework supports three transmit models:
+
+* non-blocking queued: ``mbox_send_message()`` returns a queue token and
+  completion is reported later through ``tx_done``;
+* blocking queued: ``tx_block`` is set and the caller waits on the
+  channel completion;
+* direct synchronous: the controller completes the transfer in the
+  caller's context and the client receives the per-call result directly.
+
+The first two models share the per-channel queue and TX-done state
+machine.  The direct model is opt-in per channel and bypasses that state
+machine entirely.
 
 
 Controller Driver (See include/linux/mailbox_controller.h)
 ==========================================================
 
-
 Allocate mbox_controller and the array of mbox_chan.
-Populate mbox_chan_ops, except flush() and peek_data() all are mandatory.
+Populate mbox_chan_ops.  ``send_data`` is mandatory for queued channels;
+``flush``, ``startup``, ``shutdown``, ``last_tx_done``, and ``peek_data``
+are optional depending on the controller's capabilities and the selected
+TX-done method.
 The controller driver might know a message has been consumed
 by the remote by getting an IRQ or polling some hardware flag
 or it can never know (the client knows by way of the protocol).
@@ -35,14 +49,197 @@ The method in order of preference is IRQ -> Poll -> None, which
 the controller driver should set via 'txdone_irq' or 'txdone_poll'
 or neither.
 
+Queued transmit
+---------------
+
+``send_data()`` is called by ``msg_submit()`` with ``chan->lock`` held and
+local IRQs disabled.  It must not sleep.  It should return 0 if the message
+was accepted, or a negative errno (for example ``-EBUSY``) if it could not
+be accepted.  Completion is reported later with ``mbox_chan_txdone()``
+(IRQ mode) or by the polling timer calling ``last_tx_done()``.  A client
+using the ``knows_txdone`` retrofit calls ``mbox_client_txdone()`` itself.
+
+The queue and TX-done state machine assume a single outstanding request
+per channel.  All senders on a queued channel are therefore serialized by
+the framework, and ``tx_block`` callers must serialize themselves.
+
+Direct synchronous transmit
+---------------------------
+
+Some controllers complete a transfer synchronously in the calling context
+and can return the result immediately.  Such a controller may advertise a
+direct channel by setting ``struct mbox_chan.sync_caps`` before calling
+``mbox_controller_register()``:
+
+.. code-block:: c
+
+    #define MBOX_CHAN_CAP_SYNC_ATOMIC	BIT(0)
+    #define MBOX_CHAN_CAP_SYNC_SLEEPABLE	BIT(1)
+
+A channel with either bit set is a *direct channel*.  ``sync_caps`` is
+immutable after registration; zero means the channel keeps the existing
+queued behavior.  Controllers must therefore initialize it to zero for
+queued channels; ``kzalloc()`` and static storage already do so.
+
+The controller implements one or both of these operations:
+
+.. code-block:: c
+
+    int (*send_data_sync)(struct mbox_chan *chan, void *data);
+    int (*send_data_sync_sleepable)(struct mbox_chan *chan, void *data);
+
+``send_data_sync()``
+    Atomic-safe direct transmit.  It must not sleep, must complete the
+    transfer (or return a per-call error) before returning, and must not
+    use a later TX-done interrupt, polling timer, or ``mbox_chan_txdone()``.
+    It must not call the txdone APIs or any client callback recursively.
+    It must not retain ``data`` after returning.
+
+``send_data_sync_sleepable()``
+    Sleepable direct transmit.  It has the same per-call, no-retained-buffer
+    contract but may use mutexes, completions, sleeping bus access, and other
+    sleepable primitives.  It must only be called from sleepable context.
+
+Both operations are called in the client's context with no framework lock
+held and with the caller's IRQ and preemption state.  The framework calls
+the operation exactly once per client call and returns its result to that
+same caller.
+
+A controller that implements a direct operation but does not set the
+matching capability bit is valid; the operation is then simply unused.
+Registration rejects unknown capability bits, a capability bit without the
+matching operation, and a queued channel without ``send_data``.
+
+Concurrency and resource ownership
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The framework does not serialize direct callers.  Multiple CPUs may call
+the direct API on the same channel concurrently.  This is deliberate: a
+per-channel framework lock would violate the concurrency contract and would
+still not protect controller-wide or per-CPU resources.
+
+The controller owns protection of everything its direct operation touches:
+
+* controller-wide registers and shared FIFOs;
+* per-channel state, which may live in ``chan->con_priv``;
+* per-CPU scratch memory and other per-CPU state;
+* resources shared with non-mailbox users of the same controller helpers.
+
+The controller may take its own lock to serialize, or may return ``-EBUSY``
+to a caller it cannot serve concurrently.  It must not assume that the
+framework disabled IRQs for it.
+
+If the operation uses per-CPU state, it must also prevent same-CPU IRQ
+re-entry.  ``local_irq_save()`` is the portable hardirq-safe choice.
+``local_lock_irqsave()`` gives lockdep coverage on non-RT kernels, but on
+PREEMPT_RT it maps to a per-CPU sleeping spinlock and must not be used from
+hardirq context.  A per-CPU ``raw_spinlock_t`` taken with IRQs disabled is
+another option.  A plain ``get_cpu()``/``put_cpu()`` pair only disables
+preemption and does not stop an IRQ on the same CPU from re-entering.
+
+Example: atomic-safe controller
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. code-block:: c
+
+    struct my_chan {
+        void __iomem *tx_reg;
+        spinlock_t lock;	/* protects this controller's registers */
+        bool busy;
+    };
+
+    static int my_send_data_sync(struct mbox_chan *chan, void *data)
+    {
+        struct my_chan *c = chan->con_priv;
+        unsigned long flags;
+        u32 status;
+        int ret = 0;
+
+        /*
+         * The framework does not serialize direct callers and does not
+         * disable IRQs.  This controller shares one register block across
+         * all CPUs, so it uses its own IRQ-safe lock.
+         */
+        spin_lock_irqsave(&c->lock, flags);
+        if (c->busy) {
+            ret = -EBUSY;
+            goto out;
+        }
+
+        c->busy = true;
+        writel(*(u32 *)data, c->tx_reg);
+        if (readl_poll_timeout_atomic(c->tx_reg + MY_STATUS, status,
+                                      status & MY_DONE, 1, 1000))
+            ret = -ETIMEDOUT;
+        c->busy = false;
+    out:
+        spin_unlock_irqrestore(&c->lock, flags);
+        return ret;
+    }
+
+    static const struct mbox_chan_ops my_ops = {
+        .send_data_sync = my_send_data_sync,
+        /* .send_data may be NULL if every channel is direct-only. */
+    };
+
+    static int my_probe(struct platform_device *pdev)
+    {
+        ...
+        for (i = 0; i < MY_NUM_CHANS; i++)
+            mbox->chans[i].sync_caps = MBOX_CHAN_CAP_SYNC_ATOMIC;
+        ...
+        return devm_mbox_controller_register(dev, &mbox->controller);
+    }
+
+Example: per-CPU shared-memory controller
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+A controller that hands a per-CPU buffer to firmware must guard the whole
+copy/firmware-call/copy sequence, not just the copy:
+
+.. code-block:: c
+
+    static int my_send_data_sync(struct mbox_chan *chan, void *data)
+    {
+        struct my_msg *msg = data;
+        int ret;
+
+        /*
+         * The firmware uses per-CPU scratch memory.  A hardirq on this CPU
+         * could otherwise re-enter and clobber it between the copy and the
+         * firmware call.
+         */
+        guard(irqsave)();
+        memcpy(this_cpu_ptr(&my_buf)->data, msg->tx, msg->len);
+        ret = my_firmware_call(this_cpu_ptr(&my_buf)->phys, msg->len);
+        if (!ret)
+            memcpy(msg->rx, this_cpu_ptr(&my_buf)->data, msg->rx_len);
+        return ret;
+    }
+
+Every user of the per-CPU buffer must take the same guard.  Attribute
+queries, notification fetches, MSI programming, and non-mailbox users that
+share the buffer are all part of the same critical section.  Delivering RX
+through ``mbox_chan_received_data()`` while holding that guard can deadlock
+if the client sends from ``rx_callback``; release the guard first or use a
+separate RX lock.
+
 
 Client Driver (See include/linux/mailbox_client.h)
 ==================================================
 
+The client might want to operate in one of three modes:
 
-The client might want to operate in blocking mode (synchronously
-send a message through before returning) or non-blocking/async mode (submit
-a message and a callback function to the API and return immediately).
+* non-blocking queued: submit a message and a callback, return immediately;
+* blocking queued: wait until the queued transfer completes or times out;
+* direct synchronous: call the controller operation and receive its result.
+
+The first two use ``mbox_send_message()`` and the queued state machine.
+The third uses ``mbox_send_message_sync()`` or
+``mbox_send_message_sync_sleepable()`` and must be used on a direct channel.
+
+Blocking and non-blocking queued modes
+--------------------------------------
 
 ::
 
@@ -82,12 +279,12 @@ a message and a callback function to the API and return immediately).
 
 	static void client_demo(struct platform_device *pdev)
 	{
-		struct demo_client *dc_sync, *dc_async;
-		/* The controller already knows async_pkt and sync_pkt */
+		struct demo_client *dc_blocking, *dc_async;
+		/* The controller already knows async_pkt and blocking_pkt */
 		struct async_pkt ap;
-		struct sync_pkt sp;
+		struct blocking_pkt bp;
 
-		dc_sync = kzalloc_obj(*dc_sync);
+		dc_blocking = kzalloc_obj(*dc_blocking);
 		dc_async = kzalloc_obj(*dc_async);
 
 		/* Populate non-blocking mode client */
@@ -101,13 +298,13 @@ a message and a callback function to the API and return immediately).
 		init_completion(&dc_async->c);
 
 		/* Populate blocking mode client */
-		dc_sync->cl.dev = &pdev->dev;
-		dc_sync->cl.rx_callback = message_from_remote;
-		dc_sync->cl.tx_done = NULL; /* operate in blocking mode */
-		dc_sync->cl.tx_block = true;
-		dc_sync->cl.tx_tout = 500; /* by half a second */
-		dc_sync->cl.knows_txdone = false; /* depending upon protocol */
-		dc_sync->async = false;
+		dc_blocking->cl.dev = &pdev->dev;
+		dc_blocking->cl.rx_callback = message_from_remote;
+		dc_blocking->cl.tx_done = NULL; /* operate in blocking mode */
+		dc_blocking->cl.tx_block = true;
+		dc_blocking->cl.tx_tout = 500; /* by half a second */
+		dc_blocking->cl.knows_txdone = false; /* depending upon protocol */
+		dc_blocking->async = false;
 
 		/* ASync mailbox is listed second in 'mboxes' property */
 		dc_async->mbox = mbox_request_channel(&dc_async->cl, 1);
@@ -116,14 +313,125 @@ a message and a callback function to the API and return immediately).
 		/* Send async message to remote */
 		mbox_send_message(dc_async->mbox, &ap);
 
-		/* Sync mailbox is listed first in 'mboxes' property */
-		dc_sync->mbox = mbox_request_channel(&dc_sync->cl, 0);
+		/* Blocking mailbox is listed first in 'mboxes' property */
+		dc_blocking->mbox = mbox_request_channel(&dc_blocking->cl, 0);
 		/* Populate data packet */
-		/* sp.abc = 123; etc */
+		/* bp.abc = 123; etc */
 		/* Send message to remote in blocking mode */
-		mbox_send_message(dc_sync->mbox, &sp);
-		/* At this point 'sp' has been sent */
+		mbox_send_message(dc_blocking->mbox, &bp);
+		/* At this point 'bp' has been sent */
 
 		/* Now wait for async chan to be done */
 		wait_for_completion(&dc_async->c);
 	}
+
+The documentation uses "blocking queued" rather than "sync" for
+``tx_block=true`` so that it is not confused with direct synchronous
+transmit.  ``tx_block`` callers must serialize themselves on a channel.
+
+Direct synchronous mode
+-----------------------
+
+.. code-block:: c
+
+    int __must_check mbox_send_message_sync(struct mbox_chan *chan,
+                                            void *mssg);
+    int __must_check mbox_send_message_sync_sleepable(struct mbox_chan *chan,
+                                                      void *mssg);
+
+``mbox_send_message_sync()``
+    Calls ``send_data_sync()``.  It never sleeps and may be called from any
+    context in which the controller operation is safe, including hardirq.
+    It does not fall back to a sleepable operation.
+
+``mbox_send_message_sync_sleepable()``
+    Calls ``send_data_sync_sleepable()`` when the channel advertises it.
+    If only ``MBOX_CHAN_CAP_SYNC_ATOMIC`` is advertised, it calls the
+    stronger ``send_data_sync()`` instead.  It calls ``might_sleep()`` and
+    may therefore be used only from sleepable context.
+
+Both functions return 0 on success, ``-EINVAL`` for invalid arguments,
+``-EOPNOTSUPP`` when the channel does not support the requested direct
+mode, or another negative errno from the controller.  Positive values are
+not used by the direct API; controllers must return 0 or a negative errno.
+The declarations are ``__must_check`` because the per-call result is the
+whole point of the API.
+
+The caller must keep the message buffer valid until the call returns.  The
+controller must not retain the pointer afterwards.  The caller is also
+responsible for serializing the call against ``mbox_free_channel()`` and
+driver removal; the framework does not wait for or refcount in-flight direct
+calls.  The ``chan->cl`` check in the wrapper is only a best-effort sanity
+check.
+
+The capability probe is the call itself: a client may attempt the direct
+API and handle ``-EOPNOTSUPP``.  There is no capability query helper in the
+minimal API.
+
+Example:
+
+.. code-block:: c
+
+    ret = mbox_send_message_sync(client->chan, msg);
+    if (ret)
+        /* Handle the per-call error. */
+
+The direct path calls neither ``tx_prepare`` nor ``tx_done``.  The client
+prepares its buffer before the call, and the return value is the completion
+notification.  ``tx_block``, ``tx_tout``, and ``knows_txdone`` are ignored
+on a direct channel because ``mbox_send_message()`` and
+``mbox_client_txdone()`` are rejected there.
+
+Interaction with the existing API
+=================================
+
+The following table is normative for a direct channel
+(``sync_caps != 0``):
+
+.. list-table:: Interaction with the existing API on a direct channel
+   :header-rows: 1
+   :widths: 30 70
+
+   * - API / callback
+     - Behavior on a direct channel
+   * - ``mbox_send_message()``
+     - Returns ``-EOPNOTSUPP``.  Mixing queued and direct paths would
+       reintroduce the single-request state machine.
+   * - ``mbox_flush()``
+     - Returns ``-EOPNOTSUPP``.  There is no framework transmission to
+       flush.
+   * - ``tx_prepare``
+     - Never called.  The client prepares its own buffer.
+   * - ``tx_done``
+     - Never called.  The direct return value is the notification.
+   * - ``mbox_chan_txdone()``
+     - ``WARN_ON_ONCE()`` and no-op.  The controller must return the result
+       from the direct operation.
+   * - ``mbox_client_txdone()``
+     - ``WARN_ON_ONCE()`` and no-op.  Same reason.
+   * - ``mbox_chan_tx_slots_available()``
+     - Returns 0.  A direct channel has no queue.
+   * - ``tx_block`` / ``tx_tout``
+     - Ignored.  ``mbox_send_message()`` is rejected.
+   * - ``knows_txdone``
+     - Ignored.  ``mbox_client_txdone()`` is rejected.
+   * - ``startup`` / ``shutdown``
+     - Unchanged.  Called on bind/unbind and may sleep.
+   * - ``rx_callback`` / ``peek_data`` / ``mbox_chan_received_data()``
+     - Unchanged.  Receive delivery is independent of the transmit mode.
+   * - ``mbox_free_channel()``
+     - Unchanged.  The client must serialize it against in-flight direct
+       calls.
+   * - debugfs mailbox summary
+     - Unchanged; it only reports channel ownership.
+
+Debugging aids provided by the framework are
+``lockdep_assert_not_held(&chan->lock)`` in both direct wrappers,
+``might_sleep()`` in the sleepable wrapper, txdone misuse warnings, and
+registration-time capability validation.  ``CONFIG_DEBUG_ATOMIC_SLEEP`` and
+``CONFIG_PROVE_LOCKING`` catch controller bugs that the framework cannot
+detect statically.
+
+The KUnit suite in ``drivers/mailbox/mailbox-sync-test.c`` exercises the
+capability matrix, registration validation, per-call results, multi-CPU
+concurrency, hardirq context, queued compatibility, and free/rebind.
-- 
2.43.0

