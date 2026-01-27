Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com [136.143.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B25D30B51F;
	Tue, 27 Jan 2026 11:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769511886; cv=pass; b=bIE4faOrkBbgIQaiQSBsRzio1yUMAMypbhTaXcJA0bgjqSjq3buHx29VeWt6vPBJHvxRD63/Fiar0rwlWLEQdIXwxGfTG8DdkjmCejuewXdklgw60WHKK8rIyio2ymgg0R5FujrIqYiElAj3EhHR00E+W9npcsekcQQDQTainxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769511886; c=relaxed/simple;
	bh=FG6HFQL/cV3+5iYVYIgLIOwsbcYD6bxgBJ/bMY+o10k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HhSiCZTjBCuhEv8ghEFTOyVd+k0BwIFntoPSJRDDRFD+yKiW9qPYz4Lzum1Pz6naCri0FR0lVEs2r+5qm92SpgIWmBZ2A9mvKF2OfZd16nQ791MeOWVuTwgIfO2CbVyg8Bd/oB+t/B0s91oQ0XuUotP8nSPeYF1vg4bR79KQr+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=Yssn+2Mq; arc=pass smtp.client-ip=136.143.188.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="Yssn+2Mq"
ARC-Seal: i=1; a=rsa-sha256; t=1769511863; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qg9X3pcoJnoqViWAtoWu+1abukl8Fw5lGIAyAv5BWD3vf2Qt+Y2HBJoSm6lHZzgY07f9QhbdgMnisC8fVRFzFp4CUU5HhGtDUJfPfY89ioVwpqdt8hXeZ0xpvyx1oZiwhLKIIUkrWK40ABNm/4+axHkf/jSJsjLFuS134r3jGpg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769511863; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zIZv98xexLqGPRXaRA7uJoEdTPOCRvLcc++itdaM4UI=; 
	b=D+E2caX5GVBGRR0A8rjCa2P57YJRm8gJTwfYBgJFz0Ffg43w0VLJZCQlCoRDdYKahcNa2xnx/CjuKY4KGhPHfFZDFyGeBox2Arze2ad1Ac9ED0AluOZlgXXxzaFxBpMAyRREUfl2ctsmkp2W3p69mhQkCho4FIvzkjS4wB0Z6tU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769511863;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=zIZv98xexLqGPRXaRA7uJoEdTPOCRvLcc++itdaM4UI=;
	b=Yssn+2MqnT1qoMPXr6YSK96CPNXVriKXqEsW0mq/UEwfSKYG4Bu+HG8e/oaAAkno
	jMBGI1Um3eAiMZeBuuNH1jma14j1gOEaS7iIUZ9ASMOb7tW3WyXclPRjU0cgrzHPAsw
	HnfbuposIAuRXBDIRp+LCc2H8kJFktwrdXwklJWU=
Received: by mx.zohomail.com with SMTPS id 1769511855331786.2569087782504;
	Tue, 27 Jan 2026 03:04:15 -0800 (PST)
Message-ID: <0af969a7-3579-4303-b302-f171ef02a163@zohomail.com>
Date: Tue, 27 Jan 2026 19:03:59 +0800
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
 <bf39fdb8-6698-418b-bd4a-6d8d40ccc9a0@zohomail.com>
 <aXJJ3MjQSq8Rq084@duge-virtual-machine>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <aXJJ3MjQSq8Rq084@duge-virtual-machine>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Feedback-ID: rr08011227a510c0fba220186bba5f362e000053b54e7061a9cbdd371d5284c83a55924f9557a426366cbb14:zu080112272a5276332e1090ec5d5ceed40000b2c296e870bfa7ef506b33ce0394521dd45f1929333996b33b:rf0801122cc4400f0c83132b1947518dc60000c8bd395d79c79d723ff8939ceba3fa55336a182f4efa95f61dab38722347:ZohoMail
X-ZohoMailClient: External


On 2026/1/23 00:01, Jiayu Du wrote:
> On Thu, Jan 22, 2026 at 07:40:29PM +0800, Xukai Wang wrote:
>> On 2026/1/19 16:18, Jiayu Du wrote:
>>>> +
>>>> +K230_CLK_GATE_FORMAT(hs_hclk_src_gate,
>>>> +		     K230_HS_HCLK_SRC_GATE,
>>>> +		     0x18, 0, 0, 0,
>>>> +		     &hs_hclk_high_src_rate.clk.hw);
>>> Here, you replaced hs_hclk_high_gate(in v9) with hs_hclk_high_src_rate,
>> I'm a bit confused, as I don't recall making these specific changes.
>> Looking at the code below, the only difference between v9 and v10 is
>> within the K230_CLK_GATE_FORMAT(hs_hclk_src_gate, ...) definition, where
>> the second parameter changed from 1 to 0. Everything else appears
>> consistent. Could you clarify which change you were referring to?
>>> but after my board test, I find that when hs_hclk_high_gate is turned
>>> off, the mmc/sd and other high-speed subsystems can not work. So maybe
>>> you should not change the hs_hclk_high_gate to hs_hclk_high_src_rate.
>> Regarding the clock management, I recommend explicitly enabling
>> hs_hclk_high_gateas it will be closed by `close unused clocks`.
> Sorry, you are right. It was me who made the changes locally. And I
> saw your reply to this email[1], which you said According to the vendor's
> code, the parent clock of hs_hclk_src is hs_hclk_high_src.
>
> Indeed, the parent clock of hs_hclk_src is hs_hclk_high_src. 

> but hs_hclk_high_gate is the gate of hs_hclk_high_src. 

No. It seems there is some confusion. The hs_hclk_high_src does not have
a gate.

The clock tree is as follow:

       pll0_div4
          hs_hclk_high_src_rate
             hs_hclk_high_gate
             hs_hclk_src_gate
                hs_hclk_src_rate
                   hs_sd0_ahb_gate
                   hs_sd1_ahb_gate
                   hs_ssi1_ahb_gate
                   hs_ssi2_ahb_gate
                   hs_usb0_ahb_gate
                   hs_usb1_ahb_gate

> So, what you mean is
> that you will add the CLK_IS_CRITICAL flag to the hs_hclk_high_gate?
No, I don't intend to add CLK_IS_CRITICAL flag. Instead, I recommend you
to explicitly enable the clock by using clk_prepare_enable in your driver.
>
> Link: https://lore.kernel.org/all/159615d3-cc52-43be-bf6d-5fe717ef1cc4@zohomail.com/ [1]
>
> Regards,
> Jiayu Du
>
