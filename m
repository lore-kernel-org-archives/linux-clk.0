Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795684401;
	b=ZNV03p//Y4dOO+KqUB8a/28IkNRMPJ0GpYYc555LxDEZXX/ieSAj8SKABCe+TH1Zfx3n
	 P2yU933KlZVySsX6Aw+/XaIi78+G/8h2LQZTzcu00jNEw+HUh3WOdNmyVf2+mcecsB/dm
	 TpW/DcAlO86wy1QRWKiXNhjYnuznnroRgjJo8NEP/9sVpru/FLGvt2cFlJE4jcGvYaQiy
	 SweruXeuvmzV51MIJu5gliIXqYqX0RhfDZsIb+/jZ3GWVJYZ7hwYwPsx8T1JXuhuuF8c7
	 4xLr6aRmTAh21CexoR4nO2ovLJ1sWlBSqwPou3+Llnq4Yxq5PAbD/RvasefOVvnOfFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684401;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
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
	bh=scEd0Y9kzwi+lkYp6J0kzw97TyT0fuXgTFCgYJ+zq9s=;
	b=4uB321n6Su61TDjSqDGVXtOYxxJGjTtKrz6FCoeSa4NLjRyAeGfcqHTTPfFE4iwUa4Yx
	 w7WFV8YC9QBdAGnRTpWjcIC1I7SK2GHxAm+XYUhZGc4fuABBy9iMbb4cmtAWJve5Co8+8
	 Gl/kr8PjLNiKcF5BjTVcazobi5m9j13T8Sx1MIa+W7IWZSWHEuecvaD4P3LOYyuak9x8T
	 Qqy8jq82ARTUf67ywxcBtvSfbpUABYN5i1Azsb/PnZ+41budFMb/kXXN4CUZIq6QOnC17
	 Uv5lIntIg9GByz/hUTtT9EpPdgXntpPBBp+N0f4Bbz9WjJ5NnWxMSfdzt3CIM5F7qdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=OpoH9Tsp;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=wCSwtEf7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5036606A31C;
	Thu, 26 Nov 2026 09:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5036606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=OpoH9Tsp;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=wCSwtEf7
X-UUID: 9c0b5deae97911f1a7aecdb2598be72c-20261126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From; bh=scEd0Y9kzwi+lkYp6J0kzw97TyT0fuXgTFCgYJ+zq9s=;
	b=OpoH9TsplbotTfpNLXmWyKxL1BCwNiETUVqfSay1vdHE+s5ymgdjawQJV5A8lsKpPgXwh+3fWXNMQYTF/ZuKhoxLKAr3OeFhW1ywfdlApobKvT78UnLHCBK15+QFScwIlyMn79cEaddz9EcC+XEqNtv3/K9lYayWiw0Y6Aau+z8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:b6fab7ab-de33-494d-8ad7-aaf372719b07,IP:0,U
	RL:12,TC:0,Content:5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:17
X-CID-META: VersionHash:b0318ac,CLOUDID:a2826d98-893e-40b7-a861-2a8829e02003,B
	ulkID:nil,BulkQuantity:0,SF:80|83|102|110|111|836|865|888|898,TC:-5,Conten
	t:4|15|51|99,EDM:-3,IP:nil,URL:99|11|97|94|83|106|80|1,File:130,RT:0,Bulk:
	nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,B
	RE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9c0b5deae97911f1a7aecdb2598be72c-20261126
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <echo.zhang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 997882689; Thu, 26 Nov 2026 17:13:14 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 17:13:13 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Thu, 26 Nov 2026 17:13:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Up6IfH30+eybvHUKjVJTa/yq26du/IDT4mCHW6v1ResdhFktAL2m2489A/Wh4uEJawM77XWdB/OEr+rYYfLAc8OFDPx5Q/f2t2zfkNfNFRyS2CIoPb+2VqCPw9/APCX5o1MTlV59+qwOVHlp+eJIQhjXIUaxJI5godieN/X1ZBGnUn/Odq3Uqc++3BbVmClKl8eAa+eAgF79AnAowNP5OVCxmbuonS3csENSkrLuMYRgYoiPjM2bE81u/FA+vuWhA2/MGZC29rv+l6Tnu/Urqx7yBzMIyx3IFlJ1EJuO7f1IDbXvk8eocnbulIibO8SmrzEN6bcceunbp2fZSurZxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scEd0Y9kzwi+lkYp6J0kzw97TyT0fuXgTFCgYJ+zq9s=;
 b=W5rQQydSM64s25qufhwAgcTHsBXR2YhekSzygVHEuCpTX/Qvj5SMKVKrwUZDDqYa74OSJXGR/dNnSso5oYWPG0IUxuvZAf3qGjxSSZ7jFB8Zb+MnIqy23Ommz8hz+f3uLcYbrERT9JHh8UOlZvgiGhxqLxl7lYfFj6aHg9Vmv+dof7gsEodwIFgxbKin78qf1rIqDpd24LQbgPwCgHYoXwcWNEmVUCnXgI82v7hWLF9OmSF+tL3FQRw9LYSc28zIigXg5WrKq+ZRoo3aqPymDSPpui8XMujaKyp/oXNxfF1TIon7rkkpRw0+Clx2V/Tq/oA8SNZi3P+0NXFMOzRDUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scEd0Y9kzwi+lkYp6J0kzw97TyT0fuXgTFCgYJ+zq9s=;
 b=wCSwtEf7fTfR9YGErLSNTrwyG+2DIxPxYp1y/OwjZXzN0+EbJGyPk2cT/uS6v7kbKQMj/3i7s2wJml0uhfMPQWcOqDRxbp3XDxYzccKxPqNWeGY2Qy69m2Z+NVFvOYAXk99rjbPk5y78JeZbbstPUFm6YaYor8jGR90yEX4Dbko=
Received: from SEYPR03MB7814.apcprd03.prod.outlook.com (2603:1096:101:178::13)
 by SEYPR03MB8389.apcprd03.prod.outlook.com with HTTP via P2P; Thu, 26 Nov
 2026 09:13:07 +0000
Received: from SEYPR03MB7814.apcprd03.prod.outlook.com
 ([fe80::4c1f:6338:5176:9943]) by SEYPR03MB7814.apcprd03.prod.outlook.com
 ([fe80::4c1f:6338:5176:9943%4]) with mapi id 15.21.0639.012; Thu, 26 Nov 2026
 09:13:07 +0000
From: =?utf-8?B?RWNobyBaaGFuZyAo5byg546JKQ==?= <Echo.Zhang@mediatek.com>
To: Roman Vivchar <rva333@protonmail.com>
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
Subject: Re: [PATCH 2/7] dt-bindings: soc: mediatek: add MMDVFS binding
Thread-Topic: [PATCH 2/7] dt-bindings: soc: mediatek: add MMDVFS binding
Thread-Index: AQHdfYZZ43dxBAgpukO4boktQGykLg==
Date: Thu, 26 Nov 2026 09:13:07 +0000
Message-ID: 6c33b0f27fba0d5fb3c200dc9aecd1acebc83efa.camel@mediatek.com
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic: SEYPR03MB7814:EE_|SEYPR03MB8389:EE_
x-ms-publictraffictype: Email
client-request-id: 1f43b3fb-cb78-4702-a09d-d3e680838065
request-id: ad02821c-bcfd-4d78-75a9-08df4b9d7bfa
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|6133799003|261009223027099003|18002099003|3023799007|13003099007|4133799003|56012099006|11063799006|261022115727099003|261028144727099003|261102123227099003|261026121527099003|261021133027099003|261026130827099003|261026135527099003|261021130227099003|261021121427099003|261021135927099003|261022075727099003|261021123027099003|261022105027099003|261022113327099003|261026140227099003|10067099003;
x-microsoft-antispam-message-info: I90iWdvvkGJG19/YZztQeVVEeIhu9VzG8KlKOCwHw8Nbo/ZekQ6Uk/hR26ogvzvCWJ+WYIOlQE+o3PFAjO/ZLm+ESi+5NzcPnj+s8s3CyQ0LEm5gJnda2nkNrFi9CHlWOrgaNQjLpUi1Jyrl6O8I/UEml3rCSbUskNZsWi+mO2VvwRVtNzkb0tivOeOOxyZA9onV3rf/9W0/CjA8juU2CpogtiIZ0QPNdS+v0xS0aX2wEALXiG1NgsN19eXfIT6sdVacCnhfzDCEDNBVqeG78Y/Mh1RJywAN0+rHiubSgFgp8TtN31bPW+WMt0qZpkiUUNXShdFsV21hJZU/jzeKu5rJjRix+PmZVffLZmUODNOE6ben0KNie7PiVnZYkbPVNBDcFD8kV9qCyDWncgU7CacbPezTF7ulEvqI1q6MHmD2ZrCOIxAwVeGmiGvE/6UczZ59Mrk96cofvoUKKiPOCmphiUWJ9HUUP2mW6Unwizlnrq97Hb4rQPDEgwlw11PbkJPJLX7hyw7McgN/pZ41hX3u7vgbF18MVKmHqm+OPCfsq8E+P1ZnUB/UgrauILBXP2Dt+xXGywUY13y56uo16k03xTfKRXTDB8NIb/2VkRirY2u8poVRRH6RVZAdrQZP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(6133799003)(261009223027099003)(18002099003)(3023799007)(13003099007)(4133799003)(56012099006)(11063799006)(261022115727099003)(261028144727099003)(261102123227099003)(261026121527099003)(261021133027099003)(261026130827099003)(261026135527099003)(261021130227099003)(261021121427099003)(261021135927099003)(261022075727099003)(261021123027099003)(261022105027099003)(261022113327099003)(261026140227099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NlZvVCt6TjJFNmZ0VmsyYWF0dU9kR01TQTZUVFhPMFhBOUZxeTZORzE5SGRM?=
 =?utf-8?B?c2hlTjh2MHM4SVFNRlkvelNDT2VVS1NmaUJWU3h6M05BSUJCZHQ0Tyt0ODNs?=
 =?utf-8?B?Uk9BenlMVDRrSythOEVUVjJLLzVLUlNMRmlKU2xCdUkydWVRbUtDRjB1Yko0?=
 =?utf-8?B?SFN3UjBCVU1FeEJjVkhXM3dhcUFPSTdvQTBUellKVDg1RDBQS3NIQjlTWndS?=
 =?utf-8?B?Um9LcVhpd3lqNzNQS3Qzd1QvTUliRGY1dlc0QkRGcExhakt5amx5dDR3eG95?=
 =?utf-8?B?ZU9QSUNTV3MxUnU2bmlSaEJ3aHZBU0x6TEl6cG9WODRuV3FscG93TUtlSFpU?=
 =?utf-8?B?ZUNYa2UrV2wrTWUyK2N5Q3hjRWltdUc1L3pzcFRmTnNIMzN1ZnVLZHZ3YUh2?=
 =?utf-8?B?R1d6VUcvbytrK3hoU0kyWE9ndzZyMUs5TVJQL2Yya2cvWDkxVmNWS3FjVnF0?=
 =?utf-8?B?dVRQMmQwbVljQkk4UFJpUUxwM2Fvai94bVpJZmlDc0NBU3p4Z2hsTHROWUoz?=
 =?utf-8?B?WjVlZVZ4QkYrQnlFcUFFZy9hczVyc2ZPODZSZVJ5NVEwL3JWa3BrYkd3NzRi?=
 =?utf-8?B?YVA0WDZZbktoaGF6L2Q2ZUljczBQOGhBNEtYZzlYWGRXdWJmNmFtMU13anpM?=
 =?utf-8?B?cjl6TnVpV3ZiYkdyTXpkaXdUbnFOelJjandxcWRJOGtUVmJTUzJyTFpKUy83?=
 =?utf-8?B?MXd4Z3RPeWg1bE55K2JESmc1VElrQ3VJRWhBcjFTeW4yY0VINVJINWJVWlRH?=
 =?utf-8?B?SnFocFpPVm52N3Q1TzlPLzBwY3FJN2plVldncWw4bSt5WnpoNnJBZnJ0ZGI0?=
 =?utf-8?B?NU1kazVoL0piVjhJZWRkS1E3UkV4K0dabER1OFc1cDhIOTB6TDRQMHJYbEs1?=
 =?utf-8?B?REM4OFRGMmZORnJ4THR2N3JmL1pNR0JJbFpTQ0FXb0w0RTJLYXVURjl2YkJO?=
 =?utf-8?B?alArcElYUEdKZ2RTYjh5NWtONUlqRXZOS0dDZElEUFg2cm54Yi9NblFqUFkr?=
 =?utf-8?B?KzdtZ3pYUUNzR2M1Q2kweU40ek1FZHZLRklFTHNmN0hpaWxNc3djbWRDTXE2?=
 =?utf-8?B?L2hlTDhrQ1BYZktjZzVLYjhzeGFxY3FNQ1FnbE9JbjE2Zi9qQVN2VDdsR3Bi?=
 =?utf-8?B?TENVYUc2YUxkTHpzK041YUlVQXhnYWxxUFJXb1F5c2ZLcEc1c2ZRUDNXOEV3?=
 =?utf-8?B?UWhTKzJJK2w2VTNvVFlsZVpwaktJSW5ZQXFCbGQzb01WeE1Pc1FKSXg2QmxQ?=
 =?utf-8?B?SVJ2ZkYxY25FbWU0Z2EzNUpDSEwwNW9IVE9HdG50Wmt3NFZsVXk4dWdYMDhO?=
 =?utf-8?B?TWFOVmFpWm92cXRlaWkvdW9URWpVNnVMNTFHZW9jYVVqMWhBdER5eHowRmI5?=
 =?utf-8?B?dE1HS1dFQnJLM2RFVFFPbXdKamJtREhwcDhMZ0lEVVRqMTErby85RUIyVWFO?=
 =?utf-8?B?WWcxMllXZTZaTW1oaExKYUx3WXRLZmtZQnA5U1c1N3ZNV1FTbldZVTh6anBE?=
 =?utf-8?B?WXhYa242Z3hkcHRyZnp4VzdqNktoUGtia3RGYnhDL0Z4RSticWM5VWdhbHhv?=
 =?utf-8?B?QVZMd0JOMUxUbGVXMFN1UklrQlFiV3owclF1VVhBbS8vUWlocjIvTWM2VWRT?=
 =?utf-8?B?V2RjMUprN1ZiRmxPTFlqSk1QVjV6UGNhWEJYWjFOMkY2YzNFR2QvY3J3UmxK?=
 =?utf-8?B?N09vanlLS0lYb25OUUlsQnJsYnJFNkpXOVljK2ZyWVFvUWpjYjFTQW9VU051?=
 =?utf-8?B?ZjNhNE5rMElqSTVpQkJyLzlKUFUvWS9LRlFLVnBnWUVyK3pxVUppQkptWm5Q?=
 =?utf-8?B?OGdaZVVWRXpJZFIzUStzZXBYVzdNeDlZbnBPcjJ1YmIvZ3pnYUw0NlpVVEpB?=
 =?utf-8?B?d2drTkNTRFRNU3BDbnVob1VQWnlTSUFRNXJacmF5RWUxOHJpaEVWTWxuaWJF?=
 =?utf-8?B?bjhhajFmdXVUcDRjYmsxNzJEZm01U0tCTXJsUlBSNk5HTmlGM21hWjVRWng0?=
 =?utf-8?B?TXYySzlVSk9HOXRPeTk2VTRjRE9mZzRmOGRTemZiY1UxSnJZQno4d1pwMEZj?=
 =?utf-8?B?bjFRTHFSMUpjUk8rK3d1M2JwN2FuUVZ0RVVUUWplY0VUZkM4K3JmSGtHK0U1?=
 =?utf-8?B?YlFKM1ptTUZEeTBwYy80VEZXR004SGFjRU5ic0FmWFZxa2VNM1kvWlNOaG1a?=
 =?utf-8?B?ZSttSXBEdmNHak1mZWlrNEhkd3F1OHBuRWwxUDNIR0IvTEdyeWt6YmJTcW03?=
 =?utf-8?B?SWEvOVJydmJqaW5zUTMxbUZ4TXZ0a1JabUI0U1lySjZ4ZlIzVGtWdm9wZWVX?=
 =?utf-8?B?VDdHVlVseTEyVmZwMDJoKzhyZDJzQ3BuRitHc3EvVnhjMUkzU1JtZz09?=
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
X-Exchange-RoutingPolicyChecked: Qc+NAq9bZINbMevG29FinIGUy2Sm4P5feuQiOX48YPBeYTou1MSeWLdHLjK3p7OSDq0jM/Dab5Dn0DjESEiwciBWvxZfLnoGJ9EgDa5NpBXmeU1Q2xz8kQtO4Ue70wDSTxrM4I6nE5/PN0PLjc9subBhF82b3f8O3/tcLn6IH9n2qhQouBNp0cokXs8BZkR2w6wh4GOgr0b2mBJFgTyQl/kvIK0cd7bK6X26EjpNK+m5Q/oTbW6X9luPQ9l8mrhbJrMgdwAiBpFRiC4pBMMcUwp+L80EAAHa1ZLxhMgjnxeXVULORKYIcpj/CtfrBdfwN83bH2BZCq5CZC1PovO2+w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7814.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad02821c-bcfd-4d78-75a9-08df4b9d7bfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 09:13:07.1135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IsPx8YDP4hiM2f3ZdGWXhT+rrKfJBYxBEA7j45u3Nbog9JutU/Wzd6WB7FrOEnd7Dt9Q+8QsmorxXcvcp7M/Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8389

T24g5LiJLCAyMDI2LTExLTI1IGF0IDA4OjMyICswMDAwLCBSb21hbiBWaXZjaGFyIHdyb3RlOgo+
IAo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0
dGFjaG1lbnRzIHVudGlsCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29u
dGVudC4KPiAKPiAKPiBIaSwKPiAKPiBPbiBXZWRuZXNkYXksIE5vdmVtYmVyIDI1dGgsIDIwMjYg
YXQgODowMSBBTSwgRWNobyBaaGFuZwo+IDxlY2hvLnpoYW5nQG1lZGlhdGVrLmNvbT4gd3JvdGU6
Cj4gCj4gPiBEZXNjcmliZSB0aGUgTU1EVkZTIGNsb2NrIHByb3ZpZGVyIGFuZCBpdHMgY29ubmVj
dGlvbiB0byBWQ1AKPiA+IGZpcm13YXJlCj4gPiBpbiBhIGNvbW1vbiBiaW5kaW5nLiBEb2N1bWVu
dCB0aGUgb3B0aW9uYWwgTU1VUCBzaGFyZWQgbWVtb3J5IGFuZAo+ID4gSVBJCj4gPiBzZXR0aW5n
cyB1c2VkIGJ5IHRoZSBmaXJtd2FyZSBiYWNrZW5kLgo+ID4gCj4gPiBBZGQgYW4gTVQ4MTk2IGJp
bmRpbmcgZm9yIHRoZSBIV0NDRiBzeXNjb24gYW5kIHNldmVuIG11eCBPUFAgdGFibGVzCj4gPiBz
bwo+ID4gdGhlIGRyaXZlciBjYW4gbWFwIGNsb2NrIHJhdGUgcmVxdWVzdHMgdG8gaGFyZHdhcmUg
dm90ZXMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEVjaG8gWmhhbmcgPGVjaG8uemhhbmdAbWVk
aWF0ZWsuY29tPgo+ID4gLS0tCj4gPiDCoC4uLi9zb2MvbWVkaWF0ZWsvbWVkaWF0ZWssbW1kdmZz
LnlhbWzCoMKgwqDCoMKgwqDCoMKgIHwgNjAgKysrKysrKysrKysrKwo+ID4gwqAuLi4vc29jL21l
ZGlhdGVrL21lZGlhdGVrLG10ODE5Ni1tbWR2ZnMueWFtbMKgIHwgODcKPiA+ICsrKysrKysrKysr
KysrKysrKysKPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCAxNDcgaW5zZXJ0aW9ucygrKQo+ID4gwqBj
cmVhdGUgbW9kZSAxMDA2NDQKPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9z
b2MvbWVkaWF0ZWsvbWVkaWF0ZWssbW1kdmZzLnlhbWwKPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0
Cj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL21lZGlhdGVrL21lZGlh
dGVrLG10ODE5Ni0KPiA+IG1tZHZmcy55YW1sCj4gPiAKPiA+IGRpZmYgLS1naXQKPiA+IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9tZWRpYXRlay9tZWRpYXRlayxtbWR2
ZnMueWEKPiA+IG1sCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2Mv
bWVkaWF0ZWsvbWVkaWF0ZWssbW1kdmZzLnlhCj4gPiBtbAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZDY1ZjRjOTA4NGNjCj4gPiAtLS0gL2Rldi9udWxs
Cj4gPiArKysKPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9tZWRp
YXRlay9tZWRpYXRlayxtbWR2ZnMueWEKPiA+IG1sCj4gPiBAQCAtMCwwICsxLDYwIEBACj4gPiAr
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2Up
Cj4gPiArJVlBTUwgMS4yCj4gPiArLS0tCj4gPiArJGlkOgo+ID4gaHR0cHM6Ly91cmxkZWZlbnNl
LmNvbS92My9fX2h0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NvYy9tZWRpYXRlay9tZWRp
YXRlayxtbWR2ZnMueWFtbCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IW43bFdJemxPRDVQR3J3QlY0
Wm13WGxZYkRnSTdSUUkxQkhfOTE4VllfdUthRkJCOWQ3eVczLWlTZk9idVRtZ21KWk1BQlJBV24x
dHhIdjJwLWltOSQKPiA+ICskc2NoZW1hOgo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9f
X2h0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sKl9fO0l3ISFDVFJO
S0E5d01nMEFSYnchbjdsV0l6bE9ENVBHcndCVjRabXdYbFliRGdJN1JRSTFCSF85MThWWV91S2FG
QkI5ZDd5VzMtaVNmT2J1VG1nbUpaTUFCUkFXbjF0eEhtLWdqcFBUJAo+ID4gKwo+ID4gK3RpdGxl
OiBNZWRpYVRlayBNdWx0aW1lZGlhIER5bmFtaWMgVm9sdGFnZSBhbmQgRnJlcXVlbmN5IFNjYWxp
bmcKPiA+IChNTURWRlMpCj4gPiArCj4gPiArbWFpbnRhaW5lcnM6Cj4gPiArwqAgLSBNZWRpYVRl
ayBNTURWRlMgVGVhbSA8bGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZz4KPiAKPiBN
YWludGFpbmVycyBzaG91bGQgYmUgcmVhbCBwZW9wbGUsIG5vdCBhIG1haWxpbmcgbGlzdC4KPiAK
PiA+ICsKPiA+ICtkZXNjcmlwdGlvbjoKPiA+ICvCoCBNZWRpYVRlayBNTURWRlMgcHJvdmlkZXMg
ZHluYW1pYyB2b2x0YWdlIGFuZCBmcmVxdWVuY3kgc2NhbGluZwo+ID4gZm9yIG11bHRpbWVkaWEK
PiA+ICvCoCBoYXJkd2FyZSBhY2NlbGVyYXRvcnMuIFRoZSBjb250cm9sbGVyIGV4cG9zZXMgdmly
dHVhbCBjbG9ja3MKPiA+IHRoYXQgbXVsdGltZWRpYQo+ID4gK8KgIGNvbnN1bWVycyB1c2UgdGhy
b3VnaCB0aGUgY29tbW9uIGNsb2NrIGZyYW1ld29yay4gVGhlIGRyaXZlcgo+ID4gYWdncmVnYXRl
cwo+ID4gK8KgIGNvbnN1bWVyIHJhdGUgcmVxdWVzdHMgYW5kIHNlbmRzIHRoZSByZXN1bHRpbmcg
RFZGUyB2b3RlcyB0byB0aGUKPiA+IG11bHRpbWVkaWEKPiA+ICvCoCBoYXJkd2FyZSB2b3RlciBh
bmQgVkNQIGZpcm13YXJlLgo+ID4gKwo+ID4gK3NlbGVjdDogZmFsc2UKPiA+ICsKPiA+ICtwcm9w
ZXJ0aWVzOgo+ID4gK8KgIG1lZGlhdGVrLHZjcDoKPiA+ICvCoMKgwqAgJHJlZjogL3NjaGVtYXMv
dHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQo+ID4gK8KgwqDCoCBkZXNjcmlwdGlvbjoK
PiA+ICvCoMKgwqDCoMKgIFBoYW5kbGUgdG8gdGhlIE1lZGlhVGVrIFZDUCByZW1vdGUgcHJvY2Vz
c29yIHVzZWQgZm9yIE1NRFZGUwo+ID4gc2hhcmVkCj4gPiArwqDCoMKgwqDCoCBtZW1vcnksIGZl
YXR1cmUgcmVnaXN0cmF0aW9uLCBub3RpZmllciwgYW5kIElQSSBvcGVyYXRpb25zLgo+ID4gKwo+
ID4gK8KgIG1lZGlhdGVrLG1tdXAtc3JhbToKPiA+ICvCoMKgwqAgdHlwZTogYm9vbGVhbgo+ID4g
K8KgwqDCoCBkZXNjcmlwdGlvbjoKPiA+ICvCoMKgwqDCoMKgIFVzZSB0aGUgTU1VUCBTUkFNIHdp
bmRvdyBmb3IgTU1EVkZTIGNhbGxiYWNrIHJlY29yZHMgYW5kCj4gPiBzdGF0dXMgZGF0YS4KPiA+
ICsKPiA+ICvCoCBtZWRpYXRlayxtbXVwLWVuYWJsZToKPiA+ICvCoMKgwqAgdHlwZTogYm9vbGVh
bgo+ID4gK8KgwqDCoCBkZXNjcmlwdGlvbjoKPiA+ICvCoMKgwqDCoMKgIEVuYWJsZSB0aGUgTU1V
UCBwYXRoIGZvciBNTURWRlMgc2hhcmVkIG1lbW9yeSBhbmQgSVBJCj4gPiBoYW5kbGluZy4KPiA+
ICsKPiA+ICvCoCBtZWRpYXRlayx2Y3AtaXBpLWlkOgo+ID4gK8KgwqDCoCAkcmVmOiAvc2NoZW1h
cy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKPiA+ICvCoMKgwqAgZGVzY3JpcHRpb246
Cj4gPiArwqDCoMKgwqDCoCBWQ1AgSVBJIGNoYW5uZWwgaWQgZm9yIE1NRFZGUy4gSWYgb21pdHRl
ZCwgdGhlIGRyaXZlciB1c2VzCj4gPiB0aGUgcGxhdGZvcm0KPiA+ICvCoMKgwqDCoMKgIGRlZmF1
bHQuCj4gPiArCj4gPiArwqAgbWVkaWF0ZWssbW11cC1pcGktaWQ6Cj4gPiArwqDCoMKgICRyZWY6
IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+ID4gK8KgwqDCoCBkZXNj
cmlwdGlvbjoKPiA+ICvCoMKgwqDCoMKgIE1NVVAgSVBJIGNoYW5uZWwgaWQgZm9yIE1NRFZGUy4g
SWYgb21pdHRlZCwgdGhlIGRyaXZlciB1c2VzCj4gPiB0aGUgcGxhdGZvcm0KPiA+ICvCoMKgwqDC
oMKgIGRlZmF1bHQuCj4gPiArCj4gPiArwqAgIiNjbG9jay1jZWxscyI6Cj4gPiArwqDCoMKgIGNv
bnN0OiAxCj4gPiArwqDCoMKgIGRlc2NyaXB0aW9uOgo+ID4gK8KgwqDCoMKgwqAgTU1EVkZTIGNs
b2NrIHNwZWNpZmllci4gQ29uc3VtZXJzIHBhc3MgYW4gU29DLXNwZWNpZmljCj4gPiBNTURWRlMg
Y2xvY2sKPiA+ICvCoMKgwqDCoMKgIGluZGV4Lgo+ID4gKwo+ID4gK3JlcXVpcmVkOgo+ID4gK8Kg
IC0gbWVkaWF0ZWssdmNwCj4gPiArwqAgLSAiI2Nsb2NrLWNlbGxzIgo+ID4gKwo+ID4gK2FkZGl0
aW9uYWxQcm9wZXJ0aWVzOiB0cnVlCj4gPiBkaWZmIC0tZ2l0Cj4gPiBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvbWVkaWF0ZWsvbWVkaWF0ZWssbXQ4MTk2LQo+ID4gbW1k
dmZzLnlhbWwKPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9tZWRp
YXRlay9tZWRpYXRlayxtdDgxOTYtCj4gPiBtbWR2ZnMueWFtbAo+ID4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMTMzODFjNzhkYmQxCj4gPiAtLS0gL2Rldi9u
dWxsCj4gPiArKysKPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9t
ZWRpYXRlay9tZWRpYXRlayxtdDgxOTYtCj4gPiBtbWR2ZnMueWFtbAo+ID4gQEAgLTAsMCArMSw4
NyBAQAo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNE
LTItQ2xhdXNlKQo+ID4gKyVZQU1MIDEuMgo+ID4gKy0tLQo+ID4gKyRpZDoKPiA+IGh0dHBzOi8v
dXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9zb2MvbWVk
aWF0ZWsvbWVkaWF0ZWssbXQ4MTk2LW1tZHZmcy55YW1sKl9fO0l3ISFDVFJOS0E5d01nMEFSYnch
bjdsV0l6bE9ENVBHcndCVjRabXdYbFliRGdJN1JRSTFCSF85MThWWV91S2FGQkI5ZDd5VzMtaVNm
T2J1VG1nbUpaTUFCUkFXbjF0eEh2c0hyWC0xJAo+ID4gKyRzY2hlbWE6Cj4gPiBodHRwczovL3Vy
bGRlZmVuc2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3Jl
LnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyFuN2xXSXpsT0Q1UEdyd0JWNFptd1hsWWJEZ0k3
UlFJMUJIXzkxOFZZX3VLYUZCQjlkN3lXMy1pU2ZPYnVUbWdtSlpNQUJSQVduMXR4SG0tZ2pwUFQk
Cj4gPiArCj4gPiArdGl0bGU6IE1lZGlhVGVrIE1UODE5NiBNdWx0aW1lZGlhIER5bmFtaWMgVm9s
dGFnZSBhbmQgRnJlcXVlbmN5Cj4gPiBTY2FsaW5nCj4gCj4gV2h5IHRoZXJlJ3MgbWVkaWF0ZWss
bW1kdmZzLnlhbWwgZmlsZSBpZiB0aGlzIGV4aXN0cz8KPiAKPiA+ICsKPiA+ICttYWludGFpbmVy
czoKPiA+ICvCoCAtIE1lZGlhVGVrIE1NRFZGUyBUZWFtIDxsaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnPgo+ID4gKwo+ID4gK2FsbE9mOgo+ID4gK8KgIC0gJHJlZjogbWVkaWF0ZWss
bW1kdmZzLnlhbWwjCj4gPiArCj4gPiArc2VsZWN0Ogo+ID4gK8KgIHByb3BlcnRpZXM6Cj4gPiAr
wqDCoMKgIGNvbXBhdGlibGU6Cj4gPiArwqDCoMKgwqDCoCBjb250YWluczoKPiA+ICvCoMKgwqDC
oMKgwqDCoCBlbnVtOgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIG1lZGlhdGVrLG10ODE5Ni1t
bWR2ZnMKPiA+ICvCoCByZXF1aXJlZDoKPiA+ICvCoMKgwqAgLSBjb21wYXRpYmxlCj4gCj4gRHJv
cC4gc2VsZWN0IGlzIGF1dG9tYXRpY2FsbHkgaW5mZXJyZWQgZnJvbSB0aGUgY29tcGF0aWJsZS4K
PiAKPiBCZXN0IHJlZ2FyZHMsCj4gUm9tYW4KCkhpIFJvbWFuLAoKVGhhbmsgeW91IGZvciB0aGUg
cmV2aWV3LiBJIHdpbGwgcmVwbGFjZSB0aGUgbWFpbGluZyBsaXN0IGluIHRoZQptYWludGFpbmVy
cyBmaWVsZHMgd2l0aCBhbiBpbmRpdmlkdWFsIG1haW50YWluZXIgaW4gdjIuCgpJIGFkZGVkIHRo
ZSBjb21tb24gc2NoZW1hIGZvciBwcm9wZXJ0aWVzIHRoYXQgbWlnaHQgYmUgc2hhcmVkIGJ5IGZ1
dHVyZQpTb0NzLCBidXQgdGhpcyBzZXJpZXMgb25seSBzdXBwb3J0cyBNVDgxOTYuIFRoYXQgc3Bs
aXQgaXMgcHJlbWF0dXJlLiBJCndpbGwgcmV2aXNpdCB0aGUgRFQgcmVwcmVzZW50YXRpb24gaW4g
bGlnaHQgb2YgdGhlIG90aGVyIGJpbmRpbmcKZmVlZGJhY2sgYW5kLCBpZiBhIHNlcGFyYXRlIGJp
bmRpbmcgcmVtYWlucyBqdXN0aWZpZWQsIHVzZSBhIHNpbmdsZQpzY2hlbWEgZm9yIHRoaXMgc2Vy
aWVzLiBJIHdpbGwgYWxzbyBkcm9wIHRoZSBleHBsaWNpdCBzZWxlY3QgYmxvY2s7CnRoZSBjb21w
YXRpYmxlIGFscmVhZHkgcHJvdmlkZXMgaXQuCgpUaGFua3MsCkVjaG8KCg==
