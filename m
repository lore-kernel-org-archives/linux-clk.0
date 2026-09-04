Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012032.outbound.protection.outlook.com [52.101.53.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D613B71AC;
	Fri,  4 Sep 2026 03:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788492546; cv=fail; b=ZNc+PPHRnJB5G36nfgOhCY6DxpfiLkP5tRKs8L4rVQF2kyg21Seije7u4tOSNM9tF/kRvXsGVMcItVLfzBnPLZUAef0tb/d91b23xpSU3gIpQxCuYwZ4YZkzuJ8r+vpTliPtqmJs/VrGxV6uhtzN/qzYisRaFLSYuf1kp98uj2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788492546; c=relaxed/simple;
	bh=Gu4Ljd7QBKrEfMbSD+HOTqj8JDyqkOzlFzzz+Z7H3qo=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=JN2GSoelN+ln1no6x29cyzLaH8HMnMgpVLLqWnWTFptLqSokwM2Izkn768j4ZrgNzzjJBy2+/PiI3z+9dIGAHeP/paSC6spj+HybEVPEDAz+SwH8BeMQm6+UJv/UixYHnfS/w2KOJYD6h8nSd4ztYeKkypdjKFJCJY1/EMlGnOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=OiECqC91; arc=fail smtp.client-ip=52.101.53.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="OiECqC91"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m7yYU7KdsNwCnQrsu884skPwViblMNGu21OR/VugUv274iI0VywvT3QacMOxBBQwiQo/u33sQNW1Grib8cER40zYzC4nZD6ZBmHDTp8d+vCIUpNZVPQTaCk6oCOSjqlpkBpMolw229+HcbmaHdhw96qrFanXNP1fwrZXN7/oqkfLiaKnuQmNzqo5TEDliDK/HXewpk8cOZjWYa3L3K5COGoQfMOBAiAE9TCFJQj5oEHxnrSq9dKLsP1lcGjyBV32t5e1unNVeqk6q2L6G57Y+3g4iWXvkn3/KXyz+njIbnbGDsT3BeVpESo2ijqDKj5yUKcG1wRdtXOqVngsf8lYQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WS1msHvUKJ07kpL+KD/jy84mu21HNZfe26hgOCUSyRU=;
 b=uKT6rcPRQX5RTG9WUISepdN3QVIiiAOEBD23KZMCYiAzXCSkilrRfJoid+NrH06CtJPOQGpGZh9509xda6J1nlX5nwOGlltI3r2O0lxLWtn4WsX8008lzE0r5uu74oLFGklC7ChQmaVRE5R5fyP35EDd1bmpBdu9x58B8GqCXj8Hm+MdK84WjTkHHxxD83EkfEh5SAvAsL34iWoX88gfnwacdvU6OD5vqY0n2+Ji8zdm71wMEP6UgGcyJlwT2rdBM/2KgGC2rBxJWM8CJfpcMrMqUhNRnHMZEmF9lfnEQ32kN2pA6qCn9x7EyqVaL2BMvrITy+rdDA7rKqaigy0njg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WS1msHvUKJ07kpL+KD/jy84mu21HNZfe26hgOCUSyRU=;
 b=OiECqC91DPkBQy8DxedMmB/qtvaFt7ECJ++v2KaNR3CnmbcMzeiCFNZmQisIXqFEzHqAY07FpWXJRIEwxTu8jHMJBBtkXmGzpstZT+ozwfNrKsxnP8H4TrD6izSdM05P240MpHKbL8EpPK5YNtaxN/aoeN1wIlnXsfTZK+nLoIJp98HQLJVff3GsDkOrZ3h8M9MGjmMVdfSKfuM1MiBWteBWsqq8Kgl+rAtQ+P4TBbQon5h3OY+KYRXAMm6GiurHt1a5JBUj90hwILwSg6GkAmz7fZcfssxEsuhMeyQz8WkrO1S3vo01MMlZLLzPG9pWtzDhJGra/iNHDFqL1zrR+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from LV8PR03MB7398.namprd03.prod.outlook.com (2603:10b6:408:18f::13)
 by CH4PR03MB7698.namprd03.prod.outlook.com (2603:10b6:610:244::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 03:28:58 +0000
Received: from LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982]) by LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 03:28:58 +0000
From: genevieve.chan@altera.com
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2] dt-bindings: clock: agilex: mark mpu_l2ram_clk deprecated
Date: Fri,  4 Sep 2026 11:28:49 +0800
Message-Id: <20260904032849.10554-1-genevieve.chan@altera.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To LV8PR03MB7398.namprd03.prod.outlook.com
 (2603:10b6:408:18f::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR03MB7398:EE_|CH4PR03MB7698:EE_
X-MS-Office365-Filtering-Correlation-Id: f1bca1d0-46b9-4abd-fe88-08df0a34a7b9
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|921020|10067099003|56012099006|11063799006|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VWahQ/bLwPXaZtIXIgveFUA5CwCxKNrxIkGtwCIB3/KXDeX93qdd/mv2QE3k7MrF0teDAAYGmmbt4PhSAMGfZu8jxK3wwswTuGjmpse5W90JRxoSCDI/aQZJQNdGqoGF6Q8ziv6yhgSt4dPID0o3zIlARTdAVtk2zT0HzpGU2u1aZGg3EQsOrO5QtaJ4Q8vl0Biv3G64+/H+NfUkKBQSFs7yp2HX2fJeZESF1NfL5TO/r9S7JjQL0Y73er1rOkd0fCEhdkZZ0oD90r7JgUKJRkzK9d8fP5kL1k1298iR/ChdWSndySBpGPIy2P2Nd7D3PLRS48jDS+1cn5pbmUOvCTmm3pzp4hDuYxuREXgPw9S1AQkHetUw+Dnvow0buL3kY4eEFBVq8VSrm0CEp1TGusS5SBI1Y+gfOK8/XWbLrqxvlx8yZc/7Apqag/l96M3XHUUVDFof9BX/Jccehtvgef1Jjd/VO8Sv5LY8rZr0e7ulhpEsXWJQM0nNJuADrPQPhQ6zxfsQljZHHKJpggnTK/L33OCnj+dcSY3J9pDFnrPUpVWqw+v3hvMxCmP3KdpylxcVlN0VRp6T8TVkUsXjPi2V9R21PAbJri7rhTDZ47eGeS6vML++thHyRRMgNxWvu7TeooYxTgTszfwzX5PBXBuxnp6orfCWO1/r7P7DzUfD9hWG8r33p3ni8eZajJdMH0Yl0onSnlNxwbYIrkyPqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR03MB7398.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(921020)(10067099003)(56012099006)(11063799006)(55112099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3PvxzVWXi8IUjazPPknawnpZqF/dMz5jOoaFkda84Rtj+sNeYdkuH+8HW2fV?=
 =?us-ascii?Q?Jnwm9vlSwUdxbBfl6SlXg4QEgkB9c+O/MZZGa31j6Fh/A4qhL0XHF8FL5TI0?=
 =?us-ascii?Q?D9999NDZrKwTUWwco7rKsp05nquVMMLbeknwRVJYXKCtEWiMILdqmROSH5wn?=
 =?us-ascii?Q?+QTG0bTFIxMFxr8tGK5hCIGjagAwgupfWdpIXb5+Gj7MSCvMFBajG/CEl2tk?=
 =?us-ascii?Q?TEY1eO7nvifFB3E42jZvwXDDKXjR2+ICSxNRcLggM3jSUPRomhj+tveD1DDW?=
 =?us-ascii?Q?xYrAgxfmJlRO8+azzh/VjVWAQ95/keZNKCgY/OzTidmVFlWShvZG3SIElCZI?=
 =?us-ascii?Q?LAE0DnL7iKG8/ERX8YxhBMav1/6a7eDlyGUYS3YgPKSewCt1xJq9QiAc3HyR?=
 =?us-ascii?Q?1GPA/KzwWovphk7lLN3ttGzaXxuWDHfEYpdqU4oCQdxoDtx6Jy7eEcB6rxOF?=
 =?us-ascii?Q?6/5nuvVSiMuYSxEYJbum/OZSP4QVlSaAySyP7yiU9yL81lQGrr1nb0EUlkcF?=
 =?us-ascii?Q?5wcOtn8SbonxVCjlnuvOZUE3ELKbt4mAxEtN5w+ZRdBCNicNLhyAGe9ca60W?=
 =?us-ascii?Q?1Jc1X4D2ierYg1icg+CsNSr3SAlPdszmhnwfn9y78e51Kx6xgcaPeI44hZFu?=
 =?us-ascii?Q?VxQzP0rpTJ7gdLDU+upi7TvHpdB+4W8TjBMtzscvs75E+xnQ7FqAFZyn9Et9?=
 =?us-ascii?Q?pmXHzJoSXgvIiP4eXzIqFrQtNTtTzs2lpwyNAtONnpH2VE/rgQS1gF98Ebeo?=
 =?us-ascii?Q?n/YAk4sg9uZlBH9Uo+OSRYUntPpfDwZKx8xfhyo+bs2B8jPxVMiq+rA0k8dg?=
 =?us-ascii?Q?yEvZffAHrdv+XPW9Nh6HvjgNAwbCXp40EGy3M7WGCn9RN4KJuT34yOkrcxLf?=
 =?us-ascii?Q?USi9e+FC+Wt2D3wjc3qIxmVZjBKW4NLzDJizIrLqHXZ68O1Wh4KIjGTBlu4l?=
 =?us-ascii?Q?h+rffOvHIQmPbTpd55enEOUC7CbPdY8ShJJc7qp2IPgfDYKztRgwui0PSfOo?=
 =?us-ascii?Q?5HEh7PVYfMngsdLd6WItLoM/ksnwVO8MW5F88Xn4pq9Te7Taix2P6Q6F4e3U?=
 =?us-ascii?Q?wWmXJpgpn5J1Lw5hXV5JSF9HG37SdqamIJOLdPBUtxVaRC43+dZlFqtk30fT?=
 =?us-ascii?Q?/HEZWcDl5w7v/0PdtmwA63lfiaAdq0xvSnMGLxjCD0g7hTGzM+bZ0vLQSE94?=
 =?us-ascii?Q?UB05iX/TCWDt+QSza3fUhab4roKaROMwwGGylsoHl51JfBD2C97sURGCfsCX?=
 =?us-ascii?Q?Bya5Z4Fhn5UrQ54kPjAz6HV0v5gAE2S9w7tY6TpQ6fh3OwcT2v9o0xm4vTfA?=
 =?us-ascii?Q?xVSfFlzAbtj0Gwnegc8YYB6auxqeh58Xkb5+p4AqwN8hEmxaALoAgFC9r4Wl?=
 =?us-ascii?Q?1F7DBxXNmUaZyquIz5iHTd22LewTRGYoi3qDMp0OjXkV7rZE4yZOXhRtIoYb?=
 =?us-ascii?Q?RQNrf+aE8+EOeeYuRXbUC49ASnW+Wa0jgu6HISuglU1UkteXl5tuInpKfCht?=
 =?us-ascii?Q?ET7fWxEXLc1zovN1KHV/Dep8jQZgtvRIQ69DTyUxpcvLBXbDxd72wHCJt+4n?=
 =?us-ascii?Q?Gg/pNJ791dvQPy4kzP+gnsj0e782basOVVzjVyG1TXBAimgWNWe0ufmxfCtq?=
 =?us-ascii?Q?Q7mxHNF2ch2x41annu1NLGVMMWar0OIwE95I6S5vTilBuLNPIMdIXh7PT8Zq?=
 =?us-ascii?Q?MJQcVHmWU4ObmpvLMh1apYEcGPVdeFm8Rzffr99ZjayvWk1U2m7m9c5A2JPf?=
 =?us-ascii?Q?StgxKui+Gn5nQ9V6n5R5M1D4MmTxK6M=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1bca1d0-46b9-4abd-fe88-08df0a34a7b9
X-MS-Exchange-CrossTenant-AuthSource: LV8PR03MB7398.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 03:28:58.3216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UsMdfXiXdRM5AfqVcTYR4/QSDCRD8kSz6G5d+Afc8QwHVk55P0jQ/C9DCzcIUl4xJAEfZGCPWJkR7XzBlKQwy3RnUAzsG23ulspbuqDosV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7698

From: Genevieve Chan <genevieve.chan@altera.com>

Preliminary documentation referred to mpu_l2ram_clk, but that clock is
now mpu_ccu_clk and is already represented by AGILEX_MPU_CCU_CLK.
Keep AGILEX_MPU_L2RAM_CLK as a legacy ABI-preserved ID (do not use in
new DTs).

Fixes: 6b3c59780ed3 ("dt-bindings: documentation: add clock bindings information for Agilex")
Cc: stable@vger.kernel.org # 5.8+
Signed-off-by: Genevieve Chan <genevieve.chan@altera.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2:
- Remove comment on unused clock ID 42
- Reword commit message
---
 include/dt-bindings/clock/agilex-clock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/agilex-clock.h b/include/dt-bindings/clock/agilex-clock.h
index 06feca07e08e..6206a45e007c 100644
--- a/include/dt-bindings/clock/agilex-clock.h
+++ b/include/dt-bindings/clock/agilex-clock.h
@@ -44,6 +44,7 @@

 /* Gate clocks */
 #define AGILEX_MPU_CLK			30
+/* Legacy ABI ID; do not use in new DTs, use AGILEX_MPU_CCU_CLK */
 #define AGILEX_MPU_L2RAM_CLK		31
 #define AGILEX_MPU_PERIPH_CLK		32
 #define AGILEX_L4_MAIN_CLK		33
--
2.32.0

