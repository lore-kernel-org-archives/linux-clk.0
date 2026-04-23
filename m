Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013002.outbound.protection.outlook.com [40.107.162.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6760830E0FD;
	Thu, 23 Apr 2026 01:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776906920; cv=fail; b=axAVQA3j5MmEN5NXZil+EuXVI5MkQ2Dl/VUnlx9O+9af7yeD7ybby537hkh6tO7LDvvtg+eBnT1P7frQYztZl8cw6tpLVB0iOy2pHd2i7Njyg0EGjHdYVckAPYQR/z6Srsiiq5zbTdOWFNaKfZ2wAQddmLhAiUR5ifHRlOxfbZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776906920; c=relaxed/simple;
	bh=I4YTk0OUoQCeLLHKaABN/93W8T4TtJgCIOXCg0VtrbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b64TcK49xCESsdQzldMjVYIMBAL5tMQ0rGYKlcg4kHbvYYblfmShBNdtqY7MonC0nqQd6cQBEeohp7Yc/NwQTMj4nXsqHzxGMwx/MCTM57QfwVip2mbY180P3Iazyw5dFaMueXH0YP9adzskmbuxX3Nt0fPHzeKRZHjcVwqn3MA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LqvVIh0Q; arc=fail smtp.client-ip=40.107.162.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LqvVIh0Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Car8Zte3vNNltUOvwc0dpeTIrh8Y1AFJLQsg3G4OBw6x/f5nh6HrLAjXtnDthMBrGrnYOSXV1pOmG1SpgwCDfySF8nToI+nRN5jP0GfGXvjzeiKEnhkj6SKiGzZSLjVcuZrh3N7WEO3M65YcSACysoy7os1ZWEYykoDLHs7BXgVz5//t0nwd0FABdFaQR01BLrbMcu+PDmpwCOXKRo3D0VX6ZK0w2qmf+AgN4PyvjPTVFWKTuuVNuEpHAI+xttNcycib7C6NE0ctVe8jqFtZOvt0t8nVzxD2AE/Npi27TvRuTezuujkkDgqEshH4oTsn9w1qcK81y5Q7uu4khE/eEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKTZKoybUW6GqMrjGD6CcnixvCD66i4x8vcCiQcZcAM=;
 b=oUbPqVAcd/b47HAlv1g3bsF0rAWtq9vOZlG+JNvUVEcHY022arpG20/oVuJRqSE/W4hsTPXifJBrJmYLT4LJan+NaJ3lTaMjYBaK/dwVCet4o9c3cUr5qRm2LWD/ssxfNm0xi8XSmIzlA/saWhICb3/8Q546ksXaiCQ75NCx3Ed8ccLPpkni4PbR7Lf7CqbE9JsafGYeiaqwDK0b4oNnz5+e2zQzpF7amV4XI5jdyy7OEwMUWCO+HIGxTQnYF+kmUT6jv8WQVzYXM1wATAktBSl7xdvd2EN4C4wbEVJyHwd/tP+mEZIuGic9j+O7b4iI97G0SLk8q+FtqhGEkU4VTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKTZKoybUW6GqMrjGD6CcnixvCD66i4x8vcCiQcZcAM=;
 b=LqvVIh0QTN5dD8ugJrjsTctWSA5qGZ3JTAx1uuO1uMDdDlP699By5hilZtOBFuUI4lPkmKrsjsA9rfr+7YGQfzkBmid3TLEXF5xyR/Mp25/V8bc8kodIWgpEXhu1A4lb6OhrnaKHjODesIPG+nOSCknmLnYd0e39kk25vkt4a4M+AZqau3LHp29ZKNydzqVL6/l+pC7jwZ6kUM4hybhYyiGwuos9WQJhpBYMBk8pZn5gp4hCPSxuXPBLzY0hPu8CMSbGKgAs+nbWaBNb2ajOEcvgEd60BiTtW4kdeG4G7IC9Ty7LbzWJZU1fA2K+dvvC0h50Jj4rS3nGUTYP63Lgyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9384.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.17; Thu, 23 Apr
 2026 01:15:14 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 01:15:14 +0000
Date: Thu, 23 Apr 2026 09:17:47 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC 2/2] clk: scmi: Add support for two #clock-cells to
 pass rate rounding mode
Message-ID: <aelzO5W2HD8zAgxf@shlinux89>
References: <20260306-scmi-clk-round-v1-0-61e2a5df9051@nxp.com>
 <20260306-scmi-clk-round-v1-2-61e2a5df9051@nxp.com>
 <20260422-huge-kiwi-of-tornado-4fce89@sudeepholla>
 <aejUd6L1AfbsflxR@shlinux89>
 <20260422-satisfied-rough-mongrel-aabca1@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422-satisfied-rough-mongrel-aabca1@sudeepholla>
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS1PR04MB9384:EE_
X-MS-Office365-Filtering-Correlation-Id: c8499fe8-764c-4eb0-5d23-08dea0d5c5fe
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|7416014|19092799006|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7L+UX373xOl1ebdDwnmS67n8AogHrQXSKvfu5WsGeqhuG2f22PTBsKB0hlbG7F43jndpYeaZ0CJDCqe5T7MxThqM0Rgol9pX3z5FyQrV0yKGWS0qrK33+77mK0TgW9ZmNWdmlNMtk4nAcyAWas2wUF0lnx3nk4aDBtxaFhncbvKbUv2+zZzgdGufaPCkaK+b6BD+LKDjpdIeXtkT4BLc4OtrzOOcmlfT3wox1CuPFleSzmiEo4iCS6wnUd2ka3VppXQ64uPEPB2wYTVDEqTlXBbmDt/LKZ6JUl0tHGS3s6Kkbd5/VDnP8qJvNkhqcG1OV2lFbmoru/XJOcLKFfQ8DMmNopFYP18K7jTz84nP8ztC/ahZ8oolo6T0F3aC/PTx9mFCZtQGlb3fIbKbiB2lhtsXDosSFVc2tEZepenBlF2Tyys36gWXx+WryYypWYNYH3Qq596I37IKI4nGvv7rOMh81/ESM3po4TtCmb/xKiGsyODLLVRuDFPFw5IwKOcpSFcoNzBzknOuWcTQj8mNTnuxE+9cokuQAaM/KeqOH8qEoq+km0EQ9l1jBtgfYoE4uqDjY1rG2BLAT+8bTr7ffs33m4C/XdgGb5CklnHee6PKrAysoFNyqLoNJ3KAuzc7dYKhPGDHdri9l/JmgHlcSC8dSYqkYuEJrpdd21Zqqgi5UL8/5ag20LTOTz0r0nQmrhpy2Chm5UeRccPLnWmNSgLm9ngY990sBz+rWa/O4nKNL3ZfARg4rgZZj5K+yN3iBUDylWwx8mk8ouK9otA22X3WcpPgP7Voef1jT5m3T5o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(19092799006)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CaK+neef+dCRWLk7SkNiYZiWCV4Yo+tMU5JLPogEvH1frmEVdh8JRAGbX4mk?=
 =?us-ascii?Q?v0VDPTWmTOZRq0KLKSs2t5pLAMVX6g5lrvMVNDDTIE8c/tlF2eVq9AcW6PEf?=
 =?us-ascii?Q?y+7m2As5zXIPK9md+d9pDYlhPS1+BBTWsZ2SZF+qkPGAKpLmNay7ejSiCR1Z?=
 =?us-ascii?Q?IyQcYxpslWfvCGW8DrT7RTTQrjWjL3FTRk8tcNefWmUEH4HdLA/6o5KOSXNQ?=
 =?us-ascii?Q?dVEt+SpPgoQBudvztjW5nNTWiZLE9vPCW+MzIaKLyXSvOr7qrf/8r3Mdo6St?=
 =?us-ascii?Q?5iC8idpoPFKLaNwlKN/1OoXh+YrcWcQwPlQ25ixNjrsYDeSNqklmIM+0CTkY?=
 =?us-ascii?Q?vk4qpY1RXRWIF/w4HssqfcR7Sg+8wHrbztPRyg/W0gtXMHaeJcBb4of/nWk0?=
 =?us-ascii?Q?LqeYzSUaM/Fb7ETd1n2TrT7jCTEYkRhd91crHZP8cxNzPquJE5Wwo1h1cEaO?=
 =?us-ascii?Q?IwQTUpndIBffSii/8RdFMmexH6tlT6uA1+riu8huKaZPP5F1rclDQ6be1lfc?=
 =?us-ascii?Q?1hw6y/TK0wG9qcz3FE+aewFPJIfHZccQIIAZNzylFtNhmN9dr4+rh37cGTR5?=
 =?us-ascii?Q?oQWmOy1N6WXNO/XZ8zodcUGqlZk6Jy73e6LPFAhOV/E2Lp+S6ESW1YgaQnUk?=
 =?us-ascii?Q?I79M/FKILhFP6uNTKcJc9ZrVuwmnLkwU4pepNM4suz+kd4+woomjfUFU7JLn?=
 =?us-ascii?Q?m/AWSPTuPFx3L7eqazkmpZYqXPexo8W5hOEPTOwClT8E7Cq20ite8fFucCRr?=
 =?us-ascii?Q?hkt7NhaxTbpiAaJKzrQeYOaxQi/wxfq6AmLwnXq98oBp+sw/8Smq8cYiRK3B?=
 =?us-ascii?Q?8dTNVT1J0Auxvs8Yw1G+pCMXV0AV4UcZZ0YsKvx+mWLNaqdDANZselPalaYO?=
 =?us-ascii?Q?iyY5Xn2EzbRou4CGoyqk0p1KpRLb4gk/ldE9X9c74Rb3/dHz65IDH/x4KCc5?=
 =?us-ascii?Q?UfEdbrc0NQYug76Gx4Kcrz07keAs3UlWlRfw0IZ/qrk1frpzYDb3Kg4FkcJL?=
 =?us-ascii?Q?YyArRj/iG6Pd5TClLgYjTHS4nxm0Yw7zJ6qw2dJ+3lkmSwxEELMhQr5EOtv7?=
 =?us-ascii?Q?Jo3VPGLEM0tZ61OC5I23wxUTrFOXw+9c8RHhZ5iQ/ExigOK3L7uVIQBBs8OK?=
 =?us-ascii?Q?iIjLypl3qN6LzfwIkMtybybXnsUUbAM8y0ugvBKmvxk/hXfctx/C6R0nItw3?=
 =?us-ascii?Q?VyeB1F6ijoiPcJ1h9lR6OcrEUjwqEZhDM25lfwWP+iaE/wlZiAzwZUEiI80W?=
 =?us-ascii?Q?94Fmus5iopw19+pe8OQO7+w8dK4Q7hKz1T4kRrWjvJIKFbk4ygU1s/8woCRo?=
 =?us-ascii?Q?gtEH5oamJFY42DSYH442tIhHApZJtLfGsylO3DjWKBPQv41cEwMwohzt1tKG?=
 =?us-ascii?Q?xrKJpbYGaha3EHuwXRYhPrqoXM38xaW6k+s7hOGBZfCpR6/ApJB+Iu0txCJg?=
 =?us-ascii?Q?oWsEd8g7Q31Oo+UG973Ls+83UslALHEEym2q8d5yNCIdu5xfDH66n0/hqjFn?=
 =?us-ascii?Q?dYsnDvQ3h/x1Vboiv5u7/D71Ch87l7Rt7VNxC8xxdh83OrLl22ZPSHzhAOtI?=
 =?us-ascii?Q?guWwz3gTVnism43zI1xe01FeU27XceNNh6v8/SVAp7XkW6spSJB5cJqsRiJ8?=
 =?us-ascii?Q?teP/EH/ilp15CJuY2VieVfnMLMjrnQs4lX5XcIhkWy00zHkPxEM3lBFaTStb?=
 =?us-ascii?Q?nIYgOScUWBfKcQvm18Bv58BLep5oSgQ9wxYN4W54ytmw7frAeB04UmdFr+sk?=
 =?us-ascii?Q?9WDpK5yDhw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8499fe8-764c-4eb0-5d23-08dea0d5c5fe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 01:15:14.7301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhmX27TaP9F7CcXrrYNi/2WFfTEQSz32rSNe8Ksu4FppousQCHaWehKVKoAhV/HbOTEOlYLFVTiSDVzzqthrqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9384

On Wed, Apr 22, 2026 at 07:51:03PM +0100, Sudeep Holla wrote:
>On Wed, Apr 22, 2026 at 10:00:23PM +0800, Peng Fan wrote:
>> Hi Sudeep,
>> 
>> Thanks for giving a look.
>> 
>> On Wed, Apr 22, 2026 at 02:14:56PM +0100, Sudeep Holla wrote:
>> >On Fri, Mar 06, 2026 at 02:20:13PM +0800, Peng Fan (OSS) wrote:
>> >> From: Peng Fan <peng.fan@nxp.com>
>> >> 
>> >> SCMI CLOCK_RATE_SET allows the caller to specify the rounding behaviour
>> >> when setting a clock rate. The previously added dt-bindings header
>> >> defines three modes:
>> >> 
>> >>   ROUND_DOWN / ROUND_UP / ROUND_AUTO
>> >> 
>> >> To enable device tree clients to select a rounding mode, extend the
>> >> SCMI clock provider to support "#clock-cells = <2>", where the second
>> >> cell encodes the desired rounding mode. The default remains
>> >> ROUND_DOWN for backwards compatibility with existing device trees.
>> >> 
>> >
>> >Where is the binding update documented ? It's not in 1/2.
>> 
>> This was missed in this patchset, I will fix in new version, if this
>> patchset does not have big design flaw.
>> 
>> >
>> >Also if it can be static in the device tree, why can't it be
>> >autonomously handled in the platform firmware ? I think I know the
>> 
>> Linux passes ROUND_DOWN, SCMI firmware uses round down for clk calculation.
>> 
>> >answer for this but I want to make sure it is a valid use-case and
>> >gets documented here as part of binding updates.
>> 
>> Per info from our video software team.
>> We have some video modes where the best pixel clock rate is slightly above the
>> nominal rate, and the default round down rule (CLOCK_ROUND_RULE_CEILING in SM
>> firmware) can cause the resulting clock rate to be much lower than expected.
>> 
>> disp1pix = 96200000 Hz (desired pixel clock rate)
>> 
>> The MIPI DPHY cannot hit the exact frequency of 288600000 Hz needed for this
>> pixel clock rate, so the next best DPHY PLL frequency is 289000000 Hz. This
>> corresponds to a pixel clock frequency of 96333333 Hz, which is slightly higher
>> than the nominal rate of 96200000 Hz the video mode specifies.
>> 
>> Setting the VIDEOPLL (disp1pix parent) to 289000000 Hz should divide down to
>> the adjusted disp1pix frequency of 96333333 Hz, but here is what happens in the
>> SM firmware:
>> 
>> quotient = 289000000 / (96200000 + 1) = 3.004 => 3 (notice that the SM always
>> receives the nominal clock rate, not the adjusted rate)
>> 
>> If the rounding rule is round down (CLOCK_ROUND_RULE_CEILING),
>> quotient = quotient + 1. Therefore, quotient becomes 4.
>> 
>> disp1pix = 289000000 / 4 = 72250000, which is nowhere close to the target of
>> 96333333.
>> 
>
>I do not think this is the correct interpretation of `CLOCK_ROUND_DOWN/UP`.
>
>`CLOCK_ROUND_DOWN/UP` should apply to the requested `disp1pix` rate itself,
>not to the divider choice in a way that forces selection of the next integer
>divisor and produces a much lower output clock.
>
>Here, the requested `disp1pix` is `96,200,000 Hz`, and the parent rate is
>`289,000,000 Hz`. The achievable child rates nearby are:
>
>`289,000,000 / 3 = 96,333,333 Hz`
>`289,000,000 / 4 = 72,250,000 Hz`
>
>Given those options, the firmware should be able to round the request
>autonomously to the nearest supported `disp1pix` rate, which is `96,333,333
>Hz` (`289,000,000 / 3`).
>
>Under that interpretation:
>
>`CLOCK_ROUND_UP` would permit choosing `96,333,333`
>`CLOCK_ROUND_AUTO` would also likely choose `96,333,333`
>Choosing `/4` and ending up at `72,250,000` does not look like a meaningful
>rounding of `96,200,000`
>
>So the issue appears to be that the firmware is applying the rounding rule to
>divider selection rather than to the resulting `disp1pix` frequency.

User requests 96.2 MHz with ROUND_DOWN semantics, expecting the closest
achievable frequency that does not meaningfully deviate from the request.

Firmware evaluates the parent rate of 289,000,000 Hz and computes:

    289,000,000 / 3 = 96,333,333 Hz

Since this resulting frequency is slightly higher than the requested
96.2 MHz, the firmware, applying a strict `output <= requested` rule,
rejects divider 3 and selects divider 4 instead, producing:

    289,000,000 / 4 = 72,250,000 Hz

This leads to an output frequency that is much farther from the requested
value.

My question is: if the firmware were to select divider 3 and produce
96,333,333 Hz (only ~0.13% higher than the request), would that be
considered a violation of ROUND_DOWN semantics, or is ROUND_DOWN intended
to select the closest achievable output frequency rather than enforcing
a strict inequality against the requested rate?

Thanks,
Peng

>
>> However, if we can use `ROUND_AUTO` the SM firmware would select a quotient of 3
>> in this case, and `disp1pix` would match our target: `289000000 / 3 = 96333333`.
>
>Given the explanation above, I would not support this approach. `ROUND_AUTO`
>should be sufficient for this case if the firmware is making a sensible
>selection.
>
>-- 
>Regards,
>Sudeep
>
