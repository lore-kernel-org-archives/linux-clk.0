Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643509;
	b=Jg3TAFMgTttAmo+anxWUQ3YX6j17gqNP84n6ZHy0Wh0KB33/lsKfCp3WTCY85EDvCr6a
	 5Rxj3bMm7aIVb3fzk4uLjPc9Lpx+nUnbkuapkoIAK/YeA/CPRBAxD2SPjgwXAvOxSdG5h
	 xNZvto2qYyS7y5BqC2XFwXc/Mz+6ca+ratZg3n/2qz0gCX8YDVYBawk6op3ZvwiMkIY3k
	 hWpe/NEn/Q/1Uxjc9HeKhww7prNRVIJ4Rj/PCdnDHE0S9/NCRZsy8n7qH/cGyIeuHfBAA
	 SooL+UQNNkzYg61nOJ6s+gYbGxBLk2JVUBnbcK+NsUzRi7nsSV+7zZHesOlV5+YXphQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=rbSy8/naK9NpKBKilS5D0FxnjU7qPGsjWJMaC5SsXmI=;
	b=qzfFUOYiPyxtY6VxyjoS2FMmtE5eQQkQhstKpzs8C1e20FSIuRsn4RuFFSIqRlPQJyR0
	 BC/6xH0Y28Ze5sfCkMnbujTptI/sCD4U18JhE2LlDC9Us6GxOJ3fE81PcUY10HUmo/EwK
	 R7OYH2vLnpLjIayLRzIqR/85B9bKluozhdQkp8QcTU9x/SqfoFH31bK6JG9X0uYlVfTlx
	 L7Yaeiq2wliKBTbMfvhOsE/SIOEarnQs3yQszfZdWa+UlsDUTNNu6ceIRe19uCwIybUSc
	 u6IVvJf5Y8kAHW5qQKIzIeYj7cqblv6L0NOQgyeGNkYPiVTSZkZY3/Rhh8Hg4wJxTmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=RvkMU6aH;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAF6606A323
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 21:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BAF6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=RvkMU6aH
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-71b30ed75a1so3655992eaf.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 13:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795643508; x=1796248308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbSy8/naK9NpKBKilS5D0FxnjU7qPGsjWJMaC5SsXmI=;
        b=RvkMU6aHw3UFU7F0s3LawFuMMWucgrJOewAmTNt/s9mU1jocAFjNJMZKtPkXuvf+r6
         3Y1gMKTzSvrCakTTvX1dK5xqZ8bWJeGZJ2cAKfIvX0GRIA6CK00CzxZpH2mgs+RjwMlp
         /J928Qpmpf9szu6sskdshfNebwQGfXIM0ijz7JGjMOYZ90oMGk6HmqfozgFQYYsjC7+Z
         Pi1R4SLtvkJ49mAZH827Axk/UVcNrNf/Qm4qAYl0gpum9z2+bGTOAaekxeFK56P3SYJS
         EC2MUyaS7hqQErt+f03GVz84MxOh0BOA7wKgIXz5xT9Fw7bT22bUKp+Qu+sJrZdcsFau
         Dobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643508; x=1796248308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbSy8/naK9NpKBKilS5D0FxnjU7qPGsjWJMaC5SsXmI=;
        b=0vuDKlcwAYhDzWaubZZoBDEVYuDvGdYpz0lsSBVosE8uX0OrRszp64rKUmT6ufgSxp
         HyOigGvPNx+XZazQrbG3K/LNNh0CPjB+CjjLFhVpOUuZykScE+7POneKp6GMEELwzUDi
         bIexHNwbYu1S7a1bV+t6eKUxYbulD5pDOPsAKlxS5tVl1JAcqUSO3wZYdWBOXfArnJrE
         tBmfERlTG0WgOhpQ6c2rg9zubGmByK92N3ZOcARi/HLI6AGsU7OBOS287WjgjO8rp3G4
         AV6Rp4/FxYcBpnIOWz4ViYm/q1xvf/5hJTXFsEplJQlVBRgq8niOSN3llL4gh6vmzgta
         sqsg==
X-Forwarded-Encrypted: i=1; AL+hErE9dHRF9KWmR1Hiq8XV+p3E1dt+aRpg6/AJtSmewpJK+T9qTT7DMQbo0oIE5L6pcmsh97NnT8h5hnA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7DmxWidK5VQfdx18LXF4bnlyNMc51ZPaUmjp3zRKdQgUlWwnz
	/5fHT7xoJcxhsfT05yUBmlwxp2Tn34FCUGl7uNv1UXvhWcxPU/I9ir5mLLPOfm/YAHk=
X-Gm-Gg: AZFdTZcDdXWBd9lSwLPFRDZW1cVk1Rgft907OdaOmv9wqzVTqJg5881QLS+/1v3JHkH
	K9WRvmgIfszo7MmRbao4HIhCWykpavzQCiulFbMw5e5aPFsAbI1IaaHlMgxwXd+9V0j72QYldwi
	z9YwTK85vTGMI0IbAASdw3Mh2uglYb9wFdL2leTQl3S8OXsEYpsROj0SLLAn8cVKSpl4Sr3k/YL
	JnO+SQpcpO1ht/ok13h4IlHnJt1Oe31PvksU31OASGhSS/HTsMHTeRy4oZhj3qYqFpvbuZsdISd
	FDfTyOOZ7IERgAYH4gG8tAgTMNsW6pbCG+GEFJJQBwl2htlw08+ecwg8Ck+UuZZpiL8FY5XlEAG
	HLbk2fmWPVbaRv9T/Y+CDlDaZfXVyBnddY/KCk5OLaf4D1k1eiOpO2azMZqHlgMZMXIs+YeMxHP
	DhZ1e+ScCbBlJjRE8iflDQFGGjD0+FXwYCMtz0CUQsgoOWY8LATnSHhO0GGKJI71gs3ekk7N85o
	x8HEFO8pczvzw0lnxMnpn2FJdy+S+4tP65Juxvd1mKE5B/fVaqEvC+8f23H2kL3g+Iie1WVmBgZ
	uBeEBIthCMwV/mEWryQFX9US53xAotTn
X-Received: by 2002:a05:6820:1391:b0:71b:8969:9d1d with SMTP id 006d021491bc7-71b8969a594mr465740eaf.31.1795643508188;
        Wed, 25 Nov 2026 13:51:48 -0800 (PST)
Received: from [172.22.22.28] ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b38015c46sm12670866eaf.4.2026.11.25.13.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 13:51:47 -0800 (PST)
Message-ID: <d5abcbbb-e533-4a44-a26a-1ca17e37d7f6@riscstar.com>
Date: Wed, 25 Nov 2026 15:51:47 -0600
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
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add TC9564
 clock node
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261125202141.1288493-1-elder@riscstar.com>
 <20261125202141.1288493-4-elder@riscstar.com>
 <sashiko-outbox-234134@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <sashiko-outbox-234134@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/25/26 2:28 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] arm64: dts: qcom: clock-25000000 under pcie@0,0 shifts tc9563
>    port indexing
> --

This was a great catch on a seemingly unrelated problem.

I will consider how to address it.  Off hand I can think
of two options, but I'm sure there are others:
- Move the tc9564_xo_board *after* the downstream ports
   (after the end of the pcie@3,0 node).  In this case I
   would add a clear comment in the DTS file explaining
   why this is necessary.
- Make the logic in "pci-pwrctrl-tc9563.c" more robust,
   possibly by skipping nodes that aren't of type "pci"
   (or possibly "pciex"?).
I think the second option is better, but I'm open to
other suggestions.

However, at the very end of this message there is another
observation that might make the above moot.  I think this
clock node should probably be defined closer to the root
of the tree.  I'll verify that and will fix it.

> commit c4e2dd0c5c7aea169ea475dfdf59cb2e475d33be
> Author: Alex Elder <elder@kernel.org>
> 
> arm64: dts: qcom: qcs6490-rb3gen2: add TC9564 clock node
> 
> This commit adds a devicetree node for the Toshiba TC9564 clock and reset
> controller along with a 25 MHz fixed-clock node supplying it.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 682bcbc0b466b..b327f64885ef2 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -890,6 +890,13 @@ pcie@0,0 {
>>   		pinctrl-0 = <&tc9563_resx_n>;
>>   		pinctrl-names = "default";
>>   
>> +		tc9564_xo_board: clock-25000000 {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +			clock-frequency = <25000000>;
>> +			clock-output-names = "tc9564_xo_board";
>> +		};
>> +
>>   		pcie1_switch0_dsp1: pcie@1,0 {
>>   			reg = <0x20800 0x0 0x0 0x0 0x0>;
>>   			#address-cells = <3>;
> 
> [Severity: High]
> Does placing clock-25000000 as the first child of pcie@0,0 shift the
> downstream port indexing in the tc9563 power control driver?

I think it currently does.

> Both tc9563_pwrctrl_probe() and tc9563_pwrctrl_parse_reset_line() map the
> direct children of the pci1179,0623 node positionally to TC9563_DSP1,
> TC9563_DSP2, and TC9563_VDSP:
> 
> drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c:tc9563_pwrctrl_probe() {
> 	...
> 	port = TC9563_USP;
> 	for_each_child_of_node_scoped(node, child) {
> 		if (++port >= TC9563_MAX)
> 			break;

If the second option above is chosen, this function
should be updated the same way.

> 		ret = tc9563_pwrctrl_parse_device_dt(child, &tc9563->cfg[port]);
> 	...
> }
> 
> With clock-25000000 ahead of pcie@1,0, pcie@2,0, and pcie@3,0, the driver
> treats clock-25000000 as TC9563_DSP1, shifts pcie@1,0 and pcie@2,0 into
> TC9563_DSP2 and TC9563_VDSP (misassociating per-port settings, reset
> GPIOs, and the integrated Ethernet endpoint), and stops before reaching
> pcie@3,0.  It also violates Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml,
> which only permits pcie@[1-2],0 and pcie@[3],0 child nodes.  Should
> tc9564_xo_board live under the root /clocks node instead?

The 25 MHz oscillator comes from *outside* the TC9564 chip,
not under the upstream PCIe switch port.

For this reason, it should be defined somewhere on the board,
not within the TC9564 chip.

I will investigate the right way to represent this and will
correct it.

					-Alex
