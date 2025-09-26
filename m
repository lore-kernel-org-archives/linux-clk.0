Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131392F1FC8
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 10:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758883027; cv=none; b=DaFtFpLlRRBJQ1rrHY1y+HpJmOvet+FxkDuO8k96P/lizWrhggMPjf2VJTrQ8lsl4rn7+1m3IUdp9lKhIwCzTGw0og7L0zVR+KiLFGy68US04fZjst/EK7SlolCz+rQ7i3eDIFQIGc3Z3qWFtMB8Mks7YM96NYuLi/iLbXx2ybY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758883027; c=relaxed/simple;
	bh=Va6LLCpRnTdKhloYRugWy3oG9U2CH0f4kpjUlj1eh/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MgWYAc2j1yrVW/9jDifwQAmjbt+O29c0k004jGz3GKMUQ7l0RfjLIdMbSfOBHiIlzQblsDXL7fW5SibAeezjmlw4J141H/5e4bh48un6HkXFRt1alwThsKWZb8g2PUeflFXwN2GtnmVt3xQJlquXmBNwjHX0z6nO0jMsyz2tsWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=oDWdEYQ/; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="oDWdEYQ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1758883009; x=1759487809; i=wahrenst@gmx.net;
	bh=WNkD1K2RBkYayp44h1XfQoipSL3WE30xESe/2y5Vgrg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=oDWdEYQ/1UPJoIhl/vVEcLvcfPLHC/CbkOCX1I0PKfVZshT0sn8CQEVuBaYd0WS9
	 IpYXFjAVQXkkzqpN/93PPuVXVOfF1Lncm6QHfoq82E3B1Qw9driaZud5cSGNY2PoO
	 /R/G6PldwTuRcx8ej07xRxvaOJ/OAdICnJ+MboOXTj9lMszxqJ4YLnBheOTW1zOtV
	 A6KhnEYC9lSMIUlRwSIn/C2rw1G9UdVyGYyv4yMH4h59wj4W8bVniXf1PE3+9qRq0
	 zH+rg3nQPJCFxwWeeq6Mxv4+m/6B8Pg1K+q2RNnVoLrgBrOPO75Dob1MVqcgLiSYM
	 MHuvL1Evo1wsFq6Rjw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([79.235.128.112]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCKBm-1vAJIR2JOM-006muJ; Fri, 26
 Sep 2025 12:36:49 +0200
Message-ID: <c40880aa-ce14-41bc-a32f-7f46506a8909@gmx.net>
Date: Fri, 26 Sep 2025 12:36:47 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com>
 <20250731-v3d-power-management-v2-2-032d56b01964@igalia.com>
 <CGME20250925075711eucas1p26efbb194311a6e22ab593a39b43e12c3@eucas1p2.samsung.com>
 <727aa0c8-2981-4662-adf3-69cac2da956d@samsung.com>
 <2b1537c1-93e4-4c6c-8554-a2d877759201@gmx.net>
 <1e5d1625-1326-4565-8407-71a58a91d230@samsung.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <1e5d1625-1326-4565-8407-71a58a91d230@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nL0ZPpOgppdzQn/rYUMR66FxZRClQnbA5lECjbw6n2jS0CYKXTY
 HwRe01Syrrv9ckfr114xDoSDR+BKAUAHr1SmiBhHr8zEYh0hADhnEqoAmtquNB54k53J7z3
 dCdq8gfs4q5Q+YFk42ePGiI/uX1N/NUs7g9PWTpL0+j/Kzi6PTqEU+7oHsvNnqvHBUh9NcA
 HBDZ7nZBq87ikAh9K+jBw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AuLdGDm3Tsw=;DyVr6wSQFU8wqDgtZLbZvP3Y8JG
 4je47jNC93/8lCKeOoBdybwaPy934vUb/CEcOZvEAihDUVWNaQz1zhqDWOEEH2FbGjXYdnYKJ
 JR62ATRYFie9p+AWdI7T4kbf8u3sNn6VbkBSb5SumWaW4s2TIF1cO3wEO7TeeiwmAkBQvAwts
 3z4yRtYuiU2D2mIlEmAlY1qToNjMAIfHCsn5EBSvVdVT57aItoSUiYI4I7IbnhM98kEerl03w
 DKBmjjDsx0bfZ/bfaNY9awAdj9cPlqNbjMfcZdRNNOGGMpuC+zTGhbIWi7UL6vOPBGmWGkauQ
 uRObqq4t9ylbdcsGMqncRZPlpm4P8EpUm0UE/vg7IEYjPP+xupxs7GzflnBls8DpGN1GFlg3F
 wDjED+77Z5kTN9QT3vx3sYSqmPIr0MbQUjd2Fw4LHakR5rU2l2kyk2P7fZ1eR2r/RyODGMEOX
 ajQeJZxbyeVS4nhYF/yhJWKmOLgifu2BQpWr+9xjMBbYPtIwud8A4Dk4y9gRAWKSjxoOVA90x
 UgQ98Xx2ewufcxhuRDiqIjnBwj3jdg026ZC7We2Mf0OjkBrWm8MdYMUfrJgBRok2cBJ717NDe
 72vSQAC5EvZ/SGMNBYguSVV1YShfd7/yf3yEQtpNk/JrmePmI8LlsVd2QCSSVMVCjhKKrRW2L
 iD3WWaBvqJwILFxVL5dHNzgRoo6UMESVTQbEM50S0R8mf7B4Wl0I9zKNkyT+KmDLweQBYBvqD
 gyipYDrTzmYQQgv2HZU/BodZiCzoZPQIUD+/3zu1iAPZBRAwJzDgvI8mfRXlRXr8iamQZeQOZ
 8sQSaQ7AgBnWU/Mj4SSO9TWevrqk4qFj0DZWQXVV8AFoBBbO1qJPSV5U3kZB5jBc426i9XXnk
 GTMQ5EGIZQmvJgjrvzj9k8LXjmDGj4pRmPBgzDmh98NGIlDSAYZzmrTomt76ZHSHE3UlxGL5X
 hnE+eL/uI5mBldl2vMpXx5ESLZQmtaQ2/KJJxiPaGfiXb9AlB/FWeL+K3MzCHWCVMT+y6BcrK
 0uapwWzuDpXVnEMC4F3S4iedHTptHlK2HId84MTbGvonTpaBceiX1ImmnMyKN/09uULah4a12
 XJp5eHZxxCEROKgnjfUC1T9FaBgRxySH4GK+EaEqULvmqmrYUsnb/192DqVPMjqH/leym9kpr
 Ujy5gBGomcvzSrJl/gk8+26r7fXo0EjT7mzENXnGMpQ2rkaoZVfwHoB8zYGeME/Sq1fa7SFrU
 qaDWJHHImy8zD8liWRJ975HxbSfjDLO7VuBpxRiNS/HOdUTwP2ANcocAFAUbZ39QP+nNXF1tx
 GHVyWHcdHHn98bFyuuCGiY3+5hvcetdAwoS+MikRG8ipHSzX73Z0jNd8LP/9X5Jd8H2LPs01N
 64ow04P00t6Zty0DrMqaL4hVjEnkVLnNvhnPUr/sG+ITraIflar1iHT9BBqDuHLpYj03bpgRj
 +N9q+Boy5aHGmZ3cVY36iPir2Wtq36Ly7xcJ0iIfQGYBnrIXZayVyz0iFI3n+v9gyli1mEwBI
 4GozZBYtxJSwIF7nsJHQA1I9cTU1NWHrK9NDNa+/DTvxQ/ppBuwJR6UECa1vCahGK269gRGVb
 6EIUJscRp7F/xJyfTJp20Ky7ozyVL2Gpb5gNyYKXuft8YElesr5nRPVZB21xMIHw2Z7zw3DO1
 PDReb7qtvPak7+N3Th/GQgfW44UFsK99MutTeDoRoVd28XGipnsXqU9AsXQbvWhkWMeGc/L7+
 IXgJzyYLxziYToi2Vl1SGvUzJkm3uXeW3qRRT8khyIjGDsHMDN+1eJgvrQiQPp3cOWaaEqiU9
 eayPRX1BfngvRn1AOyaSbrLXMYvLyLa1MMj58Ios3E1bdryl3ieKcigW1wd1jkH7HgoU/QAhU
 y9us6ET13aXOir7IT6VOls4nSWzQy4H4eyNBDK1U8Rmqc7HLByU7wRZRti0K9ApAyr1/ILQRi
 wSsby8ybbTONiDWRlOViuXIv5lxJgIApiFjB55r72CyE+BesnLSqVFs5ClbHO0npJWHsQAAcb
 b+c80ET/tLqFeYZDCWkpEGi4j+H7TXhF4Nx7rUmRTmpZvT6szZf/YWukAU8HCNb61tUfVk/qs
 7dzqzSoBMBYmqPR1YeZ8eMdN1AY3KBC14Uk8y7+7uM3G0DRQqaUe0MbXfrKhHrCEkU51N2tI+
 uvZn/AZAV8gIAvT+UU38yIIomiA8TslCM7eyyWiUjtmRG6sQ2LMOYrI9F8O7XNw4wV8H1nfy2
 D4KevrVKszyEJfMpDEixa4PsFrjMu9kwp4f0xHNsANrNRgpj+ZRMuzdEPx3LrHTtPqS0iQ9in
 GI9J2xjR14ZFjZR6R1U+UdAeGwPm1/doy8yjK3LMojA/5qSlzls/gYKOPN7NpCKUyy/P3JIBT
 BVbI/Ypf1JcwqQsG43LHQUvuEBajtOf2MdeUqDoxXt/3BnaXpeMBfxJXxUPEvEfqZlSiZjBis
 Wql4PVPq/Ji6P4J8B84GRauOfxHwGme/Whuf+UCXgDYSvd51BLrDuoMUZI+rkHCD92YObZ0Yz
 Q9n6PUnlGClxYym07CUxfugS2z2v++y4GTsgZ5q1Saat3Cnou7TR35fRvxGCc8OQIxaSj+L/3
 T7f05bvS/2BAC7OoSqKVq0XH6Y0/uUx0PXfWzk4mbqp3TRY4j6CMXKnOgt50/uB/HawYvYntU
 MqRN0mIbkqdQNACGyMgHKhtTT3iToB+03upfmpbUKpZBT39mmkkDr0HRHeNlEbkSdGy0dZJso
 hm33vSV6Wi4ca5oGJUGE9y1CIgV7PdEKkgkijj9P0f89YF8tXrlqCmwkz+F/O6LyeAiv+UMS6
 q8i7oGQ+P+ZIAncQ4GVySBVBpGoDEArN/9fMoC1m1EAl4O0xZ+cNIsAdMlFey/dJ2bHFKq2OK
 xq4fkOHzX7Xvqzxrh7lfG1s+0Lg/jbChm2Jv6ocPM3/KnDH/Xxy/OLXP9ovc93i+uI9FY+W+Y
 PUAxVwvnS+Mnm8IpAeNxjoPM0/ELGu1ymkb8CLLiGOr/0mjo1zkhthvEQaYrua2hv/ibYz4jF
 p+jsNUcPUY0IdUJKx1LpBUbDVwsMnzk0VFjrDQ316ZC/8bK4U0GajFEuIKdlNtSF59RHdLhCz
 lHJS0dkIQ9HhqDNThd9hGa1IHmZuJ7iS37qlEBv9xiyatMbVa+2I1hxAfmoBCQyjtP5kx3ybU
 lCDHkU8IMoSSHvP3tyNQzIKlmZ5/+SihgopWlScaVyPV2RGuHI6gbhEgAmHna/L9ecl5YisZ+
 V1BE39mVgauMl/HEsUMC48BqbEblVPzDcmDLeq/ZIBdDyDAUojrIi7ghdTdRKmzm+O4MIJmxu
 WpB5bBr4jpVYqSrxGqqVPT3PfPMlMfxqP75lbQNOmaXbF9zyst3o2EXOTLHmo7BwHwAzSVzyi
 CDqVWavyVKFEBSgDT4VGuZ1BFphQn9lMQxvQbtoSQS+4cYNAPw1GQVgPlfayYAtmE+ZwuG8ul
 0FL0z0fIwCJ5uncfMTrZ4+HbwGRwXXj3Qv0khTlyzBfr4SsE9vZoXMYPfA08h19yqV/AUEwa2
 ApEUGufdSoMxKgL7p24xe7VZuayg4BPLQDJ617obwCYrpcCAQEP8wRg161wfnBJyMKYDyhvYY
 Uen2J8YedbW+dTeCJtPgXzud7AzB3pSRIBqKtYoVDJy2ObZD7BDLDqwuYiqInj/SMXpi/c3EV
 JbiuMNl4NmWDFFYM1hG5EWDLgpWXWRCw7VaqrnfqZytwMsVmOhHqgezeTBppK9aHGZjQSxNm8
 CYlpiFNBdp/moVYD0ji92r6lnlSYKJD0J/Si5chAWUykx56UR8nGt0HRSaWUX9K3Py1CQNRE5
 fKo3xJe9ZYS2qlFKv0q3rHiKwuIghrXhQ4MQE/gn8TU3zxswllXfgIGOJHKvEZU1FvwLjAFJm
 pWfYIjypIsFSulNWZ76bhdhzQ7Q5m4pZVe+0mkinqiIFPq0pSFuL12OB4vu6rWnhXLmGfWGgO
 p3h5/ElRUp/XLG9JUAv2fu2E3mKyUldAkGsEXUVq2uWRptsWiQndzVR1JkRYwe9lrq/2HdbsL
 Sw61KEUUSBpK8z6Jlx9EoOVuHSKwf6OZgErh9Z2XFWpULbUQqsng1jRHhOOYn0dngQFgyza/u
 6bK8Tq5bxnmnToJzORTcuBRRkRAGFGuSgOcZ1IpiI3UQrDNz5Xr9EhFjxtTQjC8x02SbJ0BEJ
 A1XemfT4+bfpYaZ3QTqaZBt7Uuliik3SCivuE7KpbBZjm3dJ0wPSnWd3EBqoOtNzhDd1x9DvB
 6BLxGZahS5lmeAtlmCc0s0LY1aEG9cwBP13EW73H+YT1w8qofbhsJvyXntJHDrecLuFmNnUfz
 VkjEV4TSP61EAgu2oZoPKvAMMcwf/b06y9wVAzZItXFRcl1mCKqoL6UZ7suDS9PuZigzQiqWg
 ISUV1aBpF5iY+TGqBLRmitR6prVRvdPyIRTkZPu4MQqpHUZAVEMVnqxApIkDGHPCgeA5+Uq11
 iR9SeFcHP0rma1hMP6mNyajJkDMW0YNL+xyLwfvKRTwWZ8T16IC2bVLpcAL/LF9Q4heXlUzUc
 AyhDrvdUH37UT26Y00/tiwJBtWboBx/x7hQO42vGajfF6rqWMZoemBwI5DjhCx2Xzd3WX5HRd
 uvqeR7x6FCaGZXKefKOrLGryhBB6axIxALoQZMgDK432zYY+bJxK37ALLquXfETEPiKkiq0HE
 QARb1D1SjNC7sazSHlvctLbx100FlaF8ldUqySAMWKFTVGVvoXcVbmwVu3I6QHXfrzCq2mH6t
 orctVSCRuBmUfWtgGQH4UYBS2GBly69Oi5dLhfYnY0peGuOkiIExT/6DAEGLP1koVi5EpKiJW
 i0uWWkJYCxO33G+8PwF9e4QwdWSQnCGMHm0Pe5ksV2AGq1jj1ep9qnvHmta6AgLUO1DmCKnCa
 qz1rv9VFhi1wO6r20ahK1dDR6WTRpowq4W1Pdb1dQtg9G04bxJ2yUiMnUgIWgeSHzao2Bqn81
 V2yFmDWYgzqTnmAgOlfVDKFYQ7lVvYqBhCrwEflwx2Oao/CsSF2jERBrDWGvOJRGFrCJMBO8N
 FTbwgfcHLE/CjzVDtOTDaKf7VUEmQ4Jziht24DwmJyRTa00

Hi Marek,

Am 26.09.25 um 09:27 schrieb Marek Szyprowski:
> On 25.09.2025 18:48, Stefan Wahren wrote:
>> Am 25.09.25 um 09:57 schrieb Marek Szyprowski:
>>> On 31.07.2025 23:06, Ma=C3=ADra Canal wrote:
>>>> Currently, when we prepare or unprepare RPi's clocks, we don't actual=
ly
>>>> enable/disable the firmware clock. This means that
>>>> `clk_disable_unprepare()` doesn't actually change the clock state at
>>>> all, nor does it lowers the clock rate.
>>>>
>>>> >From the Mailbox Property Interface documentation [1], we can see th=
at
>>>> we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
>>>> off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
>>>> prepare and an unprepare hook for RPi's firmware clock.
>>>>
>>>> As now the clocks are actually turned off, some of them are now marke=
d
>>>> CLK_IS_CRITICAL, as those are required to be on during the whole syst=
em
>>>> operation.
>>>>
>>>> Link:https://github.com/raspberrypi/firmware/wiki/Mailbox-property-in=
terface
>>>> [1]
>>>> Signed-off-by: Ma=C3=ADra Canal<mcanal@igalia.com>
>>>>
>>>> ---
>>>>
>>>> About the pixel clock: currently, if we actually disable the pixel
>>>> clock during a hotplug, the system will crash. This happens in the
>>>> RPi 4.
>>>>
>>>> The crash happens after we disabled the CRTC (thus, the pixel clock),
>>>> but before the end of atomic commit tail. As vc4's pixel valve doesn'=
t
>>>> directly hold a reference to its clock =E2=80=93 we use the HDMI enco=
der to
>>>> manage the pixel clock =E2=80=93 I believe we might be disabling the =
clock
>>>> before we should.
>>>>
>>>> After this investigation, I decided to keep things as they current ar=
e:
>>>> the pixel clock is never disabled, as fixing it would go out of
>>>> the scope of this series.
>>>> ---
>>>>  =C2=A0=C2=A0 drivers/clk/bcm/clk-raspberrypi.c | 56
>>>> ++++++++++++++++++++++++++++++++++++++-
>>>>  =C2=A0=C2=A0 1 file changed, 55 insertions(+), 1 deletion(-)
>>> This patch landed recently in linux-next as commit 919d6924ae9b ("clk:
>>> bcm: rpi: Turn firmware clock on/off when preparing/unpreparing"). In =
my
>>> tests I found that it breaks booting of RaspberryPi3B+ board in ARM
>>> 32bit mode. Surprisingly the same board in ARM 64bit mode correctly
>>> boots a kernel compiled from the same source. The RPi3B+ board freezes
>>> after loading the DRM modules (kernel compiled from
>>> arm/multi_v7_defconfig):
>> thanks for spotting and bisecting this. Sorry, I only reviewed the
>> changes and didn't had the time to test any affected board.
>>
>> I was able to reproduce this issue and the following workaround avoid
>> the hang in my case:
>>
>> diff --git a/drivers/clk/bcm/clk-raspberrypi.c
>> b/drivers/clk/bcm/clk-raspberrypi.c
>> index 1a9162f0ae31..94fd4f6e2837 100644
>> --- a/drivers/clk/bcm/clk-raspberrypi.c
>> +++ b/drivers/clk/bcm/clk-raspberrypi.c
>> @@ -137,6 +137,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] =
=3D {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [RPI_FIRMWARE_V3D_CLK_ID] =
=3D {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .export =3D true,
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .maximize =3D true,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 .flags =3D CLK_IS_CRITICAL,
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [RPI_FIRMWARE_PIXEL_CLK_ID]=
 =3D {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .export =3D true,
>>
> Right, this fixes (frankly speaking 'hides') the issue. Feel free to add=
:
>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
AFAIK the offending clock change isn't in the downstream kernel, so I=20
like to see the opinion of Mar=C3=ADa and the Raspberry Pi people first.

Currently I know that in the error case the following clocks are=20
disabled during boot of Raspberry Pi 3B+:
fw-clk-vec
fw-clk-isp
fw-clk-v3d

So it's very likely that the vc4 drivers tries to access the register=20
after the these clocks has been disabled and then the system freeze. The=
=20
workaround above was just a wild guess, so currently I don't know why=20
this change avoid the freeze.

Best regards
