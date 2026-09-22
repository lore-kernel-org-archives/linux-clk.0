Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BC64E80D8
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 21:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790110938; cv=none; b=jlxo0vtSODsJZJCIVtxJaVNIJZoZIXvZpq5z3f+DdfelWGrKSgvOTtEQwbZYphg3xS1x+5yV7fu422LfL5QVuNGQuJ/RGvF3/S/yX64HVaLv7jzlqnAjlHDFhGaeMcEnE6zE9MULd0LmCiJCmuyzbhmwE7MdQTdHOBL5XDT4JTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790110938; c=relaxed/simple;
	bh=mUiTpuXZ08jRjcCjuhENhAkI/h8z83dpTQbKz9it2Yg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=rk2DSH+4R6hXDfWWtCF6r3zoXTWAfWnQOu/j+1/iBEOoWb0tGPBHQyOQCaoEj7qjbkz2Bc/MfLzDv4laH7gw8pyhIgEeHDftwSSoKgEd+ma87hHnS/RhJq76aoTPaNLj2u+4vGOYjSynPFSzb2GtyVQ9nYSf/U251jQMsCTpyIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Xz3QqWbe; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Xz3QqWbe"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcbe20aso2786666d6.2
        for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 14:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790110930; x=1790715730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b9Tj2oRUZivsRV4DF4owfEOUU+s6qPBlsbxiJLCQngg=;
        b=Xz3QqWbeNe6T5XRZz5L3+ChBpuAe4QPy1Y7mRbru5/87Cowhbal5ABl6u9iE2l4eQ1
         TERdKW/fX4uCs4gZiVPwynPb23FRQYsBNj4CR5aFLLDYlKY4M3Ir9uhjDfsWygU7s5Ww
         HyvmXKfYHhu+gwetWtM7Q+Kuw3YVA3QgGhHoJXqupjIUePjx7LhiGMDtPhatKgwHLBuR
         /7YOGD3GWNNj01hLOQhodylUG4ITUQ+KcNwlGjtGpdSZ+czxVMiZLdDKSOXmGQqPATQ9
         Tu59Wo3o73/oS7jmXsm8quAeT+Tbt3jir2usiSjE27Fss38BKaM8kC/77bYr4GFs4mzq
         XnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790110930; x=1790715730;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b9Tj2oRUZivsRV4DF4owfEOUU+s6qPBlsbxiJLCQngg=;
        b=RgxAIp+jgl4VBn+5iLvPAyBUY4o/prFrh/9PKDRrhfOO04aXs32P79wL/ir0Ayj/dg
         aR7cRbvlMWg2PXSMy8FfoAX8nLrAd/IUcJl28nj4T2JpOFxN5nsyPm/K+bUML4PlSFkD
         wP80UqH2JcThVozaS2PP6uUBO23V4SeBDNmprVVado6+1PLRugQtEetQ92Ao0ebj/xM9
         uApe1o9KqrgBOt4gys0YUfbDsN4Q1g8frzH4UvqgXMClJIaNxDmgrGexDW4nnyZfxN5h
         PEk+V5hoPSDIMXGNfwwWeKbt1HfrHEw2iES/p1IWrqUsDVzE6P10T8BdA69dYQ+41hjk
         Bsfg==
X-Forwarded-Encrypted: i=1; AKwUvBwQG71dQmvcuUQk0DnA4qXYHZecwtOI3sjXuPRWmdRHI0uJt9gbDk2H2PRW6Dxs4a5pV3Yx/SXPDFI=@vger.kernel.org
X-Gm-Message-State: AFuF++kpViF5nifGl5G7rWp/23GOIzp5VoJBNX6745ZQFh8zyKvCRB2Q
	MzB8ZJGYbSj0Jl86yjeJR5sXGnwzxPBoxtkHZxIeGbvgRoyn+LEtG55f+ouAtWSsZ+U+cLop6gY
	ufDJ4uT8=
X-Gm-Gg: AYBFou2S1KQZs2I3UyzOE5iw720KL1ePHsrL3K6BmBOOT/5b1I+QUMPntZeDcltLRzk
	SFXDYvCmtJeNau7frLPqXZRsX8B/ywPe09Ifq8pbL7wdyxGRtKNZZcyPnga8ivrrLB+/4ETbqWn
	bPFHS5fouLsBvgobiTnP5JZcALSHIR0mNCd5DCn/IrM++TlOWwVz0s7n3UAY2ipjunsr7aCZXvm
	E/Rnd7eVJJpPOham0Kjmg6JPHz+2hRtO+kSjEcafp/OazENI/HVSuAICLTvEnzlBjadwiYVdJhr
	cjSsb9TvObmj4suLxoJzK5TUwBKhP8DGPMAHtx2tHoIOw9INT1179zfOhQVyeeRG+SeDhY4C3SZ
	9ngMWhNrIGWFuk4QpXJ5qGmSsGFbMy3AS0P5cR2Fg7i0TE/JULFqwFJmcciO5CNqFGimPxZKxhn
	Ae1lCIfe3RtaSoDTofcdj7toV2FYSZyCEWPvu9vi1cvE1yYEjovuCtp6zfmgfjZrpTlSC0Od0=
X-Received: by 2002:a05:620a:2682:b0:93c:2419:37d6 with SMTP id af79cd13be357-93c252555e7mr100858985a.66.1790110929661;
        Tue, 22 Sep 2026 14:02:09 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c24822e3asm69157885a.16.2026.09.22.14.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 14:02:09 -0700 (PDT)
Message-ID: <7e32063f-f1a4-4259-96c9-fcbdd25c7f2f@riscstar.com>
Date: Tue, 22 Sep 2026 16:02:07 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mfd: introduce the TC9564 config syscon
From: Alex Elder <elder@riscstar.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
 kees@kernel.org, gustavoars@kernel.org, p.zabel@pengutronix.de,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, mfd@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260918165234.687224-1-elder@riscstar.com>
 <20260918165234.687224-2-elder@riscstar.com>
 <20260920-fiery-fanatic-manticore-6abf0a@quoll>
 <85b0e7de-e4a8-4e08-b801-a9664d366e1a@riscstar.com>
Content-Language: en-US
In-Reply-To: <85b0e7de-e4a8-4e08-b801-a9664d366e1a@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 4:46 PM, Alex Elder wrote:
>> I also have doubts that this is needed - I see no updates to the misc
>> binding, which would be referencing it. But then another point would be,
>> that you do not need separate child node, which has no properties.

Krzysztof, I've done some additional work on this based on
your feedback.

I think you are correct that there is no need to define
this as a special syscon with its own compatible string.

Instead, I can simply define a simple syscon with a label:

         tc9564_config_syscon0: syscon@0 {
                 compatible = "syscon";
                 reg = <0x0 0x2000>;
         };

And then have the devices that need to use it, refer to
its label using a phandle:

         tc9564_clock0: clock@1004 {
                 compatible = "toshiba,tc9564-clock";
                 toshiba,config-syscon = <&tc9564_config_syscon0>;
                 #clock-cells = <1>;
                 #reset-cells = <1>;
         };

         tc9564_emac0: ethernet@40000 {
                 compatible = "toshiba,tc9564-xgmac";
                 reg = <0x40000 0x8000>;
                 toshiba,config-syscon = <&tc9564_config_syscon0 0x1070>;
		. . .
	};

         tc9564_emac1: ethernet@48000 {
                 compatible = "toshiba,tc9564-xgmac";
                 reg = <0x48000 0x8000>;
                 toshiba,config-syscon = <&tc9564_config_syscon0 0x1074>;
		. . .
	};

That simplifies things a bit, and requires no devicetree binding.

If you think this is incorrect, please let me know, otherwise it
is the direction I plan to go with the next version of this
series.

Thank you again for your review.

					-Alex
