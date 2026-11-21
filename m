Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267069;
	b=MQAGjwVW7qf76BAUjLA+TA+uwuYyUAVg4tUxkJbmsqM/LJrddPxquBuuIFuPBnJ1NDA3
	 u7l63M10nF5tx8WBCJepKEbZi5RdLMZgcd75L1uTO5tejsF/MAvhpbEratuVEHEe5FVv8
	 5gwhcikOhHceU6TZnW0JrWEOv4lpvtwmbzegord6Lq5l6W58N4fr7s45M837w9yU/fWZa
	 sxt69T+gBjogBpgptREedIFUGhDW3rQAcwJd3iUPg6kK33TEPns1Qe0nSMAh89qPU7lJn
	 8c6gwAkU0S9ZDIsCwBVd3RhLc+zhs4qbbKZWNQyyF5EDSqHtPSyroi2BcCGFyOma0HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Rgt/byHJz73fVZB9npadRPJRCi06Zbw9U3jYPp0MPbc=;
	b=l5qMsBuvd3rFPn1b2SBjww/cHMy+8tMpKvL5+EKnaiVEaPAwLozoyAmB0QQd+NN9R5QF
	 OkV4d6BlKNu/b3sP+P0QpawZnbGLBZjh/AI2GW6wLF6aaAEyxRs1BhSjt66qN154NVNVH
	 Pwd2c5zWlGdLdpXJNOzG976zWnsX8JNPEy0GfQoVG14vlTr7GjPiNTquhPTLy8hPtcpUq
	 eJc4xO9MmuducK3FgklKDwfkIV60kPFcKJRP6KUyfh+zwVLqHPphetAv9wCJDIYbsSH36
	 XIvU00iexXmDEa/Dj+6KtxS/VYfX4+n0FO1B/Um7yzfR+/JJaPNpD/I+wOHfphOZSpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z5292Tds;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF836606A331
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 13:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF836606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z5292Tds
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-55d6deecef6so19064481cf.2
        for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 05:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795267068; x=1795871868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rgt/byHJz73fVZB9npadRPJRCi06Zbw9U3jYPp0MPbc=;
        b=Z5292TdssQirJ7anrgy/Ycj0wO1diReVT+xjqWqnvVpWW2hxPlSx6CnnlxSpqetc1z
         +fddjESnGkA74Im6cQr17DvOW+VGIqruhO1KE5CwbJvPS54ALuMYtx4ha2VuyybUPXaT
         reAh9DT5rV9fy+W//lI4WB/2FhxslsHRt8LxjfYv7VRLIEVwboWlnhQtGGPVYMmD6ihL
         rqPFQZBMUV+gKP3QNnxGnSycOaF5ZFKfpghOCMHkZuVfrGH7y+3NT0bJUqPxS/JDH9QM
         4l+csvlxSOav/F6ZIn19ywP7A8Me7D4xiu4/Fmr/Wb6uhFimbUOp/Inli4T67eYP/2Tt
         /qYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267068; x=1795871868;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rgt/byHJz73fVZB9npadRPJRCi06Zbw9U3jYPp0MPbc=;
        b=aW4qbK++Oe9+66f6hdqg9Ohac08tyAydMgHAsgkDZTSVjvqJgI/jlYsamwpmsFYYrj
         gVs3ENaVVggKqHqi66kHB4c45ANv6YUc4EM5ehi1GTJFiCNh3Wsl5+JELHwdCRhUEdGr
         xTkypfMN+J7deOn0/vf+6Fz78jyDYnG4vOi8xM6uRvqf2u3V2FclbqxUiApsNje4vJlM
         5iZlwkYUYEtREzMvzlqnoiGo2nbmGx9VmVRPgp/Cfz9npOqy4TEQXoZ7XgZK6zJ4KFN9
         TKQ3RRsN7+QU8amXgc05XLwuWDaGyL0VvjxxqnvwlK7le/Kby/BAH+vOp1GknIDVcj8g
         5V6Q==
X-Forwarded-Encrypted: i=1; AL+hErFqnmEkLCiYZSZxVTZidjU0+3L0TQJofrt5Q9v/F0WKZcP4+wdzpbEU3FTYeiQ3dzKNVZdXo0A/YWw=@vger.kernel.org
X-Gm-Message-State: APuU4Z923DonHgmUS+2n/8LnhmfqcW3Um1vT2U8FStj4MW442iYKy8OP
	gvRLMgWV6d6oxZFNxymm2gsafFRqgPXI5/eG81FDtL9zZoW8sPy5CWyn2QcuZ3BgLPk=
X-Gm-Gg: AZFdTZextdo1qx+QIjTF8IZntE1kNtfA+YMZi9LYKbvSEpN8KJEdJerPctPkRT7qbUe
	5a46moYcTP8P5JAODli3/KA00Dm4DwfQOKMB4G07trZcgb1Nb8T7aKTbs5MLQ88HNCiMQU42AUo
	ZmyfTI1B81AFaf0yEMZcZshjv1aGBcPoNSiqDPIdkT5zdhJMm+IB+SAcVn91YZpywA2x/Q595bn
	VhBOz4CXmMWuaQ+OU1pJw1yBr7YjgFptPpCYgmPwyXBMVUMpzQ0DJdYklm27K0Dydq8WZL4XLQN
	G86GOAG8wrvlAJyWJjTCi0W8qxxFy+++zizE1G9FDIJ0l0dKgWfZAvWqrmEvQoZIa7lhfVwZ+st
	TnJmDydrwXQGofAWDqcT1OzwMQAilJydUlhDwaelC3Ejdg5zOu33nO+1gEEankZBXRS6teALbIZ
	bpuaw1R7uF9yT2lJE088TLl5aIHwJ6YFlIBMsckviw04YE6rOaa3VZi169P3HPw2rgAfFIQnBBE
	RcbThjpGrr+01qt+BqyfSXtuc7HCdJs84Wq80V4FNREReVPIEkSA5TGnx0AakBr46mMN7r25FVl
	iIfZehhcsGG3N05wIjw75vWBtpF3SV80zKwVURcaykpS6fvQdBvecQg5LNOK1ODqcpue5vsKUXf
	tDhTr1a6Dyl1k2MnnHPLZ4AGuY1R8OXYJJYcQ29BOKtJ3Y5l3qbHrECHXNNgqV4uzIzIn/g==
X-Received: by 2002:ac8:5f85:0:b0:55d:2dd1:48ba with SMTP id d75a77b69052e-55d76aa2f7cmr111131171cf.60.1795267067663;
        Sat, 21 Nov 2026 05:17:47 -0800 (PST)
Received: from localhost ([204.244.107.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b1e58sm53873266d6.12.2026.11.21.05.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:17:47 -0800 (PST)
Date: Sat, 21 Nov 2026 08:17:46 -0500
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: khendry@reliablecontrols.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
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
Subject: Re: [PATCH 2/6] clk: renesas: r9a06g032: Add reset controller
Message-ID: <awGZ-nCCbCNEuyr7@maple.netwinder.org>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-2-feee2bb28bb4@reliablecontrols.com>
 <awATU_lyjPBxThwq@shikoro>
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
In-Reply-To: <awATU_lyjPBxThwq@shikoro>

On Fri, Nov 20, 2026 at 10:30:59AM +0100, Wolfram Sang wrote:
>> +static int r9a06g032_reset(struct reset_controller_dev *rcdev,
>> +			  unsigned long id)
>> +{
>> +	r9a06g032_reset_set(rcdev, "reset", true, id);
>> +	udelay(5);
>
>For future reference, please add a comment pointing to chapter in the
>docs where it is saying 5us is needed.

The reset duration could vary for each reset ID, since they refer to 
different hardware. There's probably no "optimum" value here.

Ralph
