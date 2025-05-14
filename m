Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D05922F16E
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 10:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747218563; cv=none; b=eX10wKRVzSGA+b12PllSp+lXdAtDI1f/rm4MKnJxux8iZGrC+zSmnU0yOfm7hAL2vqqdRIZCQ722RQSLwzf/wH45LnZyQ+WARoD4mJzFEor1ceeSTSn//+EkK8oXRVlJeEaql0tg42o5g5ydqJmiRauEpM9AjzPsXl3U66RDa0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747218563; c=relaxed/simple;
	bh=xV5TGWtAjUBbAlGh1TG217UQBJWDrrfWO3odDFRTQMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C13nBvsJ5jCBFxgr4MIGUrPq07vd4hVMrMOFdMEO/OMNhLwVY9Lcpo9/oPUeHjFypOQdZldQRoGVouY719dqrZmO4q5ehOVqLtoqq3R0YCtAG+wOoFw/qOTn1vF4WqxEMzYqjzUxkDsPVcpTvDKIbuhLmPsHpdlTM9BZPEOaZR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NjgICSIA; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NjgICSIA"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a20257c815so3680416f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 03:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747218560; x=1747823360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fU4PVewcc9MxNH8+f8DwyzdamtEdKDmr83HGRbxUgQA=;
        b=NjgICSIAzJ3DZL16X7USYlyLMHxqOLroHevQkmeuCpl+Ri0TdDcsqqISaAdt1riMMI
         tXYarZgGlKGQ/gRyh4tz4pJAuqe4SCnkPY4sYgu3hqGpqC97V2FQiAJh2thHjp81rcuu
         YXVPNL/XSLemYI7XE51XVwIZawukvPw8kYKQBliwoKSTeMO5io2tTNC3NEMqIsQgg01U
         u2rHNkOKmBkY5fvyr8QOkLja9EXaMzxr3GPGGL527BI2IT2lP34CR6gGCcfhlS6M8AUF
         em3ObpaBU79igYBcesgDsbpXp3YSkOyyLoJRJVXK1a5WIw7f0LttpNoYxuEyodAM7nLZ
         SicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747218560; x=1747823360;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fU4PVewcc9MxNH8+f8DwyzdamtEdKDmr83HGRbxUgQA=;
        b=UPeMTCrYS4p+T1TCobpMxu/lhy5ZyYkI4tZMLtuwDOy7plK1kIKmUEhZdCGjAV8hh8
         q5IvB3Zl1QcA1N/L8YViG1q1JjiP3iWduckpKsC7TPY6GeoQYCoyPj9Ky9EV5VMEp5G3
         i2dOcV6HDcqyAib/ms/kg5kdUegeN/POobxHoKrPxSmX1kWfIZDn6qdx3Z+EfIOrnhVp
         pM9SrwdGw7keVJ+11dzGR2E6ixfhER9Cxdapkr6/FZeV0Q/lfRZDz0jbPZFMj9OzxtG6
         gVL+TOwox9Xaaq69pwLSYDKNRsPI8S6EPD7k64IwbHWBb/aDSQleXzBMS8XA+YXxd+vd
         8vGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlLjrtFtQRcC1cfmOnTkvX+txNGq1PrA9l5mF9p+g7oeBsVaXcxdShJf+73YAAHSqrjaTUmZi+MJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRzHLKM9gyj0aQTXusMrQXC0aMqeLyM/y1e9I39TU0FOVyHSTC
	64zN2SNqdW3LRlGQfxQ288jJTDp10uX+sxHuRrjJkTBFB6dSSnMy8IKRaD0yySw=
X-Gm-Gg: ASbGnctuWVqfvF8vu7fH4Ch+8kPk30Zpq2WOOICaYO6tUQx3rTr97zcvrrsLsIYxphU
	SN6l0JE1nkMIMaXKH5AecYWjP6l7gqscSxDt0sf/tPtJa2qSJdFcBRL8OYhcgQ/5tBZR9/WtOoR
	dcgyM/o0ibbwMmpyvJBtYLHIEVUqm8gMe0M/m8Kt8KX3uTVRTOmBIAcbTNbY3Bqibo1mE4JUUBQ
	+ZMGIR0Yl7AMI426jRq2NDbnmKDqK+OxlwD3pRIOczH0v6GBBoC2dwjd9E3KNuAMrl5Tb4z95po
	hZ/+NMXT49TSElgwMzVbOkIhJja0UJyoArOiImxP1WBAhZh5Qt/AaDo0vx0=
X-Google-Smtp-Source: AGHT+IGyw3NxozgVzbMrkAVh72sdE2V/yiO6fwgF41eG84LxNtgGijn9Y7vFEYBwAZhyZjVRwxqXEQ==
X-Received: by 2002:a05:6000:400c:b0:3a0:aeba:23b1 with SMTP id ffacd0b85a97d-3a349946a98mr1835187f8f.49.1747218559944;
        Wed, 14 May 2025 03:29:19 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a22ea7a53asm7334492f8f.23.2025.05.14.03.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 03:29:19 -0700 (PDT)
Message-ID: <e470715b-6f76-4b65-b1af-7a24e0432a30@tuxon.dev>
Date: Wed, 14 May 2025 13:29:17 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
 manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, saravanak@google.com,
 p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250512203851.GA1127434@bhelgaas>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250512203851.GA1127434@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Bjorn,

On 12.05.2025 23:38, Bjorn Helgaas wrote:
> On Fri, May 09, 2025 at 01:29:40PM +0300, Claudiu Beznea wrote:
>> On 05.05.2025 14:26, Claudiu Beznea wrote:
>>> On 01.05.2025 23:12, Bjorn Helgaas wrote:
>>>> On Wed, Apr 30, 2025 at 01:32:33PM +0300, Claudiu wrote:
>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>
>>>>> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
>>>>> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
>>>>> only as a root complex, with a single-lane (x1) configuration. The
>>>>> controller includes Type 1 configuration registers, as well as IP
>>>>> specific registers (called AXI registers) required for various adjustments.
>>>>>
>>>>> Other Renesas RZ SoCs (e.g., RZ/G3E, RZ/V2H) share the same AXI registers
>>>>> but have both Root Complex and Endpoint capabilities. As a result, the PCIe
>>>>> host driver can be reused for these variants with minimal adjustments.
>> ...
> 
>>>>> +static void rzg3s_pcie_update_bits(void __iomem *base, u32 offset, u32 mask, u32 val)
>>>>> +{
>>>>> +	u32 tmp;
>>>>> +
>>>>> +	tmp = readl(base + offset);
>>>>> +	tmp &= ~mask;
>>>>> +	tmp |= val & mask;
>>>>> +	writel(tmp, base + offset);
>>>>> +}
>>>>
>>>> Nothing rzg3s-specific here.
>>>>
>>>> I think u32p_replace_bits() (include/linux/bitfield.h) is basically this.
>>>
>>> I wasn't aware of it. I'll use it in the next version. Thank for pointing it.
>>
>> I look into changing to u32p_replace_bits() but this one needs a mask that
>> can be verified at build time. It cannot be used directly in this function.
>> Would you prefer me to replace all the calls to rzg3s_pcie_update_bits() with:
>>
>> tmp = readl();
>> u32p_replace_bits(&tmp, ...)
>> writel(tmp);
> 
> It seems like this is the prevailing way it's used.
> 
> You have ~20 calls, so it seems like it might be excessive to replace
> each with readl/u32p_replace_bits/writel.
> 
> But maybe you could use u32p_replace_bits() inside
> rzg3s_pcie_update_bits().

I tried it like:

#define rzg3s_pcie_update_bits(base, offset, mask, val)	\
	do {						\
		u32 tmp = readl((base) + (offset));	\
		u32p_replace_bits(&tmp, (val), (mask));	\
		writel(tmp, (base) + (offset));		\
	} while (0)

But the mask may still depend on runtime variable. E.g. there is this call
in the driver (and other similar):

static void rzg3s_pcie_msi_irq_mask(struct irq_data *d)
{
        struct rzg3s_pcie_msi *msi = irq_data_get_irq_chip_data(d);
        struct rzg3s_pcie_host *host = rzg3s_msi_to_host(msi);
        u8 reg_bit = d->hwirq % RZG3S_PCI_MSI_INT_PER_REG;
        u8 reg_id = d->hwirq / RZG3S_PCI_MSI_INT_PER_REG;

        guard(raw_spinlock_irqsave)(&host->hw_lock);

        rzg3s_pcie_update_bits(host->axi, RZG3S_PCI_MSIRM(reg_id),
                               BIT(reg_bit), BIT(reg_bit));

}

reg_id is a runtime variable and cannot be checked at compile time thus the
compilation of u32p_replace_bits() fails with:

../include/linux/bitfield.h:166:3: error: call to ‘__bad_mask’ declared
with attribute error: bad bitfield mask
  166 |   __bad_mask();
      |   ^~~~~~~~~~~~

Please let me know if you have other suggestions.

Thank you,
Claudiu
