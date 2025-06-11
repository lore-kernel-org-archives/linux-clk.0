Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73892288D6
	for <linux-clk@vger.kernel.org>; Wed, 11 Jun 2025 06:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623010; cv=none; b=LEahNiPEd4TOA5++oGgHUHDdkJDSAhczU0fGt6Y60LZp5/w+dOfmP0QJneIUkr+T2r5B62zAIqcWsgfHYlZKZlyMocEfoOIZXTFaw9WQ7Xx9Aw3Ytk10xmKqz1khKd+sclTDE/QWx8HtkX3/XZOsJ7TyxSGFom6+KqAoLyIUogA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623010; c=relaxed/simple;
	bh=23vqG+UdB8CmOAk6yqbizlK8J50uIljCuXq5sZaUi5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qegYrP56LabY/kSn/BEr+LSStNY2ozBuUPGuh9HdnTYHKTzlzp8xDSoDcNdf76GzKHigzDMtR/vjpGd6VgXypkCLufcF8f1EJzALVIIZ22U+Xmohf/RG98nzUpJJzDAElLkgxkEgB8v0bQZRFw3Xj6z+QHrqUhSC8opZAyRRzoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=MYcfgFtu; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="MYcfgFtu"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23526264386so54520645ad.2
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 23:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623008; x=1750227808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEk7l982A/3iNmfI4ADDZgvcRJ/gPBy9EnX2Zk0GAIw=;
        b=MYcfgFtu1EKkHSd5nUT+bANL0+NdAFrY+hUKF0Usa28QtaIReLCTppmbVKfeW8ynfP
         bTxftt5AgG435PzLXqG3qKG5gWYwJiN0N2eqAP8eyZIgTkL4StGqoleCqdfq1Cq721Zq
         hm5FxRwescxKbpGuBNlfAMXDVVm55AHo19X8Trg2VgZbIhX7UlK5iZwcwUxe/s7nlEMo
         dO57qQ4skIbBwTq01eO7+fXcUQ3cDb49w227kHbQWRn468C9aMv8EaKq+H0rgpzvjkaO
         jDLVl7T+MkacleNpyoo6qwLpTgiKYgBGuPecwKMGLsmxkq5U7aEWFye2kRP3wlWjbp/S
         OyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623008; x=1750227808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEk7l982A/3iNmfI4ADDZgvcRJ/gPBy9EnX2Zk0GAIw=;
        b=CMGlyYzPx4EVnpbC+ML7SDGVVwVf8OcZ5Z6Hd4Y1jxRIUsjej50Bk18DeCYB0QlEj1
         53odHeGxNxJS1sF8KT3J7dhvymsNZvwmeI0TbvaTovSCIqcFlEARscEyUGkYsLMYZnOX
         hhsUdNQCcH7M49O5yWYAgcMI3SZ6DNpOlU4TdgptibB5nZpVwPwNA0uhIqii0456uvx2
         EsbaoQ08vD2jb4eIgW1Q4K6GhzXz7hBcNt1sB6jV55gCqup3aje2Q+wBTunjhbjH/nXd
         klUWxR8hv7VlH+T/YtC/hvxVh3EeYeZ/bcFr4BJnYhYxjcv7w8EvQiFyx8pxSnuGv7Vs
         XtAA==
X-Forwarded-Encrypted: i=1; AJvYcCWi4UktkytdMPIs2RxjRr86p3GTzMX7KnkIztaOYwA34IlU6sQgMs86kOTDm/jCUtlgYSha/bt1Ofo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxagrg2gQfKPG1xLY/uJwCgtC3UGOLDbHevar4XM6TqLW7SvGed
	Up5+wV1SB0AXCw0zMr4sbWHhYvSqsgRV72TxVxf1X829ztO7S2fto06lODnQQuJ1XaI=
X-Gm-Gg: ASbGncuEdKsRhZrSGkBpUtDSTGOcBgYR5MGIAgXbeq0jguBW+YX42gNv4t3XtiVuhTK
	PCjfqr4Cl3Gbgu4p0TOYLGBlu6BIa+1HUSdxNkKZrZoMBoTRLyYJTTGid+j+cf0a4N9lE9qqdCN
	j75eZzJrA2TditgEDM/T46FibRfTV7O6JxYbRIULXVdutSBrOZxqU2FNJzOEVfLyXappFpmkabe
	QUUFMtxztK9q3WUZHiQZ6TZtlaCzUWj7tAg6NJM3a8ms4YBYDeFI8bDsEzbeJWQRwdxYxh//eop
	Lp3BRxzyP2h1/EQ9JNvzYKefacnf0sTElcWil8wfS7d9q7TCt8/FFxgo8UkI++ciCCQgUTJqqYc
	xphfpfifl/CwYcGVK3vCgr/TFRA==
X-Google-Smtp-Source: AGHT+IGmMjAxKFfhQNXGR6+5ZNDeO/fKZhgBO21zoWdzah1Ay1ynpmgVEmCXF7UyFGfhGCa0JX+ytQ==
X-Received: by 2002:a17:903:32cc:b0:235:ef56:7800 with SMTP id d9443c01a7336-23641af0815mr26335535ad.30.1749623008101;
        Tue, 10 Jun 2025 23:23:28 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:23:27 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v5 04/23] mailbox: Add common header for RPMI messages sent via mailbox
Date: Wed, 11 Jun 2025 11:52:19 +0530
Message-ID: <20250611062238.636753-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RPMI based mailbox controller drivers and mailbox clients need to
share defines related to RPMI messages over mailbox interface so add
a common header for this purpose.

Co-developed-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/mailbox/riscv-rpmi-message.h | 207 +++++++++++++++++++++
 1 file changed, 207 insertions(+)
 create mode 100644 include/linux/mailbox/riscv-rpmi-message.h

diff --git a/include/linux/mailbox/riscv-rpmi-message.h b/include/linux/mailbox/riscv-rpmi-message.h
new file mode 100644
index 000000000000..fca1f18d93eb
--- /dev/null
+++ b/include/linux/mailbox/riscv-rpmi-message.h
@@ -0,0 +1,207 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2025 Ventana Micro Systems Inc. */
+
+#ifndef _LINUX_RISCV_RPMI_MESSAGE_H_
+#define _LINUX_RISCV_RPMI_MESSAGE_H_
+
+#include <linux/errno.h>
+#include <linux/mailbox_client.h>
+#include <linux/types.h>
+#include <linux/wordpart.h>
+
+/* RPMI version encode/decode macros */
+#define RPMI_VER_MAJOR(__ver)		upper_16_bits(__ver)
+#define RPMI_VER_MINOR(__ver)		lower_16_bits(__ver)
+#define RPMI_MKVER(__maj, __min)	make_u32_from_two_u16(__maj, __min)
+
+/* RPMI message header */
+struct rpmi_message_header {
+	__le16 servicegroup_id;
+	u8 service_id;
+	u8 flags;
+	__le16 datalen;
+	__le16 token;
+};
+
+/* RPMI message */
+struct rpmi_message {
+	struct rpmi_message_header header;
+	u8 data[];
+};
+
+/* RPMI notification event */
+struct rpmi_notification_event {
+	__le16 event_datalen;
+	u8 event_id;
+	u8 reserved;
+	u8 event_data[];
+};
+
+/* RPMI error codes */
+enum rpmi_error_codes {
+	RPMI_SUCCESS			= 0,
+	RPMI_ERR_FAILED			= -1,
+	RPMI_ERR_NOTSUPP		= -2,
+	RPMI_ERR_INVALID_PARAM		= -3,
+	RPMI_ERR_DENIED			= -4,
+	RPMI_ERR_INVALID_ADDR		= -5,
+	RPMI_ERR_ALREADY		= -6,
+	RPMI_ERR_EXTENSION		= -7,
+	RPMI_ERR_HW_FAULT		= -8,
+	RPMI_ERR_BUSY			= -9,
+	RPMI_ERR_INVALID_STATE		= -10,
+	RPMI_ERR_BAD_RANGE		= -11,
+	RPMI_ERR_TIMEOUT		= -12,
+	RPMI_ERR_IO			= -13,
+	RPMI_ERR_NO_DATA		= -14,
+	RPMI_ERR_RESERVED_START		= -15,
+	RPMI_ERR_RESERVED_END		= -127,
+	RPMI_ERR_VENDOR_START		= -128,
+};
+
+static inline int rpmi_to_linux_error(int rpmi_error)
+{
+	switch (rpmi_error) {
+	case RPMI_SUCCESS:
+		return 0;
+	case RPMI_ERR_INVALID_PARAM:
+	case RPMI_ERR_BAD_RANGE:
+	case RPMI_ERR_INVALID_STATE:
+		return -EINVAL;
+	case RPMI_ERR_DENIED:
+		return -EPERM;
+	case RPMI_ERR_INVALID_ADDR:
+	case RPMI_ERR_HW_FAULT:
+		return -EFAULT;
+	case RPMI_ERR_ALREADY:
+		return -EALREADY;
+	case RPMI_ERR_BUSY:
+		return -EBUSY;
+	case RPMI_ERR_TIMEOUT:
+		return -ETIMEDOUT;
+	case RPMI_ERR_IO:
+		return -ECOMM;
+	case RPMI_ERR_FAILED:
+	case RPMI_ERR_NOTSUPP:
+	case RPMI_ERR_NO_DATA:
+	case RPMI_ERR_EXTENSION:
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+/* RPMI Linux mailbox attribute IDs */
+enum rpmi_mbox_attribute_id {
+	RPMI_MBOX_ATTR_SPEC_VERSION,
+	RPMI_MBOX_ATTR_MAX_MSG_DATA_SIZE,
+	RPMI_MBOX_ATTR_SERVICEGROUP_ID,
+	RPMI_MBOX_ATTR_SERVICEGROUP_VERSION,
+	RPMI_MBOX_ATTR_MAX_ID
+};
+
+/* RPMI Linux mailbox message types */
+enum rpmi_mbox_message_type {
+	RPMI_MBOX_MSG_TYPE_GET_ATTRIBUTE,
+	RPMI_MBOX_MSG_TYPE_SET_ATTRIBUTE,
+	RPMI_MBOX_MSG_TYPE_SEND_WITH_RESPONSE,
+	RPMI_MBOX_MSG_TYPE_SEND_WITHOUT_RESPONSE,
+	RPMI_MBOX_MSG_TYPE_NOTIFICATION_EVENT,
+	RPMI_MBOX_MSG_MAX_TYPE
+};
+
+/* RPMI Linux mailbox message instance */
+struct rpmi_mbox_message {
+	enum rpmi_mbox_message_type type;
+	union {
+		struct {
+			enum rpmi_mbox_attribute_id id;
+			u32 value;
+		} attr;
+
+		struct {
+			u32 service_id;
+			void *request;
+			unsigned long request_len;
+			void *response;
+			unsigned long max_response_len;
+			unsigned long out_response_len;
+		} data;
+
+		struct {
+			u16 event_datalen;
+			u8 event_id;
+			u8 *event_data;
+		} notif;
+	};
+	int error;
+};
+
+/* RPMI Linux mailbox message helper routines */
+static inline void rpmi_mbox_init_get_attribute(struct rpmi_mbox_message *msg,
+						enum rpmi_mbox_attribute_id id)
+{
+	msg->type = RPMI_MBOX_MSG_TYPE_GET_ATTRIBUTE;
+	msg->attr.id = id;
+	msg->attr.value = 0;
+	msg->error = 0;
+}
+
+static inline void rpmi_mbox_init_set_attribute(struct rpmi_mbox_message *msg,
+						enum rpmi_mbox_attribute_id id,
+						u32 value)
+{
+	msg->type = RPMI_MBOX_MSG_TYPE_SET_ATTRIBUTE;
+	msg->attr.id = id;
+	msg->attr.value = value;
+	msg->error = 0;
+}
+
+static inline void rpmi_mbox_init_send_with_response(struct rpmi_mbox_message *msg,
+						     u32 service_id,
+						     void *request,
+						     unsigned long request_len,
+						     void *response,
+						     unsigned long max_response_len)
+{
+	msg->type = RPMI_MBOX_MSG_TYPE_SEND_WITH_RESPONSE;
+	msg->data.service_id = service_id;
+	msg->data.request = request;
+	msg->data.request_len = request_len;
+	msg->data.response = response;
+	msg->data.max_response_len = max_response_len;
+	msg->data.out_response_len = 0;
+	msg->error = 0;
+}
+
+static inline void rpmi_mbox_init_send_without_response(struct rpmi_mbox_message *msg,
+							u32 service_id,
+							void *request,
+							unsigned long request_len)
+{
+	msg->type = RPMI_MBOX_MSG_TYPE_SEND_WITHOUT_RESPONSE;
+	msg->data.service_id = service_id;
+	msg->data.request = request;
+	msg->data.request_len = request_len;
+	msg->data.response = NULL;
+	msg->data.max_response_len = 0;
+	msg->data.out_response_len = 0;
+	msg->error = 0;
+}
+
+static inline int rpmi_mbox_send_message(struct mbox_chan *chan,
+					 struct rpmi_mbox_message *msg)
+{
+	int ret;
+
+	/* Send message for the underlying mailbox channel */
+	ret = mbox_send_message(chan, msg);
+	if (ret < 0)
+		return ret;
+
+	/* Explicitly signal txdone for mailbox channel */
+	ret = msg->error;
+	mbox_client_txdone(chan, ret);
+	return ret;
+}
+
+#endif /* _LINUX_RISCV_RPMI_MESSAGE_H_ */
-- 
2.43.0

