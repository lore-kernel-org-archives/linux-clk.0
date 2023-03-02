Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360F0C6FA8E
	for <linux-clk@archiver.kernel.org>; Thu,  2 Mar 2023 07:00:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjCBHAk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Mar 2023 02:00:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjCBHAj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Mar 2023 02:00:39 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 434CB113E9
        for <linux-clk@vger.kernel.org>; Wed,  1 Mar 2023 23:00:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kaqk+EV5mwF2JXygjtBdGNGuavCbbne5uMxbA9QqLoHsdLr5O15FvDsvhq4SaVwCf0VjHE+ZNMEymhkRJRf1YtOoKfe9+3u4x48f4C4OVfi216rrC51Gw+p8enO1970HJGGgH7KW/OhhrS9mHzUDypMk90t3VQOBWpiV75xmPZrxoHfie9T9++i5RZAGBiyALiVgwRAnaXVY+kFdIy6WZBQ9ooAkKQz7x5V+PbDGda5uFcxlslEUObU8dQsOCvALOLWWIhJhJEXDnJTMi6tYq1+yoZgzx04Ub5Vv4L9EL6IXHA69BgfFvCqGCCJpZUGrwG4vElvr73f0TrOAQmr/tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWE0iclOwd5WB8EwQdPIScJCKjVrrqj8tbFCnT8/0/w=;
 b=hPX0ToA1fIM3VmX/g/ZmcEVrKjhDgj8TtmmbwUUODwmB+j8fcGu6Vecng7iZzskwq7ExGDG+GVoQqLiMbZouubOIfPzneWcrf1GerhyJDBGtJU8Lpm5qxotKu5f2/fkzxfgGjtPcip4nPBsZDiGdtFPhh23Xoa9ffapNG2Rgp1v1uQA1n+BKnVLmRmZYrqpXflUKMAhChGuBmeRY56gYV9/yZ4lT/ny2nVqUYD5KbBTB0RZVD9bJQfr23RvcwknO+oMZO5fGPI38721llkWFgpJspeK6sl70VPwuaAQjkBgYHmknNjXhLF5GyacaeN5KV6yirXl642NyMM4b0+Bw+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWE0iclOwd5WB8EwQdPIScJCKjVrrqj8tbFCnT8/0/w=;
 b=jLW+MRO7s5t6Cxge3couih9vTIyzX7iUoqFvDZp07CwgXmz0UiXJnww/3PHTp+McCq8j1dN2yk8tY/Ee4qLT4u8zJHME8b2X4XhF1Dk/PEfxz1NTHw1OXBjcGeKdt7iTCiFywBfmYGnZ7WliaFUX8ZfsMr09hiTZHqjwFqaAsIo=
Received: from BY5PR12MB4902.namprd12.prod.outlook.com (2603:10b6:a03:1dd::9)
 by DS0PR12MB8248.namprd12.prod.outlook.com (2603:10b6:8:f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Thu, 2 Mar
 2023 07:00:32 +0000
Received: from BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::8dc2:6f02:faaa:deb]) by BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::8dc2:6f02:faaa:deb%9]) with mapi id 15.20.6156.018; Thu, 2 Mar 2023
 07:00:32 +0000
From:   "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To:     "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "git (AMD-Xilinx)" <git@amd.com>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>
Subject: RE: [PATCH v2] clocking-wizard: Support higher frequency accuracy
Thread-Topic: [PATCH v2] clocking-wizard: Support higher frequency accuracy
Thread-Index: AQHZJnBm1YgFIsbigEapZRDh7uwcbK7nXBbA
Date:   Thu, 2 Mar 2023 07:00:32 +0000
Message-ID: <BY5PR12MB4902B7472EA6B904F9B009CB81B29@BY5PR12MB4902.namprd12.prod.outlook.com>
References: <20230112102644.28019-1-shubhrajyoti.datta@amd.com>
In-Reply-To: <20230112102644.28019-1-shubhrajyoti.datta@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-03-02T07:00:28Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=9de6543f-711a-4969-9502-d9cb4ccff3a0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR12MB4902:EE_|DS0PR12MB8248:EE_
x-ms-office365-filtering-correlation-id: e5e51fba-d504-4f25-5dc9-08db1aebd0b6
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gu5SsLRl/+kEKyz5mBdNHQHiZJmEqC9xw9R0D+8pEfKBhG3y+SpZnNk+yJvt0Y8BV0XsB/KLd6KA1tSSG1KRza0k8slmPWproAekisWjaWulyDbmHnqOjQdr/kHTdEqUyAJaB6q6kJjVkgWOeeIcvXLBljkcl9B1bZVrQeQyZJNXHTaXl5O0z9OqqUdw1QU2s5CS0RLQYw6EOhePpO/Djd+Wh/PS13m4ZmFHsuSKs0S7ahl02bu0nLwJUsiMzY8LtIOT17dx67JtnTtIHQ/fbOdNvwvchEM1LEvoLNrIVht1e22u3oEZSyi6w3UuVTsMyug63r8tam0wqhI4IMWvOE09CGjT6bV8JtE0gaFdxAh4O3iTmfr5B3z9qFm7jsQZP0eI/lAsli1m8jeslZ9ZOu6eiwmlgWnHGj/s4dQUJ1Kin2rX7OXJ42mxlog0nMT+JTUpVIhXe242GR51ChKD4CP+0g6iuN8OvSWLo6c2jzHtwFwiO4uWWsf/wpra2Ix+kpdo0jGdTSC5n3vwaAQaV4zhuzPTPYU87dkG9EbgUWVEqM5Y/zt6dv2u6l9ndsg/oQ2JEEzPtXrkH4gHFfZXq82FbSLbarZVu73ViQP3Sqzq4qI+MIqGo1rkY52jYw5l2hv/mwteGaW1xIkxiKhzEvE7q33Arzgw9R6xU8mdv+uDLe1pWN4shYADUX0JOj2ukIZGMxYE50HveNpaspl2mA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4902.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(451199018)(66556008)(83380400001)(33656002)(71200400001)(38100700002)(122000001)(8936002)(5660300002)(52536014)(478600001)(66476007)(55016003)(86362001)(38070700005)(26005)(9686003)(186003)(53546011)(6506007)(8676002)(76116006)(66946007)(64756008)(66446008)(2906002)(4744005)(7696005)(4326008)(316002)(54906003)(41300700001)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8LoVRE3NvxhDCGA4ExMKnnNo3xgHn2T14lk2NB9n4yuy1x476vhFvmoyLHvv?=
 =?us-ascii?Q?TiHJggLTG7XAaEDbuHTS7omxhoe1fxe4bI4rRDoAeAePIIc8v4M63IaCQWZq?=
 =?us-ascii?Q?EmVghtUvWFcZxZFT262OJuitZL0SC77RVkAXXj29XkYE9NhgRb4QBrEfUEjX?=
 =?us-ascii?Q?QULF9pGt+zFLbC1tGfurmYXMK9p6vafevAed/1l1gYNBYJkevH7PwbTSfITC?=
 =?us-ascii?Q?GBHzWaOPCN9SZKUcwv/r0mUuISX5yeX9SKdxqukMQ9SsmhJyhfujfYH6R37C?=
 =?us-ascii?Q?zdhl8bsvEUcsZA0aGciw5ovfju+aWXVAfYQWC7CtzfIARF9e2en4ihu0xPLr?=
 =?us-ascii?Q?v4Mb7dptJO3rmTXUSkTGtu5c6cXUrdNIq7Brst/fF8+baW0drP5zFP2ob2bB?=
 =?us-ascii?Q?qeHqHtuU1R/xXw+cswMEYTK7ebTj1VnSjnOiFTqqAMp/JwEs/F+vFDgldMLB?=
 =?us-ascii?Q?ScTl8qwBNKZUtBhW0ptekVLREquLQ0F5mFFtQafsNnRjTyOmGfq68EC9bdzH?=
 =?us-ascii?Q?unuPx1nJcGfGP3dkp6NYXv+RHXiGmxO6wJB++h5jsDpmniLX92GOTje9eMo8?=
 =?us-ascii?Q?L8VKwLzmoVHw3rQX8YChG33kwrw7iJO1AHMQCEuCt6bPph5oRFxASn7qBoqF?=
 =?us-ascii?Q?uMl+ZmJTidfH8fvGe/MC7orBb79SPMxlDEl2HYGH0LqLWb0cYVwc3cImMZy6?=
 =?us-ascii?Q?YWJlgXlBbVon8gV+2o1UGZVJLr0SMHjpeLykypD1H6UnojWvJ6rWuN6eAwa5?=
 =?us-ascii?Q?lFiI4NL1IZKw26cXlNjE6JsNAYaF5L8aaWXG5M4oY+l5/78vHMUvVuVF9ZL6?=
 =?us-ascii?Q?FQNCd7wWeplKbJ+sYYS/9XqPPFL+7hCstXUkI1iGOWMFq5mchFG78oRVmGfA?=
 =?us-ascii?Q?TuPBbQIGY8WV60iRdA5ldnMdsiOyZInCCV36gVX8fC7t9wg86pJ9GZoeRSKm?=
 =?us-ascii?Q?w3IxE39laedytrGBFjqD9D6IulZ+4/16HzgPpZK71A2ZtmsmzKdHT/7N2hel?=
 =?us-ascii?Q?YeH1kt4Eqmi86JdJbJqkhwJvYyHceHsLUiKusmN6oA6Mt7l9q1qDFJZDxQAR?=
 =?us-ascii?Q?feH/+EzNZ+QQDiVnvsJKAnMVVPr304tWlyN9eHm7D/5S1NcP+AIpT26hJGdO?=
 =?us-ascii?Q?lzZTEVVABrA5UcvdpGB5QpHBALfJnrRfQR7j9Wu63GGA21fbQfXLwT8pRAoy?=
 =?us-ascii?Q?RcuUR22+TX5rk/AnTtRUQeBKfMiyvgCzXmiK7UT1lHbOT0N0526NDFLbCpg6?=
 =?us-ascii?Q?qJXwzzkh32NVpNoVdJpR4HteHh+PN7WBgRYwM4IX6LIKTnAcINxzmgt/eIPq?=
 =?us-ascii?Q?F9QSi+ATsrJfQ71f5L+MVy+4CrLVAFW5gDvn1dUA8dexWjC8JpI4tMOVjsKb?=
 =?us-ascii?Q?zZFw0vsMXf4hmxgm846pc8V51G//FoHLSFcpAO084c+mOtS2o9yrdd0G1BTC?=
 =?us-ascii?Q?iIQFPfqihYvKWVM0L6ko9sjLlN4qD15ATsO4pFih7RtOSFTafYenbUXgmdWc?=
 =?us-ascii?Q?8DsmVBXV+1ZRPFnBZJqPQ+h/X5SkJOCA2HSikCBbJ+MhaBzO2ocgJxeCAf5l?=
 =?us-ascii?Q?3nQ2Svzme5rWFXQ1rjQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4902.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e51fba-d504-4f25-5dc9-08db1aebd0b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2023 07:00:32.3681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ttWxggPEaK+O7GiLGO4+VW9DLEjta9aZyLdBH4YHwKyHBU6yYxhkCkk8VaehHwdxyzhgEa9BkgRl5tmEP7e8qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8248
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

[AMD Official Use Only - General]



> -----Original Message-----
> From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> Sent: Thursday, January 12, 2023 3:57 PM
> To: linux-clk@vger.kernel.org
> Cc: git (AMD-Xilinx) <git@amd.com>; michal.simek@xilinx.com;
> sboyd@kernel.org; mturquette@baylibre.com
> Subject: [PATCH v2] clocking-wizard: Support higher frequency accuracy
>=20
> Change the multipliers and divisors to support a higher frequency accurac=
y if
> there is only one output.
> Currently only O is changed now we are changing M, D and O.
> For multiple output case the earlier behavior is retained.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---

Gentle reminder.=20
