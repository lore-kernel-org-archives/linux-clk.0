Received: from bird.aspen.relay.mailchannels.net (bird.aspen.relay.mailchannels.net [23.83.221.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAABF266B46;
	Mon, 20 Jul 2026 21:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.221.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784583407; cv=none; b=PN/hf7YKvYCliFqK+OIPuovZFDkxt7rH9haphFWE2ax63O3a3lgcoBquK9OcpOVvpK1sgNzAG+8z8IhSs0djFFnTx4ayv7lJUNvkN2wdT7TyEJQaXEq7qYBfBYNQeirO5bwSFrn1AkJ0eH2GHzTW2C+Cen4nhkVoDK2zyi0KqJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784583407; c=relaxed/simple;
	bh=Oxd1gBrvDww9qCRwjEpPrhyRAmacvrq0agWreLO6ioU=;
	h=Message-ID:MIME-Version:Subject:To:References:From:In-Reply-To:
	 Content-Type:Date; b=DAGyR0uXUaMgjdEs/MRJYdGYY6U9iutZWEvJBlj4kQVNLye1mV0zJLASRWPQ3syc7dPTGNz6AhBdzcDR9kXCxyRvzmvV8yBEkMhcbPih/3TZA1cqG7pdBya8U6nPEECgEoaJQ47mtbdM+fR1lDqwqOVEyy/BokeVJsE9SB2JFA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=U3jdafEB; arc=none smtp.client-ip=23.83.221.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="U3jdafEB"
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 015B3460F6C;
	Mon, 20 Jul 2026 20:18:58 +0000 (UTC)
Received: from fr-int-smtpout26.hostinger.io (trex-green-1.trex.outbound.svc.cluster.local [100.104.241.122])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 24DA4462723;
	Mon, 20 Jul 2026 20:18:44 +0000 (UTC)
Received: from fr-int-smtpout26.hostinger.io (fr-int-smtpout26.hostinger.io
 [148.222.54.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.104.241.122 (trex/8.0.2);
	Mon, 20 Jul 2026 20:18:47 +0000
Received: from [IPV6:2404:c0:b201:7057:a80a:fa96:e83f:d8e4] (unknown [IPv6:2404:c0:b201:7057:a80a:fa96:e83f:d8e4])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4h3sKX0WMqz1y61;
	Mon, 20 Jul 2026 20:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1784578723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rZqHcQsxcInfdH1+lWdiNHrIe5Cq1ZhVjgwjFJdfMgo=;
	b=U3jdafEBUzRoJP3kZeYZW6vIETS8//uRQfTA07Y56VSgPW/A87WDKgvyVIXr/F8ONY6wAS
	gfbwsvS8UEVQBNyAj5UV444OL7DRFSq3utungA+4P+CrwL5xQIKecUNXGnyJS0rPtZ8IIj
	dJnHB/FUHV5J/bKq6jDtnsJB6KBhNePuq9dvq12hgqNQJS0zx5bKh5UZ7UggnKKALRUQah
	uECw/737o9A8hjxwiAZShJjqz9OaLjT3D3cpK/bEi96y3iVH0uS8zYjXX3iWVfxUr8YNz8
	z5tYLY5fpiojzAeOXKq0k9f7RiPepG0YMj64DAEJxfz49A500Z/6MWXKY/b4ug==
Message-ID: <3b048b2b-74a8-4e13-ae85-c06883736aca@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] clk: qcom: hfpll: return lock timeout from enable
 paths
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Herman van Hazendonk <github.com@herrie.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260623060517.10889-1-pengpeng@iscas.ac.cn>
 <8e7a4cd1-ff17-4052-938b-5cb2ee8576f0@oss.qualcomm.com>
 <36f37fa0-94f3-498b-86ca-b431436750e1@smankusors.com>
 <198ad9ab-6e8e-4c67-afc2-01962ea12dde@oss.qualcomm.com>
 <5c374231-33dc-4082-95c1-1046286fbb13@smankusors.com>
 <89c53cb1-3804-4dfe-8d93-e27e31bc2254@oss.qualcomm.com>
 <42fa946b-43f7-4f8a-a349-f8509daab749@smankusors.com>
 <e129178c-6079-4538-89a2-247185dd0ce7@oss.qualcomm.com>
 <f1749c0a-bb54-4ddd-94cb-75af9386a47a@smankusors.com>
 <48a406d4-0033-4538-a9bb-75ccc4897a3a@oss.qualcomm.com>
 <39a31586-aa7d-4f86-b50e-3ec6716f8b1d@smankusors.com>
 <1e820910-73e9-4cf3-b6a6-d9ce4c270a5c@oss.qualcomm.com>
Content-Language: en-US
From: Antony Kurniawan Soemardi <linux@smankusors.com>
In-Reply-To: <1e820910-73e9-4cf3-b6a6-d9ce4c270a5c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Date: Mon, 20 Jul 2026 20:18:39 +0000 (UTC)
X-CM-Envelope: MS4xfMM0dTNSzME49X5tFLqfaJIijd3uv9RDfR9TiLzOp8914tL2LaKpRwwYaPWOGwIYXnpC8F3XW7O0v3o1wPxe3DsJ5ACdtQ0isrFdWLKjNyTd6bEi71ZA 6m4kPjXUi4Hb4n9oiCBLIYmoNU36TtH3pcWFkajchj4eVlQNp1cv4Ru1D94Ot2apO5jAk4rcp2fn9RhsaxHvA4RqS9mcVfTvKuNvmWxhSdRuenMKwfuLEbBg iSkVqSUyEIOwjfvuPuf0SXNMeP3UChx2c3vZ4AEB8bGbMkF2fW6g+HfzalXGS9+iO5K9G9I47Z6sD8gMhrAC2hyed1PhwwkwRye+NzlRphxvQiIhLYxraySV 1pXoKMfWtrahNJTJMsq1XK8tBqOg9XkD6yHYIbsd/VEaJF7soaYHThaLxjO0gki5pjRLilM3opBQHBKO1fH1rbJvXjiVzCJRlt11tnQ9Z7ZTIiOXhLPtFePN bo0raA7PcMcDi5gCck194uoAxhAKb3QxlqNfkwZUv17mEkfYnB02ZwQSg2VNwUzMBTVTIU9VvXHrWc8d2VO1MVIFD2IFffmr4v7LEvcoy9E0JJiC0l8upJaa KIQOy913rNyeyfTlmXL7R5Q9y9NhZ9lK3HAfvnAMGN0f0MV9oBdaSEg6LPgTSoUX5bA+0rwL0UTrznIcxyajwed4
X-CM-Analysis: v=2.4 cv=V5Av0vni c=1 sm=1 tr=0 ts=6a5e82a3 a=u213x0X6abLq5DMsW3Q6mg==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=79MBPo83S38qx48hEswA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-AuthUser: linux@smankusors.com

On 7/17/2026 6:28 PM, Konrad Dybcio wrote:
> On 7/8/26 6:04 PM, Antony Kurniawan Soemardi wrote:
>> On 7/6/2026 5:58 PM, Konrad Dybcio wrote:
>>> On 7/4/26 11:02 AM, Antony Kurniawan Soemardi wrote:
> 
> [...]
> 
>>> Can you check the state of the gcc_base+0x3420 register before and after
>>> the /* De-assert active-low PLL reset. */ line?
>>
>> I assume gcc_base is regmap on clk-hfpll.c, I dumped 0x3400 to 0x3420:
>>
>> [   21.089748] HFPLL hfpll_l2 mode_reg=0x3400 (before reset) regs:
>> [   21.089775]  3400:00000002
>> [   21.090300]  3404:7845c665
>> [   21.095944]  3408:00000000
>> [   21.098714]  340c:00000000
>> [   21.101404]  3410:00000001
>> [   21.104098]  3414:0108c000
>> [   21.106787]  3418:00000000
>> [   21.109478]  341c:00000000
>> [   21.112169]  3420:00000703
>> [   21.114858]
>> [   21.120243] HFPLL hfpll_l2 mode_reg=0x3400 (after reset) regs:
>> [   21.120262]  3400:00000006
>> [   21.121903]  3404:7845c665
>> [   21.127540]  3408:00000000
>> [   21.130228]  340c:00000000
>> [   21.132916]  3410:00000001
>> [   21.135605]  3414:0108c000
>> [   21.138299]  3418:00000000
>> [   21.140993]  341c:00000006
>> [   21.143681]  3420:00000703
> 
> Okay, can you try dumping the same register from a running device on
> downstream? The only change in values that we're seeing is BIT(2)
> being set in 0x3400 (which means "set the RESET_N bit", a.k.a.
> "request un-stopping the PLL")

same behavior I think:

[    0.644803] hfpll_enable sc->hfpll_phys_base=0x00903400 
sc->hfpll_base=fa013400
[    0.645017] HFPLL hfpll_base=fa013400 (before bypass) regs:
[    0.645170]  fa013400:00000000
[    0.645414]  fa013404:7845c665
[    0.645566]  fa013408:00000000
[    0.645719]  fa01340c:00000000
[    0.645872]  fa013410:00000001
[    0.646085]  fa013414:0108c000
[    0.646238]  fa013418:00000000
[    0.646390]  fa01341c:00000000
[    0.646574]  fa013420:00000b13
[    0.646787] HFPLL hfpll_base=fa013400 (before reset) regs:
[    0.646940]  fa013400:00000002
[    0.647184]  fa013404:7845c665
[    0.647337]  fa013408:00000000
[    0.647489]  fa01340c:00000000
[    0.647642]  fa013410:00000001
[    0.647886]  fa013414:0108c000
[    0.648039]  fa013418:00000000
[    0.648191]  fa01341c:00000000
[    0.648344]  fa013420:00000b13
[    0.648557] HFPLL hfpll_base=fa013400 (after reset) regs:
[    0.648710]  fa013400:00000006
[    0.648954]  fa013404:7845c665
[    0.649107]  fa013408:00000000
[    0.649259]  fa01340c:00000000
[    0.649412]  fa013410:00000001
[    0.649626]  fa013414:0108c000
[    0.649778]  fa013418:00000000
[    0.649931]  fa01341c:00000006
[    0.650114]  fa013420:00000b13
[    0.650389] HFPLL hfpll_base=fa013400 (after enable) regs:
[    0.650541]  fa013400:00000007
[    0.650755]  fa013404:7845c665
[    0.650907]  fa013408:00000000
[    0.651060]  fa01340c:00000000
[    0.651213]  fa013410:00000001
[    0.651426]  fa013414:0108c000
[    0.651609]  fa013418:00000000
[    0.651762]  fa01341c:00000006
[    0.651915]  fa013420:00000b13

On the other hand, I tested it on mainline again. When I ignored the
lock error, it successfully locked after forcing new rate.

[   17.202127] HFPLL hfpll_l2 enable
[   17.203492] CPU: 1 UID: 0 PID: 12 Comm: kworker/u8:0 Tainted: G 
  W           7.1.0 #49 VOLUNTARY
[   17.203548] Tainted: [W]=WARN
[   17.203562] Hardware name: Generic DT based system
[   17.203584] Workqueue: events_unbound deferred_probe_work_func
[   17.203652] Call trace:
[   17.203676]  unwind_backtrace from show_stack+0x28/0x30
[   17.203761]  show_stack from dump_stack_lvl+0x50/0x5c
[   17.203831]  dump_stack_lvl from __clk_hfpll_enable+0x244/0xe08
[   17.203913]  __clk_hfpll_enable from clk_hfpll_enable+0x9c/0xa4
[   17.204011]  clk_hfpll_enable from clk_core_enable+0xa4/0x2ac
[   17.204103]  clk_core_enable from clk_core_enable+0x58/0x2ac
[   17.204180]  clk_core_enable from clk_core_enable_lock+0x24/0x120
[   17.204253]  clk_core_enable_lock from krait_add_clks+0x394/0x6c0
[   17.204337]  krait_add_clks from krait_cc_probe+0x148/0x388
[   17.204425]  krait_cc_probe from platform_probe+0x8c/0xc8
[   17.204519]  platform_probe from really_probe+0x178/0x4d4
[   17.204603]  really_probe from __driver_probe_device+0xd0/0x160
[   17.204678]  __driver_probe_device from driver_probe_device+0x50/0x1e4
[   17.204754]  driver_probe_device from __device_attach_driver+0x16c/0x228
[   17.204834]  __device_attach_driver from bus_for_each_drv+0x144/0x198
[   17.204904]  bus_for_each_drv from __device_attach+0xd8/0x1c8
[   17.204969]  __device_attach from device_initial_probe+0x40/0x58
[   17.205043]  device_initial_probe from bus_probe_device+0xac/0x124
[   17.205110]  bus_probe_device from deferred_probe_work_func+0x9c/0xf4
[   17.205179]  deferred_probe_work_func from 
process_scheduled_works+0x208/0x53c
[   17.205282]  process_scheduled_works from worker_thread+0x218/0x390
[   17.205369]  worker_thread from kthread+0x110/0x140
[   17.205448]  kthread from ret_from_fork+0x14/0x28
[   17.205504] Exception stack(0xf0841fb0 to 0xf0841ff8)
[   17.205536] 1fa0:                                     00000000 
00000000 00000000 00000000
[   17.205579] 1fc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[   17.205616] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   17.205644] HFPLL hfpll_l2 mode_reg=0x3400 (before init) regs:
[   17.388481]  3400:00000000
[   17.394897]  3404:7845c665
[   17.400793]  3408:00000000
[   17.403484]  340c:00000000
[   17.406174]  3410:00000001
[   17.408866]  3414:0108c000
[   17.411556]  3418:00000000
[   17.414246]  341c:00000000
[   17.416940]  3420:00000703
[   17.419627]
[   17.425007] HFPLL hfpll_l2 mode_reg=0x3400 (before bypass) regs:
[   17.425039]  3400:00000000
[   17.426669]  3404:7845c665
[   17.432650]  3408:00000000
[   17.435168]  340c:00000000
[   17.437859]  3410:00000001
[   17.440551]  3414:0108c000
[   17.443241]  3418:00000000
[   17.445931]  341c:00000000
[   17.448622]  3420:00000703
[   17.451311]
[   17.456701] HFPLL hfpll_l2 mode_reg=0x3400 (after bypass) regs:
[   17.456733]  3400:00000002
[   17.458350]  3404:7845c665
[   17.463987]  3408:00000000
[   17.466765]  340c:00000000
[   17.469455]  3410:00000001
[   17.472147]  3414:0108c000
[   17.474837]  3418:00000000
[   17.477529]  341c:00000000
[   17.480219]  3420:00000703
[   17.482908]
[   17.488298] HFPLL hfpll_l2 mode_reg=0x3400 (before reset) regs:
[   17.488330]  3400:00000002
[   17.489950]  3404:7845c665
[   17.495583]  3408:00000000
[   17.498363]  340c:00000000
[   17.501052]  3410:00000001
[   17.503744]  3414:0108c000
[   17.506434]  3418:00000000
[   17.509125]  341c:00000000
[   17.511817]  3420:00000703
[   17.514503]
[   17.519890] HFPLL hfpll_l2 mode_reg=0x3400 (after reset) regs:
[   17.519922]  3400:00000006
[   17.521546]  3404:7845c665
[   17.527181]  3408:00000000
[   17.529873]  340c:00000000
[   17.532564]  3410:00000001
[   17.535253]  3414:0108c000
[   17.537945]  3418:00000000
[   17.540637]  341c:00000006
[   17.543326]  3420:00000703
[   17.546015]
[   17.651400] HFPLL hfpll_l2 failed to lock, val=0x00000006, ret=-110, 
hd->lock_bit=0
[   17.651474] HFPLL hfpll_l2 mode_reg=0x3400 (after lock fail) regs:
[   17.651505]  3400:00000006
[   17.657905]  3404:7845c665
[   17.664147]  3408:00000000
[   17.666839]  340c:00000000
[   17.669529]  3410:00000001
[   17.672221]  3414:0108c000
[   17.674911]  3418:00000000
[   17.677604]  341c:00000006
[   17.680295]  3420:00000703
[   17.682981]
[   17.688367] HFPLL hfpll_l2 mode_reg=0x3400 (after enable) regs:
[   17.688398]  3400:00000007
[   17.690023]  3404:7845c665
[   17.695659]  3408:00000000
[   17.698436]  340c:00000000
[   17.701127]  3410:00000001
[   17.703818]  3414:0108c000
[   17.706509]  3418:00000000
[   17.709200]  341c:00000006
[   17.711892]  3420:00000703
[   17.714578]
[   17.790450] L2 @ Undefined rate. Forcing new rate.
[   17.790583] HFPLL hfpll_l2 set_rate 783000000, parent_rate 27000000
[   17.794174] HFPLL hfpll_l2 disable
[   17.800338] HFPLL hfpll_l2 enable
[   17.803805] CPU: 0 UID: 0 PID: 12 Comm: kworker/u8:0 Tainted: G 
  W           7.1.0 #49 VOLUNTARY
[   17.803833] Tainted: [W]=WARN
[   17.803841] Hardware name: Generic DT based system
[   17.803853] Workqueue: events_unbound deferred_probe_work_func
[   17.803894] Call trace:
[   17.803910]  unwind_backtrace from show_stack+0x28/0x30
[   17.803957]  show_stack from dump_stack_lvl+0x50/0x5c
[   17.803993]  dump_stack_lvl from __clk_hfpll_enable+0x244/0xe08
[   17.804035]  __clk_hfpll_enable from clk_hfpll_set_rate+0x134/0x13c
[   17.804070]  clk_hfpll_set_rate from clk_change_rate+0x240/0x7b0
[   17.804117]  clk_change_rate from clk_core_set_rate_nolock+0x230/0x4ac
[   17.804155]  clk_core_set_rate_nolock from clk_set_rate+0x70/0x18c
[   17.804186]  clk_set_rate from krait_cc_probe+0x270/0x388
[   17.804218]  krait_cc_probe from platform_probe+0x8c/0xc8
[   17.804263]  platform_probe from really_probe+0x178/0x4d4
[   17.804302]  really_probe from __driver_probe_device+0xd0/0x160
[   17.804336]  __driver_probe_device from driver_probe_device+0x50/0x1e4
[   17.804370]  driver_probe_device from __device_attach_driver+0x16c/0x228
[   17.804406]  __device_attach_driver from bus_for_each_drv+0x144/0x198
[   17.804439]  bus_for_each_drv from __device_attach+0xd8/0x1c8
[   17.804469]  __device_attach from device_initial_probe+0x40/0x58
[   17.804502]  device_initial_probe from bus_probe_device+0xac/0x124
[   17.804532]  bus_probe_device from deferred_probe_work_func+0x9c/0xf4
[   17.804566]  deferred_probe_work_func from 
process_scheduled_works+0x208/0x53c
[   17.804613]  process_scheduled_works from worker_thread+0x218/0x390
[   17.804653]  worker_thread from kthread+0x110/0x140
[   17.804692]  kthread from ret_from_fork+0x14/0x28
[   17.804719] Exception stack(0xf0841fb0 to 0xf0841ff8)
[   17.804735] 1fa0:                                     00000000 
00000000 00000000 00000000
[   17.804754] 1fc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[   17.804771] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   17.804786] HFPLL hfpll_l2 mode_reg=0x3400 (before init) regs:
[   17.984017]  3400:00000000
[   17.990438]  3404:7845c665
[   17.996335]  3408:0000001d
[   17.999024]  340c:00000000
[   18.001717]  3410:00000001
[   18.004402]  3414:0108c000
[   18.007093]  3418:00000000
[   18.009784]  341c:00000000
[   18.012477]  3420:00000703
[   18.015163]
[   18.020544] HFPLL hfpll_l2 mode_reg=0x3400 (before bypass) regs:
[   18.020564]  3400:00000000
[   18.022203]  3404:7845c665
[   18.028196]  3408:0000001d
[   18.030706]  340c:00000000
[   18.033397]  3410:00000001
[   18.036090]  3414:0108c000
[   18.038781]  3418:00000000
[   18.041474]  341c:00000000
[   18.044161]  3420:00000703
[   18.046851]
[   18.052236] HFPLL hfpll_l2 mode_reg=0x3400 (after bypass) regs:
[   18.052258]  3400:00000002
[   18.053891]  3404:7845c665
[   18.059525]  3408:0000001d
[   18.062302]  340c:00000000
[   18.064994]  3410:00000001
[   18.067685]  3414:0108c000
[   18.070374]  3418:00000000
[   18.073073]  341c:00000000
[   18.075761]  3420:00000703
[   18.078449]
[   18.083837] HFPLL hfpll_l2 mode_reg=0x3400 (before reset) regs:
[   18.083857]  3400:00000002
[   18.085488]  3404:7845c665
[   18.091126]  3408:0000001d
[   18.093899]  340c:00000000
[   18.096595]  3410:00000001
[   18.099286]  3414:0108c000
[   18.101972]  3418:00000000
[   18.104667]  341c:00000000
[   18.107357]  3420:00000703
[   18.110042]
[   18.115437] HFPLL hfpll_l2 mode_reg=0x3400 (after reset) regs:
[   18.115460]  3400:00000006
[   18.117084]  3404:7845c665
[   18.122725]  3408:0000001d
[   18.125411]  340c:00000000
[   18.128101]  3410:00000001
[   18.130799]  3414:0108c000
[   18.133483]  3418:00000000
[   18.136177]  341c:00000001
[   18.138862]  3420:00001703
[   18.141553]
[   18.146952] HFPLL hfpll_l2 mode_reg=0x3400 (after enable) regs:
[   18.146977]  3400:00000007
[   18.148592]  3404:7845c665
[   18.154237]  3408:0000001d
[   18.157008]  340c:00000000
[   18.159696]  3410:00000001
[   18.162387]  3414:0108c000
[   18.165085]  3418:00000000
[   18.167775]  341c:00000001
[   18.170465]  3420:00001703
[   18.173150]
[   18.194244] L2 @ 391500 KHz

-- 
Thanks,
Antony K. S.
