Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795266035;
	b=l+Jf9TfBRGv3/1ABKvMDoto2WuwTvfOwPLsxG4eRdzRJAJjgkz865If6PAMhuLp1tn8g
	 JarDZUTpdZX43XEyjX/hG29OBPftXt4VvsraF5C3d9u8zZE80M8AzItsfX/sieBeOPiF9
	 Ya9R1jXmA3ism0IuMTVIwHM2E87n19m/2GT6fVIFlcLOmOsQJk0OuNyvjupEpz/3rrNJ3
	 4yhe+eOjHv6xqWmBSto1WerW9y6JyPYkOLoM9X7oGjf7Vd+wH3mUcR/uxQSa5OhM/fh02
	 BJ37hW9QYHmilbPSEnmgzKqYCnWLsoGtiJJSs8D1Y2SO2DUNFnrOmfkCVtg5h03rmrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NXIuNB3ZQ4GT/Hz3ry1FYljBSts0wnPjJe/0CXC9B/Q=;
	b=jjJ9Z4bplaZr/Kg6AKFYfhLMYv98OFB7E9AsNKKKRmzTP8xjNunOgTtMRVAlmLbbi46S
	 sK2Wrmca7QjhD1AhIhsGsylPUXs7BUFaM3zkSlXqRCMdXItR+LFbQC4mv4MNp8YJWd54g
	 rCAEiDBqh/qWGwuJ0wXtYZESZF5RIkZ5lDhN9+1uwL7L4Mww3QYMy+KolaMjY3GIMK3Eq
	 nuzybwIAsr0tebrIEpXxkJqNT6L1tdWgwQQ37SEH+rer1GRuXkAdMtI9ZEvHgnwZuHPh9
	 AMcFkDfuK0/vLdXG1A3j2d16/gTrmDqupGDGm1MxNN91LOo+x9VrH3IPZejVJyYVoIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RNtRAbmQ;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B484606A334
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 13:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B484606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RNtRAbmQ
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9496577d4c4so211391385a.1
        for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 05:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795266034; x=1795870834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NXIuNB3ZQ4GT/Hz3ry1FYljBSts0wnPjJe/0CXC9B/Q=;
        b=RNtRAbmQYXLSiaEjtX2aUWytq3ybkP6vzvMM/GYzBbb22sqY7OMQwI+6PVQp9DHcAr
         lhyzXBhfLKqVcuJ8sVYNtP2aRDK4nll7J9DPE5KKQ2CAiVa+LkTWYungYQISMsCYyeh8
         hpGt4X4Nli6qalkIo2q0QmQpZOhYwDWO5tabVR1HVgZiiW3bleQnCJNRgfq3ll0kyepq
         3gsRAOgqgRVcju81U/9by/AXAbdfkcF2NzQSoJbhod4BZL71XZp0atz6aRPfoC9lunEa
         hlKhShuYNK3XPf/2DcuSXs5DhYd1yfNh3h4hIJmP4ba3ACaEg6LShMxd5328jY0CMk/1
         hndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795266034; x=1795870834;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXIuNB3ZQ4GT/Hz3ry1FYljBSts0wnPjJe/0CXC9B/Q=;
        b=oMLswhWpXW8BcQ3j7hDJsJ3RMnjAHHx8itoP0n5por4ezGjMSDcJpsllmt/TUIR5df
         PsEJGZZCoTKzXoidIc1tFkJcU7gMKx2SkMxW09VqPP+dTy2BRAbQI+KAcDutS2AbbyT6
         Sk4qOQMhJJtnjpbtwvc9lZRC/CDNsRnRAgczEy7Rt+WDdPNi4nN2iN+A7uPP1tRQ0mW2
         DJRJqVPVwirF6sQYSfb6BmuubrKySQDRHag6qhrCjtCFdo8MpUgDLroyj4LqqIikwKkC
         z3TwIMfqpAWa/MajlsS43F4R2hfsMSOq4ONedd9EFoRwluaLgZjcCxGQr2XMOzGmwt2W
         fD5g==
X-Forwarded-Encrypted: i=1; AL+hErHDISSbu9sj656NidpiRozuiNvadALcCe7Ffogbd5HJ9JFjzxTG3zm5z584tRuzhVE3e3eU/TbUUWw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wtFohCzYC76sV5aP74kR2Urmup+asipi2PHijdEYoMgq7ZS7c
	ZGn+h9FwrNv/bTvPFe9G9K6uBuh+qejvIpYlULX+r/dqW5zqCxliVit4I9iEuj8BMdA=
X-Gm-Gg: AZFdTZfPe4p0CYvoIO+FmXkibHrBqWRZZdofTCrmIvxj3Sva5REaED0jfsGU05iwKZO
	4cyX1ZNI+0nppcjvcIke9Ihwq5hyZPlx52uL9j0JFrqi9QNkn8PaJQxXFp51ds3Z9Rx29is6RFq
	lQ3U/w43DcElP2ZYJei8L7ug3hDYJ7Z0MaWu0a1SPI4Q0r7rTMvFOrLBI0vKia0uOUkPPiVhoux
	px2t2/NtzurlRYhafnDxI73CWfMrkilpU7Sx9gEs9EZxMKUEn13e+agDgNqop4riDvP6Opt47eD
	63iXS/snTIAbVB8o4OuLjF1Xhz/qqGr+nsQqQXSMzoO26WJcINGQh6xetz+Gk+Gvcc4CgdOH8Qu
	8xHDeQWtkXgE6Athg7vx+S7V0bGhKKIWYje38mu7MQFltmG9kNpr+Y0/jeCADaGi/tuS6gcpZV1
	/2ZgHkVSuzL5CKcSrKdP7mSVwZob5uKUY7CwZGsoEdjMShKw2L7Je6YbfywRXr501oI4j123hRk
	NLcDNl/wqLJ7e5bkFnjQQz1E96jYLp8VNA2jhyDx7pVcTvQllyaJXxxElOETeu/xxhiJlH0aEfk
	8leECvoI6QFzPMLn2m46AeVrkx9wyBLrYH1o3e4hwUtiIUFm8tYeJq+SBA7uPJ7TKzuljTo75Sq
	lG+LPYMF4DMChC34oGcywL7F67t2+n40kAUTe3bX3u7YoeQM=
X-Received: by 2002:a05:620a:2786:b0:93e:5677:317b with SMTP id af79cd13be357-949b35e9b3fmr1046746285a.25.1795266033942;
        Sat, 21 Nov 2026 05:00:33 -0800 (PST)
Received: from localhost ([204.244.107.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb427388sm408593585a.42.2026.11.21.05.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:00:33 -0800 (PST)
Date: Sat, 21 Nov 2026 08:00:32 -0500
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, khendry@reliablecontrols.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: clock: r9a06g032-sysctrl: Document
 reset cells
Message-ID: <awGV8BU_AfaXQyBv@maple.netwinder.org>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-1-feee2bb28bb4@reliablecontrols.com>
 <awARmkCuelD_fdX6@shikoro>
 <5d8530485716d129be2efa0518254e3322cecdb0.camel@pengutronix.de>
 <awAq7vxcY8CGjhNl@ninjato>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <awAq7vxcY8CGjhNl@ninjato>

On Fri, Nov 20, 2026 at 12:11:42PM +0100, Wolfram Sang wrote:
>
>> > > +#define R9A06G032_RST_TS		1
>> > > +#define R9A06G032_RST_MIIC		2
>> >
>> > I didn't find any listing of the resets in the RZN1 docs, so coming up
>> > with arbitrary numbers as we need them seems okay to me.
>>
>> Why aren't we starting at 0?
>
>I wondered as well but clocks are also starting from 1, so we could
>argue with consistency.

The clocks use value 0 to indicate "no parent clock", but only for the 
".source" element of struct r9a06g032. The encoding macros add and 
subtract 1 to the clock IDs, so it should in fact be possible to use 
0-based values even for the clocks. Too late to change now since the 
values are encoded into DTBs.

Thinking about it some more, perhaps instead of using 0 as the special 
case for "no parent", we could set .source to match .index. In other 
words a clock pointing to itself means "no parent". Worth changing? 

Ralph 
