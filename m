Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFD41FF5E3;
	Sat, 29 Aug 2026 00:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787963751; cv=fail; b=XBUccilCIXRWoUooCoS43PTNmeAVsJjtMkfjZtM5XoEUfuTEQ7irNbqhKgOd0SL57y8zCEnr9Ls1PsyniWqEEGDyRhyF/77pzp+5vrfo7I9sniUgCWr/dvlx7oD0Jv+HtPTFbdyPyrDpsWHxcCbUpdjIPxobD5cqSJDaK7wTqbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787963751; c=relaxed/simple;
	bh=V7NIO72wDosoo25w2GXG+Hx0LKIPFBBCcAIELRYYWq0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VyTTmHKeNr8FUaoBoiNZLpNtijETD1ldXke0JCAZFEBa6YTPQDTyqNxRC4tfbCXFpCkdsAG5eVL9PjCr6QKjA37eyfOYZjlKcZdBLhGuykZP1hIC6PaRqK5WQc3ZHQphdEhrMybmUQRZjmzBZYOq4YS20AjiWauVrqejlquJwWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=naTfmvdr; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ir3ZkS2d; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ueUGpOOw reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="naTfmvdr";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ir3ZkS2d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ueUGpOOw"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SMU2vg858669;
	Fri, 28 Aug 2026 17:35:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=V7NIO72wDosoo25w2GXG+Hx0LKIPFBBCcAIELRYYWq0=; b=
	naTfmvdrd0sdq6EzD1ZSwVgRnxV922DhOyf5+Bf74r8XXuiMV/7SbikoB9atSS0E
	2Cm+2RU2cYYQVoL81cyZdbNYxZhtbDFJSl0hH5qtpqO0DS2o6a/Y4hAyDD8YkksJ
	Ox0D/QodEVM7bzO5CwKtq0VGFXaJKtlbfl3SdmLr6cx1xgI37YcV2uWubBVt2OQk
	1zTlpUQMh8VY/2wcJsRVvnQCUkARU2WWhyR5Xq3wAzSrm4+VT4aLJwc9IEtjrB5t
	QUg9MhySOa0yRg3/4Ny06uDUHrIzRpUUZdjsl0tMbU7ljY91moCMTR1hAu7ReVLq
	43pORr8WRmF+fkYlr11ySw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4gb5cp68f9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 17:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1787963739; bh=V7NIO72wDosoo25w2GXG+Hx0LKIPFBBCcAIELRYYWq0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Ir3ZkS2d+UaQ0ZGUL/0IZQgagMs8+mKJ0N2TipxYiLumoKN0fo5WMt1KjZXuES01f
	 gM732SXE3uyXFarbWdkzUJy8q4Hht452Ob/YkbTM4VPmI18ok+WottnKIr2oW6pe7o
	 GiMfZZFK+uyw0y51mhpA32XSzSR4QGep3CRrtshl26/4v8o7J/ztETV0WSesZ1bfoM
	 /dY0emgxR3ME8VCbbP1DooOt0V5QiSiwbeMmgQBb/d+xkdY+EB36bGEs7QCEdokLDt
	 U+Ymep+vV5Eamxudo98m5nPksHao+aj1s7AbtJdaFpa0a6U3rF1DQJlssHLsvxd95j
	 LteG12GfIGNzQ==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 670114041D;
	Sat, 29 Aug 2026 00:35:38 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 28D7BA1005;
	Sat, 29 Aug 2026 00:35:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ueUGpOOw;
	dkim-atps=neutral
Received: from DM2PR04CU003.outbound.protection.outlook.com (mail-dm2pr04cu00305.outbound.protection.outlook.com [40.93.13.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id E732B40139;
	Sat, 29 Aug 2026 00:35:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqPtNx8zqcelE6dYAB4tJ0xN7c9kP6KieN3rshN+2sWXTUzFZHNMcV7ULW8Pa3Q0bZMpKvfr+OriJ+Y7xeVxsIYbLEUV4G1bS+LdGe7e7rwW0fF4otNFdhj6WgMFmUGZxPUWgxJrZJjeJQe0fezwE8nwhBuPpfswSyo+BNm2C6tgIYC50Eiohiym2b5seHXatvOJFjmsgQyLhxFCc4oAbWnLaM5SlRKWXYOJxFC3XOmg23Q1WzxTc5AG9/N3gzw96PQZOeJoJ1xm3nTI76Z7e1qnaHMVs7kJIjEOV/Ud8NJP2VgVv4RlqAoChYvdPZs0doakLB2tIX5lfiYHw33YFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7NIO72wDosoo25w2GXG+Hx0LKIPFBBCcAIELRYYWq0=;
 b=MOWyxw76IVZH+6jZfMd0fIo/QYEROe3xiTWcW0o+z4FuVA43x7Q4h+3rJqabrTcoR4nRVPScRRsjL5V51YvNCpHrAG1KfFdFNPJO1EXiPBAzuo7weIaeX9tADhhbaiOQzay3AY/1NDiSFhQ1t894GY5/Zi1wzJAkXiNgtQi9nyFDeS6h7vvdev4DWGrHbzrcFXbHLhKl1sM+WR/ECP1P4QYNhKyIrqj5copBi1OVsH0IeIJzve90Uqjorbs8uJIYcsiOSmcGV/rGBjUF1KL4l/gFjs1XhYsyDmNFOGy0BVTsBwP/R4ZZaG5CT3XS8htqbAapG7zbjgwYl67RrWJb7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7NIO72wDosoo25w2GXG+Hx0LKIPFBBCcAIELRYYWq0=;
 b=ueUGpOOwjBvvjwNCZZ/P5Ay/FXGS4d9suokrei3VTdSeYhXcDW7r0tihRc4KPRTamuPbc178Dn2oyO8FzhQtIKZtNWzggXdzlmmlZ2OROKo/5hyhyxq8o1OC82RM4dcWoFWCVce88Z7iFUZnBts6e5BG5RbQsDQVEkW3ItG6rvs=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DS5PPF7671D5CC0.namprd12.prod.outlook.com (2603:10b6:f:fc00::653) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 00:35:32 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 00:35:32 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 6/6] usb: dwc3: add Altera Agilex5 support to generic
 platform driver
Thread-Topic: [PATCH v3 6/6] usb: dwc3: add Altera Agilex5 support to generic
 platform driver
Thread-Index: AQHdKi3Tm0JdRnlYVUGybOM6Xu1uhra0SDYA
Date: Sat, 29 Aug 2026 00:35:32 +0000
Message-ID: <apIpORvMoYI_QjY3@vbox>
References: <cover.1786518803.git.adrian.ho.yin.ng@altera.com>
 <b1a0734a2e074e2ffbaa4099695406e54206a725.1786518803.git.adrian.ho.yin.ng@altera.com>
In-Reply-To:
 <b1a0734a2e074e2ffbaa4099695406e54206a725.1786518803.git.adrian.ho.yin.ng@altera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DS5PPF7671D5CC0:EE_
x-ms-office365-filtering-correlation-id: ec0712b1-9927-4386-9b7a-08df05656ef6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|38070700021|6133799003|10067099003|4143699003|11063799006|18002099003|22082099003|56012099006;
x-microsoft-antispam-message-info:
 D4+r5pVaPnazlhlW0q+wNuOeKSbDvtrIvkSfUqBGH30SYCW8XR/KY9MDS5qAhAt9Yo3EUWOCjUoJkoRzlngbe0i/zxzFBG66/B0otUZpM0ure/meklZQTMSOiNi5MlDG/WW9cJKwOrHW3rh/YzP0dhaQffB++z+taug0kcgDrLD5brumjhCYcbIVg8msjQXsI6Aj8qhaLx52AQ2927UMvIydb2kZLHS1pj8Wy+KLwzh4CvYdRDs5NPzZ07U1C33qdohAs2JuNntK3lRZRHBv9QMT0TFahPa5NGc1tnhmU91fkElJdA45yOagTnU4OlxDCz0JExZF3vz73cHf2vh8qhFWGGC+wWSHSEWXXizxpOIgZQkiSK1E1REjP4yZUgRfNRDnp/XiuThAA3BG2Gaohz3X5XMoGRzCb4HYWwcawcO6gNElI6JtH8XPvh9KppAZWyob7Fv9fWx0MaZek9FNBZ/OOwak3dYiPY429C/06HLb/BiJFMpVtew9H1V/PLWYzR9WPf/AIyMU0ap1TA2Lz0UyK//9qQuXVJ1DT1V15gTsraXzZkCcVa4cmMN4+3op3LQeT/e2iou/bDHuOXQM8EC7nSDbdr+6dloM09WijLe84Dbu3T5VqhD5NBXoAkvSdr07Z6z9LPlJpnOtrthpTMGXQ2A/fr6b7+r9isihR2FA8hqI1bXJagHwIDx6skr5T+NGNOkUlCSX+5VKT//Do3cMGORRlIlNv9hLD7yoKNY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(38070700021)(6133799003)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VitYb29iaXFKak5ucmViSC9ueGd5NHNCekpHZ1crTnlsdXcvNnFGaGo5bkVx?=
 =?utf-8?B?OTZXN3VqaUJuOUc2dzFBOFFJYUpSZ1MvYnJRa0RPWEJzS0pIYWZ3TTN0ZE9Y?=
 =?utf-8?B?K0RWcDFYMTFBN0NBcG82cmJlQkxlOVR2VG1MMGdsc0xuSkxNaHRLNTEzdGZr?=
 =?utf-8?B?OWNBc25lK2I5OU5yUWpvNExJS2doem9EcVZNY2d3VGljaW1xWGVkNUZhNXZY?=
 =?utf-8?B?aGhMOFN5b2hlZytlSDlsT01KY0VDUzN1dXlFYThsY3RBRVdJYzdhTzJmdUNs?=
 =?utf-8?B?ZENLU0c2WEFpVXc2ai9LSUJJbE9RNXhlNUdSYVErOXI1WG53Z3NxWWk0NnBt?=
 =?utf-8?B?V204bVhQb3NXTUIvaVRiWkhyZ0hhWHlPVVozRU1nVEk5NnNoSnorR2dSMGhU?=
 =?utf-8?B?TkNKUW1rcXpvdDNPZDlDWjFuNmlHdDNpTE1qbmJoZ0M5ZnlDcy93NWhTTWZ1?=
 =?utf-8?B?aVFwSjgyalpQM1BWTTZRcUVhc2s5dFgwUWk5V0N5RjY5RTljenFWUXIrMXVl?=
 =?utf-8?B?cmw1SU5kQjhVdEg2NTRtc2FlaVhhYU9ITHJicnZodVE2WEk5QWc3bHRNbW52?=
 =?utf-8?B?c0FlYXg5ZGNzTGF2OFNTRVNpVC9vbXhBTHNzR1FsVEErTkZKMEY3eVhmQUxo?=
 =?utf-8?B?Lzd3QlNoanV2RGNlbUs1Q0FIY0V0cVNxNXN0K2hhQVltQUVqWFRpNTZTSGpw?=
 =?utf-8?B?REp1MHFSVFlKYW5McWF5QUk4VVRpS21MQVROT1BDeUt0VWFBVnhTeDQ5Wi9j?=
 =?utf-8?B?Uml0dHlBMUsyL21LQUk4Zmpsajhoby84ck9HM0ticTAvMGxrWk9ucGoxSEZh?=
 =?utf-8?B?N3BSY0JYY3Jrcmd1dWdXTytrQlQ2OFVNMnRqL25wRDRBanhuTzZtdnJhY3pu?=
 =?utf-8?B?YVVBOGFRenptY1B3TzArMmtLTkxKTWRzNGxlSVN1ZFFoSGV5RlJ0RGxQU2NL?=
 =?utf-8?B?bUwzbWxxL3ZsWnZKekFIZXVHRVR5T0c4bUFtL1RxZ29CR2h6SXFUdkd5VFgr?=
 =?utf-8?B?eFFKRkNadS9kNFJtbVpsY1F0K0NoZ0QzMXhUVDQ0VW0rT0w5YlJEczJlaFpy?=
 =?utf-8?B?RjhWcjNNMkZJOFhFcTBTcHZIT3NVTjFTZjRobWpwcmd5a2VWN29xMG5CcUdt?=
 =?utf-8?B?M3Y1Q1JxZVdMKzIzNUp2cUlaVHRmMkVYbCt0M3FNNThDcHptem9MdGRWWnpn?=
 =?utf-8?B?cThzZWx0VDB6M0NqRXFpOURBUXhzdG9vemVzUXc0TW9rc2JWVWdDUGROZlZU?=
 =?utf-8?B?d3V2Tys2cGsyNE9GWkIzSmhnTGJxTVdMT2ZPdnZFVWluem9WeEc4RlkvL2JQ?=
 =?utf-8?B?aUNvbXpSbzd2clRER3Y4QUEvVWFML0NrU1ZXY2NjSkF2bStNTGJBZTZhZ2ho?=
 =?utf-8?B?ZmdnanJZcTFJY1ByWlpyMFd4dkNWdjZwYU9ZcFFWeXV4UFBVTFNKdGdTcWZn?=
 =?utf-8?B?aEJvVk1kT2RvU0RyQngyQmdmU2NlZnliQzd0Zk56VXB2MlNkUGcyQlJvYVA1?=
 =?utf-8?B?SnZ1a3ZmYThveWcwaUNYSzFwRUpCQzUrVjBNaHpLaUx6SUhCallEMUsrbGgw?=
 =?utf-8?B?UTJ1ajNXTFVUSndmc05mR1hpUHpHRlBYU2cyankrZXJCYTk2WnhwaW5IRWlC?=
 =?utf-8?B?cTRmeERlYS9KZUlPazc4ekZsMGExRVpJay82YW1HdUxBTkd2a0tXT1VaRXd3?=
 =?utf-8?B?YStubUhEU1MzOEJrSGNSZU5mT05RVEZLWFBJU0N0Nm5Pb3VGT3Y1cnBUaWFQ?=
 =?utf-8?B?aFF0bFgxQlBDUnFGU1hldCtrU2ZDbkVJVU1aQXNVOTBkVFZ6Y0lHVGhwVXB1?=
 =?utf-8?B?QjIxMjF6YVFSdlkyOEw5K3RsakovaDRRNVY0ajZvUUZ5QXNwZ1k1TmpLeFdq?=
 =?utf-8?B?ODdFYXFmc01iUjRXZDk4eFlhTm9rZXltcUZyRmNPbGpTNkhKbXRnRVdUMEdT?=
 =?utf-8?B?MFRVSWd3RHJvODlUQmh4elorRFE1WFBMQUpYMkU5WWNqRWFrS05Yc0JIWS9O?=
 =?utf-8?B?Y1o3RUpwSVQvTzdoRGNsRUxMNDBHd21XTHYrQ3Y0WHhKRlREWmZaaDBGdVQw?=
 =?utf-8?B?NVV1aVh3K1h5LzZNeXhOU05rUnlya1V4djNLemlxZUFLa1VQcGF3RzM4SHdV?=
 =?utf-8?B?L2R0Yk9FN01RM1g3WWEyUnBob2xUeWFqeUdRbmMxcytoZzVxd0wrRHRWdTBI?=
 =?utf-8?B?OU13bVZtdU5nRDJaQ3F3UTlpMktndDgycGdTeGNCTEk3R2hmWThtMkNIME5y?=
 =?utf-8?B?VlVBbkVJWUpsVE5Ua2pRUU40NFNHc3Y4bDRmY0h0N28wNDMxN2Y4bCtDWWdr?=
 =?utf-8?B?NFV1N3UrelVuZVdZWW9abE52L3M5a0F4ZFNhRDMrU2Q3VnhReGdYdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2AAB91EAA652D498001243F23AB02D0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	NOACFydC09z8uySrU+32w5JuQS1K+JQLxebDoqvOQI1ADSNySW/V9bTHNXKywEyDlIxwCn5z7epCJWqM7hXrTj92ubCfquK+mslXhQEoZWU3D8IPl7LAQZ/Ksoa2eCeX/Y1adh3a3I/ZHwZnkTEw3ilcWEFp5qMHug2xQl03Bjb+z2taApjydR5CweEPzA/AloMtXgUP3Wrnh2Ws0vsiDF8+FXQnInlk4z7BvVPEhw/LX0jFAulEYRV+fHiMZybGxMcDHd0YwsVFNLo5u6dD2qhHce22Mo/rwhwq7XwbBvYEdk3ERco/JoyhvkrPAk3sWLsc348qIadK3PnmhQaHvw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Q+AV6yIfESfZyG1VBOp8lQHjCNYFHA+Akm7zrBRLus07HxaKcWtquYzIScJa7+M2anfkminubvQ3QwPanyRBU5K/inNrohnb5OmSbqE/A+KLAd05RzlEsLy75cLp18s8eKv2eWybRbTFd4vdVMZEjCQNueyhm7ApCcH7JJFre4xH5ZxYFKx2BdS9QV1vZftGWUTyuGA6W7HqNrB9vWUZsjPfjEc9Tm2UCJtsgZo4eJqTbgXM9a3OsF/adKfjUthcubk41/EoWvCdquk9NEOe6WakViQMYnxuFyX13t2VKa713mTWm7j5cuvPxobTIzmjnIF2UJNgALPIi49M4rdnbB/SgVi9ud66snVSPCiRIo1R704xxaQFB9ND5w3opdRbHpwz/NNmPaJeOyV2K1Ob0d8qX3zgYsjpwoHmNfcl0MGIreIM/CUrT1SWkDxQCINbCDpvKJarNtP6aE2JyRZpY6ilZIuPFRyGUxNvYOcd5r48Y87xJ4op7isWvTs4Zq2PiSlzvfWYGxD+tHT6+uaE8+jMbEXJTNEfuR2B4gWRHonIV/MNIZiw8gAIieuDO62lhj8c+FtDR5BgoOLq9T9zMFQc/mfr5FW8r+mBXhs39qb3AHcfvGZ//77Pl4mFC2kHN/JxCy4qZPl/PQ2k7jnfVg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0712b1-9927-4386-9b7a-08df05656ef6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2026 00:35:32.1216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WtpnL6sM+8KsuUjKkp7FXRukgrnzDnzgg1ax/EynQMfPWwA1cJvj0OL+wjVR/kxEMTyV1ZF4UcZScBk9l4fw9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF7671D5CC0
X-Authority-Analysis: v=2.4 cv=Q9XiJY2a c=1 sm=1 tr=0 ts=6a92295c cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=yBYpec10AAAA:8 a=jIQo8A4GAAAA:8 a=d-6TQz4Qv73At9lZlOMA:9 a=QEXdDO2ut3YA:10
 a=zbxmTX4fiVD2UiCe4Dha:22
X-Proofpoint-ORIG-GUID: BMG_BDj-CW9xDXHx2cLg7J6_Hi0SGPyB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDAwMyBTYWx0ZWRfX3O1xfSCr7OjV
 izgX2J7dmbMd3PuB13SV8qzOhvPUD+9Ykh6PydIM3B2Qbd/+eljLlZJ/VU+R8FlUWsgzDbe0mIC
 iUvkmVB7Mh8A33jGP33cSOqVTZ1jDmXIMsDk5pzev5MFdKBj1b3FM9EiIR3HUDve/hxxGuedJro
 yhmQ8WZC7oMq9W6Ks9wbkyGBTLoYXWDbT2e9OwLg63iIS5UW/cqmFWjAz87hEge8df4Tl59YBvo
 H+GKfSVyhiR0O0t5VS4C9XK0dOtY2A2Oe/egXKosfvTcFaa/G4tkUYkW8Ht0L9RGA/ADt8R2yFT
 zjj+79S/539OmoNAJtQ3oh5IzWFRJL6tUJyrOpsxsupYj5kKWH67y7eL02xtyuy5DZILbyYpYro
 ihy/FqjHEgFVHWlWZU45uQYIRIsM1nWalnxfISELZCXUdRJmFEDE/gVqpAtUa5HR8ywkL4fukec
 +jrEZ2ZAr63Nc688giw==
X-Proofpoint-GUID: BMG_BDj-CW9xDXHx2cLg7J6_Hi0SGPyB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDAwMyBTYWx0ZWRfX399R5wNHAEJQ
 6oDdl1RgEA6hNcxQcb4On7caf5/4hrEoOmt2vysryCy90P424PBiHxF9kV/FpgUlNlpGB6pNmm3
 2a6qtC0Mwqooy3OIoKrU8SW3Y1Gy4mg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_07,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 spamscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608290003

T24gV2VkLCBBdWcgMTIsIDIwMjYsIEFkcmlhbiBOZyBIbyBZaW4gd3JvdGU6DQo+IEFkZCB0aGUg
ImFsdHIsYWdpbGV4NS1kd2MzIiBjb21wYXRpYmxlIHN0cmluZyB0byBkd2MzLWdlbmVyaWMtcGxh
dCBzbyB0aGUNCj4gQWdpbGV4NSBVU0IzLjEgRFdDMyBjb250cm9sbGVyIGNhbiBwcm9iZSB0aHJv
dWdoIHRoZSBnZW5lcmljIERXQzMgcGxhdGZvcm0NCj4gZ2x1ZS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEFkcmlhbiBOZyBIbyBZaW4gPGFkcmlhbi5oby55aW4ubmdAYWx0ZXJhLmNvbT4NCj4gLS0t
DQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMgfCAxICsNCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNi
L2R3YzMvZHdjMy1nZW5lcmljLXBsYXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nZW5lcmlj
LXBsYXQuYw0KPiBpbmRleCBjYTY5YWMwZWIwN2MuLjg3ODFkN2VjNmI5ZSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5jDQo+ICsrKyBiL2RyaXZlcnMv
dXNiL2R3YzMvZHdjMy1nZW5lcmljLXBsYXQuYw0KPiBAQCAtMjMyLDYgKzIzMiw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZHdjM19nZW5lcmljX2NvbmZpZyBlaWM3NzAwX2R3YzMgPSAgew0KPiAg
fTsNCj4gIA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZHdjM19nZW5lcmlj
X29mX21hdGNoW10gPSB7DQo+ICsJeyAuY29tcGF0aWJsZSA9ICJhbHRyLGFnaWxleDUtZHdjMyIs
IH0sDQo+ICAJeyAuY29tcGF0aWJsZSA9ICJzcGFjZW1pdCxrMS1kd2MzIiwgJnNwYWNlbWl0X2sx
X2R3YzN9LA0KPiAgCXsgLmNvbXBhdGlibGUgPSAic3BhY2VtaXQsazMtZHdjMyIsIH0sDQo+ICAJ
eyAuY29tcGF0aWJsZSA9ICJmc2wsbHMxMDI4YS1kd2MzIiwgJmZzbF9sczEwMjhfZHdjM30sDQo+
IC0tIA0KPiAyLjQ5LkdJVA0KPiANCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1
eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmg=
