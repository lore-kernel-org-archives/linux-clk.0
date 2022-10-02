Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2425CC433F5
	for <linux-clk@archiver.kernel.org>; Sun,  2 Oct 2022 02:18:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbiJBCSH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 1 Oct 2022 22:18:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiJBCSG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 1 Oct 2022 22:18:06 -0400
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BED543DBD1
        for <linux-clk@vger.kernel.org>; Sat,  1 Oct 2022 19:18:04 -0700 (PDT)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
        by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2922HcGH007056;
        Sat, 1 Oct 2022 19:17:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=YhT7Z519cHTmPmRVBCIWn3t91LeFDntpR5myHUGAboQ=;
 b=Bo6BcEDrVBC4W5z+WwfiMqCYZnTqhb4NJMJCWn7D2CJLgvh2Zb78eC9SSS3Sh/5u0yKD
 c2j3tIilfDtKGiGT1LBlbkveINB2cC4RIyJ6W976wmnYkBOah6zlgUugIdMVXMVKqMOT
 nfCiRmOOVkCmkNZMKkoJAsAPeyqVrrq1EfSKAICQQbEaVudfquj3ZCtLFfhh1KpLp4h8
 rtpS13j3OdX3J17cxZcIWVD+offuQztM0AFz2HsSOZThyutBQ0mqkZlpLnX0vtQHRqBQ
 tjX+eFRqtXiubE4H7X+dRUVNAe93izWFjzi/kumR4DgET8o0OdxtsxC8YPeBfNiXG6gM /A== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
        by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jxn2krf0w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 01 Oct 2022 19:17:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fR3K8WNe0PpvK8Ii4Uf/ZuyHTD+n+32k3jvap7WbPYKR44hasoUgH+HytlxKCg99DmpDmcl4tDVX/xdDWLuZW0sOtH6Qmwr+EjC0UH+v8r8OeAwnU1ZbwKdtZtAp0bkHqS/KlVm4tgrWiqdBh0PLgAcVasWNROUrmRqmCqOZxBH0VJtN1jtYbP3SfLByTLxsrYHAzTD2gIzz//i8B02ht/H9jKaHnrYjJSC05sE9deKIGzjEAJrLB4olyOQGmiOMdeoPkY1IlIWs/c8aM6HstNrYNbGF9xNFU9z2GtLCQvkPKjd12vsvJSjCQoRpdU7uXx51f1ShS9m+k3ahHYTFMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhT7Z519cHTmPmRVBCIWn3t91LeFDntpR5myHUGAboQ=;
 b=XPy7hi1GqHpeNA9wslpduG3o/m8YpnveX/gzFwsHdkUD/iWqhCXHtV+4llkCMI1BLcewE7BekrvsZwCoLfL+WInb8HvVJsYGQ0lEfQABmpL2Ym65qPkG19PAKOdJAjUmrmJ+6CxM92PZ2B+3XLoDzyepeVouYKs4H0+s5Dtyvfu9qVpft488wUMzYb40BlOHXQZIUVJ2Ux3wcznLUvVZgI677au1fBnFHiTb8DtgBfEAqvI/Le6sAklVReXBmtZReRJDQ7Us8zy0IUxmtgNJDjN+I+/Tuk9RPiTNTHZgmCi+1L2pAKE5fKkyMVdT2AFoUMO/WiqAcp67lXp0DgYg4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5630.namprd11.prod.outlook.com (2603:10b6:a03:3bb::6)
 by PH0PR11MB5061.namprd11.prod.outlook.com (2603:10b6:510:3c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Sun, 2 Oct
 2022 02:17:34 +0000
Received: from SJ0PR11MB5630.namprd11.prod.outlook.com
 ([fe80::5533:5ad9:877a:474d]) by SJ0PR11MB5630.namprd11.prod.outlook.com
 ([fe80::5533:5ad9:877a:474d%9]) with mapi id 15.20.5654.026; Sun, 2 Oct 2022
 02:17:34 +0000
Message-ID: <ba5bb9dd-8a4c-3f24-c7e2-c8469ef693be@windriver.com>
Date:   Sun, 2 Oct 2022 10:17:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] clk: zynqmp: pll: Fix divider calculation to avoid
 out-of-range rate
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>, Stephen Boyd <sboyd@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Michal Simek <michal.simek@xilinx.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>
References: <20220928201656.30318-1-laurent.pinchart@ideasonboard.com>
 <11481209-7c8f-7543-1e04-5723ffc2ccd4@windriver.com>
 <20221001000503.23268C433D6@smtp.kernel.org>
 <20221001104001.r7r2utwymm32tv53@houat>
From:   Quanyang Wang <quanyang.wang@windriver.com>
In-Reply-To: <20221001104001.r7r2utwymm32tv53@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0211.apcprd06.prod.outlook.com
 (2603:1096:4:68::19) To SJ0PR11MB5630.namprd11.prod.outlook.com
 (2603:10b6:a03:3bb::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5630:EE_|PH0PR11MB5061:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eb62460-3ef7-46e2-ae04-08daa41c4438
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W4uwWwLgq4TvmW6qbyEqlrQVPWOx2hsUXhPaw/naQG8rLNSWs77hBDnk+s/K7sqn7ZTqfx60C4zRNgY3sOmZ8zwz65L/cSiQNfFjlRJSq4I8qWajxmiAHIrR4u5Lyn5ffiUQqpJetUehSVHunxkQ68yPJO160bAO+gTTAIlAqQHtnzHEvf5zCbVoFVgJSq3fQKueulQkcYs0Ji+UIBQKuNtRcz7d+ZZkRLedkQTjIZVK0kbGbMhmWehkZsd+79QllT4UyMvbsX6WaysfCo/rqxeIOx9mYaaLrZ18vxA8XF7naC09rsV2okSt982kkPHFVoI2Cvn+qiCuH9bX0m96n086R8sxtwE3MJyEvVup1JtsssUkho9RzG+BkoNCXP+O0O04QOexIJUhHKvmR6ExYOmch3Owkc30XFZI1NmUR6imKcP9jfe8D8qAXpIg2e8IcTmvay0EsJuL6k+3MGJ7dAKF5i5fmMzRrNahG0dflYP2ldUp4YaQv0KUgqpaCHPyTZ45rS3iNz2rOpAy97NFGltuy+ZPb/JQoct5tPHZSJFIzDOCOhN/yySo5fJ4S933pZB9SwpRRkqd/4EUWnNau8/oH9KwHSaM3MhhK8pWc/JaSai+kYHeYra/6GiEjK7ERvvca4G/gYU/N4Sgb49Hk6kCNt4Zof1AguEQwLbXGDkYhAly5nVtj4QCPCXNP6kLWv9Cqz99Da9fEgY24TMC1QNiMrHZoWoMW+3GzjEeyDwN4hLbx43koJi2CliF9og3tk+n7XQJwsyJoqrYNZ3XlJ/GEOm/k4cgSYWwBk6mMkuVSAlJ57s7vY4rZ7ii9fFh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5630.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(39830400003)(366004)(346002)(451199015)(8936002)(5660300002)(31686004)(44832011)(38100700002)(83380400001)(2906002)(86362001)(41300700001)(966005)(6666004)(478600001)(110136005)(6486002)(54906003)(186003)(2616005)(31696002)(36756003)(4326008)(8676002)(66556008)(66476007)(66946007)(316002)(6506007)(53546011)(26005)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFROeE9yNVpzeXhSYVBhWGdPU3F5YjVITFVmSzJCNlZwS3FKdkU0RHo0bEZr?=
 =?utf-8?B?S0ZBZnArbjUyNjh4SCtDUVNHZmUrK2dZNmxPeE1VTzJGUGtSMWNPd2toNHdD?=
 =?utf-8?B?alpURmtFR3pLZzc2MVpKT0FHbDlYOEFLdFJVRHFIb2t6RTd3L3hobDFuNTBi?=
 =?utf-8?B?TS85dG54RnVNdjF6aDRXU3I5eVFEMlVCb1ZQNisyQmZXa2RNSFFZQk5maUJU?=
 =?utf-8?B?YnVRSVMzUzJwWEI1TGVzQlRyQ2NudHVlbXVtZDhVNmdaU1RkMG1NZ2dVYk1a?=
 =?utf-8?B?MUk4VzZQUFZ2MFF2SGpSSk45Q2VkMVJnRHpaSEhtV3BoQjYxc2FSb1AwLzhF?=
 =?utf-8?B?eG96YWlzcEFHOHNBT1VYKy9qWFBhUFpzaVc3QVhDZE0xNW9PQjlWKzY2bHJ1?=
 =?utf-8?B?eFZOVE83bHBIdzZRcHVuSXA2dHFROTdVSVBFZUtHTWxKWnRvU1N0WCtWa3No?=
 =?utf-8?B?QnVyUkhicEpMU3A3d3k3Q2JmOW9tc1M5aUtLYkQ3VlNMNzhoZzBPRTVUNTRs?=
 =?utf-8?B?ZnhOOWFpbmxJODJKMVZ0MHRaSEJOUE1lbnRSbVhJdEs2dXlyNHB0ZHpyYlo2?=
 =?utf-8?B?djZzK2E5eGl2OTY0ZTYydjdtL3BYSmMweVdXWDZVLzFHR0VuUWxSQnFXdTZR?=
 =?utf-8?B?cGFrREpaY1BDMFhFbXBkd1BvSllzK0RQSmk3WGx1MW5ES3ZJZmtFSEZUTVdK?=
 =?utf-8?B?QnVZRWdzWERCSElCb2Q0NkFjWitwM3VKN2tvMnI0RWJOV1I4RU13VHJaVElL?=
 =?utf-8?B?UG1jeEoxcngwNkE1M2ZkbGhhVXF3SGdSSFQzbTIzbzFSMXFVVTRFc3c5MHdn?=
 =?utf-8?B?WGp2VUVJRnYyaEFVMlRGdFg1OWVkdFIyQmxIbmNEdzA3V2dtYnlsRUlGQ2Zv?=
 =?utf-8?B?am5mbFdBNjdjUHBYaDNEZ0FtN2JYL0ZBM0R1dVJ1NkRvWUhoMWlIQVRkWG9k?=
 =?utf-8?B?K2xYL1dkTEhSNnczK2Q2OHc1YmVpV3RFVjFRWk5lNmUvcmIrZkZWU2hTRWxp?=
 =?utf-8?B?bXd4SjNEVHY2UkQwVzUvb0xzc2RHYWFuT3pmb2N6WGVBaEVpb0xoOUQ3dEdO?=
 =?utf-8?B?WHpOUW41UFd1QW5oUHo3Vk43ZjZIU3NmUlpqV2F2TWprbDJITGtmUEQwVjU5?=
 =?utf-8?B?WDZUSE9hY3ZFeHc5L2g2NEpSVVBCODhUMm85VCtFWFZjS0VEZ09pWkdockZz?=
 =?utf-8?B?YzN0OXVKYlR1STZwOWxtSnZPaGRibWxzVEI3d3dCQlloTzJUUVBhZVlyaTVJ?=
 =?utf-8?B?ZDYvMjFuWTNMYjZlVFNmaFllYUp1bC9WWVh6VG8rbHJGalBYUnQvL2RBR21J?=
 =?utf-8?B?TGp6STVhOWY4aTZGNE1wVG9kTWgxVnhFZUlxLzRGalN4T1ArRG84ZE9FOU5T?=
 =?utf-8?B?ajFWQlVPenlUK2JKTm16Q080ditadUJTQkx6MitTdC9YMzkxMkZPKzAzOEJF?=
 =?utf-8?B?NmljTkZ5czdMZ0VVa2RSTk1BcEV3WHY0dzA0Sm5EWVJuVjBUd0FqUmRrYXd0?=
 =?utf-8?B?aUNZZUNxRWk5NzQzelJvcllaMVZxdjhSUTkwYUVabGVWRFI5N0thSFIyY3Jp?=
 =?utf-8?B?MG1Id3FCRDZ3WUhZejBuVUoybDFDSGI3YTY1Y2ZwTlZXWjhCeVpqMFdNV013?=
 =?utf-8?B?T0JTS2xCM0wrdjRTWU5RcGZxZGsrN01NblBmVVBoVzVRcnhYZFBxSlNTV2Iw?=
 =?utf-8?B?dmZOYWpKRWJPb3NzY3U4TXIxdmI4cHEybnBUSmpPemRGMFl6ZmlnOXQ5WkRI?=
 =?utf-8?B?QTlKN25XZVU5NG1MU1hTaGRMek1YMk4xQzZVZXNIWGpKay9aMTdzMHA3RlRy?=
 =?utf-8?B?dzAyZGMyamttQ1FuTlhMN3A1Vk9TK1lZNjcxbGFUYzlQdGtlWGJVcEgrSHpE?=
 =?utf-8?B?WU9IakJoNG0vQ2pzR0xoempsSHlhTjhEZmkrSHRuTUtuNUpvN2s3MVREaitO?=
 =?utf-8?B?NWI5VDJDalVoR1BERlloVDlJVVA2YktLYjBpbjRSck9ZK3hTMENma2VqTGFR?=
 =?utf-8?B?cGJoclFKeDVVWTFDMlFhaGppQy9qUERVSzg4R1BPMng4VXFJem52V0tzV21m?=
 =?utf-8?B?YzNDTGlKd1k5S09XajA0UGM2Qkt4dCtLeisxOUZIb3E2RUZzQ29GdkJpanJz?=
 =?utf-8?B?cllRUkxFRUtiSU1MMEtoOERmekhzbmRHbVoyNXN5UENxUHFrb3F4VkJTeHZW?=
 =?utf-8?B?aGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb62460-3ef7-46e2-ae04-08daa41c4438
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5630.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2022 02:17:34.1025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lj6PbqvF0ypTNM7kd30CnPDQOj39BKjZD9Cj9GK/zWDSasKhrF3VU+qDwQq303qpij3ZFQxzzy43fkiKzo6GNsFmqn1NE8VGQoQNBAyYNoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5061
X-Proofpoint-ORIG-GUID: jJ31Parz5UktYTibEggDjelLvAwATuqO
X-Proofpoint-GUID: jJ31Parz5UktYTibEggDjelLvAwATuqO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-01_15,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210020013
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Maxime,

On 10/1/22 18:40, Maxime Ripard wrote:
> Hi
> 
> On Fri, Sep 30, 2022 at 05:05:01PM -0700, Stephen Boyd wrote:
>> +Maxime
>>
>> Quoting Quanyang Wang (2022-09-28 18:05:10)
>>> Hi Laurent,
>>>
>>> I have sent a patch as below to fix this issue which set rate failed and
>>> it's in linux-next repo now.
>>>
>>> https://lore.kernel.org/linux-arm-kernel/20220826142030.213805-1-quanyang.wang@windriver.com/T/
>>>
> 
> It looks to me that the fundamental issue is that, in some situations,
> the round_rate implementation can return a rate outside of the
> boundaries enforced on a clock.
In my limited view, the round_rate callbacks should return a rate within 
boundaries as output, but can take a rate outside of boundaries as input.

Take Xilinx Zynqmp for instance, VPLL's rate range is 1.5GHz~3GHz. A 
consumer dp_video_ref wants a 200MHz rate, its request walks upward 
through multiplexers and dividers then reaches to VPLL, VPLL receives 
this 200MHz request and call  zynqmp_pll_round_rate to "round" this 
out-of-range rate 200MHz to 1600MHz via multiplying by 8. 
zynqmp_pll_round_rate returns 1600MHz and clk subsystem will call 
determine callbacks to configure dividers correctly to make sure that 
dp_video_ref can get an exact rate 200MHz.

But the commit 948fb0969eae8 ("clk: Always clamp the rounded rate") adds

req->rate = clamp(req->rate, req->min_rate, req->max_rate);

before

rate = core->ops->round_rate(core->hw, req->rate,&req->best_parent_rate);

This results that .round_rate callbacks lose functionality since they 
have no chance to pick up a precise rate but only a boundary rate.
Still for Xilinx Zynqmp, the 200MHz rate request to PLL will be set to 
1500MHz by clamp function and then zynqmp_pll_round_rate does nothing, 
dp_video_ref will finally receive a rate which is 1500MHz/8 = 187.5MHz.
The rate gap (200MHz-187.5MHz) happens.

There is no doubt that round_rate should return a valid rate as output. 
But is it necessary that forces the input of round_rate callbacks to be 
within boundaries?

Thanks,
Quanyang
> 
> I think that's the current behaviour (that was there prior to my
> patches) to reject any rate outside of the boundaries in
> clk_calc_new_rates() makes it clear that it's not something we should
> allow.
> 
> I'm a bit two-minded on this though. All the failures of that test I've
> seen actually turned out to be bugs, so I guess it's useful, but it's
> also true that for rounding errors it's a bit overkill. We could also
> relax that check and warn instead of failing.
> 
>>> As for the frequency gap between the requested rate and the actual, it's
>>> because of the commit:
>>>
>>> commit 948fb0969eae8
>>> Author: Maxime Ripard <maxime@cerno.tech>
>>> Date:   Fri Feb 25 15:35:26 2022 +0100
>>>
>>>       clk: Always clamp the rounded rate
>>>
>>> And I haven't figured out how to fix it.
> 
> Again, it boils down on whether or not we should allow a rate outside of
> boundaries. If we don't and if the clock can't do better, then yeah, the
> rate difference is fairly big but we can't do better.
> 
>> Maxime has some more patches to fix this and they're in linux-next.
>> Maybe those fix this problem?
> 
> I don't think they will fix it. However, depending on the outcome of
> that discussion I can send more fixes your way :)
> 
> Maxime
