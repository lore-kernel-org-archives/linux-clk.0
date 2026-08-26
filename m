Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EEA3E315E
	for <linux-clk@vger.kernel.org>; Wed, 26 Aug 2026 09:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738139; cv=none; b=I5LQ+muua/zEu5PEUgyhs7L9qtrg6V+XSU4lPEWwxAsa/hnhCe4cCUYlUw2SwQ9LzaYw6W6uyFRL89vAwe0q6zYCS6sgoS0QaKl3gDvlc5JXN0hr6gcR8VePKoJqqStMrmNUxjtJ52CXdUD3NvnB/6Ckqn+2kktwqDp9mBQO9+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738139; c=relaxed/simple;
	bh=cQJViyiRFF8Su4cLTioV8AEYhWE9fZW3c8POWUZWSrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oITqiL+R+KqDRA0ociUpiNhRZVW32C93UOKHXU8syKNtlYJuYywBdHz1PgOoQlTDHGQBxyDThtyxTrfDsL/Z/e9+U3nsmlU9ZbSEJLIXQU/8Ja5to3+577Li3duFuwO8LIkXSaEdfGBBXPUvSNmIdi5ryWaOM1XRS5vA9m0++Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4956869750eso4452765e9.2
        for <linux-clk@vger.kernel.org>; Wed, 26 Aug 2026 02:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787738136; x=1788342936;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/QbukygbVrN8gnIcgkSWM0X9DmiBJ+CcZt8S0h2LL9s=;
        b=ZKLawMFm8nGmYgiAnIPyMJNBqImb1exb0rhWzbuAJBJ9GbgyZ3ZO18c5p3zV3jVAA3
         +kc6qKnIEzpOlrD1wUz8I+vnMYiJAFdG4xJlvCg/Sitmd+WajNf6sdcysI/dC/Zp6vDw
         Q+oAUmxURGa27BRovHNkQvR/a3RrBU5sPvCwlE/wweRtbEyi0rqEuCcEogEJjHsEiRvv
         uX3FzZ8Kpjp6/ieleeA/YgKi08rmuSdv9wSY98lwx4X1OpCcPKJjffYsrwa31nvMG5OV
         gKMlGm5S6Wo/nmuJ2FprCg83zr80k/6H88Gd1qXTfYd8Pfb61iPQ45MNS2fdiRG/wNSc
         bIaA==
X-Forwarded-Encrypted: i=1; AHgh+Ro9LXkr2qu7cY7GPmOzN7ZCWdv5RWfZq5L1o0+w7RKgRUAhGvsEc7hF/bYho1urGu/4CV9ORe4D5IE=@vger.kernel.org
X-Gm-Message-State: AFuF++m8vIs8HAzZPwMlIm4CKKABFJWJbcXoX7kPUWoW7A1+1gWhBqkU
	jVhRWmX8FyvxTUkuk919fG6CrVdEUhOJePGBuRYv7C6wjbP4ADu8kETK
X-Gm-Gg: AR+sD13X1wexyEvQ31cub2CrdDVUgSPPOV6EblRhK2tCq1PWGeQftd7zScmRrr55GTy
	vexlFVN6o+x63dAcNC6iEj1OQ840jRTWW9ze84huRE5Ogws3AiAAYHdzdlwoJt7HVdkn8ZnjI49
	kxtmojVojRBbkfUImKC2e2PaStryFBm1UmaePwICHHC6qCNiD+Z1yEmWSxrqR9cXD20D+S1AT7o
	n6Z2tXDEgpZ4SX7j5Ss3mkLay/Wx41RWIa76As0RjDFMZCX51MwCa+3Udao+PjsOGqK7De/SEST
	aOiXUX2SLj6wdX5njd001bi2eRWjEe58zisrFVykd6sePBu3fOM7YCdkTCxYFU3/GIMyKfqTrCM
	LVTrVq9RBjhO1j12ZWQae4KWB4CuWlSs175b9MdHOQ5sm3/9M/p0wV3pVqm8gxgq7Suy7H3ZJM0
	LVp68ZNitf/QkmaCHnEn64f7dffF1sq1z6+YVbPR2Qn69yecMc6tXIJ51xuXWtlnFRHNbw+h7VJ
	NSwhJ7QPUd4rFTqf2n8mA==
X-Received: by 2002:a05:600c:474a:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-499dc82ad0fmr40013725e9.14.1787738135905;
        Wed, 26 Aug 2026 02:55:35 -0700 (PDT)
Received: from [192.168.1.135] ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dcad25ffsm20206255e9.9.2026.08.26.02.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:55:35 -0700 (PDT)
Message-ID: <57d796bd-7a3c-46b9-bd65-d6860adbd355@linux.com>
Date: Wed, 26 Aug 2026 10:55:32 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] clk: meson: t7: Intermittent boot instability and memory
 corruption on VIM4
To: Brian Masney <bmasney@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jian Hu <jian.hu@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <3930906f-783b-4d72-9260-ba25cc8081cb@linux.com>
 <aoxjX3HabY0brgXk@redhat.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <aoxjX3HabY0brgXk@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/08/2026 16:29, Brian Masney wrote:
> Hi Lucas,
> 
> On Sun, Aug 23, 2026 at 04:40:42PM +0100, Lucas Tanure wrote:
>> While testing mainline Linux on the Khadas VIM4 (Amlogic A311D2 / T7), I am
>> hitting intermittent system instability, storage loss, and memory corruption
>> during boot, unless I append clk_ignore_unused to the kernel command line.
>>
>> Because the failure is intermittent, I am running 100-reboot test campaigns
>> to bisect the remaining clocks and isolate which clocks are critical and
>> cannot be safely disabled.
>>
>> As testing takes significant time over serial console, I wanted to check if
>> Amlogic or the maintainers could shed light on this:
>>
>> Are there specific T7 clocks or hardware domains that must remain
>> critical/protected even without an explicit in-kernel consumer?
>>
>> Current clocks being disabled that don't kill the board on a test run:
>>
>> [    0.380313] clk: Disabling unused clocks
>> [    0.380413] clk: Disabled unused clock: rtc_dualdiv
>> [    0.380718] clk: Disabled unused clock: rtc_duandiv_in
>> [    0.381377] clk: Unprepared unused clock: a73_div16
>> [    0.381972] clk: Unprepared unused clock: cpu_div16
>> [    0.382605] clk: Unprepared unused clock: f50m
>> [    0.383174] clk: Unprepared unused clock: fixed_pll_dco
>> [    0.383786] clk: Unprepared unused clock: hdmi_pll_osc
>> [    0.384416] clk: Unprepared unused clock: sys1_pll_osc
>> [    0.385056] clk: Unprepared unused clock: earc_osc
>> [    0.385652] clk: Unprepared unused clock: pcie_refclk_osc
>> [    0.386323] clk: Unprepared unused clock: eth_pll_osc
>> [    0.386961] clk: Unprepared unused clock: pcie_osc
>> [    0.387548] clk: Unprepared unused clock: mclk_pll_osc
>> [    0.388187] clk: Unprepared unused clock: usb_pll1_osc
>> [    0.388826] clk: Unprepared unused clock: usb_pll0_osc
>> [    0.389465] clk: Unprepared unused clock: tcon_pll_osc
>> [    0.390105] clk: Unprepared unused clock: top_pll_osc
>> [    0.390738] clk: Unprepared unused clock: aud_pll_osc
>> [    0.391361] clk: Unprepared unused clock: ddr_pll_osc
>>
>> I am not forcing any clock to be disabled; I am forcing all clocks to stay
>> on and letting them be disabled if unused one by one.
>>
>> Any guidance or hints on required platform clocks would be greatly
>> appreciated.
> 
> I have an outstanding series that disables unused clocks via the
> sync_state callback:
> 
> https://lore.kernel.org/linux-clk/20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com/
> 
> Be sure to not have clk_ignore_unused in your kernel command line.
> 
> I suggest comparing the list of which clocks are disabled with that
> series against your list of clocks above.
Thanks for the input, it did not solve the issue. I am going to produce 
the list with a diff in disabled clocks with and without our change, but
it did not solve the issue.
> 
> Brian
> 

