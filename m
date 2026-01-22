Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com [136.143.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6EA33A9E5;
	Thu, 22 Jan 2026 11:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769082084; cv=pass; b=QNTuGAqoelzr81WwBCmyAEEep7d9Dfo0dMc9QUfSZRcc5B+Ulf8Jyh2+SVdHcZAqbjEdXVPCf+ksx6tqknDybS+f8+zM7CGMAcpAyZosJEJSkVp97THkPCRG35/hK4Wii7Z/Xdxo5sz9rZOEu8esgX26Tz53bozQ0sWrd3xAJUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769082084; c=relaxed/simple;
	bh=Rn5ETJg3JFh9/Aya73cchV97ZT+c0jzGg2d/Ng9LrXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dZee0pJBBuDHLPcOckBF1unoY5iZj2aC7H779AwU0kve/W7t8bkVDxiGtqD2BOesziGN0YCYh1jWXXE/dD7hZSIvx1t70ZRJ4dkUanSbBxgzDEdl3kfOgFZfOY3O5yxzV2egeM4dcRId29q/Zv4ZPYmLkAdoEqGzH0iZpGo6LKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=BqgP/0+k; arc=pass smtp.client-ip=136.143.188.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="BqgP/0+k"
ARC-Seal: i=1; a=rsa-sha256; t=1769082054; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Pb8wiJACOCATzEXc4PgWeHIX19E6c8dIl0diDlAgtpiB0IAwUMTZURj9rCubMT0CuzRWrb2BPGCqmrhgshV3wU+jAIfwilYbnYY9NjhFMNLLPXHi7Y3s3tB6cKDIy29ifBkwYWuvZYwnOj6XXaOZ8nTabaya4N+xCJCDWSHzxhE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769082054; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kG2AIxIWH9YRnqrSVj4qktDyQAM1oSw/ZIFoeBq6s78=; 
	b=Dj4aFJGUyrUKNT48CUlGd3wNqeM8ZFloOsQ90iuc4DIUrjrzDt3EV1ltEGMvJIRegNKk5apzWRMdelYfKACU5hIxhjUeJR/sOdGlyx9s/HrvvsSpZjuQnHabxf5u7eJfd7RUBbFQQRV6fUboqX1EqgRgu1UNWnS7Fvi/xTYbvbk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769082054;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=kG2AIxIWH9YRnqrSVj4qktDyQAM1oSw/ZIFoeBq6s78=;
	b=BqgP/0+kjtY5+I2wZdBhES5UOLW9z1ic0VLtrQkGNlJ7QWvS9+jpKGeGORrH+7kB
	eUHuZ79RxGH2zG0JY1ZMWSVqESzpwtdokYeP8JXMY0tzcC7Vjz2zjwiS8D66YXfaarc
	/srXBXlWqzXyCep56oIBWOFMZ32N71mASZEWajLE=
Received: by mx.zohomail.com with SMTPS id 176908204557861.379657628005475;
	Thu, 22 Jan 2026 03:40:45 -0800 (PST)
Message-ID: <bf39fdb8-6698-418b-bd4a-6d8d40ccc9a0@zohomail.com>
Date: Thu, 22 Jan 2026 19:40:29 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] clk: canaan: Add clock driver for Canaan K230
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>
References: <20260116-b4-k230-clk-v10-0-de59033c5d30@zohomail.com>
 <20260116-b4-k230-clk-v10-2-de59033c5d30@zohomail.com>
 <aW3o8xVziqb9iRBN@duge-virtual-machine>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <aW3o8xVziqb9iRBN@duge-virtual-machine>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Feedback-ID: rr080112278a99ca22fe3413b8502573b80000d112c6c8de0269d35716262045f3868d8834dff19452d12e59:zu080112270525b0f9423d0c1823811a910000b1028f03cb95fe0534d1fd2bc67e39b74b00cfd63973a25f42:rf0801122c843053e5f5fb5ac981c0487f000022c182bfb45a1df9df852c4ef67ed102773d21a27587345871b15b159e36:ZohoMail
X-ZohoMailClient: External


On 2026/1/19 16:18, Jiayu Du wrote:
>> +
>> +K230_CLK_GATE_FORMAT(hs_hclk_src_gate,
>> +		     K230_HS_HCLK_SRC_GATE,
>> +		     0x18, 0, 0, 0,
>> +		     &hs_hclk_high_src_rate.clk.hw);
> Here, you replaced hs_hclk_high_gate(in v9) with hs_hclk_high_src_rate,

I'm a bit confused, as I don't recall making these specific changes.
Looking at the code below, the only difference between v9 and v10 is
within the K230_CLK_GATE_FORMAT(hs_hclk_src_gate, ...) definition, where
the second parameter changed from 1 to 0. Everything else appears
consistent. Could you clarify which change you were referring to?

The code

in v8:

+K230_CLK_RATE_FORMAT(hs_hclk_high_src_rate, +
K230_HS_HCLK_HIGH_SRC_RATE, + 1, 1, 0, 0, + 1, 8, 0, 0x7, + 0x1C, 31,
div, 0x0, + false, 0, + &pll0_div4.hw); +
+K230_CLK_GATE_FORMAT(hs_hclk_high_gate, + K230_HS_HCLK_HIGH_GATE, +
0x18, 1, 0, 0, + &hs_hclk_high_src_rate.clk.hw); +
+K230_CLK_GATE_FORMAT(hs_hclk_src_gate, + K230_HS_HCLK_SRC_GATE, + 0x18,
1, 0, 0, + &hs_hclk_high_src_rate.clk.hw); +
+K230_CLK_RATE_FORMAT(hs_hclk_src_rate, + K230_HS_HCLK_SRC_RATE, + 1, 1,
0, 0, + 1, 8, 3, 0x7, + 0x1C, 31, div, 0x0, + false, 0, +
&hs_hclk_src_gate.clk.hw);

in v9:

+K230_CLK_RATE_FORMAT(hs_hclk_high_src_rate, +
K230_HS_HCLK_HIGH_SRC_RATE, + 1, 1, 0, 0, + 1, 8, 0, 0x7, + 0x1C, 31,
div, 0x0, + false, 0, + &pll0_div4.hw); +
+K230_CLK_GATE_FORMAT(hs_hclk_high_gate, + K230_HS_HCLK_HIGH_GATE, +
0x18, 1, 0, 0, + &hs_hclk_high_src_rate.clk.hw); +
+K230_CLK_GATE_FORMAT(hs_hclk_src_gate, + K230_HS_HCLK_SRC_GATE, + 0x18,
1, 0, 0, + &hs_hclk_high_src_rate.clk.hw); +
+K230_CLK_RATE_FORMAT(hs_hclk_src_rate, + K230_HS_HCLK_SRC_RATE, + 1, 1,
0, 0, + 1, 8, 3, 0x7, + 0x1C, 31, div, 0x0, + false, 0, +
&hs_hclk_src_gate.clk.hw); +

in v10:

+K230_CLK_RATE_FORMAT(hs_hclk_high_src_rate, +
K230_HS_HCLK_HIGH_SRC_RATE, + 1, 1, 0, 0, + 1, 8, 0, 0x7, + 0x1C, 31,
div, 0x0, + false, 0, + &pll0_div4.hw); +
+K230_CLK_GATE_FORMAT(hs_hclk_high_gate, + K230_HS_HCLK_HIGH_GATE, +
0x18, 1, 0, 0, + &hs_hclk_high_src_rate.clk.hw); +
+K230_CLK_GATE_FORMAT(hs_hclk_src_gate, + K230_HS_HCLK_SRC_GATE, + 0x18,
0, 0, 0, + &hs_hclk_high_src_rate.clk.hw); +
+K230_CLK_RATE_FORMAT(hs_hclk_src_rate, + K230_HS_HCLK_SRC_RATE, + 1, 1,
0, 0, + 1, 8, 3, 0x7, + 0x1C, 31, div, 0x0, + false, 0, +
&hs_hclk_src_gate.clk.hw);

> but after my board test, I find that when hs_hclk_high_gate is turned
> off, the mmc/sd and other high-speed subsystems can not work. So maybe
> you should not change the hs_hclk_high_gate to hs_hclk_high_src_rate.

Regarding the clock management, I recommend explicitly enabling
hs_hclk_high_gateas it will be closed by `close unused clocks`.

>
> When I used clk_ignore_unused, I saw the log as follows, while the enable
> and prepare count of hs_hclk_high_gate is zero. Here is the log:
>        pll0_div4                     5  5  0  400000000   0   0     50000      Y  deviceless   no_connection_id
>           hs_hclk_high_src_rate      1  1  0  400000000   0   0     50000      Y     deviceless   no_connection_id
>              hs_hclk_high_gate       0  0  0  400000000   0   0     50000      Y        deviceless   no_connection_id
>              hs_hclk_src_gate        1  1  0  400000000   0   0     50000      Y        deviceless   no_connection_id
>                 hs_hclk_src_rate     4  4  0  200000000   0   0     50000      Y           deviceless   no_connection_id
>                    hs_sd0_ahb_gate   1  1  0  200000000   0   0     50000      Y              91580000.mmc   ahb
>                                                                                             deviceless   no_connection_id
>                    hs_sd1_ahb_gate   1  1  0  200000000   0   0     50000      Y              91581000.mmc   ahb
>                                                                                             deviceless   no_connection_id
>                    hs_ssi1_ahb_gate  0  0  0  200000000   0   0     50000      Y              deviceless   no_connection_id
>                    hs_ssi2_ahb_gate  0  0  0  200000000   0   0     50000      Y              deviceless   no_connection_id
>                    hs_usb0_ahb_gate  1  1  0  200000000   0   0     50000      Y              91500000.usb   otg
>                                                                                             deviceless   no_connection_id
>                    hs_usb1_ahb_gate  1  1  0  200000000   0   0     50000      Y              91540000.usb   otg
>
> Regards,
> Jiayu Du
>> +
>> +K230_CLK_RATE_FORMAT(hs_hclk_src_rate,
>> +		     K230_HS_HCLK_SRC_RATE,
