Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA70BC32771
	for <linux-clk@archiver.kernel.org>; Thu, 29 Sep 2022 01:05:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbiI2BFm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 21:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232166AbiI2BFl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 21:05:41 -0400
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49ED67DF68
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 18:05:38 -0700 (PDT)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
        by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28T0tSCn003340;
        Wed, 28 Sep 2022 18:05:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=9GrlrQxR4weXAbB9Y//CtNeKn9K5yh5F05QVia9xM20=;
 b=chFnGqw/8NMbFR/+pwVDiszji3xtUNEp1hBCul6GmFWHENSMNbeHPE4LbJ+kdU3gMoyd
 Yvsn1HU4ZbX5tBWNIt88UD2xl/sM6wpXf/Jr3iv6MAMbfX/1Bq7ySukglgAvaB2M2Cf4
 YItvWSa3F/q+BJ2k3OumaHj0Eaat164heH5p5ZtqF/UyiGgEaumTvIDTNhymj880Droc
 1iRtsXNpspVCMY8A0WgGA+j2uyStbGHMjIghDDRL44acA1DuOTOHc3T7zcHv4kwJqEyb
 sHjQ9abK+ctN6Jz5pwRdBS3XdmQ/uU3uiLpNz8ynh41vHFYlOa9O8kBzH148UQ0gvlrk lQ== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
        by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jt1dkbseh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Sep 2022 18:05:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGdKoeAV9eXdo8WBido7H1kdtbUOl4HopAYu0dURw9zoHqnLH1JRdqJqZHWu4DNUL0zu+hmaGbRwN0XArOWjeJBhbKG6uXiP47HEhMYmxO6+qQ3T6Ioc81t9DY6wZkXlcbvKqg3ViRLb+MW65jvE9N41Mj1HnUUlK6VEXCA5jn8FQPhel/eyPbL2a5qUzwSDtWBEaHAiTr5t7WoDeU0CZZddLHq+wFCO49ilTRol0nSOCKdNOra1mYxQrwlH6hwKJDNYcYDY1IqoJq9t1/AG4nTKARw+N7VqrcqhvHdha0eojCoXmi8/kyJ9juL1PzLI4SK/Re6q0Pike6zKGL3Giw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GrlrQxR4weXAbB9Y//CtNeKn9K5yh5F05QVia9xM20=;
 b=KVSDVdgN2NBcRV3+npbheRTGgiWVCXxsnrnZbgMR8agza2HsGkw3gcu8B58t+nioX/Fp9AZqGB8QmtIJbMwFi7ymDZczF7FnafmGJ+DqfLUwhJZNHg6PhvJp2FX7LaUq3ri5LI7h+SzuN3mgm2qGHOHFwdX744K67k5WCJIzCNRKCC3GU7+RT022sSSbKHa/XH3zIv7K3WiUEPTIiypOcvAv/RfBcCelOzpoNvWC7+fZsU9hXKBmYPreBWq6T/nnTKaqw3uw9il9ObHjlNLzu/tjWteHRL3MndYKbdiuRx7oHibP8qiAoINpppdYUtDebPric+/4+ERc4Hjwc1awdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5630.namprd11.prod.outlook.com (2603:10b6:a03:3bb::6)
 by BN9PR11MB5418.namprd11.prod.outlook.com (2603:10b6:408:11f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 01:05:18 +0000
Received: from SJ0PR11MB5630.namprd11.prod.outlook.com
 ([fe80::5533:5ad9:877a:474d]) by SJ0PR11MB5630.namprd11.prod.outlook.com
 ([fe80::5533:5ad9:877a:474d%9]) with mapi id 15.20.5654.026; Thu, 29 Sep 2022
 01:05:18 +0000
Message-ID: <11481209-7c8f-7543-1e04-5723ffc2ccd4@windriver.com>
Date:   Thu, 29 Sep 2022 09:05:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] clk: zynqmp: pll: Fix divider calculation to avoid
 out-of-range rate
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Michal Simek <michal.simek@xilinx.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>
References: <20220928201656.30318-1-laurent.pinchart@ideasonboard.com>
From:   Quanyang Wang <quanyang.wang@windriver.com>
In-Reply-To: <20220928201656.30318-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYXPR01CA0052.jpnprd01.prod.outlook.com
 (2603:1096:403:a::22) To SJ0PR11MB5630.namprd11.prod.outlook.com
 (2603:10b6:a03:3bb::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5630:EE_|BN9PR11MB5418:EE_
X-MS-Office365-Filtering-Correlation-Id: 110efa19-76c0-40f4-759e-08daa1b6acc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xb0kpemwrHkZH4+GUPtGnbqIH1MAsg79JmjRuoMwFHvAPizwW+5JxOxyr7AUOn/hRV0LoXUn+VaFoqQvGPgMsL2bqIvt1ChaEcYOU8ecVf/UTPG/dATfdGwLoG1wgMAN0ItsUEG+5T5tKPstskKyMFyZadg0Kto/IwBDw81qrvOaEEufqjJsmNNQRGUuo/KLGKqNN5xvP4GPOAfk4rTEPfvP10OFw5zsLZ5EMG0+yhxZx8HYAlwYGqdcKAdd+BJPNkQuf1DbikHM3swYA+rlLE/alvKAC7rTGP5HcpRxtduj1AOkzwHTkA2Kp24YDm1RO+t473FcVD0Jn+eIGnno1bFHjzlARIu4YX9pgye56g4q81oD5X/YUB3ZoV3/3O49GHwrw15wjUwqyPK6Hy+UTJLo8H4IGRDBgyEp1dPBjuuNe2Mh4mLz72nBLsB4PyRRK1xQhHp3KiBT0mfI1fy4ey3ZRYbwRJQWnlipg6cPj4v0Zp6pvBFoInuJV97Cvg1CiHlx+3q9BJXf6tAHY+jYyXBeeQeLRbtnIHQrZxaXF0XLp/9SY2KGMvkdanEVhezszrAQiTK3GaT9ks7wQN+0v0/MIykAXiIqSm04STYnpbZTFkLTmr5bZoiwbvWpMMx8Utn/eR9ZHQBVRreOpoCzivrJdRxte68OGcdtk1w/ZKsWi4f803TDrJHqKI2LYRdLZuzY2n3yawdlQH+JZzExS8CpzckFDWr+B9fSyWvMunBW/YogoF5EcDSMwXQ1JaXOFxvOhX/3J0L+4csFG3Sp9aGcTBx0mvR0e0uWzjjD954CityuWyLTDfZN8jzanKvY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5630.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(366004)(39850400004)(396003)(451199015)(53546011)(2906002)(83380400001)(966005)(6486002)(6666004)(6506007)(478600001)(54906003)(36756003)(38100700002)(316002)(66946007)(8676002)(4326008)(66556008)(31696002)(86362001)(44832011)(41300700001)(8936002)(5660300002)(31686004)(2616005)(186003)(66476007)(6512007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGxPdnorMWpuRzZRNWZEc2ozY3RJdWQ0SmlYdXoyMFljVFJ5RitEemtUSTJn?=
 =?utf-8?B?QjJLQzVvZnZVd24vNDdxaURpLzRTbDU0RFNERlE5K2Nwa1J0Rnd2bTFyY2xz?=
 =?utf-8?B?eWRoY2VsZ2gwK2F1OTc4Sm1kTFdlWVBwSzBNR1lSK0lOS2Vtc3JzRFFIcEJO?=
 =?utf-8?B?clZIMk9iR0VHdEJEeHl3QzIzZjRBYXNOSzVBc3pmQldVbndUOWdhUk1kQVIw?=
 =?utf-8?B?RjZMNml4S0ExRHBoazNaU3hRbVJPY3ZJVXFUL3JJeXVSQlFJNnpET25uaGtj?=
 =?utf-8?B?VEdPZEFJL0R3TmxNckk5eVFFM1p4eFMxSGduRjdFNVB2ZnQrWUU5c3g1UVFT?=
 =?utf-8?B?d1NVN0poVDdQY29OdzdFTFdUTTY1RnVMcDFmUnFETEpzQmplbXY3MDJPOUNE?=
 =?utf-8?B?UnNhYitNbmFIUmpxMnFISm1ZWFNLZXJQNm9FU3UxWW55YVMySkNINk5wY0No?=
 =?utf-8?B?N0c5TVZkclZYNCsreGhoOGRTaFFraUZnYVNSZlI2RW0vWFdRN2t2bHpNRUFy?=
 =?utf-8?B?UHR0bFloK2h3eFNReGRJRjhlZzNGbmpoaVVxcEtFTG5IVXhucE9GcHlKc3hX?=
 =?utf-8?B?Zk9oOTZodG5FeXJGZTlpTkY5eTVGZ0dOQVJjTUd3bmhUZ3NiMnBic2tub0pL?=
 =?utf-8?B?Z3kzNExtcGg2OHlqbjN0RTFtQjFQRzZjYUJxcGQ2Y1VuR0RoY2NPdThtd1JF?=
 =?utf-8?B?LzJCZDRQd1Z4M3ZURTk3MmJsMzJEYmlvcWxNd1FBZ2RFVTIvRlora0ZMdzRi?=
 =?utf-8?B?S045MkU4TnlFdllrRXoyeGl1R3FhR2tVWkhPMzBreEg3dlk5QlRoeW9Cemx1?=
 =?utf-8?B?WFVNbEg2bFBLVTljNDBiN2pzdUY3Q1JiV1dxSHQ3WjUyZnZqUjZ1UExUTGxG?=
 =?utf-8?B?R3o0RDNGckZiK0I5SVcxb3Q0WXNSdldZcWZlUmV4VzEydGxjN3RCT1hDZjlB?=
 =?utf-8?B?K2ErV1dIRmgyWkttUWRhTHJEdHFhTjVBOSt2V3NLVmQrdC9jRFZZNWl6NHpu?=
 =?utf-8?B?UUQ4MkNvQlhZVGhwWnI2eklvWjFwWk9GQlhtNldWMmhadXNRYW0rL3IxdUJS?=
 =?utf-8?B?R2dmdDZaSldOMFozRGlwUlF5OGdBRkNtbnhpeVQ4VDljRHdGZGtiODlhaXBn?=
 =?utf-8?B?SVE2NUE0R2pHUUszNHRYODl3NUdBamEvZjdybW9PU0tod2U1RklnaDZPRStR?=
 =?utf-8?B?V0lYRUxWTkFTdXBjZ25UWTNnMktXM0ZtRERBSjFCTmtLVHZBL1JuajI0UDVT?=
 =?utf-8?B?RnBuLzc5d3Jpd2g1cGN0YnRTbWUxSnQ5WkhTNE1FaUpLRFVldkV2bHZCenpx?=
 =?utf-8?B?VFBJbXVEVEVWOWN5RzUzMlEvOFRkZllMSDVESjRneWs4WXFoV01kOGRaQWVo?=
 =?utf-8?B?NkE5c3p3TUpvSk5LSnl3MUNveGNIU3ZQL1k0dkpMeExISW1XR3NuY1V0Nmsr?=
 =?utf-8?B?SE1rMHV2b3BMM3BocFptNzhYNUtQQUh6cVp4cHNZaU5BVzlQQUs2T09WK3Yx?=
 =?utf-8?B?ejlQbE5FNTBxQlVIcmVucDVTMWJpOFpYaWJiR2pnN1pPLzZuUUR6UEVTWUFH?=
 =?utf-8?B?VHVNMFNPamZONllQd2RKTThMUFZpamo1dXRpcHVuSTdYeUd3V2NzTllyejYy?=
 =?utf-8?B?ZlFqUFQ5bGUvbzZ5bDlSc3BEcVVlakVMNTQ1UG9xOHl0a0xtRS9HVFdKRWpn?=
 =?utf-8?B?MnZBSUllU25KZ3gxVER3YTd2U0dkMDJ3U3dHUlZmSDd5eStkNlpDbWZMVjdR?=
 =?utf-8?B?VnZmTHJMa3JYQnBpWGRDVHNrOU8rUi9QeFUrY1Uxd05xWkR3TnBEajRZVVMw?=
 =?utf-8?B?TnQxd0F5ZXVBbXNCV2VpWkRPL3hQRGZJcWY0NGlSZVdDSVZ5SWlMeExPVDJh?=
 =?utf-8?B?dzhhZlYzR3JjKzJFTWJ1WFhmVFlEaWM2YmhwL3JBamk1WlA4ZFYrL0lBR3dW?=
 =?utf-8?B?V0pFWm5zMXc2L0o4cFVMQXY1MnRKblFFa2NUbTNOK2xjQ1VGTzR3b051ck1v?=
 =?utf-8?B?K1E1T1YyWHRjaXdrOVpmVEVCYzdwMkR0cEovRnNUQnVHMEFYMlgreGN1S2th?=
 =?utf-8?B?NWxVWXNFZzI1ZzY1UmRRV3I5QjRrYytNUWhPUkxCUTVBKzZvZGpvTEMweHNw?=
 =?utf-8?B?eDZxOXZndk5Kc1ZIejJ3WVBVTmlLKzZOSUNJSnlYSTRyaTlPWW8vVTZMZGVK?=
 =?utf-8?B?NWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 110efa19-76c0-40f4-759e-08daa1b6acc6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5630.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 01:05:18.6309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jEV+ncVV2kqABhOGbnb5AlSi6E+qblzC4Dg8ehhDwIMIxhinHViEUhXf0F51hEq49/9kj0aPxOAopwuR2gC1/Xr4Q7MCpOZhmTlnRzujctI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5418
X-Proofpoint-GUID: zq9Qpiv6bMnGBDXRsflIYKs1xuF_a2hU
X-Proofpoint-ORIG-GUID: zq9Qpiv6bMnGBDXRsflIYKs1xuF_a2hU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_11,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 clxscore=1011 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209290005
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Laurent,

I have sent a patch as below to fix this issue which set rate failed and 
it's in linux-next repo now.

https://lore.kernel.org/linux-arm-kernel/20220826142030.213805-1-quanyang.wang@windriver.com/T/


As for the frequency gap between the requested rate and the actual, it's 
because of the commit:

commit 948fb0969eae8
Author: Maxime Ripard <maxime@cerno.tech>
Date:   Fri Feb 25 15:35:26 2022 +0100

     clk: Always clamp the rounded rate

And I haven't figured out how to fix it.

Thanks,

Quanyang

On 9/29/22 04:16, Laurent Pinchart wrote:
> When calculating the divider in zynqmp_pll_round_rate() and
> zynqmp_pll_set_rate(), the division rounding error may result in an
> output frequency that is slightly outside of the PLL output range if the
> requested range is close to the low or high limit. As a result, the
> limits check in clk_calc_new_rates() would fail, and clk_set_rate()
> would return an error, as seen in the zynqmp-dpsub driver:
>
> [   13.672309] zynqmp-dpsub fd4a0000.display: failed to set pixel clock rate to 297000000 (-22)
>
> Fix this by adjusting the divider. The rate calculation then succeeds
> for zynqmp-dpsub:
>
> [   13.554849] zynqmp-dpsub fd4a0000.display: requested pixel rate: 297000000 actual rate: 255555553
>
> The resulting PLL configuration, however, is not optimal, as the rate
> error is 14%. The hardware can do much better, but CCF doesn't attempt
> to find the best overall configuration for cascaded clocks. That's a
> candidate for a separate fix.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/clk/zynqmp/pll.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/drivers/clk/zynqmp/pll.c b/drivers/clk/zynqmp/pll.c
> index 91a6b4cc910e..be6fa44a21e0 100644
> --- a/drivers/clk/zynqmp/pll.c
> +++ b/drivers/clk/zynqmp/pll.c
> @@ -120,6 +120,10 @@ static long zynqmp_pll_round_rate(struct clk_hw *hw, unsigned long rate,
>   	}
>   
>   	fbdiv = DIV_ROUND_CLOSEST(rate, *prate);
> +	if (*prate * fbdiv < PS_PLL_VCO_MIN)
> +		fbdiv++;
> +	if (*prate * fbdiv > PS_PLL_VCO_MAX)
> +		fbdiv--;
>   	fbdiv = clamp_t(u32, fbdiv, PLL_FBDIV_MIN, PLL_FBDIV_MAX);
>   	return *prate * fbdiv;
>   }
> @@ -208,6 +212,10 @@ static int zynqmp_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>   	}
>   
>   	fbdiv = DIV_ROUND_CLOSEST(rate, parent_rate);
> +	if (parent_rate * fbdiv < PS_PLL_VCO_MIN)
> +		fbdiv++;
> +	else if (parent_rate * fbdiv > PS_PLL_VCO_MAX)
> +		fbdiv--;
>   	fbdiv = clamp_t(u32, fbdiv, PLL_FBDIV_MIN, PLL_FBDIV_MAX);
>   	ret = zynqmp_pm_clock_setdivider(clk_id, fbdiv);
>   	if (ret)
>
> base-commit: 1c23f9e627a7b412978b4e852793c5e3c3efc555
