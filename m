Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213849;
	b=ubY6Q4ixn/vMtSvz8wV7Kzp7rN2Pbmt44m5Lug/OqMkSm4OVEkiBc0Xth9ksg1WC5pGC
	 SMVGwni+XMrR+9UAA4IvsuuW5yb58ejuOSFFxJUZz+90/kMEKx+KpaEqy1oSNncojoQBR
	 U3oF8UnCPg8MPbFcnD5i/WK81wSFbQRDBgpdDq2/Ezn1UMl+sUcnEL+bmXD2z5J64zjNN
	 uL1elLeN3EcTQhnlrxHEcxCuTgnioW7XsX6N8IoAivLlyvDWBiE+GSoNLqjBuHx7L7wzy
	 /NuuKLk+kB5f9Xwg6TNfB9FTY8flVJjdAK86nrnL30JQEBHeFGbsvAt8rJP70ns1YTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=wmoE0o+usurqRULoy3dgPzQt8WkDzf6jK8UVMHR65yY=;
	b=0lqaxMWpyXFdzHBjdJZpAWXIKsWJOtt3B6Uf5U5+R0joaItpQowHVOPJ9AXTwTOuiO8v
	 q6cFI4yTpCYJXZRsrsiOZSCM2++yodpQ3LvVcIHxIxaugL5L9VulV0rWLWRkgcC0LGdVN
	 6gb/kxB5x7IXOetM1yhCSE4sf+5V9dJ/rMzxb7qUo6suwmarRor/6pmyM+SW7KI818R1z
	 s0DFDzpZsJN+t5ozfMOOKWfO9Xil3C/vJyCw6aKzY0zrVimEh71U+Q6Px6K6obOPBM5Mn
	 FQ0PypvjtyU9SqDx+jeglk1tS9bPwRe4MDjuKvzzFmhSw1jsbx600gR2+LQCKggr5Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jFn6wVca;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E50D606EEBE
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 08:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E50D606EEBE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jFn6wVca
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e09aa5264so327629f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 00:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794213848; x=1794818648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wmoE0o+usurqRULoy3dgPzQt8WkDzf6jK8UVMHR65yY=;
        b=jFn6wVcaE/0brExOQSxUsMaQErbNrj7lIwq/e7JFUEf2PE6JF0OcUfCCaN7HRgrjbE
         QaK2fUj1B1OjT5t78p7gAKyzE59BrL5e8UCb6Z/FAuqy3vYNqHjjgAQ+uqlnLrgr64sN
         WuPkb8bDHVtSUHfOPvsbZQk0RB1hnaKy18DV7TB1ls9y6B+QPZMFpAFpOTDhzB9t7KM/
         nbPDg9u9Cq4GRYMxHbDDEdNOlX2IoF5rvS3hYlJwbfmgngAZb4DBsJPArFXZ+hyLfyvJ
         EQ//+yjDH2jcuvrdvwqBE8rkuKAIhnYalixe+s7pwQHr6O8Tfv0SK+/bLuRmSVKrC38r
         dPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213848; x=1794818648;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wmoE0o+usurqRULoy3dgPzQt8WkDzf6jK8UVMHR65yY=;
        b=UeXUyjF8JzYOKUByB6+RcADREzbL1kF7Akk4EwqupPlJ2lHFzlbj1pj//qwgVTBsMV
         LIN57zzYNwM/RulWZZtdgknCYg3i6aQyfD4R+VF8MiKkvd6sBzW/GgUo81Wz9qPTr/dv
         dnbHHW/p+XNRzoHJsvpQaZeGPLduoBGMbUdAkZ+qXI8L5i37RDXQdfT3kk9eo0frZ738
         3PyMj0mNWIYHGM23l2gYBQ0jh0lVmjrIp7mx8fbYQXfd/r94aORBSi4BQTKMBHvAayvR
         9hSif9uZmVbqoGFIApcXhqOIvk3hJ8aSHpx6f4O0+gfX+7Bm4SsMAoIML7KhShGM431g
         L3hw==
X-Forwarded-Encrypted: i=1; AL+hErH1+WObOhIs3FxDtDZ1D+KDN3AwcJPAQEDAKueH46zX9Kz2ei26p0J34Ktup+ighHw9XmM87pRQ/8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EFiwdn4FTTgvahaNcQn98ffYgkLHDOnWaP2S7WFfv/Re3uDGU
	c766YI94b9iwp+jQfMjmTWEF4VItj/EQPmGn3ku9uls994ufjspDLknub6wFeTc9U1s=
X-Gm-Gg: AYBFou0/XjZUYlfFvBnUY0aeBZEbfXKhbX/O5AmI4JtkSsOt61WKP6qy5x7k2goXf2P
	NHGD6R1bwQbY9EJoNjdHsGSau23GVRNbL44a99Fl52vpcY3jpcyPlEl5ZK8XB4NvoMyY373m7aq
	30zdUowoxnQkU+5ay3sj/FtMMwXfDJtoPEOr/TpdwpQDVUksdepLfC+L1eiRKtTKbFV29AWp4rC
	BkGxrOTYo4rK7+mZ+SLRysWqBWVQ7H+BKseOy97ud2DbTkMn1uhmyedTH+iEAHlO3901lNjdEa5
	buvO6GT7sBHBeo1jY2URCLcXgztZhSKWe19GjxJmUonnbwfwrdbSc4b42B5rSVeAGj8Zt3l8080
	JYlxtyxg2rs3Y/fyaICITHR0HlzuHOJgCHh3vQdiVzdqz6VrWG7P8zgfSHum/cEUS9nzCje6stB
	2QZeFo+hCIwL08LGIh7KkkkYfV8JXAPuiQtM2fA25NDLPd4zYwLgEMqZBWu5oGLuOoR8p8uovgs
	sXnkykiGqE6NasSkUx9rowdGM93H34k28sGTT4UsmRvPn7ZsiTUTJQCj1/hup1XFkXp2oxKNJRy
	6RzSMedMOI2wgASQhVrJVG+rMreA1+sGYLoOQRjCJ78dQnvYpejVPld92TEiAVWhUh8hrl1mXhG
	z2oLjpItHJw==
X-Received: by 2002:a05:6000:2485:b0:48d:ffa3:714 with SMTP id ffacd0b85a97d-49582bad522mr8029699f8f.19.1794213847391;
        Mon, 09 Nov 2026 00:44:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:6762:47bb:1e06:ff70? ([2a01:e0a:106d:1080:6762:47bb:1e06:ff70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f398a4sm8133300f8f.6.2026.11.09.00.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 00:44:06 -0800 (PST)
Message-ID: <317f2930-9f65-447e-aa46-223ba9e47033@linaro.org>
Date: Mon, 9 Nov 2026 09:44:05 +0100
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
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chuan Liu <chuan.liu@amlogic.com>
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, christian.koever-draxl@student.uibk.ac.at,
 sboyd@kernel.org, bmasney+clk@redhat.com, khilman@baylibre.com,
 rafael@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
 <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com>
 <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
 <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com>
 <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
 <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/8/26 22:45, Martin Blumenstingl wrote:
> On Tue, Nov 3, 2026 at 10:46 AM Chuan Liu <chuan.liu@amlogic.com> wrote:
>>
>> Hi Martin,
>>       Thank you for joining this discussion. :)
>>
>> I have re-examined the capabilities provided by pm_opp and cpufreq-dt,
>> and it seems that we may also be able to adapt A9 fairly well based on
>> the amlogic-cpufreq.c here. So we have no objections to the driver
>> implementation in amlogic-cpufreq.c here.
>>
>> I was most worried about before was that cpufreq-dt might not fully
>> handle the complicated clock and supply adjustment logic between
>> multiple clusters, which would have required adding a separate
>> cpufreq_driver. But it now looks like this can be solved by adding the
>> corresponding config_clks() and config_regulators() callbacks in
>> dev_pm_opp_set_config().
> That's great news, indeed!
> 
> [...]
>>> - Meson8/8b/8m2 (32-bit ARM Cortex-A5/A9) where we need to reparent
>>> the CPU clock to XTAL for stable operating during clock changes (which
>>> should go into a cpufreq driver that implements target_intermediate).
>>> There's no secure monitor or firmware involved for CPU clocks.
>>
>> BTW, could we put the CPU clock handling logic in the clock driver like
>> G12A does (though, of course, handling it in the cpufreq driver might
>> minimize the coupling between the clock and cpufreq drivers)? That way
>> we could fully reuse the existing cpufreq-dt?
> Common clock framework maintainers don't want muxes to be programmed
> magically in clock notifiers (which is what G12A and Meson8* do).
> So there's a chance that for new drivers they would just NACK that approach.
> I don't recall the exact reason anymore - but from my perspective
> using a cpufreq driver for this is the cleanest approach (although a
> few lines of code extra).

It would move the soc-specific logic from a soc-specific clk driver
to soc specific cpufreq tree handling clock muxing. I kind of
disagree on this approach. If some logic is needed to handled clock
parking while switching clock sub-trees and notifiers is not
accepted them the CCF should evolve to handle that, not moving
this logic elsewhere and have a proliferation of clk mux related
code in cpufreq.

> 
> Additionally: I believe the udelay(100) in the G12A and Meson8*
> implementation is not even clock related but a delay to wait for the
> regulator to become stable.

It's highly probable

> 
>>> - GXBB/GXL/GXM use SCPI firmware CPU clock control so to my knowledge
>>> we're good with what we have (meaning: no custom cpufreq driver
>>> needed)
>>> - G12A single cluster, no DSU: needs a cpufreq driver that implements
>>> target_intermediate (currently it's managed on clock driver side in
>>> kernel space, no firmware involved)
>>> - G12B multi cluster, no DSU: needs a cpufreq driver that implements
>>> target_intermediate (currently it's managed on clock driver side in
>>> kernel space, no firmware involved)
>>
>> The cpufreq-related resources on the SoCs mentioned above are relatively
>> clean: each cluster has only one independent clock and supply of its
>> own, and these SoCs also do not support voltage selection based on chip
>> binning.
> That makes things simple, indeed: each cluster follows the same logic
> using it's own resources.
> 
>>> - SM1 single cluster and DSU: needs a cpufreq driver that implements
>>> target_intermediate (currently it's managed on clock driver side in
>>> kernel space, no firmware involved)
>>
>> Compared with the SoCs above, the difference for SM1 is that it needs to
>> additionally manage a DSU clock. In this case, the clock-related
>> handling can be added in dev_pm_opp_set_config() in amlogic-cpufreq.c
>> (by implementing clk_names and config_clks in struct dev_pm_opp_config).
> I think so far mainline is not touching the DSU clock at all.
> 
> [...]
>> All in all, it looks like we can currently support all Amlogic SoCs in a
>> single amlogic-cpufreq.c? Then, for the specific characteristics of
>> different SoCs, we can differentiate them through the "compatible"
>> property and add the corresponding drvdata for each.
>>
>> I'll also try to support S7/A9 with representative differences based on
>> this patch.
> Great, let's look at some code rather than discussing theory on how to
> write code :-)
> 
> There's one last detail that we have to manage in case we also want to
> include the Meson8* code into the same file:
> config MESON_SM depends on ARM64_4K_PAGES
> 32-bit kernel builds can't satisfy this (meaning: we end up with
> linker errors). I think a simple way to get around this is to add stub
> functions to include/linux/firmware/meson/meson_sm.h.
> I'll take care of that once I can submit Meson8 support patches for
> your upcoming amlogic-cpufreq.c!
> 
> 
> Best regards,
> Martin

