Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011063.outbound.protection.outlook.com [52.101.70.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA6D2BE622;
	Fri, 28 Nov 2025 03:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764299673; cv=fail; b=CYn2MoxRyZizlSUS3XR2ymuowL8MjqBEXuT9TlMyfCfd3FXUX/avMcmwKpjLLj0wC1UmhvWfC7BW6Ul1odMK2LbrHRsBp5ftM4hvq4tqAn7XvN2kWuqvMzQalxgZQM3HEa030O94Ie0zM6Ifb/iW62SvMpfiPdN9AQvwt6nqWNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764299673; c=relaxed/simple;
	bh=8l5BlvU7WQhopEGmFqCAmt52cheK9MQuJJ7ekUf88MU=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=C4N1C7q345a5LIMyaGTx/Q5k0oEumnpVPSqwikTuUYa8m2kG9GX86BSnznGGIl4x853oqsECvXoxtZ/hMGo2Pjh8SgvuwVbrosWNFF6DKjCrcsIWyD2MTe04STk1D05YhCiiykcakbVukTmfsxQW/cpCdOSdhpQAkgcOmTTq4N8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rhsctjQF; arc=fail smtp.client-ip=52.101.70.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rhsctjQF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSAOgH9Oe56nEaob2VTeGeb7YefgRVZoUPxxufKntqooEIfStPJpgyzEx36d6i6faj2SoFmos7iVQTScV0X4IjguVNunC7O7c1oSYoHKvKOXDiEMVvLRaGZ5gTlWnnlsrReNcg3PKeJHWkWkhLimXzpD4BeJdFsTkqQakWkDhyepM+qn6ygYJW82c1DazY3HRR9UKSqhum88fHOrzYOOLHlGzsNAbBwUrKXx4JEOp2ruYYuD/ZPUiw5oNLoQ2aGAnScoXKmYKR/Seg72kDyuXujSKvFBHlIkaXBMi0Fo7WVVOIoQvC0kgb+Kvc1Cd57j4RLxy4A3M3FUMSPEUo+iqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eyk5xIZ0lCxFy1qmDzdDm120cQyhzOGKx5f75oHvGXk=;
 b=UqOiU1RKQui8f/BdwoGI3f8lhuYfL8yW17DFDWO9NFjzjgr1dJxKmSQnn46yB0fonGzZJPULj7zLhShL2Z0bMdHKuPUSYjvXDySZEG34zkk7FjBKcyFBWrjP1rzCEhBuo6kakuYBsn+U/yTwEPh75zNYA1/9fUbb66tVgSq+l1I9h2/La5Oug0gYfyGgSkfZLkF+3vxDjMwEeWnvwP0tPyheJzIL93G7ydiLHqwmV0I8S/SHrtCMxuXx28tyY06hRNmzjwO/JvOrYjgoHx2qVOqLILJrKRRnGl6H3BOspZ4CsFZl8heSU/xlm8WaHZTLxeEhz2Wk8BN1uEE28+dTKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eyk5xIZ0lCxFy1qmDzdDm120cQyhzOGKx5f75oHvGXk=;
 b=rhsctjQF/E/3NosurBd7fn2fgad9UkZXTt/9EZRk7BVpXByQGo6JFsK/r2uYPeV4RqZaAepwusodyGJs/JGVhCK0gVBS0JyTyNV4+yTTmUfP5tsGHk1WBuAqoZ0Ji7B7v8sa7+o/G6wZ+IVktZKQxZJoptFdyQ1qJEodPpt0jhmi26LK6exMmLgqoQN+wljKo6yDF1mbQBgpi9eyTd//80jdM1TJCW2gRHZfdquYA2RstMdh171NBGcqzVcxobCNeQt514vmiZcT3M6z6nIaQvHp33X4um4qNsgnVL3YbMAxIforq8W1zhSQ/EFvJAwXoXAoa/iNUC13Qs7SkAet2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DB9PR04MB8429.eurprd04.prod.outlook.com (2603:10a6:10:242::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Fri, 28 Nov
 2025 03:14:26 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 03:14:26 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v6 0/6] clk: Support spread spectrum and use it in clk-scmi
Date: Fri, 28 Nov 2025 11:14:09 +0800
Message-Id: <20251128-clk-ssc-v6-2-v6-0-cfafdb5d6811@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIETKWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHQUlJIzE
 vPSU3UzU4B8JSMDI1NDQyNz3eScbN3i4mTdMjNdI11TczNTizRLExNjIxMloJaCotS0zAqwcdG
 xtbUAMiWvMF4AAAA=
X-Change-ID: 20251127-clk-ssc-v6-2-57658f944324
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Sebin Francis <sebin.francis@ti.com>, Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:3:18::19) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|DB9PR04MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: 00652693-b937-4d16-eb9b-08de2e2c3c64
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDBrVFNMTUR2UVBHem1JVHl2eDc2L0FrcjY5WGN2eDljcEU1Q2Z4OVAyNkx2?=
 =?utf-8?B?SllSSW9qZWM1SE9keVM1TmprNElZMksyUjJLbk1ZSVNFNkRraEVsNHErZ0s1?=
 =?utf-8?B?ZWFoVXVYUGc1eXZzc1lWQUhHOUdQZ3p5WjZ1QlJnaWZsNFdjVEpwbTVXbHAr?=
 =?utf-8?B?SmtPQktrQmN0R0YwVk05R3BWOEtBZ3BCK1pvMEVwQVlpSWhVTjlYSlNSWkdV?=
 =?utf-8?B?MkFTMXJ3L2NkSmRVMUZQZHFHOFE3Wk5sYnNPZmlpV2R3cmRlS2ZaWXAwVnJD?=
 =?utf-8?B?a3FVQnp4RFljU2puMTZIaVdsQ3VBTllYdjJHejM2YkFDU1phZVpuaWgwRnB1?=
 =?utf-8?B?WGhjb1ZmMm9aOGp6SUlsTkN6YnRGM1hxMlhKK1RrQXVrbVpPR2tLWTRZWmYy?=
 =?utf-8?B?VGc1eHRFWDZXV21ja1NpdWZPSWNxazNMcGRWRkJXQU5jMmtwMlMyRnFKYjFO?=
 =?utf-8?B?RDR6eXBhUzRvd0UzMDVndEtVU0MxdEJFTnhrN0dGV29wT2RKMVozdE9HNDhh?=
 =?utf-8?B?MzFrNDZNMnZhRHQzbTZwRHhCY1V1V2NGTTZISjFTM2xYbE5VRm53cE1BejRS?=
 =?utf-8?B?MkVmTmE5SVdqYWVRcExGNThHVW9WK2l0aWRTeFZLbzFpbVJ2Z3RSa05oWjVE?=
 =?utf-8?B?L0J5blBNc0NtZjRVdVN1UzdaT1kza2FCWGZhYmc0MUkvS2E5VGdHc1NJMGx1?=
 =?utf-8?B?cHdlUXpxanBVU0w3c2dIRVM0b3d2UlRyMkV0WWxwbEFDQ2xmYVovazBldGp4?=
 =?utf-8?B?QXQvTEtid0gwa1liaEh2MGUwY1FZRjhhN09ic3MyT2N1czl2alZ1WDA5ZmRT?=
 =?utf-8?B?MFlBV0RJVVlNSjlmVDBmSFFDWjBHRy9CaXIvYXdSUnRiL0MrMlNCWDk5TE1L?=
 =?utf-8?B?L3p3amhVVWFldWtOSnNBcTR5YWh0YmxGc3BCVWZyd1ltdmplMklJV09IWnlj?=
 =?utf-8?B?aVFJTzZlSnB5WmIwN3QwOVlxYmhmVUd2bFlDdlhXaGZTRHdIY0hkcTFOYzQ5?=
 =?utf-8?B?WXVhZ29qYXFKeElkN3p0RGpDWGdPTzdGNVpoM1NjdG55VjFHbkdLMEJpaWRP?=
 =?utf-8?B?TkRrVzFIaXFDaVFuc1p6ZTNIZWVXYlA5M2kvcWpCTURqdnVFTUIrZFYxYUl2?=
 =?utf-8?B?TkIzUzRZOVB0bThFWFZabVdkcjhDaWV1SG5CV05na2xIcUlPUE5SRmhvL3lI?=
 =?utf-8?B?RDg3YnVLUGM1MTlKZDIyUXdQN01YcEorOU0xNnVKc0ZEVWZzbE9SRzFlOWRE?=
 =?utf-8?B?M1pla2dKY0QwVUF2MkhQWmtpQS9mcjE4UnMwekhZZjE5a3BhYVh2anNmQTlr?=
 =?utf-8?B?bTZoaE4rWFVHOGdnRTlvVDF5bzN3aHZlV25KdVBJdFlCeGtoZ29RMXMvUjYx?=
 =?utf-8?B?WUFkbXV2bkFENHhzajhZWXlSaGxGN00xZ3dRRHp5Qi9hNmtjdUJsTXltVGM0?=
 =?utf-8?B?SngyYW1mNEdPUEtIeEhwVVROR29MaWgyMkJDR1dtMHNodjlLOTVyWFlGaVlR?=
 =?utf-8?B?cEFQVW9jZzV6RzlrQkpoMGpMa1VZV3NLd3g2VHIxZ3hQTTI2R3FvK0ZOSnFw?=
 =?utf-8?B?TnVWUkhyT0h4bndvdHJoVGhuRTkyOElSNzhFZ296dys1bk1iWUNnY01vKzFy?=
 =?utf-8?B?NHhpS0xScGh3d29sNVRTOWhubm5XYW0wM01IY01qS0duQktIeUNkNTlnZWYw?=
 =?utf-8?B?d2lod0I0T0h5YW9sK3UvQm51UW56TmVLeGNtVmFLWkxPQmd4QWorN3JZSFdR?=
 =?utf-8?B?VFNKU0M2WWJPQ3dKdUlhdWI5aTNyT3I5TkhKZ1NMVy9YSUhrUDJ5SVhPbFRX?=
 =?utf-8?B?RWdETDNDMU9BaEV4dGVsNVM5RHdLdUNwRXlBc0NudEh1OCtTRElmZzVCYWFI?=
 =?utf-8?B?ZGNFaEhheUhGcERwV25EVC9YV2RlSWZlQXRPWisySFNIM01IMU53UjdIZUpU?=
 =?utf-8?B?bjI3a21EUGd0M09EdXVSN0kyQUFBWnIyRDBsNURtRHpXWjVPNk1kWXlzK0lm?=
 =?utf-8?B?T2NNR2xBbWhRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDVpWGFRUmtUeUN2dS9MSFpUN1FUVXJqWlFteUVzOFcvK25UdjBkZGRTVU90?=
 =?utf-8?B?Ti9zSzg4NVIzRkllUXRXdXhBdnhYcVlUS1BNZVRIVmZ1dE1KRTFUc0xDMWJv?=
 =?utf-8?B?NnMyM1lUaS93cVlLeFhYZDloMVlrZXRZUGE2U2dKbXpCOW1HSlpITXMwVGwz?=
 =?utf-8?B?YjhkdHRLcUgwcU5qTno5b2ZTTXZ1L2pqZ3p1czRibUNVZ2tPZTFhQ2dsT2N1?=
 =?utf-8?B?RmdxdWVhWHhtY2g2VjN0WWhjeHJYb1dEK29Hd1Uva25MSzFmOFNyYUN0MitV?=
 =?utf-8?B?ZEx3d2c2UU9SY3lHOS9TMWxwWk0yNlltdEpYRjVqZ3dwaEtpdUdjaitydWQr?=
 =?utf-8?B?NitxYUNKaWxIS01rSUxwU1BydktpcTNsajZKdGFSTGNlcWpzTGs2UnBSaURz?=
 =?utf-8?B?Kyt6cUIwK3FWZXQwZjJOOXZWdkhBTlRUZ0dhNWd0S0JkelhUZ29hTFBvMnQy?=
 =?utf-8?B?MXpqWW0zeWdhbU11RlkzRXBDVk9lQWFYWmdyNVdqbkhsdkt0MCt5b01MSHl1?=
 =?utf-8?B?Qzc4MFppMTI3UUw0eWRCbVJjMnE5eVpQY0RsSmNYNmFFWUxabHQwS2o4NXRV?=
 =?utf-8?B?UEszbEY3TGRLa3VhQkJoWWh2M21CeTlGeFcyc050OE9IbUtsUnUxMThJVmdh?=
 =?utf-8?B?MWVrMmQ3RXo0NzA1YTBQbVJZMkhPYXgveFRyc3AzcERKSngySHIxN3dJOWxO?=
 =?utf-8?B?VWhCeVFZcnZIbGF5RG03VC80THFrR0tkd3dkbU5pNUZNbEpDbFdMV1M5NDI3?=
 =?utf-8?B?Z1Z0d3Q1YUx0SDJOSHpDS3Y0SDk3UE5JanJaWGtnQUJldkFRd3hFMk1rVGsy?=
 =?utf-8?B?aHFKOUZYZFFERXp0c0xBaG1kRER5akx6THd6MUVYUDZLTTJMUEVPbUhZVVNy?=
 =?utf-8?B?QXd6S2c5Z2hwaDE1MVRlSlFkM25GTXByQVhBdDFkOG1EcUZBWjIyU1c2VnE2?=
 =?utf-8?B?S2R4YnQvTkNZSlZXenB1VXdEaG5SN0JmSkpvb2FiUDRuWXlwWTdnMWRNRjYv?=
 =?utf-8?B?Mzh3R0hBY1NaQ05RNW12em5VZk5jOVgrNlJwZlZMUUF6T2phaW9KZjBBcXVn?=
 =?utf-8?B?ZVlIeFRoMlFkK2NicDRiN05xOU5KYUtXYmhpRjREbzJLRjc2eFhva1hHRVNz?=
 =?utf-8?B?MFVlbDg5KzVqZ0dDY0tac09sQUVTS3hoaldBWEs0TmRrVzllblV3MitFUVVW?=
 =?utf-8?B?L1gyMkZNTUUvVmJ4UnBkcDUvd0J2eEpGcHNabXNzdkV5ZDYvRDR0UHVvNU5w?=
 =?utf-8?B?RmQ3dTlBMzEvcEhDVHBLM2wrK2djTlpDNC9CWTlHdzRETFJoQnlzYWtEZGlS?=
 =?utf-8?B?N0dFbFFwNDc1SmMzRno1emJaOFVWbER5NlFqWTE1U0dyZ0hGbGxOTnZpaTdn?=
 =?utf-8?B?eitBenh5a0JHTGtFeHZCVHkzaUQ1VzNjbEFsK0Jtb0I3YVFFUXc2Q2lHTHdy?=
 =?utf-8?B?QkVNa0hBQTJTSEU5NG9OZ0VMNjJUczRldXY5TWpsUnpFUGszZkFGU0YrRnlm?=
 =?utf-8?B?bGtHUnFBTi9xaU9jdWM0cXgxbWVZUXNSMCtQL1Q0dVN5U0FkUjZ2ZkdNMTNj?=
 =?utf-8?B?YjV3ekZDZHdmSlByTTZNYTNnbGg2K0dFY1VUSmdXSUtxNG5pdUQvVkw5bkhh?=
 =?utf-8?B?NDBiUUYwSmwyMkxqZkhRVnhBWVZiK2orL3lQaHdINS9zbW9aMTUwV1pVQ0Qw?=
 =?utf-8?B?UEdyemZOR0t3WEpvSjMrWVZCRnM5U3NoRGs2TC9aV3U4ampXcVJBa0JhTk5q?=
 =?utf-8?B?eFRaMWkzdVc4T2dvc1BmRXJ5N0JWNExlK2xpeDdsWWxoTkY1Tys5bDNPNG00?=
 =?utf-8?B?TXJZMkFTaXU4K2Z2Y2Z0ZVVkVlR2Mkx4N2d1RmxSZ3M1Q2QvYVFNUUtLZzhy?=
 =?utf-8?B?SVdoaXdvd0VxclRobUgrRDN0ZExhd05VSDY5TTNpb3BxM2hpWDhsWVY1enk2?=
 =?utf-8?B?eHRvMmxpRzdSOXpGdXc5Z3NWb0xnMll5OExPbGF4S0k2OGxNZlF4bUNxb2x0?=
 =?utf-8?B?SzlXZ2dpamZZR01CUmJvL0tGTzZSaFY3ZjRtNUVQbVRwRlNDelYrMnNwUFdk?=
 =?utf-8?B?ZFR0ZGRzTTc0aFhsNzJraWlxNmp4a0o5L1RoSVg0djgxbVNBdFEwandrTlpq?=
 =?utf-8?Q?cZywZPC2Urn/owaPjmQ9+CBre?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00652693-b937-4d16-eb9b-08de2e2c3c64
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 03:14:26.0833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3g66Ho9jlDH23pFrIe367QyV8tYQX4/cpOuWqCrg/UnkVNeycRagJTeVB6+Bjf/7tMOW+iVA+CQQDtygjw0M8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8429

Since the assigned-clock-sscs property [1] has been accepted into the device
tree schema, we can now support it in the Linux clock driver. Therefore,
I've picked up the previously submitted work [2] titled "clk: Support
spread spectrum and use it in clk-pll144x and clk-scmi."
As more than six months have passed since [2] was posted, I’m treating this
patchset as a new submission rather than a v3.

- Introduce clk_set_spread_spectrum to set the parameters for enabling
  spread spectrum of a clock.
- Parse 'assigned-clock-sscs' and configure it by default before using the
  clock. This property is parsed before parsing clock rate.
- Enable this feature for clk-scmi on i.MX95.

Because SCMI spec will not include spread spectrum as a standard
extension, we still need to use NXP i.MX OEM extension.

[1] https://github.com/devicetree-org/dt-schema/pull/154
[2] https://lore.kernel.org/all/20250205-clk-ssc-v2-0-fa73083caa92@nxp.com/

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v6:
- Add kunit build warning
- Update OEM string comparation per Sebin

Changes in v5:
- Per Stephen, export clk_hw_set_spread_spectrum, use enum for method,
  add const for set_spread_spectrum and rename clk_ss/conf to ss_conf.
- Per Sebin, Cristian, Sudeep, I added clk-scmi-oem.c to support vendor
  extensions.
- Link to v4: https://lore.kernel.org/arm-scmi/aNQPWO6pfA_3mmxf@redhat.com/T/#me81231bf286e2a8e4e00a68707ed1e525a2b4a3d

Changes in v4:
- Add R-b for patch 1 from Brian
- Drop unecessary change in patch 4 Per Brian
- Link to v3: https://lore.kernel.org/r/20250912-clk-ssc-version1-v3-0-fd1e07476ba1@nxp.com

Changes in v3:
- New patch 1 for dt-bindings per comment from Brian
  https://lore.kernel.org/all/aLeEFzXkPog_dt2B@x1/
  This might not be good to add a new dt-binding file in v3. But this is
  quite a simple file that just has four macros to encode modulation
  method. So hope this is fine for DT maintainers.
- Add Brain's R-b for patch 2
- New patch 3 to add Kunit test per Brain. Since Brain helped
  draft part of the code, I added Co-developed-by tag from Brain.
- Link to v2: https://lore.kernel.org/r/20250901-clk-ssc-version1-v2-0-1d0a486dffe6@nxp.com

Changes in v2:
- Simplify the code in patch 2 per Dan Carpenter and Brian Masney
- Rebased to next-20250829
- Link to v1: https://lore.kernel.org/r/20250812-clk-ssc-version1-v1-0-cef60f20d770@nxp.com

---
Peng Fan (6):
      dt-bindings: clock: Add spread spectrum definition
      clk: Introduce clk_hw_set_spread_spectrum
      clk: conf: Support assigned-clock-sscs
      clk: Add KUnit tests for assigned-clock-sscs
      clk: scmi: Introduce common header for SCMI clock interface
      clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver

 drivers/clk/Makefile                               |   8 +-
 drivers/clk/clk-conf.c                             |  69 ++++++++++++
 drivers/clk/clk-scmi-oem.c                         | 103 ++++++++++++++++++
 drivers/clk/clk-scmi.c                             |  44 +++-----
 drivers/clk/clk-scmi.h                             |  51 +++++++++
 drivers/clk/clk.c                                  |  27 +++++
 drivers/clk/clk_test.c                             | 121 ++++++++++++++++++++-
 drivers/clk/kunit_clk_assigned_rates.h             |  10 ++
 drivers/clk/kunit_clk_assigned_rates_multiple.dtso |   6 +
 ...kunit_clk_assigned_rates_multiple_consumer.dtso |   6 +
 drivers/clk/kunit_clk_assigned_rates_one.dtso      |   3 +
 .../clk/kunit_clk_assigned_rates_one_consumer.dtso |   3 +
 .../clk/kunit_clk_assigned_rates_u64_multiple.dtso |   6 +
 ...t_clk_assigned_rates_u64_multiple_consumer.dtso |   6 +
 drivers/clk/kunit_clk_assigned_rates_u64_one.dtso  |   3 +
 .../kunit_clk_assigned_rates_u64_one_consumer.dtso |   3 +
 drivers/clk/kunit_clk_assigned_sscs_null.dtso      |  16 +++
 .../clk/kunit_clk_assigned_sscs_null_consumer.dtso |  20 ++++
 drivers/clk/kunit_clk_assigned_sscs_without.dtso   |  15 +++
 .../kunit_clk_assigned_sscs_without_consumer.dtso  |  19 ++++
 drivers/clk/kunit_clk_assigned_sscs_zero.dtso      |  12 ++
 .../clk/kunit_clk_assigned_sscs_zero_consumer.dtso |  16 +++
 include/dt-bindings/clock/clock.h                  |  14 +++
 include/linux/clk-provider.h                       |  31 ++++++
 24 files changed, 580 insertions(+), 32 deletions(-)
---
base-commit: ef68bf704646690aba5e81c2f7be8d6ef13d7ad8
change-id: 20251127-clk-ssc-v6-2-57658f944324

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

