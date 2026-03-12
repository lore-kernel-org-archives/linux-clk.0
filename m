Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF103BE629;
	Thu, 12 Mar 2026 09:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773307782; cv=fail; b=kBKjq9nZ6tMi3wBbkgTQbN6O42UF0yX+romYdaj8CqhqBdfjDN7/O6y1Pm/BNwMvmf7Bnyi+TsNgxanNsVOdy/3k+Z5sm1DwUW41k9Cjd/KDhEpef+gU5GHHZtGdj0RsBJrc9cVINt6cfii+36MT3y4JDgwoDlX+mlQbNEY1MH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773307782; c=relaxed/simple;
	bh=ZCHQFh5O+8sPr7K+jLNQWXnEfxJAK3V/dHBt/anCj6M=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rKO51V4tqXS0aqk3z+4BvxiG3gAfTLbDp86g1XNXHBBI0Yt0MW6ik/DemeSnS3J/0lwDt9lBjUkI3wmmh7kOrPEAXUk/cr8s0Hjoh5j/SoMMzy236/Hg+8fzlXUc/O59iSfs8/HXrbdaNUIXIBwwxtluaSe8Etaa/FJl1ve4vrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ueq7Ejhe; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ueq7Ejhe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773307780; x=1804843780;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ZCHQFh5O+8sPr7K+jLNQWXnEfxJAK3V/dHBt/anCj6M=;
  b=Ueq7Ejhee/uT3wBmVa2P+qsg+fTYmTgws9jqsHiQ8jgG4Z2GJ8bV++Ks
   CHAxkE0+eH6z5LH/dGVSg33aVvkLvgbWRjWiMd5aoQJJDX++Wr/rpY0jG
   lpWmKnq2K/Dd7ooTncJHNil+c7pqJTgrqCEzXFp5tT21eoZaSWlkQhNAb
   /iC5tIchclX9xm5CEoMetT417TcnwU0hLlZLhU1ZnjwhQdiEB3te/Yxlw
   z+M8Iv4VF1BjsjKpPx+Ei3uwprnbz9G4slb4C6PdVLdtTAeyR2CZVMc++
   4ro0+C56ypV+5ubvOdksqFp6F8y7Aegzbm8+1SC6WzmtnfVNn6cQlpfPC
   A==;
X-CSE-ConnectionGUID: cGCPrnTSRDS3tQsUo60Ekw==
X-CSE-MsgGUID: A//wKpt9RBSSyFfWC66H3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="91963760"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="91963760"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 02:29:39 -0700
X-CSE-ConnectionGUID: 2ruhvwJSRx+HjCgFZjg3ew==
X-CSE-MsgGUID: EaboEkwzTbe1+cfNKQSYyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="224908389"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 02:29:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 02:29:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 02:29:36 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.48)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 02:29:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFJurOr2bhSTUPAqyBBd7nX63ujG4jbZNesAEVZj3zu9sU1QKbNQ0XBHKCi6pFsuUmc3ni+FODuwunrLlYsrwssKuwzFlJEpq8RopHaZ25mWmTaToeILykUksa15xwWpViNbrcxrMsbLOzbVtmi17xwHEPDrNB6C2rZ925yHy6bzmUPajaM74pKPmbHKMJIei1Z3g7HDKwfiPgc4VJg+jAEnEIZCK66g1i7bAc1mvrarXKxCACcFlKo4GPuaIuoqq94O2mIIBrqtsYrVX0hIjqwmsCOA/2/MrTVzfvV5jB/RmXYyrP6iCN5R/05SquXaJ8biAVUy6XHvLNzlICJR5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbN3p00zTnbIdBvU9E9fKU/3C3PjYne108v8XGFniB0=;
 b=YNRv7cpEbG5V0vZBI3xSvIbkeanTfcJGM1xlNgBX+StA2IPuZwE6zPkf+1Eqm23UETmmmpbgIr2rXZjJIk+6qVCEF+H+I6m9nuZ9VglcnuZNQFHWKvdwnaM0U4K8aQ04znhvQ6ygXc6bXVzYuREpxprO+Y919e2jzEcrlKitZrsciZHFHiTNnwhWp2wNescTJdUZTitdxZsGEEbIfZeoyQtwK8U/sqHQoKjdImzjw2XCstCcRVbfbvY1eL6TY2JpX5Lz9Sy9pI821zkDTFo8f9tfAURgkvQbfi9I90sAjmlfBgnOYmN26bhCvjYqKoZw94kkGz53uSKiI1SxW0ncBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CY8PR11MB7108.namprd11.prod.outlook.com (2603:10b6:930:50::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Thu, 12 Mar
 2026 09:29:33 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 09:29:33 +0000
Message-ID: <a41378a0-d2f1-4fa4-ac6d-1d0916590b47@intel.com>
Date: Thu, 12 Mar 2026 11:29:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] i3c: mipi-i3c-hci: add microchip sama7d65 SoC
 compatible with the appropriate quirk
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
	<alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <ardb@kernel.org>,
	<ebiggers@google.com>, <martin.petersen@oracle.com>, <tytso@mit.edu>,
	<cristian.birsan@microchip.com>, <jarkko.nikula@linux.intel.com>,
	<kees@kernel.org>, <npitre@baylibre.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
References: <20260312042056.309237-1-manikandan.m@microchip.com>
 <20260312042056.309237-4-manikandan.m@microchip.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260312042056.309237-4-manikandan.m@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7P189CA0025.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::32) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CY8PR11MB7108:EE_
X-MS-Office365-Filtering-Correlation-Id: 35df1209-c3aa-4b14-ff76-08de8019de96
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007|18002099003|18082099003|18092099006|22082099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info: I0+pXA0VcfiPXIcwtNterRCEXRyPQRdiP8bNWDQqMhAOViwZJVl1thKDP5p1oOdNx4jv/DqtEAWaqn9AmjYwehKsg2JxbX6ki7P1azUN1jzEvH6y2T5zAAq/KQctlcAOsj3NnYhQOJr/hpQ8NBv0LL3sJhUwJs9QDk7vpHN1MNv1shS9d9JvolCZ4lrTiSmStgGJWM8LnNloB109a4gEwV5Weg5JUyZsHxlx5f0fellmoyY/WZ64PbaImts3emGgjKqzc4KeR2VYfPbiBtGq3EujPkX+4PHzxdQhCwUP5fY9N/osqs5D8wXOIi8POMaRWaRd9K96Y9pp+WBp5t6TzMgndZM6DCTvr+q0HQ1XkvloU9CSiWO7aVBrZiGkgeKyCc1+FohawWMVCgiHyLeAnao6tnzIcly5C+Qt7sY0ZOD9dgjqdrVXDKIj0RbuNIDmCfFrdj/g8cBYgSIlRGiM7u4MOO2u5oszpcbmSMTHULN84k3FEVLHkSl4gDvNQhkiRkl5wZQ9NxWSgvQbG57sduqco5NctsyuzyjULG5iRHOHP3gY89Q8BUV2o6Y+VtxG72KgkrQtkhsQmG/nmAPOICgPNIntXWyIujGJiwZwwb4QEjbqpPCwVuWEek2wJm1HY0PoZwla/iJL4kt7R+w3jyahXpG4ToXnVQCZCIjgelAhxhgmS589kzmNYG/zF8fvstvoCiOnxOHUkxPR/cXAAjSYd230kXvyyIR7ovXeypDcCPvRikWgd0q1Qu9a2jlUquYd0s9tQwiRLtCcrOmjsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007)(18002099003)(18082099003)(18092099006)(22082099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mm94ZzhrTjdPN3ptRzF5V1JxQnpzUlQvUkdWY0d4ZUF3S0s1ZmRsS0VNNTUx?=
 =?utf-8?B?aEh5Z3FoMzhXbFZUMHNTV3hzcUhrdDlWOTZQdWpoMFJrZjk5aERpNGp1RSt5?=
 =?utf-8?B?SUhZVnliYTlsOE5iZyt4ajQyM3Y5VFh3akFHM2FqdkJxUFA4VkE2K2hkVkxL?=
 =?utf-8?B?L2NTTnVqSEtySjU4d3c3dVNJdklOd0xkZUNXamt6eCszUFZCcmJPZVpLZ1Z1?=
 =?utf-8?B?VVc3KzdoSUZFeHd1Z20yaHZTY1FDWHNEb3lTc3NPTHhycC9jNmY3SHBIM3Jm?=
 =?utf-8?B?L3o4R044ZUpHdEdPNVo3eGNiZjVWMFFYUnIrVUpwbzJjTUZoRlJzc052Z0lQ?=
 =?utf-8?B?cmVzNkJESllta2RJbHBiWHNhUHYrcHVYdGlBc291Q2t2OStkZ3FJOEgxVC83?=
 =?utf-8?B?Njk5UGRCNGgrMVJFWm96R2J4K2JnU1MwbzlsenNoWi9xN2kxUnV0TWJmQnlq?=
 =?utf-8?B?SG9aWEhGM3JwRlJQcys4THhrSzFhSE9PQm50OG9TSVlrYTJmdVNEZzhYTVFO?=
 =?utf-8?B?TFkwVnl0cDRKeG9FNEZoVzRkMnRiTmRTcU1LWlN6MmxDUjlacVY5cEVEZW5K?=
 =?utf-8?B?UjlqZjF4RnRRUXY3ejhoWG1nbkpwRmkzMnRPUzdhd2pIRDRZWG1QMDRxeDdE?=
 =?utf-8?B?ck14d1VzN1NVdXlOeGZKaElseTdVYXNEVDhOUU9pSTlXeDZjbGtIM2R4Z0hV?=
 =?utf-8?B?VGJOQmRPZGEvbGZXRGpUaVdIRXg0eTJ5SmRMR2hMSFBKcENTV0Z4WHhZaEhB?=
 =?utf-8?B?SlQrd3pQaGdMUmhxU3JvZWMyeDYyU0VnM1BFRDlPMGlqenpvVlhzUXpNUFBu?=
 =?utf-8?B?TVhsT0ViNGY4UlFyWnhJUVdxbVJGS1dTZVN0ZEg5R2N1VWg0eFczak80b0Nm?=
 =?utf-8?B?ZHhqTVhwUXdqNXlJeWxYbXoxclZKUzhURU0vby9LalpxR0lmMUhZYnhKdUNX?=
 =?utf-8?B?WWZuc3Z4MFJZdk1sZTUralI1emNNQ2R4ekRVcXRYYWsvcTNmOUpQNVdMVkE0?=
 =?utf-8?B?NUt6anVSbXg2REJ4SWFnL1lnalZxUjJkMm01cG9WQjJIeEs1cG4rQVQzb2ww?=
 =?utf-8?B?T2JBUXdHNjR5cEFpUXF1ZDBHNWVxYWpDRXJIZ1U0RU9vWmg0T3VpV0NrcHpO?=
 =?utf-8?B?bjJoLzZVZWNzRDBhL3RPa3RvcWFwcWIvQU51WGVnNmNjVXNZRmQxazM5Y1FM?=
 =?utf-8?B?ZmlJUHNCR1R5UmVEU3JQbzl4aFR4NUFVbDdJNllnRmhaMktlUWlFM05UbzB5?=
 =?utf-8?B?SEM3RFd1djYrTWFia0ZVOEZ5WWxWdTY4NTZmaHlnVm0rUjU2dDRld3Z3Z1pN?=
 =?utf-8?B?cjlFbGoyUGxXd2FkSVlPWE9UU2lncEx3eFZ5QndYcFI2TFBxZzBLZjFmT3Zr?=
 =?utf-8?B?aFJvZnZhc3BISmxyQ0FxbThqRGwvdTBUcFl3bFZRNEd2b1NjZmMycVo0VDVB?=
 =?utf-8?B?dGNJU2ZQTjVRN0M4QjFlajcvM2pyUS8vS2ZnK3U1WlFKSEhSZFd2Skptc2tF?=
 =?utf-8?B?SHAvalhOVVhERnpSbXU2QjhJUUhuSE9sU3BJcDUzblU1dERHR3dxT2MxalVs?=
 =?utf-8?B?bkRweXNtenpwR3ZEVlJiZi9KeFRabE1taVVFWHRCTlplSFdXd2VCTTRFam9i?=
 =?utf-8?B?QktHV29lSWtRZmY0NFlNVzh6cmRqclhpb2VHcytSeDhxd0Z1NnBqYVhPTXJ6?=
 =?utf-8?B?dWhPTXBGejBSVnMzcG5lVHlrZ0R5aEc4ZTBuSjJPUGxXRnZXNXFXS2RldkxI?=
 =?utf-8?B?VWc2UzYrMGtmb1N6WUsxNUd6c1lta3d0QjdYSTVadDJicGhUbTBnZmcwY3hh?=
 =?utf-8?B?ZXdqOVg5TmVTYlpHbnBhcFRuNC9hYkw1UnluNHRSdHVNWDR6NmhnYkcwV3c2?=
 =?utf-8?B?ZUY0OFU0dldOT0ovVlVqTmgrSW1jR05odWx5dU9VdkJhb29qVUplZ1pVVk80?=
 =?utf-8?B?N0NFZ0djR1BFUFBGNnFkay83ZXBxNkxkQ29KVjJhVk9XTmZ6VGUrRElQcnRq?=
 =?utf-8?B?SmdZVGNZSVZyNnR5YUlpcjVMYldNNFY4b1cxQTA4cnZqbGVSQ0EwUGdGVWRH?=
 =?utf-8?B?d0piTGF1VlRFeHFCZWw5ZkFVOGN6dGF0emFhV3c0RlhOT3QwUWV0dk9nRldC?=
 =?utf-8?B?VkwyUVlvNEZmZGZVMmhBOUlxbmZTMzdzNXZ6V3lhajNpWDNSMEhaa05NMHRL?=
 =?utf-8?B?NjFkQTZYVHViS3dsVmQ4aHR5bVR4NTBRdFY4aU9PUjkvcmptYVAzN0tMZjAr?=
 =?utf-8?B?VGdXdVJhUkx1R1FtMERxdFNjTStXZUJFdnc5dEZ3MTNIaUVtVTF5MzQzdU9s?=
 =?utf-8?B?ODl6VURCOGlDZVZveUlYVU9qZnBlbVlob0xWR3Z1TUErdFoyck5GdWhaWWJK?=
 =?utf-8?Q?U/kxqPE/VvcKlw44=3D?=
X-Exchange-RoutingPolicyChecked: DTt2vIlyglQ96SV0V/HdLACYqJDfqJCBe1s5GW6Bp1eoQ7Yc48jZrjaJeKVLg2z3MGTI2VGcTCr6i2z4FhvZBVLQLWs0Gy6y5/CiTAepOBDQGT1Z1eaQwQtEJKVbd6F+ZG+ip/rNdRAuiXORoZwHNBycfBq2e76ZhNsj6VWr05lzUAK4tvt0gAY8X5kNjeZvxLbCCG/yHBDl/96bqm+QdfDH7LHKqSfiD1glRaOnZj0xZZQRF6IKdqhUx8xujomQ26ZnmEykRKPW0j0lIAjmVHLdaPCISSBsO+5bgHUEWpvob0GFTl220iZaC0BNFSZt9fiZdX2W0W+kwBvONB6dtQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 35df1209-c3aa-4b14-ff76-08de8019de96
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 09:29:33.3408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZbU5WmpqvQPQYh3pUxwqUDSuE6gnbTn3lJYpVgLWz45LUboSGZ9wdB4+ZzMkoWvXi37Mt7legwxwfo91/KTIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7108
X-OriginatorOrg: intel.com

On 12/03/2026 06:20, Manikandan Muralidharan wrote:
> Add support for microchip sama7d65 SoC I3C HCI master only IP
> with additional clock support to enable bulk clock acquisition
> for Microchip platforms using HCI_QUIRK_CLK_SUPPORT quirk.
> Introduce MCHP_I3C_CLK_IDX to define the maximum peripheral
> clock index
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
> Changes in v3:
> - Make use of existing HCI_QUIRK_* code base
> - Introduce HCI_QUIRK_CLK_SUPPORT to handle/enable the required Peripheral
> and system generic clk in bulk
> 
> Changes in v2:
> - Platform specific changes are integrated in the existing mipi-i3c-hci
> driver by introducing separate MCHP_HCI_QUIRK_* quirks and vendor
> specific quirk files
> 
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 12 ++++++++++++
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  4 ++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 5879bba78164..6b7716bd517e 100644
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
> @@ -918,6 +919,7 @@ static int i3c_hci_probe(struct platform_device *pdev)
>  {
>  	const struct mipi_i3c_hci_platform_data *pdata = pdev->dev.platform_data;
>  	struct i3c_hci *hci;
> +	struct clk_bulk_data *clks;
>  	int irq, ret;
>  
>  	hci = devm_kzalloc(&pdev->dev, sizeof(*hci), GFP_KERNEL);
> @@ -946,6 +948,13 @@ static int i3c_hci_probe(struct platform_device *pdev)
>  	if (!hci->quirks && platform_get_device_id(pdev))
>  		hci->quirks = platform_get_device_id(pdev)->driver_data;
>  
> +	if (hci->quirks & HCI_QUIRK_CLK_SUPPORT) {
> +		ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &clks);
> +		if (ret < MCHP_I3C_CLK_IDX)

Is MCHP_I3C_CLK_IDX really needed?  Why not just:

		if (ret <= 0)

i.e. don't you anyway have to assume DT has the clocks defined
correctly.

> +			return dev_err_probe(&pdev->dev, ret,
> +					     "Failed to get clocks\n");
> +	}
> +
>  	ret = i3c_hci_init(hci);
>  	if (ret)
>  		return ret;
> @@ -971,6 +980,9 @@ static void i3c_hci_remove(struct platform_device *pdev)
>  
>  static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
>  	{ .compatible = "mipi-i3c-hci", },
> +	{ .compatible = "microchip,sama7d65-i3c-hci",
> +	  .data = (void *)(HCI_QUIRK_PIO_MODE | HCI_QUIRK_OD_PP_TIMING |
> +			   HCI_QUIRK_RESP_BUF_THLD | HCI_QUIRK_CLK_SUPPORT) },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index 337b7ab1cb06..2571ef6374ce 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -140,12 +140,16 @@ struct i3c_hci_dev_data {
>  	void *ibi_data;
>  };
>  
> +#define MCHP_I3C_CLK_IDX		2 /* Max peripheral clock index for Microchip platforms */
> +
>  /* list of quirks */
>  #define HCI_QUIRK_RAW_CCC	BIT(1)	/* CCC framing must be explicit */
>  #define HCI_QUIRK_PIO_MODE	BIT(2)  /* Set PIO mode for AMD platforms */
>  #define HCI_QUIRK_OD_PP_TIMING		BIT(3)  /* Set OD and PP timings for AMD platforms */
>  #define HCI_QUIRK_RESP_BUF_THLD		BIT(4)  /* Set resp buf thld to 0 for AMD platforms */
>  #define HCI_QUIRK_RPM_ALLOWED		BIT(5)  /* Runtime PM allowed */
> +#define HCI_QUIRK_CLK_SUPPORT		BIT(6)  /* Enable Clocks for Microchip platforms*/

Without MCHP_I3C_CLK_IDX this becomes a generic quirk that others can use

> +
>  
>  /* global functions */
>  void mipi_i3c_hci_resume(struct i3c_hci *hci);

