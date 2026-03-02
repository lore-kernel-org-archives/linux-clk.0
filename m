Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013056.outbound.protection.outlook.com [52.101.83.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F120407567;
	Mon,  2 Mar 2026 15:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772463613; cv=fail; b=NzeKMeyFfCC0budNW6b3mGbz9eEMN9UP6v5257XMh8jb6GggcPqhemomJ/gtVlLe3rg+KFUiia9CNUdyT1rnH4mHPNF7Lq6aGct9gku63b2yrGhX0QgL7NKveNpJJw72/9zgXBgW/GYI9O6S68ieHQDjoiNeY5TrPyq10XGXiAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772463613; c=relaxed/simple;
	bh=JLC6MakEYLjZyLi1Lk8OfpXU8eCjff8lE82qWjh1B88=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lr5kVOyeHsuNsM2Rs5thNuk8EgNZWq8rI/gpQbZpZFeIampM+Prr0kIjtpflofu7D/PRCYX2myNQjyY6xFum3Th295Y7uE91wcUwz9+E0C3zYFfsSAyEZls4LsTDh5xzM+AuUPnWMeUz+nZkDyP1XsE47BCTkX6XMkVlqlEAKbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=f81qESvF; arc=fail smtp.client-ip=52.101.83.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="f81qESvF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W22K7OQpi50Zj16pLB2pkzESieUKdTRj1qHiE6ANxB8DbPEyL9RVam1zMKd14bWSqDPpyfm6aC0mxjEobc2JCg9L/ZrqNnklRZSG38vRxZiho9GfPrw14PDGJKxVattySjnfFuGg7YrkPcQzyEI6IVG2SfUI6jtS3ji+DoO1a0/jFWJ9xyLMOZmySLiIjRJp4cvKIVJFIl+lNCmQ/X6dK9693An3/NEfb2l+zy871fFDgoR/y0Z7dRm2nyMzGRjxaRucJwNBKbh5Zf/YmY5lw44TZrUG5ngPNpphPC5pKtsgQsS/UM5Ddikj4blWtf5L8wsoX02RlAVFl1QeIevMrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NM5JSHU1l87OPtt7ZaQFMlVLBnvdejkKoGjwrux+QhQ=;
 b=I9rPlOGtBLlor13CLbzwA3AgbGOQ3JoJnqAIOftKyoz0j9b01UIKwzAsnRkf3F7yElivBYS/+7eFsUQgLtHw1b2mPynbVRiipjBl7fTKz6kMASzEIo23LI3wyVlnA7naBDX5vB+y1SzgETd5ISAjq5FaoBhXevZabo0wifVi7qOvY4NJnQ2OpdE/F/HRiy7mcM6jqiN1iqHYE0tf+4pgx3GwqdHyx4QRwZg/JIBqZvK/GUryAhAs+kN6NUMXC4ZCktO6viqdX8keSaMBd/NdVTygbtVr1Rc0d+3uZd0pGvIp5mCc9CZKm/al9WPgdExhUFo1+ORx7jogC7J2LbJREQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NM5JSHU1l87OPtt7ZaQFMlVLBnvdejkKoGjwrux+QhQ=;
 b=f81qESvFSbu/Kzdy7adMxSSL/x5MyLLenUYMJ6eZT2sO36K1fqqYH67TAfW+L2bFiLDd/AvTJNpuzJjnc9nDlTI0drQStbJHR13Y2fcqvL8buqojgLhCVtVKGRkOLG0kREXUlTSG8twd9QExoC5fk2nqyiEwQ7wJtER4xzAkSJYxpAVauwhHyMt/NxRDf7L0jpkRhbHe/8/15NwJAFLK7RLhHpwNrxkkomxKMiVJvbv8F53UXCF2rOHxKfbsEW99GFHs1aqU4cKasmhy4tCnZmXa78vlfhIdtGUmXvcMsFcauo/Mg6W8DAzwYRth9a2Sj6QNC4pZXEmAh3tqjMC7Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB12255.eurprd04.prod.outlook.com (2603:10a6:800:304::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 15:00:10 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Mon, 2 Mar 2026
 15:00:10 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 02 Mar 2026 23:01:19 +0800
Subject: [PATCH v8 5/6] clk: scmi: Introduce common header for SCMI clock
 interface
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-clk-ssc-v7-1-v8-5-2356443a7e4c@nxp.com>
References: <20260302-clk-ssc-v7-1-v8-0-2356443a7e4c@nxp.com>
In-Reply-To: <20260302-clk-ssc-v7-1-v8-0-2356443a7e4c@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Sebin Francis <sebin.francis@ti.com>, Brian Masney <bmasney@redhat.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGBP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::20)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB12255:EE_
X-MS-Office365-Filtering-Correlation-Id: 822c740a-fde7-418e-879e-08de786c665e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	zq6yPrzdw+4J2aJCK62BQKZ+27/jAdbpbiYwMCQBx4ifa6Ueu01HM1teFzz3gbpRqnv6pit+6I4QmDK7QanBsIeEH1aUV3Z7+y9oM2e1c9KRBe6BqJjWdSP+Q3CLwWmYK1Jt4GkvEGIYmmeXY5pjVWESYM5U2pyf9arZifZXIaplkWcD+vlRg0KE7RD5hPVZajf6LQ7kLjrLEx+kySkJ/cb3xarzHTBVRf2HMc4INWk+oo8R9TvOR8uV+Qc5tXt+xhhvN9njJz302N+wsccZ8TCyoI06zdxbLQcFAy8oUhdxqiyLvW4c2licCCzsNzZxHc86S/rc5jTRCTGEgadFc4VXKLdTGC6aBMcX4Sy7FSZ07Y/LcxYcbGxVs6Wb/Ilka1lHlsjxHwRByyUJQGwmfs069oKjpck/kUeKHG1iHK1+GY20OjBzI3C13a5TUVUGUrvf7ocEjsv2qOGVkSWGuiipxT23iLRB+6LqmZ4IuOBdi64BNwcljashcBUh+I113ovSFU6HRMyyPOD071cmsLixDsWi2SB9JIWoNxTAbh8c1HpTPlgRS/Qm9PcAbRDpXr9Zfxl+h5B6QeAkpPywd0+41RqBw2e36O23geB2wK0qsvkD2v/oSiJz6sPIcOfWAxOBz5lRbxJkHzPywSvn70Popghs3ON57WR4n/QWxFF5FGnHXJksb6BtRs3fsKbOUouPsMdbo4YijrvqBTNX7/7U9bM7z0fsjbT7yNOjSYf2VQ/4OS4PG80wlZ3S/jySGW0WstiOi/iT2T+5P53K+G/jGi1lsnBUNJoFAjzIOTA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGhKNTJpMUdNYXhpRGdlRS9RWWw0NTl4Y1hFQ0pOQmtReXRjdzZpbW03bXZQ?=
 =?utf-8?B?aVJOcGE0V0ZneWIrVHBnanZ5MHQ4ZkFwNlFkNS9taDJpWVB1ZHdHWnBzaW9F?=
 =?utf-8?B?eGVoQ1VuUmVUK21pTUs3U2xJaWtrMFgxWGxHcDBBWEtWWW9NdkdOMDF2Zi8x?=
 =?utf-8?B?MllWL2QzYzZvTEVDZW9DWFM4cDkzZkdITlNBVWw1clZSTFVLWkpzdWRvWVRQ?=
 =?utf-8?B?eDdvS0dlY2dhZlJrdUd5QnN1b2IxZ1Zzc3R5NFppNk9wc0FLL1N4N2luR0xF?=
 =?utf-8?B?R0U5WmU5Z1FlTHVlMTFsZEZxVElPMHQ2TUd1cXFMSmo3NXpzcEk3c2tyZDly?=
 =?utf-8?B?Ri93UWNucFBpLzdzUUNVTlBPdWVqREtSajNBQ1lNSGVnaUljc1dwZ21NWGcy?=
 =?utf-8?B?bjk4ZkZ1UDU4VmtUQWMxZzJLOU1wc3Y5M1hDUEpTM211azJWZXphK2F6VTBY?=
 =?utf-8?B?dDMxSGhzNTh0Rys3SkZpYWRyQXNEZlQxMGFLVFE3MXZGYXZCZTdVTjhFblps?=
 =?utf-8?B?UTRRT2VIQUpwelJ1UnJhK1VqOGtzamZ4MXplZE9ENjEzQWszVHc0cGZWRTlW?=
 =?utf-8?B?TjZFQTVjbUV6WUJ6eDhWTWR0WlZlWnZienlreGwrckJGdXVHR1dKcS94cjJu?=
 =?utf-8?B?RVJBOU5oeWFFOE5MbmhDUEVpQitlS3YvMGtOcUtYdURXUzFsR25lQ21qWmJ6?=
 =?utf-8?B?Z0ZIczM5K0V6bnJLOUtpRzhMdFc0VDIyN1RvTVRhd0xMRHJWTkd1TVlPWDFr?=
 =?utf-8?B?MWt6bzRPNmxBK1dJb0J5ck45MFFjd3BsVHVhOW9aUEVSQllTVzJHNDRMaUdz?=
 =?utf-8?B?Um1lQ2xVWlVMeW1rbzVjdktwaHBsNUdFVURHRHRaR3FPaWlNUG5CNHNERHp2?=
 =?utf-8?B?ZUd6OUVmRmpsbHA3UVF3UE9CeUw5VlN0cWI2Vk80bWNhTFJQcGFCVmtlUmla?=
 =?utf-8?B?TXBxa2ZYbGVGWkQ0VE1xbHhCNnN3YkxPZ2VhVWFHdG5MY3JRMVVrMG5Vc0NG?=
 =?utf-8?B?cTJhcXJ1NXJwOWtqN1pMWGlDejIwbWplL2dzUmlmMnYyZCtia0RSdDhWcjJM?=
 =?utf-8?B?VnhVRCtNZ0NtTDYya2tVQ3YvYVJQdmFVY3NPVW45NmpBUEtaVE5keVJZZ1Zl?=
 =?utf-8?B?aGpLOHIxQnJPaFNqb3BDQ1h4ZmtYV1lvcG55czFJb2V1aU92ZnFSL1l0aDkr?=
 =?utf-8?B?QVR6QlhTTVJaOEs4UHJHaW0zWTVPMjN2MzNFUUVtc2ZzT3hyYTVPdVgrOEdl?=
 =?utf-8?B?K2lPUTg3Y0lPYUYzVWJLU3VBWDQyZWJLdFdLMHg4bi9Ed3lsYS9jd1ZoTHNF?=
 =?utf-8?B?c1Z5UGlRbFZIOFZQUHBEemE5VFovNDFUQ1RLblBTZEg4MkllZFBaRzJGSjdy?=
 =?utf-8?B?R3NDTVkwajk4RW5KemlVc0RhU0VQeFBUMXJ4a2pFZ3N2TG0xdGpWVW1hRDJa?=
 =?utf-8?B?ODVXeHFYdW56eGtaaEphV1dtOGZXaW9SZlBXbWk3cUpFWVdqd2FRN1BOTFdI?=
 =?utf-8?B?eVVUcmlYQ2lNdkZPUjErQyt0WG44SG5pVWZWYjhFNmZPWll1R0tpQ3VpcmVD?=
 =?utf-8?B?UkNsUkFGRndIZWhxc3NNeUdxT241V1ZKYjBkV0tYRmFnaDk5bGo1UEhNU2NZ?=
 =?utf-8?B?RVNjSHI5UE44MlFjZUh6R0RDRjRvV1B1ZjY1SzlEcWhDbjNPU0RDaTFnaWdU?=
 =?utf-8?B?alJKbjN5SzgzNUI3cUJtWGU1VEF1NmZSRHBMREtySDl6NDlpT2UwNGpOMnRK?=
 =?utf-8?B?SU5aMW1YcnNZTkZGMjk5QitwTnVOakJ3RVdMZUxKWU9OQ0p1V3I0MVZ0R3Rp?=
 =?utf-8?B?NUQ1dUFqdW5Oblg4WFdrUkJLME84a0FtZm4rOTNhdjduY2hKaGNubS80Z0dG?=
 =?utf-8?B?Mm5QVUVIaWJid004clNHc3BFcTJmNXVia2ZkMmh3cVZjYlNNWmxLZTdMQ2Fm?=
 =?utf-8?B?M1UxSDdaMlVkM2xwZkFhTEV4aWovbkhvUWJObExEOHF3dmI2NTE4UG1ZenRt?=
 =?utf-8?B?eWsyMUp6YzczZ3RwckRRb2RLLzhEOU5GcUVnK2hhZUJNU0dZVFYvd0gwV2xw?=
 =?utf-8?B?UXB4WFBXRWwybWhWOGdNNG9lcUQ1Vzl0VTNBMUxiRTFaUDUyMEJWYmtQdVhi?=
 =?utf-8?B?aTFkNzdSeXhTVE9sZ2V6cTBLWGhwM2lRWHJ4cTdFajFXSkswd2lNRDRGcUpw?=
 =?utf-8?B?WmliL2pSZ2w0NVJ6WFFwYUFyM3pkck1XN3E5NWJxSit0TDZPUys5WmtBeXFW?=
 =?utf-8?B?QWZwQVcwbDJ0aVZWT1h5aHNwanRORFdkenVLN0doZ0JvdFdIdWQvemFSUnJs?=
 =?utf-8?B?V1dqV0VoMDBpSDFFdE1uLzJ1UWdBbzduU0hzMk1EZExGRUNqMUdJZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 822c740a-fde7-418e-879e-08de786c665e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 15:00:10.4201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2oG2kvnBx5a26IuwjDWXdkKlQ6Co+L2qn2tABoO8ueLemAYS/V189Pg7M7PAE9ppxQ8IeAzMHF9IygTL/oNlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12255

From: Peng Fan <peng.fan@nxp.com>

Added a new header file 'clk-scmi.h' to define common structures and
interfaces for the SCMI clock driver. This header will also be used by
OEM-specific extensions to ensure consistency and reusability.

Moved relevant structure definitions from the driver implementation to
'clk-scmi.h' to facilitate shared usage.

Reviewed-by: Sebin Francis <sebin.francis@ti.com>
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/clk-scmi.c | 27 +--------------------------
 drivers/clk/clk-scmi.h | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 6b286ea6f1218c802d0ebb782c75a19057581c20..bf85924d61985eb9e596419349eb883e3817de73 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -14,32 +14,7 @@
 #include <linux/scmi_protocol.h>
 #include <asm/div64.h>
 
-#define NOT_ATOMIC	false
-#define ATOMIC		true
-
-enum scmi_clk_feats {
-	SCMI_CLK_ATOMIC_SUPPORTED,
-	SCMI_CLK_STATE_CTRL_SUPPORTED,
-	SCMI_CLK_RATE_CTRL_SUPPORTED,
-	SCMI_CLK_PARENT_CTRL_SUPPORTED,
-	SCMI_CLK_DUTY_CYCLE_SUPPORTED,
-	SCMI_CLK_FEATS_COUNT
-};
-
-#define SCMI_MAX_CLK_OPS	BIT(SCMI_CLK_FEATS_COUNT)
-
-static const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
-
-struct scmi_clk {
-	u32 id;
-	struct device *dev;
-	struct clk_hw hw;
-	const struct scmi_clock_info *info;
-	const struct scmi_protocol_handle *ph;
-	struct clk_parent_data *parent_data;
-};
-
-#define to_scmi_clk(clk) container_of(clk, struct scmi_clk, hw)
+const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
 
 static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
 					  unsigned long parent_rate)
diff --git a/drivers/clk/clk-scmi.h b/drivers/clk/clk-scmi.h
new file mode 100644
index 0000000000000000000000000000000000000000..6ef6adc77c836dc2d599ff852cdc941f217ee388
--- /dev/null
+++ b/drivers/clk/clk-scmi.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *  Copyright 2025 NXP
+ */
+
+#ifndef __SCMI_CLK_H
+#define __SCMI_CLK_H
+
+#include <linux/bits.h>
+#include <linux/scmi_protocol.h>
+#include <linux/types.h>
+
+#define NOT_ATOMIC	false
+#define ATOMIC		true
+
+enum scmi_clk_feats {
+	SCMI_CLK_ATOMIC_SUPPORTED,
+	SCMI_CLK_STATE_CTRL_SUPPORTED,
+	SCMI_CLK_RATE_CTRL_SUPPORTED,
+	SCMI_CLK_PARENT_CTRL_SUPPORTED,
+	SCMI_CLK_DUTY_CYCLE_SUPPORTED,
+	SCMI_CLK_FEATS_COUNT
+};
+
+#define SCMI_MAX_CLK_OPS	BIT(SCMI_CLK_FEATS_COUNT)
+
+struct scmi_clk {
+	u32 id;
+	struct device *dev;
+	struct clk_hw hw;
+	const struct scmi_clock_info *info;
+	const struct scmi_protocol_handle *ph;
+	struct clk_parent_data *parent_data;
+};
+
+#define to_scmi_clk(clk) container_of(clk, struct scmi_clk, hw)
+
+extern const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
+
+#endif

-- 
2.37.1

