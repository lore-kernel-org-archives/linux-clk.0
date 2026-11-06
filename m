Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793929843;
	b=MsO3WFH+2akCsuxp+zD0OQ4la6hhcsbV+FOvB6/ZThuZ4Ju0i57YzIk0SIKvfpPeQGdp
	 SThD3lvrVsH07F5sJoeVGGmtv/sIEG7dO+E2FbOgAqYDjVcbsMr73E2BlKyBdUidyPjAX
	 C0XISpAZF115jUhHKRMCvp7WuYXSZPRF7aBkg5yZbGjRVzwF1+gRNwxkka0d8dFteZjqO
	 TRjcQtHjrG6iHZUk+tdSINhnNjV0S0830fyCtUjEyxm+Rvru5FMONH3lkCS8T42o6G/c8
	 5/aKhDsTLbWV5aQNvoBmLtVg+w5oRRoO+D4b/2bJfmBBsIIe+J86mYIcWAbvp9c23sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793929843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=bMCFjChOWXQl08hcopau30f+4A1VG5iv+0pA9BSCQ9s=;
	b=X0DteM8NggInjRD2Tr7bnqryorYvR2MLXxCDU8J/q48MPg5Ru7i2j0SSCBUdGSIYwr5t
	 OnG2qIHvkDdMi9121BKYVDCy2zuTIyWDUI9uylOZeOL/HFB2fBe/xq2GYjDss0/4oDdaE
	 asXup5O9bW4DKmf+CzmlcoUPYp2OTlhsjKT7Y9dA20h9A8N4rAhy0G56TvIqY+ThXW9CS
	 3shLvUgmUpM31Jaaq8ntq07vf5E7w01yzWR53EM8NW1EFtHoL9dxPv+0cGk4hBR0yJUnk
	 30BApKi3PNXl8je8gwmRHPEk7J3x2kQjdYQXNXivQ35IBf7LF87RhkQ+DFDgtxXH2WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=iFiGgm81;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D19606EE8A
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 01:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61D19606EE8A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=iFiGgm81
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-475920b9ca2so21996fac.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 17:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1793929842; x=1794534642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bMCFjChOWXQl08hcopau30f+4A1VG5iv+0pA9BSCQ9s=;
        b=iFiGgm81vaMCUIvQp0P8W9hQsBzQpyVVeiayZlgE/yRrYx/diZVQpRy1S9MtZcstGs
         8f8rbNhbmL3dxI4BO/m7AJJWAWPOZM/zw3cEaKG15fv6idU0I2+vL1Z+ABuuGVyupR29
         gISnEyCTgBHbx8tTUlHBk5hoPStY8wxRfpRDjCEM2DYtE/GMWby7rrDhGMPx+5KAHwTq
         Uzp3v+Xi6/NyKJAnomo7Bn4clGD/ic8gu7k8WLodKyfOZVPZJMfr3AzauPlot/tjoby2
         X3Vb1fN+YLnRKHduGJSyimAcYJ7VWXa80+rsqkNbO4n1awfE3zoS6tndR0kUg4V5LplX
         Yz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793929842; x=1794534642;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMCFjChOWXQl08hcopau30f+4A1VG5iv+0pA9BSCQ9s=;
        b=ir24IlKGyhVJf2z6U2fNAf3FfaElhtsHqCoGvOwSoUYwhdCZqIVZ8bLtwdc4K4cEVX
         XxVAMi3JQ5/9afKnBCPIu66yPlaMYl0rGS1ynS1h62GQ/pW9iLkLgk7T6eKBwT6EUFpa
         VznDuNYOsHkmbK7Mk+Nw6ownqlQMVUOkirQdRomhDmTY2R5vsW5hXuNf9ALgnrAmkmgb
         38RWO1EDGf2japVREcW/l56MShts6TEtyU46Y/BhSb6aTugWjJeqd0MQgMDnMicYIa/L
         tHV2a+yIMJi6AEWoJDByJpNfgNhJ2d8RcM6FbI/iTYno9Vs1OI7hOs+YtVN1dnGqtHKI
         X8pQ==
X-Forwarded-Encrypted: i=1; AKwUvBwemNN9JGVbp4WStgJxh5onQs2z5RuTZL1CXtteAnPWlFkSHkC5RMhRbpIDQBflKWCPgmc+oPpBBW0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iBRA3nra6y5gNaeoK7TYxBnE18gFslAEltPlgWXNzU/qj1wPs
	HeJz+lSiJ7b/4+fsVFEp5evScIoqCRznNqBIH+3IMDSrbgIxIQh+7Y8+njuR41p5zhE=
X-Gm-Gg: AYBFou1B52gySXeBig/NICXKXCYGYB4iVIemOHIiQMI1vhSukoaa4sCSqXB7Nx7jv7s
	pOYDxBNo+drJ6+fU/WCmGuS0KbiBWHLSuSJp8l5/iR7tNbGkszqd64oPqVc24S7SKwwoP1AAoVt
	WbvvqVd8TL7j0li1wIqVclua4Ku1nkpcR+s0dtZRHYhT4T8IddEiQ2Ft4FN5HpIe5PUs8Y1JcpF
	JoiALRtBlqbpdiZq68SCFMcz5wPQ9NtyxJHVkYSE8UwYef8I5EqvWr5F4G+nRH29kFwtHCbyRy4
	u07Klb4fjG1Vy9LfhiFOIp7wvdHu3eHGVLcvy7WSfuaztqCuLjfdbMQGK0rP/Pj4qorR/nvmMA5
	FgD/c1aqOr5HOIqowxu9tX1N1EiW9v/uFUZYXiipu3qV+clwVLOVN6zL01yCFHWg5ykTyevzcWt
	m5VAiEHDXjKAHRFCFlPK+bw39wqh3AQxGj1RHKZhUJD2IBfKpwC5rutrBRs85es4Iabkp/ICppL
	qFrMW6di0N+lGm5GqN/YoGJeBju5P/RaxTS2jFWvuVj3qMhTqTJj4K7C5U9HkE7azjY1PtDNeV+
	7WOsGMTKsQ5jQhRCy4CZj1oSm1fH
X-Received: by 2002:a05:6870:a0ab:b0:4ad:8800:b277 with SMTP id 586e51a60fabf-4ad98b4feb2mr759024fac.24.1793929842253;
        Thu, 05 Nov 2026 17:50:42 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad97887090sm817691fac.6.2026.11.05.17.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 17:50:41 -0800 (PST)
Message-ID: <bbeb0df0-10ce-4f8c-8b2b-07437d959b3b@riscstar.com>
Date: Thu, 5 Nov 2026 19:50:40 -0600
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
Subject: Re: [PATCH 0/4] soc: toshiba: tc9564: config system controller
To: Krzysztof Kozlowski <krzk@kernel.org>, sboyd@kernel.org,
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, p.zabel@pengutronix.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104004332.2141282-1-elder@riscstar.com>
 <a724d159-1509-4649-afa7-a2669d37b4f6@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <a724d159-1509-4649-afa7-a2669d37b4f6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/26 2:26 PM, Krzysztof Kozlowski wrote:
> On 04/11/2026 01:43, Alex Elder wrote:
>> This series is comprised of some code that was previously sent
>> separately.  It now incorporates a new system controller driver
>> that advertises clock and reset functionality, as well as regmap
>> access to its address range.  This combination is being treated
>> as a new series.  (Details of previous versions are below.)
>>
>> The Toshiba TC9564 is an SoC that attaches to a host system via PCIe.
>> It includes a PCIe switch with three downstream ports.  To one of
>> these ports an embedded PCIe endpoint is attached, and that implements
>> two PCI functions.  BAR 4 for both PCI functions provides access to
>> registers controlling blocks within the SoC.
>>
>> The system controller driver adds the clock and reset devices
>> using the mfd_add_devices() interface.  The clocks and resets
>> are implemented by drivers included in this series.
> 
> Toshiba TC9564 bindings and DTS should be posted completely. We spent
> great amount of time on discussing already and I pointed more than once
> that big picture is missing.
> 
> You are not describing here parts of a SoC.
> 
> You are describing one, single device how the host sees it and DT
> maintainers (and writing bindings) ask for complete picture in such cases.
> 
> Best regards,
> Krzysztof

https://github.com/riscstar/linux/blob/tc9564-dts/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts

