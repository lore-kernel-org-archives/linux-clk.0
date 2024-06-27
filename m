Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2015.outbound.protection.outlook.com [40.92.102.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFC613DB99
	for <linux-clk@vger.kernel.org>; Thu, 27 Jun 2024 10:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.102.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719484022; cv=fail; b=nIVQEnebAHcVLFUrOD+SUs1cDo/0P+kp3pd/k3HTXa8TYchtonl1RzRNi3yZb44poWzzUxktwPCmXYWyia8ja+7mA7qev7W/BoJAoJMsDh9VGeGq70UkykjE7uzlbARIhj3QRFR7OplHSWK2D6nGrsUjNJMOZk+tAkV8Tk+50uE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719484022; c=relaxed/simple;
	bh=/BWYnAtO312kx4i+XP5933tSKDsy82TF5QuYk8pVhgs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tOdbsrX5hfyExkvw41wa1vkxSZUcpMmyFFJe2qy2C6DeKmMkJYt1QhIAc9rddELauHCOoLVmfDTyoC9ZlyvEOWuro13Ju/Psh6Bo1/i/uddm9S8Z5wge6lKLrRCJ8MX3Mxfj93EmAx1xPA6vFF7GZH6KlOfrpMAZPb6WH4Q+B8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Iz4NEW8G; arc=fail smtp.client-ip=40.92.102.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Iz4NEW8G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVR3dXDRvM+lpkNM6VPf90erxnHWb6qEWsAW2fwwd3RDPOWwiWFUW1ws2dK7S1oyKN8+fxTldY9lpLeFY18NV4pUn+N5OpaizqCKa1XCmCOW6vAWGDfgklHf+2LkiOOWz8B7/ko9NwIHZ5T3qMYA/x7Y6gpdMP7YYdwvjLKgqKxowc/e4XhBJv+n8rqIgrC33u6aUrQuYxgGmAa7OFR/AZFnN0p8woYXjvqLbEhBjBt2R+PNkIL3fX43wqLMGL5um+9uBg/BL334lS5dNg6CMu1phkJRgUMkawO8wm6Dh+IUekX32zcVfT5S6cBmc3mKrMLIy83CzH5tROROJFOKFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGQijwsUKmQcc+X0Df3FQaPFW5dPslKK3Eblr0nCLEw=;
 b=M9lDjdmSopyIqHpmusxqNNRd20GUyIks2JI1EckWMb36XT3CAhZyWjpE9M+dBWGTPFdAjphMJVOwdMEg6rOSVZUKXthtxl6tt0O3oOlZ/OHgDZMFD5v7xx39U+9dX9eAkpSHnv6cPuNPR4NcoeSbNT8kaKH2ogt/SEO1Mo4vVFdaOVwzKnLo5Tj8ElgmhgCIifggw0NEwitESzFL7JEjSb6U8V1OcXx4slAs3/ihf6R2k6cGhmRKMJ4ai2Pml13e/+kOi11kc+sIjk4rMnDKuWpOecZOcHIcj7U4DkrAaDYXl+sJoPix6Onb/m0jDFfkkp98dAbJxAgLhkwEa11Pxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGQijwsUKmQcc+X0Df3FQaPFW5dPslKK3Eblr0nCLEw=;
 b=Iz4NEW8GVTJHq0McM622SJmhwP+yF6ReuTkm4C35SuWHAz3zP/aHIlST+lhrHAwX/goj4M0YVzvbJF2IcZxau0hKXdlvo7EQIiO0JjdWbj55vv62AWHshtOmeb2ElgpcPP2Y4K9DGYHwIGXqxlNhafpAroJr2WhARj1grwJXYWMt2XfXc9fyKgcFeE8Zbw2avg/cxdKxfTDPfVsNFmdkYNnxeNzk0TUAF7R3KZrZ4OSaHS706CaI8RVWHIh5Dqi+QIMJVikaMU9AKENYb6nez5dnqdnuDboVD0EJehuBDfDT3Ti0jM30NjmVXkd53w8geM0eP57z5k3YXxLjbPa9eA==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB2033.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1be::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 10:26:55 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 10:26:55 +0000
Message-ID:
 <MA0P287MB2822C5A4682AE9EA6AB3B9E4FED72@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 27 Jun 2024 18:26:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] RISC-V Sophgo SG2042 clock drivers for v6.11
To: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Inochi Amaoto <inochiama@outlook.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com,
 Chao Wei <chao.wei@sophgo.com>
References: <MA0P287MB28221A333D852974F55E3228FEC22@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <MA0P287MB28221A333D852974F55E3228FEC22@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [frVb8Y0GZU91gVkt3KE1nnhhKncG4jGw]
X-ClientProxiedBy: SG2P153CA0030.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::17)
 To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <c8c2a2e9-6732-4b8b-b885-11bd4f1658b4@outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB2033:EE_
X-MS-Office365-Filtering-Correlation-Id: deea45d8-a615-4f06-f5ec-08dc9693a953
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|1602099012|3412199025|440099028|4302099013;
X-Microsoft-Antispam-Message-Info:
	f4jKOJU3RdoI292FPtmiG5Oqhr70eSX9OIRYDc1uLr39aX9ZljvZOij+haSt4WPuL6aBDJDU/aQbINQOuiC3M+d+IeYCwwLaxhVJLUO+fZ4eYc02KnhGiwax52Jv4uebFe9/uhLHm6yZ5s8Vl3fXVABzwzSbYbN75pawKTjMm141wNPvzmOsEWjSh+S/7dF1NWNLZmCyBpSLumsJvnxOrqTuvXbepCVa77GD1Gl1Vx2ScfX4Zvnqxr+C1l9ZBV5Fo16J9UwkBd+firAUXid08wb6NaZGOrW3F4pi0rmkRt6RJVsyPDKHF1yUj2NTVQE6ANgJPGOGYzs6AZHIQkzMtoxV83799zWZO5Q32mOLOQP1buOCmRz4imphO97aqgcgzXRQhoez8SJXtuKgPCf+THzwG7HaUWU3ZVToz9gdNuueKotEdb7yiIMaNnOnU2fI/wO/oUrg8Q/oiDfUB6veWNYXOD0OfEMEs5oelttNOpxMxH2FPEJfsK5qFEDTNFV9na2uaSG0DYDlNst09FIIXfIo8VEPcqP0ZdXEtGMbAfU5Qh1hftW0rB3hif++cCpqW6nr3nHqA3BqvBQPMbkD7u83rrAqcrIKVirhAQvMcsrAdOEl7Bpl+H3OYyNvtFGUKUJ7OLS6J6QUgzPHYwAmXntRWQxhCTNE0g8L/jG5D/zw2MzzbBgrS3+Q4ADqYwcbAxabXgRfJXCU+hKniZpqfw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VksrRk91S2VvUmd0YkZWSi9uMHFKL3pka1FETGJkVk5UcDRUL3gvOFJEK0pt?=
 =?utf-8?B?MzIvMi8vbkdXSzFXQ1lUQ1oreTlWbGd0NkZuZ0sxajdKVE8zK1RLcFJ6M2FF?=
 =?utf-8?B?Rzh5dXk2NVdId1JIQ0FoVzk2eWQ3K2lWZjdwcGE4RGxPN0ozb05TTEdzZVpl?=
 =?utf-8?B?K1R1eEgwcVFvS1FDbXFaR0h0bXkxM0NxKzV0N0grazY5TWFoNUhTZkg1ZWxV?=
 =?utf-8?B?QjFMdFdjNHJxU3ozRHBTRVpZSmQzWmlqNllWaVhRcGJyanQzQWtZa0oyeTds?=
 =?utf-8?B?K1pBU212WTBTNGhiQkM5a0M1WkdXM2REWHMxREQ4Z0JVb0hNUjBmVlJFNW1D?=
 =?utf-8?B?cFJuMU5McFRRTjlMa09RQW1WQ290MFVOY0tvbDZ0dEdYYWswaGE1a01vRnBO?=
 =?utf-8?B?ODVHT0VOVFpCRE5nNjNHMzl0RWJsOW1Icmg1QnB0UG8wZjFZUFZmRHhabm9T?=
 =?utf-8?B?RGVhUzFpdFJXM3FwcDZVN3V0NXhIUnY5Ti9xYnN2WDNTaUJWTjNnWUZURDlP?=
 =?utf-8?B?NnVuRXROOXNBZms1MGRCQlYycTB5WEJnL0x0RTRscXFoZnNTdWQwS3VSZWd0?=
 =?utf-8?B?aGU2SS9NVnJLc3lHK2Z3SGxQcEpqMjNqZGpoMUY4bXJjWk5VSmJyckxzdVNW?=
 =?utf-8?B?ekY4OGxkZmFndi9zTVdCaFFibDF5TjY3eDQ4WGRJZmF3dVc3OTVRTkdCS3lJ?=
 =?utf-8?B?MDAzQVhNYTBCcmdtc1VtZEJHalArbEZ6a2ZPcUJva0cyc3BZWlBmT3EycVh5?=
 =?utf-8?B?L0NNRE90QURza29sQUUxUFdDQzBqc3dsU1lNY3ZIQ1dHMktsd3ZRT20xRTRN?=
 =?utf-8?B?a2tZNkl6ak9QTlh6NnZsMWkyME93OEVPOFlPQ2VBeFlWYU01ak5rTmgyR0pv?=
 =?utf-8?B?ZHZ6TzdZQTg1Zm5JYUpwYWdZQ2JaTDFaQnF0eFdPU3VmR1k4K05TOEpXRjVl?=
 =?utf-8?B?Tk9BSy9Yai9oWWxHNmdURVFVNWxOQ0o1Q0JkTERnWWdNdlNBYzBxS0dlcStp?=
 =?utf-8?B?blJ4NDlha2U1a1M5VExUSGZzMHRuV0l2d01vSHZUK1hvN3VHNXFSbHZPUVR3?=
 =?utf-8?B?R2NlcGU1WnJVYVllUmY1SEpydDV2RjBNTzByRVhZcFdTeUtjTHozdlNpQzcr?=
 =?utf-8?B?ZjNCWE1POWNJWjE2VlE0cS9oanZOS3FvR3FPU0s4ZmNQSHFXNE1xR3crYWFw?=
 =?utf-8?B?UzBSR1lHYkthbjA5WU1oMHV0TU9iK3p2OTNESFJSNHF3ZTROdWpBdzV0cFpx?=
 =?utf-8?B?RGFEWURCcG1SNW5ncDRGU09CZDZXR3U3d0VGbXlPa0J1dHZhOXo3RmxJN05i?=
 =?utf-8?B?OVZPWlAzVmR0K0lQdE9uTzZxaUk2YWU5cE5ZaUprMXdEbjM5Qy91ZDJkZ1ZP?=
 =?utf-8?B?dm5sS2xNVWViSzBlUGIvNFNaSzlBUjNFQUZ3MFNid1paNWFNOHl2MjBJV2tp?=
 =?utf-8?B?Q0JhQUVOSWYydlF5RS9Pd1dEc3g4U0tKdm5WWXdrenlMZUNHNFNHUC9CY3RC?=
 =?utf-8?B?WGpobWZzRFRsTDF4akltQ2JGZFZEb1EvSGdiWUZXWThTNnBWc05QTDRqTmh4?=
 =?utf-8?B?aWs1Z2xES29LMjljU3hodWpqL0EwMnNXTW9wQVFCL3lRNDJlVnVDTXNwcVVq?=
 =?utf-8?B?TEpNKzZ2SjRtTnd4bnV6UnVneGs3aGFWdVdmdHBhRjJUaCsxeFNOWVU3VmRr?=
 =?utf-8?Q?/ziYCfr13WXb7b2WUoYH?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deea45d8-a615-4f06-f5ec-08dc9693a953
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 10:26:54.1101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB2033

Hi， Stephen，

Is it ok for you to pull this patchset？ I readlly hope we can get this 
in v6.11.

Thanks,

Chen.


On 2024/6/14 15:28, Chen Wang wrote:
> Hey, Stephen,
>
> Please pull clock changes for RISC-V/Sophgo/SG2042.
>
> For dts part, I will handle it at my side.
>
> I send this PR just want to expedite patches for this clock driver. 
> The patches have gone through 16 rounds of review [1], and I have 
> carefully checked and revised all of them based on everyone's comments.
>
> Link: 
> https://lore.kernel.org/linux-riscv/cover.1717661798.git.unicorn_wang@outlook.com/ 
> [1]
>
> Thanks,
> Chen.
>
> The following changes since commit 
> 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
>
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/sophgo/linux.git tags/riscv-sg2042-clk-for-v6.11
>
> for you to fetch changes up to 48cf7e01386e7e35ea12255bc401bdd484c34e7d:
>
>   clk: sophgo: Add SG2042 clock driver (2024-06-14 14:49:40 +0800)
>
> ----------------------------------------------------------------
> RISC-V SG2042 clock driver changes for v6.11
>
> Sophgo:
> Added clock support for sg2042
>
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
>
> ----------------------------------------------------------------
> Chen Wang (4):
>       dt-bindings: clock: sophgo: add pll clocks for SG2042
>       dt-bindings: clock: sophgo: add RP gate clocks for SG2042
>       dt-bindings: clock: sophgo: add clkgen for SG2042
>       clk: sophgo: Add SG2042 clock driver
>
>  Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml |   
> 61 +++++
>  Documentation/devicetree/bindings/clock/sophgo,sg2042-pll.yaml |   53 
> ++++
>  Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml |   
> 49 ++++
>  drivers/clk/sophgo/Kconfig |   28 +++
>  drivers/clk/sophgo/Makefile |    4 +
>  drivers/clk/sophgo/clk-sg2042-clkgen.c | 1152 
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/sophgo/clk-sg2042-pll.c |  570 
> ++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/sophgo/clk-sg2042-rpgate.c |  291 +++++++++++++++++++++
>  drivers/clk/sophgo/clk-sg2042.h |   18 ++
>  include/dt-bindings/clock/sophgo,sg2042-clkgen.h |  111 ++++++++
>  include/dt-bindings/clock/sophgo,sg2042-pll.h |   14 ++
>  include/dt-bindings/clock/sophgo,sg2042-rpgate.h |   58 +++++
>  12 files changed, 2409 insertions(+)
>  create mode 100644 
> Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
>  create mode 100644 
> Documentation/devicetree/bindings/clock/sophgo,sg2042-pll.yaml
>  create mode 100644 
> Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml
>  create mode 100644 drivers/clk/sophgo/clk-sg2042-clkgen.c
>  create mode 100644 drivers/clk/sophgo/clk-sg2042-pll.c
>  create mode 100644 drivers/clk/sophgo/clk-sg2042-rpgate.c
>  create mode 100644 drivers/clk/sophgo/clk-sg2042.h
>  create mode 100644 include/dt-bindings/clock/sophgo,sg2042-clkgen.h
>  create mode 100644 include/dt-bindings/clock/sophgo,sg2042-pll.h
>  create mode 100644 include/dt-bindings/clock/sophgo,sg2042-rpgate.h
>
>
