Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E446C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 10 Oct 2022 12:12:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbiJJMM6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Oct 2022 08:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231201AbiJJMMq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Oct 2022 08:12:46 -0400
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A97D465546
        for <linux-clk@vger.kernel.org>; Mon, 10 Oct 2022 05:12:44 -0700 (PDT)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
        by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29ABkBfR019724;
        Mon, 10 Oct 2022 05:12:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=4nkLAi0FUmSgKWnJDCouKWf9KSUJVX15xtaSCSpcnB0=;
 b=swYDCt6G+X40Y/InH945RfZJTARZDfxl4K7FauhotEKwmYtL9mBOKO8E3fZA0PMkuV3k
 0pX+MtZ8V5w8o4DrJRiX0dDpSKbXpvKtyNhCNTLqCn6AuQXleYBCWzRZIGeExAmeTIJJ
 HhZD/WSy83jTYH4dsGO12DRU0kE8KsqEa+NjNs1TSmU63WVUhgHZXTnm51S1ACfDBzCE
 LURFNmsC6jp2Sx4rVsldi55+d87mA+cE3I4i8kiAIsqF59IZKzN2Q0y0UIUKFMAsgCFr
 KT6TBiL5DlaXduu7f+mS7BYElz39dnwmd26MWZgzdXIFpmbf0/WT+C5M+B1E38v2pp0x Zw== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
        by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k34g29crd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Oct 2022 05:12:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OY27fYicK6APMa5lYQRBnKE0P8lJbG35fo5eFx5Y69DeTs8prDJ9XpLBL9/Ss6h2rW98ORNIyZevNovXaz860WfWq5chu4rzEt8MMIsWui0Er3Cgg+CtKOrq3Tpi79VQBme4IBbx/wcWSJJVkfpKco1bTWjyYAQq8hDTomBwzsYQFub/rJBifyUuAj8MTIx6Yrk1EIL4z8WmKWu6UEazuEci6mA7VREX/76x6MF5Xzltb0X7o00w5mc7R5vFOyGLnnjXYGvbpx1s075OM/YCgj7Q5DdV9IzWbZOMgTKcrHrmVksIjh6e5eYfK4vWcs8zFEZriWMRmP49ewhgI75gMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nkLAi0FUmSgKWnJDCouKWf9KSUJVX15xtaSCSpcnB0=;
 b=ARM6OeUo1FM8uOpcH35yglTldlie6cjThZ9kH9Gn7xLFXyYO4ueKaWM83L3Ukhsg9lFYMolkG0MskTVvaCNfHj5AxSVVPSDKPZlxm+o5Kjxp7R0Cg0vdJ7KsDFMitpy+0EXi4ztLAaAOSg9n3iO9GczWhAWhkEoktZv/94S4HQ2unli314yEQ4w+1wc8iEHl2N3mkxgzPqot994BWMa3HwtWoTTFg2nKjJRu/f3M6RU9+s+uALq8v9PPU+2nMiMoph2z6VMKECL4jWUB7gM+2Z/QdO+DY2FgIFzkW0+YBW8CueziG/zCPTzqIV7vvGTYTpGcHBWTPq9QsyVRXYSnsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5630.namprd11.prod.outlook.com (2603:10b6:a03:3bb::6)
 by DM4PR11MB7206.namprd11.prod.outlook.com (2603:10b6:8:112::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Mon, 10 Oct
 2022 12:12:16 +0000
Received: from SJ0PR11MB5630.namprd11.prod.outlook.com
 ([fe80::d418:fda2:a043:7e2d]) by SJ0PR11MB5630.namprd11.prod.outlook.com
 ([fe80::d418:fda2:a043:7e2d%6]) with mapi id 15.20.5676.028; Mon, 10 Oct 2022
 12:12:16 +0000
Message-ID: <5dd52fa0-1507-fbf4-8e98-90e50675b83d@windriver.com>
Date:   Mon, 10 Oct 2022 20:12:08 +0800
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
From:   Quanyang Wang <quanyang.wang@windriver.com>
In-Reply-To: <20221010084948.5ikovoamsfggsxwj@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:4:186::13) To SJ0PR11MB5630.namprd11.prod.outlook.com
 (2603:10b6:a03:3bb::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5630:EE_|DM4PR11MB7206:EE_
X-MS-Office365-Filtering-Correlation-Id: 339d341c-d524-4178-6f89-08daaab8abee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vuKwL5Qk0b6tfAvbO1Z5WBZHByzlt1SjkTc4fdI/fcVMieNc1JjQObVv7yJtt7uvRAkSf/eH6sD28ea0maSBSrpUlahLNwRgoIGNlntPjEv8xcePPB6vs1zLF1AbeGnQH2NwX3sWDXEp2c1RgA+XOVbgh33lq3yD1L/k0tpu7afmSFS6+w0NoNO2onQFJQ9h5IFoBuZNt4bFf+pcoVyvf7clHqSdchZE7b2WjN3A4r+3EEQKlamkUWj79gkcYknUi4S++1KywtyVQ0tR05M7r5xwqMlRD4L40hFRctLJMZNGNkryVGpbCP+rDfGR0Ze5s7DyGOOybvnxDtk0G+9EYgAWh6is3nnX3y+0f+YbsNfgJ5zgC7/LqVlklCdfFKweW5CGck8qOmXrH3Q9GnX2bN4y/3aBL7TBtiTai+JO4TjQNA4j/WaoKqRieS7n5XREls6C9k24RfGRs57iQOooTUpjapo+uSkhNr2p7SeNeRrwFZUAhzbhIiLo980YqKDOLi/WnB/YnxgWbm6FQtj5njUzT9bZTl3h86AY4v0mXpSS/8C1Onof1N+mIadj1MwUT8r1cf5svZUV058mG5RwW0YQFMgXZ4yylsjf2xDU1Q3E7nRa/l7CXskBuLR318BQ7z3i8sbUz5Zjk/TfALUOjMYzwhxROhchwI4ZIG3BwrDqx++7V6Z1aQwbnNpx8Tft8iC/jhXrh1RpNGyqZ8iwMUXwPqs38t9FwtL6ETYY8vVhmTNdO15RlcoFo6RVla4w/LkxN2knfhnqdCQHIcqfY6F0f7YaonneSEhu7VAKkAb3ugCtQp0PgvbuXYwFTYOA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5630.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39850400004)(366004)(451199015)(38100700002)(26005)(6486002)(2616005)(6512007)(966005)(6666004)(6506007)(36756003)(8936002)(44832011)(31696002)(5660300002)(8676002)(66946007)(316002)(6916009)(478600001)(53546011)(86362001)(54906003)(83380400001)(31686004)(41300700001)(2906002)(66476007)(186003)(66556008)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2ZWQmhzY3NqNm1STWRteFpSR28xUGpwNTBQMndJdnlCVWdFc2VpNWtIVzY1?=
 =?utf-8?B?U2dZQWdYYmZSdDFCY2V0OVUzd2pmcHNDQ3QzZldaL2xpQWhhS1NvSTJ5V21L?=
 =?utf-8?B?Z0srblBhSlZQTS83UVVMYmZiM245b2tBR2VIaVlpcEpVV0I4bmJLMVFDVWEx?=
 =?utf-8?B?dEhVUnZnbDRFdXQ3MUQrMFhoMnRGM1NtV3pwMEM4Y2llQng1NjAwN1czT1pJ?=
 =?utf-8?B?d29wVDlZT3R5Si9QV255cUdSdHk2ZWNxSHU4SzhEM0FYa2tjTVEvRUtZa1BP?=
 =?utf-8?B?ZWdvTjVEZ3JoM0I2R0RqUHB0dWdJY0RDUENva1RDa2U2Unp3YUxSRDQ4QmJ1?=
 =?utf-8?B?M2xiaXhLeU94WFhvTmZpcTYzUTJEdjl5a2lpOFluaHNuWGR0a1d0Snh4RWJ4?=
 =?utf-8?B?Z2lsdGlZWG4xeW13c29XaEpkWEo0UThZNjQwMzVTRkd5bXNES2xyeXBhVy8r?=
 =?utf-8?B?ZmlYa1VsKzZrL0J4Y2gvWUJNeTdwQ1VsYnpYTXI0dC9obGwxajlFTHgwckM5?=
 =?utf-8?B?aXRNR0RRb1duN0lPZkZoVVgxdHczZUl4NUpnQWhOdUxBWEJza3hwR0NBMTl4?=
 =?utf-8?B?aVZZd2FMUVFEQUttemUwZlpaK1pvbUQxczlkT0xsN3JjWTlCeUZHbnZCbjM4?=
 =?utf-8?B?djlZU2JOU29NZ3ZYbndTa0tTaHliQ2VDSUVJNEdFUDVoWDlLSVhsMzhqa2xW?=
 =?utf-8?B?ZEVMc1hxdXJqL1hBZUJteVdQUnJFYk9QNzdnbm1MVTVMT0VqaUdIVTJWKzE0?=
 =?utf-8?B?K29aMkQ2WnRPZ2l3cVZhVGdscmc5TWhUdWExZFRYNDEyQzBLQmtCM3hXVS9n?=
 =?utf-8?B?bVNremc3NmdkSjhWd3lQQ0tSdFd5b0ZwVFJHd241bmNUQ2p6aGJuZGhaRS9D?=
 =?utf-8?B?ekFIbjBYTzJrdUkvaFZMaVdDT250YnVKTTBxaXRDQXErMG5ERzBMdS8rS2lL?=
 =?utf-8?B?SytHR2JIdWpXUElUWk1CRWplRm1oMlQxeFRGVnpjZW5ob3Vad3FTUHJ3ejha?=
 =?utf-8?B?d2doMWFTK1VtbG9Bb3o0OURZekcwOGxRRGxRai9UaExENy9neWp0OWgreEFZ?=
 =?utf-8?B?SVhpbkM5clhQQWoyZDByWVBJQ1dEamVVRWlKdy9wTi9aS1ZheU4vQUV2ejVH?=
 =?utf-8?B?YTVvdjlmemUzTlhMTjJ1VFM1UFN4V1FGTDNndkpnc1ZobkRYYWRjYlFyUGR3?=
 =?utf-8?B?NUJ2RnhWT1YyR0tCbDVna1dRTWZBeVJjemNVcmNiTlZpVmNzYnVCZElWSHJw?=
 =?utf-8?B?ZjhHcW9rb01NWTJ5bXVBcmU3eEgyMmNMeWlucGdIWm9oOUJXU0wrM0toV243?=
 =?utf-8?B?em84ZVhGS2Y5QU5RK21GNTNONytwV2ROeGgxZmJjZFhod3NHN2U5MGphRFlN?=
 =?utf-8?B?SlltbTZaQ3VQTUQ2a0lxb2tlYWV2SUpTaktxQzFJQlc3TDlDK0QxMTl6bGpp?=
 =?utf-8?B?eTlGWXE1cWZ5L2Q2Y1VLRXI2QkZ4SjNBR0p6aGF6N1JrMllYenJMOFUxN3Fj?=
 =?utf-8?B?OERvNitidDdsamxZTEJQeURRbEs0VENoQk1hZE55SVU1cGk2ZVhxa2FBS2Zq?=
 =?utf-8?B?dU43UWpUREVLZmVyejd4eXk4WDlMYlNnZFB6S3NkRS8rbUFDc3ZEandDSTFG?=
 =?utf-8?B?eTRDalV0UFlWQ3JXN0ZOWE1ycncwYjZrR1RLZE55MHNJa3VISncwMjhwVkpQ?=
 =?utf-8?B?RTBuNTd4SlMySUlwK3NmQVFwSkx3QXdWRG1kL2d5UmIvTkVRQ0ZmcmhGbnB1?=
 =?utf-8?B?TEdUV2V3RWxqOWdPK01VTXpocmpCYno1dllxSjBzV3FKR1lIaDE1UmE0UUF4?=
 =?utf-8?B?LzQyUVVaMjlRUFJJQnhXVU9tU3pEcG9nMUJuQVp5Nk5iT093aGlMSVZWOWpP?=
 =?utf-8?B?anNYSE8yeHRRU25rdDlNVVNxQTZEMUxoNHJUUU1DMCt4NzBMVGorSjBNVGl5?=
 =?utf-8?B?TDNFeUt0bitrbmFzSmVSV3oveGZYN3NwQ0ExOTlCbzNRWGtkSExOL0RvTklK?=
 =?utf-8?B?N1puVTkzZ3JMN1JlM09HM2hWYWE0RmZWSG5WMzU1YmgxUmJWV01lZkFCQTly?=
 =?utf-8?B?UklFNVhkamF5YjB6c2FKclNuQWNnYnc5S0dkbHN6QjBqbzlNWmZvMGcxaWZh?=
 =?utf-8?B?dlhoNWIzS0grcitEN21Qek5ubjkxdFpXaURXKytndFc5Um9YSUJja1FmMGFP?=
 =?utf-8?B?dWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 339d341c-d524-4178-6f89-08daaab8abee
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5630.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 12:12:16.7508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nESpEPkOLLhUWG4ghL0RkcuP0YZeZeAw86DwyDse6zLUTXwD/uJtsEvrjI53Vj82qecqTxCQArpH523nQg4GXDH9hT40V3BG43mxbP31AhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7206
X-Proofpoint-ORIG-GUID: yYPGA8k6cG10BJ_8F31xXrExVEwpN0s3
X-Proofpoint-GUID: yYPGA8k6cG10BJ_8F31xXrExVEwpN0s3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-10_06,2022-10-10_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210100074
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Maxime,

On 10/10/22 16:49, Maxime Ripard wrote:
> Hi,
> 
> On Sun, Oct 02, 2022 at 10:17:24AM +0800, Quanyang Wang wrote:
>> On 10/1/22 18:40, Maxime Ripard wrote:
>>> Hi
>>>
>>> On Fri, Sep 30, 2022 at 05:05:01PM -0700, Stephen Boyd wrote:
>>>> +Maxime
>>>>
>>>> Quoting Quanyang Wang (2022-09-28 18:05:10)
>>>>> Hi Laurent,
>>>>>
>>>>> I have sent a patch as below to fix this issue which set rate failed and
>>>>> it's in linux-next repo now.
>>>>>
>>>>> https://lore.kernel.org/linux-arm-kernel/20220826142030.213805-1-quanyang.wang@windriver.com/T/
>>>>>
>>>
>>> It looks to me that the fundamental issue is that, in some situations,
>>> the round_rate implementation can return a rate outside of the
>>> boundaries enforced on a clock.
>>
>> In my limited view, the round_rate callbacks should return a rate within
>> boundaries as output,
> 
> I guess it would be s/should/must/, but yeah, we agree.
> 
>> but can take a rate outside of boundaries as input.
> 
> I'm not sure what that would change though?
> 
>> Take Xilinx Zynqmp for instance, VPLL's rate range is 1.5GHz~3GHz. A
>> consumer dp_video_ref wants a 200MHz rate, its request walks upward through
>> multiplexers and dividers then reaches to VPLL, VPLL receives this 200MHz
>> request and call  zynqmp_pll_round_rate to "round" this out-of-range rate
>> 200MHz to 1600MHz via multiplying by 8. zynqmp_pll_round_rate returns
>> 1600MHz and clk subsystem will call determine callbacks to configure
>> dividers correctly to make sure that dp_video_ref can get an exact rate
>> 200MHz.
> 
> Sounds good to me indeed.
> 
>> But the commit 948fb0969eae8 ("clk: Always clamp the rounded rate") adds
>>
>> req->rate = clamp(req->rate, req->min_rate, req->max_rate);
>>
>> before
>>
>> rate = core->ops->round_rate(core->hw, req->rate,&req->best_parent_rate);
>>
>> This results that .round_rate callbacks lose functionality since they have
>> no chance to pick up a precise rate but only a boundary rate.
>> Still for Xilinx Zynqmp, the 200MHz rate request to PLL will be set to
>> 1500MHz by clamp function and then zynqmp_pll_round_rate does nothing,
> 
> I'm a bit confused now.
> 
> If I understand your clock topology, you have a PLL, and then a divider
> of 8, and want the final clock to be running at 200MHz?
> 
> If so, the divider should call its parent round/determine_rate with 200
> * 8 MHz = 1600MHz, which is is still inside the boundaries of 1.5-3.0GHz
> and won't be affected?
> 
> Why should the child be affected by the parent boundaries, or the other
> way aroundSorry, I didn't explain the problem clearly.

As below is the vpll clk topology in /sys/kernel/debug/clk/clk_summary 
when reverted "clk: Always clamp the rounded rate".
  clk_name				MHz
  pss_ref_clk                          33333333
     vpll_post_src                     33333333
     vpll_pre_src                      33333333
        vpll_int                       1599999984
           vpll_half                   799999992
              vpll_int_mux             799999992
                 vpll                  799999992
                    dp_video_ref_mux    799999992
                       dp_video_ref_div1    99999999
                          dp_video_ref_div2  99999999
                             dp_video_ref    99999999

When call clk_set_rate(dp_video_ref, 100MHz), there is a 
clk_calc_new_rates request passed from bottom (dp_video_ref) to top 
(vpll_int), every clk will calculate its clk_rate and its 
best_parent_rate. vpll_half will calculate its clk rate is 100MHz and 
its parent clk vpll_int should be 200MHz since vpll_half is a half 
divider. But vpll_int ranges from 1.5GHz~3GHz, so it call 
zynqmp_pll_round_rate to calculate a new rate 1.6GHz for itself via 
200MHz * 8 because 8 is the smallest integer:

zynqmp_pll_round_rate:
        if (200MHz < 1.5GHz) {
                mult = DIV_ROUND_UP(1.5GHz, 200MHz);
                rate = rate * mult;

The question is that implementation of round_rate callbacks for some clk 
drivers have abilities to round a out-of-range rate req to a 
inside-range rate:

clk_core_determine_round_nolock:
         rate(1.6GHz) = core->ops->round_rate("vpll_int", req->rate(200MHz),
                           &req->best_parent_rate);

But the commit 948fb096 ("clk: Always clamp the rounded rate") breaks 
this like:
clk_core_determine_round_nolock:
	req->rate (1.5GHz) = clamp(req->rate (200MHz), req->min_rate (1.5GHz), 
req->max_rate (3GHz));
	......
	rate(1.5GHz) = core->ops->round_rate("vpll_int", req->rate(1.5GHz),
                           &req->best_parent_rate);


Thanks,
Quanyang
> Maxime
