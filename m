Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E95C433F5
	for <linux-clk@archiver.kernel.org>; Fri,  4 Mar 2022 20:54:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbiCDUyy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Mar 2022 15:54:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiCDUyx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Mar 2022 15:54:53 -0500
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D895AA60
        for <linux-clk@vger.kernel.org>; Fri,  4 Mar 2022 12:54:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcwrpQTeMmteS8d+uTP0neNbQLhLQZl4qw6jDD4adAHgsNcUJsHTrhCoDTDjRBHG45SZ1x28EyfPmNwVHds72wT3kLP9dafGrwET2rIF74MiLd2DUhf36vBzTn66VqJMWDU3d7YjyYwH5fsId87IClR7zerRorbrgqcqCR5sojYBGNb81hzqBTqcka6a4KagCberrzC8NdLzQiyBg8m9qMT/hakUa9j3M8wYLnxWcoKRPr5CFGPqjqDtKdHXVnYPQjN+0bQqpJe7eNy7lEv6Xim7sZyr0rZGtzUK63SapwaL98fDtXe7M0R/NN+uXScHPB73bNISqWH3m1CcwAmVkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0CxP1d9vP766kVpvNYoKRCmLECrjP5tdadplyyijkQ=;
 b=H1OhxqnEG5j0dAY79YkIP5BjByyhpkTYe1kRDnGUht1EvACL7Wi8VmjS8UcVRF0y4BdQcepX+eVYs7R+9Lk42yCVbG9qvTSpS8fWR9zZ2uUx3jWgf2zNMNW3tOkFwiAuAf9pzo51Qp2gOSR4WDop+JpnZlHB+mvsWsOy7ukPZoz4Rh4A6pwDapEW54V5CBAu0agtmHAiytQFaMDvU9opxZwHxU9i+7+EpsvuTZhW127QQp8JNFgQElOAcyL5sF6C2xOJ19UMFOSOKzUHgAkCG6m0LTDDNPoCY2iTBpKbQZB7Zmpr8FMveSk5JEn+59aEw0W60Kj63hBot7Rg3dYruw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0CxP1d9vP766kVpvNYoKRCmLECrjP5tdadplyyijkQ=;
 b=pDHxDubNuzA1/c9w7O+hJQZ25I9zyDMrpV/K0sOtQSE8TcLaqWGMOLHpuQ6kU6EtUxQcZssqkmde2sug62Ln8J4p2oobOLKNopIr6oswaXSEMyO1K/HfHMb0hGikuv8PhcUghxv4f7kWR5+WXQWLuaqEi92yB5OEqu2xnzMI/edY0l2+FKnyRm1O2ARTTixt/ZnPW0qiL7uQOveP/Z3/Q+bo52mIH5KpLWMXLsFqYvwLffwWXUXFX6jx8G0JE3apV5j3DT6xMaj2jAtpzf150/mrnbefQBetPMcV+bAW29+ts0AbQxqB3ZVEk/BkCVGJWDa4ECLKjNGlipJEnRwUIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by VE1PR03MB5742.eurprd03.prod.outlook.com (2603:10a6:803:123::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 20:53:59 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::9130:93ae:6e27:e9a]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::9130:93ae:6e27:e9a%4]) with mapi id 15.20.5038.014; Fri, 4 Mar 2022
 20:53:59 +0000
Subject: Re: [EXTERNAL] Re: Questions regarding regarding idt/renesas
 versaclock5 driver
To:     "Fillion, Claude" <Claude.Fillion@mksinst.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Adam Ford <aford173@gmail.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        "Klein, Jesse" <Jesse.Klein@mksinst.com>
References: <MN2PR03MB5008EB5F50B680C2A2E271D893019@MN2PR03MB5008.namprd03.prod.outlook.com>
 <9e4e542f-6f73-164e-581e-17369aada2f3@seco.com>
 <CAHCN7xKVMCC_Sgqp_Dgpwyi4X4rq4qKi2MheA_CK1vcrm3JjyA@mail.gmail.com>
 <b15f993b-d67b-b96a-904c-53025eda3aa3@lucaceresoli.net>
 <MN2PR03MB5008747FDF505CA30970ADE293029@MN2PR03MB5008.namprd03.prod.outlook.com>
 <CAHCN7x+kusPwHpkp+4zwvGN48oDUGfN2ueCn=8kt_54aiYwE9g@mail.gmail.com>
 <MN2PR03MB5008F4921D8484306505F8FB93029@MN2PR03MB5008.namprd03.prod.outlook.com>
 <CAHCN7xKbE9Rv3EsvFkS4Lk8nCwy1TK-xJQLk_h70PSVdeUHJcA@mail.gmail.com>
 <MN2PR03MB5008536F789B93337AF0BA6793039@MN2PR03MB5008.namprd03.prod.outlook.com>
 <CAHCN7xJFxtA=9GYkQ1dVig=sSRQY3yhjS9dO2GRtqn=zdc9w7g@mail.gmail.com>
 <fa9aa952-6560-7123-d095-32e88ecc5fb3@lucaceresoli.net>
 <MN2PR03MB500847D9F5BFF44F5E98ABA893039@MN2PR03MB5008.namprd03.prod.outlook.com>
 <59a74714-ae45-897e-57b9-7346998442cb@lucaceresoli.net>
 <MN2PR03MB5008DB1C7B0B5A4D2ECBB88E93049@MN2PR03MB5008.namprd03.prod.outlook.com>
From:   Sean Anderson <sean.anderson@seco.com>
Message-ID: <a93e4fef-3001-0a41-1e3c-c23438e14799@seco.com>
Date:   Fri, 4 Mar 2022 15:53:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <MN2PR03MB5008DB1C7B0B5A4D2ECBB88E93049@MN2PR03MB5008.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR01CA0046.prod.exchangelabs.com (2603:10b6:208:23f::15)
 To DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4154017-cf83-4cca-ed4e-08d9fe211af4
X-MS-TrafficTypeDiagnostic: VE1PR03MB5742:EE_
X-Microsoft-Antispam-PRVS: <VE1PR03MB57429E31771485803AA27EB296059@VE1PR03MB5742.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kpWZLZHFWA4TczWA+c611/V008AL3/zcIe9xANqrFckquQGvQIJzPEjxyHuXt1EsJTbS3xgLeEcjYWlczZWnLUUOsaIta/QCdLRA0yNQfZ48Zgd9SkIQXvTF1CiGHtljV9W4u9aG/eZFLf9c6nGVNWDMH352E4YkdqKlNx5zqrOMvLDRbaqnnHsMZxcr7pDwiL8LsHRrCRYKmFPuKWmZOWLTuM+Ra56Ceblk3LGexrna3kSJcqcf0chuvmuREt+UPE56wb5nT49umxlLt0yVKUGOCDJrJqvh0WYnVqmYtc7sO7CyrA8A5PNIOM7GBAWHhfsAnWGuVP4d3a8BFh4wQ8/AGJp79PiaRerlSOgBZmjDU4K2qAUy8iEsU39YgpcPgQ+zwXoimbYPtvvotrm9eKB83P3RM/f0XG7ZovZ+4tZ3dwtdweqQgzEc3KMhp32qZBDXtIATu4RiWFbILWWM+nw7zylalWeibYcmBhJqC13oAoqvqEALZWGenah1Wca6uejsitfaDSS9pH2klJ1voYYjW5QGRxcElua9Col4I5sdgqg+yafgrnaN59qtqrekMMKUloVei2cUFBCtS19hQsU8lkyszYPOOhebG2ljTCgpcyksZ+zeX9weMV24vURQJXHN66/i+LIFAzMf7du3k0k04fVIJfrDRDYv3oc3IDiHDA7rUvisPNAyTLT8DmIYGrfH4+9BlcspW2Cu0hLy5TWx9ngC4NhFUT8JwRWvY1LLM1QWJL/LzerfSGC3q4fMwaG6UPKnguxKnxlU0DTiDAws9xCvfbWPqwCWU8AAW/zYdiAJVag6A6Kgki6Wb3mfYwGsO/8Zhguzvw2WZj1oRo2gLhZYQjJOakqM0NkukXg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(2906002)(110136005)(966005)(31696002)(316002)(38350700002)(38100700002)(8676002)(66476007)(66556008)(4326008)(36756003)(66946007)(54906003)(44832011)(8936002)(5660300002)(52116002)(6666004)(6506007)(6512007)(86362001)(53546011)(83380400001)(2616005)(508600001)(26005)(186003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3pRVENoR2d2UXBhRFhUZE9uUlpXT1pIb3ZzMDRPT0lFc20yNVFyazdjUUdZ?=
 =?utf-8?B?OXpOc0JCMmVMbHRpeEtMRnFMNlpBaFBtemc3bGlGUWRmVWhzR3dlN2dSd25n?=
 =?utf-8?B?Mld0akVNeVJ1Nit2d0hSMFdXWExVTlFDamRnRVJPRkt4ODdMb1A4a1pPUDJP?=
 =?utf-8?B?R1p1Mmo5UzJnYWY5WDg1Yy9vSXQ5SUxmMFl6cVZORzdHNmVCdGEwMGQxYjdG?=
 =?utf-8?B?cjNmSnpTdTNTcTdHNjR5S21QRTZxUG1Pa3RSMGtjdHEwTHg0RVp5cnBmZ0VI?=
 =?utf-8?B?ZEtjUUt4bUNLbnhyNXZReDZMU1Z4U0pEUXNvaThwOUF3TGpFaXIySmQwNlRK?=
 =?utf-8?B?NmUxcTFvVFlHTm05T2VYRm9LOWVyWEMydENFZ2toVVRWZkdOVVhMZitkRy9m?=
 =?utf-8?B?NURiTGs1a1lJYTl0SDd6WXBaL0R2ejE2WFYwUnVXK2MybmIxSDRGTVEzUjZ0?=
 =?utf-8?B?L1IzZjZYczR2YXFXTUNJNjl2TUM2Qlp2elJ3SlIvVlJhUktWVFA1aGZTR0l6?=
 =?utf-8?B?VjNiMlgvUWxneGFiMXRyV2c1NmJsZEZPcXU4Ums1Q0dWY2hTRTVqWmRaVGdJ?=
 =?utf-8?B?TGZ5bnh3NGQvcUtvb0lIVERSazNhdy8xNkxtcng3VlBDYjlDT3k0dEJQUlg3?=
 =?utf-8?B?c0ViN2ppSC9nTjB1aHFhVDJ4NnMyZU90Q2M4TkJqMG1LbHExeGlMYjVKL25a?=
 =?utf-8?B?OHR1NFJCdk5UUmh0bzROUkc2K3M0Q20yM3B3Z01QalB6cTVJd1ppa255MTZh?=
 =?utf-8?B?cU9iV05qUG92M0tmcnU1RTVPbklrVCtFMVlwQVBTQ0grSWpSa1grUTQ3UitQ?=
 =?utf-8?B?K1pTT3o1L3BycEFlVlQzVnpveFJWUTA0STlsbzU2VWZoT01XbnRLNmNxMUtK?=
 =?utf-8?B?eTg3TzNtS2RGT2dmTkxXYzU0Tlg4Tlo3dkJhQnE3YW5SSlUySENGN3Vjejk4?=
 =?utf-8?B?YXNLbHloMG9XUEhCbUJPMW5QTXBBVDlTT1RHQXMwS2duelVJZ1d6NjZ1M0I4?=
 =?utf-8?B?TGNpRGJjQXE4bDdBNlFPUnpuVXhVUktpOWtWL3ZySVp0VFpidDJKdmdKakhk?=
 =?utf-8?B?UnRnY0VjbWt6ZkNEMGpSVnVLOG10ZEhENnlhN2RZdUNZUkh4Y2xtU01NR3RT?=
 =?utf-8?B?WTZVenp3YkRRSFpUUkk4NW80VktONXQza0pLWitscVo0V1kvZVpuTXNoM0dn?=
 =?utf-8?B?R3l1S3NLRm1xVXM0bWVkc2pXTkdldy94TUk4Sno0QS9wSDZaTit0VkVrYW0x?=
 =?utf-8?B?UHFnSmNHQWNtbW9kSExodnpFak9GNjNqVVJsSm5UcE8rNGdlUENyeXA5WUsv?=
 =?utf-8?B?TVozVndvcE51NUxTZ01hVldtdm4wV0wyR2xoVVcrTis3MUJSUW44ajFNeHBX?=
 =?utf-8?B?Mko3Yzd6OWYzVm1Cd2xuazVsaDhDR0h1SjB2SU11L0JkQk1udm9OOFRMNTNL?=
 =?utf-8?B?RzlvQkJ2OFRhTHNuU2cvL2kwcmVPOVIyUEdmQi9aS0hvMG44SlJKSndVYWpD?=
 =?utf-8?B?dkx6a3cxd004TzNTeUhac1FQS0hKZ2Z4Wm9NVWRjM3dwYlFUWU1iZUNkYTFO?=
 =?utf-8?B?cFJBTndFa0cxMkwvRVk3UnovSy9abmZXNVpvcDB1WHBDWlA5OGlBM0U5K0tW?=
 =?utf-8?B?UWtaN252UW9qcUV5UWc5MWJaQkp5S2JiMVFud3FLUWpzbVVSZHNGLzZ6TUVL?=
 =?utf-8?B?RnBlK1p3OGo2aEhYdkc3QUlmb3ZqWEU3THNCMTR4NlppMDQzaXpJQldUUFBK?=
 =?utf-8?B?eTc4VnhhNGkzVGd4MnpsNkJ0VzAwakhvL3JFSXNnVHRxT0NXSlhWaC9laG5t?=
 =?utf-8?B?Ny9HdXAvVGhZWlc5QUhSK0VWUDl1eE01N254N2xiVDhJWVNxeWNLMHE2aEdW?=
 =?utf-8?B?SlVHbG9LTVFaN1Y3SWJtZ1JaQmhqNkx4T0RKZjJQQ1owZUU1YW9zK1g5RmFL?=
 =?utf-8?B?Q3ZHbkF1YVJxa2ZqNnBsV21Mc0RhdUgzVVdyNjU5ek5pN042VkE0QzRMdUty?=
 =?utf-8?B?czhtWUppTDVGZFdHclcyRGhpaTc0Z0Ixb08vTEh1czhNNWZZd0N4d0cvZ1RV?=
 =?utf-8?B?RSthbWNVOXM4Sm0zNlEzTCt5Ujkrc0gxTUllVEh3Ykh4UW55cjlTMGI1eVI2?=
 =?utf-8?B?NGdtaGQwNHNFS25VZzJKVVQrUUdPNncweFI2UVIvVmtZL0Q0ejN3dDI5QlRU?=
 =?utf-8?Q?FqV9F9KmzN5mvobdUc2LQx8=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4154017-cf83-4cca-ed4e-08d9fe211af4
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 20:53:59.1145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0hxdmwGnD/KarCpo1ykecH+NlHHXv1XKHxcspnLBAbr34EGJa8BCTCn053JzQRmSzbXues/IeTDzqApnZq0cng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5742
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Fillion,

On 3/3/22 1:15 PM, Fillion, Claude wrote:
> 
> Here is the relevant portions of my device tree.  On the scope I see the default 'CMOSD' voltages and a modified frequency of 46.8MHz.  
> 
> I have also modified my local copy of the driver to accept an 'idt,enable' pattern property that allows me to enable outputs from the device tree. It needs some refinement but I can pass it along if there is interest.
> 
> -Claude
> 
> ==================
> Top of device tree file:
> ==================
> /*
> This is a message for system-user.dtsi. If you are reading from system-user.dtsi.genxxxx, please note that this message is
> for explaining the purpose of system-user.dist in relation to system-user.dtsi.genxxx.
> 
> system-user.dtsi is merely a writable file handled by ./buildPetaLinux.sh to copy the appropriate system-user.dtsi.genxxxx to this filename for use
> in the build image. Do not put your device tree here. They belong to the system-user.dtsi.genxxxx.
> 
> If you add a new dtsi, please create an appropriate device tree file and modify the ./buildPetaLinux.sh to handle it 
> */
> 
> #include <dt-bindings/clk/versaclock.h>
> 
> /include/ "system-conf.dtsi"
> / {
>  
>   /* Clock Provider */
>   x304_clk: x304-clock {
>     compatible = "fixed-clock";
>     #clock-cells = <0>;
>     clock-frequency = <25000000>;
>   };
> 
> ...
> 
> ==================
> Device Tree Node:
> ==================
> &i2c1 {
>     clock-frequency = <100000>;
> 
>     // Use patch.  Updated driver for 5p49v6965 available  at https://github.com/Xilinx/linux-xlnx/blob/master/drivers/clk/clk-versaclock5.c
>     // Device Tree Setup -> https://github.com/Xilinx/linux-xlnx/blob/master/Documentation/devicetree/bindings/clock/idt%2Cversaclock5.yaml
>     versaclock6: clock-controller@6a {
>         /* Clock Consumer */
>         compatible = "idt,5p49v6965";
> 		reg = <0x6a>;
> 		#clock-cells = <1>;
> 		clocks = <&x304_clk>;
> 		clock-names = "xin";
> 
>         assigned-clocks = <&versaclock6 1>,
>                           <&versaclock6 2>,
>                           <&versaclock6 3>,
>                           <&versaclock6 4>;
>         // assigned-clock-rates = <46800000>, <250000000>, <1000000>, <13000000>;
>         assigned-clock-rates = <46800000>, <250000000>, <1000000>, <13000000>;
>         /* Set the SD/OE pin's settings */
>         idt,shutdown = <0>;
>         idt,output-enable-active = <0>;

Have you verified that these are correct? E.g. on my board I had to set

idt,output-enable-active = <1>;

You can also remove these properties to use the default values from the OTP.

--Sean

>         OUT1 {
>             idt,mode = <VC5_CMOS>;
>             idt,voltage-microvolt = <3300000>;
>             idt,slew-percent = <100>;
>         };
>         OUT2 {
>             idt,mode = <VC5_CMOS>;
>             idt,voltage-microvolt = <3300000>;
>             idt,slew-percent = <100>;
>         };
>         OUT3 {
>             idt,mode = <VC5_CMOSD>;
>             idt,voltage-microvolt = <3300000>;
>             idt,slew-percent = <100>;
>         };
>         OUT4 {
>             idt,mode = <VC5_CMOS>;
>             idt,voltage-microvolt = <3300000>;
>             idt,slew-percent = <100>;
>         };
>     };
