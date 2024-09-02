Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D551D3658
	for <linux-clk@vger.kernel.org>; Mon,  2 Sep 2024 09:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725270813; cv=none; b=K0XH550vuD2CPDYcsMvARoyLTsn7UVhXx6yY4XaPHQomjjG3osMK6UQa9+msjGmKBHo8yBzcKhM/UMSrchfUMmwPsXB73Iid14b1opYS1itVAmn645hlarcmOs/pusizjgka4p+vGTDDdZfWkT4s+KcSmfk8HNxahrslsYLfc8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725270813; c=relaxed/simple;
	bh=H8i8ekLgn7mMzXvjHDwxzcGucNAxDGS/vjF5gwmh2qw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bWvNmnq7dHSTxTRZ4QdMd5TJ2PgZYOcTHBSb59ODPXfVo16n8oY4VyQsDrkCSWsJJrfaeqemZSJgOE31tA8HpekSEJQ/xkyE/Jnu/jOu8m39yOORonhzewHKTyyB30WrIuzTrmhMqmlvPeRSVtcFToCwS6eZQNJEwyKFcFSz/9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2I/ab+BM; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2I/ab+BM"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-374c1120a32so1055361f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Sep 2024 02:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725270809; x=1725875609; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ap1TFjvG1Ip3qZtO+pSCOcSztVaGL1F8QNxcVrxFmH8=;
        b=2I/ab+BM4Bx1utUzaaYoF+o2v2aosISuEqPcAAllJQs8yQa30xfaMNbLLTNnA5yB3/
         UFt/CHo3KkAEG4RA83dvBJIKwpyxxrjCp+k1y5STEOTQ3sfc9CZIUtjm5nvGrRkc7bzZ
         fcrBVJzfFYnxtuvUVle1p2s1gxUndglFb2IGuPCZj75s/UnttRYYDzHr8+cCtcCPx2x0
         /45axP9hsmlsjK4XAdrLD6KWYFh+fPuBzxM1cEtY8/0321/0jMvGj9fan219LETbkCKk
         +ml+3JBbVE3eJKUI5qfNRFRjxUbR24NtPu4vE9DxHpWYDtNhzVZZtSIK3RXAqpCYwMAs
         8A5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725270809; x=1725875609;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ap1TFjvG1Ip3qZtO+pSCOcSztVaGL1F8QNxcVrxFmH8=;
        b=mmignDTyDdqEjSG77FOChejHAZCagip8KIgD5Zaiy5w4X1WueMPcEhmW2vTzMnIvDs
         W0IuD14HQYXG4xiekQEVF4ii+nmRo2AyX4vmUC9Jfi7oMJ0rjy3RVfbMIDkLbSQ7CTcH
         8/p1D/EuaFugKgX482W2CkpngeGHxybF+KGWm4xbVu2MGWvyfggxpPjN7fTx/dffDbW2
         v1oM7CSTjehsaNRvPAlX7qjYEpUgElNHm3vu3t3ltAqHI3IQf/5lZ/iEp1d2k4RAnQIB
         LgdrCYKKAARqEvcMSs/UB9q3yS4M1dnFqVNdTopZwGV7CZQ9a0PsSV4Xbh4ouxGcn+Q8
         AxCg==
X-Forwarded-Encrypted: i=1; AJvYcCVcWAWYAa8eDt3NZGDrXkqTUj/fCAoBvIPTA3Y97TzzafyPzGi3SHYwkWOUVSeIIdzC+YbOT3jKD1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUqCnCglSfUpAbVvKkWpqgvBoaLhzqEzUg8P61BRsvZYxN+R2a
	S5wvF0viGwmLp8SB75AoVCFQs+O7cJkqW4uuranlfd1/9fgWN7/M1BFAtFCFvZY=
X-Google-Smtp-Source: AGHT+IEBNwIDeLBGu5sJyen1fHV8CZ+NfcZkdnYwyDXfXu0Okz+GmfMqYb27o4OdqdSGbmDR+fVhEQ==
X-Received: by 2002:adf:f206:0:b0:366:eade:bfbb with SMTP id ffacd0b85a97d-374bcfe5bd4mr4272968f8f.46.1725270808862;
        Mon, 02 Sep 2024 02:53:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a2ea:8e6e:d881:76ec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c5ae48e4sm4162458f8f.90.2024.09.02.02.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 02:53:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Stephen Boyd
 <sboyd@kernel.org>,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 8/9] reset: amlogic: split the device core and
 platform probe
In-Reply-To: <34bc2d1ceef7bcab3d9b78de588e996c2d2ecdd3.camel@pengutronix.de>
	(Philipp Zabel's message of "Mon, 02 Sep 2024 11:47:34 +0200")
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
	<20240808102742.4095904-9-jbrunet@baylibre.com>
	<812c6ddc-1929-46c4-bac7-4bd0f5ccc213@linaro.org>
	<1jsev0wj8y.fsf@starbuckisacylon.baylibre.com>
	<34bc2d1ceef7bcab3d9b78de588e996c2d2ecdd3.camel@pengutronix.de>
Date: Mon, 02 Sep 2024 11:53:27 +0200
Message-ID: <1jbk16s7oo.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 02 Sep 2024 at 11:47, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> On Mo, 2024-08-19 at 18:49 +0200, Jerome Brunet wrote:
>> On Mon 19 Aug 2024 at 18:33, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>> 
>> > On 08/08/2024 12:27, Jerome Brunet wrote:
>> > > To prepare the addition of the auxiliary device support, split
>> > > out the device core function from the probe of the platform device.
>> > > The device core function will be common to both the platform and
>> > > auxiliary
>> > > driver.
>> > > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> > > ---
>> > >   drivers/reset/amlogic/Kconfig                 |  10 +-
>> > >   drivers/reset/amlogic/Makefile                |   3 +-
>> > >   .../{reset-meson.c => reset-meson-core.c}     | 101 +++---------------
>> > >   drivers/reset/amlogic/reset-meson-pltf.c      |  92 ++++++++++++++++
>> > 
>> > Are we still in 1983 ?
>> 
>> I don't quite get that remark or how it is helping the review.
>>
>> > please use reset-meson-platform and drop pltf completely
>> 
>> You are requesting auxiliary -> aux on the patch.
>> So which one will it be ?
>
> I would prefer to drop the -pltf suffix completely and also to drop the
> "reset driver" -> "reset platform driver" documentation changes.

Hi Philipp,

I'm not sure what you mean with the last documentation bit ? Could you add some
details, I'd like to get the next version right.

Thanks 

>
> regards
> Philipp

-- 
Jerome
