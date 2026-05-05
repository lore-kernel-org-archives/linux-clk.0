Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA83314A98;
	Tue,  5 May 2026 13:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987185; cv=fail; b=a93BiA0JPzdVjW7gpC3HIHx0BCctKZ+J8h9bH9Z5JlKM0RJxJDY5Ln3+x+83ok3ALPEXyVawBQ0K7qWPxSrpUqfI9lRfvI4m1NAirQqKEWI+KWvulahIzXHnOp1XtWoBeU5cTqT9ddEfRe2b6A8jk03isFftm3VYR6NLJaaE0Fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987185; c=relaxed/simple;
	bh=t60cpKTqF6WAMsnbRjqZQU8b+ZteJhJ7lZprL8MSmgQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=D7SwphY9uNTt1ezR5kmC0t7xtSenzvxH4Dr3MFKmCSVpGi8jrsi3kj/DFmk/2DV57pHXOh+P2P2XOXRqWCyNicz3qgv4g6EbTPyzleuwAlUo5CdXenhIXsUCklP7Pnh3o8X9ovHles96bGJfHObNKCYYFYDzdQ8ScoootMDVCys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LRyP3nIx; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LRyP3nIx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777987184; x=1809523184;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=t60cpKTqF6WAMsnbRjqZQU8b+ZteJhJ7lZprL8MSmgQ=;
  b=LRyP3nIxF1e1c9NVcJQzJUzna1IYQEFoP7xJrF0h4Ke1piKD8rS9mCyV
   rUvlI3xoY1Jq4gHF9QnHRYSlxJVjjzMutWt/yRDKCAGCJzegahNPeZHKB
   FP3vddmwR7L9qc/jrPNe0B7Yond26SikdnWeAhnmAcT2j2yyOQfi//UUp
   5cYPnFlKQ2JpI3umerzUz/vUVYbvW8Hlew5xjM3f2ZzF+ltO9QSZsT1Nr
   BjewkF4CVcWcGQYIK0Y1YK+NRtUpYGjAdg9bczeJTtNE36DCgfJv1l9Mz
   hobMKXxj0XPPjoZgKDteihpX58q64/m7JZ+ycPspmWKIhUjtPQNbON4Ez
   Q==;
X-CSE-ConnectionGUID: HLRT2UjJS8CvPRWQJ8UEFw==
X-CSE-MsgGUID: SOZACu/RTWWiIlWMyAuWYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="79046432"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="79046432"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 06:19:43 -0700
X-CSE-ConnectionGUID: 0zeomjSJTaeqpYIl42z0RQ==
X-CSE-MsgGUID: K7uh3kt5TwuncCbxLZZtjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="232670725"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 06:19:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 06:19:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 06:19:39 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 06:19:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kwl9okNSrQEUdJpNWyqxq29XZx+jevrg5SciAc02oxXN+ZFLM9E4uDh/dpiZSoEp+RP9ZWBNgoTEm4N9Fm8JbF//mxs2pz75AZls1jNyyEtJ4pRqJtEJF/k3iJ15+RVSXIDWCNpR0OO0NdNCO6+nTEtaNyUK7ckTn3fJ6UJMNWW+1jrnSkpAi9Vy7Z1+WEU4p3Gw4XWylmTj4mcy3UlLGAVxytx49ggNpHkEMbLrHg0dv1mwQiJD9d6BPcO/EAagfQqeXvp3OiXmiOc/lekPTvJEhQcZ7CPDESjAPTQWYCTTMwdx8ANpYeWEMrWH536AN4eCES3mX+nf2iaxNdzlTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8y7CYMYGsdoNB+HuHEm9oROBYv2gSaBGykRuzpn5Q8=;
 b=bWQ/VveUP4/Swmn4JMXzAGjPT7jUiY5Rk7dOg8SZ4Q1PIQ9q5wYH0e2n3QzIB/PVaSvRxELylPolkwyHkdKgw0oLU0shvBtEm/+l9f7i8zM/hM1ZDN1p86tMlKGfV5JpVtAlvziwHAycglm5DUxHp1epHdD4vbKWT8mIco1mtLkVzolWAXlVmNyIMn6mj9Pkdb3rsH7/DqOFHfMSO2tRYxH74+WB6mIlvY234bfAW64Qz0eHIJ+JnAYPwlgc8RoHa5wV8h7AQkdZWTxrftqHzJeZxBsOzdPTt8l0H6W1r1omnVjYl6gbY9ssL4EuRVJ5H7cRVs93tJwPpm1kCuQ8Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by IA4PR11MB9154.namprd11.prod.outlook.com (2603:10b6:208:55e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 13:19:16 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 13:19:16 +0000
Message-ID: <13607cc5-b724-4fbc-8595-8fd5c7f1b4c3@intel.com>
Date: Tue, 5 May 2026 16:19:09 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] i3c: mipi-i3c-hci: add microchip sama7d65 SoC
 compatible with the required quirk
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
	<alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <Ryan.Wanner@microchip.com>,
	<tytso@mit.edu>, <romain.sioen@microchip.com>,
	<aubin.constans@microchip.com>, <cristian.birsan@microchip.com>,
	<jarkko.nikula@linux.intel.com>, <npitre@baylibre.com>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
References: <20260505071327.125787-1-manikandan.m@microchip.com>
 <20260505071327.125787-4-manikandan.m@microchip.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260505071327.125787-4-manikandan.m@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0191.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::20) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|IA4PR11MB9154:EE_
X-MS-Office365-Filtering-Correlation-Id: 85380632-2969-4f68-9181-08deaaa8e815
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: K4iVZ5pzIKRdwzO9CLBbyc5w7nIu3ja43Hj3f6woZjKjqECL/6m5hU2R0dlGSZRe746A7R9D109OjXgAkuEG0WXoOCzqB7kKMTZnZiy+NPbqwnRD49pWT3vunnsX8bHZ4IWqCO7l9yDmlsEUsqCli+7lotvQLGMyZprVj06jW75ZiqjvBHRHAgssAhBhXbXGSG7Mj5AcclIaUUbR/NX+n8jikCevtzDT7v3i4Xrhu02yr/HyrxoOHCAz22Z3faQF3+On7zUtgua6rBBxvn8ZV77Ib6q3yceYcYtdh1PEkr09RjbvY6LOJo8mRCi/GTTNmTdsCTbQddSZQvW0cwuunLQUtvjNdC1dMXhqeMV8jsgSzs+4Z3+2YiVo7OlE68TMxEMiz3gFxnXQud1hCGt1izUeu9K05Ix7clJ3Q5oediEACnwpcxDlD1v2cthQZTvEZRwSpxzs59XV3y2t8MJISYTERfgJuzQRl5gLaGiUq3M8KDRkD2PLsVilbdmS5luufo5GlESK6ykZ0qdNZgGSEbe6Jugq4C90DNCY8lBwhaY2+c1g+ePOSV4xDLXdVjmMoeS3kf9KtfKvj96vN7ZD8AkApaWgDNqIzVfs6MaYPTMPKU/wevf3yE1qns/hoEq/Ejp4BvpfTj3pfDyc7y2Sd1OvDL+mT4ajA3UoWz0g2NavRcMrRPhJa90LPJq45kwVpxgLpqJS+aYfULHFmeKZnOaL3g5OOWyuZ+zm5R7jy78=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTFyUTdqbWRFc3RiMUhURW9Fakh0RHpGNXluRU5FMzFHR1BHcEZyMFJ2VHgz?=
 =?utf-8?B?dzEwTDVxUjYyMVl6cHdEMTB5ZFprZGhjWHdhd0VPZG1USjB6aHFiWUlFNm5j?=
 =?utf-8?B?TkpOZy9IUzZMQ1BTdzE2SklDZERTdllTS3lIYkJpOWpRcmtDU3RLUGN4SWN5?=
 =?utf-8?B?TFYvTG1mTWlaLzZRWXplY1BzOGwzU3B0eXhxTTNkYndycHhZbnFwcndOeHRv?=
 =?utf-8?B?bjEveTJRc3pPa1g5L0ttbERvaEpvV0F4Z2tISHJBNmhQWnVnUHN2VGlPZHcx?=
 =?utf-8?B?a3RHcmRUNkVPSHJEUzBuci9oYUd1L3VBRmkyUmR1Skd5ZVR6YlZ1Tjhiendp?=
 =?utf-8?B?MU4xKzl5WTcyWjlIOGlyekpyVmZQK1dIU3BxNlo3RUtmdTRTVGdmV3U1Y2NV?=
 =?utf-8?B?Y1plQldwUDdaWHVwRitYTFdYaEJWY3pKMGJYbTdndk5XZ0lnajdEbWFJSDZ4?=
 =?utf-8?B?YnA4bGllRURuUFJBRmYweENJRW9pUlMrdytmbWQyNVBzRUR0V3dwZk55cXhQ?=
 =?utf-8?B?a0Z4dGpObDduOCtuVFFjNENkdVdEK29LN1lLVmpnMENjUkY2OHJhNW9uc04r?=
 =?utf-8?B?dUNYL1BVamNPWGRKVHZySEZZRWNINE1QQXZoVzlreVYyOG5TYlF1R3paS3Zo?=
 =?utf-8?B?dWFoMTZOQll3bmRiWHo4U1JaQk1BY1ZpbXkrVG8rdE5yY3Vwc1VYalRuV0NT?=
 =?utf-8?B?QStJY054MW85UDhoRzZxdkpXS3ByV25BWVgzTFpxdjdkaWczY3M5bnUxVXUw?=
 =?utf-8?B?S3hEK0xFM2F3cytjUWp0cjNQZktQOWFIa01LQUs5blFrRCsvL1FDTStnQjFm?=
 =?utf-8?B?cHNoVG1jbyt4dGRiNUVHUnhtT05sMVJ0MGJBQ0MzNktBWkdGNklKaGVDQzd4?=
 =?utf-8?B?b0ZReG5ENjErSCtFMlVydk8yT0xHcnZ1K3k1dmxYeXFhSVVUZFNySmRuV3Rj?=
 =?utf-8?B?Y21IMUpyRlBwZ25LQ01TQ2VTY1FlUkhXWDRrT2JXYWJHeTJTMHdYaVNDV20x?=
 =?utf-8?B?ZnR2WWoxZmluWUwraHpPaVg4ZFRKL1BJa1hBOXhuVWRrNlo2NWR0RXBKaHVY?=
 =?utf-8?B?NncraUFsdzhmVlVFeXR6VXArWVNHRWtUR3ZpYXpwRlVwU0ZCNUUyTWNYNjFJ?=
 =?utf-8?B?UU9pc2pPS3o2MUl2L3BXOXpXa2VERndReDdiVGFGZE9JR2VzelhKRXcxeTRZ?=
 =?utf-8?B?SXAybGtmNWhNWmVXQXU0MjVhSHFsdldQK0NXVzhqR21nUllYMWhhV0JKdHpw?=
 =?utf-8?B?VEllT1hVSXM4UUpZN0h0QVVBSTZkcDJTcG1ZM1N5VnhmRjlJVjhHc2p6MFMz?=
 =?utf-8?B?M28vWXNwN3FOVGdzUEl6TE4zK2dhR2xqdjlyRXArczFuYjBxSXdYK3VJdmFL?=
 =?utf-8?B?YzZVWjJpWEl2U3FCb0xOZ3V1ZEQwQXNOTCt6ejNNRzJOdGxGMFBOOXRvSmZv?=
 =?utf-8?B?UzNXb01HdVpJODMxTHlTMjIreVl5aVdHeVRaVllyUy9FVkZDUHp1ZkJIVGpK?=
 =?utf-8?B?WEpDcTNFSVZLb0ExWVkyUDVYczBZYy9HSHJ0Vzcrd1hqL0ltY2pJR0UwdWtM?=
 =?utf-8?B?OTZ3TmpLRzZFanhQa0cxYXJTR3U4STdwNTV0V2NuZ1FXZS9VdXBEYW9VZE1E?=
 =?utf-8?B?TFNxYTdBeXhnZ0xjSy8xVy95dlYxbEQwclBkaEpPRlJ5UEFtOTdmN2hWd0kr?=
 =?utf-8?B?WStmWWVNa0ZuZWl1ZlE5NFY2QmV4YkczdEwrUnRGWUh5bklTLzMrL3dkbEJo?=
 =?utf-8?B?cmN6dUUzUjI0clRHaUlLTUlJWGxVZnFtS1pld1dhMEdxRkpsYjZvV1BoNHpk?=
 =?utf-8?B?MnZQKzlWYmltdEhDY1YwNjI1Ym5Zc29za0dlTDUxcUNWR3VYK2VQK0hnbHlR?=
 =?utf-8?B?RjlDc3h0U1JGdGxxcksyc2pEcFJPR3RMVmhxbXJvNmtrbjlFNEtmV21zaWUw?=
 =?utf-8?B?ajI4S3NRMUZvenNBTzBpRm1XZTlubzJSR2g0M29aVldVNVk4UzdLUXJ5TCtw?=
 =?utf-8?B?YXF3UGoyUTFwQndJTTJVOHp1bnVSTGF3NFFHUkFSU1hvMmhvdXNvQUgvbzAv?=
 =?utf-8?B?M2RKUjNLdE5VbktOTlN5d1FOcmpTRmtEQnlNbCtkVUxVK1Noc3RSMjNUNVlV?=
 =?utf-8?B?eXc1eUkyZnZ3Y2hHeUNldk92YVR3LzVHQnkwR3prNTczN3JmdE9vWGxaUG93?=
 =?utf-8?B?MklqVjJ6ajhzWW0zNUs5MkV5cFZIM21TWmhUaTVYZEFkazlNVGVLSmJkdzZ6?=
 =?utf-8?B?bWxuNGl0Y2JhV0hEcEV4NWZsbVpIRHc0RzBPTzZocFR6eHUxMU1wam5oa2FX?=
 =?utf-8?B?K1dFN2p3eTlmZmxEbGgzWTVlRFNmSXNDcU96aDIyb0k2ekVxUWloY3d4MGNm?=
 =?utf-8?Q?YZnjj8vxNJTam1HY=3D?=
X-Exchange-RoutingPolicyChecked: ogi/uMBAscPhss4rvLNumkdTPY8DL9aeOEM/VWL73Is4Yp43AEkyisOb0gcXL9SsS9PfNukSNrsJ+GTPghSBE+z7aBcwc8IdfdBRfZ6zbZ3agmbmQ870a1z71qnbrazDkzxnBfCiZyfq3rgHy6wAznw3oDz6N6JV/hykPvdvO7l4Nhyb53GLqvxL+TWnEvLiLrGGBKE/AeTAMuR/N29fj/ZPz43eSQT8XAQXckZUDNwv2goKqI2PsfAcl7OuevM+0/Ts2vIw5aD8jhlhZ5FsRCFJAJj4o66hBbay0rSkl1AFIq6xinxpGM2Khj4k96tIRgMY9jCHNS3vostkes+1mA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 85380632-2969-4f68-9181-08deaaa8e815
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 13:19:16.0304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aoGgwM8c3TrKv3rDqJj+EUCVdukcEfeg7gXcUBp6YLJjunz13rZ/oP8oMpFbDFoPceidR4659cH+OrlTwbT8Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9154
X-OriginatorOrg: intel.com

On 05/05/2026 10:13, Manikandan Muralidharan wrote:
> Add support for microchip sama7d65 SoC I3C HCI master only IP
> with additional clock support to enable bulk clock acquisition
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

One minor cosmetic comment below, nevertheless:

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
> Changes in v5:
> - Remove HCI_QUIRK_CLK_SUPPORT quirk and call
> devm_clk_bulk_get_all_enabled unconditionally
> 
> Changes in v4:
> - Remove the clock index variable MCHP_I3C_CLK_IDX
> 
> Changes in v3:
> - Make use of existing HCI_QUIRK_* code base
> - Introduce HCI_QUIRK_CLK_SUPPORT to handle/enable the required Peripheral
> and system generic clk in bulk
> 
> Changes in v2:
> - Platform specific changes are integrated in the existing mipi-i3c-hci
> driver by introducing separate MCHP_HCI_QUIRK_* quirks and vendor
> specific quirk files
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index b781dbed2165..20d32a9eb62c 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -8,6 +8,7 @@
>   */
>  
>  #include <linux/bitfield.h>
> +#include <linux/clk.h>
>  #include <linux/device.h>
>  #include <linux/errno.h>
>  #include <linux/i3c/master.h>
> @@ -970,6 +971,7 @@ static int i3c_hci_probe(struct platform_device *pdev)
>  {
>  	const struct mipi_i3c_hci_platform_data *pdata = pdev->dev.platform_data;
>  	struct i3c_hci *hci;
> +	struct clk_bulk_data *clks;

If you roll a new version of this patch, prefer to arrange local variable
definitions in descending order of line length e.g.

  	const struct mipi_i3c_hci_platform_data *pdata = pdev->dev.platform_data;
	struct clk_bulk_data *clks;
  	struct i3c_hci *hci;

>  	int irq, ret;
>  
>  	hci = devm_kzalloc(&pdev->dev, sizeof(*hci), GFP_KERNEL);
> @@ -1001,6 +1003,11 @@ static int i3c_hci_probe(struct platform_device *pdev)
>  	if (!hci->quirks && platform_get_device_id(pdev))
>  		hci->quirks = platform_get_device_id(pdev)->driver_data;
>  
> +	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &clks);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to get clocks\n");
> +
>  	ret = i3c_hci_init(hci);
>  	if (ret)
>  		return ret;
> @@ -1031,6 +1038,9 @@ static void i3c_hci_remove(struct platform_device *pdev)
>  
>  static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
>  	{ .compatible = "mipi-i3c-hci", },
> +	{ .compatible = "microchip,sama7d65-i3c-hci",
> +	  .data = (void *)(HCI_QUIRK_PIO_MODE | HCI_QUIRK_OD_PP_TIMING |
> +			   HCI_QUIRK_RESP_BUF_THLD) },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, i3c_hci_of_match);

