Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82635C433FE
	for <linux-clk@archiver.kernel.org>; Mon,  3 Oct 2022 07:23:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbiJCHXZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Oct 2022 03:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbiJCHWY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Oct 2022 03:22:24 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2069.outbound.protection.outlook.com [40.107.100.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B52F4A836;
        Mon,  3 Oct 2022 00:16:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMmp3AxuD3DNlLkA3aTdVAQp4iVibX1n8vgXOnwg9yy01b7jUZejdHjSSdoiAsqLED3ym9NkFl1TP6kp4HpAP40gnteDx2G65WOdVSlmH0YjoWH+t4BOeLxkfDYTvYYZoi4jbqV8VXB9cSGJYXlFkIBWUrmTzNc8WBT0ZNjyNK4EHypQVO0GP4IJ/4bLHHHNJXFg3fR1+9n3lq9OoaDCzVxQS1sKdu18JFOMYYU42pz8T0QgV0GvTbj01E4uPTGUhUEkUeKzoI1DO8cc3DDPh8HShdb0x0HLd4eF4qAvG14AEpL0U9kSNMeqigMx1uM1nw9JT9j4rs+CikVKzbOmxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7UiQGXgV5UxpKxa7sRG/38zrGrk75jQvTpCBRzrqPc=;
 b=dCqa5BYnl9dIsYhZjdeGREwephveVqfiN/kI96V50fZ0Xz5JUdJtlAYxNL675cu2ivC9QZvW9gY9USUuwKunHYsDPdJ0wCkz7FUWksOBnYWNKuTp+3KQv3YoCbJ789j/BSb0DwaggmTiG31f8KNUZE+v2YZ2gUzU6gUV6EEBmEwm7Y3IovkvdLRiQQHu/se14AUC2e8hB0HMEIbgw8OqhB8s+uUZA+q+ayt7/m6QlJykC1gEmE2yyheCvYoVqNAEEhwAg59E7mFue+mpMpRwXlofkBdOog4SrvPaX1xR/anudp09pBrdgsgskUGvK5gtnDNClSnPWIKJfl8uLqt5dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7UiQGXgV5UxpKxa7sRG/38zrGrk75jQvTpCBRzrqPc=;
 b=wrwIpEh0Xyf1w1EoHnYqgNCgOD1k72W3IpOgfF/9ilY+zNKHDd57JF5w281I0ZQ2dUKXHcL+xroB3bx0C1giaIdfgGwtplQLgkh3EHs8UWZSJnghwL93A3hXHTH/gH0Xc9eSYtHlH8RPfOfGu5AYUNOSQJWCH6NMKa6JyO/yPQA=
Received: from DM5PR07CA0111.namprd07.prod.outlook.com (2603:10b6:4:ae::40) by
 SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.24; Mon, 3 Oct 2022 07:15:20 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::65) by DM5PR07CA0111.outlook.office365.com
 (2603:10b6:4:ae::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26 via Frontend
 Transport; Mon, 3 Oct 2022 07:15:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Mon, 3 Oct 2022 07:15:20 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 3 Oct
 2022 02:15:14 -0500
Message-ID: <6e58837e-896c-7069-7913-2afb90af5e95@amd.com>
Date:   Mon, 3 Oct 2022 09:15:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 1/2] dt-bindings: clk: Add binding for versal clocking
 wizard
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
CC:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        <linux-clk@vger.kernel.org>, <git@amd.com>,
        <devicetree@vger.kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220930080400.15619-1-shubhrajyoti.datta@amd.com>
 <20220930080400.15619-2-shubhrajyoti.datta@amd.com>
 <CAL_JsqLaqjZeZd3c-fd9f5m-4OCXgOZcOu+paik9FV_eno5sLg@mail.gmail.com>
 <afb3f19f-eb40-5453-a82b-295e06861f86@amd.com>
 <20220930213924.GA1079711-robh@kernel.org>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <20220930213924.GA1079711-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT050:EE_|SA0PR12MB4367:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e96555b-ce0a-419c-a352-08daa50f07e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HknH88+rMq7CnFnxFBCNy7q8Y0QDHKITbmuazXmwAsFfe3AW6p+PR7rhZYP1eSivahd3lgLqquTDd0j5THtHJ63HcsEi0/2jxfZQOwQxycfOzqo2ISGTGLlAHsofbbxUF2iU+Fk1vRQYUZ4t3uE3Waoi22v5l/aQMP7LOZo4a5OxECDbI2Qte5ZS31ALoPBc+oMCEf9mJHvDAt6MX1e0blxqWYc437gLvK1DCHX0un786EjPrtMWcAkvC63Nm3X1gQC2H7EwG2yoKhxJ8+nuBhhjR75ctBCOElvIO4zq9IgBZZYLEXNnHHHRjUqf4bzTq6hn51IZ2DsYNYYQrE5JUID8MXBpUlM+EyFrYKndB9WMm8kOD14pb23yV/Hk07JFN7G4X4oFFbNTofHEkkNrm8KFXMc709zvsxmtJ4w8LuE4Po2545duQx+5p0fiv1GG7zyitFre2QM9XyPC0Z9oJckx42Jpqvsv+s8N2t9MqepTWGj+OTl0js/ZOMj2qQjl1w7D7LiS2PM9KtXVCtPchoCGlGqvBDk57qLA7fiLQLUedduX4RggnL7frSKnHHiD8EvLTW7fsNoM6BcijlQxZomhXWzObCbK6woGwHnsqhZ/ijjITiZNizH4IxxSyCgPY6BfZD1vHYoB6WBPNgfOEtKHMhTSMTpOQAgVXyWqXO1ic1xO+uqTT7uPD1Yn5y9qyMH0fwIbnkV/M/ijjdMyK1mYEKZxJtGZWu4yvrvCwt5yKfjcIORXY3L4kl/ex4BWQbeoIUAUhfVlk8nfT88zTNPfOQISgoOYE9umlDkjQHhOnv5yrkdKFY8WQkBsjNoguPYNKDBBRC5yZoFODxqVwHyLZ+Np98Y/r9dJFaBtDoY=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199015)(46966006)(36840700001)(40470700004)(66899015)(31686004)(82310400005)(81166007)(356005)(966005)(316002)(82740400003)(478600001)(6916009)(54906003)(16576012)(70206006)(70586007)(8676002)(4326008)(186003)(41300700001)(6666004)(44832011)(53546011)(31696002)(2616005)(26005)(86362001)(5660300002)(8936002)(40480700001)(36756003)(426003)(47076005)(336012)(2906002)(40460700003)(36860700001)(16526019)(83380400001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 07:15:20.1253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e96555b-ce0a-419c-a352-08daa50f07e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4367
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 9/30/22 23:39, Rob Herring wrote:
> On Fri, Sep 30, 2022 at 03:00:28PM +0200, Michal Simek wrote:
>> Hi Rob,
>>
>> On 9/30/22 14:25, Rob Herring wrote:
>>> On Fri, Sep 30, 2022 at 3:04 AM Shubhrajyoti Datta
>>> <shubhrajyoti.datta@amd.com> wrote:
>>>>
>>>> The Clocking Wizard for Versal adaptive compute acceleration platforms
>>>> generates multiple configurable number of clock outputs.
>>>> Add device tree binding for Versal clocking wizard support.
>>>
>>> Really v1? I'm sure I heard of this wizard before.
>>>
>>> What about this?:
>>>
>>> drivers/staging/clocking-wizard/dt-binding.txt
>>>
>>> That needs to be moved out of staging rather than adding a 2nd one.
>>
>>
>> Let me clarify this. This is IP which is already moved out of staging.
>> Linux-next has these changes and waiting for MW to happen (already in clock
>> tree).
> 
> Where does this series explain that? If the dependency is not the latest
> rc1, then state that.

Please take a look below.


>> And this is new IP. Not sure who has chosen similar name but this targets
>> Xilinx Versal SOCs. Origin one was targeting previous families.
> 
> Do we need a whole new schema doc?

It is completely new IP with different logic compare to origin one.

> 
> It is not ideal to define the same property, xlnx,nr-outputs, more than
> once. And it's only a new compatible string.

I can't see any issue with using dt binding for xlnx,clocking-wizard.yaml

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml

also for this IP if that's fine with you.
Only xlnx,speed-grade can be defined for previous IP which is easy to mark.

But as I said, driver is different and integrating to current driver is not a 
good idea. But if two separate drivers can use the same DT binding document with 
adding new compatible string (and small tweak around one dt property) then it 
shouldn't be a problem to do it in v2.

Thanks,
Michal
