Received: from mx0a-00622301.pphosted.com (mx0a-00622301.pphosted.com [205.220.163.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ACD45C6FC;
	Fri, 14 Aug 2026 09:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.163.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786699167; cv=fail; b=UxIDicaBPfH8nle80I7nrJdflm7dDIOE3HbWtUlc9nhxA13eqR+9FpSfakYKpXSl/czrKrFxMvpxUIi099dXsbBnd1kNXAPgoS7MoOZkxAqqGKD8tO+hyku0C/8azg7oWgZ2RKSfXZmAg1FEzekjK6llrwfg+mavcwSldkppEeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786699167; c=relaxed/simple;
	bh=P3MJUef72asOXYvvfkMTI/PLEp0prTMQvRNMhoq+ilY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=k4a+1dZ3arQnKB9Bw1MFxbt5MxkckPdZ+wu1vvyYeB0tiHlhynyfFeFCWYC8UO1IdNWoFCpqcLQLSFeYwbpuVHRR0C7E0ki0WnZXtBVC740W3JnI9/bNEoAGm10hBK1Up5WIOmGWHjb6czfpbWLCahqGesE154AHxIhBfkx4jzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ambarella.com; spf=pass smtp.mailfrom=ambarella.com; dkim=pass (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b=oasAhs7l; dkim=fail (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b=QCXuqkE0 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.163.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ambarella.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ambarella.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b="oasAhs7l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ambarella.com header.i=@ambarella.com header.b="QCXuqkE0"
Received: from pps.filterd (m0241924.ppops.net [127.0.0.1])
	by mx0a-00622301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7h97l4069854;
	Fri, 14 Aug 2026 02:18:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	com20210415pp; bh=P3MJUef72asOXYvvfkMTI/PLEp0prTMQvRNMhoq+ilY=; b=
	oasAhs7lQxltIYw68ni5nJsNwhXDszNBS9G/znPLQsrzn6dKRx307iDdXoFP8Ig/
	cTDdj12fOiqRAN8+deWjZy1K0tOiQ+POylSAnZWAJVDsBlc+Kv2m/LTSd09ZMcFT
	OUeD1hO8E0XRtmqIYfVVrGZPUr5z6Ez2hIYcFcYeJsz7Lc8UlJ4QoiGxcrqcUeln
	4ZjRrKB8UD/yijC4lGv1Hjazlke8f7OOQWZCpjriCPCtLH7sGdI45s5LbYDZLYv9
	vSLPzS7ibXBvTahrtjRyiBs/jUjfvcaqgAtWxmds0CPWMikY6arJ7JTZkdYbPWBQ
	yRhly20sVuhrxggNs3iijA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022095.outbound.protection.outlook.com [52.101.43.95])
	by mx0a-00622301.pphosted.com (PPS) with ESMTPS id 4fysgd3x4g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Aug 2026 02:18:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXb0f2rfazdgTDgJyzXGBso2Dr8mQcr8OGEsx92rK6OXZcRp5dSg6qTuWTL8g2rqxEo4jtPIA2zyWJ2jNvjYRL+UsOV8dbaM7DU1f4KYhbDgAxpJ3+ddg2U/USyfM+4jig8Z1/I15bpr7HKq74w0pYMt2Cl83QoOb9WaNgAjlxUnAmXZG+5DzkEiY7lZbFQcnz/KhdnB1pMHmTlt5KqNp26w9WGWTxQ3Qlg+eu9TuoDzes1tZ5AHcnY5OSJuKmZhNWm2qULZ0D/vvt/2qQKr+MkTPugvHFlOfiEV30gWi9xvRzc/eppP+4ascZsuNpFuKqAh2WQvHkxP8XZK7ZEazA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCITFba7duKue4ZvwKVKzY/J0Xc7Tk0vB/KwFxCU8lU=;
 b=AwlDFHyTcmytXRB+h05U0mv2G7qvpUTB+Ew+pu7WC4l6dzcrrgu5T6pgW6piMVQ+A2uBdxGU/2EwnwUg21n5U/UP0zlaOaMhIBGjMIqB6IaKaLX97LuIGW3Q9fo7tUPjbGyDalAtcYj+klbKsvtlWtoplc6Fwc2uhBpdQ5cSG350qq77erlQYbGSTPuzg6sF9jbe0EPrCCcXOHxCFlzMgcCcMIBQEnh+Xv8a4CndlwisIQnE3kG7srfJsxn40H5Pc32qCQEfq40F4AgFcbAc1G8F3FYXDzkR9PPkl73M4Sbj6eZqRFy0L/Ob9zJTw0SvJ5n5eP7hxrhlAfHde0Snbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ambarella.com; dmarc=pass action=none
 header.from=ambarella.com; dkim=pass header.d=ambarella.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCITFba7duKue4ZvwKVKzY/J0Xc7Tk0vB/KwFxCU8lU=;
 b=QCXuqkE0mQRjiomSC+DKuX3g4q8MHn+LTQjDsA+Dr45ynT0luAMxP9tdoAKI3Jc4F5LRWUpptKfxm7+oLWdVUphjEyaDePLAG2NKciDbsMTwpG1wj6B8UKVjC8b9d3BZ/X27Z2FwnqEOc4kQowHCHqMde/w8eO/tUuT6CBmDGLw/SqXr/uipT2azbhP3fP2V9pn0t+dwTNYhRa7TC80SL9LnpdVRNyJ23Ilqwumpd+/ryNt4xto+OyRoN+/N2w4k2/ocFT8owPCixy9OLAzM5fhukqkxpZJWPoOKc4BTr8YLgJRPqRWOBe2P8Wwz3V573X8PIFphD9hGPpxmbbUOAg==
Received: from DS0PR19MB7925.namprd19.prod.outlook.com (2603:10b6:8:163::21)
 by DM6PR19MB4294.namprd19.prod.outlook.com (2603:10b6:5:2b7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 14 Aug
 2026 09:18:55 +0000
Received: from DS0PR19MB7925.namprd19.prod.outlook.com
 ([fe80::dede:8f9c:d33e:6b8b]) by DS0PR19MB7925.namprd19.prod.outlook.com
 ([fe80::dede:8f9c:d33e:6b8b%4]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 09:18:55 +0000
From: Long Zhao <longzhao@ambarella.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann
	<arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus
 Walleij <linusw@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>,
        "soc@lists.linux.dev" <soc@lists.linux.dev>
Subject: RE: [EXT] Re: [PATCH v3 3/6] dt-bindings: clock: add Ambarella CV75
 RCT
Thread-Topic: [EXT] Re: [PATCH v3 3/6] dt-bindings: clock: add Ambarella CV75
 RCT
Thread-Index: AQHdK8sSUYGhfnkt0USiWTOxWU2nILadQ4Hw
Date: Fri, 14 Aug 2026 09:18:54 +0000
Message-ID:
 <DS0PR19MB7925182C00BD0B3110D43329DADA2@DS0PR19MB7925.namprd19.prod.outlook.com>
References: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
 <20260813-cv75-v3-a-v3-3-cfdd20b1b4dd@ambarella.com>
 <20260814-wise-caped-chameleon-ffbeea@quoll>
In-Reply-To: <20260814-wise-caped-chameleon-ffbeea@quoll>
Accept-Language: en-US, zh-CN, en-001
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR19MB7925:EE_|DM6PR19MB4294:EE_
x-ms-office365-filtering-correlation-id: 1fa2c565-02c6-469c-e12d-08def9e5104a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|10067099003|4143699003|56012099006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 dKwxLUUICgzyBxL8oPaTiKjL17IGEydH2cYleEEdlFqcDImozJHMBsujedq9HC6Ua2niF68+5BRN/dsyaEXiEE9OEXyFL1q+/l7jmRy7TuRqbIHhBZwBo9kixflURoryqLM0JrjQ2SjWfIHeUPijmdaKq6qTkODEPyRUFbdB37acIl3zdPOuu98M/hMTlEJZuCCSroBm2I42PuqYEtq5yu5mbJBQ5DQfzn/agViANNRvff8QsF3JGqQSaSbpT0/hvbiE4R0oGZl/z8RCE7HzdcMLGJxeClH/Lv1mZa96suCLqny4GVHZByKAQhDNf9p9rm8sQgefzrL2eETiM9jsz0r1ehfj+BaYL8Fz8kFpspkfatBOKJIexlo0S2qBoxki/isNjr6xokItjWH1PVivHf9WR58h4F8MhazwcpF7At/2SyctsZpC8Pl/k5rKhQmvasTZ9QYzPW7QqDVVjSoNt984tS2owaPQJpxP0x5S7yUTzDHNYLyOcdTwVyK5Cc8aqExCvzPH3v5Yl9tkr5+JApoFGcUA7NHjiJw2C++zVMI5ZkybrORj75seyec+dIG+Dbe5uhb83Yq4LrjdrzFVGRaMQ82qcIrJMUoIN5T/AElPqzzXmFBYg5XVMUNdKO4YBt214GgPycnkwZj+qx8XCzv5e4LOrFoqeXyIaafzF+2OrRNGt+Q98Ynewx2dbrWj+HQL9cbDof7em1vO4y4PEQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR19MB7925.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Wjk3WU1Tb2Q2eGxqV3JwUWE5dkV4Y3VOK3FheU1SbTV2WFFtVDhJV3NkeDkx?=
 =?utf-8?B?M0JVUFB4RzhBQWV2cVNTMFYwUklpTlp4eURPKzNGYUFYWmJodC92M0tETGNk?=
 =?utf-8?B?dnBtQWcyeUY2aHM1VGpwM05rT05OS1RXSjJOQVdNVTZTUHh3aFpkWjZ6aUph?=
 =?utf-8?B?YzdKM1ZMTFhGeC9la2w5b0FGWmQ3c2hIb3ZHVkgxaGE2S3V3N2NHQi82WFdK?=
 =?utf-8?B?UmlIN0V2TnRpTUtJZytqSGh1Y04ySjRIYzNGWFRGOHlVOTBtUlJPTjUrSG9m?=
 =?utf-8?B?ZmNtaGFsTkNCdDZnR3Y0Z0V6WFNMTXhtUVh6SVF5RkJxSWJlNXJuSFk2VG9O?=
 =?utf-8?B?emxWRkNrTTFva3lzeFBwcEtVMm5FMm9vVmtxdWFJb2VsVU1lSWhHdHo3cXdL?=
 =?utf-8?B?UUFUeGZxYWl1TDJ4WDlIRXI1VzY1Q0tDeG4rWVhiK0R0clFhblYvdzdVWWRm?=
 =?utf-8?B?bWRZMGdvY21KMEp1MUdOOTh1RFMwZlhBK3BUU2N3MzVIdkhSK1QwV1I0SFJm?=
 =?utf-8?B?YlRINjBodDB3NEY0SUlQV0FvSGtkN2lodDl1Zk92U3RiaU9ubFFtT2pVdXpZ?=
 =?utf-8?B?NVlIMzRIbHlxeFpNSkdrcnNQQ1R4ZTMvOE5ZSHpZSzVmZlRlTkh4RTMwOVRq?=
 =?utf-8?B?QlNmRzhzcmxmcWtrcm1xTStsMVdQbklqKzh1MDNsZ1g1cTVlb2FpaVljUXlQ?=
 =?utf-8?B?NDRsT1I5T0FRMTBEK0R4QThML08yVFU0ZjRqRStKUU5yWU1QMHQxbGZEVkJ2?=
 =?utf-8?B?TEtxNmh1QkpLUmZrZGlLekViMmRmNUtMOEFpR3FPVXJDNGFtNW83OEdOd1hx?=
 =?utf-8?B?OTF1MTZON1hBVnlQTkFoZ01EKytGdTFPY05WS0RmQVcyc2FXdlBJVk1JdkZ4?=
 =?utf-8?B?WTNZUDJLa2Z5MEc3Qyt6QWtyQmZNd1Q0dXVpVTlHRnh3b1dxYjUxM2FUNllT?=
 =?utf-8?B?Z3QzNVpRelorL0xHMkFOMFdHeU5QUG9XOGF3R2xUWTczRE8zalVJZSsxN0py?=
 =?utf-8?B?WG94NGFWdXZkYXhCcjAvKzJaMGIxZXVsR2E2TVNRdVh6U2w2aW1oaTRnWTRn?=
 =?utf-8?B?Zm1DT1c1RW4rUDdCZVcvMTBZS05McDV1eXBBZXlRcmNhT3FRdW1hMDZlaUk0?=
 =?utf-8?B?eTZXQXlNUGx0elZmbnZZZkdPTlFpajRhWGZQa1RvbGtoU2dsby9ZTFlra3hT?=
 =?utf-8?B?bWFZUThQTWsrS0srQ2oxVEdSbEpDaWZMZGFlUGRBdXlINUhYaElCcTRQRkxF?=
 =?utf-8?B?em1YOW8rVVdLS0EzMUdXZXN2WlhHL2Q4dStMTW5Ud0k1NXE0R1lkeVl3Wlc1?=
 =?utf-8?B?Z3NFbDJpV3h0UUJTNWIwZUYwN3k4d2x1OVNVREl5NW05WWJDOTlqU0tKMWw4?=
 =?utf-8?B?SnNvZWZuWW9YZ1lwMmZxdC9va0QvbEhoZnF2TUlrWmkzakk0MDFDYWFhcnBu?=
 =?utf-8?B?clBIeEh0dkhNRTBOamh3NXFVUzFFYnR3d1FuR0lmYSt2eVdCSVhDYjlSdlBa?=
 =?utf-8?B?Zng1ZGUxZFlMYzVCazc4aWw4eHI1MHllUWxtOGN0NllQRTcwNGRBN3pSSHcy?=
 =?utf-8?B?ZzF4c2xQeW9iNVZFK1NzZWNEMFpMZnJmc1NmWUpLTndEaDZWaXdzNEI5UXdL?=
 =?utf-8?B?T2NET0hWZElud2g1M2hXQ1p3RjJmUHh1SVVmcC9pRkYwSng2ck0zWGpwb0tF?=
 =?utf-8?B?cDMzQUI1cTBPMkRqdkxHNTlGT0NUUVN0b1UremNlYk90QThzTk5FUTZMNlFK?=
 =?utf-8?B?K3B6TkZrM0tlQmhBSllqaU4vSEwxTFFXMmFyNzJNdDJUam4wcDFiaUIvS3g2?=
 =?utf-8?B?ZERHT05MOUVSU1VPeUIvVlEybVNRLy82eTNVYlNZdEh2MkxUQU16ek9tZ1ZL?=
 =?utf-8?B?d1RsZTNVK1ZPOVcxYS84Y1pVMitTNWE4ZDNqNzNPMzFZeUtVQ2w1UEY2bFFB?=
 =?utf-8?B?eGFQRWFaQ2ovUndpSTN3VkxqS1Q4NkdHZ3VMNUd5QTRPWkxFcnFzL3gza1NU?=
 =?utf-8?B?NHQxaG5MMmxpNDlOUGM3U1B5WjNZbzZrZUtTeUkvWHVMYnBSZzBsUUlmT2R0?=
 =?utf-8?B?bS9icUdHbEtoSnJLWUlXWFlzZTF1alNrSy92cVBkellwS2tyY1plS21HamtG?=
 =?utf-8?B?emhlNk1uZ0IzVEpFKzhVMFdHclN0aFlIeHBOUEhPdHZnaW10QzVVbXN6NXVU?=
 =?utf-8?B?ejU2SjN3Zmt0SGdYamN4ODRPTUZyOEl3ZEllRXA4T1lJWldSemgrRndIdnk2?=
 =?utf-8?B?Q1h4eVBRdEhtT1lDNEJyUm5HaW8zaVVvTEY4N25UNWw0bENPTEJBRGwzOXhq?=
 =?utf-8?B?VGxIQUYrNjZ2UnBCZTRpSmNyV2dPbnlYSVpZM1J2MEoyVkI2RnV4Zz09?=
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	L3CwSjypbRwMpn4RSt1fhMjIshr6oAtUdFRSIHM3QqHC99CEbDZJkEv9W7Q9epKY1z8KysQJdaLamNrisfdaP273RRz8yCKHJlVa6iL5gFwwzWw/TIRuSDzCUVsC8AeWOVB8IxAymd9Wsva+sfcYqxN0/FrQdv27OhVJxo8ane9IyKF7ByvFB7F784cWU6KaXzh7bXX9hKvWLYmTtdOcMHC8jrUcQmgs5M5AMElCy4hi3EZLkMPvcfCUybTWfmVoeM08vgUAYegTm5ucBmf3vU9bnfPpeqLrNf6OPWxQnaDd+fxjREWI6UK0mWcXBeCK4R+CyJOvwmVYk4mEhQfemg==
X-OriginatorOrg: ambarella.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR19MB7925.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa2c565-02c6-469c-e12d-08def9e5104a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2026 09:18:54.8845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3ccd3c8d-5f7c-4eb4-ae6f-32d8c106402c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OyWx7vahqZHx8ZlnQtcK0TQOZK67rCCbeVQSGwVXz1mRyhN9rUouTxGSKzwuAV3QR7TrXFp1cQOXroZ3cnIyhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4294
X-Authority-Analysis: v=2.4 cv=PIo/P/qC c=1 sm=1 tr=0 ts=6a7edd83 cx=c_pps
 a=kkxl9DAbGs3C2F6ePkv26A==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=dkMdDuzY2HgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yXVIz-0bn9infC194UBj:22 a=pzaFphlX3Qn9zwH3AKfV:22 a=VwQbUJbxAAAA:8
 a=ppJngBeKAAAA:8 a=IpJZQVW2AAAA:8 a=7CQSdrXTAAAA:8 a=P-IC7800AAAA:8
 a=JfrnYn6hAAAA:8 a=sdJkStLkgrM08-0FNyMA:9 a=QEXdDO2ut3YA:10
 a=IawgGOuG5U0WyFbmm1f5:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA3MCBTYWx0ZWRfX3tkSZ79xE/pe
 3z+8rgKxh78nkTWCXaH6LbgrfCEpLKIFHokrF5+00FfyWFPDqHBRZDue8w8s6wPs/d3L1zrkMkB
 PpkYOzjXSHiYvojMbLh6c+zZaLTGKKvKO+EmAre67yeGJwEb+1JrBX9qD73MohjkVlpmnMxGaWE
 ZAy2i6AS+GNMmNnQcozjfWOvVF9TdcXifTO5PX+2xetjLOA87ElMUCthqKzdtPGhdOIxy4iIt0l
 isZi1xoMaUVWHWbGsSamLRlMimWcy88BnzC6fHfxW6Rl9VahJD2zT+im1Tag+N0cHlcIWyWK5Ha
 JoCQ2l3qeyBLVLhQYvbTKUC1Klay/j2mTeAQgznsqUmpz28ZXE5n8ZY1TXEmIu8nyGGaNxlHv+u
 XoC6/ZvNt1rUfacUURo36IenDsiU/5GVBbfoo113Ljhg9b3dsOSuJoMeKCCeDTymZsjexeyewuz
 uk9gpvP1b0toCi4MuhA==
X-Proofpoint-GUID: gjReYToVTQCi6hxZ4r89pUZIy-uVTLWd
X-Proofpoint-ORIG-GUID: gjReYToVTQCi6hxZ4r89pUZIy-uVTLWd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA3MCBTYWx0ZWRfX/0DBBmuJ/2bV
 cpESkCt+OKO7B2cbCgP6JXDJyrJOvJKAKEi3bH0myNYn2u4qWVmWwzMpgmBsxSUZemX/vrzyHdU
 sUCXEnADcGdC0nso/60XL9GXfGlzI6gRvTZ5vR5bylmnWFfqmotK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140070
Content-Type: text/plain; charset="utf-8"

SGkgS3J6eXN6dG9mLA0KDQpTb3JyeSBmb3Igbm90IHJlc3BvbmRpbmcgdG8gdGhlIFNhc2hpa28g
ZmVlZGJhY2sgZWFybGllciDigJQgdGhhdCB3YXMgbXkNCm1pc3Rha2UuIEkgd2lsbCBhZGRyZXNz
IHRoZSBwb2ludHMgYW5kIHJlc3VibWl0IHRvd2FyZCBzb2NAIGFzIGluIHRoZQ0KU29DIG1haW50
YWluZXIgcHJvZmlsZS4NCg0KQmVzdCByZWdhcmRzIQ0KTG9uZyBaaGFvDQoNCkFtYmFyZWxsYSBT
aGFuZ2hhaSBDby4sIEx0ZA0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtyenlz
enRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gDQpTZW50OiBGcmlkYXksIEF1Z3VzdCAx
NCwgMjAyNiAxNjo1OA0KVG86IExvbmcgWmhhbyA8bG9uZ3poYW9AYW1iYXJlbGxhLmNvbT4NCkNj
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
aytkdEBrZXJuZWwub3JnPjsgQ29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPjsgTWlj
aGFlbCBUdXJxdWV0dGUgPG10dXJxdWV0dGVAYmF5bGlicmUuY29tPjsgU3RlcGhlbiBCb3lkIDxz
Ym95ZEBrZXJuZWwub3JnPjsgQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNv
bT47IFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+OyBBcm5kIEJlcmdtYW5uIDxhcm5kQGFy
bmRiLmRlPjsgQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29t
PjsgTGludXMgV2FsbGVpaiA8bGludXN3QGtlcm5lbC5vcmc+OyBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnOyBzb2NAbGlzdHMu
bGludXguZGV2DQpTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIHYzIDMvNl0gZHQtYmluZGluZ3M6
IGNsb2NrOiBhZGQgQW1iYXJlbGxhIENWNzUgUkNUDQoNCk9uIFRodSwgQXVnIDEzLCAyMDI2IGF0
IDA1OjU2OjE0UE0gKzA4MDAsIExvbmcgWmhhbyB3cm90ZToNCj4gRG9jdW1lbnQgdGhlIENWNzUg
UkNUIGNsb2NrIGNvbnRyb2xsZXIgYW5kIHRoZSBjbG9jayBJRCBoZWFkZXIgdXNlZCBieSANCj4g
RFQgY29uc3VtZXJzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTG9uZyBaaGFvIDxsb25nemhhb0Bh
bWJhcmVsbGEuY29tPg0KPiAtLS0NCg0KU2FtZSBmZWVkYmFjayBmcm9tIFNhc2hpa28gd2hpY2gg
eW91IGRpZCBub3QgYWRkcmVzcy4NCg0KWW91IGdvdCBmZWVkYmFjaywgeW91IG5ldmVyIHJlc3Bv
bmRlZCB0byBpdCwgbmV2ZXIgaW1wbGVtZW50ZWQgYW5kIG91ciB0YXNrIGlzIHRvIHRyaXBsZSBj
aGVjayBpZiB5b3UgbWlzc2VkIHNvbWV0aGluZyBvciBub3Q/IFRoaXMgbGVhdmVzIGJhZCBpbXBy
ZXNzaW9uLg0KDQpEcm9wcGluZyBldmVyeXRoaW5nIGZyb20gUGF0Y2h3b3JrLg0KDQpCZXN0IHJl
Z2FyZHMsDQpLcnp5c3p0b2YNCg0KDQojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQpUaGlzIEVYVEVSTkFMIGVtYWls
IGhhcyBiZWVuIHNjYW5uZWQgYnkgUHJvb2Zwb2ludCBFbWFpbCBQcm90ZWN0IHNlcnZpY2UuDQoK
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKgpUaGlzIGVtYWlsIGFuZCBhdHRhY2htZW50cyBjb250YWluIEFtYmFyZWxs
YSBQcm9wcmlldGFyeSBhbmQvb3IgQ29uZmlkZW50aWFsIEluZm9ybWF0aW9uIGFuZCBpcyBpbnRl
bmRlZCBzb2xlbHkgZm9yIHRoZSB1c2Ugb2YgdGhlIGluZGl2aWR1YWwocykgdG8gd2hvbSBpdCBp
cyBhZGRyZXNzZWQuIEFueSB1bmF1dGhvcml6ZWQgcmV2aWV3LCB1c2UsIGRpc2Nsb3N1cmUsIGRp
c3RyaWJ1dGUsIGNvcHksIG9yIHByaW50IGlzIHByb2hpYml0ZWQuIElmIHlvdSBhcmUgbm90IGFu
IGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIGNvbnRhY3QgdGhlIHNlbmRlciBieSByZXBseSBl
bWFpbCBhbmQgZGVzdHJveSBhbGwgY29waWVzIG9mIHRoZSBvcmlnaW5hbCBtZXNzYWdlLiBUaGFu
ayB5b3UuCg==
