Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC7C25743B
	for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 13:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970848; cv=none; b=ZHB33BAPCVSxncs9kiR8PXYK9/cgrEOy+o0j86D3BktU4Mr1J9f/9LufxsMYGKWw5L12gOTKIdp2QOLk6vVvrx54iw9aAtO4vGAEX96Wo/cdTB7AoVTlwsXWMVZtx50Pr0f0/SSR7GmjmdzqqC9Py8dO0au2GUvIXECi0B03Oqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970848; c=relaxed/simple;
	bh=fGqVQoSMtVhWWQ8PabUdTWFq2jxdAG0U6q3YlMVbkic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IAP76jr79TbQEjlWnwaZworkiPTePtZZkNRow6fZpFbP38PNlIwHoJFIbK/k+vwMjVde5zj2FSSKUOWZB/PsMJoarKNh1c8qI1VSzh083GGHxQjolp5+UW5LiGqa2q6HNFkTS61b25inXSLcyR4L/Ok8cHD/7ZT6jl8IbQ9mdy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=U7vlR//F; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="U7vlR//F"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-879d2e419b9so2991652a12.2
        for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 06:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970846; x=1747575646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=js2wRDvj88k2TI/SLgNG/xNXCEurcccQBWfML9QlriM=;
        b=U7vlR//FeIL2tb/qckD6Bbbeap6k6uP4isvIqTls/AE+IisHO4zU/Nh9TmfNs28INu
         QE9wZ5T+tj0+sC/q/2crMnp5U0sDL3R/3thra29vlbRDgI6EOmcfkYYbvRMk8CWVMOg5
         dXRSOrCPzhqdHUZtizeg1T2DmvyJrhf4nQsH9W4po0cUotm3eIT/ymttmz+yCIFP1t+a
         qkBT1+nqtYLHeIsMOq2rTfUm1pAO1NOVUTocUhsW+KJII/WgrwVHtBVlHEtiacnte/xL
         Z/t6riAlILKIgVFC9QGr4Idf6i72iHusesy/bnzysk19/zHUkXMZF+fK0rpcH9096BJL
         WYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970846; x=1747575646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=js2wRDvj88k2TI/SLgNG/xNXCEurcccQBWfML9QlriM=;
        b=Z5VMR/6wbm7cBh5dZUCcWKP+x0u9w/7We0g5mA0fDkptNMyhsPd3iPjq8WtZCze3nW
         d4U9JJmTVqlrA0jlCdYR8Po0V2C/k/Mc4xhNPUWWl+K1wSiZlBGRMOwpKPYz+Fvt+zTy
         qWPIWPi9Z8QatftTFauvz3ASPFpUHLcbJP9v/xn3Y8zTimCGcBndvI26clu2AM5lhyLm
         Ekm4kZEvccrqFMzd08snHHvC+qgEoaASOUjPsqu6pD3NozA/r+I1FSNhb/z/5ynUvt6E
         dZWJOnGlwM9UHrndSZoacBZ5gfozd9K4HdWC0nvMxvuCN16jrFrN0o+PJq7tHp+jbgyZ
         n7QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDlX7G/MOLUGP8d/wv7CcbegggrDPhqewTuzD4uztIdG8sFxAduM2lm0WY+fyQX+VHABATbQE4BuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTXlYKYN7GC0nduSBGC0clhZRG4DOcyQG1iJdgsw7dVJ08AZnr
	/K2aEV0Ci4yMwUeUf9i2nayuzs7L74w6YsVZI3jI9GFlS/1L9Il0XI5tc9OLfhM=
X-Gm-Gg: ASbGncss2E6qBcYm7MHjPADZCvCZ/XzxNhZThXa3Ad9igszEfeL9qTBzecZ2Kz96kN4
	rTBkELhIIMlbF481C2urCK3SSfLsIDA/4CKHuQvNGA5PmZDL+0Yq0v82j7I87hT2y3ZDT5rWFRF
	D6V24eXpXIbcb6p4twIL9sMIiGr/qhn0Y24lw28NespReodkb4wOuDJR9OXvVy3uSoq3cEMuDL/
	ABPqSeEhg4hCyF/MZtNeXohVN03AKEk3CKOHhw0MS1KgGTYjkl98OKhYFEKpAEf/jL5UU1zZTFf
	h0TgkeqVlL4d08wzHW/6UMYbkEnPuJaVOanoFHbwrFd7jaenxQb12OsERfW+vk5pEQ5uo6BeEPi
	zSbeYol7/z4ssUwIabm+Xeyb0
X-Google-Smtp-Source: AGHT+IHLlMfSVXjF+6NDGBGAmnvE5gBr5aeqANsPZFqUbeLJWT/B3Zg+fBKVlL1+nLWsayoo+HUozw==
X-Received: by 2002:a17:903:2f89:b0:224:1eaa:5de1 with SMTP id d9443c01a7336-22fc8b51ac5mr118165185ad.18.1746970846131;
        Sun, 11 May 2025 06:40:46 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:40:45 -0700 (PDT)
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
Subject: [PATCH v3 05/23] mailbox: Add common header for RPMI messages sent via mailbox
Date: Sun, 11 May 2025 19:09:21 +0530
Message-ID: <20250511133939.801777-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
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
 include/linux/mailbox/riscv-rpmi-message.h | 206 +++++++++++++++++++++
 1 file changed, 206 insertions(+)
 create mode 100644 include/linux/mailbox/riscv-rpmi-message.h

diff --git a/include/linux/mailbox/riscv-rpmi-message.h b/include/linux/mailbox/riscv-rpmi-message.h
new file mode 100644
index 000000000000..77e1edc569ac
--- /dev/null
+++ b/include/linux/mailbox/riscv-rpmi-message.h
@@ -0,0 +1,206 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Ventana Micro Systems Inc.
+ */
+
+#ifndef _LINUX_RISCV_RPMI_MESSAGE_H_
+#define _LINUX_RISCV_RPMI_MESSAGE_H_
+
+#include <linux/mailbox_client.h>
+
+/** RPMI version encode/decode macros */
+#define RPMI_VER_MAJOR(__ver)		(((__ver) >> 16) & 0xffff)
+#define RPMI_VER_MINOR(__ver)		((__ver) & 0xffff)
+#define RPMI_MKVER(__maj, __min)	(((__maj) << 16) | (__min))
+
+/** RPMI message header */
+struct rpmi_message_header {
+	__le16 servicegroup_id;
+	u8 service_id;
+	u8 flags;
+	__le16 datalen;
+	__le16 token;
+};
+
+/** RPMI message */
+struct rpmi_message {
+	struct rpmi_message_header header;
+	u8 data[];
+};
+
+/** RPMI notification event */
+struct rpmi_notification_event {
+	__le16 event_datalen;
+	u8 event_id;
+	u8 reserved;
+	u8 event_data[];
+};
+
+/** RPMI error codes */
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
+/** RPMI linux mailbox attribute IDs */
+enum rpmi_mbox_attribute_id {
+	RPMI_MBOX_ATTR_SPEC_VERSION = 0,
+	RPMI_MBOX_ATTR_MAX_MSG_DATA_SIZE,
+	RPMI_MBOX_ATTR_SERVICEGROUP_ID,
+	RPMI_MBOX_ATTR_SERVICEGROUP_VERSION,
+	RPMI_MBOX_ATTR_MAX_ID,
+};
+
+/** RPMI linux mailbox message types */
+enum rpmi_mbox_message_type {
+	RPMI_MBOX_MSG_TYPE_GET_ATTRIBUTE = 0,
+	RPMI_MBOX_MSG_TYPE_SET_ATTRIBUTE,
+	RPMI_MBOX_MSG_TYPE_SEND_WITH_RESPONSE,
+	RPMI_MBOX_MSG_TYPE_SEND_WITHOUT_RESPONSE,
+	RPMI_MBOX_MSG_TYPE_NOTIFICATION_EVENT,
+	RPMI_MBOX_MSG_MAX_TYPE,
+};
+
+/** RPMI linux mailbox message instance */
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
+/** RPMI linux mailbox message helper routines */
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

