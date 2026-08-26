Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F4836A03F
	for <linux-clk@vger.kernel.org>; Wed, 26 Aug 2026 09:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787734967; cv=none; b=EX15MF1E521driMb4AOsBhUNEhTDWEMC/xl9JkvkgDRc7nRwA5lZSUGpJjU5PNPh8NCqReoU9D7ojfvxJLZ2GCvvKZ8zvXHD+0QT7IxERDt+wIOcG3IdnRLMTfsyLk/HT5Z9FinSyNgKYyUrb56PY+kRZAWJ05h91fH2c6kCwGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787734967; c=relaxed/simple;
	bh=GAgimL0oMfAR2uzI3Q5cwGavsxhsOEvXqsRLj+mk1Hw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EgOmlBa23BZEQb1N+F39/Ex/bks1W9P2cr3TJDRdG3XGRX7zawHvUE+/1ctwCJe0EDAKD7vjOaREElW2pJ/HgjCU+EGiH0IT8K5M8b5wqPcGuD1cNTKlUz1a7Z+UKAP0ouNGSCqTYn88fl4SuDhnRHWti9ExZu3YjCpW0sTfKuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FxXd33m4; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FxXd33m4"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so6207715e9.0
        for <linux-clk@vger.kernel.org>; Wed, 26 Aug 2026 02:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787734964; x=1788339764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=stp9PLONuG5ZO5VWMIxZEJbXb8VtweiqjlFaBczDy5M=;
        b=FxXd33m4RWxkUbIsdGkRNHtiCY8QXrC2ddqfKCUa0JPL8KyjhJCNe3FdjlaBdvI/A1
         GifDd5uYH2cWno7nY8ecBPRHYP2X4IcGYgw8R7Ql9QTffRYQmtPVG2qV/ImlAw+DNhNy
         e5/xD9wbySAhsHf5an+xVhL5/npUGVdDX8ACDaiZFe07Xmk8/GAr2FvNW8sowBHi/ftA
         YvvrvgXWRFuzrAOuVXA/KWtwyi6oDw9ktKCnVfd5WchesFbvWM9cdOWO7y7mu3ad573a
         jpesUpkb82pnFrdBKSGpY6a5dcE5XIG7BUHrEhYlJ8ZIx1Pt3iTd5I4VmXwYNXdMN3Qr
         7bCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787734964; x=1788339764;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=stp9PLONuG5ZO5VWMIxZEJbXb8VtweiqjlFaBczDy5M=;
        b=Q6RXRd4v0gWHwpQKRkqNLh/0AQ9gTm872RByKpGYPoFoDb2fHqvn4FTskrOYBRqH/k
         1lA5XYGiG4Ug2h8XSmhUbSIwODBvLHKSwt8391fkcPGarRldT3hyoSivhgSTKi3oFrM4
         n7EjC/Th0sHX1ahnWl9G85kTPRzZtlUy63jtKsmckHxykypdmvkwG/7vB/69khj2buhO
         mOFNFAeId5MUnJHPeXQgOTpXRbIzc6zi8HMCEqcKsKoZHkNbT0zHTuX6a8Mh4Ws1Ta7v
         r91uTVGKxyiWlFdvYtHTUO7i29dD6IGFLj84zwGNq+8s1qESDUkC15NUNT2wBWgQ7gPm
         o+PA==
X-Forwarded-Encrypted: i=1; AHgh+RonajZELhpQTGxzckx9+j+LPEW/CWE7NwqpQ8Yxnm59gI4B2uOCkbVlCwSvceZmcuGtZXTxa0iTLys=@vger.kernel.org
X-Gm-Message-State: AFuF++lqVd5NApx7FGrAXVXB79A1yAf/uzT+Stqifv2sxGc0wY0rKDCo
	HZGS9LeHb3zFDisSqI7984EnQUXBwb7+gwcVMDRAznmskhoQPWJnx1ii+rareDhkuQg=
X-Gm-Gg: AR+sD12CtNHwuDYKDtyfk/V8yTKusKt9w+igCMeJfmIjYnYmY/37c0t3DbIwu5f8WGo
	DVZjjYEchyDFaU1qe+Jzl8I9yNfxhxuMmCpH3YzF7Mk1KrQhuHH8cM0YWjrC+wtR7clbKqBJEWX
	D6xNEbes1Lq3t/w6hRCBsnL7D1o9AyZ3lqz0WjGMIFEvF+BHiHBXgVoWdYAygmh+ER/G+uuLalx
	H6cmbhkulQOrJpew6pczh1Ydk8eJJw1oebMiAgeuVyBTuoSiei2KFTCGLZgOvHW0ZozFxjvls0c
	SKebzAT09uUqJFCN9FjtnLk7B1IZEFh6pCr9CJloLwFmd6vlRWrLHyNFgWvDHwDHLBYWVa4OvcA
	L2LcS6/k+J3dSKhMQCjX9DVmkTW0lXhbsxIcsDo2JXAbxfL5i31WS+ivUJiNTM96NB3A0QMBjgD
	f5K2/XHAobPrWpnEGeHYelV0ZRQQ3thtfwQMHVS8IL4nDSGrpV4UT58SYNRUIC0RKIfoyLvGq5e
	hgNpvCPs5j6ytcclFyf/1qCr5gqrHmcjrLw47EK881Nmw==
X-Received: by 2002:a05:600c:3b8b:b0:499:7a19:408b with SMTP id 5b1f17b1804b1-499dc722993mr44636675e9.11.1787734963958;
        Wed, 26 Aug 2026 02:02:43 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:135f:84f0:a520:10fa:2386:b410? ([2a0d:e487:135f:84f0:a520:10fa:2386:b410])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm19644365e9.2.2026.08.26.02.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:02:43 -0700 (PDT)
Message-ID: <048697c8-8331-42aa-accf-d114774ac5fd@linaro.org>
Date: Wed, 26 Aug 2026 11:02:41 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC] clk: meson: t7: Intermittent boot instability and memory
 corruption on VIM4
To: Lucas Tanure <tanure@linux.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jian Hu <jian.hu@amlogic.com>
Cc: Brian Masney <bmasney@redhat.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <3930906f-783b-4d72-9260-ba25cc8081cb@linux.com>
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
In-Reply-To: <3930906f-783b-4d72-9260-ba25cc8081cb@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/23/26 17:40, Lucas Tanure wrote:
> Hi,
> 
> While testing mainline Linux on the Khadas VIM4 (Amlogic A311D2 / T7), I am hitting intermittent system instability, storage loss, and memory corruption during boot, unless I append clk_ignore_unused to the kernel command line.
> 
> Because the failure is intermittent, I am running 100-reboot test campaigns to bisect the remaining clocks and isolate which clocks are critical and cannot be safely disabled.
> 
> As testing takes significant time over serial console, I wanted to check if Amlogic or the maintainers could shed light on this:
> 
> Are there specific T7 clocks or hardware domains that must remain critical/protected even without an explicit in-kernel consumer?
> 
> Current clocks being disabled that don't kill the board on a test run:
> 
> [    0.380313] clk: Disabling unused clocks
> [    0.380413] clk: Disabled unused clock: rtc_dualdiv
> [    0.380718] clk: Disabled unused clock: rtc_duandiv_in

Those could be used by low power stuff aswell, not only RTC

> [    0.381377] clk: Unprepared unused clock: a73_div16
> [    0.381972] clk: Unprepared unused clock: cpu_div16

Those should probably be left enabled if they're used by the DVFS code

> [    0.382605] clk: Unprepared unused clock: f50m
> [    0.383174] clk: Unprepared unused clock: fixed_pll_dco
> [    0.383786] clk: Unprepared unused clock: hdmi_pll_osc
> [    0.384416] clk: Unprepared unused clock: sys1_pll_osc
> [    0.385056] clk: Unprepared unused clock: earc_osc
> [    0.385652] clk: Unprepared unused clock: pcie_refclk_osc
> [    0.386323] clk: Unprepared unused clock: eth_pll_osc
> [    0.386961] clk: Unprepared unused clock: pcie_osc
> [    0.387548] clk: Unprepared unused clock: mclk_pll_osc
> [    0.388187] clk: Unprepared unused clock: usb_pll1_osc
> [    0.388826] clk: Unprepared unused clock: usb_pll0_osc
> [    0.389465] clk: Unprepared unused clock: tcon_pll_osc
> [    0.390105] clk: Unprepared unused clock: top_pll_osc
> [    0.390738] clk: Unprepared unused clock: aud_pll_osc
> [    0.391361] clk: Unprepared unused clock: ddr_pll_osc
> 
> I am not forcing any clock to be disabled; I am forcing all clocks to stay on and letting them be disabled if unused one by one.
> 
> Any guidance or hints on required platform clocks would be greatly appreciated.

It's hard to say, this is dependent on each family, Amlogic should be able to help here.

You list some clocks, but I don't understand you say that it's stable only if you have clk_ignore_unused, so how did you get this clock list ?

Neil

> 
> Thanks,
> Lucas Tanure

