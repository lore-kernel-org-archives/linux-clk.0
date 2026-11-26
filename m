Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795683833;
	b=ANgCb2e83jVBda4X4fjTtvYtfEbfQ+jilqFG73qlXTQo+eg52V4qq0z1tgeOvAkv5dZT
	 rJmDQ5iUyG/MN0JL9h/mzeV6ylP/yoO9096vE7PFV7IWMSuLF+NWb1dg6it9j2+UZDseQ
	 0FPKM9x0cGapK5f9x3NwkYV5El0mRVcZSBLDZledVfVmwoVDfyEd+unfAgXmvhLpwq83X
	 NkzN5J7aH0yIJNFbVI058IX4AFSdf2Akm++sWOWT1HgSp5+II2xKXtUBIiCy7uvgDTMaD
	 JAvpYDjkpbGtmj7W7Vo5Cg/HCELmBFrX91LYj8lBZvngnmxDGJGEzMMQmEUGgG6ojnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683833;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-CACHE:X-CID-P-RULE:
	 X-CID-O-INFO:X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:
	 X-UUID:Received:Received:Received:DKIM-Signature:Received:Received:
	 From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-traffictypediagnostic:x-ms-publictraffictype:client-request-id:
	 request-id:x-ld-processed:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=UBqu3JyE7+jClVYP94jq8ZxemSEqbVadAWX5FMel/54=;
	b=VlfnfClBvAV4gjdPs1Hl8EFzncC+hKOWsrO9u86xTF4TzBZnP+PG+GrKWeRcx1hmSB4g
	 4MvC8ILgHMCC7BhIcRNvHrQwazedHuKN7zVFFk/Me0xt013c3mm4Ha1EUzmDBEFDxHeG+
	 vse4EtYdhALDfd9S2Zsyq1GcHmDYsa2xvqk0z8/VF3aze1YGdPQLzwDN1qIIS6lbTXw22
	 QBzIt6iG4mEG8ugzdyZA/PKiD9RMogUCMQx5MK4VnEyfXttNWoKOBKwV63eKFARug8MfP
	 pGL7BSSh7aSEW6mtf9Fq8fUPh/Oj49Nrw9eePGz5EulXC2eDvJ/FZD8uhjtCexqLgcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ljA+X+gs;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=sgluaCS4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6875E606A31E;
	Thu, 26 Nov 2026 09:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6875E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ljA+X+gs;
	dkim=pass (1024-bit key, unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=sgluaCS4
X-UUID: 49aac348e97811f1a7aecdb2598be72c-20261126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From; bh=UBqu3JyE7+jClVYP94jq8ZxemSEqbVadAWX5FMel/54=;
	b=ljA+X+gsQP8Ybd1JcYv3qpHZdsiaYDRijQh+r/Vk3I+nYlCuPI8cFkKTS1erkjJXB5c/M4cH3lroV4BQMuWutEjsb8UYg0aF7ck1RA8tfNvpwRvlp3iUxHqnU/4pP7En/GcdZTpQFQvxfnZOEkZ2magK4+6y1YbzIK7zGJeCITs=;
X-CID-CACHE: Type:Local,Time:202611261622+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:4b26207c-169e-47d2-8cae-f1b86a9c9791,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:4ad3e5a4-9c91-4436-9e93-208691c4dbe5,B
	ulkID:nil,BulkQuantity:0,SF:80|83|102|110|111|836|865|888|898,TC:-5,Conten
	t:0|15|51|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 49aac348e97811f1a7aecdb2598be72c-20261126
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <echo.zhang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 876891314; Thu, 26 Nov 2026 17:03:46 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 17:03:45 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Thu, 26 Nov 2026 17:03:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=am5kBho7F8l2cgn5979UPTcbqjODitHy78FsLfun5sFq3P3Nwb/IMIL3ejm7MjhZmidwZ+paPjIhmhBSvNXeBQTOuLISosZfr7/TFnTBTmTquT7a0Q7rYmJOpVE9xw8IB0HMCXnwLxFmzlg5C9Cg+BUy2lxnuTlOfoeS1EXKdifGBlRkkjnhLsYVv9m/5RqHDoTCxM73Do9NcB+A/ResBiYKNeLsmnvjCtnRwDe4SqVxc0zUnzT/4vJ4wsjrfLjtXpBxqDF3ehDa+2SBhpkEtej4kKMAmIoZJga4ndNAeM9XkYfp5CgbX8lsz3Zs74AZZZmUwcN9fJy2hMqrtF1D7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBqu3JyE7+jClVYP94jq8ZxemSEqbVadAWX5FMel/54=;
 b=jUX7ndKnZuqPtFhLMUFlMt1XoE9wpr+tIStS6E2DRgDJp66UGIU/ziUp184KklpiljfgKTPQFXuvLu0ItxNV0Ddaq70UY8xCoPs9///2I/yxpwiaRlcih8LBcvMjdQFram4Czuk0/lBLNTxAxYd8dqDr+NtuXFfPSCchTX+lhaiyeRkTAavMSvX/gsICAlUE7mA1qcvB7SCfL9T4IBwYKdv8zdzLVLC84UrNXO4FJ7UC0ZosX1z5V1K0sp9QM9Kg8xBIDkXjpIhEGKrPsMNeZZNj5kMWFdB/eEngU0JDX9Zx42/r5EMAShx7pUV+6DcViD6MGKbvcb3pE1QgDL1FAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBqu3JyE7+jClVYP94jq8ZxemSEqbVadAWX5FMel/54=;
 b=sgluaCS4yGBJNfx/5NStSXgotenBtjQ8FMuMk/tjqLjpsD8ohV2M3XFTfXnyxdrNCUNHnmuGxjVXB46s8uiqvLLELhDgRCSzxgl3jviKVKF0zHRVZn/kmqR7GbTgvrz2pjzTuKuqME8d9HREyXh+OBRyRmnuPuMrb8m28BbzizI=
Received: from SEYPR03MB7814.apcprd03.prod.outlook.com (2603:1096:101:178::13)
 by TYNPR03MB10154.apcprd03.prod.outlook.com with HTTP via P2P; Thu, 26 Nov
 2026 09:03:40 +0000
Received: from SEYPR03MB7814.apcprd03.prod.outlook.com
 ([fe80::4c1f:6338:5176:9943]) by SEYPR03MB7814.apcprd03.prod.outlook.com
 ([fe80::4c1f:6338:5176:9943%4]) with mapi id 15.21.0639.012; Thu, 26 Nov 2026
 09:03:40 +0000
From: =?utf-8?B?RWNobyBaaGFuZyAo5byg546JKQ==?= <Echo.Zhang@mediatek.com>
To: Ben Grisdale <bengris32@protonmail.ch>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, MMDVFS Team
	<linux-mediatek@lists.infradead.org>, =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?=
	<Kyrie.Wu@mediatek.com>, =?utf-8?B?TWluZy1GYW4gQ2hlbiAo6Zmz5piO5rGOKQ==?=
	<Ming-Fan.Chen@mediatek.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: Re: [PATCH 4/7] soc: mediatek: mmdvfs: add VCP backend
Thread-Topic: [PATCH 4/7] soc: mediatek: mmdvfs: add VCP backend
Thread-Index: AQHdfYUHaxA1H0exmkOioYbbhqgURw==
Date: Thu, 26 Nov 2026 09:03:39 +0000
Message-ID: beab80959fa22a1c8647131ed3953a273e43c449.camel@mediatek.com
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic: SEYPR03MB7814:EE_|TYNPR03MB10154:EE_
x-ms-publictraffictype: Email
client-request-id: 49cce3ff-73d0-499c-b4cc-50fe0f3a83dd
request-id: a8dd7fa4-e4c7-4891-ce86-08df4b9c29f2
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|261102123227099003|261021121427099003|261028144727099003|261022105027099003|261026140227099003|261022075727099003|261022113327099003|11063799006|56012099006|10067099003|261026121527099003|18002099003|6133799003|261009223027099003|3023799007;
x-microsoft-antispam-message-info: ItbHILo5dse9WEKfn07bSmmixjvuP2EqeOEXXKndL2ynydOdzBbDOB3cYzt3vU1cvXghxxLmCKrX5W0vDKawnLUUoa+f80neK+3nXH7eMHranrwespeix1WA22LVd3lSkMWqYczvjSlSXA9sE1U9lIUyKxsquYTDrgnzkWWAX/dr5ifrBA+pnBg+h2FDTmqY5+OJRRaF4diVGeh6gkaFJHnYp3cLK5IEUlsiEaKUPgTM1UEedXPpic757Jt6p5b4SiLRmzfoBwRjVvRiVRYS07WFcCM6/lw0Sm5ipisVAnH3kEDlNlb9XOVvlen/DxxmfvoviGDqXJk6+nQ46GsWbPtKpHLbvO8E9arbilQ+6KiQvTx+rYcaaIruRZePp/VM9ZybXe3t9cymkYk5wjq+oSCpe5UXjvC9AoLnpwHpi8/kPehENj+F8vD0bosvVy7b33PdeooFcYmLfQrsWuM7jw+xXwQTpi7xXUDdaUBzBsQnCmRQMatz7kh5Fy5dawirPP3ZYZRYnzsR7xUEdePUdVhWs0Yq4RG3eay5bFWBf/25v9yzacdBNZml346O2WoG3f6iYiRewq7g5tILHlXaxs994JP9+7PzLc2nLDPQ8Ui5fd2TEx9/Xd0ALbvktZHqvMjjHC+MfYuZwoHVfqu6XPd0APrd3pM7W2q6Zj++uow=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(261102123227099003)(261021121427099003)(261028144727099003)(261022105027099003)(261026140227099003)(261022075727099003)(261022113327099003)(11063799006)(56012099006)(10067099003)(261026121527099003)(18002099003)(6133799003)(261009223027099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2dLUTI2a1BPa0FOYXpHK3NvNmtSYStNRlIyZVNlMG9iWm1RS2ZSbExReHlR?=
 =?utf-8?B?ckhKT0d4d0VCTERMaHZuYWY5aG5vOXBnL0VRUS9FdUZqQW1SbXdhdlJKMHFo?=
 =?utf-8?B?Z2gxRjRqTFBpZVZSU3BuTnRCbGkwQ2FBQXBMemZWSm9SMlRLRWZ2NVp5dFkz?=
 =?utf-8?B?MmJrdTJyZitYbkVadzFKTnJUN2c5WVVJVmxSZTJBeHJPNks3V1p3K21LclVG?=
 =?utf-8?B?bEcxbUFWMThOYnZRTUQ4MkQ3QWtPR1JNTU84VHREQkNpaVNsbitSdm0xUWtt?=
 =?utf-8?B?clhEUDFKUXArd0M5bExQeVpGVER4Z3BBTGo1eVBITENOWkFWbzFVYUVRWUQw?=
 =?utf-8?B?VWNPbEdSRGdHam9zMVE1anpGUHlLQmtxc0ZMOWhOVGZxeEFQYzRZYlZGM3VC?=
 =?utf-8?B?djVlTjdxT0ZlK1ZqOVRITnlHNDdhWWQwcUhWdUZzZG5xMHlQa1p5K0U0N0gv?=
 =?utf-8?B?RGYwRUZNamZhb0k1MjFpTnRTWWI0aERwMFNPYW8zaWs3c0hJeFJkZUMrcEJL?=
 =?utf-8?B?Qm9yT1U5MDlSejNGVUdRZWdlS3BROFV1L0lDY0t6M2lSNXpSMTRwSiszVTY3?=
 =?utf-8?B?NDJSRXJ4Slo0VWJabXc2WVlUb3RGaHFxZG5jazk4ZnAzaG1RSWNUaE1SSEZJ?=
 =?utf-8?B?N1FTdXVZbTJRdkRrc2crekJMYnZ1UEhkak9JMHRKbmdvM3c2bDdoSWtXd1FN?=
 =?utf-8?B?ekEvNmwyRjhCT2o1VmtYMHlFT2Zyd0VIcjVvendnMTBHTnFOWW5NY01aRGlV?=
 =?utf-8?B?dE93VW5kakRhcjlLS3hraHZLSXduNzlUV1o4UkhRcE5lTW50RHVaYmQ5b3lH?=
 =?utf-8?B?cnVaTEFMNlY4dTk3TU5nY0dRUWFhOFpCN0tMU05wRkxtc21VU1BTN1lrUUFh?=
 =?utf-8?B?V01FOTlGdFk3YkJVKzlZc2JYVVR2Ky9pRU9kTUNqS1FXNTVrZWc0Umg1OTQw?=
 =?utf-8?B?NVJ6eGFoYnlmMXl6TkpJcGRTRFdOQnlxRVc2aTFqQWliTTZOazhXS0d0alQw?=
 =?utf-8?B?ZUg1am5aMU9EYVlMT0w0aVVQWDZqM0xlYXNUNk9ScDVqdG1sNEZJcGlTc1Nn?=
 =?utf-8?B?NGtHTmlBRHpvSXNCTkkvc3Y0OXM2a3ArdjdZVktIeVJMNlIveUFQc2p1Mkhm?=
 =?utf-8?B?YUpNemlqOUh3LzBXU0NSS3lVUGM2YXErcDR2NjNzczFzQm1HQWhoMFlXeGZa?=
 =?utf-8?B?Nyt1dlNPK0JtMmZHdFJiTm4wcURtVVBBVXlxcTlwZGd3djVtdk8xb1FKVE5S?=
 =?utf-8?B?VklFTVJ0WEh2VkI4WjA0ZkNQYzZhdkhUVzE0bVNvdHkwOG9POTBUM1daZFZx?=
 =?utf-8?B?L2NQT3F4T2l3QkJSNlBpUEVTdHV5bVFFSEZHNG16VnptRTdXUUNuSjlOdFJt?=
 =?utf-8?B?TGRZN1c2NnY4UldYWDFWMno4Vm0wbXQxUU1iWEJCY1g4c3NqaE9FenBoR2hj?=
 =?utf-8?B?a1JkMlVVSGNnYSswT2ZzeE9aTk5FaWRxY2EwcVlVR2VzZ3QwWmw4OUw4SmdR?=
 =?utf-8?B?RmcybGtpbkdsbWlKL1BIbE0venRUSnpvWUl5Q1o1NDZsRVhibGNXaXc4cno0?=
 =?utf-8?B?M0JwWTZJU1czbEY0bVpVQk53ckxaREhZcGUvaEszSlI4UzU4UW1CUE1tM0Z2?=
 =?utf-8?B?emVqNzJwOHMxeGdkOUNyR2g4L3RZMTZBVlpvUCtISERoNEJhdnJjTnNVZVFv?=
 =?utf-8?B?VVNrUHlqdWx3SlkrbUlVMDQrT05FQnVMTTFuc3FVUzA4Zy9YbmU4TWRkOHls?=
 =?utf-8?B?NnQxLzlVeU1YZEw2OFN2RlorbDJTd0poZ0VIckFKN0tmaUszVFoyWnFHNksv?=
 =?utf-8?B?dmNjVy9lYS9wTzBWYnJzQnhTbytOMm92OWlWbUFDYVArUlNKaEt3YVRqR24v?=
 =?utf-8?B?cjNQR1VHSnUvTUk0bFZYSHpMekpiL3pzcnB4R1k2V3h0WGI0MjlhbFZuZDZO?=
 =?utf-8?B?R2RWL1p5S0FLRjNEc3NENWE1SGxLN0RNaGxWc1FBN3ZCdUJ3elI3dVJSUlN4?=
 =?utf-8?B?eEExelVmOERhM2NYOGY2MCt0cFVUOWRsMTFHMkM3Mm9ZSmpwelU5UGt2Sis4?=
 =?utf-8?B?alV1eHF0UUNJUkZvZTZvdEVwVDBqaVVyUWpZU3NVZDc1YVhDOFZKNEFIR1pn?=
 =?utf-8?B?K0ZZQWc1RFJrUm1YRjR1MjhDbWRIUCtOZGNpVVRTRk5PQi9OWUhGYlpQNmlw?=
 =?utf-8?B?anUwL2NLallLTnNHQkhicVB4WnFTUERqM2lsWXBNNjFMaDFYalhYWlRzNVVI?=
 =?utf-8?B?N0FtdlBndHlaUXU3bWMrNkxMVmE1c0VOOTN4S2FRRXhxTGdJWS9nQ2dYZDJi?=
 =?utf-8?B?bnB3U3IzcnB0cUpxc05HTzh1TjdkYW9qVDBmMkZrdkZsMnhiRmg0UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: EKWq2Vr/sHEPmBXUKVRsL1doNmARzdwkxl1BhJYBUQh6BqrZW+Iqa0Xo0Ihs5ZG542eRYttIMgUa0P2go3v2h/eu1Z/7kBAcnmutzqgSXoWe/xVo3VvwqxHlk9sdl27R8UeGoJEPSDODMJeWHk9upPLTJU5VH7LyPBzveYRdM8uCSj7XKpMsuSML0x7NuV79+QaeEyVNPvVY8eBaig8K6Mxt2Tz+9vDVXIMJAr8uIQFxg2RcGxGAZFgG2WTU7MPsTO7dDn0RspfZfzGxhfzhcVn9VZDxb1fGD+3BfCzwR9TzRsshKbHRA4vZAHhvA77D4fGmQhSgzFnoIkWLn4kK+w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7814.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8dd7fa4-e4c7-4891-ce86-08df4b9c29f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 09:03:40.0243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3ZIrA5TaB1mu1JtcRXuBZcC5NuNntkGDg7bSrol6OIJ602HqTYsV2Q1MMaH55jtCJ5LBiz3mxdbqStKhLyEnCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR03MB10154

SGkgQmVuLAoKICBUaGFuayB5b3UgZm9yIHRoZSBkZXRhaWxlZCByZXZpZXcuIEkgYWdyZWUgdGhh
dCByZWFkaW5nIHRoZQogIEFuZHJvaWQtc3BlY2lmaWMgYXRhZyxib290IHByb3BlcnR5IGFuZCB1
c2luZyBpdCB0byBza2lwIElQSQogIHRyYW5zYWN0aW9ucyBpbiByZWNvdmVyeSBtb2RlIGRvZXMg
bm90IGJlbG9uZyBpbiB0aGlzIGRyaXZlci4gVGhhdAogIGJlaGF2aW9yIGNhbWUgZnJvbSB0aGUg
ZG93bnN0cmVhbSBpbXBsZW1lbnRhdGlvbiBhbmQgc2hvdWxkIG5vdCBoYXZlCiAgYmVlbiBjYXJy
aWVkIGludG8gdGhpcyBzZXJpZXMuCgogIEluIHYyLCBJIHdpbGwgcmVtb3ZlIG1tZHZmc19nZXRf
Ym9vdG1vZGUoKSwgdGhlIFJFQ09WRVJZX0JPT1QgY2hlY2sKaW4KICBtbWR2ZnNfdmNwX3NlbmRf
aXBpX2ltcGwoKSwgYW5kIHRoZSBhc3NvY2lhdGVkIGJvb3Rtb2RlIHN0YXRlLiBJIHdpbGwKICBh
bHNvIHJld29yayB0aGUgVkNQIHJlYWRpbmVzcyBhbmQgZXJyb3IgcGF0aHMgc28gdGhhdCB1bmF2
YWlsYWJsZQogIGZpcm13YXJlIGlzIGhhbmRsZWQgdGhyb3VnaCBub3JtYWwgZHJpdmVyIG1lY2hh
bmlzbXMsIHdpdGhvdXQgYQogIGJvb3Rtb2RlIGNoZWNrLiBXaGV0aGVyIHRoZSBkZXZpY2UgaXMg
ZW5hYmxlZCBvciB0aGUgbW9kdWxlIGlzIGxvYWRlZAogIGZvciBhIHBhcnRpY3VsYXIgZW52aXJv
bm1lbnQgYmVsb25ncyBpbiBwbGF0Zm9ybSBjb25maWd1cmF0aW9uLgoKVGhhbmtzLApFY2hvCgpP
biDkuIksIDIwMjYtMTEtMjUgYXQgMTQ6MzIgKzAwMDAsIEJlbiBHcmlzZGFsZSB3cm90ZToKPiAK
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbAo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRl
bnQuCj4gCj4gCj4gT24gV2VkLCAyNSBOb3YgMjAyNiAxNDowMDowOSArMDgwMCAiRWNobyBaaGFu
ZyIKPiA8ZWNoby56aGFuZ0BtZWRpYXRlay5jb20+IHdyb3RlOgo+IAo+ID4gQWRkIHRoZSBWQ1Ag
dHJhbnNwb3J0IHVzZWQgYnkgTU1EVkZTIHRvIG1hcCBBUCBhbmQgZmlybXdhcmUgc2hhcmVkCj4g
PiBtZW1vcnksIG1hbmFnZSBmZWF0dXJlIHBvd2VyIHJlZmVyZW5jZXMgYW5kIHNlbmQgSVBJIGNv
bW1hbmRzLgo+ID4gCj4gPiBXYWl0IGZvciBWQ1AgcmVhZGluZXNzIGFuZCBoYW5kbGUgdGhlIHNl
bGVjdGVkIE1NVVAgb3IgVkNQIFJFQURZCj4gPiBub3RpZmljYXRpb24gdG8gaW5pdGlhbGl6ZSBm
aXJtd2FyZSBhZnRlciBib290IGFuZCByZXN1bWUuCj4gPiBTZXJpYWxpemUKPiA+IElQSSB0cmFu
c2FjdGlvbnMgd2hpbGUgc2hhcmVkIG1lbW9yeSBhbmQgYWNrbm93bGVkZ21lbnQgc3RhdGUgYXJl
Cj4gPiBpbgo+ID4gdXNlLgo+IAo+IFsuLi5dCj4gCj4gPiArc3RhdGljIHZvaWQgbW1kdmZzX2dl
dF9ib290bW9kZSh2b2lkKQo+ID4gK3sKPiA+ICvCoMKgwqDCoCBzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5wX2Nob3NlbjsKPiA+ICvCoMKgwqDCoCBzdHJ1Y3QgdGFnX2Jvb3Rtb2RlIHsKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgdTMyIHNpemU7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHUzMiB0YWc7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHUzMiBib290bW9kZTsK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdTMyIGJvb3R0eXBlOwo+ID4gK8KgwqDCoMKg
IH0gKnRhZzsKPiA+ICsKPiA+ICvCoMKgwqDCoCBpZiAoYm9vdG1vZGUgPCBVTktOT1dOX0JPT1Qp
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPiA+ICsKPiA+ICvCoMKgwqDC
oCBucF9jaG9zZW4gPSBvZl9maW5kX25vZGVfYnlfcGF0aCgiL2Nob3NlbiIpOwo+ID4gK8KgwqDC
oMKgIGlmICghbnBfY2hvc2VuKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvb3Rt
b2RlID0gTk9STUFMX0JPT1Q7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsK
PiA+ICvCoMKgwqDCoCB9Cj4gPiArCj4gPiArwqDCoMKgwqAgdGFnID0gKHN0cnVjdCB0YWdfYm9v
dG1vZGUgKilvZl9nZXRfcHJvcGVydHkobnBfY2hvc2VuLAo+ID4gImF0YWcsYm9vdCIsIE5VTEwp
Owo+ID4gK8KgwqDCoMKgIG9mX25vZGVfcHV0KG5wX2Nob3Nlbik7Cj4gPiArCj4gPiArwqDCoMKg
wqAgaWYgKHRhZykKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm9vdG1vZGUgPSB0YWct
PmJvb3Rtb2RlOwo+ID4gK8KgwqDCoMKgIGVsc2UKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgYm9vdG1vZGUgPSBOT1JNQUxfQk9PVDsKPiA+ICt9Cj4gPiArCj4gCj4gWy4uLl0KPiAKPiA+
ICtzdGF0aWMgaW50Cj4gPiArbW1kdmZzX3ZjcF9zZW5kX2lwaV9pbXBsKHN0cnVjdCBtbWR2ZnNf
ZGV2aWNlICptbWR2ZnMsIHZvaWQgKmRhdGEsCj4gPiB1MzIgbGVuLAo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBib29sIHZjcCkKPiA+ICt7Cj4g
Wy4uLl0KPiA+ICvCoMKgwqDCoCBtbWR2ZnNfZ2V0X2Jvb3Rtb2RlKCk7Cj4gPiArwqDCoMKgwqAg
aWYgKGJvb3Rtb2RlID09IFJFQ09WRVJZX0JPT1QpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbW1kdmZzX2VycihtbWR2ZnMtPmRldiwgIklQSSBza2lwcGVkOiBib290bW9kZT0lZFxu
IiwKPiA+IGJvb3Rtb2RlKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1F
QUNDRVM7Cj4gPiArwqDCoMKgwqAgfQo+ID4gKwo+IAo+IEFsbG93IG1lIHRvIGdpdmUgbXkgdHdv
IGNlbnRzIGhlcmUsIGV2ZW4gaWYgSSBhbSBhIG5vYm9keSA6KQo+IAo+IEFuZHJvaWQgYm9vdG1v
ZGVzLiBXaGlsc3QgSSBkbyByZXNwZWN0IHRoZSByZWFzb24gZm9yIEFuZHJvaWQKPiBib290bW9k
ZXMKPiBleGlzdGluZywgd2hhdCBJIGRvIG5vdCBsaWtlIHRvIHNlZSBpcyBwZW9wbGUgY2hlY2tp
bmcgZm9yIHRoZQo+ICpBbmRyb2lkKgo+IGJvb3Rtb2RlIGluIHRoZWlyIGRyaXZlcnMuCj4gCj4g
QW5kcm9pZCBrZXJuZWxzIHRoZXNlIGRheXMgYXJlICptb2R1bGFyKiB0aGFua3MgdG8gR0tJLiBJ
ICpkbyBub3QqCj4gdW5kZXJzdGFuZCB3aHkgcGVvcGxlIHN0aWxsIGNoZWNrIGZvciBib290bW9k
ZXMgaW4gdGhlaXIgZHJpdmVycyB3aGVuCj4gdGhlcmUgaXMgYSBtdWNoIGJldHRlciBvcHRpb24g
b2YgKm5vdCBsb2FkaW5nIHRoZW0qIGlmIHRoZXkgYXJlIG5vdAo+IHdhbnRlZCBpbiB0aGUgY3Vy
cmVudCBib290bW9kZS4KPiAKPiBIYXZpbmcgeW91ciBkcml2ZXIgZGVwZW5kIG9uIHRoZSBiZWhh
dmlvdXIgb2Ygb25lIHNwZWNpZmljIHVzZXJzcGFjZQo+IGlzCj4gdGVycmlibGUuIEFuZCB0cmFj
a2luZyBpdCBpbiBmaXJtd2FyZSAoZ2l2ZW4gdGhhdCB0aGlzIGNvZGUgaXMKPiBjaGVja2luZwo+
IGZvciBhbiAiYXRhZyxib290IiBwcm9wZXJ0eSBwcmVzdW1hYmx5IGFkZGVkIGJ5IHRoZSBib290
bG9hZGVyKSBpcwo+IGV2ZW4KPiB3b3JzZS4KPiAKPiBBc2lkZSBmcm9tIGVuYWJsaW5nIHRoZXNl
IHF1ZXN0aW9uYWJsZSBib290bW9kZSBjaGVja3MgaW4gdGhlCj4gZHJpdmVycywKPiBJIGhhdmUg
bm8gaWRlYSB3aHkgdGhlIGJvb3Rsb2FkZXIgbmVlZHMgdG8gZ2V0IGludm9sdmVkIHdpdGggcHV0
dGluZwo+IG5vbi1zdGFuZGFyZCBzdGF0ZSAvIGJvb3QgaW5mbyBpbnNpZGUgb2YgL2Nob3NlbiAo
aS5lLiB0aGF0Cj4gImF0YWcsYm9vdCIKPiBwcm9wZXJ0eSksIHdoZW4gQW5kcm9pZCBzb2x2ZWQg
dGhpcyBwcm9ibGVtIGJ5IHVzaW5nIGJvb3RhcmdzLCBhbmQKPiBtb3JlCj4gcmVjZW50bHksIGJv
b3Rjb25maWcuCj4gCj4gSSB3aWxsIGFja25vd2xlZGdlIHRoYXQgImp1c3Qgbm90IGxvYWRpbmcg
bW9kdWxlcyIgZG9lcyBnZXQgYSBiaXQKPiBtb3JlCj4gbnVhbmNlZCBpZiB5b3UgYnJpbmcgc29t
ZXRoaW5nIGxpa2UgdWRldiAvIEFuZHJvaWQgaW5pdCBpbnRvIHRoZSBtaXgsCj4gYnV0IHRoZXJl
IGFyZSBzdGlsbCBiZXR0ZXIgc29sdXRpb25zIHRvIHRoaXMgcHJvYmxlbTogZWl0aGVyCj4gZ3Jh
Y2VmdWxseQo+IGhhbmRsaW5nIHRoZSBzdGF0ZSB3aGVyZSB0aGUgaGFyZHdhcmUgaXNuJ3QgcmVh
ZHkgaW4geW91ciBkcml2ZXIsCj4gbWFraW5nCj4geW91ciBib290bG9hZGVyIHNldCBzdGF0dXMg
PSAiZGlzYWJsZWQiOyBvbiB0aGUgcmVsYXZlbnQgRFQgbm9kZSwgb3IKPiBibG9ja2xpc3Rpbmcg
dGhlIG1vZHVsZSBmcm9tIHVzZXJzcGFjZSBpbiBib290IG1vZGVzIHdoZXJlIGl0IGNhbid0Cj4g
d29yay4KPiAKPiBJbnRlci1kcml2ZXIgZGVwZW5kZW5jaWVzIGFyZSBub3QgYSBnb29kIGV4Y3Vz
ZSBlaXRoZXIgKGUuZy4gYSBjb3JlCj4gY2xvY2sgZHJpdmVyIGRlcGVuZGluZyBvbiBzb21lIERW
RlMgZHJpdmVyIHRoYXQgaXMgYSBuby1vcCBpbgo+IHJlY292ZXJ5LAo+IGZvcmNpbmcgeW91IHRv
IGxvYWQgaXQgQU5ZV0FZLCBldmVuIGlmIHRoZSBib290bG9hZGVyIGRvZXNuJ3Qgc3RhcnQKPiB0
aGUKPiByZXF1aXJlZCBmaXJtd2FyZSBvbiByZWNvdmVyeSBib290KS4gSWYgdGhhdCBpcyB0aGUg
Y2FzZSwgdGhlbiB0aGVyZQo+IGlzCj4gc29tZSBzZXJpb3VzIHJlZmFjdG9yaW5nIHdvcmsgdG8g
ZG8uCj4gCj4gRmlyc3QgSSBiZWdhbiBzZWVpbmcgdGhlc2Ugc29ydHMgb2YgY2hlY2tzIGluIHZl
bmRvciB0b3VjaCBzY3JlZW4KPiBkcml2ZXJzLCBidXQgbm93IGl0IHNlZW1zIHRvIGJlIGluZmVj
dGluZyBTb0Mgc2lkZSBkcml2ZXJzIGFzIHdlbGwuCj4gCj4gKktlcm5lbCogZHJpdmVycyBzaG91
bGQgd29yayB0aGUgc2FtZSByZWdhcmRsZXNzIG9mIHdoYXQgKnVzZXJzcGFjZSoKPiBlbnZpcm9u
bWVudCBpcyBydW5uaW5nICh3aXRoIHRoZSBvbmx5IHJlYWwgZXhjZXB0aW9uIGJlaW5nIHRoZQo+
IGFic2VuY2UKPiBvZiBmaXJtd2FyZSBvciBleHBsaWNpdCBjb25maWd1cmF0aW9ucyBmcm9tIHVz
ZXJzcGFjZSkuIEFuZCBpbgo+IHNpdHVhdGlvbnMKPiB3aGVyZSB0aGV5IGdlbnVpbmVseSBjYW4n
dCB3b3JrLCB0aGV5IHNob3VsZCBub3QgYmUgbG9hZGVkIGF0IGFsbC4KPiAKPiBUaGVyZSBzaG91
bGQgYmUgbm8gc3VjaCB0aGluZyBhcyAia2VybmVsIGRyaXZlcnMgZGVzaWduZWQgZm9yCj4gQW5k
cm9pZCIsCj4gb25seSAia2VybmVsIGRyaXZlcnMgZGVzaWduZWQgZm9yIExpbnV4Ii4KPiAKPiBC
ZXN0IHJlZ2FyZHMsCj4gQmVuIEdyaXNkYWxlCj4gCgo=
