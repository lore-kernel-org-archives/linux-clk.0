Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DFBA92D
	for <linux-clk@vger.kernel.org>; Thu, 29 Aug 2024 05:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724910862; cv=fail; b=Yrmk38/KvsYXC5d5ejqxw3NDAh+qSNobSNFwOcQPkJXLllzu40ekqbZ2JnrG7wcYy+CbFMsUDbJk4beXvww3NnarLau6Tze6VBotATC+3kQyHXx8SFFhhIScQC6A9Z8RkldU+ENLBXr4nrDsMNMbcxtgoIAAQ5EbRunsvx4Bz1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724910862; c=relaxed/simple;
	bh=VzBvxBW5SLjYRfxdzDmysJ2BskMn3QcAcxOHGfrSkz0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VDnJR6aPI9S5Z19wPOKt+M1xr+Z731j9Ju1J1kbtZFoBqasney53wSCXVDnyQLNaJu6+3OyYgXWqDgGaO2sM9OxVFOn0czDWs3Y6L2UF1zBA0b24MfUztovPq5R5wiz5o0t59RmIN9m1dmByqYgMMndrawWNxqxmNTJUOXPjXTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Sr3PnfzB; arc=fail smtp.client-ip=40.107.92.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Sr3PnfzB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMxboZ03JgVnvjKQBuACVSVdoK+WbZXRm2VpjeDgmSMU8eCEEEmBU5gaU2cd2mvsi647DedzbnEG/Q5B6OyUbYBEJJwVYHKXZksHfGaYprc0pSPI7HiwVjhNRGkD0VIts7PLhXB8qGvtm2j7D5ys0p0Zch3GyT0hVXVC2aZMyRmVHqWLxtS7D6mr2C4XjhH2uMt6xiWfEXfTdQhH5WJrdVlAP0WfA7uHPn3jQsBxculs+zMF5p9Sz8dZgdiaC2QiL2CKPZOePiZpOwFYHfcv0zawDyt9sL/uGUOjUrmFgMx5AULsfPLu+Bn9jx5O0TmzIp1tJF7IODI+8jOu70m5sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzBvxBW5SLjYRfxdzDmysJ2BskMn3QcAcxOHGfrSkz0=;
 b=sfQi8Dh59VCgj3G3OM7TQFN4JukH499hKDND9bqIGGOVRzG96VN2vqXDPtMURpJKxcOnY5fXje4lZbFBbTkTd6zsQ8XazwB7UL5yg4FxSq/w0Hwsx0U9jT2CSr9hS85htqQDC7ZawJt+eAjX3iv8d5e3jc2mAGVIow1RX/j4pOr5uT3Fh1BkXTQs+JNdh1i0saPMuy6BGECn5XNGoAiEbrh251MS3UnjIvlbZ4Cjnt+QGCXU81wAIO1N0B88qR4Vl3HbdUBBhRrAUjOvTv9LCHBJUgIDmdDAAlw+UNBUzXgu7v2ogfVGOVSqDPf7Q+ZvVjB/LF8mnRjS4xsmclNDLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzBvxBW5SLjYRfxdzDmysJ2BskMn3QcAcxOHGfrSkz0=;
 b=Sr3PnfzB51Kd4966Ftc0TSBF8XNUXHZKUujlQoJ/HaBWmmq5u+n8LrMMo5wneXY9WtAX+a2NHK/xsRCHmyxEbVAkKRnyStH5HAbmTAunjm5JEpVFuUX9owbM0ygjvqEf/MlRstNGtq2da46uGh+dULeg9GLt1mhGxQZARVL4lIY=
Received: from PH7PR12MB7284.namprd12.prod.outlook.com (2603:10b6:510:20b::18)
 by SJ1PR12MB6340.namprd12.prod.outlook.com (2603:10b6:a03:453::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 05:54:17 +0000
Received: from PH7PR12MB7284.namprd12.prod.outlook.com
 ([fe80::52ac:918:fc6:8092]) by PH7PR12MB7284.namprd12.prod.outlook.com
 ([fe80::52ac:918:fc6:8092%3]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 05:54:16 +0000
From: "Trivedi Manojbhai, Naman" <Naman.TrivediManojbhai@amd.com>
To: Stephen Boyd <sboyd@kernel.org>, "Simek, Michal" <michal.simek@amd.com>,
	"Thangaraj, Senthil Nathan" <SenthilNathan.Thangaraj@amd.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>
CC: "linux-kernel@" <vger.kernel.org linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V2] drivers: clk: zynqmp: remove clock name dependency
Thread-Topic: [PATCH V2] drivers: clk: zynqmp: remove clock name dependency
Thread-Index: AQHa3DFjsadbNYIEYkaS7Q2JUnj/tLIeEaqAgAWcUdCAAF+UgIAZ6Krg
Date: Thu, 29 Aug 2024 05:54:16 +0000
Message-ID:
 <PH7PR12MB728472C3022ADCD8DF5576DD8A962@PH7PR12MB7284.namprd12.prod.outlook.com>
References: <20240722121910.14647-1-naman.trivedimanojbhai@amd.com>
 <ac67f76d4b4b5f4bf108c1457f1263c7.sboyd@kernel.org>
 <PH7PR12MB72845D56BF4361441AA9CB9A8A852@PH7PR12MB7284.namprd12.prod.outlook.com>
 <1234a0176de236abb603f96ab9a1d6a1.sboyd@kernel.org>
In-Reply-To: <1234a0176de236abb603f96ab9a1d6a1.sboyd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB7284:EE_|SJ1PR12MB6340:EE_
x-ms-office365-filtering-correlation-id: c2fdb806-154c-4786-6dc6-08dcc7ef045a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YS9CNmtiZm5tSjJVSkpuYjQ2K0Q0ajRtN28yYmR0TlhwUmRYNEJuOWM5Tnd5?=
 =?utf-8?B?ZmxLRW5rVXAvOTEwN1VJZHBpcmo3TDNIVmRwMDUvMGFTUlovdFpmeWJ3dFFl?=
 =?utf-8?B?di9GamlBZFc3VW85UmJ1dkRsZGQzVEx2dEVJS3ZlekZ5ODBwS3JsQ2M2aVpG?=
 =?utf-8?B?TWQ0aHgxZHBFcjVzd1k4dGJ1d294UC8zaWc1S1lnbGhDVjd0VlhnMnRubE4r?=
 =?utf-8?B?SUZSZ1d4ZjBxUnVHNy9mRWZvRVpzRVA0MkdCZlFHWVBYR3FyMVV1ZnlVckRr?=
 =?utf-8?B?NkZtUVdPREFTZ3g0Rjh6aDJVV1ptdEpubWtKN3VLSkVIYU9lZFlkRmxBT1U1?=
 =?utf-8?B?QkVMTDVqNGZDQkNBSTdRaDVqMzhXWm96ZmNaaTdlKzdaQVRkSngrb1M0WXpC?=
 =?utf-8?B?bXlSV0FuVjlBV0dyUERMa2Q4RjNlbEl0WUJOdnRQUCs0YmUrQW80b0VLRGZm?=
 =?utf-8?B?VkNCWlVDNFJOZngzV1VQdHlnQkplYld5ZTU5ZFdURElEUno0bDNXa2dwcjZU?=
 =?utf-8?B?a25DUkY1WGpkYXhzYy9xY0pvTEFRZUtIOWRDMXMwbTEzMWZWZjdFbGs2VXZX?=
 =?utf-8?B?b2xIMVBVeTEwT3lQaUNxZGlrd0hmdmpMSU12VEM2WUx3MUNMbkJhTGlEZWVE?=
 =?utf-8?B?ZTc1aHhtV3gzc2JvYW9yRnZya05FcWVncFhoeTFQTEEybnhBL0s4Z1dUbmZj?=
 =?utf-8?B?VEpBMmNGU2hjb1phcGJvYitreTNrZ2ZCalNDUHBlS1QycFIrUU92YklCYmhk?=
 =?utf-8?B?L1lRajNHcGNJaE1NVWFBNXhRT3RVRzl3eDRiRjVmOHhocU52bkpjS1E4VFc0?=
 =?utf-8?B?VU0xSjNYY1l0aXZOdTVidlA4a1RtRno0bzkzczdDVjVaZC96OFBISzRsSWFt?=
 =?utf-8?B?UlovZURqMDNVTkk3OEhQemRYdzMzeGZhZFcyYjZuKzJJSDVHZ0FmbGsyTTRt?=
 =?utf-8?B?QnBqRG9pOHhPTDRMbGV5NzZMemxqOXh0NUVZaTJDSk1CcnY5L1ovcDBzbElP?=
 =?utf-8?B?QUorVVhuR0x4bXlJSGNjYlFQNk4vUFRvdUpGSzR2bWU3Ni9QTDdPalpVTmZr?=
 =?utf-8?B?ZGVVSk90UjRlNFJPTUdDdXh1NGE3M1g3M255R05IKzUrSlh0L1E3K2c0U24z?=
 =?utf-8?B?Q1VxVUFZamhITHNobW5hekR5TXc1ajFyQllIT0NWcHFVZFYyb1gvZzgwengx?=
 =?utf-8?B?VEM2dS9Lb0JETEJxQW5DL2xjVnFmRnArUnNyRzR1WUVRREJQbm94eTI2VHNQ?=
 =?utf-8?B?eUI0SC9Vbm1FUHRsUTN4REZoQlVaR0xWdDRROFhFeWp6dElRc3ZRbmluWXlu?=
 =?utf-8?B?TkhlS3hOQVgwOUVUbEl5eWloblBZaGZtMjZuTWhBRk9GWEg5Nnk5Z2ZycFYv?=
 =?utf-8?B?M0dnTERCZmJabHJzRS9YUGlKT2F0TFI2d0h2OHBNVU9ScFQyaDQxditUd2ds?=
 =?utf-8?B?MWNIQzJobitsNDlrRzdTTk9IZmNlRndPaVRiY1ZhQytjUzAwZ2VqL2NiUVUr?=
 =?utf-8?B?aGdTYlJTeTM3RTVhUTlKZXk2YjZNT3RzZWd3ektlc1d0dE55MU5xR1lRNm9r?=
 =?utf-8?B?cktFRVhmRUM2dDdKYi92SGN2YnFWc1JGQ2NDNHJUdDNJUlIvdWNLSzNwdXVF?=
 =?utf-8?B?c3ZxejlUSEJCM212QXJYWWowczQ3eEYyUTlUd01LL20rZ3puRVBET3ozd3FW?=
 =?utf-8?B?ZjBZVEx3dTEzMzFCQ0R2SUFJM0lZOC81THo3aTJXaUMzdmxKMWF2ZE5kNWtK?=
 =?utf-8?B?UW13cEFJT016QUFZd2JMUkhKMm1Oa3hBODZ4eTRHVXVaYmU2amYyMmpYTVZK?=
 =?utf-8?B?K3dVY25HakdkR09LVjArTk1Cb21xQStCYUdtdGpCM2FRdkUyT3lBTk1oMVVD?=
 =?utf-8?B?NG5oRDdkZFlHRFpIeTdrV0RsTFlobHJteEdCVnkyazRCemc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB7284.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aUNWN0VLZHB1c2tNTy9jK1RsMUh3M3l0anJ3T3MyOEw1OXZQSkt1QkVsQnN0?=
 =?utf-8?B?MUsyT2tLV3pzS1A5bm5xYndZaHpvQUNTVEZWYmhOUXh0WGMyS2N0Um1xT0lG?=
 =?utf-8?B?WmJ5WWE0bnR5WVJBMk5WYVNYS1FxUDU2RnI2VDFVc0laRVFtRFlyUHRPRHFF?=
 =?utf-8?B?bkZWSkIrV1drOVZ6OExIV3BUbTdRa2VGd0pCTFRVZ1QxZnpQVmZSQ25oU2V6?=
 =?utf-8?B?TytkRm1RYmpzdVJPby9YT09yMWwzNitCTngzS20zWk5QNXZTaXA2bkJ0b2t2?=
 =?utf-8?B?WjFYKy9WREt6MWszYndaTU9DWkdJNVE0dEtVdTd2YVVPczBVbnArckt3bTlx?=
 =?utf-8?B?c2Z0RWEvZWJLZVpKSm0wWkxDZGhjMDZGdUhZQ2EvcW8wcFdES1k0NzRhdkYx?=
 =?utf-8?B?S2lDWENLbllLMU9VbW00RnNZZnk5eDU5K0VVQ0ZhWDZwazZ3aUZwYTdjMXVz?=
 =?utf-8?B?MkROeWVaZGZvdWx5emJZaVVRUlhWMmJoUCs0ZkxETjZEZTJtd3U2TlZ0djFZ?=
 =?utf-8?B?bkxWN1NtcHJVeTA1OVNvZjdqakwza3dvL2p6bTgwZE81LzlPWGlpMXRGSEtz?=
 =?utf-8?B?SFc1c3FSZDUzWFlOdVhadElxMjhBZlhEOHRZeWdIamdFSUd1aGt5c1FKRlFl?=
 =?utf-8?B?TW8vZFdNZVFsRUJqbDFlVnY5Q1pTcU1ndC9NbndycFNnUmc1RGJ4YXFXSXBR?=
 =?utf-8?B?eUs2Um9tNDY5UW5ZK1pYZlhmQjJNcEZ4OFJxa0QzNEoxRVhyS2lvbG1KSVVR?=
 =?utf-8?B?dTYxSVlYc0o2eUlOQTVveXFzNmk3djJtL2xBZlVNbWFZTm4wU1ZRTXRvQ205?=
 =?utf-8?B?SG1mZjNhZE44OGg3NWZuUEhWcUlDODUwV29GcEFTSTR3VnlleUJQaTFPRENL?=
 =?utf-8?B?ekpSbGR1QTJKTlB2SnRpNlozYmNJTkhSQnNUSzd0WGJHWFc1QmF4RVRzRHNB?=
 =?utf-8?B?SmVTelUrR3MwOEROa001VXNGLzkvVkZVdFF0UnFndnZWSXNTOXE3OVIvaDVF?=
 =?utf-8?B?dzh2eVVTMUcvOXBxK0JVVEh4aDRLcmt2V2NYM3hEbW92S0kwa0JvdWo1dzNN?=
 =?utf-8?B?RUx0V1JZMFAxWE9XZzVrQzhtSjhmRVV1SGE3YVMyUnVsdmEyVExVQ3BqVGI5?=
 =?utf-8?B?OEF4d01wQmg1VExiYXNqaXdCeHd4UjhrZWN3WjhIeTRXRVlIdmtoeU9UT2RF?=
 =?utf-8?B?K3c1cGk5c0xvUER2cWxWTlZrYzdsV1pkZFNaRHN1c1R2NDc0Ui81MTdscXJa?=
 =?utf-8?B?Q3VZamVHeFpQMXZTR2s0M3JGY3NuQ1Erd0hCUDgrU1lzZ1h6eGxWcTRGV0p1?=
 =?utf-8?B?bm1qQWUxU01yckdYaUhTTWlXdkhTVWNHcVh5SVFOb1VaSWp6SnpPNU4yOGU3?=
 =?utf-8?B?TzdEajlZN0VBbThYVVhHV0RuS2R6NVlXb1R0dHRTQkNtNzZtbkJLVGp6eTk0?=
 =?utf-8?B?N2JsdE1CWHYvV09yR3VaNkxtbEpaVHlKZkxHOHZjRlRyRWN1VTFqdE45K3FM?=
 =?utf-8?B?enkyRjB1amIzRU8xdGdKSWErMEtDV2ZYWllXVTdpdlhUUXVSRWhVeFY5M2F0?=
 =?utf-8?B?L1Z3NjhPamx6WWk2ZGhOai80TG9uaGE2OXB6eFBWOTBjTGxCYmw3Y01OYjdm?=
 =?utf-8?B?RHc4c0pGcm5jeTFkVWo3amFNT1FwbWt6K0Y5bWM2aHEyZUlKTW9GMW11eFlV?=
 =?utf-8?B?LzJkeHFhUCtDR2dqU3U0WFRPeHZ1NFV1azNlV1MwR2dsOHlhdkw3WlFuY095?=
 =?utf-8?B?M1R4QTN5bEpndkdFU2E4QWxkeW91d2ZvSkt6YmE0QlhJL3pMRHgrOFBURjZB?=
 =?utf-8?B?Z2pEMlFNajNKRWVBVG1DMXp5MmlVMkhCbDFsTmJRdWk3MEdJRk93eVBzb05F?=
 =?utf-8?B?RUxJdk5VOWtBZWZUa2I0bTc2a3JyUXByMTV0OGdLeTZRWTJmeWdGNEVWRWFG?=
 =?utf-8?B?MGhucUxScEh3ODR6YWtZelBsUEx6TUhVSmJab0JLa05jNUZIdTh1OTBOYXdQ?=
 =?utf-8?B?MTZBQVlCSzJwczNhV0dza2ZUdDl6K3p1NnZ1YU8wNnlucjJjOStIemdPM0xY?=
 =?utf-8?B?YXhNVXBUNTNDRThSanZNQ2dPeDJlRTAzWURSdmEvSU83R2Z1WHBsWTVmSVZL?=
 =?utf-8?Q?TDxk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2fdb806-154c-4786-6dc6-08dcc7ef045a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2024 05:54:16.3358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tAytoP/38+XmGWq0csW3C+F3DD8P0HLCTKV3E9NL+42wjOXFQ0qxUUgkSsG/djR+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6340

SGkgU3RlcGhlbiwNCg0KVGhhbmtzIGZvciBzdWdnZXN0aW9uLiBQbGVhc2UgZmluZCBteSByZXNw
b25zZSBpbmxpbmUuDQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFN0ZXBo
ZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4NCj5TZW50OiBNb25kYXksIEF1Z3VzdCAxMiwgMjAy
NCAxMTo0MSBQTQ0KPlRvOiBTaW1laywgTWljaGFsIDxtaWNoYWwuc2ltZWtAYW1kLmNvbT47IFRo
YW5nYXJhaiwgU2VudGhpbCBOYXRoYW4NCj48U2VudGhpbE5hdGhhbi5UaGFuZ2FyYWpAYW1kLmNv
bT47IFRyaXZlZGkgTWFub2piaGFpLCBOYW1hbg0KPjxOYW1hbi5Ucml2ZWRpTWFub2piaGFpQGFt
ZC5jb20+OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+bGludXgtY2xr
QHZnZXIua2VybmVsLm9yZzsgbXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20NCj5DYzogbGludXgta2Vy
bmVsQCA8dmdlci5rZXJuZWwub3JnIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+DQo+U3Vi
amVjdDogUkU6IFtQQVRDSCBWMl0gZHJpdmVyczogY2xrOiB6eW5xbXA6IHJlbW92ZSBjbG9jayBu
YW1lIGRlcGVuZGVuY3kNCj4NCj5DYXV0aW9uOiBUaGlzIG1lc3NhZ2Ugb3JpZ2luYXRlZCBmcm9t
IGFuIEV4dGVybmFsIFNvdXJjZS4gVXNlIHByb3BlciBjYXV0aW9uDQo+d2hlbiBvcGVuaW5nIGF0
dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZy4NCj4NCj4NCj5RdW90aW5n
IFRyaXZlZGkgTWFub2piaGFpLCBOYW1hbiAoMjAyNC0wOC0xMiAwNTo1NzoxMykNCj4+ID4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2Nsay96eW5xbXAvY2xrYy5jIGIvZHJpdmVycy9jbGsvenlucW1w
L2Nsa2MuYw0KPj4gPj4gaW5kZXggYTkxZDk4ZTIzOGMyLi5iNzkxYTQ1OTI4MGUgMTAwNjQ0DQo+
PiA+PiAtLS0gYS9kcml2ZXJzL2Nsay96eW5xbXAvY2xrYy5jDQo+PiA+PiArKysgYi9kcml2ZXJz
L2Nsay96eW5xbXAvY2xrYy5jDQo+PiA+PiBAQCAtNTQzLDcgKzU1NCw3IEBAIHN0YXRpYyBpbnQg
enlucW1wX2Nsb2NrX2dldF9wYXJlbnRzKHUzMiBjbGtfaWQsDQo+PiA+c3RydWN0IGNsb2NrX3Bh
cmVudCAqcGFyZW50cywNCj4+ID4+ICAgKiBSZXR1cm46IDAgb24gc3VjY2VzcyBlbHNlIGVycm9y
K3JlYXNvbg0KPj4gPj4gICAqLw0KPj4gPj4gIHN0YXRpYyBpbnQgenlucW1wX2dldF9wYXJlbnRf
bGlzdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCB1MzIgY2xrX2lkLA0KPj4gPj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKipwYXJlbnRfbGlzdCwgdTMyICpu
dW1fcGFyZW50cykNCj4+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3QgY2xrX3BhcmVudF9kYXRhDQo+PiA+PiArICpwYXJlbnRfbGlzdCwNCj4+ID4+ICsgdTMyICpu
dW1fcGFyZW50cykNCj4+ID4+ICB7DQo+PiA+PiAgICAgICAgIGludCBpID0gMCwgcmV0Ow0KPj4g
Pj4gICAgICAgICB1MzIgdG90YWxfcGFyZW50cyA9IGNsb2NrW2Nsa19pZF0ubnVtX3BhcmVudHM7
IEBAIC01NTUsMTgNCj4+ID4+ICs1NjYsMzAgQEAgc3RhdGljIGludCB6eW5xbXBfZ2V0X3BhcmVu
dF9saXN0KHN0cnVjdCBkZXZpY2Vfbm9kZQ0KPj4gPj4gKypucCwNCj4+ID4+IHUzMiBjbGtfaWQs
DQo+PiA+Pg0KPj4gPj4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwgdG90YWxfcGFyZW50czsgaSsr
KSB7DQo+PiA+PiAgICAgICAgICAgICAgICAgaWYgKCFwYXJlbnRzW2ldLmZsYWcpIHsNCj4+ID4+
IC0gICAgICAgICAgICAgICAgICAgICAgIHBhcmVudF9saXN0W2ldID0gcGFyZW50c1tpXS5uYW1l
Ow0KPj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gb2ZfcHJvcGVydHlfbWF0Y2hf
c3RyaW5nKG5wLA0KPj4gPj4gKyAiY2xvY2stbmFtZXMiLA0KPj4gPj4gKw0KPj4gPj4gKyBwYXJl
bnRzW2ldLm5hbWUpOw0KPj4gPg0KPj4gPllvdSBzaG91bGRuJ3QgbmVlZCB0byBtYXRjaCAnY2xv
Y2stbmFtZXMnLiBUaGUgb3JkZXIgb2YgdGhhdCBwcm9wZXJ0eQ0KPj4gPmlzIGZpeGVkIGluIHRo
ZSBiaW5kaW5nLCB3aGljaCBtZWFucyB5b3UgY2FuIHNpbXBseSB1c2UgdGhlIGluZGV4DQo+PiA+
dGhhdCB0aGUgbmFtZSBpcyBhdCBpbiB0aGUgYmluZGluZyBpbiAnc3RydWN0IHBhcmVudF9kYXRh
Jy4NCj4+DQo+PiBUaGlzIGRyaXZlciBpcyBjb21tb24gYWNyb3NzIG11bHRpcGxlIGRldmljZSBm
YW1pbGllcywgYW5kIGVhY2ggZGV2aWNlIGhhcw0KPmRpZmZlcmVudCBzZXQgb2YgY2xvY2sgbmFt
ZXMgaW4gZGV2aWNlIHRyZWUvYmluZGluZy4gIFRoaXMgaW1wbGVtZW50YXRpb24NCj5zZWVtZWQg
dG8gYmUgZ2VuZXJpYyBmb3IgYWxsIGRldmljZXMuDQo+PiBUbyB1c2UgaW5kZXggZGlyZWN0bHks
IEkgaGF2ZSB0byBhZGQgaWYuLmVsc2UgZm9yIG1hdGNoaW5nIGNvbXBhdGlibGUgc3RyaW5ncw0K
PmFuZCBtb3JlIGlmLi5lbHNlIGluc2lkZSBlYWNoIG9mIHRoZW0gZm9yIG1hdGNoaW5nIGNsb2Nr
IG5hbWVzIHRvIGZpbmQgaW5kZXguDQo+UGxlYXNlIGxldCBtZSBrbm93IGlmIHRoaXMgaXMgcHJl
ZmVycmVkIGFwcHJvYWNoLg0KPg0KPkl0IGlzIHByZWZlcnJlZCB0byBub3QgdXNlIGNsb2NrLW5h
bWVzIGFuZCB1c2UgdGhlIGluZGV4IGRpcmVjdGx5LiBUaGlzIGF2b2lkcyBhDQo+YnVuY2ggb2Yg
c3RyaW5nIGNvbXBhcmlzb25zIGFuZCBtYWtlcyBmb3Igc21hbGxlciBhbmQgZmFzdGVyIGNvZGUu
DQoNCkFncmVlZCwgdXNpbmcgdGhlICJjbG9jay1uYW1lcyIgYWRkcyBzdHJpbmcgY29tcGFyaXNv
bnMsIGhvd2V2ZXIsIHR3byByZWFzb25zIHdoeSBJIHRoaW5rIGNvbXBhcmluZyB3aXRoICdjbG9j
ay1uYW1lcycgaXMgbmVjZXNzYXJ5Lg0KIA0KRmlyc3QsIHRoZSBjbG9jayBkcml2ZXIgaXMgY29t
bW9uIGZvciBtdWx0aXBsZSBwbGF0Zm9ybXMuIEFuZCBhbGwgcGxhdGZvcm1zIGhhdmUgdGhlaXIg
dW5pcXVlIERUIGJpbmRpbmcuDQpTbywgY2xvY2sgbmFtZSB0byBEVCBpbmRleCBtYXBwaW5nIGlz
IHBsYXRmb3JtIHNwZWNpZmljLiBXaGljaCBtZWFucyB0aGUgZHJpdmVyIHdpbGwgaGF2ZSB0byBo
YXJkY29kZSB0aGUgY2xvY2sgbmFtZSB0byBpbmRleCBtYXBwaW5nIGZvciBlYWNoIHBsYXRmb3Jt
Lg0KDQpTZWNvbmQsIGNsb2NrIHBhcmVudHMgaW5mb3JtYXRpb24gaXMgcmVjZWl2ZWQgZnJvbSBm
aXJtd2FyZS4gVGhlIHBhcmVudHMgb2YgYSBjbG9jayBtYXkgb3IgbWF5IG5vdCBiZSBwcmVzZW50
IGluIHRoZSBEVCBub2RlICdjbG9jay1jb250cm9sbGVyJyBhcyBtYW55IGNsb2NrcyBoYXZlICJp
bnRlcm1lZGlhdGUiIGNsb2NrcyBhcyBwYXJlbnQuDQpXZSBkb24ndCBoYXZlIERUIGluZGV4IGZv
ciBpbnRlcm1lZGlhdGUgY2xvY2tzIHNvIG5lZWQgdG8gcmVnaXN0ZXIgYnkgZndfbmFtZS4gDQpG
b3IgZXhhbXBsZSwgYmVsb3cgZGVidWcgcHJpbnRzIHNob3cgcGFyZW50cyBvZiAic3BpMV9yZWYi
IGNsb2NrLiBJdCBkb2Vzbid0IGhhdmUgYW55IHBhcmVudCB3aGljaCBpcyBpbiBEVC4NCmNsa25h
bWU6IHNwaTFfcmVmIDogcGFyZW50IDA6IHBwbGxfdG9feHBkDQpjbGtuYW1lOiBzcGkxX3JlZiA6
IHBhcmVudCAxOiBucGxsX3RvX3hwZA0KY2xrbmFtZTogc3BpMV9yZWYgOiBwYXJlbnQgMjogZmx4
cGxsDQpjbGtuYW1lOiBzcGkxX3JlZiA6IHBhcmVudCAzOiBycGxsDQpTbywgaGVyZSB3ZSBuZWVk
IHRvIGNoZWNrIGlmIHRoZSBwYXJlbnQgaXMgaW4gdGhlIERULCBhbmQgaWYgbm90LCByZWdpc3Rl
ciBieSBmd19uYW1lLiANCiANClRoZSB6eW5xbXBfZ2V0X3BhcmVudF9saXN0IGZ1bmN0aW9uIGl0
ZXJhdGVzIG92ZXIgdGhlIHBhcmVudCBsaXN0IGZvciBlYWNoIGNsb2NrLCBjaGVjayBpZiB0aGUg
cGFyZW50IGNsb2NrIGlzIHByZXNlbnQgaW4gdGhlIERUIG5vZGUgdW5kZXIgJ2Nsb2NrLW5hbWVz
JyBwcm9wZXJ0eS4gSWYgc28sIHRoZSBkcml2ZXIgcmVnaXN0ZXJzIGNsb2NrIGJ5IGluZGV4LCBl
bHNlIHJlZ2lzdGVyIGJ5IGZ3X25hbWUuDQogDQpCZWNhdXNlIG9mIHRoaXMgcmVhc29uIEkgYmVs
aWV2ZSB0aGUgY29tcGFyaXNvbiB3aXRoICJjbG9jay1uYW1lcyIgaXMgdW5hdm9pZGFibGUuIFBs
ZWFzZSBzaGFyZSB5b3VyIGlucHV0cy4NCg0KVGhhbmtzLA0KTmFtYW4NCg==
