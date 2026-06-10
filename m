Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C3F3ACEE9;
	Wed, 10 Jun 2026 09:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781084988; cv=fail; b=bWC1pq0cFolQr7BrRv/CLwcGIJhqPk4SaMF5DKwuakfcz+RdOqqjx0tfvLxFtoyV5s2QOw65tq5ofzctZpUwy/Du2H5Ou5PCbccfwLjZdRXAIRX8ssgU2rG+vosgKn05MK3N2FbNw1j77iXNB6nT/vksgwsbEmc/ELtIL5UMSPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781084988; c=relaxed/simple;
	bh=4O0Ji/FqtoRsmnSV4EZxBfGvkNEeUGwoW5AnuPHRvuw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sEohxuegn10PteGE0iPTDvGBLhcmsyZuGsoQ9SdgnG/VzqYsZadTsdjZen9AmEhOA1u6H+olbSD94Zb4A8yC9tz9wIb+rFqil8dOHDCnObhc36D7ferLbk1CQljTnycHetT+U3P3u+0Kbp8S3gE1GwKBhICpGnk32ym4SL+3Hiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=acMBUAkv; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="acMBUAkv"
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7jNm5363119;
	Wed, 10 Jun 2026 02:49:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=4O0Ji/FqtoRsmnSV4EZxBfGvkNEeUGwoW5AnuPHRvuw=; b=
	acMBUAkvw6ERPqepOp9my+UQ6Rzgrckq97MMlnL1CtWZJ5e0zyujWdr9tsUDMQ/t
	stSoFKyuf5JDTWUP2ufuubTsJTjLZdMkIPx8B5jiKWF9Ts5zLIHkJe8bhntu4BoX
	Or0ceNdFv3AKhcn1tR+/YGfVafwmTMYgNRzTIwlkYMcqD4tgkProRrx1+PFe7DVp
	S2imlnOU80GNUZlk67ZWqJA/0c6DmcMWk+Oe9lUiFqJXhN8WN1rMLQxbv0YGed+6
	7FB86nl4O5+GXyBqWHrQVR2wfVH8RJ0bTTBN9vz0ZFCZ6HoD8IhylsuHn6TrOQcg
	r7g54U6Aghz6kJxb9U3Ruw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011027.outbound.protection.outlook.com [40.93.194.27])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4epwrw8dp0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 02:49:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJqbM26XQ1YSaaOOsHJA9zOOAPbKWWfXRO8B/m4vANxOYjQYpWhQngrK8bAVOmdv/6y7tk4WDmJvIZQoJns1Gz4vsqT5f89+NREsIsM9eKBQSbp22qqOpXKAI8ECkOX9MCCA4cZ9anQFQLe0lEExMLIrTRgDa418EGWes+/Q+MZaKgnli7u/iSq/BbPaAwRs88g93ccqNjnYiCvUa6voYC5vc90952M9C90Pd+y4/hrCgnK5MlRV7bhk817lkk2uP8UzpEkFCYSs/fpSgtfTr5Iyhn8nQSwLJ8785eQCtacNDxpr5Zv/7KmGI26ugwF0tav7q6vJ5UAgodIkX4SghQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4O0Ji/FqtoRsmnSV4EZxBfGvkNEeUGwoW5AnuPHRvuw=;
 b=X24o5lBIeqgUgXh7GXLcZxisQdjgz5U0szr/R/vElTI1O3tev7doQbJbuqgZziqjMqbjK+8M69HGEJzXsZ8YJo5iqNh7LVv938tGyxlcdNzIrtDUvHKtdUFxPPtyiMI5WignwNopxz3ezf4GxaWN7Jb/FjFiEDV8RHfePV5IyHEPyCp9IGELHxVEV/Y6I8+DoOEuXaYqi4/j3ORmewUMptjxLcAwwGDJhlIp2fEXDteuePWwhPgEw7wA/iD5fJ0mQEhMhyoHACrEHKx5HGJDhPUOQnJpxV4kP1/GSZZRNjDnr1d2K1zc6TEaZ3G4StzZ++XtfGgauNvA72Qzdo8oeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB5332.namprd11.prod.outlook.com (2603:10b6:610:bf::17)
 by MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 10 Jun
 2026 09:49:12 +0000
Received: from CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::8f86:8d08:45bf:ec13]) by CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::8f86:8d08:45bf:ec13%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 09:49:12 +0000
Message-ID: <6b43e429-68fe-4b32-9a92-c96514087f21@windriver.com>
Date: Wed, 10 Jun 2026 17:49:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] clk: fix slab-use-after-free when
 clk_core_populate_parent_map failed
To: sboyd@kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, dianders@chromium.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Brian Masney <bmasney@redhat.com>
References: <20251002061215.1055185-1-yun.zhou@windriver.com>
 <9c8a8df4-f69c-4407-911f-0402bd06f4c5@windriver.com>
 <aPFIohBAaSnv8YUB@redhat.com>
Content-Language: en-US
From: "Zhou, Yun" <yun.zhou@windriver.com>
In-Reply-To: <aPFIohBAaSnv8YUB@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0130.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1::9)
 To CH0PR11MB5332.namprd11.prod.outlook.com (2603:10b6:610:bf::17)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5332:EE_|MN6PR11MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: 858245f6-b534-48d7-90a3-08dec6d586b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	b7j4GZ/X0B4jE3YMgMnz3woIaEj9Phq0yN1szqnpJ9SFPhhZi+IJleNEyJXF4x4sHLhMApsH4oH6lbiEVwMxyJ/toar84r+KRWs0WcKqVfoxtg+XcQfY5e6TVc2d9XJu6DXSCGDMNEFig+ChvFK6Ji3+fHZNO8ywpe4PdebF6Wyympfa3SFgFnEu+mvVGBJP2LdCxIpRxV6nD8AWWLkNH8hu6nw2F4T1aUl/Op7SECfTpcexEwJk9JVy+rvf0XoxaHQNriRyylBYySNhNU+CVbG9ENr+zbnpGhCpZCw50y9IZN4U05pl5tjbHeD88w29oOWu225cjIHPoa2VU34YFMdyMmuVpToiVlJjCr2EwHwi29rrn1ip5lwl7FWDnp7MkpM/4WpnCZ3pLlt6tlkeIFNf52w4gX8lGg6zIfY6EQt3aI/H/s8BWKCxyIoYJUaBn5Ubsi7ypLNNug/V2XjIw2Ufg/gl5zJVdOccxlgIHldR1kRRaK9rTivP4i3P6soN1y2bL+0mkIXAdzXyMDVd/aqTi8YCtmBGSNM7bfUVkuEP+TMvcjaHtW04Wgk0YZSwc8EzTPbgc3SukFV+EAfLLcL5a1JlCFBDlrbDcbUSTveqxhVtGtWIZ1gPcthSDHsB+OCUQSGz14e0+Spk4DfUapz/R5dIpbGdbS0stq+IrVIt5QlVJNm2m1PcIRWaM166
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5332.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkY2amluazNKb2p3RnZDYXBEWGxPQ0VaYTR4UjNuSGxPankvWmxYZUlyajRQ?=
 =?utf-8?B?ZUJ1VmVLRFd5dWVhL0F4dFZiTUJwWnQvRGdnUENOWHNEWkQ5VzlPd2hDSlhG?=
 =?utf-8?B?bVEzVWxxN1ZOTUcrZVgvWldKUVdwMkFacis0ZllhS25OcS9zSlppalB6eTNq?=
 =?utf-8?B?NUpEd2RRMG03Sy93MkdFQVBuT0lCVVc2dFFWQnpnZXNkWjlreTJ1NE1GNFE3?=
 =?utf-8?B?Qm14bzdSYXVxQWJyVDhmNE1FbFJJRTRwdEF6K3doSjY4SDlDY202c290bHd6?=
 =?utf-8?B?VVF5MCt0eSsvSEgxa09mRTA5QjZ6WHk3WW01cUIyUE02UXR6MzNPcGdmMWtO?=
 =?utf-8?B?aXdxa3M0RUJsK285UDYwNnJCYWlaSFd0emhwcFVPSy9aQUhQZ09yNTl6MnI1?=
 =?utf-8?B?bVNCWU5ISm1uLzR6T2dSdUMweHFhb0xuN1NUWk5SRHVnaUxZVzdOcmMxM0ox?=
 =?utf-8?B?dU91eVowTG9NME5kRi9LU3pkTEdMd010dVFwVDhWWW1RRjRvcGFmQnRjK0h3?=
 =?utf-8?B?bEF4bmR0ZWQxdkZkRlVjVitNUE1ibnh1bWNDSkVUVjM3ZmdFdWpOQ2tzMEkw?=
 =?utf-8?B?UlZoQUxjNkY5WE9OU0hWYkN1dDFEaGZkMUxIcFdvNjhxazVKVzJPdTRJR0lI?=
 =?utf-8?B?V2VSa0U5YUpFZzU4QUNLcytyZ2d1c2VLd0dIeXFSejR3czJFd1VLZnN1akc5?=
 =?utf-8?B?bUNibVEwSy9Sallad2VYcjZCVis2QjdnZ0tHSytoM1RDS1Q3TFZFelNUNEFp?=
 =?utf-8?B?NXN4SDcyWU0wOWU3d0tGdjdDcDJCNlpna1VwY2swUXRIaFo2WWl1VUtHOUEx?=
 =?utf-8?B?YnNzb2RWWVd4UTJMVXdwMTJHU2d4UU5DZ1A0TlBwRWNlMHRRYUpKYWtMSnZP?=
 =?utf-8?B?a3Q3eDdYOThFRjdTUENPeFBIaDRhUGVnT0d1RWd1LzFMQlkxTjlaNXBlR0Iy?=
 =?utf-8?B?d2NYYVFtQTNBUmpKRlFicWdQTFJuZktXaEpzMnJsZGNHWlJkVi9IWGtLbGdo?=
 =?utf-8?B?R0RLd3pVbWpTeXpLWG4xVVNYTUxKMDZueEh4NlpPVjhZeTAreW91YWpnRm9r?=
 =?utf-8?B?VjJCcFM0MlVCYk1mbXhvZnR6ZEtndWdJaWllcVVpZWx3T2sxNHY3blhGUDVR?=
 =?utf-8?B?anVJdWNBL2sybFpoYUFqVEo0ZVcxZW4xNyt5Um5OaTFCcWN3TUNzSy9yN2Jj?=
 =?utf-8?B?dW1PQVJ0dnl4NUQxRWtHV0tUb1NqZjVHOXV2aC9vTDhyOXc0ME9IUWVINjl3?=
 =?utf-8?B?YVUzMFd4QnJpbk5JUVhSUE1IVkVBYjhOcDN6RExLRkZYeEFoZ20wQUhhTTFO?=
 =?utf-8?B?TlRlK2dUci83MFRsNG8yWm4rS05GcjlLVXowMUpZbjNKVE9MSEFndUxHU3Z2?=
 =?utf-8?B?eEZraWV3VXZYQzNPOU1uV0JHOXpnVkxEWWYxaForaUhOQXFxRGJKQSs2ZHJN?=
 =?utf-8?B?OFl5bjZiTFFSWDhFMFRIVE9vRGcrMFgvU0RUT3B5TGVyS25QRHdjaG43TE5x?=
 =?utf-8?B?OE9qRFFpczZOL0dEMXYxUTNrbjdRT2NsU3hPRTVZdjdKV2tKUFc4K3BHNHJp?=
 =?utf-8?B?MmhCYndybGZQS2JLOHR2SXphQ0xHTkRBYTRFeFhEUStBOUVjM2NOLzZKUXRT?=
 =?utf-8?B?TjB5UFhNTmUrak1UdDJFdVU5a1hZc1lrK3Y3UVRwUU5yWHBobFF2WkhBMkFR?=
 =?utf-8?B?d3lxV1ZQK1BxcHg2aHk0NHVPa1o3S09iMTdRWUkwTFRNdXo5YXNmM1VjekFI?=
 =?utf-8?B?M1RON2t6M1ZpTWF1bkpGbVZlR0k4YitmUndQYkRGRWVhcURyQTdhazQyekdZ?=
 =?utf-8?B?TmVkeVNwVUJYT3VHM1VCT3lXakhWWm1MOE51cC91TDdBNFY1OHMwZWpCaTZK?=
 =?utf-8?B?VlNNUFRPaGFlVWg4NzFDd3lnaUJoeXo4ai8vdjdDeWEweFdHa2hkOGtHY0lQ?=
 =?utf-8?B?M293SytleDFtbnlzbzNtSVhVL1JxZG96d2IzZ1Q2RFBSUGZzdENNbGEyb3FW?=
 =?utf-8?B?S2FwMFFNdVFhYjZxSHc3eTEwTmY3ZE02c2svM0FtcGlqUVM1SjNLd0lnbVhP?=
 =?utf-8?B?OWhNOHdlVTZibTU2Y09lMTFXc25BSTNoRXNaZnZCcm9ZNFI5Ukd3MlRnTmFv?=
 =?utf-8?B?ay9TVEpkV1hjQXViM096WDVDdzkxTm93clJiZjlZb2FZRWdUTHJ4TU0vN1Fo?=
 =?utf-8?B?NXpWMi9sY0dvSXB0SkovOVlXZjh2V1ZQZGFBUER4N0RNMUVvUW1scWNnNjBn?=
 =?utf-8?B?Zkh0aDF5dEFlM0RqQ0ppdTdvYlJmRlNaQmVpY0g0M1g1dWlsVmVGRVdOVnR6?=
 =?utf-8?B?QlZweVVLL2dzdlpWVjBnL2p1OGRlUk1RSHJmekFlYnRMMFY1WEc5UT09?=
X-Exchange-RoutingPolicyChecked:
	bNd/9KQ8FWTca98RUsEmkXNqvlXaqCHgVHimKktwbaypMFv8dW8heIqd6+38TlIKv0zAez7G3fomXJ+bxhSuxxJ1ylZTYJdoAmld2oVFV/Qi0nOKdHT3IeSJLZzzUOKsEkS28v3BBA+wa6NoOs9OHSrMKvFG/pym4QeiENVsBHuf+5Nssd/HDavD1YafLMgEVSmW/OTYM2zAQvEOmMWKCkRO326MW0/UnPJwS4A4IIyl+CWLJ7dOmCtxkM7kYwrLzpUR4cZeN5Y14McEiW4E7cCfMU7AXuYJuvvbur8TnZUQE7L93EZRdvy7nC4ZaeQjUsb0Dd3XdjvefI6HJZHTWQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 858245f6-b534-48d7-90a3-08dec6d586b9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5332.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 09:49:12.7548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2roufZiSWGm5RaQPBYOza72+RwJF8Ny1g/+3HYVUbl0Qk8gm+I2Ox1zl0EMWBkSCOpoXzdOVOwsLvAijNTsPUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8146
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA5MyBTYWx0ZWRfXw5x/09cRrOUs
 MKQKqwNjW3l0KxUXJjqWeUPI62UMbnEpqrbReB0PiLjbJB+QEKTplEymnHO89bLOeAe8OPtTn3K
 HeizyNdZdbeeXZ41mfHkVlnnkJObs0Jc5gfZcr+8YNO5CcGRKkkq2ijXmrvku9fadoGoVvXlPXP
 vSBYFwjZvy5q7Hw1y24hGWCKgKSb+IL5iDib/Tid9FDUE8W0lRPtrc3tjPa+sZoEjGkHfum34TK
 QVBHYe20bVrtiNlzGGcwgUnV3y8zzLR0Yd2UJp+7JiLdR6wkHaJ+QDrlc1wxZB+hyMoG1GF3xgK
 jU+pHNgCKoZc0CrGheflrncvjwNtJeUOyLRNZ5fk7GyUHS2Ezxn6mqimfnqZOTZMCPW5V8JhNg+
 2QuEFJoZw/PUVLJsKtIkzDQMitgc1RE+YCUeBVYVRuFXBGeF/fWI6RThjMu/pXA1R8F5M4gnWSt
 yndzxbn/RwLER5JT/WQ==
X-Authority-Analysis: v=2.4 cv=DcQnbPtW c=1 sm=1 tr=0 ts=6a29331c cx=c_pps
 a=1puOLNWm8QjqX9uS9MZT0g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=0WS4Z8Q0DA7OdGU3vBcA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
X-Proofpoint-GUID: bB_3cOoV87pjmqu-CJ7RZu4qnaZ84laA
X-Proofpoint-ORIG-GUID: bB_3cOoV87pjmqu-CJ7RZu4qnaZ84laA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100093

Hi Stephen,

Could you please help me review this patch?

BR,
Yun

On 10/17/25 03:33, Brian Masney wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Yun,
>
> On Thu, Oct 16, 2025 at 09:25:20AM +0800, Zhou, Yun wrote:
>> Hi Brian,
>>
>> Can you help me check if there are any issues with this new patch?
> The new patch looks good to me. Ultimately though it's up to Stephen.
>
> Brian
>

