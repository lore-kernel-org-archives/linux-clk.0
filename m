Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011043.outbound.protection.outlook.com [52.101.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A29E31C567;
	Thu, 18 Dec 2025 16:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766075000; cv=fail; b=l+Cc2XXphFSuyt+evz+VjWMHZ/4cOOJVihA+p4m85zJ0w1ksP3Whp2IDP8ElaOMZgyfP0Q207f/n6iJmU2CvviEkqUcU2aODlQwMtxraQIEo/zC6ax0Ww7BjtMQNGMaxO1k/1DWiBACuZPLK0N4m/fc1HNwaG1bBRsRaQs6qDng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766075000; c=relaxed/simple;
	bh=zIVi3NK19Xqbm/LdViYF8mesOMsKxVdfyw7YDgc/0X4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d5Sx1zjqatKew77zzBV94vR85J+uYTgvLIlIfc+QFe8Sgn79P3d+DGTm8U+5kOAUGFIbLl10UFR4RQDPn8RdD4GMcUfgAxwy9K5gvk8EIsRVdoNAM1O0Mujy1ffiw1ZF8J12QruIb+M89zSonT6+6n3zNgcanurLQ74ZQBJFiWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=gpeZSKuW; arc=fail smtp.client-ip=52.101.52.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="gpeZSKuW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vG6/EeQHtQbgG1q+0zUR4MUBKC1duzIUnzegmOm/iEFga3x1/bap5LmKlNnqZe5DLC+ordokcpiUpr6USNwbomiSZwUaoB8lISa5kOKw9HFZpehX5YjXkE7f0TyqBKSxpvC8Uiw6EuHzoiGs6zRMTfc/K6koom43YeDeAgERR/YPpOyexqJ60EWI7jbrF996BlV7AhDvRx7j7NPu2HMfE3rQVgkeJY9/O1H2T+eB1DHvctP0KvmJPXRk6YY5gjHvGKn3OfbsG0g+nZI7xocGbGncy4iNjmFS88Aw11XNAp9ER3VKYBknZgbK6/eaAwWM+yfIGwV3Al+PqMZswts66Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIVi3NK19Xqbm/LdViYF8mesOMsKxVdfyw7YDgc/0X4=;
 b=KJPJhcxGUkOJiP9hPMhalCLMTA98ikngQR+e8QoM3YE0cYnAS39ag3bkfn+MuSeW0b3JDpXx4388zAA/buEaSurQcvdXhpF5YiZH62tfqNPKF6Sv20nmc3pnTc0GcOGVUkoNP3bHm22GNRxZSd5LFbnEmo4M0LmBWCTMJfrQkdkY7FJTj61Pv93jv4pf6WIn7QwF1QPbu89NSzsj7DqkLZAY/tk5qpZdLiSnq6QltXXjzCtB5bzerz03PIiLBfGO8LzAapcu9K8/3V/ithaxHtgRR4ipbvpeslspZ9lvF5wvd+OGKishwn2R+SLpe9Ty5iCA0LmQi1dQZKlP7tnZtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIVi3NK19Xqbm/LdViYF8mesOMsKxVdfyw7YDgc/0X4=;
 b=gpeZSKuWIjdkofXnCEZJMSKlaue8+EhZTjNuGJfyZDxGeyk/qKdMsC/aA8oE95zGmbHNfpZwK7TlDBl9YPvtgu92jet09txeOUA7lov6HKhh6N57RbS0Dsy/Id7knz0HJQ6JmPrOgxrPiMhBC51wCKrCoCbyjng2F/tLjrNgNYFPrfZMgKRxLnL+QxbSFe5X9JoPvEh/ExJiQMOnsGxCws6TEa8lD6ADdnuDIi0vI2qTVQMGXKvDV3L+ML+7CVih2U+J8mOJmWXe+gkRoWniBZ/K5kT+lXTQQ9NPl0ky3Jem856NT31O4HoNWttgekFf3IBuUQAzn7qrpJ0hbLUAqw==
Received: from DM3PPF67FA1A8F8.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f28) by DS7PR11MB6125.namprd11.prod.outlook.com
 (2603:10b6:8:9f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 16:23:13 +0000
Received: from DM3PPF67FA1A8F8.namprd11.prod.outlook.com
 ([fe80::2254:e323:e6c9:9d5f]) by DM3PPF67FA1A8F8.namprd11.prod.outlook.com
 ([fe80::2254:e323:e6c9:9d5f%3]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 16:23:12 +0000
From: <Ryan.Wanner@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<alexandre.belloni@bootlin.com>, <Nicolas.Ferre@microchip.com>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <Varshini.Rajendran@microchip.com>
Subject: Re: [PATCH v4 11/31] clk: at91: clk-usb: add support for
 clk_parent_data
Thread-Topic: [PATCH v4 11/31] clk: at91: clk-usb: add support for
 clk_parent_data
Thread-Index: AQHcKOGs3+hBmjOHH0eMABKEphFd1bTLmo2AgFyI5QA=
Date: Thu, 18 Dec 2025 16:23:12 +0000
Message-ID: <14ea374c-2889-4bc5-b0c9-fb5b5498593e@microchip.com>
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <6979b3734462c97381159f3968a3f22b6193e04d.1758226719.git.Ryan.Wanner@microchip.com>
 <27aab227-01e3-4074-8aab-38623b4d9808@tuxon.dev>
In-Reply-To: <27aab227-01e3-4074-8aab-38623b4d9808@tuxon.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF67FA1A8F8:EE_|DS7PR11MB6125:EE_
x-ms-office365-filtering-correlation-id: 288be88c-4bb6-46bb-4e2a-08de3e51bdb1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?UWc2UDNFcElCZERQd0hFTEQ2M0VpWlArcWZNbkJ0Z21mbG1WNU4wdUQwR29G?=
 =?utf-8?B?dk1mNjNBeGt4NENlTUpXRUI3S05vWjNQUHFaQUQ3NzZ5ck5UdUVrOEdnelRj?=
 =?utf-8?B?aXF2UUxTZFN6K0g5ZmU2TkV4R2pLenE4VVpnTlVleDFtMzM2bVh0V0FNYit1?=
 =?utf-8?B?MnhmZ3llSDZXVjZkQ3N0R25RTkJQcUZUQXBSVnAvaklFQUVtcUpZWmRGZGY4?=
 =?utf-8?B?bFpjdm4xcXRYaURnRVZnY2QrYmdmRXp4SzFBUk5XUWFnbUZrajhKbUxqQi9m?=
 =?utf-8?B?S0pkMzFHQ3MyRzd6ZStsRnNEbGQwdm9HRm1JeVRhWGRCNHN5UEE1OVh2T3NT?=
 =?utf-8?B?TU9yNkFFNy83WkxKUkZ4TzZtR0Qwa1pqaDN2aUpzeTFYUk9TZlMvZ2JhaThn?=
 =?utf-8?B?d1I4ZG5uUkJFUjMvVjNndlNvbURNL1BsUmYrWmpaQmtJc1dqa3dSWFplSmg4?=
 =?utf-8?B?eUVpb1lITUt3WkNwRklEZGprVGJlRWNUQUJlcjY4WFE1VGxYd1F2elhNQ2RW?=
 =?utf-8?B?cHRlMEJ3M3hnaFBiaW5hdW9wRGNDR0FBNUd0Tm1yRHVoOENNQjJqcUlrNjVz?=
 =?utf-8?B?dXdVa05pb3gzRE9ZQmE1SUQzR1M1YW5FY0hDZHFWeklYcEV1YVpNRExkdGgx?=
 =?utf-8?B?YWRoOG5TRU9GZFZkNER5SzRRc2NTYkZYMVh4Smd1V3FYemNhRFFHSE1veWVy?=
 =?utf-8?B?ZEJsN2d2MlRqejM4T1FUMGhsWXZNR2x6OWxpbUFCaHNrMFVxalh0R1pTZDN6?=
 =?utf-8?B?VjlqRjhRQklRRHFNc1cxNGRsbFA1WWVGQ0NhTXUyY0JwZEdwWGo1bnp5V1I4?=
 =?utf-8?B?cDVhTVlwTkJRMDNGOE5MSHZ6V1k4T0RqQzFVVzFwdkRyNXlWbkxWbTA0M3Mv?=
 =?utf-8?B?eVF1NjNBcWU2UUo2aUVrcWMxUk02M1hrZjlPdGVxVTFFbHkwS2toQytFZVFl?=
 =?utf-8?B?dnF4SWZPeEMzdGFhU0Y3V1gwNzZMMU9RNytLQStRQVBTYnNsWEZRY2RsOVN2?=
 =?utf-8?B?WmEraGxKNVFDM0R6YkU4ZXY2dmRyZ3hDd0srU0txRFdQNk4vWENacWRKVC9o?=
 =?utf-8?B?SWhKeFVYNko1KzhFaXc2QkZvaEJFVEV6U3JmNGFSaXVmbkJ5WDlOdDR4TzF5?=
 =?utf-8?B?RUVDK2pzZHVDV3R4YStLdE5oMGNLWG54ZC9Xc1VjbzBPek1mSFhtMnJUb09i?=
 =?utf-8?B?SE1KUTBpakF2SS9nczh3OWZORlQza3IyUFN2LzhYdHJVREdCQk1MN3llOU9l?=
 =?utf-8?B?dkY0aldrSmdCd1lGUEdhaFNiS3YvUnRQS1owM3g4dTNBZ1hHRitOekpPcVhm?=
 =?utf-8?B?bFBFLzZGckRaMTVjSFZMSE1XTTk4angvU05zZmNSNkxRcXRLTzhReTRySjlT?=
 =?utf-8?B?c3phTG93SndNazNuMmUvaWhTbXkwNkMvdEZpWFlPai8ySm1jVTNsRGJRUm5x?=
 =?utf-8?B?ZWR5M1VQV0p6M2pIMlZmT1AyZXRTTnBqdFBOckVOM2tUR0VTZWpqTDB0Q2tI?=
 =?utf-8?B?MWRzWldvek5rejZ6K3cyRlFmcUJ2KzZZRmVRQ3RWWUJYWk01NysvdU9UZ0tM?=
 =?utf-8?B?U3VKZE5yYTF5bEFGNW80L3NLRnBBMHA5Y1pGemJnR0tlcUwvQmVMbXNTcjJh?=
 =?utf-8?B?eVYzWHJSR2pOR2lIeUxXWmZ4bk1OMVFHcExzS3NWbWhwdm5ocnRzN3NkbEpq?=
 =?utf-8?B?azgxaGxSaDVQc1lpZjhZMUZWemZieFEzVUhYY1NyMVphdDMwWlBFUzVtNW44?=
 =?utf-8?B?aUN1WUtHempRQ3NGcitZQW5qd0VzQlpQb1cwRHhUekpOQUpCVktGakpRdmdu?=
 =?utf-8?B?UExxRnpOZmEzUEU2cEVDY29kQXNHZmxqNFRHcC9tZG1qdG85UWhGb2NUcjZu?=
 =?utf-8?B?aXZZREg5NENlbmpqaUlnKzBpMk5YMUtUMVI5cURRT0hnV3A4VklITHN2ZmI5?=
 =?utf-8?B?Sm5PQXFHRVQ1TElTNWFGeUY1WlVVNGROOGdFZmRlU3M3ejVOUkpaNGVneEJh?=
 =?utf-8?B?eDZJU2pEaEx1NlZiakNRM3U2ZlpEMjBZOW9zUXFPSlppcDZnK3NJMjgvNkhU?=
 =?utf-8?Q?UO9WQG?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF67FA1A8F8.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eENKSTlaN0tiVkJiLzNyRndnMkk0NHJ0eTFiS1lUVkVuNUJNVWpOaTdnLzJw?=
 =?utf-8?B?RWRkWnQrQk8zS21XU0dHN015T1VCYjFTN3puc0VNMmhqbkRXTE1CVXYwQ2M0?=
 =?utf-8?B?RERLTjc3Y29vNGVWRHZHZExURUVnKzU4bU1tU25OMGJ0aGFyek9jR0t6bEZK?=
 =?utf-8?B?UGMvbHJOc25peVNDc1ltc1JRUjdPQ3NaSzgxRTVwdkNla1hQdVdLMmlUQ1lQ?=
 =?utf-8?B?eGFVZVRidFpUU0h1NS9vdCsxWVh3enhEVDVyUVBnQmd3NGVZMnZCMWN3VkVQ?=
 =?utf-8?B?OHcwNFcydzBOVklRdUl0NHNzVFRVM1psc3VTTU82Q21JUGRsOUhoUVZVQkpY?=
 =?utf-8?B?aFZzYmFRZ1ExNWFTM3Z5VTZsWjhRU1hSYWg1TDVRSW52cGdSdnowakJJTXNW?=
 =?utf-8?B?NE04R0JObC8yendOYWpVMllBajNQUDIvamt3SzkwWE5zdlFxYkl4ZnRYbUxZ?=
 =?utf-8?B?N1d1NGczMk5BaTRNR0pPQTJ2ZWNoUnhuSkd3cVo2YlNXNzl1bnlNTFpHS2Q1?=
 =?utf-8?B?VGhEVnBLOForUVdQencwOTFUZmxqclQxZzFhVzZMeW5kT3BhWHloRE84Z2Z3?=
 =?utf-8?B?K3dhUnZRQ1dRRExkWFdTR2huQmZaTUJZSnU1VU9YcDZOdDZKbnRLdVh4Ukhq?=
 =?utf-8?B?NysxMTY2TU1rVFh6QVdFSmJGdlFleFU1TEpTc2d4c2FHUkRFengzazMyN2I2?=
 =?utf-8?B?QlkwVVppeSs5QmhycmJxczBVTDZYRjVtd2ZDdTkzWmRwL29PamJCMytsZ2FZ?=
 =?utf-8?B?Ym9kaHN4RjlOcnR1MFBwdXlxNEpVMGUwdDVrMGJJWGhxalprNEoyVXBPZmNK?=
 =?utf-8?B?T0l1THVtOTVkdmphRDloa2tsK2lESEk5UXVTcUIyMTNtNWFVV2s3dnRGRTRR?=
 =?utf-8?B?MU0reU9wTHRsMG9BTFJzQzZnOXRnWDE4ZE9NWGsrb1hsS3hYM1E3c0prUHVt?=
 =?utf-8?B?TzRmcG53ei9Yb3p5aWN6eHBjTkZJSTF3V21VMGwwcXJseDVCdjJSTkRQbmo5?=
 =?utf-8?B?SlJwazFhRm51TkNuYncvZmVjL2J5NXpQZE00ZlAzSTU1MlZaTlN1Qk1jTjFx?=
 =?utf-8?B?ekdJR0huRC9YODEwek82TW5JT2YvTHRHUmNDQmZ3RkY2ekhBSURSbFk3bnRQ?=
 =?utf-8?B?ZCtxYkwrSU5DdkVBWVFsR2Y2b045T0p1ODFtZkFpOXlZUXhWZUNOREdkYTV6?=
 =?utf-8?B?V2xWNWt0Rm9YQzBEbEdnMWZSMzE3QUJnVFBFMFBYQmhjczRYb0phMVBCdldr?=
 =?utf-8?B?STYwYldHZDVxR21xeUFVcktKTkZRUnNJaU4zZ2tEVkNTUzYzZlBNcmw4cTNU?=
 =?utf-8?B?TSs1WHlSNzBKaXdlVjN4eVJKbXFnSlZ2bWl0WkFWSElSV2RSNGd5dW5Ca01V?=
 =?utf-8?B?UnI0OHd0TmEwRG9pQmlNU3Znd1J4VndqTlBjSjEwVjdvcTFzd3BkZXliYTBS?=
 =?utf-8?B?Z2xMY1NMWXRYVzFwSTAxN3hCeEZaTTQ5NEJGOVNZQmZ5LzdFNXlLTUkrVnhL?=
 =?utf-8?B?VmRlbFpFbjJFZjhHRVpET1JoVlZPbUp0QnhWL3paWmdtTVpOUFdGZHdlT3dS?=
 =?utf-8?B?Y3RqN0VuNllXMGVCcURpZHJNNEZtTnRmejdKand6TzJnNHRtRitJVVpkZWNk?=
 =?utf-8?B?cnZzajJQMjVBbUZJMmtvWHZlNGkwaWtUdTRnTnIwdUM0YlhwOXk0eG8vcnZY?=
 =?utf-8?B?VGY0bzArcXQwTkJkQ01McStuSXVYYnM5M0gra3ZPUnhkSFRLNy9jYWVDMEU3?=
 =?utf-8?B?dkFWTnBOREoyck9raGYyV3Bxc2RYUURNeHpOZ2FIMUxEcjlRZFpDWjg0Ykpo?=
 =?utf-8?B?WWdiWkc2SXozVFRsby90a0pEUEhHTWlRV3dwNHpXa3h6ME5yYmNFWEt3eUIr?=
 =?utf-8?B?WDNwcTQyV2NnWjJvbHlwcEdqWnc1NEhmZUFDem9nSC9VaXRUS0c1NExxaFhs?=
 =?utf-8?B?Z3Y2Wk1FaDBxLzlneGpqdHFaWFNTcU1za3dtalZZMHcvaWtHK1JGS2RTbFc1?=
 =?utf-8?B?NkZST2VSRllQbHdFOEZEM2w1a3hTUWFzbGNWU0M2T29HeE1pcFNyTExiOHM0?=
 =?utf-8?B?WDRUQlVuK2RFdllPVTlEMHFkODk4c0Vma2FRYWExOEU5Qm5GWVBybWc1Qmsv?=
 =?utf-8?Q?9wztrRzSCP6acPdchoByej74h?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD3C9DC16B8D8041A96ED8E0D68C687D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF67FA1A8F8.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 288be88c-4bb6-46bb-4e2a-08de3e51bdb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 16:23:12.8612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TgEnnFy7du9QZpcaPTPrzcP2SBslPCQ3m21f3Mlq1/YI2+5BWTmQS9EZrpS+nLRZducIKUaRbsK/AX2+pYygL6N5+SfkUbFgmZJBOB7ZczQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6125

T24gMTAvMjAvMjUgMTI6MTcsIENsYXVkaXUgQmV6bmVhIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhpLCBSeWFuLA0KPiANCj4gT24gOS8xOS8yNSAw
MDoxNSwgUnlhbi5XYW5uZXJAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IEZyb206IENsYXVkaXUg
QmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+Pg0KPj4gQWRkIHN1cHBvcnQgZm9y
IGNsa19wYXJlbnRfZGF0YSBpbiB1c2IgY2xvY2sgZHJpdmVyLg0KPj4NCj4+IEFsbCB0aGUgU29D
IGJhc2VkIGRyaXZlcnMgdGhhdCByZWx5IG9uIGNsay11c2Igd2VyZSBhZGFwdGVkDQo+PiB0byB0
aGUgbmV3IEFQSSBjaGFuZ2UuIFRoZSBzd2l0Y2ggaXRzZWxmIGZvciBTb0NzIHdpbGwgYmUgZG9u
ZQ0KPj4gaW4gc3Vic2VxdWVudCBwYXRjaGVzLg0KPj4NCj4+IFJlbW92ZSB0aGUgdXNlIG9mIF9f
Y2xrX2dldF9odygpIGZvciB0aGUgc2xvdyBjbG9ja3MuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
Q2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4+IFtyeWFuLndhbm5l
ckBtaWNyb2NoaXA6IEFkZCBTQU1BN0Q2NSBhbmQgU0FNOVg3NSBTb0NzIHRvIHRoZSBjaGFuZ2Vz
Lg0KPj4gQ2hhbmdlIGhvdyB0aGUgbWFpbl94dGFsIGFuZCBzbGNrcyBhcmUgaW5pdGlhbGl6ZWQg
c28gdGhleSBtYXRjaCB0aGUNCj4+IHBhcmVudF9kYXRhIEFQSV0NCj4+IFNpZ25lZC1vZmYtYnk6
IFJ5YW4gV2FubmVyIDxSeWFuLldhbm5lckBtaWNyb2NoaXAuY29tPg0KPj4gLS0tDQo+PiAgZHJp
dmVycy9jbGsvYXQ5MS9hdDkxcm05MjAwLmMgIHwgIDIgKy0NCj4+ICBkcml2ZXJzL2Nsay9hdDkx
L2F0OTFzYW05MjYwLmMgfCAgMiArLQ0KPj4gIGRyaXZlcnMvY2xrL2F0OTEvYXQ5MXNhbTlnNDUu
YyB8ICAyICstDQo+PiAgZHJpdmVycy9jbGsvYXQ5MS9hdDkxc2FtOW4xMi5jIHwgIDIgKy0NCj4+
ICBkcml2ZXJzL2Nsay9hdDkxL2F0OTFzYW05eDUuYyAgfCAgMiArLQ0KPj4gIGRyaXZlcnMvY2xr
L2F0OTEvY2xrLXVzYi5jICAgICB8IDQxICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0NCj4+ICBkcml2ZXJzL2Nsay9hdDkxL2R0LWNvbXBhdC5jICAgfCAgNiArKy0tLQ0KPj4gIGRy
aXZlcnMvY2xrL2F0OTEvcG1jLmggICAgICAgICB8IDExICsrKysrLS0tLQ0KPj4gIGRyaXZlcnMv
Y2xrL2F0OTEvc2FtOXg2MC5jICAgICB8ICAyICstDQo+PiAgZHJpdmVycy9jbGsvYXQ5MS9zYW05
eDcuYyAgICAgIHwgMjEgKysrKysrKysrLS0tLS0tLS0NCj4+ICBkcml2ZXJzL2Nsay9hdDkxL3Nh
bWE1ZDIuYyAgICAgfCAgMiArLQ0KPj4gIGRyaXZlcnMvY2xrL2F0OTEvc2FtYTVkMy5jICAgICB8
ICAyICstDQo+PiAgZHJpdmVycy9jbGsvYXQ5MS9zYW1hNWQ0LmMgICAgIHwgIDIgKy0NCj4+ICBk
cml2ZXJzL2Nsay9hdDkxL3NhbWE3ZDY1LmMgICAgfCAyNCArKysrKysrKysrKy0tLS0tLS0tLQ0K
Pj4gIDE0IGZpbGVzIGNoYW5nZWQsIDcyIGluc2VydGlvbnMoKyksIDQ5IGRlbGV0aW9ucygtKQ0K
Pj4NCj4gDQo+IFsgLi4uIF0NCj4gDQo+PiBAQCAtODgyLDEwICs4ODUsMTAgQEAgc3RhdGljIHZv
aWQgX19pbml0IHNhbTl4N19wbWNfc2V0dXAoc3RydWN0IGRldmljZV9ub2RlICpucCkNCj4+DQo+
PiAgICAgICBzYW05eDdfcG1jLT5jaHdzW1BNQ19NQ0tdID0gaHc7DQo+Pg0KPj4gLSAgICAgcGFy
ZW50X25hbWVzWzBdID0gInBsbGFfZGl2cG1jY2siOw0KPj4gLSAgICAgcGFyZW50X25hbWVzWzFd
ID0gInVwbGxfZGl2cG1jY2siOw0KPj4gLSAgICAgcGFyZW50X25hbWVzWzJdID0gIm1haW5fb3Nj
IjsNCj4+IC0gICAgIHVzYmNrX2h3ID0gc2FtOXg2MF9jbGtfcmVnaXN0ZXJfdXNiKHJlZ21hcCwg
InVzYmNrIiwgcGFyZW50X25hbWVzLCAzKTsNCj4+ICsgICAgIHBhcmVudF9kYXRhWzBdID0gQVQ5
MV9DTEtfUERfSFcoc2FtOXg3X3BsbHNbUExMX0lEX1BMTEFdW1BMTF9DT01QSURfRElWMF0uaHcp
Ow0KPj4gKyAgICAgcGFyZW50X2RhdGFbMV0gPSBBVDkxX0NMS19QRF9IVyhzYW05eDdfcGxsc1tQ
TExfSURfVVBMTF1bUExMX0NPTVBJRF9ESVYwXS5odyk7DQo+PiArICAgICBwYXJlbnRfZGF0YVsy
XSA9IEFUOTFfQ0xLX1BEX0hXKG1haW5fb3NjX2h3KTsNCj4+ICsgICAgIHVzYmNrX2h3ID0gc2Ft
OXg2MF9jbGtfcmVnaXN0ZXJfdXNiKHJlZ21hcCwgInVzYmNrIiwgTlVMTCwgcGFyZW50X2RhdGEs
IDMpOw0KPiANCj4gc2FtOXg2MF9jbGtfcmVnaXN0ZXJfdXNiKCkgY291bGQgYmUgY29udmVydGVk
IHRvIHVzZSBwYXJlbnRfaHdzIG1lbWJlciBvZg0KPiBzdHJ1Y3QgY2xrX2luaXRfZGF0YSBpbnN0
ZWFkIG9mIHBhcmVudF9kYXRhLg0KDQpTbyB0aGlzIHdvdWxkIG1lYW4gdGhhdCBJIHdvdWxkIHBh
c3MgaW4gYW4gYXJyYXkgb2YgdGhlIHBsbHMgYXMNCnBhcmVudF9od3MsIGFuZCB1c2UgdGhhdCB0
byBsb2FkIHRoZSBjbGtfaW5pdF9kYXRhIHN0cnVjdCBpbnN0ZWFkIG9mDQpmaWxsaW5nIHRoZSBh
cnJheSBvZiBwYXJlbnRfZGF0YSBhcyBpdCBpcyBjaGFuZ2VkIHRvIGluIHRoaXMgcGF0Y2ggc2V0
Pw0KDQpBbmQgdGhpcyB3b3VsZCBiZSBmdW5jdGlvbmFsbHkgdGhlIHNhbWUgc2luY2UgcGFyZW50
X2RhdGEgcG9pbnRzIHRvDQpjbGtfaHc/Pg0KDQo=
