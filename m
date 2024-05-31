Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A472157A68
	for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 12:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717157684; cv=none; b=p6S4fFT51Ylf4hVJdiaamzK1lQ40Up6gy1qldp6AYxROHoywz5AM7qdZ70xcOksSmcWgG6O7hf+t43v2NmFNn0959S15FaHWO833H6F4vWbtJfhZaA+giom8RlTcbdTJeKAbFqENlvhwoD1sOILRmGj5MPDovScESdt6hlnBkQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717157684; c=relaxed/simple;
	bh=CQmx+o9N0DMEYwK5DNVlIisz18HsP6y0ABMSIz8z4S8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=inuV+oArktzFzQoWXtrWGLcjCKTcz9LCwsL76VCAlNUG+Hv6k4fLci8/HQTGNiGt2shbHMUCRdWKwp4Fr0n4ZbQCVA9XJWeY0bFlCUfSeCGmkg6DIYO6xM5OYoYE0jr65WwzQoCVE2/ptPuFc3dMJ2MOVnKIYhQH44yKsyhB3Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=UNtSVBjT; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="UNtSVBjT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1717157666; x=1717762466; i=wahrenst@gmx.net;
	bh=CQmx+o9N0DMEYwK5DNVlIisz18HsP6y0ABMSIz8z4S8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=UNtSVBjT9wBbToHu9kRPK462Atqvz6SbOMbmesXm+L6miPO/KkKHGlU8sGBZPufI
	 ZnquaJNpE9vXSuesgH4i/gm/RK2gyaL6bCrgxR5AcSQm7XzeUpChxZcMpV9jZBWKv
	 ihJQv1q8LwdESvWDuqfN78Kj8kGW4lx72f+MzSTjYv+zB1mqA4p7KO4Tyo/a7CAgo
	 K7zXqfJybQilu/rD9c7Qt/3KF0njN9/WhYtvoD/1229Sz2rrmvZsZmNrTjZHqR6G5
	 /e3c7TVnXQQzP8M6o7evwPng0BHKt5jigmF+bXZ6GVPLRHXofpX4twV4N0Hq6ZUuP
	 5LAwHg9wOzYHAzXLCQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtOGa-1sTz2a1I2I-00rX6E; Fri, 31
 May 2024 14:14:26 +0200
Message-ID: <30874df5-6777-4c7e-91ae-33160abf14a4@gmx.net>
Date: Fri, 31 May 2024 14:14:25 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: bcm: rpi: Add disp clock
To: "Ivan T. Ivanov" <iivanov@suse.de>
Cc: sboyd@kernel.org, florian.fainelli@broadcom.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>, Andrea della Porta <andrea.porta@suse.com>
References: <20240531092730.253484-1-iivanov@suse.de>
 <4c56e57c-7a4e-4976-a05e-0adf3df13b3f@gmx.net>
 <20240531101813.fronn47dx3ksacq6@localhost.localdomain>
 <2a9fdc2d-7fdd-439d-b8b6-406b559d27c9@gmx.net>
 <20240531111857.mwekjpyetqmi7c5t@localhost.localdomain>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240531111857.mwekjpyetqmi7c5t@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SViQSd23+ZB7Ub7haqZRnSDU6SkU4K4MxogNbWJEYyMEAGDmwr4
 K4775HbuMNWv0eltiBlywIS0v+rgDI4Pqeq8s6vtfGfbY4KSGrPWR3CuE5T3Q/J3d32QtS3
 sZjpdVgNc8m23J64u9sZCEo3zXcqaP5O9QHaiQmH1bJbAA3rAzsFFYJIE3prO7Qtmqzb+N7
 hQVuqXl0kFSyPOf3Uf7BA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GW/myPWZ8No=;CqL7LtaabWFHgPfm0Wv0j3C9GHf
 WheZajuIw5dJtphzbCEJWPrw6+FblwKuVQsmY/zB1HgX8wPk6pm/u5VYgNjRk0LdmhF+Fs5A7
 5vKOKq5pnMwUwFIJF7PAw8RAV2XOHoH57IbV0as/iM3vd1Gx4bwR8+sxufpJ0DiZ0vMGsB2gi
 TreO9YR/3a+RT4LHGzv9RvkNQ1Geo6lT3l81rlc0vStvhzRhlQJhakGVRFBMy+Nuzt/l9tX2Z
 dt44BdHql5tOgbXKUAh2yzjI+UHfAKaVq3O8LQIY9gf1yJeimKZUoZERETH484MVciTNwj0ms
 JdVlzQTZB7MHXIrd/foDL9/dfjr2f5J0tU3FkL8Q69lAvAn9hdqAE0rrXBGr3j7tcUVqFosuO
 IV5EYTIbkHjprLxB5Ft9flY6QrjsiTq6xkAFU4Xvdd9qh6R3BEVkZcxOqAm8xrfXZNUIytbcu
 Z5dbrih91gpkvHW08Exi+Li5qwM5Q2UCc+xoQY2TEc4XZGTeGS4dUv7WDRnbvWZWM9oFQ9xv5
 uOG5egu4Hm9aiyxNgIpXG0JS36kxbFU/Sa8NkcJ/YAR1NCWmleTZS1tFLC03FqhDaU80qCEyp
 uRtPi3hira/k5pMe5XyVBpL4qxcYHgfBKIo+Y2JN26D5EnQArIBu83Y8HWtYJV9EFgGrnEcMB
 nvTg5p/M3V3PS7xx4Bnow1K6fzJulsKcUB+T8Gt8iqIVlKWK+ALAKPzfYAWS2gcsT4IkUKN4Z
 6VwryYoITbUHjLoaCkPL3CVo7X0WoBVDjmOz5ht7Qcs0AXC4o5uybCLsLTiI7qLx0IvVPWmHj
 M3bFWleYH3zPZNDS1gp6STP03nIhQa75LyMp2XotYUZUU=

Am 31.05.24 um 13:18 schrieb Ivan T. Ivanov:
> On 05-31 13:06, Stefan Wahren wrote:
>> Hi Ivan,
>>
>> Am 31.05.24 um 12:20 schrieb Ivan T. Ivanov:
>>> Hi,
>>>
>>> On 05-31 11:55, Stefan Wahren wrote:
>>>> Hi Ivan,
>>>>
>>>> Am 31.05.24 um 11:27 schrieb Ivan T. Ivanov:
>>>>> From: Maxime Ripard <maxime@cerno.tech>
>>>>>
>>>>> BCM2712 has an extra clock exposed by the firmware called DISP, and =
used
>>>>> by (at least) the HVS. Let's add it to the list of clocks to registe=
r in
>>>>> Linux.
>>>>>
>>>>> Without this new definition driver fails at probe on BCM2712.
>>>> could you please explain the relation to Andrea's series [1]?
>>>>
>>>> How can this occur, because there is no Raspberry Pi 5 support in Mai=
nline?
>>> I am using few out-of-tree drivers on top of the Andrea's patch-set
>>> and noticed the failure, so decided to prepare the road for RPi5.
>> okay and did you use the vendor DTB or Andreas' version?
> Patches from Andrea don't have "raspberrypi,firmware-clocks" node.
That's the reason i'm asking :-)
>
>>> I am not entirely sure what are you asking.
>> Because Andreas DTS shouldn't require this patch and we usually don't
>> include changes which are not testable with Mainline Kernel.
>>
> So I should wait Andreas' patch set to be merged in before I can post
> anything about RPi5?
No, but it would be extremely helpful for the maintainers to know, which
patches (directly or indirectly) depend on which pending series. So a
comment below the commit message (at the same place as the patch
changelog) about this would be nice in this case.
>
> Regards,
> Ivan
>

