Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD0B49AA52
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 21:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789679206; cv=fail; b=pZ5CMFJUtjC8gjPc/LwC64DGCj4MGoSm20enBkP/NlLwoyVaxNOIQ0jhB8BYhuOcGlKkRAFolBbrC2Wzf5CJ7/gPVkHB2MC7dFh2VU4UAQSn/DrTtDQe6JcdeVzF3ZdYEADl1auroDbDJD+d7hxANaVD/qiSAUkuU8R/szSfKtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789679206; c=relaxed/simple;
	bh=MKFpi7jZFH5WZXXK9pIZRFLwVGkbpKQWTEgzLylniMk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HIMgKAJzf55RSKX6DX+wswIj1NwMX7ZGiPSQuqpkKx6/2ebfXKSt3fGRwRp+xZrP2NSqzoJ9tKJbNgnVGZcM7fvz+phKtlQ+wEit6I6nEZYYk5DSZN8Oih50TA0B2nVKpp3K/d2zSVaHzErAWJn6kobscKEGnfzhz6rnRlDSh6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ee0cMB3d; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ee0cMB3d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789679204; x=1821215204;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=MKFpi7jZFH5WZXXK9pIZRFLwVGkbpKQWTEgzLylniMk=;
  b=Ee0cMB3dlLs9TlcxQ7v5KfxKAhl6G7VuwvRrAJxY5p25Jl1GfJH4KRVY
   QlursukW8MQ/LnEgGeRYyQ9oPVn5XU/knvVBfHtfzurhzJWVetVDhR0Fk
   MTB10xW4J5RV2sagVxwvXMh2ablQ8wckLR0yBiPyhqCVoOGGuZYJJR21w
   Ge+Bfy7bfAL+DAT1fMwerfQNA8J3Eyx/KpcSOGXvhoX/WGBl9PJjx6laV
   Je/NuRisewGQxk0UvqWvrl0v432XRMY46lWJJGu3orkr6UXABbe8NFnEX
   86A4BVeQo7G5V4rI2g1jFQk17XBJoYKtSFT5oiItWpybSW8vfT4elHIBm
   g==;
X-CSE-ConnectionGUID: fX1OmThwQq+jJExhoVN8oA==
X-CSE-MsgGUID: kaMXXf13QSC+MXCNMzwRbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100808270"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100808270"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 14:06:43 -0700
X-CSE-ConnectionGUID: tNKOtXrZRQi3v8lqndJhRw==
X-CSE-MsgGUID: t97k9FLlSUGCZ7Neqqa7Pw==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 14:06:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 14:06:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 14:06:42 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 14:06:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wa07HNJTtZpThYekcFse1rQ1OsZlLir/FklLyjR/O8dpAM1xUHuWPPIqqY2q8iK0DKQ3LKPbOwTzIuTYmGcS13LVPe8lNhYiFZdKJXy4tFsgCxlnAVsoZxkY32kpUfAUgAoOw5jHjLVvTG2AadQUfqLH4Mxp7+kmOfmdS7aeAi1BUuirx+DeMhSIcqL4HSsM7yS9+hY6E0ay56s2UZwBETsD4iJLzRg7MAEKuif950a9NW0jq12zS6SThv4lybAqefIAIByyw3FDV/eEghFNfTB7B8c9+40EpSKKjvUT3x/p/sCMwBplAz4WDtNM3gxLwBEwKj9PG27RBqbAzP8h3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKFpi7jZFH5WZXXK9pIZRFLwVGkbpKQWTEgzLylniMk=;
 b=F8pf0fVSEGrHP5+Avt0lKEf29Hzjg2ZzCTAggpUDzKbuM7JC3xX6JCgLXXFiDXg+b7W8QKY+0OMbRA6x0nBYxBzL5FFTUiHAlYSb/E8M9ElCUK+8q6GnfqewAnPeOn4Ic2cJAlvTglpq0mTjEetbxtd37AcZa8d2kdnJxlkblwvTZ7IEIHKq25o90Vz0yJ7BExjDNUO9nequnUoEDHLjhHRjhT1M/m0dlArJC2ubNYzsFvuUVbayJ8JjWjDCTVAwnePJ9PANmCPrEka+O9PBYVNyIAkahy/q/cQ/UVgAsUW145f6KLaz0pJ5lLtyPdk65R4lxeFA6lMMblZ3YBzMKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by SA1PR11MB5876.namprd11.prod.outlook.com (2603:10b6:806:22a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 21:06:37 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2%3]) with mapi id 15.21.0406.007; Thu, 17 Sep 2026
 21:06:37 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "billy_tsai@aspeedtech.com" <billy_tsai@aspeedtech.com>, "Chen, Ryan"
	<ryan_chen@aspeedtech.com>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>
Subject: Re: [PATCH] peci: controller: aspeed: Make sure clk_init_data is
 fully initialized
Thread-Topic: [PATCH] peci: controller: aspeed: Make sure clk_init_data is
 fully initialized
Thread-Index: AQHdMVUDcYMwDXGNpESL4BPJAwCIALbTbiuA
Date: Thu, 17 Sep 2026 21:06:36 +0000
Message-ID: <6e8f040fd0c44abe8c4b91e0710b66c68e252d7d.camel@intel.com>
References: <48aa77c45e109f78ccd806bc3b7bf380c5bc5e71.1787240145.git.geert+renesas@glider.be>
In-Reply-To: <48aa77c45e109f78ccd806bc3b7bf380c5bc5e71.1787240145.git.geert+renesas@glider.be>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.60.2 (3.60.2-1.fc44) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|SA1PR11MB5876:EE_
x-ms-office365-filtering-correlation-id: c7aacf23-6af7-4235-e447-08df14ff8faf
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|18002099003|22082099003|6133799003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info: TIB0BGdWa3PkVpYUBMyQHg9zskeCuAeb5/V75703Fi0VTutztGSivmmsaQiKsSxqiY5DbnJVvpPy9eBP72jhdhuHmnR/YV61ihb26KDSLiiNQvAEli7kaaCAxv6BJCnpjfDOnT5LZKQV2TV/e/+JkFLCYtI4NMs68ORQ/c4EX9gPyFchqIVHyilVkPmWj84KHqMQ0pMydmkhGASHAeejCVCB80/10LOOCHyV3lrusfebsQLa/SrotoAxfHumY8sfiQdgfymweEaj3lcy4mbNKj/m5mPqHr2oihoKMDZZS1zL8IdaLGn1c5Xl1KCndZQLXAX54BYBdhXJ/u1ujk7Nu/5DG3VRJxSPgATJZD/o6L5RdGRUW4wtPrkGQqZRi3DRHH0F4SO1XTyqAaNm3pkd+k2vD8QAJP+Y30WVdB2+V9K9l+5va3o3+//hhFm76iBWXfAVxfZxhYVVSlHxV7Y4sPsIEqcvVKVWNeR/JFP1FAOC6qGXU5Nre5A8sc4jx5iMtsGCrkyElnM5qJ9nF80SeShTG7UHZSZh2Q64rZH0fFCrQz2UQYLhOgmezMQJ7kZNXuZCQzN+L/dsKK5Z6Xrg3j+K/UObiDjVPQ2KTy/VYU3ggVLEtVo2HcdvFM574yt3ifu1GiPIH4ZfdUejd80Eqkls7/+N3wFL0XvMe+O+iA4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXE2RkhVM2g2SkFuQU0wUnBmV3VveXkvVVhsYS84LzdIM1lDQXZpWlJWblZJ?=
 =?utf-8?B?Ui9PUzVWWUxFWHVOYk5QWFc5TzcwenBkZUlyT2dXSXBDTUc5WXVrZTRRVGNF?=
 =?utf-8?B?Nkg3TjdLZFpET0c5amdIWVZVQUl4RE9Uc3YwSmtsSHlNRTNVeXJkUDB3Q3Zx?=
 =?utf-8?B?OE5RUmh0cWcyR0FKRG1GelRRYTROTjFCUzMwZ1BkTHk1dkU2cENyUnRJTVVu?=
 =?utf-8?B?UFBBRXRqby81elRHeWpzeC8vK3h4a0NUWm90dk5VZFQrRTVxNStNUmtrdGd5?=
 =?utf-8?B?WGpKTHpkeXVKWWhURThiV0Z3SkZGY21rZGJSVEhISDU2NWNQenc4QnF1SWd2?=
 =?utf-8?B?Ujh3SXR1a045Z0FKbVdLNHdpYTlWTy95eWRSczB4dEQwZWVVNExCcHVJZVBC?=
 =?utf-8?B?NGNTOGNGTXloNS92Wi9IcnBYMTBLM045NnVSQVRPelp4cnljemJWRUt4V2tL?=
 =?utf-8?B?QlFVcTZBZ2NGa1BObldObkoxOTNybmtndEpCTk5DcTMxOWJTVStTckFBM2FK?=
 =?utf-8?B?SWNSN0NuaUUyVGo5ZlJTcGpmUUtaaHdMMVVNRDZybE9Wem1oeFR5ZmlBalRo?=
 =?utf-8?B?UGJvR0VFemxIT2JGMHlhdHhFR3l1OHM1ckxWcEVzMFU0Qkxob21TY2JwT1Zm?=
 =?utf-8?B?UkFHRXpHTVVnR0RCQlMxVDVBbENMVlN6d3NEdHRuR081NDFVK3BZcmVlWEg1?=
 =?utf-8?B?eWxNdTczK1ZsbHFLSEQ1SkkrL2FYc1ZxQUFhQWZWeThUam52akJZenV3M0Y0?=
 =?utf-8?B?SmVXd0tiRjFSNFFNNXJFUkJ1RldQM1B3R0ZIZjU5dHBxZnJCMHJWVjlySzV2?=
 =?utf-8?B?VlQ4NG0vR013dW9SUmhRQlRTdlprOWFJYVFXN0xBM1ZIMU5YNDI3YmI1M0xY?=
 =?utf-8?B?UGppSEVNallBWC9kT09LR1ZER0VkMmlDcVNVa1NLK0FCYUZOb0tSY09VL2to?=
 =?utf-8?B?cll4SXBJN1h6UmNNbTJtVW9zaWR4by9IRUE2dFU5M1FYbVUwZVRMOFloY0ky?=
 =?utf-8?B?VGtPbGp4WnJyUk9WTCtaNWQ4eXVEQng1SVNsK1Z4YzhHekJFdWpCSVFUWXlm?=
 =?utf-8?B?MUR2ZWcxNzltbVhreEdHdjVWTGpYSlJlUnFFZlJJVTZtZjYyVWlMZ2dUbDBT?=
 =?utf-8?B?WHNIdi9kVnJCMVIyYy9ZcjFKcjN1VHo2aW4zUUxTZ2VIWWJSS1RjcFVmWFEv?=
 =?utf-8?B?R3MvV2JZR1pMTDYwaVBqTS9vM2p3cUVsZWtxSXRuTGU0ZVh6ejhnZHZxZ1Bv?=
 =?utf-8?B?SVcwOXhuVGM5TGI2WHZqbTJqQ0RHcG1FVFlkQjloNDlpUGRhMWZ0Ym1qZmZB?=
 =?utf-8?B?RTZOZCtGREZYdGtLWk5lMlJYUURrUVlEWHB1aGZrRjVoRVkzQ0swTlRlbWdr?=
 =?utf-8?B?VU5SVXQxSTVtSmpmMTI3MEVGZnV0dVZWbWFOY3NqdGtlSkU0OTN2NUpqdVRz?=
 =?utf-8?B?ZUh0RmRHVnZwQWxPSjdybDRZektUZktrMjFrWWRnc3NGSG15SUxKU2pFdDdq?=
 =?utf-8?B?R3J0bkVLazNiVHRLRDlMSldscWNiSnU4RUp6d0RNc29KcnZHV2ZsYjRIOHhn?=
 =?utf-8?B?Qk9MR1E5cHFwVTRsOUFMcG12VlBYWnV6N0h5MjhSelVjNktJRTFOSHB6NU56?=
 =?utf-8?B?U2VsNXhRaXp3UHZsYjRxa0xWVDVvdXd2c3gyWlpQNGhybmM4VzZVbU8xRnls?=
 =?utf-8?B?eEJ2QnBQb1dyc01mSTFZc3RsbnhIZ2t1MjlhMU5iR2RDMjNpcUJ2cXFOWlhL?=
 =?utf-8?B?M1BlNUdmY2dQUThjQTlUcmFmNk9sZDA2TGhzQ3QxaVl1eU14K0VETTVuSlVn?=
 =?utf-8?B?STgrdDg3blpEY2NYRDRFUXpzd2c2QklMMmdWR0NoSHBVdWUrdytaN21takJR?=
 =?utf-8?B?aUEwV3RkUmFEWG94bWNkYmM0dUJuM1RUNHEvaUNTRll4ZzdpelFKd0RsQkVU?=
 =?utf-8?B?NGhkWUlPWjk4MW5JT2Y2TEZCTUFCNVFPZjUza2pzZkhIdjlER1hzK1pBM09E?=
 =?utf-8?B?V2pjVyt4K05LYXgzcW1jSjg4N1d4L0poQkRHNkxPYUczWjI4N3I5UWRiT1lo?=
 =?utf-8?B?YTVORzRsQ1Y2cXhFYy9kako1S2dYaHp6SjgxMmxrckZWYUVHREZldHZkc0Nh?=
 =?utf-8?B?cXRmWjhHUXRRMUQ0M0FOaWN2TkR4Yy9HT1c3OERqM2VBSm1WRzk0SzFBaFhQ?=
 =?utf-8?B?ZWZRcjVBR3FvYkUzN2kzdjZ5SWZqQ3p3d0tSRTB6WDcvamhSOFZrelFUQ0J4?=
 =?utf-8?B?dDRaVkZIUldwTHBBYnVYdCtMbzNzSlM3OFpscnhESDVXNUQ5ZVlWNVQ2TERm?=
 =?utf-8?B?bEU5cGtxdHZpNDNISmFzd3g4U1Y2cWFLeWtqbERCd3c4L2hISE5vYkZ1Z0JF?=
 =?utf-8?Q?6gTw/ue/Q1dsjUQQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E01EAFC3865E744BE20E6B3431F220F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 0VN0t1RkAajj9+Ke7v31cDt/2xRNqVeS0Ta9ZeyE/GPE1+1KEbvLZR3Gs/spER9bspaw+hbez1uVZTG09cc4JVu2XLmvUg04h9HhQwPMQNVLiGqPrYhvYPtdVvsjvb6b7dOrSwIKA6IdDjc7Ako2l12b3uKCOVDwH+F6DQmOOoUgGRzCiFyRjupV54K/3Mx9RLuaYTTUzFBNHcz2z4iemkL+HcTEj8FIW+MHthQiK9Iw5ylB/hF3oAkShTFkTirZ3H+YmI3IDkOeeuz4YdYPSTy89QQigKDY7dmbxSfVJctbOV/IMSWikikRK5vca32ksjchLwaq2J0S6ajubI2gnA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7aacf23-6af7-4235-e447-08df14ff8faf
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 21:06:36.9749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DvDB+4SgZolFw/geqL5wNm7OfHUM6HFDOnkHp9t/VxBA+WPL1rAszunkeOv9eLA/zCHOCGX4jWU2azfvtRGnYzKzgHylbPeyOzzt1Hk6Iss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5876
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI2LTA4LTIxIGF0IDEyOjA4ICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+IFRoZSBjbGtfaW5pdF9kYXRhIHN0cnVjdHVyZSBjb250YWlucyBzZXZlcmFsIG11dHVh
bGx5LWV4Y2x1c2l2ZSBtZW1iZXJzDQo+IGZvciBkaWZmZXJlbnQgbWV0aG9kcyB0byBzcGVjaWZ5
IHRoZSBwb3NzaWJsZSBwYXJlbnRzIG9mIGEgY2xvY2ssDQo+IHByb21wdGluZyBkcml2ZXJzIHRv
IGluaXRpYWxpemUgb25seSB0aGUgbWVtYmVycyB0aGV5IG5lZWQuwqAgSG93ZXZlciwNCj4gbm90
IGluaXRpYWxpemluZyBhbGwgbWVtYmVycyBtYXkgY2F1c2Ugc3VidGxlIGlzc3Vlcywgd2hpY2gg
YXJlIG9ubHkNCj4gZXhwb3NlZCB3aGVuIENPTkZJR19JTklUX1NUQUNLX0FMTF9QQVRURVJOIG9y
IENPTkZJR19JTklUX1NUQUNLX05PTkUgaXMNCj4gZW5hYmxlZC4NCj4gDQo+IE1ha2Ugc3VyZSBh
bGwgbWVtYmVycyBhcmUgZnVsbHkgaW5pdGlhbGl6ZWQsIHRvIGF2b2lkIHN1Y2ggYnVncywgYW5k
IHRvDQo+IHByZXZlbnQgZnV0dXJlIGJyZWFrYWdlIHdoZW4gY29udmVydGluZyBkcml2ZXJzIHRv
IGEgZGlmZmVyZW50IG1ldGhvZA0KPiBmb3Igc3BlY2lmeWluZyB0aGUgcGFyZW50cy4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIu
YmU+DQoNClJldmlld2VkLWJ5OiBJd29uYSBXaW5pYXJza2EgPGl3b25hLndpbmlhcnNrYUBpbnRl
bC5jb20+DQoNClRoYW5rcw0KLUl3b25hDQoNCj4gLS0tDQo+IENvbXBpbGUtdGVzdGVkIG9ubHku
DQo+IA0KPiBQYXJ0IE9uZVsxXSBmaXhlZCBhbGwgY2FzZXMgdGhhdCBJIGlkZW50aWZpZWQgdG8g
YmUgcmVhbCBidWdzLCBpbg0KPiByZXNwb25zZSB0byBhIGNyYXNoIEkgc2F3IG9uIEJlYWdsZUJv
bmUgQmxhY2suDQo+IA0KPiBUaGlzIHBhdGNoIGlzIHRoZSBQRUNJIHN1YnBhcnQgb2YgUGFydCBU
d28sIHdoaWNoIGZpeGVzIHJlbWFpbmluZyBjYXNlcw0KPiB0aGF0IGFyZSBjdXJyZW50bHkgaGFy
bWxlc3MuwqAgVGhlc2UgYXJlIHN0aWxsIGZyYWdpbGUsIGFuZCBtYXkgY2F1c2UNCj4gZnV0dXJl
IGJyZWFrYWdlIHdoZW4gY29udmVydGluZyBkcml2ZXJzIHRvIGEgZGlmZmVyZW50IG1ldGhvZCBm
b3INCj4gc3BlY2lmeWluZyB0aGUgcGFyZW50cy4NCj4gDQo+IFsxXSAiW1BBVENIIHRyZWV3aWRl
IDAvNV0gY2xrOiBNYWtlIHN1cmUgY2xrX2luaXRfZGF0YSBpcyBmdWxseQ0KPiDCoMKgwqDCoCBp
bml0aWFsaXplZCAocGFydCAxKSINCj4gwqDCoMKgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Nv
dmVyLjE3ODcxNjUzMjkuZ2l0LmdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlDQo+IC0tLQ0KPiDCoGRy
aXZlcnMvcGVjaS9jb250cm9sbGVyL3BlY2ktYXNwZWVkLmMgfCAyICstDQo+IMKgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9wZWNpL2NvbnRyb2xsZXIvcGVjaS1hc3BlZWQuYw0KPiBiL2RyaXZlcnMvcGVjaS9j
b250cm9sbGVyL3BlY2ktYXNwZWVkLmMNCj4gaW5kZXggYTBjOTllY2Y3ZjM4MDVhMS4uMmY0ZWEw
ZTdkN2E3N2RiZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9wZWNpL2NvbnRyb2xsZXIvcGVjaS1h
c3BlZWQuYw0KPiArKysgYi9kcml2ZXJzL3BlY2kvY29udHJvbGxlci9wZWNpLWFzcGVlZC5jDQo+
IEBAIC00MTMsNyArNDEzLDcgQEAgc3RhdGljIHN0cnVjdCBjbGsNCj4gKmRldm1fYXNwZWVkX3Bl
Y2lfcmVnaXN0ZXJfY2xrX2RpdihzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdA0KPiDCoAkJCQkJ
CcKgwqDCoMKgIHN0cnVjdCBhc3BlZWRfcGVjaQ0KPiAqcHJpdikNCj4gwqB7DQo+IMKgCXN0cnVj
dCBjbGtfYXNwZWVkX3BlY2kgKnBlY2lfY2xrOw0KPiAtCXN0cnVjdCBjbGtfaW5pdF9kYXRhIGlu
aXQ7DQo+ICsJc3RydWN0IGNsa19pbml0X2RhdGEgaW5pdCA9IHt9Ow0KPiDCoAljb25zdCBjaGFy
ICpwYXJlbnRfbmFtZTsNCj4gwqAJY2hhciBuYW1lWzMyXTsNCj4gwqAJaW50IHJldDsNCg==
