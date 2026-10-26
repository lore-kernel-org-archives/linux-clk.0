Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005188;
	b=dBsipOSo3PGenBo3DArueyc1XkSpjrgAFFAaxHO2aRJ+YG0rnvjdCQhlJxJOwzGmEkm6
	 LbEJDwAyj83EpUxETVakiqIwF+RvTgXkyjIMOlEp++xKzfWcH+djabxcuwtFM7zZWqDDI
	 q25xRt6MrMRhKfC34vh5AVQPuS4nCfCxAMH76jigrygJWPftc8YTmHtpdvpOeHjFNOmZq
	 uq1uOXKLQlC+ZgpKfzP5Xa7GvTuQ3mJecKluSY2KsckorEymaEbn8JYKVckdNLYg/lHnm
	 ib7DubI2oNzT8necYWcWH7y4L+RUpdKKLiBfLsWSUa0nBrf5tkEUW+kN1pmfAUXIADA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=49/7WOJdVSLVzoq5oWG2Xe+wRQoxoxRWiSnOqn8O/K4=;
	b=nKIAXfX4yvq8f9QXbXw10GzPQbaCRCm1rOC0XWjvJnZPGaCaJjw9oqLyoTIzUjgmsrLX
	 pqw2o8PXFsyfz0Hc19J+eXDTyhCBM4BWnQbjU8QtX02jEHLlooooYNeQHGgL/RM4pZR+e
	 bgiE+teIadS6rxzef5mcSzsQpWsS1coUlX1tok0HZ15dUnf9mmH1MA6kh5USRybm/1T3R
	 0hxnXaknR5z2hVibc6IwX5LcxSvmitsWzQEulkg4kOa+D5ht2NrM/RmLkvNKv7eSkvQBR
	 2DONYB2WAVClq6LAQKXHYCv4iPOpiRLRUVyt3RdSnNaDAta0tKfAoGwhOfu8zqdDOaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w0PcWQ7s;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C197F606A31D
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 08:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C197F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w0PcWQ7s
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so5433360eec.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 01:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793005187; x=1793609987; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=49/7WOJdVSLVzoq5oWG2Xe+wRQoxoxRWiSnOqn8O/K4=;
        b=w0PcWQ7s1jwKnNUWE5T/YOshA42iaUDUUhGpDVV/1vK6RT9R1FUequz5lDy708udX6
         XQ2CnxkMcFfd0QMdOLg791j212YiRJl1MqaUIm9FYOP4i82jHT14cg9eWj/f3JIHdbFw
         ozqjcvK9xbUHL8sC/Te9aw7gwRzSCJQSglC44zBUvT74xxDkm7Uahb8MTZffFSaJEk9B
         Ziz4jO9I0BbWb5DvKCz3n9NN/51UaFAuvppNPSCMbEYMLJpXoQ3CQfZA/FjpEz+yNRz8
         THOHu1MVSkPKmIcLqxws1SuWjsSkZ2CihN1soh5iSuzcYy1g9h2P1FMFfLFHXw6t9vvV
         fkzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005187; x=1793609987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=49/7WOJdVSLVzoq5oWG2Xe+wRQoxoxRWiSnOqn8O/K4=;
        b=knWyG4u3Xp8erw0Y8K7txyggdqtEK9AKS5ohpSp7ajBNeuhti997UMuRXW6lZssSOs
         Jeb4hwnEoxnsdQb/EbX+h0aVBZHIFGMk/mC6GGO6ZzGA8yYgYVS0XA5GiC40j/QdNkUS
         xh/yRPutYGtYZRV/h8cjwexKev/es84wTIsMPY8hN7ME96eUPcHLeGthJlr/3uhNNT7G
         cZF/7pKmxhQIGaWdOv6srqaooLCwWZaJq06kkoC7PTieaglRDnDr6/HOml3aGZ9gFDEs
         R/WbtzQ+UihOqchLkp6uGVZJ+9c/kLtLYs3eNZYpq402UfvOFdMBLv+Wldrj9Ch8ji3W
         NHHw==
X-Forwarded-Encrypted: i=1; AKwUvBxozy9sC1WcVBhpQS3SlTq73gQH4qty4omtMkso7Xef0O4EQgFQOiAZJZyQ/EElaSpsKcBQp0cliog=@vger.kernel.org
X-Gm-Message-State: AFq9FYIc/6AVorE9FIbHRmBCuRC3gkfHBVwT3vwUHs7PePto5HnjZnTr
	iuHYgeqXKnRNj5yvqzc0ymAPLpo9IetkGbQ0Qk+rYSZGIh03qUqxN3MjmgP70JDhHRU=
X-Gm-Gg: AYBFou2+5GwZse231SFAJldilOLuvaIos5KeBnfNM8gpk9D/OFQSOTG/qdRe+CAv9bV
	JOvYFrwxhnhLhhKhzJEFPYyPFsJtHvM3SVK0vVt2V4BEoULsc4+FisoidcrD3irzLf2YOUBW10v
	iNCPntnrawBOzYmMlj/DCDvpGsFAlyuEW9HoKO7Wg9YIYhLT55OxThO771y3rmZNCxwM7O50dZc
	FVXgwVg/QMgFBuAA2SXPmoVXn0GhCEf7dfCHtBZaOkcq8RvmhlPvIEwfwmT67Rmn4ly2BcbYnEM
	V7BwPibHybIfLmo1ePHJ1UsrptLicKPjwpc8LrmLs/WebF1zPdbeDIxNn8g26d/xF8TwPuJ97Ug
	NtBDPOyiF6H4b2ESxvM06agT/zxgkBWX17nAeHs0S1WgZBWngEFQkvAD3+89go1GQDT6EYVTEvq
	LgoGL/h4PMDaGNsGhtpvmGAkPVgf/dTelNASjdgXVAz2OJJfVovh8hIa2vi6p8wQ3nABfsTG7/1
	doKcIAhkX+K/TmvMOQ+rXr8PDGbVVrizTsV2V74Auf+rdRRycmQ0oNL+w==
X-Received: by 2002:a05:693c:6017:b0:369:21a:dcca with SMTP id 5a478bee46e88-369e848a2d5mr8835197eec.10.1793005186447;
        Mon, 26 Oct 2026 01:59:46 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a03bea5d4sm4608834eec.6.2026.10.26.01.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:59:44 -0700 (PDT)
Date: Mon, 26 Oct 2026 14:29:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org,
	sboyd@kernel.org, bmasney+clk@redhat.com, khilman@baylibre.com,
	martin.blumenstingl@googlemail.com, rafael@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
Message-ID: <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>

On 26-10-26, 09:57, Jerome Brunet wrote:
> On lun. 26 oct. 2026 at 11:00, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> 
> > On 25-10-26, 20:22, christian.koever-draxl@student.uibk.ac.at wrote:
> >> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> >> 
> >> Every S4 speed bin runs the same CPU frequencies but needs its own
> >> voltage curve, and the bin can only be read through the secure monitor.
> >> 
> >> Read the bin from the firmware, select the matching
> >> "opp-microvolt-speed<bin>" property for all CPUs, then register
> >> cpufreq-dt. Bins outside the known range fall back to bin 0, which
> >> has the highest voltages. Like sun50i-cpufreq-nvmem, the driver binds
> >> on the SoC compatible and needs no node of its own, and S4 is added to
> >> the cpufreq-dt-platdev blocklist so cpufreq-dt is only created after
> >> the bin has been applied.
> >> 
> >> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> >> ---
> >>  MAINTAINERS                          |   1 +
> >>  drivers/cpufreq/Kconfig.arm          |  14 ++
> >>  drivers/cpufreq/Makefile             |   1 +
> >>  drivers/cpufreq/amlogic-cpufreq.c    | 184 +++++++++++++++++++++++++++
> >>  drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
> >>  5 files changed, 202 insertions(+)
> >>  create mode 100644 drivers/cpufreq/amlogic-cpufreq.c
> >
> > Is it safe to apply just this one ? I can take this via the PM tree then.
> 
> I would advise to wait a little for Amlogic to chime in.

Sure, I wasn't going to wait for the maintainers to respond anyway.

-- 
viresh
