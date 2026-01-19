Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023121.outbound.protection.outlook.com [40.107.44.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E907D28DB54;
	Mon, 19 Jan 2026 11:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768823847; cv=fail; b=LK/Z4P3JyC5bA02oefKyGzqGVkuj7yAygMyROPuU8bySeiELnzHDyjphm9f8HMguZHEiHrY7QzQYoryxBi3W3ijSYZX7ml9zuPyt9QrLph3wnkaKxVp7r/CcqYqScOyLytJXBbVnLmJEFBcERzrVjAbzkVDPex1gV981lf2uenQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768823847; c=relaxed/simple;
	bh=Tbp+sSEmsaq3Ead80WKF4awzKLDHHA5Cx7n2AlGumNM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XhfsU6A5a9omyMa9fWCO3hndPkbbNvxR7kgu2pkcYN7qgb4LKBC15sN7hvkArCK+PV7HTpd/uc5Jb2qdGFwk4UQ/F6ki3bfYdxct4INdaXp1yuz6WlbNUlIGgjzVSMkoGlLiwRArrSzy2ZnUCUklGj7FKc0S4CQ3psBJZ/8lrmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=bvMUXcOg; arc=fail smtp.client-ip=40.107.44.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="bvMUXcOg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQFaXN1w5oCYsMhrpXz6678rCQQLHZ8YnU9l+MBfkfTjNejAIn7rj3tojsIWLbzCZUFtwzGtLUdBfIS03Okvp1IFS2RzxIksV5X2KJomTZALuCXY728ue5rfYMPA+3JKtW9q78HGsiUMm5+3PoT3+u97Tgt+agFS3+4iFnGMXVpaRqWbJioetPWhfb0fjZRNxzOgQ0S3+LqAGlI+dR9WQM/iFRt6XpaZjpvLBF8BX25wgxAWcM+Fj4rOEJ4/q+MgKnyL8loRr4yqJ5BJbz/yw9HuwnQhSblHm9odo3tYFws7sxwcA4B+Mwj0dDWclMrlu9vT6vALPo8Pke7S3mK8WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAg6SDiHPZ/NQ6tLZqAg+gfzhCkF//XNNev0VoFzjnw=;
 b=m4speD/m0HBIscKVImyUOI4hFmQ6Ez8hCjPmduhzxpRcnkNja5yZtrPFCL/42RyghXX4iBWnRPxNE68utLCDfchQEUdPGvDYPgqfRaKV9Iu2vmRrFSTffoWfmH4CFcv/NAWgJ+S9HhvF9B6+OVfAfSWNJ+7MqlPMVAl9xaqGyzdDDnHH2EK8bXAPzBKi+EQK0iSxGB48s/BID2s3H5bzaTSYEGOTLKvvIGw27vveEt4duCdurdzRSmObulldPCZPI+IincawEeIvFPEPvqSSfBk/VVwSEy+BvVuwM0sDZOEwoL1ED3KQkBWbXVqHgpW7arEnSD5HqUVKop906CKM9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAg6SDiHPZ/NQ6tLZqAg+gfzhCkF//XNNev0VoFzjnw=;
 b=bvMUXcOgEvs43erqeZ9SBTjYhU2rQMo0WofQOZ6jkFqQ+pjj4miI3wsFCaoK5mNMmHD99SvF7pPi2gj+oZDttE1UeS2NOi3rjWncxfpGPsQ6F6ImsBjlvUrHPDaI4jqp+4a5O5HCd+AORiaPsRvXTKCPTrgUB/yqwtqFfgnWUeR3mLZk958jfjdQdF7tTfvuBWNGMphZzWIi/4mAND4lwfaUyvIQwCt0CZPo9TPA+G/QrtaYTCP1KDWFAtBev8AQSXcjL2zzum2hGPVY9orAwOux9FepjndOioP4rkzbIcoWtPTBjbFnjXAmTWXlbiHCfGOzTqI8QMKi3ahfTshd6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TY0PR03MB7239.apcprd03.prod.outlook.com (2603:1096:400:277::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 11:57:22 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9520.009; Mon, 19 Jan 2026
 11:57:22 +0000
Message-ID: <49bf1804-e532-4110-853e-64c54370567f@amlogic.com>
Date: Mon, 19 Jan 2026 19:56:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: Ensure correct consumer's rate boundaries
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260109-fix_error_setting_clk_rate_range-v1-1-bae0b40e870f@amlogic.com>
 <aWhDLNFtaoU7A-AN@redhat.com>
 <fe437139-4c33-489f-90f9-44e3dd3b0f9e@amlogic.com>
 <aWjlMrlCEbprgKg5@redhat.com>
 <6a66f0f8-3fbf-46b7-9370-5768b1acd96b@amlogic.com>
 <aWpq4E4_zTIO8Phr@redhat.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <aWpq4E4_zTIO8Phr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0001.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::18) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TY0PR03MB7239:EE_
X-MS-Office365-Filtering-Correlation-Id: 540764a3-e51a-41f9-5053-08de5751e74b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkNmWHBYWUp6RlZtalV2bG1oYXE3M2RvR3J4ZmtncHJOTTBDNmViMDRmbGtX?=
 =?utf-8?B?T1kwK2lxcDU5YndoN25paTBFT2kraVVPRVpRUlQyajFYMW0yUXF6bldTSWdI?=
 =?utf-8?B?WnVPWHhWYVliVXNDcS9KQ3RRS0tXam1LSHZWajRlU1B5MzJFcDdCYWtJTVJH?=
 =?utf-8?B?bnNmenhPTkY3NVNFQVhCNjBvQU5RVE5uSnpPaW9IbmJySExNYVZaUm9ZTHA2?=
 =?utf-8?B?bHB1SU40TmJVbmpvRkgxRmtRS014SldGNlR5a050aFh3TlhBOWNnR3BqY1hu?=
 =?utf-8?B?R1VNMkpaeFNocHZzY25GSDYwa0NhaWc0L3N2Z1p5ZVdHMVRHTjFBVDRzbmdE?=
 =?utf-8?B?RlBEbStKT09FNkdnYi8yQnJxTHdpMnBiWDI3dnE1WnZzWkE4TDMvZW04Y3ho?=
 =?utf-8?B?S2puYTRENzdaVjRmamhjRUxoYUFTd29aeHpLODg2TFBjOStXQnN3SXI4WVJs?=
 =?utf-8?B?QW1ZWjROMUc0eklVNjJVTDUzTDRkdkN6R3JQQnNwQjZIK0xzcHdMR09CWmtC?=
 =?utf-8?B?UFNkaVYrRVZBVDUxbE5kS1ErR0cvYnNaRHFxUEFJaXhHVTdnaUxnL2FqSEM0?=
 =?utf-8?B?Y1MyOGdFN1BhN2puY0U4Q3FhbzdwakhncFNoUytmaWNwSWdOVWNFTURKRjRp?=
 =?utf-8?B?VlgzOWNXUlhLN0M5d2JKamJ6MktqK1pTUXVuaXdaaUtBNUZtRDdmQVJWUUdy?=
 =?utf-8?B?N1FjQmxTODdJNnJSMWsxWDBwMzA2WXJIdXhiSnFSWHBaek5tU1E5d1FRalRG?=
 =?utf-8?B?aDhiSFk1N3ZsTCtKN2U0QURGRm11SkkyZ3dSeURvQy9VeUptcEJNaEdia0Uy?=
 =?utf-8?B?QjhJYVFaZXNBSkJleXJvaWNRanhENEx3d3BHK01CbzRxVWhHcWZGSENWR1NR?=
 =?utf-8?B?RUhFSHVUdk9HNnJvb0tSd1VKN2tvWFVwQnh4dzFnN2FBK0dsUWZSYy90K1lm?=
 =?utf-8?B?bVJCVVBJWVB5N24wdEgyR1p4dk16STBLMFRKbkxCYWgxNm1IWXZGV1ByNDN5?=
 =?utf-8?B?TzNVZ1JmbXNuL0lHUDlMOEM4eHp1QWtKbHNqb2FIbk02aUsyRWlhTnQzZHRI?=
 =?utf-8?B?ZlJ5SmhEYU9ieGYwYlhpY1p3VFl4YmY0ZklramRCT0cwVnIzOUNrQmdrODQ4?=
 =?utf-8?B?VDZxQUVCdUFNMnFlVWpobnI3c0Q3L2Y2TzUvaFhmcmFkSGd1cC9lMHFpeENV?=
 =?utf-8?B?QnNtSTRTNzY3L2s2a0RXQXlrczQ4enhTQVNJUzZCUk5icGl4NXdDT2pkQitG?=
 =?utf-8?B?NXVKMVUwL0NzR3VrU01PVmxodG5nTStBYkI1aHJKWkJvaFVEeUIxSzgvSmY1?=
 =?utf-8?B?eCtCTEpyT2V5Y3FQdUpkSnd0NUxvNnZqV3o1L25YM2V2cDNSOTVCNVNsYVJS?=
 =?utf-8?B?bnVxRlBrdVIxakxUWSt4c2Z4UnR4K0g1WklOSlplR0lMTXRNcTh2eEM1a1dw?=
 =?utf-8?B?NFlBNE9UTUhYMW92WWtNK0hRSkF2UmNhK25UY3BrRzN4OFVRWlpLbnF2R1RT?=
 =?utf-8?B?NzRMaVhmbE1sVzJFSlo4UUJmVXVCOFFsRzRuU3VXeGtxamxWblk0VWdiaEh1?=
 =?utf-8?B?bDlZTzMwOElZcms3MFBBLzhNQlZQWERlT0doTnZNVnlmQmcxZWxhNnQ3SWhw?=
 =?utf-8?B?TlkzQnFPWUQ3cW4zZHFNd1dsQjRmbTlNNkwwY3ZOeC9jOEpNc2lseGV2dHFR?=
 =?utf-8?B?YUU3UGN4TzUydFhWR21jRmJzcDEyTHpTemRTNmkrN2xYRWJYZHlsNlcwNm9y?=
 =?utf-8?B?WWQvR1l3dURtckc1Rmp6bXVXZU5XeUVwYUVQRG1NZ1pwcnZJanR0VWgrajJ5?=
 =?utf-8?B?V3ZxSGVZT2dHK1JwRDdQR2tzeGdIQTJmM2h5SVI0YXhTSWZZcndjdmV5SkVw?=
 =?utf-8?B?R3FpZGQ0WlJ5T1lYYlVlaCszUEZQRFgyU0ZxSzFNN25JRU1XSDRmZUlWNFJn?=
 =?utf-8?B?cVlXL0xOZVhEOTVaOVdTM3JPYWMwSGJqL1oveGdGRHREZDNZOThDTnEwSG94?=
 =?utf-8?B?R2h6Ymt1M2ZNelVXWDlvYlFvanNNd2Y5ZHArcWJ5WEZkeGZVUjNHTVBWSnVU?=
 =?utf-8?B?NmxMWDZxRk1wRTNGMzRJUGsvNElwNHh2TnNCeEQxZHphV2ZnRHpnRXBZRHVy?=
 =?utf-8?Q?/ibs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlJKdEJBWFMzZUhqWkxhY0lONDlGY0w5SkpVSTBqMVFwVmMvb09KSldmVzhB?=
 =?utf-8?B?UllEb3dhemhjaGQvUWV5a0VoaWlCUHF4THhGNmhQL1hlaWRac1pwRXR3WkQ4?=
 =?utf-8?B?RFJRcENOdTcwdHJGODFFTVlvOE50OEhSb0RtZHFBZWFxeUtXcUExSVY3NXFZ?=
 =?utf-8?B?bmtzQ1p0MnA4SEYrUVYvTkJtaCs1ZWxoTVpjemdJSE9TTW1QQ2FQbDlkdGFl?=
 =?utf-8?B?VU8xelpEaVdheVFvZnNHMEE3VzA4OU4xVmM0UkE3a21ZSG5tUnBNVnMwS2lq?=
 =?utf-8?B?b1NRTlk0Rmo0M1ZPNFo5WHY3LzdkeUZPamRaQmxhbkRiR0ZaZlJYOVFPbkxU?=
 =?utf-8?B?WWdzR0xXWEdsN3VFS0F0d1hOVHZBcTIxdHVQVnE0a3loRzJWRnZzWlRQdVBH?=
 =?utf-8?B?cnlFdDdxMW9OZkNNS3crMmtMNS9jQ0xIQmxZdlUvcU94dU56Z1ZSYUJpeXZ3?=
 =?utf-8?B?eWdxei96a0NlY2ZUb1FTdCtJTVpJTFh5SStSaUpMc3lVRGJycFlyTG52eURB?=
 =?utf-8?B?Q1pRQmhGNUpwRGpHSmM5ZWlXc2I5bUtTT1dJdFlsL2tZeTlyK1NnYTVER3Rn?=
 =?utf-8?B?SzdOOXNOZzlNSVBTRmR3dnpDWXArZkx6VzVMd3BuOFpVZlRSQXVYTVBTa0xn?=
 =?utf-8?B?SFFiK3JuOVVyMmdxMktWTEU4VThVcjVocEVSbkpiWHVXY01yNDJhZ3J4R2J6?=
 =?utf-8?B?ZUxPUzJoTjN3SFBTcWtLSjZkbDVXN2lSWm1jSm9jU21JRjhnRTcyY3lONU02?=
 =?utf-8?B?eWVnQUIwRXRvY3pHNnUzb1FqVFFldm1VeFpvYnlzdCs5b2VLVVFQcFN0V1VJ?=
 =?utf-8?B?eWhpeCtuYkVjRi94cDJ0LzNIVkpCS0ZWSUQ3UXV0WVZ4dXY2T25xTkNiMEZy?=
 =?utf-8?B?c1IzUnRrVksxU2RXSDZRcEowYWNUcjV0aW00eVA4LzNhdFdTUGtKbU5iTGFj?=
 =?utf-8?B?NCsveUc0cUNNS1FFNTNQT2VXNVJldk1COEU4cW4xODRCRjZBN0NnMzhiLzNZ?=
 =?utf-8?B?eXJjSzN3ZXh0L1FpZEFtblAyZ2VtUTFZa1VpWEFKc01mdCt5NmJEeS9yNkFa?=
 =?utf-8?B?eHdyWjZVMGx3eDE1UVVtNTJHQTcwRlpLNzVuOTkxeVIxZktHQkhDbDZNMzJL?=
 =?utf-8?B?WnkyN2U3Z25IeTJCa3pOU09FdFk1bThwaTVMVHlVdjR2YlRudG5VczludGc2?=
 =?utf-8?B?bDkrN0pMNURwWXhmcmpoMWZaLzNDUlpIdm1UbkpIano4elBPN1RiQW1zRGRm?=
 =?utf-8?B?UTc0dmV0WW56T0FPMUg2QUpxdWF1YUovbHl4aW8xWDlSOElabVV1bHZXMDN1?=
 =?utf-8?B?cEZyV3p3L2c5bW5JcU1sc3R4dkw1NGhlcmtWazk3c0JoSTUwSlYwNmtFeFdw?=
 =?utf-8?B?OGRtd0FBdnNvQnp6dGZlemExNHR3Z3NwUWdWUlhCTXlSekdFLzFGKyt1dEhp?=
 =?utf-8?B?UERtb24wMEJ3OU0wTGxOL1FOeFRxay9UeTRRR0EwU0c0VjMxaDVjUDdwZndI?=
 =?utf-8?B?eUVtdVNVN1VZaU4yS2lCZVpvb0pjUk1pOVlRSVovM211a2JzbGtPMERRcHFK?=
 =?utf-8?B?RDBRamZJbU9zTnFNMUNuVUxJTWpabWhoVFZRdjR1UjZpVHNzelRTcnF5N0Mr?=
 =?utf-8?B?cjBsQWtoQWo4cTNJMGRacnowL3laSkd0OFZFRC9SVUJaVllDbzhvQnB4Y0VD?=
 =?utf-8?B?NWZuZzBaakgrcHZFc1A2Zlo3MFQvQjJtemdyWWVHZTNZb0VjMHdWMVVaNk9C?=
 =?utf-8?B?MDlkbVJ2cVVjN2x2d3dITmdCRG5Rd1I2d0RZUVl0bDc5YlZRK0tPQ2FvYWxH?=
 =?utf-8?B?RlpFdWFNVzhuMnZ0WnRPODA0eW82OEdySmRXNEFmZzgydHMwV3NOTDNnakd3?=
 =?utf-8?B?cVJPai9adEwwTkVlL0tVWWExL0JSTHl2cGRRT3ZvUjkyUy9xWGNvOHJiQU8x?=
 =?utf-8?B?RFlMbjFCQ0ZLNVN3a2FPTnY0K0tXRW9LT1RsbStFSzR6M1hkeTlDdC9YakR3?=
 =?utf-8?B?QjgrWjFLaWorQXBkL3Q4cFBGekZHL1FXQjd0T1M4MzM1VDdqS3cza3NjRm43?=
 =?utf-8?B?RHJGUmQzQ2o2dHk2a2EyRDdEdGFvdmxRakFEM0tuaUJVN0RvWXJnUENYSGJW?=
 =?utf-8?B?djV3RVU3QTJPdU1QbGdzaDlMdi9xeFdoQ3RxdlVhTTRuYXNISWx4NmF3ZjNw?=
 =?utf-8?B?ckN1dzExNUR1RU51TVRyTGVxdmJvd01KK3lsNnlsLzZkeWZUb1QzR1M1d2U2?=
 =?utf-8?B?aWJnbU5XSnlKbFpYU2VCb3lCRGk5dW8xNHdGVmllSHJ2OHlDNjE1bVhCaWlh?=
 =?utf-8?B?K2tSdUhZV1hzRmZOSTNFOWRjZjZqVG9OdWJjaGIvblVGZTVOSlF6UT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 540764a3-e51a-41f9-5053-08de5751e74b
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 11:57:21.9654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wIhPkU31KxkZ1LBkL/aHRpUcRXzJ+myDDeqb27hdNtNwAQvXOq0i3wX+8E0rmx+wfAsaQaMofnA+sPo57TFWFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB7239

Hi Brian,
Thank you very much for your help. I will wait and collect feedback from 
Stephen and others, and include your kunit test case together in V2.

On 1/17/2026 12:44 AM, Brian Masney wrote:
> [ EXTERNAL EMAIL ]
> 
> Hi Chuan,
> i
> On Fri, Jan 16, 2026 at 05:32:39PM +0800, Chuan Liu wrote:
>> On 1/15/2026 9:01 PM, Brian Masney wrote:
>>> On Thu, Jan 15, 2026 at 10:37:55AM +0800, Chuan Liu wrote:
>>>> On 1/15/2026 9:30 AM, Brian Masney wrote:
>>>>> On Fri, Jan 09, 2026 at 11:24:22AM +0800, Chuan Liu via B4 Relay wrote:
>>>>>> From: Chuan Liu <chuan.liu@amlogic.com>
>>>>>>
>>>>>> If we were to have two users of the same clock, doing something like:
>>>>>>
>>>>>> clk_set_rate_range(user1, 1000, 2000);
>>>>>> clk_set_rate_range(user2, 3000, 4000);
>>>>>>
>>>>>> Even when user2's call returns -EINVAL, the min_rate and max_rate of
>>>>>> user2 are still incorrectly updated. This causes subsequent calls by
>>>>>> user1 to fail when setting the clock rate, as clk_core_get_boundaries()
>>>>>> returns corrupted boundaries (min_rate = 3000, max_rate = 2000).
>>>>>>
>>>>>> To prevent this, clk_core_check_boundaries() now rollback to the old
>>>>>> boundaries when the check fails.
>>>>>>
>>>>>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>>>>>> ---
>>>>>>     drivers/clk/clk.c | 8 ++++++--
>>>>>>     1 file changed, 6 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>>>>>> index 85d2f2481acf..0dfb16bf3f31 100644
>>>>>> --- a/drivers/clk/clk.c
>>>>>> +++ b/drivers/clk/clk.c
>>>>>> @@ -2710,13 +2710,17 @@ static int clk_set_rate_range_nolock(struct clk *clk,
>>>>>>           */
>>>>>>          rate = clamp(rate, min, max);
>>>>>>          ret = clk_core_set_rate_nolock(clk->core, rate);
>>>>>> +
>>>>>> +out:
>>>>>>          if (ret) {
>>>>>> -             /* rollback the changes */
>>>>>> +             /*
>>>>>> +              * Rollback the consumer’s old boundaries if check_boundaries or
>>>>>> +              * set_rate fails.
>>>>>> +              */
>>>>>>                  clk->min_rate = old_min;
>>>>>>                  clk->max_rate = old_max;
>>>>>>          }
>>>>>>
>>>>>> -out:
>>>>>>          if (clk->exclusive_count)
>>>>>>                  clk_core_rate_protect(clk->core);
>>>>>
>>>>> This looks correct to me. Just a quick question though to possibly
>>>>> simplify this further. Currently clk_set_rate_range_nolock() has the
>>>>> following code:
>>>>>
>>>>>            /* Save the current values in case we need to rollback the change */
>>>>>            old_min = clk->min_rate;
>>>>>            old_max = clk->max_rate;
>>>>>            clk->min_rate = min;
>>>>>            clk->max_rate = max;
>>>>>
>>>>>            if (!clk_core_check_boundaries(clk->core, min, max)) {
>>>>>                    ret = -EINVAL;
>>>>>                    goto out;
>>>>>            }
>>>>>
>>>>> Since clk_core_check_boundaries() is a readonly operation, what do you
>>>>> think about moving clk_core_check_boundaries above the code that saves the
>>>>> previous values? That way we only need to rollback in the case where
>>>>> set_rate() fails.
>>>>>
>>>>
>>>> Perhaps it would be more appropriate to move the clk_core_check_boundaries()
>>>> check before saving the previous values, like this:
>>>>
>>>>         if (!clk_core_check_boundaries(clk->core, min, max)) {
>>>>                 ret = -EINVAL;
>>>>                 goto out;
>>>>         }
>>>>
>>>>         /* Save the current values in case we need to rollback the change */
>>>>         old_min = clk->min_rate;
>>>>         old_max = clk->max_rate;
>>>>         clk->min_rate = min;
>>>>         clk->max_rate = max;
>>>
>>> Yes, that's what I had in mind.
>>>
>>>> The changes in this patch are intended to avoid altering the original driver
>>>> execution flow, while making the minimal modification to fix the issue where
>>>> the range is incorrectly assigned.
>>>
>>> It's ultimately up to Stephen what he wants to take. I personally have a
>>> slight preference to the approach above, however I don't have a strong
>>> opinion about it. I'm just calling this out to help with reviews.
>>>
>>> The one thing that Stephen will want though is kunit tests for this
>>> since it changes the clk core. There's already a bunch of kunit tests in
>>> drivers/clk/clk_test.c. Feel free to reach out to me if you need help
>>> writing a new test.
>>>
>>
>> Thank you for the reminder. Stephen previously pointed out the need to
>> improve the kunit tests, and I will take this into account in future
>> submissions.
>>
>> I would greatly appreciate it if you could help enhance the kunit tests for
>> this particular test case.:)
> 
> I attached a patch that adds a kunit test that you can apply with 'git
> am'. Try it with, and without your patch to see how it operates with
> and without your fix. If you like it, then feel free to include it in
> the next version of this patch series.
> 
> Brian

