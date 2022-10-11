Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ECB9C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 11 Oct 2022 03:12:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbiJKDMF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Oct 2022 23:12:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiJKDME (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Oct 2022 23:12:04 -0400
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 338BC183B1
        for <linux-clk@vger.kernel.org>; Mon, 10 Oct 2022 20:12:03 -0700 (PDT)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
        by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29B2odwJ031027;
        Mon, 10 Oct 2022 20:11:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=mvjEWA4L7w9/WontOPZHWECIhafmKtoqhOBEFx1nx7I=;
 b=Dk33zjmqa+mZaTSIzsvJPRJbXA1rxST36ZpSaJvBpyZzkC0BVbXveNmuAawlBW8r5NOq
 jzJNqsPfJuKHaUDqfA1aZ27Z2vE27yN5sHk/+Z5bhL/tg/OIvy4ejaOZrftUmBdFB+WO
 bLwnsz3OspT6ai/hqrAKK5V0RvkTOqerihlxR4kb5hekQOlUvCiQj/B7+pyvTwyswm3X
 169g0LYki8yl+3VwTnGjxh6qrBqnIt+3yQg+rfNz+jcr5flZjWXAJ5kCL1Bol7NIb1/i
 MvKxoWLO0ALjLwjrk51mL8p960Bz0JN/5yiC0pEMwZfQfHxy+qWXlpjIXeXmhWGKsFDx GQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
        by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k34g29vta-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Oct 2022 20:11:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmL8Lx+CB/s71aIzQCl+FMi+XS1LZyo0xCs2QBNtYmMYo1oJwrAhbtLvGgwjbZPa1HHbVZ168dkF5taCzhf1NgPK1NWr8T7EQbBGQmKSEO2boXL8NfJ/7NiRDDsryspKxFsrjRmqs0ehID616/++U5tM8X7lNXaF/MBDrAr56zwL9dqLI141opqdQLk+dFB/9ZHbe0TiLgUw7+s7CZmSEYd8MH4yMCocDZ48zctjx/3nUqgA1GvCZ2LmkNGv3hrvPnd2C0FfITLr0JwWJIgLILjrsgQVwZhQcNJbYlqlMRiELSJOP0kgKzgi7CzxSHmzZ2+Z5CBljMozYhruFJZBAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvjEWA4L7w9/WontOPZHWECIhafmKtoqhOBEFx1nx7I=;
 b=EEKRP1hCsqiuiD4u7q2r3aQxhW6unpCqNjeh3/xol74PtpD9GXjvLncrzi1gJReDmmEK9J2ZQYOP5hmGrUQeu/iCCFtd1+qnO1T9qPP28Y7FMUqBYB8VljaAosCdR/aBiSlzQd40fojp7nCDvdXVeE6vA5I6O9ofklt4M7OUE3q/7KD+PbiudPEKVZYR/FwOVTA9ROuh5Xgi19s2epU5p6/GZ84FuIwUYvKC9uCPrF15Yn53HEv0T2suB49e52tMV75BGY+S1Izi8EiBKJZ26LBT3F6fu4nwi/cUrk+i8sF5+dz9iS8Wrf2XyHAPoE2OeqZp5/S+LSdhe4paBZM5eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5630.namprd11.prod.outlook.com (2603:10b6:a03:3bb::6)
 by SN7PR11MB6923.namprd11.prod.outlook.com (2603:10b6:806:2aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Tue, 11 Oct
 2022 03:11:40 +0000
Received: from SJ0PR11MB5630.namprd11.prod.outlook.com
 ([fe80::d418:fda2:a043:7e2d]) by SJ0PR11MB5630.namprd11.prod.outlook.com
 ([fe80::d418:fda2:a043:7e2d%7]) with mapi id 15.20.5709.019; Tue, 11 Oct 2022
 03:11:40 +0000
Message-ID: <3b05a90d-a3f0-1df7-e2f9-d3f44cdf36a8@windriver.com>
Date:   Tue, 11 Oct 2022 11:11:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] clk: zynqmp: pll: Fix divider calculation to avoid
 out-of-range rate
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Michal Simek <michal.simek@xilinx.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>
References: <20220928201656.30318-1-laurent.pinchart@ideasonboard.com>
 <11481209-7c8f-7543-1e04-5723ffc2ccd4@windriver.com>
 <20221001000503.23268C433D6@smtp.kernel.org>
 <20221001104001.r7r2utwymm32tv53@houat>
 <ba5bb9dd-8a4c-3f24-c7e2-c8469ef693be@windriver.com>
 <20221010084948.5ikovoamsfggsxwj@houat>
 <5dd52fa0-1507-fbf4-8e98-90e50675b83d@windriver.com>
 <20221010124915.25pl5jyxtaepimhd@houat>
From:   Quanyang Wang <quanyang.wang@windriver.com>
In-Reply-To: <20221010124915.25pl5jyxtaepimhd@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::35) To SJ0PR11MB5630.namprd11.prod.outlook.com
 (2603:10b6:a03:3bb::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5630:EE_|SN7PR11MB6923:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c0e5e63-e044-458d-b682-08daab365103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5qpo3IQEN8tEnCWhwyt4cPedZg1YoGhdLFsTPPZBRacu8N9TPoJ+ORQMTmD+6LiinC4vEJrpiFAGM/HC4eLL1gxKD6z8u349dfZR39SY+dqGjiR4O+Lf0S5fvxL+xzk2qPWn/gc56uJwJ3YArs7EQPi6XLuJ0Z8ihWH/uZ+8c9344HqlTc3F8s+OD+3y7jXR+bhOaQC0nW5yJCaKoRTaYxjRqCIRo36EFPSooXcYkAQyxMhUzSWBrmEKxhFCD7GOfeFxgRSLhIuNXLlOn+TjNGjsutZuciCWmbHp9a0X5TLwtM23fOTYG5PjI+c+1b0MYWV0QbOi2h/kpzszmM+5MVn59zPv18TY05nMU+gTpl943rRPkBqtkZvVBkJN2dfYRB6DNtjh+A7ddwnXuGHf6zemhFovC1jvFRjvIUkaR32YRZ8Vk9VbKf23YarqyvGsmE/mG9oS7c+ojCP+F3Cylab30aDbmTZQPK9hvT2I98pfE7y/eEocURG3dPlEkFeCv/mhUNtOlO/TkpvENLV//kYsqVzb+jxoVuaqEiQqpP5ijlZoKDKBdj1DxCIc2nRqZcKrnMtRprAoya5WzjthhWpWmTS7DPX9m8uSRAQaYH+/dFmWi/m0uTt6y/1PuUQvT0SlPn7hr6JbJIAZNLnUGo4qNYyPNteIAyI4ezxP2gvSf7PbekKBDZgAntCM8NVYC6SpQcK+V29NpQpmh+nDKj8OPJm/65AlqrXsvsNFoMuVkbMY6yOJAFk+KdJtUU4yNpPYeFDPehDw/I3J2bEjYU6PPhhN7KkC3ZGNl3F+/k8OIbwm0t0J5npGPEnAD53FNSnoChFnigJJ2/Ub8lbbNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5630.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(366004)(39850400004)(451199015)(6486002)(31696002)(36756003)(86362001)(478600001)(8936002)(966005)(41300700001)(66476007)(44832011)(66556008)(8676002)(5660300002)(53546011)(2616005)(316002)(6666004)(2906002)(83380400001)(54906003)(4326008)(66946007)(6512007)(6916009)(26005)(6506007)(31686004)(38100700002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkZYbko0aXYxSzBzN2VTaWtDOFp3Y1Q3Um9GNTFtWU44aTlURWR1Q2VYM1VQ?=
 =?utf-8?B?TWVyem5NL3MvTGJYdzdlOFZtYjhSZUhpdEtXKytHZm5TSGtibkhRaDN3RzJS?=
 =?utf-8?B?S2VlZFpvdlZQQ0tMVU5YNWtIb2I5WGU2T29hRDBBT1Vma01jbHY3ZkZEZEI3?=
 =?utf-8?B?eGpWZndSdWIyOTVwcWlOUDhqdzREa2RMUnlSWnptNDNwYTdZbjdwak9jV2xD?=
 =?utf-8?B?aHFrbng3Vmp1aUI5UkdmNFAwdis1KzJIMlY1ZVlMSnNJMUV2UWZTY0EvbGtI?=
 =?utf-8?B?bkV2WTBDbTJEbnREQ3c4U0xWY1FCN0JCQW9lVmY0bkRFb0tJNXcwS2E1ZjdO?=
 =?utf-8?B?SFIxSDlUZ2pvb2FSMnN1RnZMc0EvSVFCY2hxSkMwT0Z1NDQ0VmcxS2pWU2xM?=
 =?utf-8?B?cGk4VjhWVGphMnNjalFvcnBsUHpZYTNBOStoVThXZm5rNkUxT3ZsRXRDR2dI?=
 =?utf-8?B?bkVtQU5CazhsR3BDMXl5QXlqU2kyQVRSYnR0amtoTU5rV1cwMGxCWVRsVXlR?=
 =?utf-8?B?WDVXTHRrRiswL3M0NVVHY3h4UU43ZGdZSjZBbmxtK2p3RUR4UHprY0ZBeDJw?=
 =?utf-8?B?dExDSmdldFZoYy9WazRYMnZjd25kSVUrOUsycm9RZjlONzkwSGsxSjNVVXov?=
 =?utf-8?B?OVBoRnJCSlpPeDVTUDFCdUVpVGlUVUhsU0ZBVzlndktveXhHdTNuOXdkZGdO?=
 =?utf-8?B?a1hZbDRuV0plc2VFaXJXakIrM1U0N3lBSjluczdsZFJmdnBtVG8zdVl4NUs2?=
 =?utf-8?B?c3YwQktoTHp0TGxEV0lBZlFJUi8zZVIzZ1hpUk9VUTBGaHkwSnY1dEQ0MGpP?=
 =?utf-8?B?cUFiY3FpV21WZWRPNTJJM1pUMWM4Z09KckJtNUxlY2UrdlRxa1QxUnhmbkxq?=
 =?utf-8?B?ckhmRkhVSlpwOTQ1akJaWGJ2MzhoOVNUQ2QyQm9mcTZVYVBvUTJ2a2NkNWhN?=
 =?utf-8?B?N3lzTk5sVW5HZCtKbnY0Mm0xcTZUcXZOcXpuSElySkt2Z3FKdStkYWo1MHVj?=
 =?utf-8?B?WGRObnhKTUZRYk1LNjhBZ2xsenBiN21rN3JnSW9GUHhNYlEzR3Fhb0o2d2tw?=
 =?utf-8?B?eVRZYnRrRllzVWlRMTlWYTBlSmNFM2NPWWwvMUlYS2EyVXJYWUtldEk3SVQ0?=
 =?utf-8?B?VEV0QlJvODErVGcwYVFiV2syb3NqMGMxY290cGNCeGx3ZzQvT1V5bHY2enpr?=
 =?utf-8?B?cGUxWCtyZXM1RVZlSmx2THFLcThTOHh2TklwbnpzU0tJUllSZnpKNnJDK2lE?=
 =?utf-8?B?RXVwUGowTmJ2WUJZRndGaURnSUlCc1NkUCtXb2FiNHkzNitjcEYvb3JvWTVN?=
 =?utf-8?B?Z2dka0pOcS9pU1Q4Z1hTRTVtc0VTUkh3UVJicGlFNGFuL2ZFTkI0OTJxc21h?=
 =?utf-8?B?RCtCMWFoMVAxdjlsMzdLd3dtMWEwVG9TNXFPVVdobjFyTjJ0MUJRSk1jTi9r?=
 =?utf-8?B?ZTZncHFzWWdmYnc3cGlHeGROcXJmeHprMStsZHFFV0liYlZMM1dOZFVHNHZD?=
 =?utf-8?B?VkZxVXliL1pvTnM3cld2VWZDbzVMNjBnOWJXakREVU94a0o0SmR6SVBEd1lj?=
 =?utf-8?B?NnpjTEtvUmI4ajlJQVk0dFRVZ2JiKzBhdUdzTStpaDBKN3h6NHRvcnVOTnpK?=
 =?utf-8?B?aStqMGFVMWpqaHNZZGIxUGJlMWZpeFgvUW9hSEduNmNjV084c1BFa3UyNnpK?=
 =?utf-8?B?aTJzdzUrUG9SNEx6V0NxMEJkZERhdzlveWZZcjd2NWxLMmx1NDY4ZFoxM21E?=
 =?utf-8?B?UW1jODhVUURrUk02Z29RZ3ZKalhkajlaK3ZUNjJGeVRwaFZsSFlhMzdEUk9s?=
 =?utf-8?B?d0dMT3dTT3pYb2QrdEtBakxRZGtEejBRVVhna0NTUHZGb1RtdjZkQlFrMHI3?=
 =?utf-8?B?c3ZMYUp6UzBJaWp0MkJFNDUzcmtBRWl5OEhrOHJEV202QlpVZWdCR284M01O?=
 =?utf-8?B?eVNCN3Q5cWpydS85TVgrMVlPRGxDaHFad01kSzk1Z0xVRWsrYmZqaWlDWjRY?=
 =?utf-8?B?TzUvalFRWkpzdXRlT3U4OFRRNkhVOVZUUFBqVlhUakJnaEE4aWhJckZGNVFJ?=
 =?utf-8?B?Z3VGY2Q5ZEhvN1JIYWRFb0Zpa0pzN0lzM28zQUxMS2JxbEEzVWVibU1Delow?=
 =?utf-8?B?RmVHQmhBQ01KbXdGQVN1RjdTN2lJTWltZ1JBOXo5cTdQZFNYSE5iMWpyTG1X?=
 =?utf-8?B?aXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0e5e63-e044-458d-b682-08daab365103
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5630.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 03:11:40.4483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sYBYA9ymsPXPnnNl3yMt04Vm//+1x3TOKtvvzfl7hyc/Jz5UkJv70ao7TWwR3XtdOhbIyG7nJERdyF3MuSJERaC2rLOno5nnvi6TEdz/SmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6923
X-Proofpoint-ORIG-GUID: Ys71_UVcGQhlRulZ0UbmKerwPNcLQdLh
X-Proofpoint-GUID: Ys71_UVcGQhlRulZ0UbmKerwPNcLQdLh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-11_01,2022-10-10_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210110016
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Maxime,

On 10/10/22 20:49, Maxime Ripard wrote:
> On Mon, Oct 10, 2022 at 08:12:08PM +0800, Quanyang Wang wrote:
>> Hi Maxime,
>>
>> On 10/10/22 16:49, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Sun, Oct 02, 2022 at 10:17:24AM +0800, Quanyang Wang wrote:
>>>> On 10/1/22 18:40, Maxime Ripard wrote:
>>>>> Hi
>>>>>
>>>>> On Fri, Sep 30, 2022 at 05:05:01PM -0700, Stephen Boyd wrote:
>>>>>> +Maxime
>>>>>>
>>>>>> Quoting Quanyang Wang (2022-09-28 18:05:10)
>>>>>>> Hi Laurent,
>>>>>>>
>>>>>>> I have sent a patch as below to fix this issue which set rate failed and
>>>>>>> it's in linux-next repo now.
>>>>>>>
>>>>>>> https://lore.kernel.org/linux-arm-kernel/20220826142030.213805-1-quanyang.wang@windriver.com/T/
>>>>>>>
>>>>>
>>>>> It looks to me that the fundamental issue is that, in some situations,
>>>>> the round_rate implementation can return a rate outside of the
>>>>> boundaries enforced on a clock.
>>>>
>>>> In my limited view, the round_rate callbacks should return a rate within
>>>> boundaries as output,
>>>
>>> I guess it would be s/should/must/, but yeah, we agree.
>>>
>>>> but can take a rate outside of boundaries as input.
>>>
>>> I'm not sure what that would change though?
>>>
>>>> Take Xilinx Zynqmp for instance, VPLL's rate range is 1.5GHz~3GHz. A
>>>> consumer dp_video_ref wants a 200MHz rate, its request walks upward through
>>>> multiplexers and dividers then reaches to VPLL, VPLL receives this 200MHz
>>>> request and call  zynqmp_pll_round_rate to "round" this out-of-range rate
>>>> 200MHz to 1600MHz via multiplying by 8. zynqmp_pll_round_rate returns
>>>> 1600MHz and clk subsystem will call determine callbacks to configure
>>>> dividers correctly to make sure that dp_video_ref can get an exact rate
>>>> 200MHz.
>>>
>>> Sounds good to me indeed.
>>>
>>>> But the commit 948fb0969eae8 ("clk: Always clamp the rounded rate") adds
>>>>
>>>> req->rate = clamp(req->rate, req->min_rate, req->max_rate);
>>>>
>>>> before
>>>>
>>>> rate = core->ops->round_rate(core->hw, req->rate,&req->best_parent_rate);
>>>>
>>>> This results that .round_rate callbacks lose functionality since they have
>>>> no chance to pick up a precise rate but only a boundary rate.
>>>> Still for Xilinx Zynqmp, the 200MHz rate request to PLL will be set to
>>>> 1500MHz by clamp function and then zynqmp_pll_round_rate does nothing,
>>>
>>> I'm a bit confused now.
>>>
>>> If I understand your clock topology, you have a PLL, and then a divider
>>> of 8, and want the final clock to be running at 200MHz?
>>>
>>> If so, the divider should call its parent round/determine_rate with 200
>>> * 8 MHz = 1600MHz, which is is still inside the boundaries of 1.5-3.0GHz
>>> and won't be affected?
>>>
>>> Why should the child be affected by the parent boundaries, or the other
>>> way around
>>
>> Sorry, I didn't explain the problem clearly.
>>
>> As below is the vpll clk topology in /sys/kernel/debug/clk/clk_summary when
>> reverted "clk: Always clamp the rounded rate".
>>   clk_name				MHz
>>   pss_ref_clk                          33333333
>>      vpll_post_src                     33333333
>>      vpll_pre_src                      33333333
>>         vpll_int                       1599999984
>>            vpll_half                   799999992
>>               vpll_int_mux             799999992
>>                  vpll                  799999992
>>                     dp_video_ref_mux    799999992
>>                        dp_video_ref_div1    99999999
>>                           dp_video_ref_div2  99999999
>>                              dp_video_ref    99999999
> 
> I couldn't find any of these clocks by grepping in the kernel code, are
> they upstream?
> 
>> When call clk_set_rate(dp_video_ref, 100MHz), there is a clk_calc_new_rates
>> request passed from bottom (dp_video_ref) to top (vpll_int), every clk will
>> calculate its clk_rate and its best_parent_rate. vpll_half will calculate
>> its clk rate is 100MHz and its parent clk vpll_int should be 200MHz since
>> vpll_half is a half divider. But vpll_int ranges from 1.5GHz~3GHz
> 
> Still, I'm not entirely sure what's going on. If the only divider we
> have is vpll_half which halves the rate, and we want 100MHz on
> dp_video_ref, then vpll_int should provide 200MHz? Why would we increase
> it to 1.6GHz? I get that the range of operating frequencies for vpll_int
> is 1.5-3GHz, but I don't understand how we could end up with 100MHz on
> dp_video_ref with 1.6GHz for that PLL. Or the other way around, why we
> want that * 8 in the first place for vpll_int.
Oh, I think I see what's wrong. It's because the children clocks of 
vpll_int have the wrong rate range. The commit 948fb0969eae8 makes sense 
and my understanding was wrong.

The clk vpll_int sets the rate range by the function:
	clk_hw_set_rate_range(hw, 1.5GHz, 3.0GHz);
But the function clk_hw_set_rate_range just set the rate range for 
vpll_int, not cascade the limitation for its children clks. This results 
that the its children clks still ranges 0~ULONG_MAX. When a 100MHz rate 
request is raised from the bottom "dp_video_ref", every clk in the tree 
doesn't modify it and just pass it to its parent clk since 100MHz is in 
its rate range 0~ULONG_MAX. Then vpll_int receive a 200MHz rate request 
from vpll_half which will set itself to be 100MHz. But in fact, 
vpll_half rate range should be 1.5GHz/2 ~ 3GHz/2. The same to the clk 
dp_video_ref_mux. And the divider dp_video_ref_div1 should range from 
1.5GHz/2/63 ~ 3GHz/2/1.

In my limited view, there is a relation between clocks that is 
muxes/dividers should inherit the limitation from its parent clk. But 
now it seems that the rate ranges are isolating between clks. Is there a 
way that can re-set the rate range for children clks when its parent clk 
re-set the rate range?

Thanks,
Quanyang
> 
> Maxime
