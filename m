Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazhn15012014.outbound.protection.outlook.com [52.102.160.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEDC50129F;
	Tue, 13 Oct 2026 14:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.160.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903149; cv=fail; b=DKxksdDYIpuZJSPAJ3P2x2B4g3DaIlYtdE+J3dPRyfo6l4DMJ9fajyvRD7NWmdZrtJk85nPdVuH7EC26A9X6yz6+OZOUjMOSXhLnLhMdDGtGaCVASzJ02hMKM09q5H8eKD+eeJBQVK+B7P6deVI6RiGw76DcYZmMic5JrTC2Tis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903149; c=relaxed/simple;
	bh=MtfopWukNxpEWJB3YCz7657c5C6Yyerewfbw0Ikp6/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=uOCEYFMmAWijqo/r8547Xijm2HzLgwuF1+NMf9MZqFLknzxWascVnTy2YQlTphUU37EWzIl37p4di00lE/MmfgHHbeMJizv8lGCBierDynQidcWrkJwj6vVT2bHKIS5UvBfNgpBhkJJZo4cm0prpJWwmKwJf69v8eOXXIxSi+ms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=SCLczF1B; arc=fail smtp.client-ip=52.102.160.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="SCLczF1B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K59DSzKe6JBwaDg1dI2FgK96qt7bb5sEPm0xj33NlphueLduiOIBGxuGpAcnNl16assV3FXGDYTrME5VrCKlkSvm4oQkQ83b0MMduqTKjq2iG7vWsle25ijnLQWfEqS6LEHojxP0lg8Thdq5QTkV0HjnV9p3XtisEbuoLPdUIVV+Nu2iiGggtzy1582io/bLMp++mGWiKcCSgFdy6gEXLEm5HcHj1J3tR6Xlud+WNxGaDim+qUzO79sdy9ztXQa+ATIbbWUbCfd8aP9TmbXSvSMxt5acfqz69GSMaHoUUVJuvx3eGckikCnLhqJzhRa2TBgMe1cCEFGCdVBaDI/jrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6swCKV+567F4AJ45MeO0F9cZgftEUwqUwYgIFHLoE6Q=;
 b=J126x/UDGzaNOQ1/7pyDlyuONPTYF9oFbGXH9UqiCPERCPHehqePUHXM8NWtbkJRR6833+nXxvcU8Svhh6aBgXY1FlyQzv5x5+WVKkAwDKJqmCBmiIdX1BtLJ6wZMZyIEthwPuIth31mxrwENqPF0djx6XRJqFcJh+cBrm2Vc7lvYZfCgDSOYL45UgX1z2EE5CBmb3M3MaKpa2ed2igTlmxCLq4IVMzWZdmyGRPVKHm/z0I1wx3Xmzf+E0yqQijFxLOJktPHZ268uI/jMx6TG9ySyrYkUuDgWJL6z2F1Cl+tbZv+WwQv/ZrmdGkNcTXAkpclMIkwJqONr6tPvHs66w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6swCKV+567F4AJ45MeO0F9cZgftEUwqUwYgIFHLoE6Q=;
 b=SCLczF1BYcqn8NtRUG1PXSG9DiCy/hkXVr5UMZGjilSyl2SIgdNWn0eMsohmjuEoNTLkkB5y5By9/Hb3PXzid3olLxqGFpltMQpYHwmOJRRcctY9kI1xvGKaHTAlPcjCg8tNsLHriZ/xVF0cNQgp39wOnfXn4zZicsUKkZLySn7Z17Y8LFFiIVipZ/lRGB9hW0JoFVTdyiQTy2hM4GXiIaWxpQF4I2fK9s6JqLesKdJh99zXzzq7jHKMwN48NbfOj4ZdXNSQsc3ZrHM64MY7yovug24sswrbDboJ49zSMUXpEKIQchJXR5KZqZqO2oBaRYUXiOluUshaecbVabNQKA==
Received: from BE1P281CA0199.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:89::15)
 by GVXPR10MB8661.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 14:52:22 +0000
Received: from MI3PEPF00008551.eurprd05.prod.outlook.com
 (2603:10a6:b10:89:cafe::19) by BE1P281CA0199.outlook.office365.com
 (2603:10a6:b10:89::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Tue, 13
 Oct 2026 14:52:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF00008551.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 14:52:21 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 13 Oct
 2026 16:52:47 +0200
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 13 Oct
 2026 16:52:21 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 13 Oct 2026 16:52:14 +0200
Subject: [PATCH] clk: stm32: add support for reset_control_reset()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261013-ups_reset_control_reset-v1-1-f8a6c7f6cc3c@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAJ1FzmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0Nj3dKC4vii1OLUkvjk/LySovwcCE/XJNkozTDJwCIlJc1QCai7oCg
 1LbMCbHJ0bG0tAA3Pwp1pAAAA
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-clk@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791903140; l=2794;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=MtfopWukNxpEWJB3YCz7657c5C6Yyerewfbw0Ikp6/I=;
 b=A3MQKHu0hhQGoo646gMASgU75jTdKE4XGvDUgPY4DUpoT55+aQnRQPHGHltBdWq4CHSJHc+RO
 3B8QWBjDGaIBHkN+eReoqJcGo8odq7OJkRY3QiixE1fTN1jtqHiRvwn
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008551:EE_|GVXPR10MB8661:EE_
X-MS-Office365-Filtering-Correlation-Id: 5493646a-0f3a-4813-84bb-08df2939963e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|34020700016|376014|82310400026|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|12100799066;
X-Microsoft-Antispam-Message-Info:
	Bvuz3+/24MAe7D21KA8vz6ZX87RdM6R0SNWmjBSNw1jQOIyao3sDEYdpQi6IEZi0tBTI3mTUE7PTmaFQN9XcGqYcPEteHtZ2gygj5qfGnXtWCkotinvFZLEcKnl38FkZmIAFcMN3sLyhZSvkRpDv9VKsdkOc6AUV6VNJ4jUEY3yC9aWki7WWOq7maTO8Ks9ccnr8N0hZXRaqMPx2uNVflQ5EYWLOPfvueyG67AjKE82sS/7sFdv8q+9lmogPl+CJg5YcT5TpXEvK1YfqrtT61fEIDERfEjrQQQI1/h30L/jDFlhjkoRz8FdceH0Ugi2exDY9TLgWHQqpblN2cQV1kSiEz17AMeoxSV5VRGDc4h43DPBe5lTLoLCKEWwjz3Z3mSKlixrvY72foiYNLGCUNhgGwNqpNcy/1YQ8GXd8Z9cuDGZ2lBE3YcERUmOFHLZ1JWcDpizjxBW6cY+r5rau5H0c5uQX37pFnLCpkjM2tBgEZ3/d0EffD1Q4wND0+MMk7zJz8qhBC+noJTNTS5OOzCkOu+LHRkXsFwxIDlB37lzsH30YZewtkEedosq0DOgcf0BbfCy/TI9qZAhNJ3lX68Sg3JhiIXyc+n0qZ0kpM+IOejSfGjEFX6Lp7wWA7h0k1Y32tpkIFjlq6phSY0ub2uxXnUQyn34k9s2Hp6/M596Tm5UUeg14zWlocrU30bTwCKjh5UTIkJ8VjjQ6b6djKQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(34020700016)(376014)(82310400026)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	a1g6pyfW2UnNM01c84R1IPbAC8eGOM10Kz3Faax5Fu7U9v+WD0RJXffxeVr0Y0Q9icm/N1FyIemnZu4z2nG+ZsRDLUeFhaHrnZE+L2Tz0svb+rvrClhJxryPQ61a9CSMBwP3sqoYW53xEAXNbJTElx2P+RBt1F+8YkqPn2wvr8+nd7YkZQYon08ykA8PK83TkgBlrFUNsgKx4gk52U74nZtLOv5xO9DxEK/fpXBPR7GWXMY76zSLdWWxWJGtNecqEwbQww+uKeI7cKedLqnCa0G3wadP0xJ94px1JNPy6dMt8QBGhXxAGOn0t7YTS+EiyZajJeF6EpOdGN/yfkq1MM8yfLnWUiMB9nDd2hTxQNQ0hW3MmQzuNaRheB7KS6GQoPKPlR2FHNPW3aEJNBYcPw3caIdQsQR92uWIJNsNhxLETsboKd15mB2RAgKbo0xE
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 14:52:21.9838
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5493646a-0f3a-4813-84bb-08df2939963e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008551.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8661

The STM32 RCC reset controller currently implements only .assert(),
.deassert(), and .status().
As a result, reset_control_reset() returns -ENOTSUPP, forcing consumers
to open-code the assert / delay / deassert sequence.

Implement .reset() to provide the standard reset operation and avoid
duplicating this logic in consumers.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/reset-stm32.c | 45 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/clk/stm32/reset-stm32.c b/drivers/clk/stm32/reset-stm32.c
index fc237fccae68..9b853417e9c5 100644
--- a/drivers/clk/stm32/reset-stm32.c
+++ b/drivers/clk/stm32/reset-stm32.c
@@ -4,6 +4,8 @@
  * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
  */
 
+#include <linux/delay.h>
+#include <linux/iopoll.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -13,6 +15,13 @@
 
 #include "reset-stm32.h"
 
+/* Hold time between reset assertion and deassertion */
+#define STM32_RESET_ASSERT_DELAY_US		2
+
+/* Polling of the reset status bit after deassertion */
+#define STM32_RESET_DEASSERT_POLL_US		10
+#define STM32_RESET_DEASSERT_TIMEOUT_US		(10 * USEC_PER_MSEC)
+
 struct stm32_reset_data {
 	/* reset lock */
 	spinlock_t			lock;
@@ -119,9 +128,45 @@ static int stm32_reset_status(struct reset_controller_dev *rcdev,
 	return !!(reg & BIT(ptr_line->bit_idx));
 }
 
+static int stm32_check_deassert(struct reset_controller_dev *rcdev,
+				unsigned long id)
+{
+	struct stm32_reset_data *data = to_stm32_reset_data(rcdev);
+	struct stm32_reset_cfg line_reset;
+	const struct stm32_reset_cfg *ptr_line;
+	u32 reg;
+
+	ptr_line = stm32_get_reset_line(rcdev, id, &line_reset);
+	if (!ptr_line)
+		return -EPERM;
+
+	return readl_poll_timeout(data->membase + ptr_line->offset, reg,
+				  !(reg & BIT(ptr_line->bit_idx)),
+				  STM32_RESET_DEASSERT_POLL_US,
+				  STM32_RESET_DEASSERT_TIMEOUT_US);
+}
+
+static int stm32_reset(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	int ret;
+
+	ret = stm32_reset_assert(rcdev, id);
+	if (ret)
+		return ret;
+
+	fsleep(STM32_RESET_ASSERT_DELAY_US);
+
+	ret = stm32_reset_deassert(rcdev, id);
+	if (ret)
+		return ret;
+
+	return stm32_check_deassert(rcdev, id);
+}
+
 static const struct reset_control_ops stm32_reset_ops = {
 	.assert		= stm32_reset_assert,
 	.deassert	= stm32_reset_deassert,
+	.reset		= stm32_reset,
 	.status		= stm32_reset_status,
 };
 

---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261013-ups_reset_control_reset-4c2f1b08ddf1

Best regards,
-- 
Gabriel Fernandez <gabriel.fernandez@foss.st.com>

