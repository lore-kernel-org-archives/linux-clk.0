Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171075;
	b=anvuWLhoossiORb3M3XXMs5q9owZ7bl4nHfBQDBKvghQlPtDn0t9LVI4iBXu2Ettv946
	 x+Xd7lIjXviMa0CaWQSguMZMnrIiNrFfSjfRH+7zGw/P+jxzCVv9x1MitVrHdLD6MxYaY
	 GlbygMHSrcoze50LhlAfJ3AaS3JaNOxBd+QhuLMaPbYd2oD0mNfcJcAGri41gZijZHvar
	 LU8EOf20CwIxeae2v7hGCS8aFdxa6Yyw2jqW5p8l7U5YmzuiZ4IzST91u5rFOUGewyTvX
	 h7shKEmV7U9N1s2M3cLaktJh4GBTmPTIlfaHtR+xi+bDJ4qSHPC7CeFiO0gL42gzERw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171075;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Le0RPn46jHF9e4i2vrYXLIAxlLMBBuxuXIJhsmU5VKw=;
	b=Am7HthhIcfCVzxBA4CUGYpPtSLScVSTVpw4QYMPDkBa+IzWh6FoHFzWmkkWMPqIbAFW5
	 99gkAK5KKqdbTzMuFtudV6DUkVEwCAYLDjoHaot4CUffOBuhoWTMckg63cl3VLl1gR6YN
	 v51tQ2Z+gTQHZ2xZYhF5hvboWAf9+5142unaDWPrmCxCDFDvGvLBdsHYTzsNfHsNZnjKw
	 1pnxl6tcczwgPox9LXElKN3u9CVc9VL2yT3tRBTHoV2s6HF1RWsAmFkLWZ6wgXEvfatEu
	 54q834hHcBnPHYyLplGAjteLIPayXe2/hFIlDTNzJAswgAv9pDOIQkmoHED1eNTnZ3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=rZe7hFEZ;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b="SuASMjD/";
	arc=none smtp.remote-ip=121.127.44.73
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F13606A320
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27F13606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=rZe7hFEZ;
	dkim=pass (1024-bit key, unprotected) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=SuASMjD/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795171073; bh=Le0RPn46jHF9e4i2vrYXLIAxlLMBBuxuXIJhsmU5VKw=;
 b=rZe7hFEZvxUaYGRUU7eGxoZDUblRwddO0FdfpWGiBgC11mdYNkYhJmJQjo+sN/MRuM6oDN4z1
 yEAiVRvRkWPhBE1THl2GDSuZ2XfVJ4GxddFGzJCaMHA50JiYYFJLC7YTa92knjvcMyo6qTYGRVm
 F6bqI6xRSa9XCU3ZzB2YaGJGjKZNpr71ZgYPIV1MsQhxMRkk/ey04JHgCeo3lMmb6U80IRBUfRY
 Gizy+YxiPrfncByerK6JbqVesll8FCijrV5NZghbiVFT50nyxvBSZz8QRu6eZHoUYUe3/cI0A17
 PPqJd8VKl4Ck5ABwVBzmwKOd1P+URpO8oR8kj00zAoEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795171073; bh=Le0RPn46jHF9e4i2vrYXLIAxlLMBBuxuXIJhsmU5VKw=;
 b=SuASMjD/jWLq15whfw0gDOVega3Z0WHXE8tqjjDKG82o1ZVkKI6KO2ZkNIbZ+dvbKRteuNdTi
 vX7HqETi2JIpc+Rf7a/QsCeJzk53G9AzBSEwn5K2ZCQakEKDsub4JsCaR6DF9JgMIR3dScNH/pm
 53l1Jq4lHZS+vsDnLXfJr/0=
CFBL-Feedback-ID: 6b0022e231c8f29e7611d90e:8bdc011d3cb26b1315eaa2ace58e4003
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b0022e231c8f29e7611d90e
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.19.33
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <38fbfd13-526c-47cd-b723-2ac4e77682ae@kwiboo.se>
Date: Fri, 20 Nov 2026 11:37:18 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] dt-bindings: clock: rockchip: Add RK3572 CRU
To: Cunhao Lu <1579567540@qq.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Richard Cochran <richardcochran@gmail.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, netdev
 <netdev@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261117-add-board-ok3572-c-clk-v6-0-cabad6610c5f@qq.com>
 <20261117-add-board-ok3572-c-clk-v6-1-cabad6610c5f@qq.com>
 <34dbd46a-29cc-4b86-b9cb-9477dc0a4da8@kwiboo.se>
 <tencent_BB5901AB88D47E874D0E348B32A609A92308@qq.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <tencent_BB5901AB88D47E874D0E348B32A609A92308@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Cunhao Lu,

On 11/20/2026 10:40 AM, Cunhao Lu wrote:
> Hi Jonas,
> 
> Thank you for your review.
> 
>> [...]
>>> +#define PCLK_DDR_MON 527
>>> +
>>> +/* Secure clocks */
>>> +#define ACLK_CCI 600
>>> +#define SCLK_DDR 601
>>> +#define CLK_STIMER0_ROOT 602
>>> +#define PCLK_SECURE_S 603
>>> +#define HCLK_SECURE_S 604
>>> +#define ACLK_SECURE_S 605
>>> +#define CLK_PKA_CRYPTO_S 606
>>> +#define PCLK_KLAD 607
>>> +#define HCLK_CRYPTO_S 608
>>> +#define HCLK_KLAD 609
>>> +#define ACLK_CRYPTO_S 610
>>> +#define PCLK_OTPC_S 611
>>> +#define CLK_OTPC_S 612
>>> +#define PCLK_WDT_S 613
>>> +#define TCLK_WDT_S 614
>>> +#define HCLK_TRNG_S 615
>>
>> Are these secure clocks meant to be used as SCMI clock ids? Why a gap from
>> 527 to 600? If I am not mistaken SCMI ids should similar to Linux clock ids
>> start at 0 and be a consecutive series.
> 
> Yes, these are SCMI clock IDs. The CRU IDs end at 527, but the SCMI
> IDs are a separate set. The vendor header [1] uses 600-615 for this
> group, matching the IDs in the released RK3572 BL31 firmware.
> 
> I haven't found the RK3572 BL31 source on GitHub, so I can't rebuild
> the firmware. That also means I can't change the clock IDs it exposes
> via SCMI. If I numbered this group from zero in the binding, Linux
> would request ID 1 for the DDR clock, but the firmware on existing
> boards expects 601. With those IDs, I wouldn't be able to read the
> correct clock data on my board.
> 
> I'll add the SCMI_ prefix in the next version and keep the firmware IDs
> unchanged.

Great, I think the SCMI standard may dictate that IDs should start at 0,
and I expect the vendor firmware possible would fail SCMI validation.

Not sure there is any point to use different IDs for vendor and mainline
firmware. Hopefully we can nudge Rockchip to closer follow specification
in firmware for next SoC.

> 
>> [...]
>>> +/* CRU-->SOFTRST_CON01 */
>>> +#define SRST_ARESETN_TOP_BIU                     0
>>> +#define SRST_PRESETN_TOP_BIU                     1
>>> +#define SRST_ARESETN_TOP_MID_BIU                 2
>>> +#define SRST_HRESETN_TOP_BIU                     3
>>
>> Please drop the unnecessary/redundant RESETN in all constants. The SRST
>> prefix is already a short for Software Reset.
> 
> I'll fix the names in the next version.
> 
>> Please see [1] for the header I prepared for U-Boot mainline RK3572 support,
>> it should have all these symbols cleaned up, to match naming patterns used
>> for all currently supported Rockchip SoCs.
>>
>> [1] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/blob/rk3562/include/dt-bindings/reset/rockchip%2Crk3572-cru.h
> 
> Thanks, I'll follow the naming convention in your header in the next
> revision. I did notice two possible issues with the reset IDs:
> 
> Your header skips 421 between SRST_LINKSYM_HDMITXPHY0 (420) and
> SRST_P_PHPPHY_CRU (422). I've fixed this gap in the current patch.

Looks like I just applied renaming and not re-numbering, so this gap
originates from vendor source header. Good catch :-)

> 
> Your header also assigns ID 453 to both SRST_H_PMU1_BIU and
> SRST_H_PMU1_FW, but the lookup table [2] maps them to bits 9 and 10
> of PMU1 SOFTRST_CON03, respectively. Could you confirm whether these
> two reset lines are meant to share an ID?

This duplicate seem to originate from the reset header in vendor U-Boot
v5 branch [3], that I used for my mainline U-Boot work on RK3572. That
and the fact that I did not re-number the indices. So I am expecting the
vendor Linux 6.12 version is more correct (does not contain the vendor
U-Boot duplication of 453).

[3] https://github.com/rockchip-linux/u-boot/blob/v5/dts/upstream/include/dt-bindings/reset/rockchip%2Crk3572-cru.h

Regards,
Jonas

> 
> [1] https://github.com/rockchip-linux/kernel/blob/470f9dccbdc42e7b8a824d0a5c5640a10e9457d2/include/dt-bindings/clock/rockchip,rk3572-cru.h#L542-L560
> [2] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/blob/85afc941266af08ab30a897dde794f952321025a/drivers/reset/rst-rk3572.c#L605-606
> 
> Best regards,
> Cunhao Lu
> 
> pw-bot: cr

