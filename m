Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012045.outbound.protection.outlook.com [40.107.209.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0843839CCE0;
	Wed, 12 Aug 2026 07:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786520423; cv=fail; b=WqfDcBgwGwCU/Igwktu9qjDvU5b+V3h/b0DIFrV9rTPHM00GGDcFgJ+NQrIuNF02HLt9ro7gOJs5cBNDlJ5irnJu8+5PTeR6Eu4272yhxLM7XcKdqMLa6GTwSh6HcwbpVBmllqHZV6K/rOzaIsFBIJ9IErRFY/Wa/NEfvUXjTwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786520423; c=relaxed/simple;
	bh=13HeY6/kRvwHLAOT79u4vk2mlkjHuVUcoHALt6D9rDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h+saayf116bHWWeK9UW9xL0y+sJvFQpkE3gWamqqmtYOcI7H2PpSwal3n8eZ4s5xt+wHVK8/zxMNsAnDXDjHRJcQe7tHhg4HvFM4gHMPwKfULJ+71G5Rfgp49zPrtwTYZUW6dbWbyd7y/D7fYpfZwduUm9d8fngSFLjzx31cg/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=IxCCclUx; arc=fail smtp.client-ip=40.107.209.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="IxCCclUx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AgxkrXwT5T1h3uPkErFZmVpkZhlq1mzNok4rZXGfOmQpg174fqSzvszIb0fe2FOofFZytqwjWepyNbYgc+9vmk7wf30azPyDJMwdHhYhICoTzeUNiRS3+LPfE9W5LqRMY07Lx9uUdh+vCrghvlTKXIz0oIQaKODtpj2A587ODKFm0YeJSV7kkMh2MHaF/9fDm2iGY0ZRxzehxzJf4JQPMqbBaeqohLp20LxAILxlTDwP88y7Q5/TfysvH/NDSOzXWj/g2FrI1jDSS3gJWWu0ihR4ZLH6KH3g6LsluAF3ug89j280b0nDRTyeCBoUe9bVaa4JRr2wgGfZpyMORaTyfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9S/4PLZC6Aky78t4YEXAOzoL8dFNPSCN/HqJOfMLRQ=;
 b=kZY5/utOtTyWJljTzplaIBDq4yGywu7ytOzZdvChUuGs+rM/8UwlYxLGVjG4obf+02cWxUAyrC6k9quR5E2N0mKq3miHwfgtGv1ONgVqZh5FrxHZgu4Yu1Of+1+dm4dtvdYUWV1/f5YHQRtjv7jJ1U0wWjB0Hd40xpAzATqA0KBWfHZqw92FDoqJsj1EQ/jLc2cvCe1Z3zywlQ9sjfgDkI8surKUvPG96cDc7VuISLLER9QJ6V5sh4AUHwIwgNdJb0Yg30wgg+mgA8vUAsJCGy4zxQtDe88a5n7JchBed7HdPKD0XXn7Cbo1SDQVA9NcgsO9iZ268H+iuhysx0nnxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9S/4PLZC6Aky78t4YEXAOzoL8dFNPSCN/HqJOfMLRQ=;
 b=IxCCclUxnXCbdU8yWkqdCeg2Vt1Tkro6iXGEAawJUkLwsXHW0X2bbFnotcF69xoTyCkq/rcAZmMu0vU0vGPH+bJfKKOIq7qr5gR7v3v+0CZWqoZ4pyORQ3WROHRURXtPIcMM2g6SJRltbS0vVNE5YnyHZuvpe3aE9RdpL8dE4W2INYpmAlqUbzTJ2QDeuXdsCtId1exe2RABuax/Qtjtb2mamEsrngyGWKtYPh206Q1DsPsB1GjcLJ5qdRm4fgNgo5nyp8qgwiHNZcdnt3RE1K5jQyVNqK/eBT9dTIGQdz0bOdNisF3T/Wb+5MhHzyiPHocTqd14h/nKCV7susr+8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 BN9PR03MB5979.namprd03.prod.outlook.com (2603:10b6:408:134::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 07:40:08 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 07:40:08 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v3 6/6] usb: dwc3: add Altera Agilex5 support to generic platform driver
Date: Wed, 12 Aug 2026 15:32:59 +0800
Message-ID: <b1a0734a2e074e2ffbaa4099695406e54206a725.1786518803.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1786518803.git.adrian.ho.yin.ng@altera.com>
References: <cover.1786518803.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0156.apcprd01.prod.exchangelabs.com
 (2603:1096:990:7::14) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|BN9PR03MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: 97878c80-6df0-4be3-1413-08def844eeb4
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|22082099003|18002099003|55112099003|11063799006|6133799003|56012099006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	uL/yj8otXSHgK4HeyYMYODbRJDk5WcbSZ7fQwxnwml4MTge9LUhEzt2CXEvzMMmOXM8JMjpEB3mR8adoBhmqCgDvSXnX6hlBnTPPG55GCeF78B6JPzv7xRQn3RISgbYN+dtCNUnxC1XKjxK37HK/wx+dQ5cgLI8LnMzSBDnFDjUFAEINLYST4S2Qsy4a0vB+UUDXJG2z4oPL7f3yrK+bzoPp3rNBVA93EnR6aADPLEPwN3b9TwUCDVm34P3AotURud3CLTPrBw2DOOyLgl9cuUOg7pHte7Oc3w6+bjV4JyiNa2zBQtCg/AaoIhOv/dgIJADHvewyS9UKgGI3OROpf/JRHNXrqeJYCEQEN5/8Q9PS0IiLpXjqZCcKCe2xmOhzLVuYPZTaaoffcB2tpsqEEiZEYqYBwOKBKeo7wt7LYJhSQmnAisU9UgZxVFDDLRQjVTPjEygwNHuGlIaaLjJVQZBWcKnXcz45ci9fPBSChsO79QryXx/gaDtVpp3fG/Txdqj8haW/VVdt00EcklFAwhbisT+zeKdx5uqnN5P2R4T8M9Ieut4RN4aQg9Ku+GSUCWmDpVXs2UZLkfcsdcSoNfn+jitx0owf1fRFQDvN4P/OBepBpH2ahwrbsfZRqLwkZSHlM7dgIdOBfxzd0Ef9RCKaMzJyzJ6TpC7bm2QLQZEgsr5ACWiDa3IZsKqTppKEQPnjJIsZF1eQlvy9ddPfdQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(55112099003)(11063799006)(6133799003)(56012099006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K/q7+mx5ew2GZQ8pMnOpdSXFZ8Xx9q04biQrfg2zwWAQS4Q+AgB1TcdzYIgY?=
 =?us-ascii?Q?HbK3H/evziCSZ9X+7ft0n2T59ZKJ5vfyyRaHMqFPju50MtTWrtPMqxrO3AAg?=
 =?us-ascii?Q?8aN+I1RzbuOoQNHtgW5OkmK3SbOGiqk3VpuRnVWjIiPVOlDLiWyxPlr5XC9V?=
 =?us-ascii?Q?kRxNayQMybFIXEhaAqK0z6Uo/8xHTF1vEqrparC4AXX+hOnBKm2mafyfCtMv?=
 =?us-ascii?Q?N0PL8CLJCbXo3QDVuDfPLqaZL91UwEXhU+WWg2wouMynWOBBZwyzMGDUvyzt?=
 =?us-ascii?Q?0gOh0Bwdv8M+/wjoKFzseFjEngNDlhrpZjUSR+n/aJWk/Dn4Qqw+kuaBMG2I?=
 =?us-ascii?Q?F7uGRiEgVCy8edJSJH95ke5N5j26NBkZAXLnuU/CstSuJHGH72jNXRTzJXTs?=
 =?us-ascii?Q?gHGeYOQlLoHf/64gLkdW22GHBnjC+EtdRZ3ty9ECAvXLXXXrTSCvQUn5l2NZ?=
 =?us-ascii?Q?L15x6DOnABu0NKSnrnEmXsXjbDJIe+29+ji5qGruXKmwbi8p2Ao0M8gM8tfw?=
 =?us-ascii?Q?+RydNjGTLSzdcjjLNlw1muI8Mh36DGxL8Q8HNRExZXkCGx8LxBG+Hanzf2dx?=
 =?us-ascii?Q?35ObPuDhtqlhONVMYy92VDebrBg3kDuU1+2IQ23NDB02g6kPLQuB//nHfkAT?=
 =?us-ascii?Q?yXnXYGB05EWoWRpbbaXqiV7tQ093l2r6RJ3/yTsCvdrp13iGVNsdyjAc5gOf?=
 =?us-ascii?Q?gDrCrLNPTVn2iNMYJ+nlYmNFC/cv4tNxSIvL62kqPKXNDurn5RlmTIGZG4//?=
 =?us-ascii?Q?zav24X/dfyzph7BmFctySBQU74p+O9sHJMID66ggBul5/MMzoqeTok2y7uJp?=
 =?us-ascii?Q?3FTGiqXsFhflBY8R8t3oaf0/5G++lA30g6z1SU4qaR/aOsidBlEK7G3XSenP?=
 =?us-ascii?Q?7Zhckk6FGoCPeT2NGjGR04UCOi9LyRuSfih8w+cAZQgX5zQI7JVUyg6WMbJc?=
 =?us-ascii?Q?E/5sDOA8j0TrWV7zggHWlhpWUe9nvfKSl/9VOzY7mWDLUj9N0se2grbooKpx?=
 =?us-ascii?Q?Lu+L9Lm+wLGQVv2EeiC7VUsnsME87M++/0Au3Wmxcn3EPy9pZNFoWVRUdVix?=
 =?us-ascii?Q?nptzgtRGvwbDF+e4nYKqfZ7DqmZ3r4lxHms8njAZI4lcEYH4itdBltP+h6um?=
 =?us-ascii?Q?/9SqrNUASqolKmp4sty3GKg8OgM9OL+U+2oGTx48mwV3PAkOlT0Nu3IsXzJZ?=
 =?us-ascii?Q?nSzmPzIOyHzTw/rANCujSwGl9DnCi5wBr32FNkf5RdXOEyVQaH8WrOIDXfTV?=
 =?us-ascii?Q?qKFwxQcVPDXosS5qhkYinTiFs6weJnS94hbNZevYipfgHh9HdgdvQ+DkI2tA?=
 =?us-ascii?Q?7QUyTISGOE/VpskiMfmBmo8JRJGv7dCtttzRD3waNXZMhst9pgWMfDRVO0dD?=
 =?us-ascii?Q?Bvz30GbnmcBcXlW2+bN18loiJY8AMZq8PY/zw6NfXCElOV4SYMElKLrmJD4N?=
 =?us-ascii?Q?IHvonb4t32f3yIcOZKRBHs1FNU0HIy9f31YcE9nzmoBR3VflL/oZgzpag/WG?=
 =?us-ascii?Q?0SDVPM4HHjrCM96MpHmw4mV0oUf2zbcIQs75an6+2C0k9/GKxke3imy2uwd6?=
 =?us-ascii?Q?eIDQfzDHJIG5/s8zJhHqi9VjX0PwlsvmQXI1Ge1ntnV4tvCytFiB0qYvtdS1?=
 =?us-ascii?Q?NzzktidXYW8GObM4FdrrybOIRwUXCvXsbcWeEA7IDPT5mKQU/aP77yrV0SNB?=
 =?us-ascii?Q?asHliGQRA1jErCc5kGKHJG72xjlFpbSpfSIuM9WRrMg6n35r4RFbsZSDCooX?=
 =?us-ascii?Q?7YgPLgDFZUNGkFaC3w0sgGOCLOEEoXo=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97878c80-6df0-4be3-1413-08def844eeb4
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:40:08.2818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D110BiWiNfOfBFoIWXaLLCdSyWK+EljqApnDp8TdMMx4bxfJ1g/UAVZAmAa/GPAZurYcsg8LDweuV0cx6P7G3AfCuMg96LIb78yRmqR/OAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5979

Add the "altr,agilex5-dwc3" compatible string to dwc3-generic-plat so the
Agilex5 USB3.1 DWC3 controller can probe through the generic DWC3 platform
glue.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07c..8781d7ec6b9e 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -232,6 +232,7 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
 };
 
 static const struct of_device_id dwc3_generic_of_match[] = {
+	{ .compatible = "altr,agilex5-dwc3", },
 	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
 	{ .compatible = "spacemit,k3-dwc3", },
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
-- 
2.49.GIT

