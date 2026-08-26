Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCFC3BE638
	for <linux-clk@vger.kernel.org>; Wed, 26 Aug 2026 09:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738259; cv=none; b=e78Yf97unATlyj7GgcVVVmRHV/tyLzJ93Ry8PRk8ig3YMz3YbsIf6B2quJufQ/PFU5XPoC8EXtee3MkQY1AHM0DWZc2y5OJgU2GFX4BK6naOZP8J5+zKFYfovRzjTDXZB0XI48w4GcXYzN5Db4Sorf7nj0b6KiaGgFeuSjDZ42w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738259; c=relaxed/simple;
	bh=HCKLdImOdMKQJJMilraP0Wk/2XAp3iAJOfJcTrNeEdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q/KWnqpTZ1M5X61/sHEsMKcqPoJNaujqC6rWsBk2Lnh+Y6wrFViBsN3J79AM8aokXF14Y5vlHfctWmMlflPCKLWtorgYTI7xo0ZlM3qRPg4jHVuTRry8hpLHKy6MJwVUJ87HSDsobWvnJZYI3fSKgP6gmW54r5AmvbSHcMxrjoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso703995e9.0
        for <linux-clk@vger.kernel.org>; Wed, 26 Aug 2026 02:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787738256; x=1788343056;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rqs/JjM/rhFjmn0l/Jy51z8ISXKwBj5TSNnqoIe2ZtQ=;
        b=XolvEz+N1Rn5QIO6Cl8+uUMqYRFfnJV3tzu6zUA0AEJ1fylGD7KtMElpkXwxLEfFKD
         1wAzGJBNKA27PsSosfs/Ug0w/lcKiDPCXc19MJtlSMczCgv61NCC87rML/Yhsm4vPJCf
         ZDNh3KXd2aojMotVZ5Z2wLKexbSVGWJqkJN2p2+tx53UapuRG08UDVyaXd7pDaCSrfXa
         JpD2/wkLkgMnKnNrb+wVwMCBQGCBkEXwj1xv8HrU8JGg4QEE9NnW/61m+n9/F6qEFwKU
         uamMbn/gYgAC1uiWkVl9nqm6Apw+iS3bU2GWpBiDyU29cMVwOqViBqUMPYSFvLC0NzGc
         Ow+g==
X-Forwarded-Encrypted: i=1; AHgh+RqvAJV+UdumK4JxRjR4wsGWHQE6q18VQkR5l3aTC47oksFbpEuwEl/UA/1BHTkMuvO/YMMB2ZnxGis=@vger.kernel.org
X-Gm-Message-State: AFuF++lMdn72XY2Y92+pjDA7YyVczxtTxp8HkmbEOECl7yczbYseCyfF
	B46994J3WPqxtzmA+684Bo7py17RmMdzvbD8iKWesQVymEPurvp+AtoN
X-Gm-Gg: AR+sD11nQSFVbErROGZ0TReqWNkE3biB5U3+bJ4CoFYyRPRIEN5k0gwZbbBYMpjG/ik
	j5kUjrhgX7N2igahhblmhamCBVP7LowF/y6NAClKJjSuhUgEhB4Cs/hE5O8ZLpH+vkG+0xNceER
	HTNMxr8P9c6+d0N6VIwa+pRjAnORgiPkr+RY0Ka0QeiAYPCIhRpTkDs1YCcgkQygtEBK5V+1oyD
	HD0H8YSn7ZoFrXUNKL3QLT5yF/JPflquIMJ0Kh7fHSSe1yIu1/qt/atwlbWWP5smJHpt0WB/FwE
	CtCbNCZrUKBCefN4J1vH4y4qWWN/hSq68HYbnpvcJhQ0Oq0C4Z5BIaYQPKEO6gvNuhxWyFFLbMB
	kgCirykGfdcaLXaBHyu8vLdHTk3cwCfhuSSfQDWrCkpaat0JPRTfIPwayzscDJWMiArj87Zj4ly
	n98snxSo9Y9W5amlAHkfnTXciO6hQWQUDIdhwf4o54C2rXpx1X3fxN/ZZhYW8qQY/d0I2i59lUl
	qcKm2k6OlzgypzWaKJjsA==
X-Received: by 2002:a05:600c:620b:b0:499:516b:83d5 with SMTP id 5b1f17b1804b1-499dc7240a3mr44654155e9.11.1787738255490;
        Wed, 26 Aug 2026 02:57:35 -0700 (PDT)
Received: from [192.168.1.135] ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dcae3216sm20357655e9.15.2026.08.26.02.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:57:34 -0700 (PDT)
Message-ID: <2800152c-25e0-401f-950c-15942c4f9a04@linux.com>
Date: Wed, 26 Aug 2026 10:57:33 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] clk: meson: t7: Intermittent boot instability and memory
 corruption on VIM4
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jian Hu <jian.hu@amlogic.com>
Cc: Brian Masney <bmasney@redhat.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <3930906f-783b-4d72-9260-ba25cc8081cb@linux.com>
 <048697c8-8331-42aa-accf-d114774ac5fd@linaro.org>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <048697c8-8331-42aa-accf-d114774ac5fd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/08/2026 10:02, Neil Armstrong wrote:
> On 8/23/26 17:40, Lucas Tanure wrote:
>> Hi,
>>
>> While testing mainline Linux on the Khadas VIM4 (Amlogic A311D2 / T7), 
>> I am hitting intermittent system instability, storage loss, and memory 
>> corruption during boot, unless I append clk_ignore_unused to the 
>> kernel command line.
>>
>> Because the failure is intermittent, I am running 100-reboot test 
>> campaigns to bisect the remaining clocks and isolate which clocks are 
>> critical and cannot be safely disabled.
>>
>> As testing takes significant time over serial console, I wanted to 
>> check if Amlogic or the maintainers could shed light on this:
>>
>> Are there specific T7 clocks or hardware domains that must remain 
>> critical/protected even without an explicit in-kernel consumer?
>>
>> Current clocks being disabled that don't kill the board on a test run:
>>
>> [    0.380313] clk: Disabling unused clocks
>> [    0.380413] clk: Disabled unused clock: rtc_dualdiv
>> [    0.380718] clk: Disabled unused clock: rtc_duandiv_in
> 
> Those could be used by low power stuff aswell, not only RTC
> 
>> [    0.381377] clk: Unprepared unused clock: a73_div16
>> [    0.381972] clk: Unprepared unused clock: cpu_div16
> 
> Those should probably be left enabled if they're used by the DVFS code
> 
>> [    0.382605] clk: Unprepared unused clock: f50m
>> [    0.383174] clk: Unprepared unused clock: fixed_pll_dco
>> [    0.383786] clk: Unprepared unused clock: hdmi_pll_osc
>> [    0.384416] clk: Unprepared unused clock: sys1_pll_osc
>> [    0.385056] clk: Unprepared unused clock: earc_osc
>> [    0.385652] clk: Unprepared unused clock: pcie_refclk_osc
>> [    0.386323] clk: Unprepared unused clock: eth_pll_osc
>> [    0.386961] clk: Unprepared unused clock: pcie_osc
>> [    0.387548] clk: Unprepared unused clock: mclk_pll_osc
>> [    0.388187] clk: Unprepared unused clock: usb_pll1_osc
>> [    0.388826] clk: Unprepared unused clock: usb_pll0_osc
>> [    0.389465] clk: Unprepared unused clock: tcon_pll_osc
>> [    0.390105] clk: Unprepared unused clock: top_pll_osc
>> [    0.390738] clk: Unprepared unused clock: aud_pll_osc
>> [    0.391361] clk: Unprepared unused clock: ddr_pll_osc
>>
>> I am not forcing any clock to be disabled; I am forcing all clocks to 
>> stay on and letting them be disabled if unused one by one.
>>
>> Any guidance or hints on required platform clocks would be greatly 
>> appreciated.
> 
> It's hard to say, this is dependent on each family, Amlogic should be 
> able to help here.
Yes, Amlogic, please help.>
> You list some clocks, but I don't understand you say that it's stable 
> only if you have clk_ignore_unused, so how did you get this clock list ?
I got this list when I add logs to the clock framework and run without 
clk_ignore_unused.
> 
> Neil
> 
>>
>> Thanks,
>> Lucas Tanure
> 

