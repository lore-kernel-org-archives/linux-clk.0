Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096549;
	b=c3fLB5J0xzbLYcbNDR/YlNSBIupS3wcGbYVy/jXJsfp+MMXQEOPIRrqi6b3ooA3FWWVP
	 6tq2AjjZ5t8UYiMQfBuxBnWoDxwesaoDNuzDiOFQoFI0aTfFsU+G/RncNl72UZJeUBm9T
	 dJ9Co1JDdyB2Q0RIr3VTd6/Pzf0T3gwZ9PJjma+/nqx1kvdmfQXd3b/6x1+I4SFCOJu1u
	 Z7ivmVmgEnRcdilCWA85IeaLOgHMWPmqXU7pLdidPBVwXXN9fGaJA4mk6dFdF5XjsjFbO
	 pkK25BYN/XR23wq1We1V54EVAh0VZNJjBUrWwUIITxcgennaXjvHtJvNwYBCPT8SQwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=Txz3OjJcCusHpkz1mnsFRsjrPbuP5hB0e5979S9csEw=;
	b=P5YEITg+vy5Rs7+alOd/Yp+5ndqFx6vL8deRmdM7ECBq5/mrGD++T5UTCtX7LJnqwKZh
	 zd2RuGaOJnONaVfS6e4W3S1MBCfSevsPqkajcxykziewxbUhSec9WoeKCzKxug7N9LrhV
	 IXWV/anEDpcjQ5aSMLc2XL/dh0RyGnYnJiGLPWY1Cwyyb3+VzcEEw9FSDyokGRjTBzPBB
	 Gdlv3Yw7jioyvP5jDn2DZp6p804FIPqk2Xc5+itYjTo2cAa+ZtwnWTd7Y6vDPJBP6CAcC
	 rdWUjzsxEB27PCfjCNONLdp/FVVFBrtMpZDf6fCc52OK/T8tXn2/r+HUpTMJlvVegHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PRuyvpw0;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00184606A31D
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 10:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00184606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PRuyvpw0
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so26897395e9.1
        for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 03:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793096547; x=1793701347; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Txz3OjJcCusHpkz1mnsFRsjrPbuP5hB0e5979S9csEw=;
        b=PRuyvpw09AXUhxaqoKSn35lLtPWxMtTHN4GQ32Ex6SVZaLabRSVb6RMYIY5MIg5472
         Y21PXceAqe42yrKRyJUq60g3sTXY+cQvLfgRLC+eblPmGWtUc/yYHsyf+6QEetzx5pLd
         mDJGFc5pP7iWYBYbeGGFHu0o2HpM5oYrVZX9a2Uy4BAwmhkTCB7tMBmLK3soa13XGKnx
         QkBlNFeA2FnfdG2NVVT4T5s+mMNk+Hhgyi418fm5yPTg1ytt3IiWE9iaa88WGiyvjk/T
         aB9/DQkSPRi9hMKw99M6ChHLh9sgdtCpjKBi3u70cpl5PwzDywNX7roYNXKz3h9HO/EQ
         PnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096547; x=1793701347;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Txz3OjJcCusHpkz1mnsFRsjrPbuP5hB0e5979S9csEw=;
        b=Wq0J25g80eKjsWzY7E517M5AT+NCpkL8h3iCvnXTOlQ0sdaUEYOnaIstlhu8AuCBYS
         DWlAFGOcX1IG833kk1ytKooU2DMFo8IBEG9hZksbVAfmsTZW99Vpdw4yBNB0JbDnHRxQ
         3CX/jccCdpQPvivrwcwUSk3HLNhEVakkzbiAZEI5vHH/UlgS5d2abyTo0fH9+ZtBkFfs
         lr3iUCTL83jCNijbGbbOaqnQJRbGMqlFCSA++hwujq5WWuA8IRRkERmVMvz6+Yc8a2LN
         lUMZcduKcFOW/sHcqfqw8HtFE8hztoEvuX2mtA5MBE1mpdmXbqvvWC/43K00j+VKKBcz
         lVxg==
X-Forwarded-Encrypted: i=1; AKwUvByrFo4fzyJcdO29Nww/7xVT6t52rR/oNqx++Tyt8s5L34o49pIq7T7ThdieLXi5UIB2Xl+rLoOBTuc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0GHD+qQkIyDVt1YbNtRniqDoz+udcznOlcViMILrYmfGS2+jl
	VRN9fYoYKdORNKzs1662SQ5hIzA8iu/oDp8ZA5F/novGzlp62G7v+5Jf
X-Gm-Gg: AYBFou3YHbQb9R1Mw4JEVVy3/u+G8ul72+/3m6UVGS6Q/3WVopYOS4Et7On3WoKnVNW
	UHEgycW/CtYjT/MWsPISX+i2lcdCd1TL8+WzjevKIi9zC64HOiRDV1Ebhm9WRyP9YACWN2z7OHu
	FOLyX2heu5GRcic6gh4XM25/nfUg7q//EYILCLj/FFYRf0a5KBMDyGP+qVkfX50eKt4S6mO0GvZ
	IXuE9W6fwvrCgBEwIFvZaMN7bakcq/g70KAoZFV/KHVhXwxEmQF6nsavhfyukp7d3htpMuBa8Zo
	FdmHDKL13BDOy81WOhuSUfslqE4hhEq7yWfvi4niqiOfGeGm2cJc6w1JRNvzPT9XdzswnFex2SS
	MDFnZp/2cUNgm9dekGn59Bmh0p69KRQQU7giwgFTWiDf9Rg4IY+ejzujsLorE+8mX+UdTN52wwn
	g4j8JGRzagFNaTeY9lzcjHQmqqGd+nsb3cjHc/9SpReK1uxy51KQDEbamxYzk28jnWfHxxr4yai
	vZgq3LpvkOr/ydzlRgC+EGnNRgQwr8BnAWUgb/z1VPgavcJdbQE17xgcidKo/sgArkeCvogZ9oQ
	IU5o/LvV4w==
X-Received: by 2002:a05:600c:4e12:b0:4a1:702f:c736 with SMTP id 5b1f17b1804b1-4a35ac3f7bdmr182539685e9.3.1793096547086;
        Tue, 27 Oct 2026 03:22:27 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4be6sm20023565f8f.37.2026.10.27.03.22.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:22:25 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.3\))
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
Date: Tue, 27 Oct 2026 14:22:09 +0400
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 christian.koever-draxl@student.uibk.ac.at,
 neil.armstrong@linaro.org,
 sboyd@kernel.org,
 bmasney+clk@redhat.com,
 khilman@baylibre.com,
 martin.blumenstingl@googlemail.com,
 rafael@kernel.org,
 robh@kernel.org,
 krzk+dt@kernel.org,
 conor+dt@kernel.org,
 linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org,
 =?utf-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
 <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
To: Chuan Liu <chuan.liu686@gmail.com>
X-Mailer: Apple Mail (2.3864.700.51.1.3)

> On 27 Oct 2026, at 1:26=E2=80=AFpm, Chuan Liu <chuan.liu686@gmail.com> =
wrote:
>=20
> Hi Viresh, Christian,
>    Could you please hold off for now on the patches adding cpufreq =
driver support on S4? There are still two issues that need to be =
resolved first:
>  - The clock driver currently does not support setting the CPU clock.
>  - The CPU regulator needs some time to stabilize after the voltage is =
changed. Without a proper delay, the CPU clock frequency may be raised =
before the regulator voltage has actually reached the target value, =
which can hang the system. The S4 CPU regulator handling currently lacks =
the logic to wait for the regulator voltage to settle, so this part =
needs to be completed first.
>=20
> We are currently working on submitting our own cpufreq driver. We are =
considering how to address the issues above, taking into account the =
hardware characteristics of previous SoCs and evaluating factors such as =
the transition latency. S4 will be covered by that work (as well as SoCs =
from S4 onward, such as C3, T7, ..., A9). So please give us some time.

Please don=E2=80=99t top-post, keep inline threading!

FWIW, the recent bindings/clock/driver work I=E2=80=99ve done for S4 is =
here:

https://github.com/chewitt/linux/commits/amlogic-7.3.y

My speed-bin driver is based on earlier work from Martin Blumenstingl:

=
https://github.com/chewitt/linux/commit/77e12d4d584d6a8bbd93304bbd4e9bbbb6=
ee159a

Setting a ramp-delay was the key to opp transition stability:

=
https://github.com/chewitt/linux/commit/ca7a99e86e23677c7b5af887e6f3b3c8ce=
3470d2

CH.
also a Christian, to confuse people :)

> On 10/26/2026 4:59 PM, Viresh Kumar wrote:
>> On 26-10-26, 09:57, Jerome Brunet wrote:
>>> On lun. 26 oct. 2026 at 11:00, Viresh Kumar =
<viresh.kumar@linaro.org> wrote:
>>>=20
>>>> On 25-10-26, 20:22, christian.koever-draxl@student.uibk.ac.at =
wrote:
>>>>> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>>>>>=20
>>>>> Every S4 speed bin runs the same CPU frequencies but needs its own
>>>>> voltage curve, and the bin can only be read through the secure =
monitor.
>>>>>=20
>>>>> Read the bin from the firmware, select the matching
>>>>> "opp-microvolt-speed<bin>" property for all CPUs, then register
>>>>> cpufreq-dt. Bins outside the known range fall back to bin 0, which
>>>>> has the highest voltages. Like sun50i-cpufreq-nvmem, the driver =
binds
>>>>> on the SoC compatible and needs no node of its own, and S4 is =
added to
>>>>> the cpufreq-dt-platdev blocklist so cpufreq-dt is only created =
after
>>>>> the bin has been applied.
>>>>>=20
>>>>> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl =
<ckoever@outlook.de>
>>>>> ---
>>>>>  MAINTAINERS                          |   1 +
>>>>>  drivers/cpufreq/Kconfig.arm          |  14 ++
>>>>>  drivers/cpufreq/Makefile             |   1 +
>>>>>  drivers/cpufreq/amlogic-cpufreq.c    | 184 =
+++++++++++++++++++++++++++
>>>>>  drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
>>>>>  5 files changed, 202 insertions(+)
>>>>>  create mode 100644 drivers/cpufreq/amlogic-cpufreq.c
>>>>=20
>>>> Is it safe to apply just this one ? I can take this via the PM tree =
then.
>>>=20
>>> I would advise to wait a little for Amlogic to chime in.
>> Sure, I wasn't going to wait for the maintainers to respond anyway.
>=20
> --=20
> Best regards,
> Chuan
>=20
>=20
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


