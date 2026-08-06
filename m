Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013060.outbound.protection.outlook.com [40.93.196.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB586432305;
	Thu,  6 Aug 2026 09:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008345; cv=fail; b=pw1AbBDseXyKphcc2qIvPAoJAbboRQhqtEXnWCR/aD0FzWHFJjXRUCmSz3uQZvlKcd/1Lq3TNajOpXwKjyUdgynkRuNlAIxAhC7FAQjUycOR1NIhxLbuXy8oqXug0cwxyM5Mzaje6W4Mxzg1ghwFNkhNI8legSnpJP9pUQQjw5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008345; c=relaxed/simple;
	bh=pzCoqlFfDU2onxCLMz4KKa0VjOPQp7lhanJwpaOvhIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PntS3QJ/lqPq5rxUBiwhBOOYtFNLJL7cQiviaA6OtY1z8yP4xqmx+mfHFK75EJxXGZarRwIhZp2HPpx5nWcAZru5J35OMyl/HOISNMkes0K4wMzf+ZHHKT5Tpq5x43VhO1GPZVPfwWWh/FODiq5YSCk3K8Wa7obTnQOx44oyQrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=shehD7jT; arc=fail smtp.client-ip=40.93.196.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="shehD7jT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8g4eidvZDU/ceznmqJMUMRVayUZHoO34qabmeMSLN/IEsnW9GjxBzMx4jpDfiKqcHbPdxNLnh86rXsZKrdg1hoo32XVM1bomhmj+4P6ozdYa8sGeuS41oPGAMYblBN8SYGkqHaXn+oUF9O2Fjanu3O4Aa6PX/izANuTcUn2kSWH3e1VsnsakoOCXizxwkWV8ivnfVCD2OEi93Hq1vGqcBq4hWY8XqAkKsXjzlmenl+ZthxUqrR3cSw0WCLKY4ToVT+RvXMXFmKhUQZD1JcoIJTzWwxgThLmaY/NhL6lOV7Wyr1rq9QZ1aSqT32nPXLQmhO78WsxsteDNp5Q4Z2GhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzMImuqhDarRn4QuScLUKIYWkMlw9/phGbEdm6Qv4EE=;
 b=F6lhRRN4WQzYbvN/AY7CBOpShkw8Lkz+d4+CGNHuZS25RnTpzl+ph6oIVCxIjPgrIFJuEDIj16vwmn1bwHItHLsEPxwBYSgMQ0O3GcO0HhxjuVaGr6EZkToZfTICKcCG9oPftomA8KCaOGbx++7YQRcDKaW4FI4CS2cOf3dkIryVQnjNtJWhav23oZsgaKLhxmooOastz2MGRytE7jYRW2n3E1c2GTMdmcRoGjAx7btkyDLJY48lLjiy7nOQayCyTludd1WxTRHf1xXSjzRa/4mE0M61yJZXCpp7AJaeoq6S/cOBU+jgpq2o0ovpsi2sXyLKDw3JKkSS2bFDdfW68A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzMImuqhDarRn4QuScLUKIYWkMlw9/phGbEdm6Qv4EE=;
 b=shehD7jTdJppDOLynHWNwiq0g4bkf7WogepbSUK6Ii9zSaRckb3a0SSXxoQNR8i9bExXhqD63idXoC3fF4Vsr8Gauu6qHKVSIJMhR1BhrKp01SicVpZiPwMEabzbGsnADUGQEAbfdQyFUIlrelNNIQiu8c5NG6KfzydlSj1NvCu6bLauPGZVA0Wk08sQOYbauzMAmvODcu8k2lwMzwFs8TcAhZlSWj/cvPy+iEJ7wMufULxs9uJOW0liYNOXEKKT7D/2Y+xLGIrci3UD2qa6XTpeb/DMsKxAsx1DuPnde7J7Z7gxwYwWBTcuH1T2Slw9oUVyi8Os23BdD4iqJuwXKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23)
 by CH2PR03MB5285.namprd03.prod.outlook.com (2603:10b6:610:9c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 09:25:37 +0000
Received: from DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b]) by DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 09:25:37 +0000
From: evon.chiam@altera.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Lothar Rubusch <l.rubusch@gmail.com>,
	Ng Tze Yee <tzeyee.ng@altera.com>,
	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Brian Masney <bmasney@redhat.com>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: altera: move Agilex72 DT and use altr prefix
Date: Thu,  6 Aug 2026 17:25:04 +0800
Message-ID: <a3de82b47b6b7638159d19c87da1e99e93fe2e7e.1786006669.git.evon.chiam@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1786006669.git.evon.chiam@altera.com>
References: <cover.1786006669.git.evon.chiam@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::32) To DM4PR03MB6192.namprd03.prod.outlook.com
 (2603:10b6:5:39c::23)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:EE_|CH2PR03MB5285:EE_
X-MS-Office365-Filtering-Correlation-Id: 143c569d-03b5-47ad-7e44-08def39caca4
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|56012099006|11063799006|10067099003|18002099003|55112099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	isDuP7L/EXYmIJh086kFSIhq2c3ck65syDcmZh7huzPtoTd0v0Ul9fH0cXnq5AfsOW9NHKdIBpqQ9qm8J9l1+qfQBwWt9A76+vu9QR4jiwVRDz56dCTKyQJT8kgY/JNbFelWcvKbo4l5ShQANuE+DO/MQaxSaORNVjLxy9GPOGQnm+KtLHYwroN/hP4QiDYHT+DNl1qF6JtXxs5INU7yNRVVsvOIhnyZe4sPT4VxmsMUMIzDCop5MWJsVZzkhkycesOPCvOYFGwzmz7cbVIDCkoqyE6QqerxBwkEiA2gMfkMX2Uddb71WVgEDw+lHT3QDInfhqCEVfTLPYEzVoF0LnIvEZyvpN0u5vEG7EYNF0icZk0mhuE7zPui/g0wkRgyGWywNOBMdiLA/NOeTqi7rCxhcCpUjPl3hl8leRDb1/e0SF8C0QsQESTfj3oVXaZ4PDEtUhOfOcvVlvoLQke61Zw+acM+uYogVN5CbFndpGUUokXtFm+JIzkOvFeWNdYN5ztzxeoQJRQGELfH6ujE67Hv0DmfNnLf3mVAskXJwXXUHSGEW2miwUUYUPJWVjW4zr9nB4lzZXeUNvhfUk4Rwgpt5drfkTc0Vj4uiRQbCptKrRNxgAY8Z9mGVq4OfhXnInulFXymvSdyjKSxZRjKErfdIdDRcAaRTJ9DDkPw7mU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6192.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(55112099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hbTh5YnEgUFxHlB6b6yEwXg25Ekpb2flxa5qVHAYd+rISfVQexLjHdBM2gm6?=
 =?us-ascii?Q?4cPmobvU9HI5i5yLTYcGyLE6lFxai3A1I1dSg4+kPAP57fZuYrOGXLBPMDEa?=
 =?us-ascii?Q?DlKZJym8dQsJNYs40qJtoD1CnCqvrt/k7bE46VN/HIT/xOsNkvmwk3etNrQp?=
 =?us-ascii?Q?8dwcxJkg6CH7nK+zcR3KfnU6hrFm2xwrOdeh12T/YJ3Du/+uwzFSSYLinBie?=
 =?us-ascii?Q?AC31x82BAPP7axJrA9tJUUk+9Ftw5GpLtlhmIgRceH2O3fOSXy2tj0f1YAHm?=
 =?us-ascii?Q?OybvXwNXPcgr3ThZ7ooDXXy3VuDg0vQD4vqEy3wmuvh9BlmshYGQPXQp5OIL?=
 =?us-ascii?Q?Rk+mDe5HCFrBWsf66uK4CD7RFTs3rCw/7jGYwyPz6WauEvV1K1uNIPKlQFMy?=
 =?us-ascii?Q?O6MajHa2TBgCBXOMqkEqMShXO95cz8GXx/BJQWCwkzW7+jHGd37CvpbD0YkS?=
 =?us-ascii?Q?WWVFNq7/XQrqFpfOq7LOBq5iM907Ea4l3mZI0nwAUfti3UqKNdHct55n6dtj?=
 =?us-ascii?Q?pEkJGjvWv7v5Cb5gStSgV3SFfxYg6Ma7JHaojATFO7SUf3xrip6tNfWsZW2C?=
 =?us-ascii?Q?TFRAeyHi8lVkv57hlUAOON6t5yui/o2YykfFDsDMJ66orw24DiWTSVqLxc1g?=
 =?us-ascii?Q?NbOq6GRn1d01W8ZXD3mNl2/OyQeucIA+df4deU+qxhqFUtdcHcDNJDy2JcwV?=
 =?us-ascii?Q?fa7SOX97IC8IU0p97jBYsLDjCBxZhKg5h/YLaHqkdS+tqOfQENVkAlk4OO1I?=
 =?us-ascii?Q?XqLtLWwZtVUjMzPQC061VH9TbmcmWR6qVCN033kawRgvWcuyHXM4gSlR/sGD?=
 =?us-ascii?Q?c+g+7gj9kdjo2D8u3OpTgq+pNG2wMhpGR9d9CQQ/mRJ7jfp4rR83rRcLl/jF?=
 =?us-ascii?Q?a8v9oIyrtyfHzEx+S6y+wjez6qGqjqWJTwDx8sDo5XAtlWn+J9kWy/XKpeQt?=
 =?us-ascii?Q?AvQefuB04ia5yJlnrP7pmcNq/ngvVeI6d63wwJCsKJ69Xo/iBrEO0HlRHN75?=
 =?us-ascii?Q?g9ta2VE7wIVMIWqit7e/QYy/zL9HEL786z0nSFjJuEE3HJR438ZRkxaZ2NVQ?=
 =?us-ascii?Q?5/5sasA5wfZ9gY1NJGA8WE1edUSRGjZbIW8jD01qsM/Dwj8V6+MDQVJS7Zod?=
 =?us-ascii?Q?4rsqhncQptYxD0fAc0bxKqgHZa5bFg+99tKthb33FZ0MYycP0J2t2cVb6uUt?=
 =?us-ascii?Q?3VJ59bplrd0vOVYogMcbN7oVfQJsc8WfjBqL4aVQuryTPrjoMK0UVZzkhGzd?=
 =?us-ascii?Q?QdmCDqnruLSh5eYDeSQeeX+1nYEWlV3T3VIelWDEN5mpXvgtucvZ7gzYZwR5?=
 =?us-ascii?Q?SSpW4tiDaXirMLSEH8/1Q4AOFj3X5Rz8FU+CZ3V2wfeLQ3u8O3lLruivcn1l?=
 =?us-ascii?Q?cWWe/1gB67G7GKqKYeRzCv0Qgm2/NR1IVGji1YnNNxrZhCOjTJyXwUemsdKk?=
 =?us-ascii?Q?emha80DMUXg4mvSt90xQ4Df3zzqSKj/HB5FDpAQJXeSYucWRJuCUwku7/F/9?=
 =?us-ascii?Q?IvBqsPpQTm8etOihqurHvOnEkoGe58FDWyAr8xWYwlWGD61cdvnZ1ynftXBF?=
 =?us-ascii?Q?B8QCbgRgUPi9V5BP0VMC3DjkyBhw1pSBHcCZSIWSCbecwg5l6X0rf6t016V5?=
 =?us-ascii?Q?mOd9uNchoX2c0ZiB/RoDtWBj6bphdi1WV1raMKU1uNuKxpyD41DvwgWJicPj?=
 =?us-ascii?Q?sz2ym3ru5fOTBPAMIy6KmEaB3HjLbAXltb3u1ltWqu5QKOgAGihVWrjo3q+E?=
 =?us-ascii?Q?BWG0ELbuew=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 143c569d-03b5-47ad-7e44-08def39caca4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6192.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 09:25:37.2785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQtHk88BDtZ0hrTNFVms1/3xl4lOFk2f+l0Zf6DMUJsWosUzUbKnaezzt5RObDuoNE+7HHRUsbDSWfTudlT7cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5285

From: "Chiam, Evon" <evon.chiam@altera.com>

Move the Agilex72 SoC and SoCDK device trees from dts/intel to
dts/altera. Update the board and SoC compatible strings to use
the "altr" vendor.

Signed-off-by: Chiam, Evon <evon.chiam@altera.com>
---
 arch/arm64/boot/dts/altera/Makefile                            | 3 ++-
 arch/arm64/boot/dts/{intel => altera}/socfpga_agilex72.dtsi    | 2 +-
 .../boot/dts/{intel => altera}/socfpga_agilex72_socdk.dts      | 2 +-
 arch/arm64/boot/dts/intel/Makefile                             | 1 -
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex72.dtsi (98%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex72_socdk.dts (84%)

diff --git a/arch/arm64/boot/dts/altera/Makefile b/arch/arm64/boot/dts/altera/Makefile
index 540bb5ae746b..a1a9ccba5334 100644
--- a/arch/arm64/boot/dts/altera/Makefile
+++ b/arch/arm64/boot/dts/altera/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_stratix10_socdk.dtb \
+dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex72_socdk.dtb \
+				socfpga_stratix10_socdk.dtb \
 				socfpga_stratix10_socdk_emmc.dtb \
 				socfpga_stratix10_socdk_nand.dtb \
 				socfpga_stratix10_swvp.dtb
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi b/arch/arm64/boot/dts/altera/socfpga_agilex72.dtsi
similarity index 98%
rename from arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi
rename to arch/arm64/boot/dts/altera/socfpga_agilex72.dtsi
index c29c2afcaab7..354c775f577b 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_agilex72.dtsi
@@ -7,7 +7,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 
 / {
-	compatible = "intel,socfpga-agilex72";
+	compatible = "altr,socfpga-agilex72";
 	#address-cells = <2>;
 	#size-cells = <2>;
 
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts
similarity index 84%
rename from arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts
index 998f19f492b3..0959850cff66 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts
+++ b/arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts
@@ -6,7 +6,7 @@
 
 / {
 	model = "Altera SoCFPGA Agilex72 SoCDK";
-	compatible = "intel,socfpga-agilex72-socdk", "intel,socfpga-agilex72";
+	compatible = "altr,socfpga-agilex72-socdk", "altr,socfpga-agilex72";
 
 	aliases {
 		serial0 = &uart0;
diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/intel/Makefile
index 270c70fdf084..088a03b89c99 100644
--- a/arch/arm64/boot/dts/intel/Makefile
+++ b/arch/arm64/boot/dts/intel/Makefile
@@ -8,7 +8,6 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
 				socfpga_agilex5_socdk_013b.dtb \
 				socfpga_agilex5_socdk_modular.dtb \
 				socfpga_agilex5_socdk_nand.dtb \
-				socfpga_agilex72_socdk.dtb \
 				socfpga_agilex7m_socdk.dtb \
 				socfpga_n5x_socdk.dtb
 dtb-$(CONFIG_ARCH_KEEMBAY) += keembay-evm.dtb
-- 
2.43.7

