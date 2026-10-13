Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2113.outbound.protection.partner.outlook.cn [139.219.146.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85AB471432;
	Tue, 13 Oct 2026 10:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888199; cv=fail; b=Mzlab6t1RJNDh0wRMMBWY6zMdzelNDyDi4wBqRxix9SOxM6oBp3ZeASyV71dk0EUVrS8fKEPwRGllpNMh83Agystq7blJ4mVNJYVP4pTN+OkjGrQTSkGmsQ29jfobMeXGiJiGCmPCBCZwi/noum8YmAnVTSN4zM9JBowSTzJOlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888199; c=relaxed/simple;
	bh=QcQSu1mnIlZPrk8Uu3Faz42x2fNYbGzMEj5orf157BY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=foSgNN8pd5i8DloAq04l1qJBZPDGgvcOj/vJQrArHeo42zZPwwSgoflUXmrgyqVoGtzI8cijgXDf7e6dNccK2pKTdmpltiV9BYn25LdkldaBIArtD3npUtzU3KkybkVyfMve0Vy/wtkqQBiyJ1gIje4xYqG97kZL85dt/CVHZkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiU8p+g8yBb0uBrO0vrW09DmjfHVUASQHwlaZJx0jLgcq12GfLSzri6UV/WFW/Yf1JuJKEMDXQSKxQ4foBCKwW85GVND+KqhkQiqv2+CmOxq4bg45dR48jfNKuJrqRVZt6REuHh3HOy/QETTcl2CtjFXE7kNXVN+hDCjKcp388QOda+RHHHC9qHGCc+YGZbWyiAmw63Qb7KGnqKlGqgwrWF+qbkZkCWSzVmJEGxJGXiMN/4/Rj0N+pG3irBW/EkV0kWfKUQmuuItHye1jKt5WZPC7neFdXsVhBwcMuzxRgXsK3vGZ72oBvw3Yh15dyKEtDMeyTsZcxKI+u5nQIARXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xun51H6Hs8wkodTe3PnaKo+c8L/r4MLjDymQAigNhBk=;
 b=Otv1rLbLK7OFuH8AA+0IVCJwLyrN1RXSzYfiJKY9/pYr1TzOehC8ywJp4x632+BR2GTwBLEmHfG16YuB/FCyNBEU9Bge5IiFq1Fdv8UpPecJYYT1JNLKiOIUW42S1pNLn5JOAygL9zKmn6SpdFjPXw9f4rRV398zu/iTvZDLdCO2pUQAGAz+ntbuOCXvrNSl7oSzmHc9RbT7NAy7h9pc24j/mbHChlmwBpYFtB9tUxpI5m5x9JfuC+ubOBZd7+CzBUxYyPbykw4wXx39jE/S4mB6nzTVwikbYLXMlw6OCq+ZQ/5eHkVqA0I+fYVIy1YWLPLqFcbo+POQz+eef35uXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1234.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 10:27:25 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.021; Tue, 13 Oct 2026 10:27:25 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 5/6] reset: starfive: jh71x0: Support discontiguous reset IDs
Date: Tue, 13 Oct 2026 03:27:06 -0700
Message-Id: <20261013102707.9207-6-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0027.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::20) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1234:EE_
X-MS-Office365-Filtering-Correlation-Id: 06e0af08-5cf6-4fb1-c65a-08df291492da
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|366016|23010399003|38350700014|56012099006|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	JtrbPvaDtYCjQ260xgdJrrWPwNTWaO2hahY8R8oXcnarEVj2JSWyH2xy7mvkemTr2YflonrSd+njvr0nLNP2epE34rYJB+ZbItrGOTlfSRTMdQCFC1krK8l+wtMJhxrbiR1MTBLDmCMVLwbAIgaoXl7hZFFvTA5uMndJDQjCBT8vYQ/U09EATJwscgvSNHN34VrUAuitEaJGulGaYr3N6rPfbfEKpUc+MxZlmf8LIvbezdq/np+wtV50pSCYMms3Vv3GHa7C16mgODS5Hngovyf4EmfJVPsojhD9ciXiLAZgD+21H4cRvMUEBYCnUB6ddCX76JzbKNtiQXpgd7Vr01PjNgm8vQBWkyerEe6vXjorSo0M5po/Q2gbaDLb5xednfu9PfBsLJDGeoyC8zkiM18Gs98daD5iUanodPW7+HbueuWZVnbuWsU3X0CBHBMwk6sP3NN1nUxaSmgCD/ghB1v/7d5JotWQmdZMfmePFQ8o3XDOYvRAtQuZhtPmIxgZdKrj2SfvBckFYz1k5uQR/afzIzq20a7Smp3G7Kmpt76Z+gftibb87lhHYdLf1PRY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(366016)(23010399003)(38350700014)(56012099006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?51DN+Zx1vqK8nZVrrRE83/s/aau/+1hpTde932Ds7ScrIsW9pAwEXxE9XjkF?=
 =?us-ascii?Q?W5MS52p6Ba0xnjos13v1Tmcu12kRGnInv366ZOmdZe3YhtwqxCf76vuPksOG?=
 =?us-ascii?Q?UXRYBdVgcXZ5MDw8+QdlMWFOKP+5GphnXB7AC06Jxgp9U+5myDtYpIqQMf0P?=
 =?us-ascii?Q?INlIAGxZIJus3zoAIghwQjRORih+01keIQLk+GUO9P8PmcTw572WoH/PSJaO?=
 =?us-ascii?Q?ZFjO0GT5uMqvTAXSimhchO3QgHBIZp2QBITKFW3YmxzFnDfJg7Cp5YH1BcBq?=
 =?us-ascii?Q?cvJy3KHn3Ugr37+2bIvghbQiQwgMLrLSNs6QQ+d/IpwFttRhJW9JqPH4h3AY?=
 =?us-ascii?Q?Fal8b6gjiJCE5wZp+wItEHD3c0Xoz0ODxLuEcpeCZTWVO2x2gNs0NKXGorFM?=
 =?us-ascii?Q?11ebHo15cRBITa8+R3MNxPTgAx2oLczGD0SsQFwh7cX06JIcweXM80UMO4gS?=
 =?us-ascii?Q?tXnPZLRLdlpYJgT4XFZ91Yfy/VUiWv1y4EkdfOSMT0OHvok5oVRQhtA28On0?=
 =?us-ascii?Q?MXOK2ku4EUCx/kknbyOCyHwZ4le9CohBqhJpEBbnbYWPQqPUKuFgrusnfd9+?=
 =?us-ascii?Q?UlELJ0Mb7KVR+HHBQS9ptd7srDuNqie2WaaMXyDegZl+yqL8OiNOjMyalCRA?=
 =?us-ascii?Q?ZczgSuC7Powet8t4hzcaNEWsC4U1IR1KcKYwdo/KWjfNSB8wmekLlNVUNGSj?=
 =?us-ascii?Q?mkm8Bt2n9WQBq2YOkFYENj9iNBRFBR8Mlc9vNcT6pJrza6KbX5mx4IdERH9U?=
 =?us-ascii?Q?IlT6lz+TGNCww2hTWQOISH9/mZpqIoDS+C+Ey7yHDBbEtVudtK07Ac2h6VEN?=
 =?us-ascii?Q?aIlloj396NDpxHzUzXkHLKLFibcoBcX+a6Cqb18rc8+oJVHZr+VOv57Gl7c3?=
 =?us-ascii?Q?phmmuGrlHpo9gbfxm7knZ3BpxGq25svd78ai78dalkBm7v4AQugxYIdkA0lF?=
 =?us-ascii?Q?HxuAILaXnLlJZHqp38RjKJ3OA+Re08Mch0X/S8ctbCjiL9VBqoOu9TqIIvIE?=
 =?us-ascii?Q?DsQvh5zAP6QXrHNls95oVOUZKFkUBangprJiQRxyPOmHNUAO7BszlqS/zcpB?=
 =?us-ascii?Q?Efd/PvVSxy7mOBNO1NQRhNhnZDR4LUtE28Ovz/7KnRFyxtGz080qKp7NycI9?=
 =?us-ascii?Q?81tVGIjNJcgq0VZ6g0EcfcxOyTPXzDbe+9MrXsAEL59gWPXHtSaiFns6hSXV?=
 =?us-ascii?Q?+RLKM2y4Xfl62PwHRWaoUkERfVzNUtWRMm5Y0FgxVq/K3/nz5vMPYipPEoNL?=
 =?us-ascii?Q?uvoAJ18sw80kew22AMyXtJi5QYs/G+rvbl7S+Fdk59wqt9TQrpwqNZ/KHnmn?=
 =?us-ascii?Q?5PLEFOdr7NKooXvBNUWNcgc6ROtYmq+cWhm41e5enipKo+rZrNHw5RHR0gEi?=
 =?us-ascii?Q?OZsO8zfAfckt1pT3fbwd3vESwoVuTjmYWS+UP4twCD3pMXX/n6hCfrmyU3cr?=
 =?us-ascii?Q?Z9dW111xPs7uhkAwim4HRApuv2Cch6MW30cSb33tVSHf4GgUvV2abMMENxSe?=
 =?us-ascii?Q?GYGkRLhfA7zbz8sfbyKC1qijdVxit2wUHL79nNFvMXfhgg2PhEZ8Egtkt/C9?=
 =?us-ascii?Q?CIU7BqeNjPlgLxtQCO/OZ5/A1Or3e8/vuIWUV4U6Pv7EQANpMPMPrCaaebhI?=
 =?us-ascii?Q?3Cj3XkBPYkUJN9HsGL5Xi9eZkfR39D2yGcElW9aTMcEaI71wkO96ZMTDxtXx?=
 =?us-ascii?Q?Fqj/UP41gm0xh6uU2P7IU3Iv3KbD7FpLe2kFqWw5iVZ6/qa66xlmcL0BeljS?=
 =?us-ascii?Q?bVCBKUGc36Kx6mOmLOiwC4+pN+B0IfGmfECr+9cmz6hlIhrUp1j0?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e0af08-5cf6-4fb1-c65a-08df291492da
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 10:27:25.0877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7xpFdvPVBnKXimgnEIz5Bjsvw45KNiUsJgwNk0C4anE3S3dDqo/tOvZ2Rh1EJ54YpdnxKW66vZdGtRDvSB0jy/+ycBnjS1VuFpQoONwdw1UiEyjMBwHP2anMn1JDBKuE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1234

The reset IDs exposed to consumers of the StarFive JHB100 reset
controllers do not map one-to-one to the hardware reset bits.

Add struct jh71x0_reset_info, which describes the number of resets, the
assert/status register offsets and, for discontiguous controllers, a
table mapping reset IDs to hardware bits. Add
reset_starfive_jh71x0_register_with_info() to register such a
controller, and translate the reset ID in the update and status
callbacks when a map is provided.

Existing users of reset_starfive_jh71x0_register() are unaffected.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../reset/starfive/reset-starfive-jh71x0.c    | 99 ++++++++++++++++---
 .../reset/starfive/reset-starfive-jh71x0.h    | 19 ++++
 2 files changed, 107 insertions(+), 11 deletions(-)

diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/reset/starfive/reset-starfive-jh71x0.c
index 29ce3486752f..fd1c755a0017 100644
--- a/drivers/reset/starfive/reset-starfive-jh71x0.c
+++ b/drivers/reset/starfive/reset-starfive-jh71x0.c
@@ -14,6 +14,8 @@
 
 #include "reset-starfive-jh71x0.h"
 
+#define JH71X0_RESET_ID_INVALID	ULONG_MAX
+
 struct jh71x0_reset {
 	struct reset_controller_dev rcdev;
 	/* protect registers against concurrent read-modify-write */
@@ -21,6 +23,11 @@ struct jh71x0_reset {
 	void __iomem *assert;
 	void __iomem *status;
 	const u32 *asserted;
+
+	/* Only exists in reset controllers that use the
+	 * reset_starfive_jh71x0_register_with_info helper.
+	 */
+	const struct jh71x0_reset_info *info;
 };
 
 static inline struct jh71x0_reset *
@@ -29,19 +36,40 @@ jh71x0_reset_from(struct reset_controller_dev *rcdev)
 	return container_of(rcdev, struct jh71x0_reset, rcdev);
 }
 
+static unsigned long
+jh71x0_reset_id_to_hw_id(const struct jh71x0_reset_map *map, unsigned int nr_resets,
+			 unsigned long reset_id)
+{
+	for (u32 i = 0; i < nr_resets; i++) {
+		if (map[i].reset_id == reset_id)
+			return map[i].hw_id;
+	}
+
+	return JH71X0_RESET_ID_INVALID;
+}
+
 static int jh71x0_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
 	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
-	unsigned long offset = id / 32;
-	u32 mask = BIT(id % 32);
-	void __iomem *reg_assert = data->assert + offset * sizeof(u32);
-	void __iomem *reg_status = data->status + offset * sizeof(u32);
-	u32 done = data->asserted ? data->asserted[offset] & mask : 0;
-	u32 value;
-	unsigned long flags;
+	unsigned long offset, flags;
+	void __iomem *reg_assert;
+	void __iomem *reg_status;
+	u32 mask, done, value;
 	int ret;
 
+	if (data->info && data->info->discontiguous) {
+		id = jh71x0_reset_id_to_hw_id(data->info->map, data->info->nr_resets, id);
+		if (id == JH71X0_RESET_ID_INVALID)
+			return -EINVAL;
+	}
+
+	offset = id / 32;
+	mask = BIT(id % 32);
+	reg_assert = data->assert + offset * sizeof(u32);
+	reg_status = data->status + offset * sizeof(u32);
+	done = data->asserted ? data->asserted[offset] & mask : 0;
+
 	if (!assert)
 		done ^= mask;
 
@@ -89,10 +117,20 @@ static int jh71x0_reset_status(struct reset_controller_dev *rcdev,
 			       unsigned long id)
 {
 	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
-	unsigned long offset = id / 32;
-	u32 mask = BIT(id % 32);
-	void __iomem *reg_status = data->status + offset * sizeof(u32);
-	u32 value = readl(reg_status);
+	void __iomem *reg_status;
+	unsigned long offset;
+	u32 mask, value;
+
+	if (data->info && data->info->discontiguous) {
+		id = jh71x0_reset_id_to_hw_id(data->info->map, data->info->nr_resets, id);
+		if (id == JH71X0_RESET_ID_INVALID)
+			return -EINVAL;
+	}
+
+	offset = id / 32;
+	mask = BIT(id % 32);
+	reg_status = data->status + offset * sizeof(u32);
+	value = readl(reg_status);
 
 	if (!data->asserted)
 		return !(value & mask);
@@ -132,3 +170,42 @@ int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_no
 	return devm_reset_controller_register(dev, &data->rcdev);
 }
 EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register);
+
+int reset_starfive_jh71x0_register_with_info(struct device *dev, struct device_node *of_node,
+					     void __iomem *assert, void __iomem *status,
+					     const u32 *asserted,
+					     const struct jh71x0_reset_info *info,
+					     struct module *owner)
+{
+	struct jh71x0_reset *data;
+	int ret;
+
+	if (info->discontiguous && (!info->map || !info->nr_resets))
+		return dev_err_probe(dev, -EINVAL,
+				     "discontiguous controller without a valid ID map\n");
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->rcdev.ops = &jh71x0_reset_ops;
+	data->rcdev.owner = owner;
+	data->rcdev.nr_resets = info->nr_resets;
+	data->rcdev.dev = dev;
+	data->rcdev.of_node = of_node;
+
+	spin_lock_init(&data->lock);
+	data->assert = assert;
+	data->status = status;
+	data->asserted = asserted;
+	data->info = info;
+
+	ret = devm_reset_controller_register(dev, &data->rcdev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to register reset controller\n");
+
+	dev_info(dev, "Registered %u resets\n", data->rcdev.nr_resets);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register_with_info);
diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/reset/starfive/reset-starfive-jh71x0.h
index db7d39a87f87..36f198139602 100644
--- a/drivers/reset/starfive/reset-starfive-jh71x0.h
+++ b/drivers/reset/starfive/reset-starfive-jh71x0.h
@@ -6,9 +6,28 @@
 #ifndef __RESET_STARFIVE_JH71X0_H
 #define __RESET_STARFIVE_JH71X0_H
 
+struct jh71x0_reset_map {
+	unsigned long reset_id;
+	unsigned long hw_id;
+};
+
+struct jh71x0_reset_info {
+	unsigned int nr_resets;
+	unsigned int assert_offset;
+	unsigned int status_offset;
+	bool discontiguous;
+	const struct jh71x0_reset_map *map;
+};
+
 int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
 				   void __iomem *assert, void __iomem *status,
 				   const u32 *asserted, unsigned int nr_resets,
 				   struct module *owner);
 
+int reset_starfive_jh71x0_register_with_info(struct device *dev, struct device_node *of_node,
+					     void __iomem *assert, void __iomem *status,
+					     const u32 *asserted,
+					     const struct jh71x0_reset_info *info,
+					     struct module *owner);
+
 #endif /* __RESET_STARFIVE_JH71X0_H */
-- 
2.25.1

