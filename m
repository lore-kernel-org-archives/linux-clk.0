Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794433952;
	b=kfZrGIOAXVx1j3wBwIRGquTZI4L2OoiGFxfvxUcAJV/kNugKhIyOTPfFwDZNlTPtqXA9
	 vvNM7RfThfNiY0itfwIwf16Uvz6XagWCr2oheoakU8qtTFksz/O74YS05XKwsS2/CcdHi
	 +SMgdZXQfLRns8XmRrNaiJ9L/GQIVB/7QKU5BxlwL9knwJEMpdET8SBthc+ML5/U+I5Mo
	 hc5WzTB6IGbVYTGSgMcZZz4fsMbB6ho9LB1AWL7Rv8Ymlocdkex3ZY9MQuh+JnrgfPzPS
	 Dq1jpHLBQv2iMlN1ltARiJUbZZRGaVS9iAF2goPEXTkVMW8PUoVuBvOt/+McRMeFhAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433952;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=D6hCekAJRvtT/gsERRUrqUGcHPO5tKx1ofDScjDZRh0=;
	b=f9SFPSCk+pFY1MKHrvyJPIqiMocdKJSWVFtC8r3Ya3dRnsO6YGuB76zAYpjpOnL226Bx
	 1z+r+Q5Y79vaqowC8zrKQKIsmJ7/WI51HTJtHTcZ3foJvIaYqvX9IVm53js/wiuWCI/0t
	 sPWVCweeBJVJAg42ERpSI95kTUKENmUgpcuexBtho/E8tN4ZZKFBD2TcKWcr/NjVWT3Eq
	 gKya76ldPwJ1mF9uguBj7Lx89nyH+Ux9B7dIiGnLk1O3fCUvpRwE6oucFQNAxr2XKp1lF
	 GV5+/KTWqUOdA+DdYmFF6iJcAkIdBNdjx6YY3xh5iPrpcykq/BKK83GWU3rJbFuMUXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=iZgTz9A7;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=xcLU2iJQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.53
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CE1606A31C;
	Wed, 11 Nov 2026 21:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7CE1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=iZgTz9A7;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=xcLU2iJQ
ARC-Seal: i=1; a=rsa-sha256; t=1794433918; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=fAPeKixB+RXe9pPCGJNsqLToji+blijLDURopXla73RsYy0/EJbf3gXFoIEJzoJecD
    UJjVx8wxT38NETa5i8XL8MM8OsBzU4ec5Sf9AUgDWe/CPaUwTmNV9e1JQHBIguVmPLrS
    Bu2UTqkdnmARKTKW5wwhNYyUmfkkx/NkZlRr8p4daanVhiK6wN86QIwVO5yONmol6WLo
    c+Zc5Icn/5vXTnbrPwlguH/jTJfodMhWS0mmSttcDgXRgIUCZL8S+YpaOra1jVRuJXB9
    gLIPvvMYNDwjY3ELCk/fiMsh6kKGuauD3qsSBC/d8XxL4HfG720ZhXk6v/uvEPtxsfQL
    UJwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794433918;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=D6hCekAJRvtT/gsERRUrqUGcHPO5tKx1ofDScjDZRh0=;
    b=IWjKBWNZ1kKTuMf1Qn52NRwSc+/nRGwrNuj6fd4RsAlHWQsajBDnJq8RPO4uFMZF9y
    4TQpInbnbOmgl+55k+XF9y5KvryHMFzO7PBPEDEnp2LUO6REGh0VNQxe706BESH2JzJ+
    PUFQl+WsVHtDlAm29ReqDI9D+H91XevPY0BJ/FHA60gs5uPB8OvfC7QWGXdlStSm4VCc
    8ga7LQJBjgUcHIbqZCANRjxzcsxRt5YUWV16uJH1JMDSC7f84tx3mt1pTKVmQ75D53n9
    +uv+7uhqSPZqxys6lkYJUtrz8tYby5/n3OmuknQsFLqsm8aRFENW50y7XXc1DFCV8QQ6
    61IA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794433918;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=D6hCekAJRvtT/gsERRUrqUGcHPO5tKx1ofDScjDZRh0=;
    b=iZgTz9A7cbFo0rrDbmeiZHr0Y/0nKX4vDMyiAcXAHZmey1VSUQSaugxS1pg0Wjm6yr
    qEBJWydijzdk2SSaxrLuPp5f5vFjKe2f0I5A2TWRUjUJPHj6UxfYePhd8zR+73igc5iR
    ttylf7+RNVIQW6ROXJNZfhRL5ShrYEFaEsaT0dkSawO7PjZlDjqug+DX/v2LUnKRMWNv
    e4iCgMDadF/U9FYDKDBZ2r+tZ+4CpRFsTa1K5TOwAWPHxdSaDgrBusX7DrvqauIMfqci
    X0u7kZx/GaXxTnIuZFl6dlUjLdkdQFrdbyQlnxurWwwpYqf8aChrFyEUnlyvgsKMvngo
    CP6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794433918;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=D6hCekAJRvtT/gsERRUrqUGcHPO5tKx1ofDScjDZRh0=;
    b=xcLU2iJQc/1dLhCs45OSAnHMF4WJmm9tlTC0BWINziIsBxkwkwTHrEbyqUSPGrfVK1
    hmXgPmgVtdR9CoVdpjAw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQjZoLz8iN2kucGv2N8YJDPry98OL4EAMbtbpe"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22ABLpv9Ss
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Wed, 11 Nov 2026 22:51:57 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.10\))
Subject: Re: [PATCH 2/4] clk: ingenic: Add Ingenic X1600 CGU clock driver
 support
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <179443342468.1143992.1536494507903693852.b4-review@b4>
Date: Wed, 11 Nov 2026 22:51:27 +0100
Cc: Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org,
 letux-kernel@openphoenux.org,
 kernel@pyra-handheld.com,
 Paul Boddie <paul@boddie.org.uk>
Content-Transfer-Encoding: 7bit
Message-Id: <6E077CB3-1BAC-45E1-AB21-4DFB1E4F4777@goldelico.com>
References: <cover.1792955907.git.hns@goldelico.com>
 <50983be55e467076e83e3ffc37b30fc4e5648e15.1792955907.git.hns@goldelico.com>
 <179443342468.1143992.1536494507903693852.b4-review@b4>
To: Brian Masney <masneyb@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.10)

Hi Brian,

> Am 11.11.2026 um 22:43 schrieb Brian Masney <masneyb@kernel.org>:
> 
>> Introduce clock driver support for the Clock Generation Unit (CGU)
>> found in the Ingenic X1600 SoC.
>> 
>> To support the X1600 platform, update the common Ingenic CGU core
>> framework to accommodate a secondary post-VCO divider (OD1) within
>> the PLL configuration registers. Additionally, prevent a NULL pointer
>> dereference in the rate determination path by properly supplying the
>> secondary divider tracking during PLL calculation calls.
>> 
>> Implement custom handling for the I2S clocks on the X1600. Since
>> complex compound hardware dividers are not yet natively supported by the
>> core framework, explicit M-divider (mdiv) and N/D-divider (nddiv)
>> structures are introduced to describe these specialized fields. This
>> avoids a compilation failure and enables a stable, though limited,
>> division encoding suitable for current needs.
>> 
>> Furthermore, this patch:
>> - Fixes the gating of the I2S0 and I2S1 clocks, matching the control
>>  bit behavior which functions as a clock enable flag.
>> - Introduces the custom OTG PHY clock operations and initialisation
>>  routines utilizing the hardware's OPCR registers.
>> - Registers the independent I2S0 RX and TX gate clocks employed by the
>>  X1600 peripheral block.
> 
> Just from reading the commit message this patch needs to be split up
> further into several smaller patches to make it easier to review.
> Ideally try to make the different bullet points separate patches.

Yes, that is already in preparation for a V2.

We will also extend this to cover the X2000 and X2600 (and JZ4730).

This needs to extend the core first and then add bindings and CGU code
tables one after the other.

> 
>> Tested successfully on the LX16 (X1600) boards and CI20 (JZ4780) to
>> not interefere.
>> 
>> Checkpatch complains about not 4 lines of help paragraph but the
>> style is the same as for the other machines. It also recommends
>> using 'unsigned int' for the new struct ingenic_cgu_mdiv_info
>> and struct ingenic_cgu_nddiv_info but this follows the style 'unsigned'
>> of all other structs in cgu.h. Finally it complains about the empty
>> line between struct ingenic_cgu_clk_info x1600_cgu_clocks[] = {
>> and the comment. But I think it is more readable this way.
> 
> The checkpatch note can go below the --- below.

Fine.

> 
>> 
>> Co-developed-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Co-developed-by: Paul Boddie <paul@boddie.org.uk>
>> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
>> ---
>> drivers/clk/ingenic/Kconfig     |  10 +
>> drivers/clk/ingenic/Makefile    |   1 +
>> drivers/clk/ingenic/cgu.c       | 150 +++++++---
>> drivers/clk/ingenic/cgu.h       |  42 ++-
>> drivers/clk/ingenic/x1600-cgu.c | 476 ++++++++++++++++++++++++++++++++
>> 5 files changed, 646 insertions(+), 33 deletions(-)
>> create mode 100644 drivers/clk/ingenic/x1600-cgu.c
>> 
>> diff --git a/drivers/clk/ingenic/Kconfig b/drivers/clk/ingenic/Kconfig
>> index f80ac4f2992b..9b8b00c9e6d1 100644
>> --- a/drivers/clk/ingenic/Kconfig
>> +++ b/drivers/clk/ingenic/Kconfig
>> @@ -75,6 +75,16 @@ config INGENIC_CGU_X1000
>> 
>>  If building for a X1000 SoC, you want to say Y here.
>> 
>> +config INGENIC_CGU_X1600
>> + bool "Ingenic X1600 CGU driver"
>> + default MACH_X1600
>> + select INGENIC_CGU_COMMON
>> + help
>> +  Support the clocks provided by the CGU hardware on Ingenic X1600
>> +  and compatible SoCs.
>> +
>> +  If building for a X1600 SoC, you want to say Y here.
>> +
>> config INGENIC_CGU_X1830
>> bool "Ingenic X1830 CGU driver"
>> default MACH_X1830
>> diff --git a/drivers/clk/ingenic/Makefile b/drivers/clk/ingenic/Makefile
>> index 81d8e23c2636..7e93e0893abe 100644
>> --- a/drivers/clk/ingenic/Makefile
>> +++ b/drivers/clk/ingenic/Makefile
>> @@ -7,5 +7,6 @@ obj-$(CONFIG_INGENIC_CGU_JZ4760) += jz4760-cgu.o
>> obj-$(CONFIG_INGENIC_CGU_JZ4770) += jz4770-cgu.o
>> obj-$(CONFIG_INGENIC_CGU_JZ4780) += jz4780-cgu.o
>> obj-$(CONFIG_INGENIC_CGU_X1000) += x1000-cgu.o
>> +obj-$(CONFIG_INGENIC_CGU_X1600) += x1600-cgu.o
>> obj-$(CONFIG_INGENIC_CGU_X1830) += x1830-cgu.o
>> obj-$(CONFIG_INGENIC_TCU_CLK) += tcu.o
>> diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
>> index ad223aa20e8d..c4fbee32c3b9 100644
>> --- a/drivers/clk/ingenic/cgu.c
>> +++ b/drivers/clk/ingenic/cgu.c
>> @@ -4,6 +4,7 @@
>>  *
>>  * Copyright (c) 2013-2015 Imagination Technologies
>>  * Author: Paul Burton <paul.burton@mips.com>
>> + * Copyright (c) 2023, 2024 Paul Boddie <paul@boddie.org.uk>
>>  */
>> 
>> #include <linux/bitops.h>
>> @@ -76,6 +77,40 @@ ingenic_cgu_gate_set(struct ingenic_cgu *cgu,
>>  * PLL operations
>>  */
>> 
>> +static unsigned
>> +ingenic_pll_recalc_rate_od(u32 ctl, u8 od_shift, u8 od_bits, u8 od_max,
>> +   const s8 *od_encoding)
>> +{
>> + unsigned int od, od_enc = 0;
>> +
>> + if (od_bits > 0) {
>> + od_enc = ctl >> od_shift;
>> + od_enc &= GENMASK(od_bits - 1, 0);
>> + }
>> +
>> + /*
>> + * Use the encoding table if indicated. Otherwise, use the value
>> + * directly, interpreting an encoded value of zero as a divider
>> + * value of one.
>> + */
>> + if (od_encoding) {
>> + for (od = 0; od < od_max; od++)
>> + if (od_encoding[od] == od_enc)
>> + break;
>> + od++;
> 
> So if the entry is not found, then od will be set to od_max + 1, and it
> will pass through the warning checks.

Sashiko also commented on such issues.

> 
> I started to look through the rest of the driver but I stopped because
> there's just too many unrelated changes here. This needs to be split up
> further into separate patches to make it easier to review. If your
> commit message has the word 'and' then that's a hint that you may want
> to consider splitting it up further.
> 
> Also be sure to go through all of the feedback from Sashiko.

Yes, sure.

BR and thanks,
Nikolaus

