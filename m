Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A7FC38142
	for <linux-clk@archiver.kernel.org>; Tue, 24 Jan 2023 16:24:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234065AbjAXQYi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Jan 2023 11:24:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234076AbjAXQYh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Jan 2023 11:24:37 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2070.outbound.protection.outlook.com [40.107.20.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42F8E46A7;
        Tue, 24 Jan 2023 08:24:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krMbvE0beFEaTXGbFZXl6fCGGxphVThXK8+zknGdU9ucpT5rATjKFT2vnwxIIL04MLJSH9jkdiJ8LiepyjqGqqwYfNOtKYH7DO+vfh90bJrdp4J5pxL/ehRAQdcXvzOlfetuBA75lwjCeAadQGejo2rrlHYOyYjyF4dPUfjCrc+0Poj2vKSnRsIcfLaKL9Vi8sHjq7r1UN6F9SaIxbsRNJBSWqHVQaOn57Sg8XhYZUihT2HAWvdkMzxwSR5/clJjMDcJHiniKv/cEeHQV2/HS7lLhPXRq2zc0A2lPyy0/ANIsfiV3JLXYbUCU2BVwKq4g96cToXlfOxFhy47KZqKWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7EHdQeu8SILrMF7YPvPqf8Yf3xZvqyheqmku3lRXzg=;
 b=T1xA4OWTphe2H3EZ8m7oL69VWKV/KTfd6X65q+7BvbooYSWiilJmxscVFUT5lEvWK7Us0WtOPjxZ5o6scJry6a8Emvs+hMfSpLSRZZFMDtfP72Ebs5NEIG1mPQP3NDh6eDVHMa3qhgKO1tqpLzoxG0826t/ByBn+fcJyx09As4IjUDdzgH/C+GG+v4egEq5+mgnbl06ZM+7p4GsRrcM+7e5pQkro+00IoQ+gUMU0qhM/wkfvnDbxCrCAmsjnVydOQXihIXInnEjoUuWgTJO/ZSYggRtOZRjVVnFMnqGwOzRy5Z8TkXfIl03EZYo6Lboa7Js0dTVcwZ36+sPqY2MU0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7EHdQeu8SILrMF7YPvPqf8Yf3xZvqyheqmku3lRXzg=;
 b=ai9QOtZnXqoyEEkTQu6sSZwLSYUBgGcPT6nbSYhLQ2xDJxTIMGja22E1vh6KOr0+ouKuNJLL1urKZz9juctsE10NWVP53ofvDqobCo3Qf59XNH2MZjRwpyl4QALGRNhZf0iKEgnfkY42o6UJo60JD8qgVTgg2vZOMoWB/yRTfXOOhNRyNUBH0sKzV/+Fo15ERcMmm4aztzgUDq3YYKvZ669g3YUNDjnf3WlgtY57mxzlU/8slGoXRERXIe4OG11gvvuPmFlmQHtIW0ybgrNwYtT/FG50ThvKWn09hkDt8D8JOr94i8oBZq8DfgazWWdrS7pUjJmi+9Bnw6BiBeRxfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB9243.eurprd03.prod.outlook.com (2603:10a6:20b:5b0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 16:24:11 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166%2]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 16:24:10 +0000
Message-ID: <232f59aa-704b-a374-6a78-469156ccdbea@seco.com>
Date:   Tue, 24 Jan 2023 11:23:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] dt-bindings: clk: vc5: Make SD/OE pin configuration
 properties not required
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-reneas-soc@vger.kernel.org
References: <68037ad181991fe0b792f6d003e3e9e538d5ffd7.1673452118.git.geert+renesas@glider.be>
 <5da02a9b-3d42-a26f-0d18-29a6b5b181e5@seco.com>
 <20230124091236.1bf8c6da@booty>
 <CAMuHMdV8_+dF03VD6mST2zMDQ68cgsLLRQi6UeXK2jH-eWqWZg@mail.gmail.com>
From:   Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <CAMuHMdV8_+dF03VD6mST2zMDQ68cgsLLRQi6UeXK2jH-eWqWZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0224.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::19) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|AS8PR03MB9243:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aa9ba29-5baa-46db-e985-08dafe276c5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dt9XwnvaOFcjjZDl+wxguZg4JKgWnnVvaiCT7bpLlhPSU/TUED6zxpS3/2RBpFlr6+9Nxn8/6Y18w7x6GD/ISi8C+e0EIyyq8URqNQ9sGw6DqHCM+tn/F2p4OGtD4Dnaxmb+oy2F7TRvZNNVgv1ZTMhPvJpY4Vt8KEOFzd+Jr3VQpIocq+7rg+psBBPVrqVQgeCViWgCBvYXTnP5FBtIaFe7BsYEqrhkR6+MkigTQygKco7ugJr+XLSr7YuUIfmu5K21UD9pWCAgVej9mZxLbceGe1UGdeFu6MuHqBKb611S4BS8NPBEe4S/hY/lAXw5yP+jS/dSv3Fucw3toZiwP+14ijZ3SrNxzHeI2r57yVHIB5M8wVVx7hFQUN2ILuK7ZbknkWTTGbEHoCIV5ckE/HdA5cRuB8rh3j5FAjjaw6BsbTk8IGArpk5xb1Dn1Aw7PHYGMCuamvd7JCSrY6pt/EVIm6Dzwk7SWWYduwPOZKIevi/BX+2RHI+1b03CI1SSZBSeSJr7FqIQ5lfFpN14Ix++LIKQW3VWDiHcyRRlWe1BqLzPmW2TvujeksjZM1THftnmasq8TE7eFj5UBvxMwj1cd2P+B2vj1ZWGzFDMIDdmtuhdypeyYG0p4DzksbVEk3mjE3/RBcmYgqRrwVqqxQqlGQhqQvkffCkYmtQ4GlCSrNIw/hFpWDoRawAUM0/LGuM6DyZof3ru4G7RdlAdPqatcbCMQDgvEAAFJVcBZ/sBTtDT1hfaIIVv7cHa7CuEtYem6CfQae3eymzCYpXPdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(376002)(366004)(39850400004)(396003)(451199015)(31696002)(36756003)(41300700001)(86362001)(7416002)(8936002)(5660300002)(4326008)(44832011)(2906002)(38100700002)(83380400001)(38350700002)(110136005)(478600001)(6486002)(52116002)(31686004)(66946007)(53546011)(6512007)(26005)(6506007)(8676002)(186003)(316002)(6666004)(54906003)(2616005)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anNVdENSNWg5QUQ2WVdUbGk2VDRpb1pyamt6Z2VuTm5xeXZjTkRmcmhLTXRC?=
 =?utf-8?B?SzJYSmhmRlJpbWRHSVNYOEI1MmpHMjRpUSt2MWlQUWpJSkUyOEdRK0Eva2pU?=
 =?utf-8?B?ZHZtc3FzcXZGNDZyaGdqU2Q4c094eE5UWVUvOHF6ZWlFbVAyRjV6MnA5V2xE?=
 =?utf-8?B?dVorR2tuVEhua2tBOU9SNWVML3FHT3ZyTFNEbHJqazBnZ0M0QzgrVHV2MEtR?=
 =?utf-8?B?TFdpd1Rsdk5mRENEcWdrOWV5VW9VL0RUNlR5NVpzVkVoQm43ZnRMUmg3eVdM?=
 =?utf-8?B?UEFEbVo1SlNQUldWcUhBdkd3VTFZM2FLeUJaYWtWelZiVVUvVVZ5d09JSXdQ?=
 =?utf-8?B?MDI3U0k5S1JnTDFsTmp6dXZ5RjVNb1M5aG05aThqVzdoNFQvZlg0YVhhQmFj?=
 =?utf-8?B?MnduSXdIL2pnZXluMXlRRGZoMVFCL3lpaWN3QnYzbzNpSDVlKysvdTdqYWNl?=
 =?utf-8?B?VThMVUdvMzc2REJOeFVQd291T0c5bm0xRkFxbWxjVExtaWhrblVjODFqdThM?=
 =?utf-8?B?eHdjSEtGMkFmQnRROFErSERXY3lDbnZEeFZXYTlmemlCek1WZFlIcVJoYS9n?=
 =?utf-8?B?cmhBUFlwRkJnNGdEZXBNdGR2ZndLaGE4bndRcHpzNDc0TGtiR1BIaFkzaG5K?=
 =?utf-8?B?RmVMMks1NmY5WGVKR25lOU5MaEdST0ZOZUVvRHF1SGdFaHRiMlRtZlduUHhv?=
 =?utf-8?B?TlJkMi9mbkJrdWhDenpYSlRLWEI5V05vcGczRkJpUGRIN2VlN0UwOUMrZG82?=
 =?utf-8?B?RTg4YllrditiN2pLOFVGVVVTU0kzTUducTdYS2hpTFl1cWZ4QlZLSXVtSG81?=
 =?utf-8?B?R05KbnFRMlFEZitMYU9zSmtPN2F3UnlaM1ZjUlVTKzdzL095Z0lFYTFuYmNj?=
 =?utf-8?B?aUVnWkVUOTVidG52VnBCWFIybUZwTUVPZlVCSWV6blhJczZRYnFFMmtUdjhw?=
 =?utf-8?B?cjZ0WTJRTjdLT0pyaHRYRWZHOG1rVzNUdFZUWnc0Y3ZXaWRCSWZKemhiR3pN?=
 =?utf-8?B?K25GT09Lajk0dW9FRStReklLaUVUZFI1NXB1dHRhS0QxUTZHdDh4bnJVQVgv?=
 =?utf-8?B?Q3lsYzlQNEhQdUtJdnF3aVhqWWxidFhXcVE3QWd5Mk1DVGdKVGc0OVgyQnlR?=
 =?utf-8?B?cWVkQTdBY3Q5YnhOWlY4UVZYSmZyaWxzb2FpSUsrV0xpVEU0TG43ZWg1V3pI?=
 =?utf-8?B?ckFjeWNqTENPQllwNi9ITUs3M1I0MnJjNHBGQ29JNHVzdU1Dc2t1N2QyRzZh?=
 =?utf-8?B?WG1QTGUvZy8rY3VVOWtKOHZmblprMzFOOVd2R0hJZndpeEtLTDlsei9kZmhV?=
 =?utf-8?B?dVdTSkpmTVFpdlVUd0gzZzlMQkphOFBhMmgxVDJyT0ZUM21RY3h5N3hUL2Vx?=
 =?utf-8?B?akhKUFFPMFRtZHVTSnhsZjBBekZFdEZ2NzRWWXY0S0tsNzZrdjBnRFNlWm4w?=
 =?utf-8?B?c09MQlZsKzJ3YTlHQ0ZrS0xFdXVKRUUxcEFDcTlLWk5MVFNLdmlVTXI0TnlV?=
 =?utf-8?B?a3VXbG1YamQ2ZEtxQ2tMaGpjVW5xeVVXb3pGRlBHZFZyUkhnRlNEZWxhbHBI?=
 =?utf-8?B?c3FsQWJ6T0lJZGd6ZGh4U0xxQUt2Zzl5N0UzSVVQREtTS3lNaC9iZFVucDZq?=
 =?utf-8?B?ZHpQNnRXSWpMSU1mSVJNdkJubUdFODdpeWgvcnFjaTBXdFcyK3JHelNncmVG?=
 =?utf-8?B?VHZpZEREREZkOHorMFltN2dIbk9xOTJOYTBVOUdDTU9CL2FLOTIvSURCeU8y?=
 =?utf-8?B?TDdtT2x5SG1ad2FwMTU5TSszOUd2bytNdFhObVNERWcvQUVpZFlmTWVyR01r?=
 =?utf-8?B?Z0VXWUlPd0hDUFB3OERYd2c4MXlvRE94YnFVVHFwcisvdG9IaWttMEx1NVo1?=
 =?utf-8?B?S3FnellDWVY3cDVWa3J6OVdJRTBieVZDb0dQcEZSTCtFN21hNWtzUi8zaCtI?=
 =?utf-8?B?WVFLM2RkS0xVbCtsK3k5RzdBTTlFREFIZFBKcWFwZFE4T2E1V1d2aktTMDk5?=
 =?utf-8?B?Z25mVG5WMEdmVWRpR25HSk1BWlZqU3VnMUo3WHdlbFloRUpuWHVmdW5NdlFj?=
 =?utf-8?B?emZCUTRPUFdleWdYMkxPRktoeGM4RjExRlFseld1NmtRUjA0RitVM044UCtz?=
 =?utf-8?B?RGhSWTdQaDJFbFFPSnpjTjk3N1BiNE1Na2JkbmYyaCtXVFlORnF6Ky9vWWVO?=
 =?utf-8?B?aVE9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa9ba29-5baa-46db-e985-08dafe276c5a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 16:24:10.3625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCZ03qtUrwUQ6Pwnbf1kmP2miIrFGmxCQaV9naCgjRyGMH38oSHq3kyIQSipj6/8uvLhc6Qu6faWVv+eWfHmyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9243
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 1/24/23 03:28, Geert Uytterhoeven wrote:
> Hi Luca,
> 
> On Tue, Jan 24, 2023 at 9:12 AM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>> On Thu, 19 Jan 2023 14:27:43 -0500
>> Sean Anderson <sean.anderson@seco.com> wrote:
>> > On 1/11/23 10:55, Geert Uytterhoeven wrote:
>> > > "make dtbs_check":
>> > >
>> > >     arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: clock-generator@6a: 'idt,shutdown' is a required property
>> > >         From schema: Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
>> > >     arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
>> > >         From schema: Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
>> > >
>> > > Versaclock 5 clock generators can have their configuration stored in
>> > > One-Time Programmable (OTP) memory.  Hence there is no need to specify
>> > > DT properties for manual configuration if the OTP has been programmed
>> > > before.  Likewise, the Linux driver does not touch the SD/OE bits if the
>> > > corresponding properties are not specified, cfr. commit d83e561d43bc71e5
>> > > ("clk: vc5: Add properties for configuring SD/OE behavior").
>> > >
>> > > Reflect this in the bindings by making the "idt,shutdown" and
>> > > "idt,output-enable-active" properties not required, just like the
>> > > various "idt,*" properties in the per-output child nodes.
>> >
>> > IMO we should set this stuff explicitly.
>>
>> I took a moment to think better about this and I think I get your point
>> Sean in preferring that the hardware is described in detail.
>>
>> However I'm still leaning towards approving Geert's proposal.
>>
>> I'm based on the principle that DT is there to describe the aspects of
>> the hardware that the software needs _and_ it is unable to discover by
>> itself.
>>
>> Based on that, does the software need to know SD/OR configuration? If
>> they are already written in the OTP then it doesn't. Also if the chip
>> default is the use that is implemented on the board, it also doesn't
>> (like lots of optional properties, especially when in most cases a
>> given chip is used in the default configuration but not always).
> 
> These clock generators are typically programmed through OTP because
> (at least some of) the configuration is needed to boot the board.

Actually, I found that with these properties added, there is no need to
program the OTP (at least for my use-case). This is great because it
removes a step during manufacture and you don't have to worry about
getting something wrong.

>> To some extent, writing settings in an OTP is similar to producing a
>> different chip where these values are hard-coded and not configured.
> 
> Indeed. Except that here they can still be overwritten by software
> later.
> 
> The latter is an inherent danger, and is probably the reason why Sean
> wants to make it explicit: if the configuration is ever changed by
> software, and the system is restarted without resetting the clock
> generator (at least 5P49V6901A does not have a reset line), or using
> kexec/kdump, the newly booted kernel does not know the intended
> settings, and won't restore the correct configuration.
>
>> I'm wondering whether Geert has a practical example of a situation
>> where it is better to have these properties optional.
> 
> My issue was that these properties were introduced long after the
> initial bindings, hence pre-existing DTS does not have them.
> Yes, we can add them, but then we have to read out the OTP-programmed
> settings first. If that's the way to go, I can look into that, though...

FWIW I think there's no need to update existing bindings which don't
have this property. The required aspect is mainly a reminder for new
device trees.

--Sean
