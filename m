Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.84.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795394727;
	b=IqqHJ6EYy/V9cwoauZclQhrKwEF966BVIJDxDgvqOpFnusXaKXoNZbsJiHUf+AmBLcjk
	 rirSmkOSipaHb0At9H3gRXdHfRUlZ8xF/CMc+g/lb3XCjTJ1/oGn329aX7ruKgWPGzp5L
	 se8PDwJTTlBiJ34G32ktMx/7+TFlnGJntle0G9gm8Ba6pVaMQ0kHnfC9c3g/WDHJfXfpQ
	 TCFHyIBD3jpFTdF01D+MnjNFBE0+wre4d7elLyKVNpwNLKuqkJdi2645nbExYtlRGsNI1
	 /Xyx8tJPh/Xa8NdG7pD44jxD8dg9VsJKxSKYihLY1p/5EzPYmQ1BYbuTIwemeMA+xUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394727;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Mygv9yfdzTnzhZU+iErvdAHE+8we2lJsJVVu5kpfCU0=;
	b=IIeO8fTsTbuP2cZ+a9oLrJCRoa+S6mgDJ67ESkvmAt6KLNk8E2Sz2vAznkTxdop/BFxv
	 0r1ktuUQ5Hfa8qixYFk7l4W9VcKGAM1o88RPjf6Eau1Xo8vWij4VlbrDkcVe9RXy99VXN
	 9Q8wuxbyiHly/jsaWcwbidCBk/zxnrp1D++mppjae3iygnj8551w8B/WXS9Gq1nv5DmIE
	 DLyvktqGhq+yFB/lvKpK7F8rGl4PvhPvmamGaX04rJ4FsCVdX54+tDY/BwsV5aZ4n2oIA
	 6ihjSxIINNsBtAR9Z5s5GQNmT93Q4mxxwRs8bjsRAjeNoUVv5DVJ/+LSDnVPJDkbydw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=KQeCjmRK;
	arc=fail smtp.remote-ip=52.101.84.33
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010033.outbound.protection.outlook.com [52.101.84.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A422B606A31D;
	Mon, 23 Nov 2026 00:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A422B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=KQeCjmRK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LhfBvPnwo3Vkh7313JcW6FoMV0w3AybvZwfNgY6Fs7bLOnNxEXnMBrKuItgfoFYHn3FbGG1kf51zAfjSzuZzOHfgbrzg6oiRApLLtjbJk4Q5D0XU7WlUiZ4e9ijFH8EVfdEy//aCeNMMzg1OuPDUxWdxOCOPMuWCckK8nhndPwh4wYlt5xUNhkkXeE2OZnhdbYtoV4pwjjoAGk5OsjJ1807Dwob6ryXONbwwaoPNWO4S5qlZDMqwdRTKvNmKq+p0ow0fJMpkU/76W2k9Lda4TXdxDCjxfMxFt2J6t6OgkUpR9HCHDoLOhMe3TqthvlE1KAdMQx+0DVzzhoR5WdA7pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mygv9yfdzTnzhZU+iErvdAHE+8we2lJsJVVu5kpfCU0=;
 b=RyLaasUo8JT69DvMTsmIIHIQ3Kd9rNXIBEMmJJF48w+KD8yX1NwoS8oSw9vk3LxvZ3IrzhfEKUBIqdOk4Xo1oVYNsDhX4UzUO5H3gUTzfstkG6yuF/US9UTfMZ717PACH+5PBRhJaVPnV2oLGxVZPdx+045RhGX/RD9lkyxuxbIjPlAXyTBtagJGIjCKajP7UfYKcMwEs+YRiPjCS/eoBWOuXBgOrkKfeUOOyIGypgpbe/khVs3ltFeCKZjoEhVWoqigFUQUxvh7OlckkKZz+MwNwMPir29H38N7Use0qGdi6yZC7Pli5tj8ZM2PCO8YTX2aGE+qtBfhHaVrv3HS8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mygv9yfdzTnzhZU+iErvdAHE+8we2lJsJVVu5kpfCU0=;
 b=KQeCjmRK5RG3WeUfz1ZR8iB5u0xCxIuXmlXbgHpel8BtahZAMTMqw7kcUIBt/BEcWd1EqIrsTjqsBhpw97ImxF28uwN7mj+vLe1tu4dFdFYrxBkja7dYTFZhBPZ/OAutXpiPtI/Ac797WBQasf3ahuvBvdr1rrrz/8+MIoqa7HfZ7PEexNnDZCeTJZrF68aHQqOaz2N0z3AqxgvkVk9dTnfe05DPNN5so3FzkRnO0eDoyDopZxTnVnakOjGJjWQQfDgCRuHkKU+K610hB+d1xQCSw25GVZcmQoz9AA34XZOZ5kGCe+oDTKYSpVDMdalkQjrwXtdi1p+DxtMxrCL6dw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AMBPR04MB644081.eurprd04.prod.outlook.com (2603:10a6:20b:7da::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 00:45:23 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 00:45:23 +0000
Date: Mon, 23 Nov 2026 08:50:26 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>, linux-amarula@amarulasolutions.com,
	arm-scmi@vger.kernel.org, michael@amarulasolutions.com,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 2/2] clk: scmi: reject SSC configuration out of the
 OEM field range
Message-ID: <awON0ibzB7zVj7kR@shlinux89>
References: <20261104103620.4054694-1-dario.binacchi@amarulasolutions.com>
 <20261104103620.4054694-3-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104103620.4054694-3-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AMBPR04MB644081:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f80f97-a873-4f82-3efc-08df48fb0ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|366016|376014|1800799024|23010399003|22082099003|18002099003|6133799003|11063799006|56012099006|4143699003|261102123227099003|261026121527099003|261022075727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	6L5VIvhgYGeTxWuNw611J4W5dBcBcZ4255+YfvXTIw3D+DBwJv9N+q42uEZ47gvEkF4CT6rNb3UtRsopiAjoiEj6VeAFBzgJ1xPAbcZMldPQ9tZ+hzpHsCg2h+M8gx0mDAFC+nAne+BwZbvJ6KK6bCIzU6ZKXtqiEgkcLG+LdYw/Mm1I7Ki2qmMpbcdI835UyUHEpWnus5hdru0ersTpv/q7Qjy2zQZFTaoEZlTCcP6XLprwJqxRlu0/pR4Ytr8SNjALZvGR7tpUF1zczYPBimLYwf6KLa2VuwhfkntWjntij1cqJ6rD5aovoFlFVFCUg5u07zmhhwAsgh5tiC1x2f6kcEzQ2vfv+UZpDdYT88ZNaqZpEhBrlSy1aSoCRwxnxDqRj80UVeNF1XfrkMy+apKTxe4J/jhPjcuX4UmMudn+QdvKlqiXBug2EU3ll0sbC14rcwfCT56+8g/xw/xHRKwxxU2gOxAW1mHodYAFV50jfYzEGNPe6GnRL3nuAgwexyuIJ8AG2W/fSzOw093cKY7gnk2v5hFPfcM5+tm1/afXkfmgFPxCUq3yOTvXVx+RuBl4dmcEYw6Hw9mPhilO2rj61ERYV6+gPGLQijp4zABl2MgUWDj20aE8kw6Mq+Hc+8So/W6z3nXE6qKHb1vRrTdAB/k0Qf50uaDmjbpHoI0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006)(4143699003)(261102123227099003)(261026121527099003)(261022075727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K/J3uzIqc5zeOeuBDzJZrP7hU82HgSsKd4H9EBUvMmq7SAyt3VS3broxd5wp?=
 =?us-ascii?Q?8yGdsct83FbpefqOtnvTgjjCbIJpkuL51RbLHVxDVaW9uJfLiGY7tUL6tbZe?=
 =?us-ascii?Q?CwWllQlUfZJ25AvzOMZ1/Fb5AkiDfmsH4CFOcRcI01Zp88IkqRPmpt3ib3VX?=
 =?us-ascii?Q?2GKyqxPw2c3u4Y6dMp0gYi5JSuN8l7gHoe+niaR9zaC/6+WHIqMn6oGTHxRn?=
 =?us-ascii?Q?FTfsUgiLBIWzoJYyf4YCiBk6aK2wImgVSK8zQTATK3yg8w7E+fvuWVkPuY0f?=
 =?us-ascii?Q?byuw3ljXAS9kVFkpGINzPN1+Poqr8AIMZa+HLzcWXowTe7/uXJZnNEmky04H?=
 =?us-ascii?Q?rfPeF+oTtvsloA5kpH9XPs0tjA4zW8toSCt0K6g1UeqjoONZhNZo9cCHbzCi?=
 =?us-ascii?Q?JPBKo2fLTqhCO97WXp5bjAVPVi+IQXMPTrrLA30tDm0DE8T3Wr22hqlIDtOW?=
 =?us-ascii?Q?dGS5FIkS4vLIraRPto2xv8TghvK5MkpKV0CugT2ZjEPdO01+rNhNhydK9D0T?=
 =?us-ascii?Q?xwAFLDflYzdT9hsQQUT+Xe5G783zLrwTpc7lsYPOY996oL6WMX9B8mvvDrwt?=
 =?us-ascii?Q?NFSJM5DJ3aQHs3fmbqN8qIH7UM7xR4adWf1uIA2p7diZrU8ZWp/uTnLhUlAo?=
 =?us-ascii?Q?OUndmoe6Ly+0SaV9ZGunwiBouv1jxvBqfZxRA5n8rsJQAqLebtaPedarSFHy?=
 =?us-ascii?Q?46e8bsSlAFZ61oWX9f5gIAZtZazPUj9gXIwVxXiuqGTm8CKzAz4UfPzcEMpV?=
 =?us-ascii?Q?TNU4hU4b4yi16pZFm2ZvseFMPiS5gtp+aCyDPhKU4w2ZJIAT5BiO84/BCAdF?=
 =?us-ascii?Q?+VqG2oV4B75GrFw48Kvz4sAQB2eNGNs/+pN4xkRmAiUfyrQqgVb4Zce48P15?=
 =?us-ascii?Q?J5h43FuklHb9VEYV3eTbcRcm6pnyE5ug1m1rIrecQCR8iNe6jPofytWK6c7I?=
 =?us-ascii?Q?q3ZCbhyuvse9aphzorUKXCRq6GcUl8HEgijeoRsAlBqcKj36hVztaFkTvZPa?=
 =?us-ascii?Q?7OocyHxIId/uEOQblE0i4adFcCAT6X+15ZcH7Jj4+vaLA+vMJDSNBstptfCu?=
 =?us-ascii?Q?PYhIfyL1v1BYIGGkceaxV4s5wDcA58LFPJtqQsYWMT97rZ7v9pbzi8bfwQfS?=
 =?us-ascii?Q?oAy9SuL4smINnkpa45eYJEtQJuvQpu6KwGAaaCN2m6rB8U4OfbJ9YtNk4bt2?=
 =?us-ascii?Q?2jkNTLd7DLlsaFKrNFwiX2ZXP5LlKHXAeCYQHbhPChApK230oIX062wyiofk?=
 =?us-ascii?Q?5hOrRtn0O/bnUFDYAMN5Qfs8Y+zaKCEjwxu/pIuNofQ0K1prtdt+t9yYKda2?=
 =?us-ascii?Q?gkLc5iZ2+sDVGeh15WRBegSqWTaE4yr3QEBXhslhoy70v9UwcvARui2EqxWu?=
 =?us-ascii?Q?WrGHE59mlkZcDzrFok6ZT0CioJem1hhC5d/ENJ305g/7xzKFrl6Wm6zxmwP/?=
 =?us-ascii?Q?vAeVXKM04P+iZtxNR4uw8ZNTgE7HEo/L94p0TaUETK2Mg7SMaOiB9cDI+NWI?=
 =?us-ascii?Q?I9v+XApNBPSVn2Jh4klefAxJHMs33/XVP/Lt1yBSmJIyfKf2JxB8h03in7Yv?=
 =?us-ascii?Q?QjPYC8DECaifCpjtcoIhjkuV/VJCWuQ+568E2B5+cpHqP2FfR00MKujBdRud?=
 =?us-ascii?Q?xItSgd/sOVqG2TobcXpIdrbJcazRKydQ0bRyhbpB9ePk8E4pa+FKCgeUm0Ap?=
 =?us-ascii?Q?WnfetD3J8JS+9Q+5IS+DYRPKi1/VfRh8fZaqCu6jX2EMCkkjYP8kkjy97qGP?=
 =?us-ascii?Q?WyL5TRTyzw/EiPSIuFWGEP4JILX+MsugeQoj18HEcCS7sZ7xxnQ+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f80f97-a873-4f82-3efc-08df48fb0ec3
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 00:45:23.6452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1r9gJmOtitVL8fAB0Xl2fZC4SYU0pjW2hNt/ixjtA6rsaZX2QqZvNbKowMuJdIYETYb6hWcp5IO+VN76kUrVhX6oD666IR3I2s5sbkHnN8vIP53QUIdLqybbx1NCg/Hg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB644081

On Wed, Nov 04, 2026 at 11:36:03AM +0100, Dario Binacchi wrote:
>The i.MX SCMI OEM extension stores the spread in an 8-bit field, in
>tenths of a percent, and the modulation frequency in a 16-bit field.
>
>FIELD_PREP() silently truncates values that do not fit in the target
>field. Moreover, the conversion from permyriad to tenths of a percent
>turns values below 10 permyriad into zero, which is then passed to the
>firmware as no spread at all.
>
>Reject these cases with a warning instead of silently programming a
>configuration different from the requested one.
>
>A request with no spread method disables SSC, so send a zeroed
>configuration to the firmware in that case, without checking the
>spread and the modulation frequency, which are meaningless then.
>
>Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
