Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F733164BC
	for <linux-clk@vger.kernel.org>; Tue, 16 Sep 2025 14:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034518; cv=none; b=YGdRSnJTkYB9ewZNF3mL4MINGZHSvEI5RDUoEFwMJsiD3Og3dry27+CRrlXbn+U2pNpkU+sL+akscJmMypjxpAEcZoXJa/uuMBnYu8hvlj6mYbb3TbCSHJneRlHLJ6qMI1vvXqrD8BhQMYAN9SokiYGGsq/qB6amiKtvLY/fHuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034518; c=relaxed/simple;
	bh=tm0kA5/U/7lPdDiVcC4zEEqOIVnKxf9PeM+eT4gS4pA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tc08pHZpCg1rvd2S4XLk538yVXc2Ma1ExrSjD3aJ0Lu54il+afDYjY7pTFNwHxB7tUhT1NqcZrdVYdbezyS2WNSCrleYxM3XrlKggi34mcpT/8hXXx0Lr8L23f4U4tf1juFY3C3oPWmbZdKobDjQAPeApc29DPDMcwgV9PwlfPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=obZ4N0j+; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="obZ4N0j+"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-328466c2aedso4857820fac.2
        for <linux-clk@vger.kernel.org>; Tue, 16 Sep 2025 07:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758034515; x=1758639315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D5iIq7+KHCywK04RSDS9es8l3U4mIawqQHyrRZJkTg8=;
        b=obZ4N0j+eWHDyjwoNB8DM51ouON16EJd6CsPNyA1WIjfhnr1hkFuHxYKr7caIYqFzc
         w5MQvEudlutDfIHU0rk1jWT++LF7ynasoY4mJmEfy9k+zL0O2DkKCGgTHetyU92BzJK+
         zAqcPMC8pP8PQhzpEWq7koMrjpECa+KRpDtPrGXhInFDdBgDR8jQ1VdNEADeroeMRXb1
         0e2aL2sanjC4hHaTLGvXWUHJl8KHv77n30R9XXGVgNzGqciGBPPHpyfI0VZR0dhUu+aB
         uN77UjvJPFd+ZTWNN9P1ue23IB7ldgGpdciSlR3H1Eu06fsc/Ep1wahJKTC75yrhfO9r
         YdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034515; x=1758639315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D5iIq7+KHCywK04RSDS9es8l3U4mIawqQHyrRZJkTg8=;
        b=nlM7tagAcGx+iJkvmo/aylkCzliJ5r6MaITpTYDIuyPi2Vw0Z9VX68dn6Vn/99PWwg
         KT+5Qy8NPmtWt5i0NS2QGIj1h82VUezyZpYeeeCKcuZQhmcrumiOr3nNOy64TXSsrdRn
         3eYYGBt7rKANIdJlyugYaDtXNryB5Vx/phQyFFq2pW5WDMQqdEcOU4hac/bTC9zeQm1U
         XYUIRSPCOjxvCXTaGQb/VCGMWeCyhzI9yoiRCMhyWSV/DNXt2VqMahfLgO6UQZAVY/hx
         oOEzD0dFXt8ppVjEg6hTmacLz5985aVRioIcv5qS2iSLx+ZnrzY48Qm8FlJIE7B1/5aw
         WjpA==
X-Forwarded-Encrypted: i=1; AJvYcCUBMnZ6/XFqL7SCPrpUhtMtyxhqPpDXics9uuooA2679sHpWFtvEpamF4RUPiElWv6cgIM/GGutuP4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza5O7gZ9N92Zg3BwhQ+NLJysaxsLCnT9Z8Anh11KcRLC0IWq2q
	vzTmyKkoIJmBrDhBwRhejxMFIWzdaD3ExN5JdrDPIxplru5Emor6+CzqxTa24vNSZYk=
X-Gm-Gg: ASbGnctEnaOTz1DTAFbl5+bC9xlgV4zjk7tnKdtFrRxRBMJ3CeNd2kJUcRLc0/PCUUB
	2pA2qmudaE+B9ntlI3Erd15Y3FtABvb9terPj73m5TnpMn2+tRUUQxhMspIqKhkGkeZDnP3/WTE
	vq6B8g5lsbBQGJ2D0FzySt4/JvOCVMwc3UKJ8DerFxQ9aoKDvqwyMN/TC5+l+XVmcKgi6+b0K5l
	+0kzhWVxpnyOQTctQxVwBdwstjMfpeXbtCQnEQBs58ZTp40oJxy3DkATkhB9gWpS8Z0G6RBCtnV
	C/kImewAB5Bqaz3TPr0chwi9B9M2ZWtyUYnlOQwhXrfmq5B9KDEkCdW2ijZcALUjDkXf+nX5GR9
	VXUx+egtVeya+CEPuMrfrafrmOKPx4m7HZ1yhGFGgiCtBPrj2KFBx2irEx7BGh7fRpOONgpRsk2
	w=
X-Google-Smtp-Source: AGHT+IG2j6o5ZiECUky0T/Yvf86ZO9qsIYrDXwjsYiIUbY9fkQXrpUngcoYlXLsDg0lSeAlhfx8Log==
X-Received: by 2002:a05:6870:de12:b0:31d:6e43:8d3a with SMTP id 586e51a60fabf-32e54e80af9mr7157585fac.18.1758034515240;
        Tue, 16 Sep 2025 07:55:15 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:70a1:e065:6248:ef8b? ([2600:8803:e7e4:1d00:70a1:e065:6248:ef8b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-33204689b2fsm2368205fac.6.2025.09.16.07.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 07:55:14 -0700 (PDT)
Message-ID: <711b5e34-3534-440c-8914-ddb41987ee8d@baylibre.com>
Date: Tue, 16 Sep 2025 09:55:13 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] include: linux: move adi-axi-common.h out of fpga
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1_via_B4_Relay?=
 <devnull+nuno.sa.analog.com@kernel.org>, dmaengine@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-fpga@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org, nuno.sa@analog.com,
 Michael Turquette <mturquette@baylibre.com>, Moritz Fischer
 <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, Vinod Koul <vkoul@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Trevor Gamblin <tgamblin@baylibre.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>,
 Xu Yilun <yilun.xu@linux.intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20250519-dev-axi-clkgen-limits-v6-0-bc4b3b61d1d4@analog.com>
 <20250519-dev-axi-clkgen-limits-v6-3-bc4b3b61d1d4@analog.com>
 <175133153648.4372.1727886846407026331@lazor>
 <202509161304166bf210e2@mail.local>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <202509161304166bf210e2@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/16/25 8:04 AM, Alexandre Belloni wrote:
> Hi Stephen,
> 
> On 30/06/2025 17:58:56-0700, Stephen Boyd wrote:
>> Quoting Nuno Sá via B4 Relay (2025-05-19 08:41:08)
>>> From: Nuno Sá <nuno.sa@analog.com>
>>>
>>> The adi-axi-common.h header has some common defines used in various ADI
>>> IPs. However they are not specific for any fpga manager so it's
>>> questionable for the header to live under include/linux/fpga. Hence
>>> let's just move one directory up and update all users.
>>>
>>> Suggested-by: Xu Yilun <yilun.xu@linux.intel.com>
>>> Acked-by: Xu Yilun <yilun.xu@intel.com>
>>> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> # for IIO
>>> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
>>> ---
>>
>> Applied to clk-next
> 
> Do you mind providing an immutable branch for this as my i3c tree is
> introducing a new driver using this header and so it is going to depend
> on your branch.
> 
> Thanks!
> 

This was merged into mainline in v6.17-rc1, so I don't think we should
need an immutable branch at this point.

If you are modifying the include/linux/adi-axi-common.h file in the I3C
tree, FYI there are some changes in the SPI tree that just got applied [1].
But if you just need the header in the new location, it should already
be there since v6.17-rc1.


[1]: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?id=67a529b7d3c50a56c162476509361f4fe11350dd

