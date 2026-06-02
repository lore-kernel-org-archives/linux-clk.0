Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012053.outbound.protection.outlook.com [40.107.209.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5493526D4C3;
	Tue,  2 Jun 2026 12:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780404064; cv=fail; b=QcnmBzVEmyMzEyG+ehv45BQ8QAOlqvj39XyHAB8ZPoZuPcOarY2DBfTAu1ukbsTozgqQiYVlI6qF7uOoBL5328+iV18wNERwLPZKpESqTxddIg/V/JjEL8U8tzzKuIHi2nJbnEACwKUdI6a1AIWkyuemaEyN0LviElDckJgc2w4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780404064; c=relaxed/simple;
	bh=Z7Nl7evo1JGk5RTfQ/YPOEZACXs/A6IiIg/LipcHnfU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pm+QFTR9y47SBbA7xT64Jz1z2ImaojCevMmUoEF+WPcRhoXvLh9xwU3DtClxPslVjh3GrVm1mgfRhFvL+pQ+8GlFIm9wywgEf2Njl9rnyhdrOit9TxrUCtugzDlVKCPkCHuzNPXTtYJJHcZw6E4U8ePHcvTwv/gQyFRAIpHnUKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EU90Ak3S; arc=fail smtp.client-ip=40.107.209.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EU90Ak3S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdJ5yW/qImmjIxjNqdobXyfjlkMXNxZAuWPMk9GWY6CIKS65ltOiMlbBLoItjNIq+0oI+Q00FTNdiKCQDe04+OKaLXRT/BB3yldzo13ZiCz1S2hmo1uVGxkZ8eX6xZ9jucWSuco61B0Ul7zMmeiMQZBtk6QNuO9kJJY1iL8mw1VWb/5ivn4hBIS0Y+N8mouDMMK3E54SetcKPEbGp8sCOknX1mF8bu1ox3SO90cysvla/CPXiXsJfPs+1q4NMRuC7StNi/DJT4sqntNXGDkJjATPdV0myKDSrHqKYddd739yOfNePvBQ/DuiwC3DYUD9dO31McFW3FzF6BOQJKWAmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRn4acjpsljNj1mFgoUcIQOQJPbJWdYm2QcISLv8FO4=;
 b=I/IWziOa2+g9bmMbtuUU93559khBtZHQGiSW+bhu6MM3AB9M30K7hmuAVRJfjHxGG4fge6wL5bw/J8huTxw+4+mILJC2TW6Dag44vjV8/FYZo7sXYKje5FYkbk9Mz1KZh0jvSLXnFB0P7DY0OWrstLAiqK0wA6YLKgKQDDXhRt82YV68jxjn9yKjlgcmtirXdcAyRRZoIDvL46Kda8gcmHr32eiRrjjdBbQGN6UANLXo93bhtWgyWGdh1HKmGuLjmwl0BTftC/wk5SDw/wNlPG7F8aZ1KVoBV61hNi/Sfy4/eCZ8cCRta5r8CGzPihOMpvaa0vI0kfdMhgCYzbhfLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRn4acjpsljNj1mFgoUcIQOQJPbJWdYm2QcISLv8FO4=;
 b=EU90Ak3SywCqpEGlHUuQTOdQTCYcz6vnN/NTaYtrJnkWkAx+IkXumam1m68OZONXVY0WxBgjqCCiAElCaIWckwRQK3hv5keI9PYpvSZpMpTZ70GhNl2qUbMetTLSwH6vNh1aOGAZet361d/I971QKR1NOfCkxAQOHB3iu2Fc18A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by MW4PR12MB6999.namprd12.prod.outlook.com (2603:10b6:303:20a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 12:41:00 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0071.011; Tue, 2 Jun 2026
 12:41:00 +0000
Message-ID: <ff4666f8-cfe1-486e-8afa-aa54a59e2a13@amd.com>
Date: Tue, 2 Jun 2026 14:40:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: zynq: handle kasprintf() failure in periph_clk
 registration
To: William Theesfeld <william@theesfeld.net>,
 Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260601203500.658135-1-william@theesfeld.net>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260601203500.658135-1-william@theesfeld.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0013.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::26) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|MW4PR12MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: a41ad72f-f37b-45ea-3e67-08dec0a4334f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	x6Em4qlwDNHi59mb12/IgyZSumVfSv1oHKxFJMLDW38tB6zzgbX4WehB8hk2UHmetGGV7UK3inkxRlaQeTIGOTC8ZtCjYIW1kUtrsbUfI9QnO4mUHlB5KdNvkVvIlJCdWut6w4wJvoCh/RQhjv41NostoDzHjVUdYNIZ+IQ3ZXuPF4VQfjUoqWox/GGjPngZdSawXNyZxSwvLPxC7ZPqLX9B07h9qiVrp+SsWFtYnm28KPDRMixSIg0l0WDYnzlfoHKANeT5fI0dwqWMaZGF8R/hUIP0TtDRvTEL+vKEloDrMcDQiaVwmXTvk/oNtmEE5S5UQVA6mm/dmEMpdoBH3r9gTE47uj2iF8tyChfs8zYlLvNLzOfDc0hIAlSLl/8l2IBiLnSxjbVMiTToMhLVgXh0X8ZSD/ngvRk045iBDE/LG/jWD6qgpkf/iiMhHYdhAFc3BFK9OFnFYVv0tiMG/gmtekM35yWojq8ghSGWCdjLL4k14Eni1H6eZo665NLXZSnejDNBa4l5Y+AbO9WJ9hHuYqOcNAYJpig8dmUoUo3wz/ooWEHikyPd/g6+CA+LkmO6Z9VSvqRtI8sIVJLvTNn/Q9VAvJsnhi+6rO39+rpIsrPVM/W7whmJFiX/wxtED/gPwwzRiHUvGcQf0Qyv2RQlwtGCS2dzcV0OFZDqw6Wuy3ZY3IKHD+24WvbIncr9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXV1Q29NM3FHWlZpY2lHdlNSVkxZMjZEdThYeGZiOWR5UDFsS1piR0NscUsz?=
 =?utf-8?B?TUFMZjV4dFJyM0lXaFBHei80Tnd6SjdHSXNUcHlaaVVtS2dGMVp4WjBSQnJ5?=
 =?utf-8?B?eDJLYWZrTlE3N1NYc2I0anRDRmMwUlVTd3NaVEJiQi84djZMM0hBbDFYY1U5?=
 =?utf-8?B?Ui9GcHkxWHZTeDIvcHpTd1A3bHlGM0xHcVVualRYcGlpajgyRko1MHpIZmRp?=
 =?utf-8?B?Uy80ZU9mVFY3dzZmNkl0enJ5em9BTDdjSUJCSjAycVV6S0tmYVVwQVNXK2tI?=
 =?utf-8?B?TVBJWENEY09jTStyMnc3UlZSWHI1MkhXa1hnak9wT2lNUzVPTitQaVZ4ekV2?=
 =?utf-8?B?Q09qMVBOY1JtY20wcnBjeVdqem9HQk8veUlFOGFHZjhPSGhZU0Q4SjVWY3pu?=
 =?utf-8?B?V0JLOFRaSnZ1THZ6UXRwSnVCVnZ2WEVGTWR2WEJNNmNTTldYUTF4SXpvc1BB?=
 =?utf-8?B?ZU5HL2NxeXQxWnRNWXRpY1c4QmluazBEWHVJUVlPNm96WHhZOXZTWjhwVnVP?=
 =?utf-8?B?YzdacU52azJVY3M4b3A3QmhTR1lDdUU5VFNwQWFIQ1dhUTNBRlhiRVJONHRo?=
 =?utf-8?B?VUVySzBrMzhkNFd6SGR1NjBTNVIyTE5CODI0dXdYZXBXa2dUbUJObjZnLytp?=
 =?utf-8?B?M2dVWXpvbzh6a2VqaGJIUC9EN2ROUmx0ZU96RkcrZU90ZzM1cUEyMHRaNWFk?=
 =?utf-8?B?T0YwUnJzS3BHRUovVzJacG5EcnQ1c0pGLzJ3c1BhN285RzJPbGVyYXc0cW11?=
 =?utf-8?B?TlFWWkRGSlVXSHNubUQ2SjFQL0ZmMlhBb2pSUnN1MFFVN1IwK0dibmdZaHF5?=
 =?utf-8?B?UFYwdUkzU1p1RUlDeTR4cGR2Tm9iMnBPckVscXAxNElFSitlUGlMdWQwdlh3?=
 =?utf-8?B?QmlFVGJyNEhXNkpzNGpXNXpYSW9vc204SXg4dkpiWDF5eE02aGVOeFFGWGVT?=
 =?utf-8?B?Q2QxMXpBdmVkWVY0MFZ3VTFxTmdld3JNUm1kYjMvdGVLV2l1U0pKOGV4bTZE?=
 =?utf-8?B?R0ZBSWh2a2FRMFk3VUxuWWpnbERQVEpwT2pjVCtLemhNTGk0MEIwSGJ1My83?=
 =?utf-8?B?T2oyZE96UWwvaDVCY1RPYzRVMjA1ZDZLT0owRGl4UlQ0a2dndkh6T2paelVK?=
 =?utf-8?B?TStKR0pQcnBmeFFsVm1KSDR0K3NQL2wrTTAyS1NXaVlxVDlHSVQ0VmpmRUlS?=
 =?utf-8?B?NlZmcmtrbGt3VHU1dk05Q25ETXlXQnRqbzFjQ1Qwb0ZRdHJWM1djK1cvOXB4?=
 =?utf-8?B?M2tMdndkZWgvcXdTcFdtdlZPNDBQd2xjNTV4OWxEckYzQkJrY0RNcE90RnhI?=
 =?utf-8?B?bGRia004amIyV01FQ1RUVUZaVEdzSCtGMkVQYlFKc3kwRTFnOUh1STBBRzlp?=
 =?utf-8?B?Mmd5d3F2SUFhbk56b3ZuL1JHa3k1aHViQ2RUUlFuRGlmYnFDem5OV3N3N0Zv?=
 =?utf-8?B?U0xmZXlBM05TOWpqYU01aVBGZWtqN1pVRHhrMi9WejJYMWx3bmpQNSt5eGlQ?=
 =?utf-8?B?amhpNyt4anFhRU5TSUlQMGQ2em9YbkRDSjhsdXA4LzFjNE1Rc2pENXBoRUhI?=
 =?utf-8?B?SXUwUElBV0ZWanZGYUg4NVdEN3BEN0VNMUhLTE8yc3RHcThpSU9SSDlHV3Fk?=
 =?utf-8?B?QzFJN0FURVBzT0JVM0ZucWNoTURhUjNaTExLSE56TVNkVTZNSkdSeVFkUUQw?=
 =?utf-8?B?OXRNYU91YWI3RkdZMjdYeTZ4RmdjeGFwU05JODhCSkdNeGwyb2Z5UEthZXFz?=
 =?utf-8?B?UzJaS2NhdW9NSW43d21vMzFlT0phZ3FrejJ4RWYzdjJQUmFLK2I0K0xYL1RJ?=
 =?utf-8?B?ZFUxMjZIamd0cm50TDJwaFI3RktHMGd4VmwyaDQ2clVYNUdMbHdxYTdpeGNy?=
 =?utf-8?B?dEZqWVNYL3lxaWd5RHNOREI2ZkNFclJBRmg1YWV2dFh2NitGb3ZqKzRjK0Vz?=
 =?utf-8?B?a2JwRElnU3Q4aGZKdDY1eU9ZamYxRnhXZlNqMU1oNW5CSGtmTXg5OUtIeDJn?=
 =?utf-8?B?RklMWDVqQmR2ODZia0ZHVHpicW5UbXkrOVFMd3kvaHdHd1l5MnVuSUQ5cWl0?=
 =?utf-8?B?YVJBMzBWSjNac0FCOUNKSmNveXNEQnF5TkdEUVhTMFU2ZlJORnBTdUNwaU9C?=
 =?utf-8?B?WE5JaWlyNllQTlFaYmNaaVRVWUwxaHl6eHhOdnFQYW9VZ0llSU5xa0wyK3Rp?=
 =?utf-8?B?bVhYNHY2R0NBUlRra0FQaWNFYkpLbVUrQVJkeTI5K2hVdUJpWUdjc3J6RGVN?=
 =?utf-8?B?YkFxVXNHeUdIVkFlcU8wUHhPK1hqSGp2K0tlN3NvRUxGbmpYcDlmVFNZcms3?=
 =?utf-8?B?ZVVUQjRCSzVJQTBtSDI1ZWxOTXlyNWdFQ3lrclBFcFlTTEwxSTRKQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a41ad72f-f37b-45ea-3e67-08dec0a4334f
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 12:41:00.3046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7PZUF4iuGMWPZ1Qa/rkMTZWkLMXjuOKvubSQpSoA1KRqOT41h8vWltt+6b27SMO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6999



On 6/1/26 22:35, William Theesfeld wrote:
> zynq_clk_register_periph_clk() ignores the return value of the two
> kasprintf() calls used to build the mux and divider clock names, and
> passes the resulting (possibly NULL) pointers straight into
> clk_register_mux(), clk_register_divider() and clk_register_gate() as
> the clock '"'name'"' argument.  On allocation failure that name later
> gets dereferenced by the clock framework (e.g. in debugfs name
> formatting), causing a NULL-pointer dereference.
> 
> Check both kasprintf() returns.  On failure unwind any allocated name
> buffer and the spinlock, then fall through to the existing err label
> which sets clks[] to ERR_PTR(-ENOMEM).  Freeing the spinlock on the
> error path is correct here because no clk_register_*() call has had
> a chance to take ownership of it; the success path intentionally
> hands it off to the registered clocks.
> 
> The neighbouring zynq_clk_register_fclk() in the same file already
> uses this per-allocation goto-label cleanup pattern; this change
> brings periph_clk into line with it.
> 
> Signed-off-by: William Theesfeld <william@theesfeld.net>

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
