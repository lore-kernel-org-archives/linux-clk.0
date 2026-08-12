Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012045.outbound.protection.outlook.com [40.107.209.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD9537F307;
	Wed, 12 Aug 2026 07:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786520400; cv=fail; b=Ge6QCCLS/vSIXExl4Mu9+gMGwtFjWzt8CkWoOo1MexKFKcPRQPBtoXudPqgOYr+aIg7SjyR90Y4gp4aACbJrwnpNRt3CC0yREtmFJsMqjPTUTwxbpEW/6klf2Tq2k8Oz0fThDSXv6WW5gajST2qlaUow0cCBgNILR0BmlO9aQgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786520400; c=relaxed/simple;
	bh=vkRhhoejENKoDwI8lW1uiwiN15ii2EUSfmgLVNLZEK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gubRsSyUE2jHkK3hiRQ3k4aRtI/4/e7+/QjTMcwLRN1w3kSGxbz/UHkH94z2a6b61kE2E6kxey+lKb8dt2Wf23pCDGA5p0oIpty6wiyQfBHunPSQ9iIPtlSNtFe9tvjCnnnOPME9rcPwpeEXWLipQ9WP8608dw/U2ArjkJ3wuV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=iS9ZgudB; arc=fail smtp.client-ip=40.107.209.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="iS9ZgudB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjB+VmOAw5hox3OsIyF0fyjcBYjR3d9di/M7vZnDNfHX1ulIb/4++O2hQS2THNQ0grYzI8oUtWmE8ZxrHQmi2SXdJ412eHyjXIcLLHGMkKMw63dZkfmvo8ySRWRukTsncz+JfSVgwFTmbRK9bxSJqVy27dmRiFDdifi8qi4O1HQWH6eIIvHQJEXbLN+E/Rj967imrMqnK/8NOmFgR7MzkUPnrjK3nUPOGdVFrYZV1bsRJnL0T3T0aMTqx9nIoQR6y3ouv9s89zLgGGhkxPUc/c08wDBf/cf+F6gZ6FtsdanDC6fmXZqc6KaTgbWmtm4HAHZBYM3UY7YaJL38PfXESQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dckuTxci/fxjYsLDQNUWvOt7NnMPeJX+omjElxHa6qY=;
 b=v6szvC6Yb1y1SFPaT8oydyVOIc28PWzC+w9sAupkqPQ09aO3TjQc8fPEn8+AgDu77ZZYZQFeulJaRMMPS3v57NQE/zQ/OMC3MKDB+GVlCK8eWaiXMp2Ihv0wDNsfSgju8OC22sCrL4YoxfZ3YJ6Wttqn3t6h9VPvAOb1AYoIDiI3N90Kr5XQbNn0I9/EIIOkICIiP7UoN97iEGuuUFS0U3kE6wFVxFIyIbIpFnHRn/2QKLqH3GPbu3/MQkF19en2Mskixs7dEw9i8nDWH5ZrDotkDjsj/bRaUFG0L0bY0AV4pWdXCjSGFsF8/bxFziaJPl2uaAvCyOOc51YcqIfpUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dckuTxci/fxjYsLDQNUWvOt7NnMPeJX+omjElxHa6qY=;
 b=iS9ZgudBJo3UIGvJXiK/4aZWR2TUCyVcaT4wQ40wXKZYWyVQ/vQ1i5XKFns/9gk/PFlY8HNtmD6rbwhQvMWvbQk+LJvmLBfF8SpNNf/4JpBCdYNEML1/4XPpk1zgKAgqCwEitXRFHd/IUufNjSINwHagNKwJao+MVkAHuIeMfxxQkqQQIzE3NvHslSBiB2aJJubFQDjq0U1adE9cQYnaefs6JN6pdctLznAQuonNAWQ7I7QbwoEwj7+/Ee47rtlX8qlZarJXU81ERdJe9TQ9locf9VeEqVd8CN0eNJ9NZbG8KcI0GGyapG4KyMidA8Aq9Ct5ISz1T4PYjz/4LoS9VA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 BN9PR03MB5979.namprd03.prod.outlook.com (2603:10b6:408:134::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 07:39:48 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 07:39:48 +0000
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
Subject: [PATCH v3 1/6] dt-bindings: clock: agilex5: Add USB3.1 reference clock ID
Date: Wed, 12 Aug 2026 15:32:54 +0800
Message-ID: <9b583ba4a5ca48d07854b7d005b43b41fefa7fa3.1786518803.git.adrian.ho.yin.ng@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1d3de617-1cec-4efe-386a-08def844e2b7
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|22082099003|18002099003|55112099003|11063799006|6133799003|56012099006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	wbhYglPobhxZRwOFvKEUmR8NhOR+IDrKgrpqR0+CloOlno42ZTI1VtW76yiJZSxQ58j3Dzsu1kasavkaxBvcSUxVbaJajp/vPCu1LuJmlUugkTZiIOKho55nzvGThN5bCF4fUQRWgW/adFem5SC6x5+jTEbe24tmu1tTpLn4cO3GLFRhRuv4UgtCioarZVlJCYfP+FNnFhBajjwE7yYjhYvy98i3c0/Um2957G0Us1+ubr+nm8ZhqjSVC7geK6dIL+eb4uwLakcuQZw9NexAx2/9nmppLT9Krs/6UkUDpaBLbIxf/QrMeGLV9gnurfeM6Ipyy6LIQ6MQb9FlInkZ6AiJq8HnpTLo6h+tg9NzfePyCeRsDz7l5DKIdE6Oz/SpbdIt4oSEsrYNUkSN1TxZEzGJuxG6cNvJIJ5JLNk0tT07H7qI0OMTgJJfVWfaoimQxyPitTT/TkSISdPbSku9nPyFebb7cpTbCXbLLKcR7SYOmT2z1CVAYJnTu3cI5P+XnWv1MqaDiGyil1WyF/2GHQBup7NWyR9t4en3SHZ66rCilGgl/MezS7Ro1NikotBwFDDQP3SYo5AjCJ2HPmAwcgqbdju8LzdkNuEMt0gb8dN+3YE5RldX77zFp8tg1bNiOLYLkUgXM58NXg4kS2pq/DTgIK/vopNdRZksJME1hlP8plLxTFnlM1gqFBS5uOV8siJeD15sEM5zqflTaDWJdw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(55112099003)(11063799006)(6133799003)(56012099006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+qqFo8XQjasBcPHG6EewiMgAt5ko3TMB5kyPeXdoyd0E2jVBbDSk97BxNmmT?=
 =?us-ascii?Q?22Y5UoDczO5eQ5/5wSKmCYOu4akEMuDtL5Y17B0fn1xG1rO5S7K48uEmTVzf?=
 =?us-ascii?Q?3FQHGePxZ0OQUZ2df+pjKAhuPnQKmJB9wke0msPwHNGYzyk0hLFETZrWeIcF?=
 =?us-ascii?Q?as302yiA2SqxyY/+aWXELHktC9lBrMIRZpToC4dWM3bqbKrJC3N7gKPgJ3ay?=
 =?us-ascii?Q?FxfCqN2pDCOZw7CDydK+Taz5VRuTuAcSbcvS2PHq422apElmOkfpGs7cIBmZ?=
 =?us-ascii?Q?VtkZYznheFutoB0hxrb+gjXvCfQM4IPqI0qBypn2xsmcowFlcjSkmIcfwmYQ?=
 =?us-ascii?Q?5CNIY0n6MDbMe0/8DV5EtnteWoqIBoUygSBMVx6icmRwbmN+RygYtj4fHqGa?=
 =?us-ascii?Q?lrhMe5by2pYK/cpfd22Ya5JvMGK4A59JnTmpnvVQ45tnPLk7GWYCSDfKbmsb?=
 =?us-ascii?Q?7lPigFK1y6yKxYwnUe9faYuY8QEG/h/SYaZOoJ3pK62F6KV5G3W4BI784OaK?=
 =?us-ascii?Q?iqafLAEmqebwTNrbsXx7Lz80I36kEyW8asLeVeBH9dBJ2WOJJv7uBgu9wRIL?=
 =?us-ascii?Q?7BAXeiBTpbSWy+g0l3PrQAqkxQgpE0WL2QKBT/rSnZCYi4RSuFNP4iHE5EbO?=
 =?us-ascii?Q?MYsMKfINFysjlKwnWUbQxUQyGqX9a4RbZSUK2PPP5JzBGQZ+fH3otX+uCsYj?=
 =?us-ascii?Q?bXATF7FsKrnq6tgHwout+27itH5x67DvS/wzTQTykFBXEFD5we/1iDwTGtEl?=
 =?us-ascii?Q?QoCC7UtfA/3SoTgTxfz0SaA1MS1y/fsCv61aqU6Dq2B/ugoH4AJXJvhdFXvE?=
 =?us-ascii?Q?DQVMOAYCxFw9Aok+B/d6DnXrx8H7biSN+4srLZHDUxbrSZkyCmm2/phMFvNH?=
 =?us-ascii?Q?quSjpwWrZcWNEavdII8T3O+vIfF/ddbQod/JDZdiM+TWl9Qv42B+BldHMqrd?=
 =?us-ascii?Q?3xh8mSnqy0ECFpWhCneHPnI/1f6q+kJV1RfcoGbJ6uUot6/0MFYNQTKbPELa?=
 =?us-ascii?Q?Ir+oiEMQ/WpsK7vWhp0Ab9D4mXm2YtCI44QzBSIpFXsf4XRXh11OTuIGQ0iH?=
 =?us-ascii?Q?KROl0Tkg+ZywqhU91VCJYSLr+iuxMreQl8nT4CdgjLqNk+klSv6dJ3gXbB/F?=
 =?us-ascii?Q?RhIWEKhGdCqefpVDYDyERLi/HHSiNDfg81AWDBUYPYoOHTxFCfvgy3Xg0Qzc?=
 =?us-ascii?Q?mGm5wk7erbvNltoDw3N6t75o4ul301Ai5It+zY4NgFMXUbFoge6ZC3lYRJHe?=
 =?us-ascii?Q?lUiYf8RhqiRJNBhYR7IuPpR2PoWxl1DFG69db7MENnuQ8VennSd+qmQU4/u2?=
 =?us-ascii?Q?j4qlEYdVGu+biJ/X2LHGq0d/ogMnjZ0VXmhbxtYcjyIjQxz8t/SR+lq3GUgG?=
 =?us-ascii?Q?o0fJ7Z4KV1PLrWPM6Wu5VSEFufgr7WySqdmifpzrbd8I2UJc4A67nLz8ZDFv?=
 =?us-ascii?Q?QNdeHoiNZ9d0EhDEy+QNSwwJlkQqSdnMpJehGy8d1ujXUv93N+ASG5YhYqas?=
 =?us-ascii?Q?nPXyjd8WRxagbiR3tmWsRDgj0xCLcDDX4G1pWt/3hJPBBXqT44jCQGEQztOb?=
 =?us-ascii?Q?lwAOozfyWq0rVk0VG7+EWDeJcfPTobqO5pPWf/qtQ7PVoNVozth2oS9w8+aE?=
 =?us-ascii?Q?cqc/CW408cgt9at7XCFRhzqkiKPPpuZPOlhQ4X+0yPdcLUZkBYDftQ67xczW?=
 =?us-ascii?Q?uS3JYx/Ecr+kVv1RLsVrbxrS7B0l8w15fFFVsr9kNptEvVqQAcoRmL4raryl?=
 =?us-ascii?Q?dsBL+sCHW0x4XWBRW030tQ58njowef8=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d3de617-1cec-4efe-386a-08def844e2b7
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:39:48.3223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/R9AYM2hrB9FlpNp3QCA9qJPTyrDLBs/8CRRJKFnjINWeQJyHDQIXsRDQLNUqZ06EGMREje/jg7/av0xazjkB+06bBttpp68mfaLZstBPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5979

The Synopsys DWC3 USB3.1 controller requires two separately named
clocks: a suspend clock and a reference clock. The existing binding
only exposes AGILEX5_USB31_SUSPEND_CLK. Add AGILEX5_USB31_REF_CLK
to allow DT nodes to reference the reference clock by its own ID,
and update AGILEX5_NUM_CLKS accordingly.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 include/dt-bindings/clock/intel,agilex5-clkmgr.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/intel,agilex5-clkmgr.h b/include/dt-bindings/clock/intel,agilex5-clkmgr.h
index 2f3a23b31c5c..196c0bad3e52 100644
--- a/include/dt-bindings/clock/intel,agilex5-clkmgr.h
+++ b/include/dt-bindings/clock/intel,agilex5-clkmgr.h
@@ -95,6 +95,7 @@
 #define AGILEX5_SOFTPHY_REG_PCLK	79
 #define AGILEX5_SOFTPHY_PHY_CLK		80
 #define AGILEX5_SOFTPHY_CTRL_CLK	81
-#define AGILEX5_NUM_CLKS		82
+#define AGILEX5_USB31_REF_CLK		82
+#define AGILEX5_NUM_CLKS		83
 
 #endif	/* __DT_BINDINGS_INTEL_AGILEX5_CLKMGR_H */
-- 
2.49.GIT

