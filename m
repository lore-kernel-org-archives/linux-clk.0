Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012045.outbound.protection.outlook.com [40.107.209.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C3639E177;
	Wed, 12 Aug 2026 07:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786520418; cv=fail; b=IRkKH/RYwbfccha+CpkHun9z+rBUzkUMrP+UwdkNYDbHJYcOiz9GDNx8RzxTvtvKGjqYsjlLGjvwldXt+NpPRsPJTUUL3ZLKJsBk+QvgGwBF9ZF0WRAB7zATZTVEiwLwlXZKbuhstIJDxpYKDZ4PZJdlXETxH7FHP0gTp3UQaag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786520418; c=relaxed/simple;
	bh=6OrnQubykqFgHN7b+4KL+BjlNuOnHXAVc5YCPJK4oe4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W7n/cqfjoT5i10uog6Cj7Y/xYIRqWLkMdUubnfiD77Bwk5rjiZUT1uDPbkuqIo1G7D/52/i/8PiFXGFRB8TFtzrSItKSvcSKy32ocrdZ2zNCLyL9rXAClZf1ZvmdyFc4NgOa7A0GkYINY0lEgi+usB03mDmDAyQYz200SEJgraI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=EVrgA8Du; arc=fail smtp.client-ip=40.107.209.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="EVrgA8Du"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdTBJhxvT+UxV2oicS1/Vh9qp0GfAYawEdTh/dwPixRrvI81BevYMxwc7bxjilLXnXAA7ExdPEifsnbsniGEe5fRXEuNtN3IfXHIfn7xdgfE/5veyk5JUyIV4SW58pI7i/cPRfHjGMz/gabxnIti/yDiPzEVKe1puJTANOpGy5p3AR6qY9e3+vxtscw6Zx0IF6HwT1vYORvqNgdPboMrYGI4y9gYEepjRmyicq5oh1RKIzXqTWczsNPQRocrD383GamZaeBSpQDjx72j6O1SDHGVlg28cDhmDPNMj00ajTSjB2znh5bPidQdKHHE6iajFT5xNnZA6vxbu/+3CgMmKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LmZx0vDUsgmWxNk23ydbneS8q6VitYr0G6CsVX+dCc8=;
 b=I4rvyrDEFmGb8LlmRFeY4ENM5A/VsBDsNaQeToVs6mfzsBEOMCxm8uU02G6m9s2Vesz7eqC5XfHudc0mLWGLEQMMSFA04+O4cIgnGVsUccRyUlSnfzp5vVMb/+g2DkJJwaoQrJP86Bp+M3d/R1HDBSLNN8KzVMb68v+BV2MpILd88C7lp/TRDP3emr5mtN94YpbD51dr3NBU0zJgHXcwFwoRodm9VTNTLtLW4E9+KqlpBNwUWZbll9y03vCl7pIoRDLFrBdRYdCHbdrYCCyeb7R3Q79N6m5zCurMgNCqcM60xcjugg8X0Em08HjzHiR6PqN4vJRlz16nsT7QLby1cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmZx0vDUsgmWxNk23ydbneS8q6VitYr0G6CsVX+dCc8=;
 b=EVrgA8DuqTOxPDYszoIHA7pQhvgHFja8KUgwd6IyzAG3zVgsu3R0aCUr5LSwrgThacu8S/hmbCnJbFYnPCX2weSqHraC8hAnSJUowJykGgvDabx0+IYys74OvuXlv0Kd8192xYEQ/KAgzX1lLC0Smv6xyUEZURKq6ZUxN87be+pwbil/2Tkbc3pDIfqU3VzmiA1JW3+xyUCG9q9g2mzH2vAsPLKQFoveO3zc5HC0YGaMitCkPIzlnDsncS0eBDvifEjfJ0MIUoWztkI1c4JAf9tC26EivyLPOWkmd887dm5TAyejtCRrZF12jVNju2IMr6xw9MWOKmZwgKqRkPWLyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 BN9PR03MB5979.namprd03.prod.outlook.com (2603:10b6:408:134::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 07:40:04 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 07:40:04 +0000
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
Subject: [PATCH v3 5/6] arm64: dts: intel: agilex5: remove usb0 in Agilex5 SoCDK
Date: Wed, 12 Aug 2026 15:32:58 +0800
Message-ID: <d46211b59cb673d99363295b09786a4e3aec53c0.1786518803.git.adrian.ho.yin.ng@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7342683d-c828-49ea-57a4-08def844ec43
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|22082099003|18002099003|55112099003|11063799006|6133799003|56012099006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	r11ninSSFAAP1exFaCMwOmL5oIKL/CG99Nowc0W1mdxBLmo5/+Ciu4x3UThJfzj/lMTn49/z7pgUS0mPcIUEDJvKdb7R7INFVl1ICQACrOBDika4y+Ba4ZhS5caim15WxAUqkjcjNnLEa17AKaEz1OONkTym913pYsAUn5GN0ppxHnBHhEgWKh0EsDuQmaeC8hJdnu71V/KfWyOet/6ccgS6QtXtI4yHKzAjmwDGBxGpKF5KtfJU09cozBmdqWcXhqTbpBDRd/oY0xX9gHkYL3LO29omUYs563tGkbSnFsekbp8MwvSVPepaR5Ct8UF8f70k7N4MhqM2Cva/ue2SVYbFkMZ9nJrPXULi+IO83BWdaBi3OaGsI5KfMbiZp9NM3455ZFOFqW5T9GxYNsGoaJ/AuodJP3MVNK423tOK/WQ+U+hdd7ZYS4G/pArg7znbVLdWYAWgPjs/TcX8uOXDfTyAmIyNp0EllbeCER7HTV+V2laNiwBJGk1Awif8dExE/WeD4oLHZCRs6XhYcG+u0DoxqGA5PiYaBCjDwdVdis3tuj1wgSk6qB8kM+vV40hAOk6rEynnR6lbz3T3CwYVLhFDIGVp9kJAZXGLHPcfhjMQbLTthFhZPDuX44oBFO3yInBTcww0Q8LtVGpdS9kM/Q3XurCY1QodUHC+80LfYuZw3PfhNmLlpss7NTXkncjbpWAowpGyTtLIYJ40sjJrFg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(55112099003)(11063799006)(6133799003)(56012099006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FQo7LA0FLfE5tY1e59PVZe+miwQNCrsky82++IFi6Crv2yYc/5EQJmvsD9FO?=
 =?us-ascii?Q?29DrPmFEClCZe0Shy8RlqGbQsqzAvMPLLtBGhL4H5SPh/ziAUPoeAJeD3HWr?=
 =?us-ascii?Q?BZ05Eu4tCJPX4A+eLmur1Gw47rFhZ9SyzBkr3BEZEPfEJmKM/Bli/7ps6zTm?=
 =?us-ascii?Q?gYgLNuMw73z8mGM+zQC9cnoSXoFv3grpNcxiPP7WGlrbaRLOFyCY/RL8O2oq?=
 =?us-ascii?Q?DHXNMCdsUzBQ6kb7AWAXwKIMw9czIaeI6Ly6blXZp6Wn3cKaszO9f0kHumTT?=
 =?us-ascii?Q?Jtf7vXd+gv22pv6QshtFGxPwSaFZukNR3R4bA/BZgCxdZtWGjWg23PDR6xrm?=
 =?us-ascii?Q?fsq4ZnpaG6fTCaTuDG5yCuvSRry2P49cFq3pYk8xAURHyDq86Kw2iZrZhY63?=
 =?us-ascii?Q?zUsHxK7h0B77zziyr3CodAUAZiaU8GYgrmVBrUmFwzATAGxLszxaLtT0U/Pe?=
 =?us-ascii?Q?iv4PSc7GBfR/nCs7zfsNL06BekfJr9d/HJSAgrPFU+cUc8DIoir7KNRoGidP?=
 =?us-ascii?Q?jBQ/DIIyXY7Lzny0FFogdLkIEtis3WZQhMi0oBy4R1+xhv5EzpoEsT2c4J0n?=
 =?us-ascii?Q?m5dr4T5hYRIo+Rdh2QHdxeSzxOpVcaaPDMSmK9TUGYjKUlLzlHZWc6dO2Bd0?=
 =?us-ascii?Q?NKSqeRWlz6UQQDgx72BGV+J7RfHwXYcKH9DKvhW6XHDTEq5djsyRAcfYDpuL?=
 =?us-ascii?Q?uz+zyaVKFxoVAH0W2tKKQX5I7gDMmyN6eWxBee/A7P7+m7Z86AzbsdNEGSzJ?=
 =?us-ascii?Q?83/jiDBcZmM8igeJKye/4WFF169LWVkWSRy9Dgprr13AE++zX37j9T9cOxod?=
 =?us-ascii?Q?dgWT59pEkEVI2Mo3O78hIjLfUxB3j1EiE31cZ9MSzDIwkXzEFJ/hbmjnrwdp?=
 =?us-ascii?Q?J04QNN9K3NB+OxN8zQOyCAlH4fhir3xg7RQIZlLx3zMC00hlNiIwsUl2fX3B?=
 =?us-ascii?Q?KS1dARKpX1R/BD2pb3HnV3so/TSfZRCpMfXdeh8Oj2MGjOR3//rsmBMMbUhP?=
 =?us-ascii?Q?GIeoQ4L7+GgbRNdrQawct9oxqOWydV5SgOg5AfodZ8Nabm8MBDdQs7akk4MS?=
 =?us-ascii?Q?w1PzOjT7O0EcbrkxBkOh5uuszpxN4Cp0BFft5ziIFn0EFFWb2QxCWmhWVgcT?=
 =?us-ascii?Q?AnhXrpzEqI44vI4f1Q+cpnSezACP6T7YN2Ba+A/lk+kdNAb350X0EpAK0p6p?=
 =?us-ascii?Q?fFKw3skAbWmV2AL+RxD44Vh4ksGCGQUE9xzRB0WAf2q1IFQcaVYJ0giizBaM?=
 =?us-ascii?Q?JP1fxtm2Uj3Rq2fitc5CsfdWCwIcYglwwr/vhz5P9HuKZWIVuCXOmHzk7WEZ?=
 =?us-ascii?Q?izFDsCjcv7REFWhvU+jQfA+ppa9cmvGv/ChmCmDvij+Gzon12g46VUcXe24K?=
 =?us-ascii?Q?LOcd3B6vWSpVhVA/Lp0ffNfF6NWWWhkyzayuQJr81ZrnVP0hvJ+2kMK6ZMIh?=
 =?us-ascii?Q?fGV5s4FGCngDkHBIVbMHS0SQNe7cb9GaZkPjE8i2mq4MSL5Ani9ct/lwWKKO?=
 =?us-ascii?Q?rCxb8hFJru9uIM0XzjSU9MoCdIUryuqedjEXsQhux8Y7AaSQqpMDrDLEaR+B?=
 =?us-ascii?Q?HASJcchKnYYL07C6q4vcT8hxD3Vm4gdgI4JU5YfUr/s72sdazaokNHUu8xdI?=
 =?us-ascii?Q?GsA2bnAUalR1Bn//bjV7T7CPsF0gSITnpF/1fzJxNzvS4dPlx6XEByYM9vW7?=
 =?us-ascii?Q?jKAPxSy6LLTldHiWCxWiLxTgrGVID7qMgBrxJ4wM1GwTMteZAezaJsu+epFt?=
 =?us-ascii?Q?jXiOOGE7BqWh6VOKtR3FfAo23Ia6i4Q=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7342683d-c828-49ea-57a4-08def844ec43
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:40:04.2214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0BiYa2wfdJjyT7DSkrdk6ytQO0YZA9OUF7WRPPiPUkvs1td5EdzJkdLR3OKHwGeskW2eYWAL4ogFXo5ZYwDpcPdB8ps5OQgDtQw4+orqpgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5979

The Agilex5 SoCDK daughter card only provides a USB3.1 interface (USB1).
USB0 is not connected or used on this board. Removing the USB0 node to
avoid unnecessary initialization and potential resource conflicts.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
index dc62772e10ed..ce5e29da1e62 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
@@ -104,11 +104,6 @@ &uart0 {
 	status = "okay";
 };
 
-&usb0 {
-	status = "okay";
-	disable-over-current;
-};
-
 &usb31 {
 	dr_mode = "host";
 	status = "okay";
-- 
2.49.GIT

